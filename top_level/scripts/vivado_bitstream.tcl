set outputDir build

open_checkpoint $outputDir/post_route.dcp

write_bitstream -force $outputDir/opl3.bit
