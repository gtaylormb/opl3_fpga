set RTL_SRC [lindex $argv 0]
set INC_DIR0 [lindex $argv 1]
set IP_SRC [lindex $argv 2]
set XDC_SRC [lindex $argv 3]

set outputDir build

read_verilog -sv ${RTL_SRC}
read_ip ${IP_SRC}
read_xdc ${XDC_SRC}

synth_design -name opl3 -part xc7z020clg400-1 -top top_level -include_dirs \
 ${INC_DIR0} -fsm_extraction auto
 
opt_design

report_utilization -file $outputDir/post_syn_util.txt

write_checkpoint -force $outputDir/post_syn
