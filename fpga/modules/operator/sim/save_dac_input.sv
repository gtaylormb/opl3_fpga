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
#   Copyright (C) 2014 Greg Taylor <gtaylor@sonic.net>
#
#   This file is part of OPL3 FPGA.
#
#   OPL3 FPGA is free software: you can redistribute it and/or modify
#   it under the terms of the GNU Lesser General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   OPL3 FPGA is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU Lesser General Public License for more details.
#
#   You should have received a copy of the GNU Lesser General Public License
#   along with OPL3 FPGA.  If not, see <http://www.gnu.org/licenses/>.
#
#   Original Java Code:
#   Copyright (C) 2008 Robson Cozendey <robson@cozendey.com>
#
#   Original C++ Code:
#   Copyright (C) 2012  Steffen Ohrendorf <steffen.ohrendorf@gmx.de>
#
#   Some code based on forum posts in:
#   http://forums.submarine.org.uk/phpBB/viewforum.php?f=9,
#   Copyright (C) 2010-2013 by carbon14 and opl3
#
#******************************************************************************/
`default_nettype none
`timescale 1ns / 1ps

module save_dac_input #(
   parameter DAC_WIDTH = 0,
   parameter NUM_SAMPLES = 16384, // the number of samples to save to disk
   parameter FILENAME = "dac_data.bin",
   parameter CLKS_TO_SKIP = 5000 // the number of clocks to skip at the beginning of sim
)(
    input wire clk,
    input wire reset,
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

            //##CLKS_TO_SKIP;
            if (!reset)
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
