#*******************************************************************************
#   +html+<pre>
#
#   FILENAME: Makefile
#   AUTHOR: Greg Taylor      CREATION DATE: 17 Oct 2014
#
#   DESCRIPTION:
#	Run 'make sim-debug' to debug the design in the Modelsim GUI
#
#	Run 'make bitstream' to build the entire design (synthesis, P&R, bitstream)
#
#	Run 'make program' to program the FPGA (may have to modify script for your
#	setup)
#
#   CHANGE HISTORY:
#   17 Oct 2014        Greg Taylor
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
uname_O := $(shell sh -c 'uname -o 2>/dev/null || echo not')

BOARD = zybo

RTL_SRC = \
	modules/top_level/src/opl3.sv \
	modules/channels/src/channel_adder.sv \
	modules/channels/src/channels.sv \
	modules/channels/src/control_operators.sv \
	modules/clks/src/clk_div.sv \
	modules/clks/src/reset_sync.sv \
	modules/i2s/src/i2s.sv \
	modules/operator/src/operator.sv \
	modules/operator/src/calc_phase_inc.sv \
	modules/operator/src/calc_rhythm_phase.sv \
	modules/operator/src/phase_generator.sv \
	modules/operator/src/vibrato.sv \
	modules/operator/src/envelope_generator.sv \
	modules/operator/src/ksl_add_rom.sv \
	modules/operator/src/env_rate_counter.sv \
	modules/operator/src/tremolo.sv \
	modules/operator/src/opl3_log_sine_lut.sv \
	modules/operator/src/opl3_exp_lut.sv \
	modules/timers/src/timers.sv \
	modules/timers/src/timer.sv \
	modules/misc/src/edge_detector.sv \
	modules/misc/src/mem_simple_dual_port.sv \
	modules/misc/src/mem_multi_bank.sv \
	modules/misc/src/pipeline_sr.sv \
	modules/misc/src/synchronizer.sv \
    modules/register_file/src/register_file.sv \
	modules/register_file/src/host_if.sv

PKG_SRC = \
	modules/top_level/pkg/opl3_pkg.sv

SIM_SRC = \
	modules/top_level/sim/opl3_tb.sv \
	modules/operator/sim/save_dac_input.sv

BD_SRC = \
	bd/vivado_2023.2_bd.tcl

PRE_SYN_XDC_SRC = \
	constraints/ZYBO_Master.xdc

POST_SYN_XDC_SRC = \
	constraints/post_synth.xdc

INC_DIR0 = \
	modules/

compile:
	test -e work || vlib work
	vlog -incr ${PKG_SRC} $(SIM_SRC) $(RTL_SRC) +define+SIM +incdir+$(INC_DIR0)

sim: compile
	vsim -c opl3_tb -do "run -a"

# Launch the Modelsim GUI for debugging design
sim-debug: compile
	vsim opl3_tb -voptargs=+acc

bd: build/design_1/design_1.bd

syn: build/post_syn.dcp

place: build/post_place.dcp

route: build/post_route.dcp

bitstream: build/opl3.bit

probes: build/opl3.ltx

program: build/opl3.bit
	vivado -mode batch -source scripts/vivado_program.tcl -log build/program_log.txt -nojournal

clean:
	rm -rf  *.tmp  *.log  log transcript work *.wlf vsim.fcdb
	rm -rf *~ core csrc simv* vc_hdrs.h ucli.key urg* *.log core.* synlog.tcl
	rm -rf sim_lib build usage_stat* ipshared/ .Xil .gen .srcs
	rm -rf clockInfo.txt tight_setup_hold_pins.txt vivado* NA

build/design_1/design_1.bd: $(BD_SRC)
	test -e build || mkdir build
	vivado -mode batch -source scripts/vivado_bd.tcl -nojournal \
	-log build/bd_log.txt -tclargs "$(BD_SRC)" "${BOARD}"

build/post_syn.dcp: build/design_1/design_1.bd ${PKG_SRC} $(RTL_SRC) $(PRE_SYN_XDC_SRC) $(POST_SYN_XDC_SRC)
	test -e build || mkdir build
	rm -rf ipshared
	vivado -mode batch -source scripts/vivado_syn.tcl -nojournal \
	-log build/syn_log.txt -tclargs "${PKG_SRC}" "$(RTL_SRC)" "$(INC_DIR0)" "$(PRE_SYN_XDC_SRC)" "$(POST_SYN_XDC_SRC)"

build/post_place.dcp: build/post_syn.dcp
	vivado -mode batch -source scripts/vivado_place.tcl -log build/place_log.txt -nojournal

build/post_route.dcp: build/post_place.dcp
	vivado -mode batch -source scripts/vivado_route.tcl -log build/route_log.txt -nojournal

build/opl3.bit: build/post_route.dcp
	vivado -mode batch -source scripts/vivado_bitstream.tcl -log build/bitstream_log.txt -nojournal

build/opl3.ltx: build/opl3.bit
	vivado -mode batch -source scripts/vivado_probes.tcl -log build/probes_log.txt -nojournal
