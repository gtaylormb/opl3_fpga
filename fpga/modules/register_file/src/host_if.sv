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
    output wire [REG_FILE_DATA_WIDTH-1:0] opl3_reg [NUM_BANKS][NUM_REGISTERS_PER_BANK] = '{default: 0},
    input wire [REG_FILE_DATA_WIDTH-1:0] status,
);
    logic cs_p1 = 0;
    logic cs_p2 = 0;
    logic rd_p1 = 0;
    logic wr_p1 = 0;
    logic [1:0] address_p1 = 0;
    logic [REG_FILE_DATA_WIDTH-1:0] din_p1;
    logic cs_latched = 0;
    logic rd_latched = 0;
    logic wr_latched = 0;
    logic [1:0] address_latched = 0;
    logic [REG_FILE_DATA_WIDTH-1:0] din_latched = 0;
    logic cs_opl3;
    logic ack_host;
    logic opl3_bank = 0;
    logic [REG_FILE_DATA_WIDTH-1:0] opl3_address = 0;
    logic [REG_FILE_DATA_WIDTH-1:0] dout_opl3 = 0;

    always_ff @(posedge clk_host) begin
        cs_p1 <= !cs_n;
        cs_p2 <= cs_p1;
        rd_p1 <= !rd_n;
        wr_p1 <= !wr_n;
        address_p1 <= address;
        din_p1 <= din;

        if (cs_p1 && !cs_p2 && !cs_latched) begin
            cs_latched <= 1;
            rd_latched <= rd_p1;
            wr_latched <= wr_p1;
            address_latched <= address_p1;
            din_latched <= din_p1;
        end

        if (ack_host)
            cs_latched <= 0;

        if (!ic_n) begin
            cs_latched <= 0;
            rd_latched <= 0;
            wr_latched <= 0;
            address_latched <= 0;
            din_latched <= 0;
        end
    end

    synchronizer cs_sync (
        .clk,
        .in(cs_latched),
        .out(cs_opl3)
    );

    synchronizer ack_sync (
        .clk(clk_host),
        .in(cs_opl3),
        .out(ack_host)
    );

    always_ff @(posedge clk) begin
        if (cs_opl3)
            case ({rd_latched, wr_latched, address_latched[0]})
            'b010: begin // address write mode
                opl3_bank <= address_latched[1];
                opl3_address <= din;
            end
            'b011: // data write mode
                opl3_reg[opl3_bank] <= din;
            'b100: // status read mode
                dout_opl3 <= status;
            endcase

        if (reset) begin
            opl3_bank <= 0;
            opl3_address <= 0;
            opl3_reg <= '{default: 0};
            dout_opl3 <= 0;
        end
    end

    // bits do not need to be coherant, can use synchronizer
    synchronizer dout_sync (
        .clk(clk_host),
        .in(dout_opl3),
        .out(dout)
    );
endmodule
`default_nettype wire