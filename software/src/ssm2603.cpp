#include "ssm2603.h"
#include "xparameters.h"
#include "timer_ps.h"

int ssm2603_init() {
	int Status;
	XIicPs_Config *Config;
    XIicPs Iic;    

	Config = XIicPs_LookupConfig(XPAR_I2C0_BASEADDR);
	if (NULL == Config) {
		return XST_FAILURE;
	}

	Status = XIicPs_CfgInitialize(&Iic, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Status = XIicPs_SelfTest(&Iic);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Status = XIicPs_SetSClk(&Iic, IIC_SCLK_RATE);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Write to the SSM2603 audio codec registers to configure the device. Refer to the
	 * SSM2603 Audio Codec data sheet for information on what these writes do.
	 */

//	Status = ssm2603_reg_set(&Iic, 15, 0b000000000); //Perform Reset
	TimerDelay(75000);
	Status |= ssm2603_reg_set(&Iic, 6, 0b000110000); //Power up
	Status |= ssm2603_reg_set(&Iic, 0, 0b000010111);
	Status |= ssm2603_reg_set(&Iic, 1, 0b000010111);
	Status |= ssm2603_reg_set(&Iic, 2, 0b001111001);
	Status |= ssm2603_reg_set(&Iic, 3, 0b001111001);
	Status |= ssm2603_reg_set(&Iic, 4, 0b000010000);
	Status |= ssm2603_reg_set(&Iic, 5, 0b000000000);
	Status |= ssm2603_reg_set(&Iic, 7, 0b000001010);
	Status |= ssm2603_reg_set(&Iic, 8, 0b000000000); //Changed so no CLKDIV2
	TimerDelay(75000);
	Status |= ssm2603_reg_set(&Iic, 9, 0b000000001);
	Status |= ssm2603_reg_set(&Iic, 6, 0b000100000);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

int ssm2603_reg_set(XIicPs *IIcPtr, u8 regAddr, u16 regData) {
	int Status;
	u8 SendBuffer[2];

	SendBuffer[0] = regAddr << 1;
	SendBuffer[0] = SendBuffer[0] | ((regData >> 8) & 0b1);
	SendBuffer[1] = regData & 0xFF;

	Status = XIicPs_MasterSendPolled(IIcPtr, SendBuffer, 2, IIC_SLAVE_ADDR);
	if (Status != XST_SUCCESS) {
		xil_printf("IIC send failed\n\r");
		return XST_FAILURE;
	}
	/*
	 * Wait until bus is idle to start another transfer.
	 */
	while (XIicPs_BusIsBusy(IIcPtr)) {
		/* NOP */
	}
	return XST_SUCCESS;

}
