set outputDir build

open_checkpoint $outputDir/post_route.dcp

write_bitstream -force $outputDir/opl3.bit

write_sysdef -force -hwdef top_level/bd/opl3_cpu/hdl/opl3_cpu.hwdef -bitfile $outputDir/opl3.bit -file ../software/hw_def/opl3.hdf
