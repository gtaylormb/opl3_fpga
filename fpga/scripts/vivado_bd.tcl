set BD_SRC [lindex $argv 0]
set BOARD [lindex $argv 1]

set outputDir build

create_project -part xc7z010clg400-1 -in_memory
set_property IP_REPO_PATHS {"modules/opl3_fpga_2_0"} [current_project]
update_ip_catalog -rebuild

set_property target_language Verilog [current_project]
set_property default_lib work [current_project]

# downgrade critial warnings regarding https://digilent.com/reference/programmable-logic/zybo-z7/reference-manual?redirect=1#hardware_errata
set_msg_config -id "PSU-1" -new_severity "INFO"
set_msg_config -id "PSU-2" -new_severity "INFO"
set_msg_config -id "PSU-3" -new_severity "INFO"
set_msg_config -id "PSU-4" -new_severity "INFO"

source ${BD_SRC}

save_bd_design_as -dir $outputDir -force design_1.bd

