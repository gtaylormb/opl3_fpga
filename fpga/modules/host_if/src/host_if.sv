/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: host_if.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 1 April 2024
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   1 April 2024    Greg Taylor
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

module host_if
    import opl3_pkg::*;
(
    input wire clk, // opl3 clk
    input wire reset,
    input wire clk_host,
    input wire ic_n, // clk_host reset
    input wire cs_n,
    input wire rd_n,
    input wire wr_n,
    input wire [1:0] address,
    input wire [REG_FILE_DATA_WIDTH-1:0] din,
    output logic [REG_FILE_DATA_WIDTH-1:0] dout = 0,
    output opl3_reg_wr_t opl3_reg_wr = 0,
    input wire [REG_FILE_DATA_WIDTH-1:0] status,
    output logic force_timer_overflow
);
    logic cs_p1_n = 1;
    logic wr_p1_n = 1;
    logic [1:0] address_p1 = 0;
    logic [REG_FILE_DATA_WIDTH-1:0] din_p1 = 0;
    logic opl3_fifo_empty;
    logic [1:0] opl3_address;
    logic [REG_FILE_DATA_WIDTH-1:0] opl3_data;
    logic wr_p1;
    logic wr_p2 = 0;
    logic [REG_FILE_DATA_WIDTH-1:0] host_status;
    logic [REG_FILE_DATA_WIDTH-1:0] host_status_p1 = 0;

    // relax timing on clk_host
    always_ff @(posedge clk_host) begin
        cs_p1_n <= cs_n;
        wr_p1_n <= wr_n;
        address_p1 <= address;
        din_p1 <= din;
        wr_p2 <= wr_p1;
    end

    always_comb wr_p1 = !cs_p1_n && !wr_p1_n;

    afifo #(
        .LGFIFO(6), // use at least 6 to get inferred into BRAM. Increase in ALMs at lower depths
        .WIDTH(2 + REG_FILE_DATA_WIDTH) // address + data
    ) afifo (
		.i_wclk(clk_host),
		.i_wr_reset_n(ic_n),
		.i_wr(wr_p1 && !wr_p2),
		.i_wr_data({address_p1, din_p1}),
		.o_wr_full(),
		.i_rclk(clk),
		.i_rd_reset_n(!reset),
		.i_rd(!opl3_fifo_empty),
		.o_rd_data({opl3_address, opl3_data}),
		.o_rd_empty(opl3_fifo_empty)
	);

    always_ff @(posedge clk) begin
        opl3_reg_wr.valid <= 0;

        if (!opl3_fifo_empty)
            if (!opl3_address[0]) begin // address write mode
                opl3_reg_wr.bank_num <= opl3_address[1];
                opl3_reg_wr.address <= opl3_data;
            end
            else begin                  // data write mode
                opl3_reg_wr.data <= opl3_data;
                opl3_reg_wr.valid <= 1;
            end

        if (reset)
            opl3_reg_wr <= 0;
    end

    // bits do not need to be coherant, can use synchronizers
    synchronizer #(
        .DATA_WIDTH(REG_FILE_DATA_WIDTH)
    ) dout_sync (
        .clk(clk_host),
        .in(status),
        .out(host_status)
    );

    always_ff @(posedge clk_host)
        host_status_p1 <= host_status;

    // Doom DMXOPTION=-opl3-phase detection routine specifically reads address 'b10 to see if it's all ones
    // Decompiled routine provided by Never_Again at https://www.vogons.org/viewtopic.php?f=7&t=100285
    always_comb
        dout = address_p1 == 0 ? host_status_p1 : '1;

    generate
    if (INSTANTIATE_TIMERS)
        trick_sw_detection trick_sw_detection (
            .*
        );
    else
        always_comb force_timer_overflow = 0;
    endgenerate

endmodule
`default_nettype wire