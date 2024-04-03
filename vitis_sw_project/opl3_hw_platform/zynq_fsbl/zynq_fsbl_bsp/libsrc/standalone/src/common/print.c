/* print.c -- print a string on the output device.
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
 *
 *****************************************************************************/
/***************************** Include Files *********************************/

#include "xil_printf.h"

/*****************************************************************************/
/**
* print -- do a raw print of a string
*
******************************************************************************/
void print(const char8 *ptr)
{
#if defined (__aarch64__) && (HYP_GUEST == 1) && (EL1_NONSECURE == 1) && defined (XEN_USE_PV_CONSOLE)
	XPVXenConsole_Write(ptr);
#else
#if defined(STDOUT_BASEADDRESS) || defined(SDT)
  while (*ptr != (char8)0) {
    outbyte (*ptr);
	ptr++;
  }
#else
(void)ptr;
#endif
#endif
}
