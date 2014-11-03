#*******************************************************************************
#   +html+<pre>
#
#   FILENAME: Makefile
#   AUTHOR: Greg Taylor      CREATION DATE: 17 Oct 2014
#
#   DESCRIPTION: 
#
#   CHANGE HISTORY:
#   17 Oct 2014        Greg Taylor
#       Initial version
#
#   SVN Identification
#   $Id$
#*******************************************************************************
RTL_SRC = \
	top_level/src/top_level.sv \
	modules/clks/src/clk_div.sv \
	modules/i2s/src/i2s.sv \
	modules/operator/src/operator.sv \
	modules/operator/src/calc_phase_inc.sv \
	modules/operator/src/phase_generator.sv \
	modules/operator/src/vibrato.sv \
	modules/operator/src/envelope_generator.sv \
	modules/operator/src/ksl_add_rom.sv \
	modules/operator/src/env_rate_counter.sv \
	modules/operator/src/tremolo.sv \
	modules/operator/src/opl3_log_sine_lut.sv \
	modules/operator/src/opl3_exp_lut.sv \
	modules/register_file/src/register_file.sv \
	modules/misc/src/edge_detector.sv
	
SIM_SRC = \
	top_level/sim/top_level_tb.sv \
	modules/clks/ip/clk_gen/clk_gen_funcsim.v \
	modules/ps/ip/processing_system7_0/processing_system7_0_funcsim.v \
	modules/ps/ip/axi_protocol_converter_0/axi_protocol_converter_0_funcsim.v \
	modules/operator/sim/save_dac_input.sv
	
IP_SRC = \
	modules/clks/ip/clk_gen/clk_gen.xci \
	modules/ps/ip/processing_system7_0/processing_system7_0.xci
	
XDC_SRC = \
	top_level/constraints/ZYBO_Master.xdc
	
INC_DIR0 = \
	./	
	
SIM_LIB = \
	sim_lib_vivado_2014.3/unisims/*.v
	
compile: compile_sim_lib
	test -e work || vlib work
	vlog -incr $(SIM_SRC) $(RTL_SRC) +define+SIM
	
compile_sim_lib:
	test -e sim_lib || (vlib sim_lib && vlog -work sim_lib -incr $(SIM_LIB))	
		 
sim: compile-eval
	vsim -L sim_lib -c top_level_tb glbl -do "run -a"
	
sim-debug: compile
	cygstart vsim -L sim_lib top_level_tb glbl -voptargs=+acc
	
syn: build/post_syn.dcp

place: build/post_place.dcp

route: build/post_route.dcp

bitstream: build/opl3.bit

program: build/opl3.bit
	vivado -mode batch -source top_level/scripts/vivado_program.tcl -log build/program_log.txt -nojournal

archive-proto:
	cd .. && tar --exclude-vcs -cvf dsac_proto_fpga_rev$(SVN_REV).tar modules topLevelFPGA && gzip dsac_proto_fpga_rev$(SVN_REV).tar
	
archive-flight:
	cd .. && tar --exclude-vcs -cvf dsac_flight_fpga_rev$(SVN_REV).tar modules topLevelFPGA && gzip dsac_flight_fpga_rev$(SVN_REV).tar
	
clean:
	rm -rf  *.tmp  *.log  log transcript work *.wlf vsim.fcdb proasic3L rtax
	rm -rf *~ core csrc simv* vc_hdrs.h ucli.key urg* *.log core.* synlog.tcl
	rm -rf sim_lib build usage_stat*

build/post_syn.dcp: $(RTL_SRC) $(IP_SRC) $(XDC_SRC)
	test -e build || mkdir build
	vivado -mode batch -source top_level/scripts/vivado_syn.tcl -nojournal \
	-log build/syn_log.txt -tclargs "$(RTL_SRC)" "$(INC_DIR0)" "$(IP_SRC)" "$(XDC_SRC)"

build/post_place.dcp: build/post_syn.dcp
	vivado -mode batch -source top_level/scripts/vivado_place.tcl -log build/place_log.txt -nojournal

build/post_route.dcp: build/post_place.dcp
	vivado -mode batch -source top_level/scripts/vivado_route.tcl -log build/route_log.txt -nojournal
	
build/opl3.bit: build/post_route.dcp
	vivado -mode batch -source top_level/scripts/vivado_bitstream.tcl -log build/bitstream_log.txt -nojournal	
