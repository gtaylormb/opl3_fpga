RTL_SRC = \
	src/control_operators.sv \
	../operator/src/operator.sv \
	../operator/src/calc_phase_inc.sv \
	../operator/src/phase_generator.sv \
	../operator/src/opl3_log_sine_lut.sv \
	../operator/src/opl3_exp_lut.sv \
	../operator/src/vibrato.sv \
	../operator/src/envelope_generator.sv \
	../operator/src/env_rate_counter.sv \
	../operator/src/ksl_add_rom.sv \
	../operator/src/tremolo.sv \
	../misc/src/edge_detector.sv	
	
SIM_SRC = \
	sim/control_operators_tb.sv \
	../clks/src/clk_div.sv \
	../operator/sim/save_dac_input.sv
	
compile:
	test -e work || vlib work
	vlog -incr $(SIM_SRC) $(RTL_SRC) 
	 
sim: compile
	vsim -c control_operators_tb -do "run all"
	
sim-debug: compile
	cygstart vsim control_operators_tb -voptargs=+acc
	
clean:
	rm -rf  *.tmp  *.log  log transcript work *.wlf vsim.fcdb
	rm -rf *~ core csrc simv* vc_hdrs.h ucli.key urg* *.log core.*
	