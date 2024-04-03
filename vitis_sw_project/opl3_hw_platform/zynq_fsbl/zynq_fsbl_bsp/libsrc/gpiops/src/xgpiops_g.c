#include "xgpiops.h"

XGpioPs_Config XGpioPs_ConfigTable[] __attribute__ ((section (".drvcfg_sec"))) = {

	{
		"xlnx,zynq-gpio-1.0", /* compatible */
		0xe000a000, /* reg */
		0x4014, /* interrupts */
		0xf8f01000 /* interrupt-parent */
	},
	 {
		 NULL
	}
};