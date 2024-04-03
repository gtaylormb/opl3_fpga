/******************************************************************************
* Copyright (c) 2023 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/
#ifndef BSPCONFIG_H
#define BSPCONFIG_H

#include "xmem_config.h"
#define XPAR_XILTIMER_ENABLED
#include "xparameters_ps.h"

#if defined (__aarch64__)
#define EL3  0
#define EL1_NONSECURE  0
#define HYP_GUEST  0
#endif

/* #undef versal */
/* #undef PSU_PMU */
/* #undef PLATFORM_ZYNQMP */
#define PLATFORM_ZYNQ  
/* #undef VERSAL_PLM */
/* #undef VERSALNET_PLM */
/* #undef PLATFORM_MB */
#define XPAR_CPU_ID 0
#define XIL_INTERRUPT  
/* #undef XPAR_STDIN_IS_UARTLITE */
/* #undef XPAR_STDIN_IS_UARTNS550 */
#define XPAR_STDIN_IS_UARTPS  
/* #undef XPAR_STDIN_IS_UARTPSV */
/* #undef XPAR_STDIN_IS_CORESIGHTPS_DCC */
#define STDIN_BASEADDRESS 0xe0001000
#define STDOUT_BASEADDRESS 0xe0001000

#endif /* BSPCONFIG_H */
