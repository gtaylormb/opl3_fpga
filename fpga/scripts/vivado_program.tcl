set outputDir build

open_hw
#connect_hw_server -url localhost:3121
connect_hw_server -url 192.168.68.63:3121

current_hw_target [get_hw_targets */xilinx_tcf/Digilent/*]
set_property PARAM.FREQUENCY 15000000 [get_hw_targets */xilinx_tcf/Digilent/*]
open_hw_target

current_hw_device [lindex [get_hw_devices] 1]
refresh_hw_device -update_hw_probes false [lindex [get_hw_devices] 1]

set_property PROGRAM.FILE $outputDir/opl3.bit [lindex [get_hw_devices] 1]
program_hw_devices [lindex [get_hw_devices] 1]
