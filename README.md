opl3_fpga
=========
Reverse engineered SystemVerilog RTL version of the 
<a href="http://en.wikipedia.org/wiki/Yamaha_YMF262">Yamaha OPL3 (YMF262)</a> FM Synthesizer.
Design is complete and working on the Digilent ZYBO board. The software needs a bit of cleaning up.

Hear it in action:
* https://www.youtube.com/watch?v=KoSF4ZoDuRI
* https://www.youtube.com/watch?v=i9vEKyJScYw

Every effort possible has been made to replicate, bit-true, the math of the original OPL3 chip. Several other very smart people put in a lot of work before me to get as close as possible this goal in software, and this FPGA design would not be possible without their work. Their efforts included <a href="https://docs.google.com/document/d/18IGx18NQY_Q1PJVZ-bHywao9bhsDoAqoIn1rIm42nwo/edit">de-lidding the chip to extract the actual values out of the ROMs</a>. They're all over at http://forums.submarine.org.uk/phpBB/viewforum.php?f=9. You can follow the progression of some of the reverse engineering--it's quite interesting.

There are some differences between this version and the original chip in the external interface due to the hardware on
the board that I'm using. The design is targeted to the <a href="https://www.digilentinc.com/Products/Detail.cfm?Prod=ZYBO">Digilent ZYBO board</a>
which has the <a href="http://www.xilinx.com/products/silicon-devices/soc/zynq-7000.html">Xilinx Zynq-7000
SoC</a> containing an ARM dual-core Cortex-A9 and an FPGA. The board also has an 
<a href="http://www.analog.com/en/products/audio-video/audio-codecs/ssm2603.html#product-overview">Analog Devices SSM2603
audio codec</a> with dual 24-bit DACs. The interface to the CPU is AXI4-Lite
and the interface to the DAC is I<sup>2</sup>S, matching the particular hardware I have to work with. These
interfaces are wrapped in the design and would be easy to swap out.

The original OPL3 chip used a 14.31818MHz master clock. The sample rate was 14.31818MHz/288 = 49.7159KHz, which is quite an interesting sample rate. With 36 operator slots, that gives 8 clocks to update each operator each sample (operator logic is
time-shared between slots).

The SSM2603 on the ZYBO uses 256x oversampling, and thus requires a master clock 256x the sample clock.
I decided to use a single clock domain and keep the sample clock as close as possible to the original
chip. The ZYBO provides the FPGA with an external clock of 125MHz. Using a mixed-mode clock manager (MMCM) in the FPGA,
I'm able to synthesize a 12.727MHz clock from that, which divided by 256 gets me very close to the original
sample rate at 49.7148KHz. Updating 36 operator slots using my slower master clock only gives me 7 clock
cycles per sample instead of 8, but that's okay because I can stack tons of combinational logic up with
few pipeline registers with this slow clock speed and modern FPGA. The build meets timing with 53.1ns of slack (＠_＠;)

As far as software, so far I've ported over <a href="http://software.kvee.cz/imfplay/">imfplay</a> from x86 DOS to the ARM running bare metal. It can playback .dro files captured in DOSBox while playing the original games. They are essentially OPL3 register writes using a 1000Hz timer tick (I used the built in timer in the ARM). The files are stored in an in-memory filesystem. The whole package including the FPGA bitstream, front stage boot loader, imfplay executable, and filesystem image can be built using one command and placed on an SD card.

In doing the project, I was very impressed with what the original chip designers were able to accomplish. They used some very clever techniques to squeeze maximum functionality out of very limited resources--particularly using the combination of an exponential lookup table and a log-sine lookup table to <a href="https://github.com/gtaylormb/opl3_fpga/blob/master/docs/opl3math/opl3math.pdf">apply gain to the sine wave without the use of multipliers</a>, and the clever use of time sharing the operator resources among 36 slots.

Tools used are Modelsim, Vivado 2015.1, Octave (for sample analysis), and SVEditor (for SystemVerilog file editing).

## Digital waveform images
These were produced by writing the actual binary output values of the operator logic in simulation to a file and plotting them using Octave.

The 6 basic unmodulated waveform outputs:

<img src="http://i.imgur.com/ysmm3Sp.png?1">

<img src="http://i.imgur.com/ze8W5wU.png?1">

<img src="http://i.imgur.com/DHMkYkb.png?1">

<img src="http://i.imgur.com/t8UO1Xz.png?1">

<img src="http://i.imgur.com/0fmTRXg.png?1">

<img src="http://i.imgur.com/o1EIYDZ.png?1">

