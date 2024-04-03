#include "xcoresightps_dcc.h"

XCoresightps_dcc_Config XCoresightps_dcc_ConfigTable[] __attribute__ ((section (".drvcfg_sec"))) = {

	{
		"xlnx,ps7-coresight-comp-1.00.a", /* compatible */
		0xf8800000 /* reg */
	},
	 {
		 NULL
	}
};