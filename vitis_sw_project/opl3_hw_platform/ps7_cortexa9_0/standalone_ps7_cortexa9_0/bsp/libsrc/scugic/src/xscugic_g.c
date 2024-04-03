#include "xscugic.h"

XScuGic_Config XScuGic_ConfigTable[] __attribute__ ((section (".drvcfg_sec"))) = {

	{
		"arm,cortex-a9-gic", /* compatible */
		0xf8f01000,
		0xf8f00100, /* reg */
		{{0U}} /* Handler-table */
	},
	 {
		 NULL
	}
};