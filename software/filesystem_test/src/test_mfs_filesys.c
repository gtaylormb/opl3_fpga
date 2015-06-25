/******************************************************************************
*
* Copyright (C) 2002 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* XILINX CONSORTIUM BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "xilmfs.h"

int main(int argc, char *argv[]) {
  char buf[512];
  char *buf2;
  int tmp;
  int dro_file_handle;
  int bytes_read = 0;

  printf("Start\n");

  mfs_init_genimage(2660000, (char *) 0x10000000, MFSINIT_IMAGE);
  tmp = mfs_ls();
  dro_file_handle = mfs_file_open("doom_000.dro", MFS_MODE_READ);
  tmp = mfs_file_read(dro_file_handle, buf, 512);

  printf("First 8 characters of doom_000.dro:");
  for (int i = 0; i < 8; i++) {
	  printf("%c", buf[i]);
	  fflush(stdout);
	  usleep(1000000);
  }
  printf("\n");
  fflush(stdout);

  buf2 = (char *) 0x40000000;
  for (int i = 0; i < 8; i++) {
	  printf("%x", buf2[i]);
	  fflush(stdout);
	  usleep(1000000);
  }



  return 0;
}



/* testing testing */
