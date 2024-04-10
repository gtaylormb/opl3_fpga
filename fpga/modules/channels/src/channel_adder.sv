/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: channel_adder.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 5 April 2024
#
#   DESCRIPTION: Add channels and optionally sync to host clk domain
#
#   CHANGE HISTORY:
#   5 April 2024    Greg Taylor
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
`timescale 1ns / 1ps
`default_nettype none

module channel_adder
    import opl3_pkg::*;
(
    input wire clk,
    input wire clk_host,
    input wire channel_valid,
    input wire signed [SAMPLE_WIDTH-1:0] channel_a,
    input wire signed [SAMPLE_WIDTH-1:0] channel_b,
    input wire signed [SAMPLE_WIDTH-1:0] channel_c,
    input wire signed [SAMPLE_WIDTH-1:0] channel_d,
    output logic sample_valid,
    output logic signed [DAC_OUTPUT_WIDTH-1:0] sample_l,
    output logic signed [DAC_OUTPUT_WIDTH-1:0] sample_r
);
    logic sample_valid_opl3_p1 = 0;
    logic signed [DAC_OUTPUT_WIDTH-1:0] sample_opl3_l_p1 = 0;
    logic signed [DAC_OUTPUT_WIDTH-1:0] sample_opl3_r_p1 = 0;

    /*
     * The 4 16-bit output channels are normally combined in the analog domain
     * after the YAC512 DAC outputs. Here we'll just add digitally.
     */
    always_ff @(posedge clk) begin
        sample_valid_opl3_p1 <= channel_valid;
        sample_opl3_l_p1 <= (channel_a + channel_c) <<< DAC_LEFT_SHIFT;
        sample_opl3_r_p1 <= (channel_b + channel_d) <<< DAC_LEFT_SHIFT;
    end

    generate
    if (INSTANTIATE_SAMPLE_SYNC_TO_CPU_CLK) begin
        logic sample_valid_cpu_p0;
        logic sample_valid_cpu_p1 = 0;

        synchronizer channel_valid_sync (
            .clk(clk_host),
            .in(sample_valid_opl3_p1),
            .out(sample_valid_cpu_p0)
        );

        /*
        * OPL3 channels are latched and held on channel_valid for a full sample period, so we only need to
        * synchronize the channel_valid bit and use to latch samples into cpu clock domain
        */
        always_ff @(posedge clk_host) begin
            sample_valid_cpu_p1 <= sample_valid_cpu_p0;

            if (sample_valid_cpu_p0) begin
                sample_l <= sample_opl3_l_p1;
                sample_r <= sample_opl3_r_p1;
            end

            sample_valid <= sample_valid_cpu_p0 && !sample_valid_cpu_p1;
        end
    end
    else
        always_comb begin
            sample_valid = sample_valid_opl3_p1;
            sample_l = sample_opl3_l_p1;
            sample_r = sample_opl3_r_p1;
        end
    endgenerate
endmodule
`default_nettype wire