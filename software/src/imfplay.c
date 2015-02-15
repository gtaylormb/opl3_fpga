/*
imfplay
Copyright (c) 2014 Tom Grus

This software is provided 'as-is', without any express or implied warranty.
In no event will the authors be held liable for any damages arising from the
use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it freely,
subject to the following restrictions:

    1. The origin of this software must not be misrepresented; you must not
       claim that you wrote the original software. If you use this software
       in a product, an acknowledgment in the product documentation would be
       appreciated but is not required.

    2. Altered source versions must be plainly marked as such, and must not
       be misrepresented as being the original software.

    3. This notice may not be removed or altered from any source distribution.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <conio.h>
#include <dos.h>

#include "global.h"
#include "screen.h"


#define CMD_EOF	 				-1
#define CMD_NULL				0		//no command
#define CMD_FULL				1		//cmd + delay
#define CMD_DELAY_ONLY	2		//delay

void interrupt (*old_time_handler)(void);
long freq_div;
long last_slow_tick;
const int opl2_base = 0x388;
long time_ctr;
unsigned char shadow_opl[256];
unsigned char shadow_opl_written[256];
unsigned char mutemask[9];
unsigned short dro1_high;
unsigned char dro2_codetable[256];
unsigned char dro2_delaycodes[2];

typedef enum
{
	FT_IMF0,
	FT_IMF1,
	FT_DRO1,
	FT_DRO2
} filetype;

typedef struct
{
	unsigned short reg;
	unsigned char data;
	unsigned short delay;
} cmd;

typedef struct
{
	FILE *stream;
	filetype type;
} fileinfo;

void interrupt time_handler(void)
{
	long slow_tick = time_ctr * 1193182 / (freq_div * 65536);
	time_ctr++;
	if (slow_tick != last_slow_tick)
	{
		//compensate for faster clock rate
		last_slow_tick = slow_tick;
		old_time_handler();
	}
	else
		outportb(0x20, 0x20);	//PIC, EOI
}

void opl2_out(unsigned char reg, unsigned char data)
{
	outportb(opl2_base, reg);
	outportb(opl2_base + 1, data);
	shadow_opl[reg] = data;
}

void opl2_clear(void)
{
	int i;
	for (i = 0; i < 256; i++)
		opl2_out(i, 0);
}

void mute_toggle(int channel)
{
	char buffer[2];

	mutemask[channel] = !mutemask[channel];

	if (mutemask[channel])
		opl2_out(0xB0 + channel, shadow_opl[0xB0 + channel] & 0xDF);

	print_mute(channel, mutemask[channel]);
}

int is_muted(int reg)
{
	if ((reg >= 0xA0 && reg <= 0xA8)
		|| (reg >= 0xB0 && reg <= 0xB8)
		|| (reg >= 0xC0 && reg <= 0xC8))
		return mutemask[reg & 0x0F];

	if ((reg >= 0x20 && reg <= 0x35)
		|| (reg >= 0x40 && reg <= 0x55)
		|| (reg >= 0x60 && reg <= 0x75)
		|| (reg >= 0x80 && reg <= 0x95)
		|| (reg >= 0xE0 && reg <= 0xF5))
		switch(reg % 32)
		{
			case 0: case 3: return mutemask[0];
			case 1: case 4: return mutemask[1];
			case 2: case 5: return mutemask[2];
			case 8: case 11: return mutemask[3];
			case 9: case 12: return mutemask[4];
			case 10: case 13: return mutemask[5];
			case 16: case 19: return mutemask[6];
			case 17: case 20: return mutemask[7];
			case 18: case 21: return mutemask[8];
		}
	return 0;
}

int read_next_cmd(fileinfo *fi, cmd *c)
{
	unsigned char rb[4];
	int ri;

	switch(fi->type)
	{
		case FT_IMF0:
		case FT_IMF1:
			if (fread(rb, sizeof(char), 4, fi->stream) != 4)
				return CMD_EOF;

			c->reg = rb[0];
			c->data = rb[1];
			c->delay = rb[2] | (rb[3] << 8);
			return CMD_FULL;

		case FT_DRO1:
			c->reg = c->data = c->delay = 0;
			ri = fgetc(fi->stream);
			if (ri == EOF)
				return CMD_EOF;
			switch(ri)
			{
				case 0:	//1B delay
					ri = fgetc(fi->stream);
					if (ri == EOF)
						return CMD_EOF;
					c->delay = ri + 1;
					return CMD_DELAY_ONLY;

				case 1:	//2B delay
					ri = fgetc(fi->stream);
					if (ri == EOF)
						return CMD_EOF;
					c->delay = ri;
					ri = fgetc(fi->stream);
					if (ri == EOF)
						return CMD_EOF;
					c->delay |= ri << 8;
					c->delay++;
					return CMD_DELAY_ONLY;

				case 2:	//switch to low chip
					dro1_high = 0;
					break;

				case 3:	//switch to high chip
					dro1_high = 0x0100;
					break;

				case 4:	//escape
					return CMD_NULL;

				default:
					c->reg = ri | dro1_high;
					ri = fgetc(fi->stream);
					if (ri == EOF)
						return CMD_EOF;
					c->data = ri;
					return CMD_FULL;
			}

		case FT_DRO2:
			c->reg = c->data = c->delay = 0;
			ri = fgetc(fi->stream);
			if (ri == EOF)
				return CMD_EOF;
			if (ri == dro2_delaycodes[0])
			{
				ri = fgetc(fi->stream);
				if (ri == EOF)
					return CMD_EOF;
				c->delay = ri + 1;
				return CMD_DELAY_ONLY;
			}
			else if (ri == dro2_delaycodes[1])
			{
				ri = fgetc(fi->stream);
				if (ri == EOF)
					return CMD_EOF;
				c->delay = 256 * (ri + 1);
				return CMD_DELAY_ONLY;
			}
			else
			{
				c->reg = dro2_codetable[ri & 0x7F];
				c->reg |= (ri & 0x80) << 1;
				ri = fgetc(fi->stream);
				if (ri == EOF)
					return CMD_EOF;
				c->data = ri;
				return CMD_FULL;
			}
	}

	return 0;
}

int file_open(fileinfo *fi, char *fname)
{
	unsigned char rb[16];
	unsigned char drosig[] = "DBRAWOPL";

	fi->stream = fopen(fname, "rb");
	if (!fi->stream)
			return 0;

	if (fread(rb, sizeof(char), 2, fi->stream) != 2)
		return 0;

	if (rb[0] == 'D' && rb[1] == 'B')
	{
		//might be a DRO
		if ((fread(rb + 2, sizeof(char), 6, fi->stream) == 6)
			&& (memcmp(rb, drosig, 8) == 0))
		{
			//it is!
			fread(rb, sizeof(char), 4, fi->stream);
			if (rb[0] == 0 && rb[1] == 0 && rb[2] == 1 && rb[3] == 0)
			{
				//DRO 1.0
				//skip remaining header data
				if (fread(rb, sizeof(char), 12, fi->stream) != 12)
					return 0;
				//older DRO1 revision
				if (rb[9] != 0 || rb[10] != 0 || rb[11] != 0)
					fseek(fi->stream, 21L, SEEK_SET);

				fi->type = FT_DRO1;
				return 1;
			}
			else if (rb[0] == 2 && rb[1] == 0 && rb[2] == 0 && rb[3] == 0)
			{
				//DRO 2.0
				if (fread(rb, sizeof(char), 14, fi->stream) != 14)
					return 0;

				if (rb[9] != 0 || rb[10] != 0)
				{
					puts("unsupported DRO 2.0 flags!");
					return 0;
				}

				dro2_delaycodes[0] = rb[11];	//short delay code
				dro2_delaycodes[1] = rb[12];	//long delay code

				//read codetable
				if (fread(dro2_codetable, sizeof(char), rb[13], fi->stream) != rb[13])
					return 0;

				fi->type = FT_DRO2;
				return 1;
			}
			else
			{
				puts("unsupported DRO version!");
				return 0;
			}
		}
	}

	//not a DRO
	if (rb[0] == 0 && rb[1] == 0)
	{
		fi->type = FT_IMF0;
		fseek(fi->stream, 0L, SEEK_SET);
		return 1;
	}
	else
	{
		fi->type = FT_IMF1;
		fseek(fi->stream, 2L, SEEK_SET);
		return 1;
	}
}

void file_close(fileinfo *fi)
{
	fclose(fi->stream);
}

int main(int argc, char **argv)
{
	int i;
	unsigned long spd = 1193182;
	unsigned short len;
	fileinfo f;


	//open IMF
	if (argc > 1)
	{
		if (!file_open(&f, argv[1]))
			return EXIT_FAILURE;

		if (argc > 2)
			freq_div = atoi(argv[2]);

		if (!(freq_div > 0 && freq_div < 32768))
			if (f.type == FT_IMF0 || f.type == FT_IMF1)
				freq_div = 560;		//default for IMFs
			else
				freq_div = 1000;	//default for DRO
	}
	else
	{
		puts("usage: imfplay <filename> [playback rate]\n"
			"       playback rate is in Hz, typical values are 560, 700 and 280\n"
			"         for IMF files, the default rate is 560.\n"
			"         for DRO files, the default rate is 1000.\n"
			"       keys [1]..[9] mute / unmute channels, [esc] quits the program\n"
			"\n"
			"imfplay assumes AdLib (OPL2) mode only. If a DRO file contains OPL3"
			" data,\nactual OPL3 writes are silently ignored!");
		return EXIT_FAILURE;
	}


	screen_init();


	//print file type
	switch(f.type)
	{
		case FT_IMF0:
			puts_xy("IMF type 0 file", 0, 39, C_NORM);
			break;
		case FT_IMF1:
			puts_xy("IMF type 1 file", 0, 39, C_NORM);
			break;
		case FT_DRO1:
			puts_xy("DRO 1.0 file", 0, 39, C_NORM);
			break;
		case FT_DRO2:
			puts_xy("DRO 2.0 file", 0, 39, C_NORM);
			break;
	}


	//setup timer speed
	old_time_handler = getvect(0x08);

	spd /= freq_div;
	outportb(0x43, 0x36);
	outportb(0x40, spd % 0x100);	//lo-byte
	outportb(0x40, spd / 0x100);	//hi-byte

	setvect(0x08, time_handler);


	//clear OPL2
	opl2_clear();


	//play
	{
		int run = 1;
		int m = 0;
		cmd c;
		int res;
		long next_event = time_ctr;

		while (run)
		{
			while (time_ctr < next_event)
			{
				if (kbhit())
				{
					int c = getch();
					if (c >= '1' && c <= '9')
						mute_toggle(c - '1');
					else if (c == '\t')
						screen_set_mode(++m % 2);
					else if (c == 0x1B)
					{
						run = 0;
						break;
					}
				}
				print_rem_delay(next_event - time_ctr);
			}

			res = read_next_cmd(&f, &c);
			if (res == CMD_EOF)
				run = 0;

			if (run == 0)
				break;

			if (res == CMD_FULL && !is_muted(c.reg))
			{
				if (c.reg < 0x100)
				{
					opl2_out(c.reg, c.data);
					shadow_opl_written[c.reg] = 1;
					print_cmd(c.reg, c.data);
				}
			}

			print_delay(c.delay);
			next_event += c.delay;
		}
	}


	//close the file
	file_close(&f);


	//clear OPL2
	opl2_clear();


	//restore timer speed
	outportb(0x43, 0x36);
	outportb(0x40, 0xFF);	//lo-byte
	outportb(0x40, 0xFF);	//hi-byte

	setvect(0x08, old_time_handler);


	screen_restore();


	//exit
	return EXIT_SUCCESS;
}