RTL_SRC = \
	src/operator.sv \
	src/calc_phase_inc.sv \
	src/phase_generator.sv \
	src/opl3_log_sine_lut.sv \
	src/opl3_exp_lut.sv \
	src/vibrato.sv \
	src/envelope_generator.sv \
	src/env_rate_counter.sv \
	src/ksl_add_rom.sv \
	src/tremolo.sv \
	../clks/src/clk_div.sv \
	../misc/src/edge_detector.sv
	
SIM_SRC = \
	sim/operator_tb.sv \
	sim/save_dac_input.sv
	
compile:
	test -e work || vlib work
	vlog -incr $(SIM_SRC) $(RTL_SRC)
	 
sim: compile
	vsim -c operator_tb -do "run all"
	
sim-debug: compile
	cygstart vsim operator_tb -voptargs=+acc
	
clean:
	rm -rf  *.tmp  *.log  log transcript work *.wlf vsim.fcdb
	rm -rf *~ core csrc simv* vc_hdrs.h ucli.key urg* *.log core.*
	