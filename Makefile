#*******************************************************************************
#   +html+<pre>
#
#   FILENAME: Makefile
#   AUTHOR: Greg Taylor      CREATION DATE: 8 Aug 2015
#
#   DESCRIPTION:
#	1. Source the Vivado and SDK settings so all the build tools are in your
#      path.
#      E.g. source /opt/Xilinx/Vivado/2015.1/settings64.sh
#           source /opt/Xilinx/SDK/2015.1/settings64.sh
#
#	2. Run 'make' to build all the FPGA and software necessary to run the OPL3
#	   and create an SD card image.
#
#	3. Copy the resulting BOOT.bin to an SD card, insert it into the ZYBO.
#
#	4. Set JP5 to SD.
#
#	5. Connect the USB cable to PROG/UART, connect to PC.
#
#	6. Run a terminal program, use 115200 baud, 8-N-1.
#
#	7. Power on the ZYBO. In your terminal you should see:
#          Welcome to the OPL3 FPGA
#
#          Type 'help' for a list of commands
#          >
#
#	   Enjoy!
#
#   CHANGE HISTORY:
#   8 Aug 2015        Greg Taylor
#       Initial version
#
#   Copyright (C) 2014 Greg Taylor <gtaylor@sonic.net>
#
#   This file is part of OPL3 FPGA.
#
#   OPL3 FPGA is free software: you can redistribute it and/or modify
#   it under the terms of the GNU Lesser General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   OPL3 FPGA is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU Lesser General Public License for more details.
#
#   You should have received a copy of the GNU Lesser General Public License
#   along with OPL3 FPGA.  If not, see <http://www.gnu.org/licenses/>.
#
#   Original Java Code:
#   Copyright (C) 2008 Robson Cozendey <robson@cozendey.com>
#
#   Original C++ Code:
#   Copyright (C) 2012  Steffen Ohrendorf <steffen.ohrendorf@gmx.de>
#
#   Some code based on forum posts in:
#   http://forums.submarine.org.uk/phpBB/viewforum.php?f=9,
#   Copyright (C) 2010-2013 by carbon14 and opl3
#
#******************************************************************************
sd: all BOOT.bin

all:
	cd fpga && make bitstream
	vitis -s software/vitis_builder.py
	cd software/opl3dro && mfsgen -c *.dro

clean:
	cd fpga && make clean
	rm -rf vitis_project BOOT.bin logs software/opl3dro/filesystem.mfs

BOOT.bin:
	bootgen -image software/bif/imfplay_port.bif -arch zynq -o BOOT.bin -w on
