RTL_SRC = \
	src/i2s.sv \
	../clks/src/clk_div.sv \
	../misc/src/edge_detector.sv
	
SIM_SRC = \
	sim/i2s_tb.sv
	
compile:
	test -e work || vlib work
	vlog -incr $(SIM_SRC) $(RTL_SRC) 
	 
sim: compile
	vsim -c i2s_tb -do "run all"
	
sim-debug: compile
	cygstart vsim i2s_tb -voptargs=+acc
	
clean:
	rm -rf  *.tmp  *.log  log transcript work *.wlf vsim.fcdb
	rm -rf *~ core csrc simv* vc_hdrs.h ucli.key urg* *.log core.*
	