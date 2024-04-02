set PKG_SRC [lindex $argv 0]
set RTL_SRC [lindex $argv 1]
set INC_DIR0 [lindex $argv 2]
set XDC_SRC [lindex $argv 3]

set outputDir build

create_project -part xc7z010clg400-1 -in_memory
set_property target_language Verilog [current_project]
set_property default_lib work [current_project]

# Reduce severity of information regarding generated file not found--we regen
# each IP block anyway
#set_msg_config -id "IP_Flow 19-3664" -new_severity "INFO"

#set_property IP_REPO_PATHS modules [current_fileset]
#update_ip_catalog -rebuild

add_files $outputDir/design_1/design_1.bd
generate_target all -force [get_files build/design_1/design_1.bd]
make_wrapper -files [get_files $outputDir/design_1/design_1.bd] -top -import -force

read_verilog -sv ${PKG_SRC}
read_verilog -sv ${RTL_SRC}
read_xdc ${XDC_SRC}

synth_design -name opl3 -part xc7z010clg400-1 -top design_1_wrapper -include_dirs \
 ${INC_DIR0} -directive AreaOptimized_high

opt_design

report_utilization -file $outputDir/post_syn_util.txt

write_checkpoint -force $outputDir/post_syn
