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
	modules/i2c/src/i2c_master_byte_ctrl.v \
	modules/i2c/src/i2c_master_bit_ctrl.v \
	modules/i2s/src/i2s.sv \
	modules/misc/src/edge_detector.sv \
	modules/oscillators/src/nco_control.sv \
	modules/oscillators/src/nco.sv \
	modules/oscillators/src/rand_num_4bit.sv \
	modules/oscillators/src/sine_lut.sv \
	modules/ssm2603/src/ssm2603_init.sv
	
SIM_SRC = \
	top_level/sim/top_level_tb.sv \
	modules/clks/src/clk_gen/clk_gen_funcsim.v \
	modules/i2c/sim/i2c_slave_model.v \
	modules/i2s/src/sample_fifo/sample_fifo_funcsim.v \
	modules/oscillators/sim/save_dac_input.sv
	
SIM_LIB = \
	sim_lib_vivado_2014.3/unisims/*.v
	
compile: compile_sim_lib
	test -e work || vlib work
	vlog -incr $(SIM_SRC) $(RTL_SRC)
	
compile_sim_lib:
	test -e sim_lib || (vlib sim_lib && vlog -work sim_lib -incr $(SIM_LIB))	
		 
sim: compile-eval
	vsim -L sim_lib -c top_level_tb glbl -do "run -a"
	
sim-debug: compile
	cygstart vsim -L sim_lib top_level_tb glbl -voptargs=+acc
	
syn-eval: check-local-changes
	echo -e "add_file $(RTL_SRC) $(SYN_CONSTRAINT)\nhdl_define\
	 -set \"FAMILY=\`FAMILY_PROASIC3L EVAL=1\
	 SVN_REV=$(SVN_REV) SVN_DIRTY=$(SVN_DIRTY)\"" > files.tcl
	synplify_pro -batch build/syn_eval.tcl
	
syn-proto: check-local-changes
	echo -e "add_file $(RTL_SRC) $(SYN_CONSTRAINT)\nhdl_define\
	 -set \"FAMILY=\`FAMILY_PROASIC3E\
	 SVN_REV=$(SVN_REV) SVN_DIRTY=$(SVN_DIRTY)\"" > files.tcl
	synplify_pro -license_wait -batch build/syn_proto.tcl
	
syn-flight: check-local-changes
	echo -e "add_file $(RTL_SRC) $(SYN_CONSTRAINT)\nhdl_define\
	 -set \"FAMILY=\`FAMILY_RTAX\
	 SVN_REV=$(SVN_REV) SVN_DIRTY=$(SVN_DIRTY)\"" > files.tcl
	synplify_pro -batch build/syn_flight.tcl
	
# For P&R, run scripts from within Window Designer GUI instead. Designer crashes in linux for RTAX.	
#pr-proto: 
#	/opt/microsemi/Libero_v9.1/Libero/bin/designer SCRIPT:build/pr_proto.tcl
#	cd prototype && mv dsac_proto.pdb dsac_proto_$(SVN_REV)_${shell date --iso-8601}.pdb
	
#pr-flight:
#	/opt/microsemi/Libero_v9.1/Libero/bin/designer SCRIPT:build/pr_flight.tcl
#	cd flight && mv dsac_flight.pdb dsac_flight_$(SVN_REV)_${shell date --iso-8601}.pdb	
	
#build-proto: syn-proto pr-proto

#build-flight: syn-flight pr-flight

archive-proto:
	cd .. && tar --exclude-vcs -cvf dsac_proto_fpga_rev$(SVN_REV).tar modules topLevelFPGA && gzip dsac_proto_fpga_rev$(SVN_REV).tar
	
archive-flight:
	cd .. && tar --exclude-vcs -cvf dsac_flight_fpga_rev$(SVN_REV).tar modules topLevelFPGA && gzip dsac_flight_fpga_rev$(SVN_REV).tar
	
clean:
	rm -rf  *.tmp  *.log  log transcript work *.wlf vsim.fcdb proasic3L rtax
	rm -rf *~ core csrc simv* vc_hdrs.h ucli.key urg* *.log core.* synlog.tcl
	rm -rf sim_lib
	
#*******************************************************************************
#
#   Copyright 2012, by the California Institute of Technology.
#   ALL RIGHTS RESERVED. United States Government Sponsorship acknowledged.
#   Any commercial use must be negotiated with the Office of Technology
#   Transfer at the California Institute of Technology.
#
#   This software may be subject to U.S. export control laws and regulations.
#   By accepting this document, the user agrees to comply with all applicable
#   U.S. export laws and regulations.  User has the responsibility to obtain
#   export licenses, or other export authority as may be required before
#   exporting such information to foreign countries or providing access to
#   foreign persons.
#
#******************************************************************************/	