#*******************************************************************************
#   +html+<pre>
#
#   FILENAME: Makefile
#   AUTHOR: Greg Taylor      CREATION DATE: 8 Aug 2015
#
#   DESCRIPTION: 
#	Run 'make' to build all the software necessary to run the OPL3
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
	
compile: 
	cd opl3_standalone_bsp_0 && make
	cd fsbl/Release && make
	cd imfplay_port/Release && make
	cd opl3dro && mfsgen -c *.dro
	
clean:
	cd opl3_standalone_bsp_0 && make clean
	cd fsbl/Release && make clean
	cd imfplay_port/Release && make clean
	cd opl3dro && rm -f filesystem.mfs
