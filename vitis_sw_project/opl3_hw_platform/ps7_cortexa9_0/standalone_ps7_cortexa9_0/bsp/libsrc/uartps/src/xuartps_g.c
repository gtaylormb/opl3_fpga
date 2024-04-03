#include "xuartps.h"

XUartPs_Config XUartPs_ConfigTable[] __attribute__ ((section (".drvcfg_sec"))) = {

	{
		"xlnx,xuartps", /* compatible */
		0xe0001000, /* reg */
		0x5f5e100, /* xlnx,clock-freq */
		0x1, /* cts-override */
		0x18, /* clocks */
		0x4032, /* interrupts */
		0xf8f01000 /* interrupt-parent */
	},
	 {
		 NULL
	}
};