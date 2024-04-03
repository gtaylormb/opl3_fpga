#include "xdevcfg.h"

XDcfg_Config XDcfg_ConfigTable[] __attribute__ ((section (".drvcfg_sec"))) = {

	{
		"xlnx,zynq-devcfg-1.0", /* compatible */
		0xf8007000, /* reg */
		0x4008, /* interrupts */
		0xf8f01000 /* interrupt-parent */
	},
	 {
		 NULL
	}
};