#include "xscutimer.h"

XScuTimer_Config XScuTimer_ConfigTable[] __attribute__ ((section (".drvcfg_sec"))) = {

	{
		"arm,cortex-a9-twd-timer", /* compatible */
		0xf8f00600, /* reg */
		0x13100d, /* interrupts */
		0xf8f01000 /* interrupt-parent */
	},
	 {
		 NULL
	}
};