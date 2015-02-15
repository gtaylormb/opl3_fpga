opl3_fpga
=========
Reverse engineered RTL version of the Yamaha OPL3 (YMF262) FM Synthesizer. Currently in progress.
Follow the progress and discussion in http://forums.submarine.org.uk/phpBB/viewtopic.php?f=9&t=58132

There are some minor differences between this version and the original chip, mainly due to the hardware on
the board that I'm using. The design is targeted to the Digilent ZYBO board which has the Xilinx Zynq-7000
SoC with a ARM dual-core Cortex-A9 together with an FPGA. The board also has an Analog Devices SSM2603
audio codec with dual 24-bit DACs. So the interfaces are different--the interface to the CPU is AXI4-Lite
and the interface to the DAC is I2S, matching the particular hardware I have to work with.

The original OPL3 chip used a 14.31818MHz master clock. The sample rate was 14.31818MHz/288 = 49.7159KHz.
With 36 operator slots, that gives 8 clocks to update each operator each sample (operator logic is
time-shared between slots).

The SSM2603 on the ZYBO uses 256x oversampling, and thus requires a master clock 256x the sample clock.
I decided to use a single clock domain and keep the sample clock as close as possible to the original
chip. The ZYBO provides the FPGA with an external clock of 125MHz. Using a mixed-mode clock manager (MMCM) in the FPGA,
I'm able to synthesize a 12.727MHz clock from that, which divided by 256 gets me very close to the original
sample rate at 49.7148KHz. Updating 36 operator slots using my slower master clock only gives me 7 clock
cycles per sample instead of 8, but that's okay because I can stack tons of combinational logic up with
few pipeline registers with this slow clock speed and modern FPGA.

Tools used are Modelsim, Vivado, Octave (for sample analysis), and SVEditor (for SystemVerilog file editing).
