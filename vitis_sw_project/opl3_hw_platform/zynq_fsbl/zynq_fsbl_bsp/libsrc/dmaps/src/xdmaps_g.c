#include "xdmaps.h"

XDmaPs_Config XDmaPs_ConfigTable[] __attribute__ ((section (".drvcfg_sec"))) = {

	{
		"arm,pl330", /* compatible */
		0xf8003000, /* reg */
		{0x400d,  0x400e,  0x400f,  0x4010,  0x4011,  0x4028,  0x4029,  0x402a,  0x402b}, /* interrupts */
		0xf8f01000 /* interrupt-parent */
	},
	 {
		 NULL
	}
};