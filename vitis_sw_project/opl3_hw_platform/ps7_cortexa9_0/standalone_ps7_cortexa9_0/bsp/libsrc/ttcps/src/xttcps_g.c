#include "xttcps.h"

XTtcPs_Config XTtcPs_ConfigTable[] __attribute__ ((section (".drvcfg_sec"))) = {

	{
		"cdns,ttc", /* compatible */
		0xf8001000, /* reg */
		0x6750918, /* xlnx,clock-freq */
		{0x400a,  0x400b,  0x400c}, /* interrupts */
		0xf8f01000 /* interrupt-parent */
	},
	 {
		 NULL
	}
};