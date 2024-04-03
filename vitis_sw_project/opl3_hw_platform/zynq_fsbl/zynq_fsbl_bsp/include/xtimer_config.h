/******************************************************************************
* Copyright (c) 2023 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/
#ifndef _XTIMER_CONFIG_H
#define _XTIMER_CONFIG_H



#define XSLEEPTIMER_BASEADDRESS 0xf8001000
/* #undef XSLEEPTIMER_IS_AXITIMER */
#define XSLEEPTIMER_IS_TTCPS     
/* #undef XSLEEPTIMER_IS_SCUTIMER */
#define XSLEEPTIMER_FREQ	     0x6750918
#define COUNTS_PER_SECOND       XSLEEPTIMER_FREQ
/* #undef XTIMER_IS_DEFAULT_TIMER */
/* #undef XTIMER_DEFAULT_TIMER_IS_MB */

#define XTICKTIMER_BASEADDRESS 0xf8f00600
/* #undef XTICKTIMER_IS_AXITIMER */
/* #undef XTICKTIMER_IS_TTCPS */
#define XTICKTIMER_IS_SCUTIMER  
/* #undef XTIMER_NO_TICK_TIMER */

#endif /* XTIMER_CONFIG_H */
