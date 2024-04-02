set outputDir build

open_checkpoint $outputDir/post_route.dcp

write_bitstream -force $outputDir/opl3.bit

# command was deprated in newer versions of Vivado
#write_sysdef -force -hwdef bd/opl3_cpu/hdl/opl3_cpu.hwdef -bitfile $outputDir/opl3.bit -file ../software/hw_def/opl3.hdf

write_hw_platform -force -fixed -include_bit ../software/hw_def/opl3.xsa