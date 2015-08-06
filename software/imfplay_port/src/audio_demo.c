/************************************************************************/
/*																		*/
/*	audio_demo.c	--	ZYBO Audio demonstration 						*/
/*																		*/
/************************************************************************/
/*	Author: Sam Bobrowicz												*/
/*	Copyright 2014, Digilent Inc.										*/
/************************************************************************/
/*  Module Description: 												*/
/*																		*/
/*		This file contains code for running a demonstration of the		*/
/*		SSM2603 Audio codec's capabilities on the ZYBO.	This demo 		*/
/*		copies audio data to the axi_i2s_adi pcore using the processor. */
/*		It is also possible to use the PL330 DMA controller in the Zynq	*/
/*		PS to communicate with the axi_i2s_adi core, but that usage		*/
/*		is not covered in this demo.									*/
/*																		*/
/*		This module contains code from the Xilinx Demo titled			*/
/*		" xiicps_polled_master_example.c"								*/
/*																		*/
/************************************************************************/
/*  Revision History:													*/
/* 																		*/
/*		2/14/2014(SamB): Created										*/
/*																		*/
/************************************************************************/

/* ------------------------------------------------------------ */
/*				Include File Definitions						*/
/* ------------------------------------------------------------ */

#include "audio_demo.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "xparameters.h"
#include "xil_types.h"
#include "xil_io.h"
#include "xil_printf.h"
#include "timer_ps.h"
#include "xiicps.h"
#include "xuartps.h"

/* Redefine the XPAR constants */
#define IIC_DEVICE_ID		XPAR_XIICPS_0_DEVICE_ID
//#define I2S_ADDRESS 		XPAR_AXI_I2S_ADI_0_BASEADDR
#define TIMER_DEVICE_ID 	XPAR_SCUTIMER_DEVICE_ID

/* ------------------------------------------------------------ */
/*				Global Variables								*/
/* ------------------------------------------------------------ */

XIicPs Iic;		/* Instance of the IIC Device */

int recordingValid = 0;  /*Indicates that a valid recording exists*/

u32 recDataL[REC_SAMPLES]; /* Left audio data */
u32 recDataR[REC_SAMPLES]; /* Right audio data */

/* ------------------------------------------------------------ */
/*				Procedure Definitions							*/
/* ------------------------------------------------------------ */

