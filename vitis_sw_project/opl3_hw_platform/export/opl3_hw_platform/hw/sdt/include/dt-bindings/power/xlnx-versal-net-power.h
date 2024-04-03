/* SPDX-License-Identifier: GPL-2.0 */
/*
 * Copyright (C) 2022-2022 Xilinx, Inc.
 * Copyright (C) 2022 Advanced Micro Devices, Inc. All Rights Reserved.
 */

#ifndef _DT_BINDINGS_VERSAL_NET_POWER_H
#define _DT_BINDINGS_VERSAL_NET_POWER_H

#include "xlnx-versal-power.h"

#define PM_DEV_USB_1				(0x182240D7U)
#define PM_DEV_FPD_SWDT_0			(0x182240DBU)
#define PM_DEV_FPD_SWDT_1			(0x182240DCU)
#define PM_DEV_FPD_SWDT_2			(0x182240DDU)
#define PM_DEV_FPD_SWDT_3			(0x182240DEU)

/* Remove Versal specific node IDs */
#undef PM_DEV_RPU0_0
#undef PM_DEV_RPU0_1
#undef PM_DEV_OCM_0
#undef PM_DEV_OCM_1
#undef PM_DEV_OCM_2
#undef PM_DEV_OCM_3
#undef PM_DEV_TCM_0_A
#undef PM_DEV_TCM_1_A
#undef PM_DEV_TCM_0_B
#undef PM_DEV_TCM_1_B
#undef PM_DEV_SWDT_FPD
#undef PM_DEV_AI

#endif