<img src="http://i.imgur.com/LKeYdRh.png?1">

<img src="http://i.imgur.com/5JEmWyz.png?1">

Demonstration of the envelope being applied (attack, decay, sustain, release):

<img src="http://i.imgur.com/Of8oeui.png?1">

Close up of the attack phase:

<img src="http://i.imgur.com/GVkxXhn.png?1">

## Vivado block design

<img src="https://github.com/gtaylormb/opl3_fpga/blob/master/docs/block_design.png">

## Utilization in xc7z010:

    +----------------------------+------+-------+-----------+-------+
    |          Site Type         | Used | Fixed | Available | Util% |
    +----------------------------+------+-------+-----------+-------+
    | Slice LUTs                 | 7106 |     0 |     17600 | 40.38 |
    |   LUT as Logic             | 7040 |     0 |     17600 | 40.00 |
    |   LUT as Memory            |   66 |     0 |      6000 |  1.10 |
    |     LUT as Distributed RAM |    0 |     0 |           |       |
    |     LUT as Shift Register  |   66 |     0 |           |       |
    | Slice Registers            | 9529 |     0 |     35200 | 27.07 |
    |   Register as Flip Flop    | 9529 |     0 |     35200 | 27.07 |
    |   Register as Latch        |    0 |     0 |     35200 |  0.00 |
    | F7 Muxes                   |  888 |     0 |      8800 | 10.09 |
    | F8 Muxes                   |  238 |     0 |      4400 |  5.41 |
    +----------------------------+------+-------+-----------+-------+
    
    +-------------------+------+-------+-----------+-------+
    |     Site Type     | Used | Fixed | Available | Util% |
    +-------------------+------+-------+-----------+-------+
    | Block RAM Tile    |    1 |     0 |        60 |  1.67 |
    |   RAMB36/FIFO*    |    0 |     0 |        60 |  0.00 |
    |   RAMB18          |    2 |     0 |       120 |  1.67 |
    |     RAMB18E1 only |    2 |       |           |       |
    +-------------------+------+-------+-----------+-------+
    
    +----------------+------+-------+-----------+-------+
    |    Site Type   | Used | Fixed | Available | Util% |
    +----------------+------+-------+-----------+-------+
    | DSPs           |    1 |     0 |        80 |  1.25 |
    |   DSP48E1 only |    1 |       |           |       |
    +----------------+------+-------+-----------+-------+
    
## Serial command line interface

I've added a simple command line interface for playing songs. 
Set your terminal to 115200 baud, 8-N-1.
    
    Welcome to the OPL3 FPGA
    
    Type 'help' for a list of commands
    >ls
    descent.dro 381376
    doom_000.dro 73778
    doom_001.dro 54434
    doom_002.dro 81288
    doom_035.dro 50934
    doom_036.dro 58198
    doom2_000.dro 16554
    doom2_001.dro 74836
    doom2_002.dro 115962
    doom2_003.dro 162264
    doom2_031.dro 45292
    doom2_032.dro 54584
    doom2.dro 47328
    doom.dro 90077
    duke3d.dro 136862
    hexen.dro 122449
    war_000.dro 120658
    >play doom_000.dro
    DRO 2.0 file 
    
## Build/run instructions (Linux)
1. If you want to add any .dro files, you may place them in software/opl3dro.
They will be included in the in-memory filesystem for playback.

2. Source the Vivado and SDK settings so all the build tools are in your path.
Example: 

        source /opt/Xilinx/Vivado/2015.1/settings64.sh
        source /opt/Xilinx/SDK/2015.1/settings64.sh
      
3. Run 'make' to build the FPGA and software necessary to run the OPL3
and create an SD card image.

4. Copy the resulting BOOT.bin to an SD card, insert it into the ZYBO.

5. Set JP5 to SD.

6. Connect a USB cable to PROG/UART on the ZYBO. Power on the ZYBO. Your PC should detect the USB serial port device.

7. Run a terminal program, use 115200 baud, 8-N-1.

8. Reset the ZYBO by pressing PS-SRST. In your terminal you should see:

        Welcome to the OPL3 FPGA

        Type 'help' for a list of commands
        >

Enjoy!

## Future work
I'd really love to make the board appear as a USB peripheral when plugged into PC. If DOSBox/ScummVM could be made aware of the device, they could direct all OPL3 writes to the board. Digital PCM output could be made available as well.

Another idea is to port DOSBox/ScummVM directly to the ARM CPU on the board.

Let me know if you have other ideas or are interested into doing either of these projects, I'll help out as much as I can.
