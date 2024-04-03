/************************************************************************/
/*																		*/
/*	audio_demo.h	--	ZYBO Audio demonstration 						*/
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

#ifndef AUDIO_DEMO_H_
#define AUDIO_DEMO_H_

/* ------------------------------------------------------------ */
/*				Include File Definitions						*/
/* ------------------------------------------------------------ */

#include "xil_types.h"
#include "xiicps.h"

/* ------------------------------------------------------------ */
/*					Miscellaneous Declarations					*/
/* ------------------------------------------------------------ */

/* I2S Register offsets */
#define I2S_RESET_REG 		0x00
#define I2S_CTRL_REG 		0x04
#define I2S_CLK_CTRL_REG 	0x08
#define I2S_FIFO_STS_REG 	0x20
#define I2S_RX_FIFO_REG 	0x28
#define I2S_TX_FIFO_REG 	0x2C

/* IIC address of the SSM2603 device and the desired IIC clock speed */
#define IIC_SLAVE_ADDR		0b0011010
#define IIC_SCLK_RATE		100000

#define REC_TIME_SEC 5
#define REC_SAMPLES (REC_TIME_SEC * 48000) /* Sample rate of 48000Hz */

/* ------------------------------------------------------------ */
/*					Procedure Declarations						*/
/* ------------------------------------------------------------ */

int AudioInitialize();
int AudioRunDemo(u32 i2sAddr, u32 uartAddr, u32 swAddr, u32 btnAddr);
int AudioPlayTone(u32 i2sAddr, u32 uartAddr, u32 swAddr, u32 btnAddr);
int AudioRec(u32 i2sAddr, u8 useMic);
int AudioPlayRec(u32 i2sAddr);
void AudioPrintMenu();
int AudioRegSet(XIicPs *IIcPtr, u8 regAddr, u16 regData);
void I2SFifoWrite (u32 i2sBaseAddr, u32 audioData);
u32 I2SFifoRead (u32 i2sBaseAddr);

/* ------------------------------------------------------------ */

/************************************************************************/

#endif /* AUDIO_DEMO_H_ */
