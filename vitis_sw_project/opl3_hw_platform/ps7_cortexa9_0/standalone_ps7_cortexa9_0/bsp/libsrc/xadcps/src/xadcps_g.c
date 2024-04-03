#include "xadcps.h"

XAdcPs_Config XAdcPs_ConfigTable[] __attribute__ ((section (".drvcfg_sec"))) = {

	{
		"xlnx,zynq-xadc-1.00.a", /* compatible */
		0xf8007100 /* reg */
	},
	 {
		 NULL
	}
};