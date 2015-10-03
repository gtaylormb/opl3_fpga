set outputDir build

open_checkpoint $outputDir/post_place.dcp

route_design

report_timing -file $outputDir/post_route_timing.txt -nworst 5
report_timing_summary -file $outputDir/post_route_timing_summary.txt
report_io -file $outputDir/post_route_io_summary.txt
report_drc -file $outputDir/post_route_drc.txt

write_checkpoint -force $outputDir/post_route