/***	AudioInitialize(u16 timerID,  u16 iicID, u32 i2sAddr)
**
**	Parameters:
**		timerID - DEVICE_ID for the SCU timer
**		iicID 	- DEVICE_ID for the PS IIC controller connected to the SSM2603
**		i2sAddr - Physical Base address of the I2S controller
**
**	Return Value: int
**		XST_SUCCESS if successful
**
**	Errors:
**
**	Description:
**		Initializes the Audio demo. Must be called once and only once before calling
**		AudioRunDemo
**
*/
int AudioInitialize()
{
	int Status;
	XIicPs_Config *Config;
//	u32 i2sClkDiv;

	TimerInitialize(TIMER_DEVICE_ID);

	/*
	 * Initialize the IIC driver so that it's ready to use
	 * Look up the configuration in the config table,
	 * then initialize it.
	 */
	Config = XIicPs_LookupConfig(IIC_DEVICE_ID);
	if (NULL == Config) {
		return XST_FAILURE;
	}

	Status = XIicPs_CfgInitialize(&Iic, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Perform a self-test to ensure that the hardware was built correctly.
	 */
	Status = XIicPs_SelfTest(&Iic);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Set the IIC serial clock rate.
	 */
	Status = XIicPs_SetSClk(&Iic, IIC_SCLK_RATE);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	/*
	 * Write to the SSM2603 audio codec registers to configure the device. Refer to the
	 * SSM2603 Audio Codec data sheet for information on what these writes do.
	 */

//	Status = AudioRegSet(&Iic, 15, 0b000000000); //Perform Reset
	TimerDelay(75000);
	Status |= AudioRegSet(&Iic, 6, 0b000110000); //Power up
	Status |= AudioRegSet(&Iic, 0, 0b000010111);
	Status |= AudioRegSet(&Iic, 1, 0b000010111);
	Status |= AudioRegSet(&Iic, 2, 0b001110000);
	Status |= AudioRegSet(&Iic, 3, 0b001110000);
	Status |= AudioRegSet(&Iic, 4, 0b000010000);
	Status |= AudioRegSet(&Iic, 5, 0b000000000);
	Status |= AudioRegSet(&Iic, 7, 0b000000010); //Changed so Word length is 16
	Status |= AudioRegSet(&Iic, 8, 0b000000000); //Changed so no CLKDIV2
	TimerDelay(75000);
	Status |= AudioRegSet(&Iic, 9, 0b000000001);
	Status |= AudioRegSet(&Iic, 6, 0b000100000);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

//	i2sClkDiv = 1; //Set the BCLK to be MCLK / 4
//	i2sClkDiv = i2sClkDiv | (31 << 16); //Set the LRCLK's to be BCLK / 64

//	Xil_Out32(i2sAddr + I2S_CLK_CTRL_REG, i2sClkDiv); //Write clock div register

//	recordingValid = 0;

	return XST_SUCCESS;
}
/* ------------------------------------------------------------ */

/***	AudioPrintMenu()
**
**	Parameters:
**
**	Return Value:
**
**	Errors:
**
**	Description:
**		Prints the menu for the Audio Demo
**
*/
void AudioPrintMenu()
{
	xil_printf("\x1B[H"); //Set cursor to top left of terminal
	xil_printf("\x1B[2J"); //Clear terminal
	xil_printf("**************************************************\n\r");
	xil_printf("*         ZYBO Audio Codec User Demo             *\n\r");
	xil_printf("**************************************************\n\r");
	xil_printf("*         * Remove headphones from ears and turn *\n\r");
	xil_printf("* WARNING * down the volume of any external      *\n\r");
	xil_printf("*         * speakers connected to HPH OUT        *\n\r");
	xil_printf("**************************************************\n\r");
	xil_printf("\n\r");
	xil_printf("1 - Generate tone on HPH OUT\n\r");
	xil_printf("2 - Record from LINE IN\n\r");
	xil_printf("3 - Record from MIC IN\n\r");
	if (recordingValid)
		xil_printf("4 - Play recording on HPH OUT\n\r");
	xil_printf("q - Quit\n\r");
	xil_printf("\n\r");
	xil_printf("Enter a selection:");
}
/* ------------------------------------------------------------ */

/***	AudioRunDemo(u32 i2sAddr, u32 uartAddr, u32 swAddr, u32 btnAddr)
**
**	Parameters:
**		i2sAddr - Physical Base address of the I2S controller
**		uartAddr - Physical Base address of the PS UART controller
**		swAddr - Physical Base address of the AXI GPIO controller for the switches
**		btnAddr	 - Physical Base address of the AXI GPIO controller for the buttons
**
**	Return Value: int
**		XST_SUCCESS if successful
**
**	Errors:
**
**	Description:
**		Runs the Audio demo
**
*/
int AudioRunDemo(u32 i2sAddr, u32 uartAddr, u32 swAddr, u32 btnAddr)
{
	char userInput = 0;

	/* Flush UART FIFO */
	while (XUartPs_IsReceiveData(uartAddr))
	{
		XUartPs_ReadReg(uartAddr, XUARTPS_FIFO_OFFSET);
	}

	while (userInput != 'q')
	{
		AudioPrintMenu();

		/* Wait for data on UART */
		while (!XUartPs_IsReceiveData(uartAddr))
		{}

		/* Store the first character in the UART recieve FIFO and echo it */
		userInput = XUartPs_ReadReg(uartAddr, XUARTPS_FIFO_OFFSET);
		xil_printf("%c", userInput);

		switch (userInput)
		{
		case '1':
			AudioPlayTone(i2sAddr, uartAddr, swAddr, btnAddr);
			break;
		case '2':
			AudioRec(i2sAddr, 0);
			break;
		case '3':
			AudioRec(i2sAddr, 1);
			break;
		case '4':
			if (recordingValid)
				AudioPlayRec(i2sAddr);
			else
			{
				xil_printf("\n\rInvalid Selection");
				TimerDelay(500000);
			}
			break;
		case 'q':
			break;
		default :
			xil_printf("\n\rInvalid Selection");
			TimerDelay(500000);
		}
	}

	return XST_SUCCESS;
}
/* ------------------------------------------------------------ */

/***	AudioPlayTone(u32 i2sAddr, u32 uartAddr, u32 swAddr, u32 btnAddr)
**
**	Parameters:
**		i2sAddr - Physical Base address of the I2S controller
**		uartAddr - Physical Base address of the PS UART controller
**		swAddr - Physical Base address of the AXI GPIO controller for the switches
**		btnAddr	 - Physical Base address of the AXI GPIO controller for the buttons
**
**	Return Value: int
**		XST_SUCCESS if successful
**
**	Errors:
**
**	Description:
**		Runs the tone generator
**
*/
int AudioPlayTone(u32 i2sAddr, u32 uartAddr, u32 swAddr, u32 btnAddr)
{
	u32 userInput = 0;
	u32 btnState = 0;
	u32 swState = 0;
	int Index = 0;

	xil_printf("\x1B[H"); //Set cursor to top left of terminal
	xil_printf("\x1B[2J"); //Clear terminal
	xil_printf("\n\r");
	xil_printf("--Press BTN0 to play a 500 Hz tone on the enabled channels\n\r");
	xil_printf("  of the HPH OUT port.\n\r");
	xil_printf("--Set SW1 high to enable the Left channel of HPH Out\n\r");
	xil_printf("--Set SW0 high to enable the Right channel of HPH Out\n\r");
	xil_printf("--Enter 'q' at the terminal to quit\n\r");

	/*
	 * Reset TX FIFO and enable it
	 */
	Xil_Out32(i2sAddr + I2S_RESET_REG, 0b010); //Reset TX Fifo
	Xil_Out32(i2sAddr + I2S_CTRL_REG, 0b001); //Enable TX Fifo, disable mute

	/*
	 * Flush user input buffer
	 */
	while (XUartPs_IsReceiveData(uartAddr))
	{
		XUartPs_ReadReg(uartAddr, XUARTPS_FIFO_OFFSET);
	}

	while (userInput != 'q')
	{
		for (Index = 0; Index < 96; Index++) //96 corresponds to (Sample Rate / Tone Freq.) (48000 / 500)
		{
			btnState = Xil_In32(btnAddr);
			swState = Xil_In32(swAddr);
			if ((Index < 48) && (btnState & 0b1))
			{
				if (swState & 0b10) //Left channel
					I2SFifoWrite(i2sAddr, (1 << 31));
				else
					I2SFifoWrite(i2sAddr, 0);

				if (swState & 0b01) //Right channel
					I2SFifoWrite(i2sAddr, (1 << 31));
				else
					I2SFifoWrite(i2sAddr, 0);
			}
			else
			{
				I2SFifoWrite(i2sAddr, 0); //Left channel
				I2SFifoWrite(i2sAddr, 0); //Right channel
			}


		}
		if (XUartPs_IsReceiveData(uartAddr))
		{
			/* Store the first character in the UART recieve FIFO */
			userInput = XUartPs_ReadReg(uartAddr, XUARTPS_FIFO_OFFSET);
		}
	}

	Xil_Out32(i2sAddr + I2S_CTRL_REG, 0b00); //Disable TX Fifo

	return XST_SUCCESS;
}
/* ------------------------------------------------------------ */

/***	AudioRec(u32 i2sAddr, u8 useMic)
**
**	Parameters:
**		i2sAddr - Physical Base address of the I2S controller
**		useMic	- Source select for the Audio signal. 0 for LINE IN, 1 for MIC IN
**
**	Return Value: int
**		XST_SUCCESS if successful
**
**	Errors:
**
**	Description:
**		Records audio data to memory
**
*/
int AudioRec(u32 i2sAddr, u8 useMic)
{
	int Status = 0;
	int index = 0;

	if (useMic)
		Status = AudioRegSet(&Iic, 4, 0b000010100);
	else
		Status = AudioRegSet(&Iic, 4, 0b000010000);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	xil_printf("\n\r");
	xil_printf("\n\r");
	xil_printf("Recording...");

	/*
	 * Reset RX FIFO and enable it
	 */
	Xil_Out32(i2sAddr + I2S_RESET_REG, 0b100); //Reset RX Fifo
	Xil_Out32(i2sAddr + I2S_CTRL_REG, 0b010); //Enable RX Fifo, enable mute

	for (index = 0; index < REC_SAMPLES ; index++)
	{
		recDataL[index] = I2SFifoRead(i2sAddr);
		recDataR[index] = I2SFifoRead(i2sAddr);
	}

	Xil_Out32(i2sAddr + I2S_CTRL_REG, 0b00); //Disable RX Fifo
	xil_printf("Done!\n\r");

	TimerDelay(500000);

	recordingValid = 1;

	return XST_SUCCESS;
}
/* ------------------------------------------------------------ */

/***	AudioPlayRec(u32 i2sAddr)
**
**	Parameters:
**		i2sAddr - Physical Base address of the I2S controller
**
**	Return Value: int
**		XST_SUCCESS if successful
**
**	Errors:
**
**	Description:
**		Plays audio data stored in memory on HPH OUT
**
*/
int AudioPlayRec(u32 i2sAddr)
{
	int index = 0;

	xil_printf("\n\r");
	xil_printf("\n\r");
	xil_printf("Playing...");

	/*
	 * Reset TX FIFO and enable it
	 */
	Xil_Out32(i2sAddr + I2S_RESET_REG, 0b010); //Reset TX Fifo
	Xil_Out32(i2sAddr + I2S_CTRL_REG, 0b001); //Enable TX Fifo, disable mute

	for (index = 0; index < REC_SAMPLES ; index++)
	{
		I2SFifoWrite(i2sAddr, recDataL[index]);
		I2SFifoWrite(i2sAddr, recDataR[index]);
	}

	Xil_Out32(i2sAddr + I2S_CTRL_REG, 0b00); //Disable TX Fifo
	xil_printf("Done!\n\r");

	TimerDelay(500000);

	return XST_SUCCESS;
}
/* ------------------------------------------------------------ */

/***	AudioRegSet(XIicPs *IIcPtr, u8 regAddr, u16 regData)
**
**	Parameters:
**		IIcPtr - Pointer to the initialized XIicPs struct
**		regAddr - Register in the SSM2603 to write to
**		regData - Data to write to the register (lower 9 bits are used)
**
**	Return Value: int
**		XST_SUCCESS if successful
**
**	Errors:
**
**	Description:
**		Writes a value to a register in the SSM2603 device over IIC.
**
*/
int AudioRegSet(XIicPs *IIcPtr, u8 regAddr, u16 regData)
{
	int Status;
	u8 SendBuffer[2];

	SendBuffer[0] = regAddr << 1;
	SendBuffer[0] = SendBuffer[0] | ((regData >> 8) & 0b1);

	SendBuffer[1] = regData & 0xFF;

	Status = XIicPs_MasterSendPolled(IIcPtr, SendBuffer,
				 2, IIC_SLAVE_ADDR);
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
/* ------------------------------------------------------------ */

/***	I2SFifoWrite (u32 i2sBaseAddr, u32 audioData)
**
**	Parameters:
**		i2sBaseAddr - Physical Base address of the I2S controller
**		audioData - Audio data to be written to FIFO
**
**	Return Value: none
**
**	Errors:
**
**	Description:
**		Blocks execution until space is available in the I2S TX fifo, then
**		writes data to it.
**
*/
void I2SFifoWrite (u32 i2sBaseAddr, u32 audioData)
{
	while ((Xil_In32(i2sBaseAddr + I2S_FIFO_STS_REG)) & 0b0010)
	{}
	Xil_Out32(i2sBaseAddr + I2S_TX_FIFO_REG, audioData);
}
/* ------------------------------------------------------------ */

/***	I2SFifoRead (u32 i2sBaseAddr)
**
**	Parameters:
**		i2sBaseAddr - Physical Base address of the I2S controller
**
**	Return Value: u32
**		Audio data from the I2S RX FIFO
**
**	Errors:
**
**	Description:
**		Blocks execution until data is available in the I2S RX fifo, then
**		reads it out.
**
*/
u32 I2SFifoRead (u32 i2sBaseAddr)
{
	while ((Xil_In32(i2sBaseAddr + I2S_FIFO_STS_REG)) & 0b0100)
	{}
	return Xil_In32(i2sBaseAddr + I2S_RX_FIFO_REG);
}
/* ------------------------------------------------------------ */

/************************************************************************/
