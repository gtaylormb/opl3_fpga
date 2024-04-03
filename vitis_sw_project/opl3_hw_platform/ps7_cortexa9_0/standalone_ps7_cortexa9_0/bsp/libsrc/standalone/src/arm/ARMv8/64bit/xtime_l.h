/******************************************************************************
* Copyright (c) 2014 - 2022 Xilinx, Inc.  All rights reserved.
* Copyright (C) 2022 - 2023 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/

/*****************************************************************************/
/**
* @file xtime_l.h
*
* @addtogroup a53_64_time_apis Cortex A53 64bit Mode Time Functions
* xtime_l.h provides access to the 64-bit physical timer counter.
*
* @{
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver   Who    Date     Changes
* ----- ------ -------- ---------------------------------------------------
* 5.00 	pkp	   05/29/14 First release
* 6.6   srm    10/23/17 Updated the macros to support user configurable sleep
*		        implementation
* 7.5   mus    04/30/21  Moved pragma message from xtime_l.h to xtime_l.c, to avoid
*                        displaying same warnings multiple times. It fixes CR#1090562.
* 8.0   mus    07/06/21  Added support for VERSAL NET
* 9.0   ml     03/03/23  Added description to fix doxygen warnings.
* </pre>
*
*
******************************************************************************/

#ifndef XTIME_H /**< prevent circular inclusions */
#define XTIME_H /**< by using protection macros */

#ifdef __cplusplus
extern "C" {
#endif

/**
 *@cond nocomments
 */

/***************************** Include Files *********************************/

#include "xil_types.h"
#include "xparameters.h"

/***************** Macros (Inline Functions) Definitions *********************/

/**************************** Type Definitions *******************************/

typedef u64 XTime;

/************************** Constant Definitions *****************************/
#if defined (VERSAL_NET)
#define XIOU_SCNTRS_BASEADDR                            0xEC920000U //0xFD6F0000U
#define XIOU_SCNTRS_FREQ                                XPAR_CPU_CORTEXA78_0_TIMESTAMP_CLK_FREQ
#define COUNTS_PER_SECOND     							XIOU_SCNTRS_FREQ
#elif defined (versal)
#if defined (SLEEP_TIMER_BASEADDR)
#define COUNTS_PER_SECOND     SLEEP_TIMER_FREQUENCY
#else
#define COUNTS_PER_SECOND     XPAR_CPU_CORTEXA72_0_TIMESTAMP_CLK_FREQ
#endif
#define XIOU_SCNTRS_BASEADDR                            0xFF140000U
#define XIOU_SCNTRS_FREQ                                XPAR_CPU_CORTEXA72_0_TIMESTAMP_CLK_FREQ
#else
#if defined (SLEEP_TIMER_BASEADDR)
#define COUNTS_PER_SECOND     SLEEP_TIMER_FREQUENCY
#else
#define COUNTS_PER_SECOND     XPAR_CPU_CORTEXA53_0_TIMESTAMP_CLK_FREQ
#endif
#define XIOU_SCNTRS_BASEADDR      			0xFF260000U
#define XIOU_SCNTRS_FREQ                    XPAR_CPU_CORTEXA53_0_TIMESTAMP_CLK_FREQ
#endif
#define XIOU_SCNTRS_CNT_CNTRL_REG_OFFSET    0x00000000U
#define XIOU_SCNTRS_FREQ_REG_OFFSET             0x00000020U
#define XIOU_SCNTRS_CNT_CNTRL_REG_EN    	0x00000001U
#define XIOU_SCNTRS_CNT_CNTRL_REG_EN_MASK   0x00000001U
/************************** Variable Definitions *****************************/

/************************** Function Prototypes ******************************/

void XTime_StartTimer(void);

/**
 *@endcond
 */

void XTime_SetTime(XTime Xtime_Global);
void XTime_GetTime(XTime *Xtime_Global);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* XTIME_H */
/**
* @} End of "addtogroup a53_64_time_apis".
*/
