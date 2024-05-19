RTL_SRC = \
	src/operator.sv \
	src/calc_phase_inc.sv \
	src/calc_rhythm_phase.sv \
	src/phase_generator.sv \
	src/opl3_log_sine_lut.sv \
	src/opl3_exp_lut.sv \
	src/vibrato.sv \
	src/envelope_generator.sv \
	src/env_rate_counter.sv \
	src/ksl_add_rom.sv \
	src/tremolo.sv \
	../clks/src/clk_div.sv \
	../misc/src/edge_detector.sv \
	../misc/src/mem_simple_dual_port_async_read.sv \
	../misc/src/mem_simple_dual_port.sv \
	../misc/src/mem_multi_bank.sv \
	../misc/src/mem_multi_bank_reset.sv \
	../misc/src/pipeline_sr.sv

SIM_SRC = \
	../top_level/pkg/opl3_pkg.sv \
	sim/operator_tb.sv \
	sim/save_dac_input.sv

compile:
	test -e work || vlib work
	vlog -incr $(SIM_SRC) $(RTL_SRC)

sim: compile
	vsim -c operator_tb -do "run -a"

sim-debug: compile
	vsim operator_tb -voptargs=+acc

clean:
	rm -rf  *.tmp  *.log  log transcript work *.wlf vsim.fcdb
	rm -rf *~ core csrc simv* vc_hdrs.h ucli.key urg* *.log core.*
