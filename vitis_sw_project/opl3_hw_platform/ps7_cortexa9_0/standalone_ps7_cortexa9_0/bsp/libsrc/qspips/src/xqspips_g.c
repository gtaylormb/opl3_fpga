#include "xqspips.h"

XQspiPs_Config XQspiPs_ConfigTable[] __attribute__ ((section (".drvcfg_sec"))) = {

	{
		"xlnx,zynq-qspi-1.0", /* compatible */
		0xe000d000, /* reg */
		0xbebc200, /* xlnx,clock-freq */
		0x0, /* xlnx,connection-mode */
		0x4013, /* interrupts */
		0xf8f01000 /* interrupt-parent */
	},
	 {
		 NULL
	}
};