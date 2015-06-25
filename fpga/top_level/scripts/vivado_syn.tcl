set RTL_SRC [lindex $argv 0]
set INC_DIR0 [lindex $argv 1]
set IP_SRC [lindex $argv 2]
set BD_SRC [lindex $argv 3]
set XDC_SRC [lindex $argv 4]

set outputDir build

create_project -part xc7z010clg400-1 -in_memory
set_property target_language Verilog [current_project]
set_property default_lib work [current_project]

set_property IP_REPO_PATHS top_level/ip_repo [current_fileset]
update_ip_catalog -rebuild

read_bd ${BD_SRC}
open_bd_design ${BD_SRC}
generate_target all -force [get_files ${BD_SRC}]

read_verilog -sv ${RTL_SRC}
read_ip ${IP_SRC}
read_xdc ${XDC_SRC}

synth_design -name opl3 -part xc7z010clg400-1 -top opl3_cpu_wrapper -include_dirs \
 ${INC_DIR0}
 
opt_design

report_utilization -file $outputDir/post_syn_util.txt

write_checkpoint -force $outputDir/post_syn
