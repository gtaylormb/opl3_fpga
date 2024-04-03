#include "xsdps.h"

XSdPs_Config XSdPs_ConfigTable[] __attribute__ ((section (".drvcfg_sec"))) = {

	{
		"arasan,sdhci-8.9a", /* compatible */
		0xe0100000, /* reg */
		0x2faf080, /* xlnx,sdio-clk-freq-hz */
		0x1, /* xlnx,has-cd */
		0x1, /* xlnx,has-wp */
		0x0, /* xlnx,bus-width */
		0x0, /* xlnx,mio-bank */
		0x0, /* xlnx,has-emio */
		0x0, /* xlnx,slot-type */
		0x0, /* xlnx,is-cache-coherent */
		0x15, /* clocks */
		0x0, /* xlnx,clk-50-sdr-itap-dly */
		0x0, /* xlnx,clk-50-sdr-otap-dly */
		0x0, /* xlnx,clk-50-ddr-itap-dly */
		0x0, /* xlnx,clk-50-ddr-otap-dly */
		0x0, /* xlnx,clk-100-sdr-otap-dly */
		0x0 /* xlnx,clk-200-sdr-otap-dly */
	},
	 {
		 NULL
	}
};