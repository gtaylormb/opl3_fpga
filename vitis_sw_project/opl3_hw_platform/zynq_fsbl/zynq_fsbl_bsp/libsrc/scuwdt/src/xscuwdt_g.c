#include "xscuwdt.h"

XScuWdt_Config XScuWdt_ConfigTable[] __attribute__ ((section (".drvcfg_sec"))) = {

	{
		"xlnx,ps7-scuwdt-1.00.a", /* compatible */
		0xf8f00620, /* reg */
		0x10400e, /* interrupts */
		0xf8f01000 /* interrupt-parent */
	},
	 {
		 NULL
	}
};