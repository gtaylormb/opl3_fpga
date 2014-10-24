/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: save_dac_input.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 18 Dec 2012
# 
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   18 Dec 2012        Greg Taylor
#       Initial version
#
#   SVN Identification
#   $Id$
#******************************************************************************/
`default_nettype none  // disable implicit net type declarations
`timescale 1ns / 1ps
  
module save_dac_input #(
   parameter DAC_WIDTH = 0,
   parameter NUM_SAMPLES = 16384, // the number of samples to save to disk
   parameter FILENAME = "dac_data.bin",
   parameter CLKS_TO_SKIP = 10000 // the number of clocks to skip at the beginning of sim
)(
	input wire clk,
    input wire clk_en,
	input wire [DAC_WIDTH-1:0] dac_input
);
    timeunit 1ns;
    integer fd;
    integer errno;
    string err;
    int num_samples = 0;
    
    program save_dac_data;
		default clocking dac_clk @(posedge clk);
			default input #1step;
			input dac_input;
            input clk_en;
		endclocking      
		
        initial begin
        	fd = $fopen(FILENAME, "w");
        	
    		if (!fd) begin
    			errno = $ferror(fd, err);
    			$display("Error opening DAC data file: %s", err);
    		end
    		
    		##CLKS_TO_SKIP;
    		while (num_samples < NUM_SAMPLES) begin
    			##1 
                if (dac_clk.clk_en) begin
                $fwrite(fd, "%x\n", dac_clk.dac_input);
                    num_samples++;
                end
            end       
    			
    		$fclose(fd);
    		$display("Saved %s.", FILENAME);
        end
    endprogram
endmodule

/*******************************************************************************
#
#   Copyright 2012, by the California Institute of Technology.
#   ALL RIGHTS RESERVED. United States Government Sponsorship acknowledged.
#   Any commercial use must be negotiated with the Office of Technology
#   Transfer at the California Institute of Technology.
#
#   This software may be subject to U.S. export control laws and regulations.
#   By accepting this document, the user agrees to comply with all applicable
#   U.S. export laws and regulations.  User has the responsibility to obtain
#   export licenses, or other export authority as may be required before
#   exporting such information to foreign countries or providing access to
#   foreign persons.
#
#******************************************************************************/
