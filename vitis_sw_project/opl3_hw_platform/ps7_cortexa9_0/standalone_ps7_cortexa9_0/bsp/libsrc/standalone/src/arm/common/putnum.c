/* putnum.c -- put a hex number on the output device.
 *
 * Copyright (c) 1995 Cygnus Support
 *
 * The authors hereby grant permission to use, copy, modify, distribute,
 * and license this software and its documentation for any purpose, provided
 * that existing copyright notices are retained in all copies and that this
 * notice is included verbatim in any distributions. No written agreement,
 * license, or royalty fee is required for any of the authorized uses.
 * Modifications to this software may be copyrighted by their authors
 * and need not follow the licensing terms described here, provided that
 * the new terms are clearly indicated on the first page of each file where
 * they apply.
 *****************************************************************************/

/***************************** Include Files *********************************/
#include "xil_types.h"
#include "xil_printf.h"

/************************** Function Prototypes ******************************/
void putnum(u32 num);

/*****************************************************************************/
/**
* putnum -- print a 32 bit number in hex
*
******************************************************************************/
void putnum(u32 num)
{
  char8  buf[9];
  s32  cnt, val=7;
  s32 i;
  char8  *ptr;
  u32  digit;
  for(i = 0; i<9; i++) {
	buf[i] = '0';
  }

  ptr = buf;
  for (cnt = 0 ; cnt <= 7 ; cnt++) {
    digit = (num >> ((u32)val * 4U)) & 0x0000000fU;

    if (digit <= 9U) {
		digit += (u32)'0';
		*ptr = ((char8) digit);
		ptr += 1;
	} else {
		digit += ((u32)'a' - (u32)10);
		*ptr = ((char8)digit);
		ptr += 1;
	}
	val--;
  }

  print (buf);
}
