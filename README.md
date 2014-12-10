opl3_fpga
=========
Reverse engineered RTL version of the Yamaha OPL3 (YMF262) FM Synthesizer. Currently in progress.
Follow the progress and discussion in http://forums.submarine.org.uk/phpBB/viewtopic.php?f=9&t=58132

There are some minor differences between this version and the original, mainly due to the hardware on
the board that I'm using. The top level is targeted to the Digilent ZYBO board. The interface to the CPU
is AXI4-Lite and the interface to the DAC is I2S. The internal clock speed is slightly different though
the sample clock is nearly identical.

Tools used are Modelsim, Vivado, Octave (for sample analysis), and SVEditor (for SystemVerilog file editing).
