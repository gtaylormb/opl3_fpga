/*
 * main.cpp
 *
 *  Created on: Aug 5, 2015
 *      Author: greg
 */
#include <iostream>
#include <stdio.h>
#include <time.h>
#include <unistd.h>
#include <sys/time.h>
#include <sys/resource.h>
#include "xilmfs.h"
#include "xil_io.h"
#include "xparameters.h"
#include "opl3_fpga.h"
#include "audio_demo.h"
#include "timer_ps.h"
#include "imfplay.h"

#define TIMER_DEVICE_ID 	XPAR_SCUTIMER_DEVICE_ID
#define CMD_BUF_LEN	256

using namespace std;

void parseCmd(char *cmd) {
	char *token;

	token = strtok(cmd, " ");

	if (strncmp(token, "help", 4) == 0) {
		cout << "ls - list files" << endl;
		cout << "play FILENAME - play a file" << endl;
	}
	else if (strncmp(token, "ls", 2) == 0) {
		mfs_ls();
	}
	else if (strncmp(token, "play", 4) == 0) {
		token = strtok(NULL, " ");
		if (mfs_exists_file(token) == 0) {
			cout << token << " not found." << endl;
		}
		else {
			imfplay(token);
			cout << endl;
		}
	}
}

int main(int argc, char **argv) {
	char cmd[CMD_BUF_LEN];
	char singleChar;

	AudioInitialize();

	mfs_init_genimage(2660000, (char *) 0x10000000, MFSINIT_IMAGE);

	cout << "Welcome to the OPL3 FPGA" << endl << endl;
	cout << "Type 'help' for a list of commands" << endl;

	while (1) {
		memset(cmd, 0, CMD_BUF_LEN);
		cout << ">" << flush;

		for (int i = 0; i < CMD_BUF_LEN;) {
			singleChar = inbyte();
			outbyte(singleChar);

			if (singleChar == 0x8 || singleChar == 0x7F) {// backspace
				if (i > 0) {
					--i;
				}
				continue;
			}

			if (singleChar == '\r') {
				cout << endl;
				parseCmd(cmd);
				break;
			}
			else {
				cmd[i] = singleChar;
			}
			++i;
		}
	}

	return 0;
}



