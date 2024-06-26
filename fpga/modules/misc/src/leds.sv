/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: leds.sv
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

module leds
    import opl3_pkg::*;
(
    input wire clk,
    input var opl3_reg_wr_t opl3_reg_wr,
    output logic [NUM_LEDS-1:0] led = 0
);
    generate
    if (NUM_LEDS == 0)
        always_comb led = '0;
    else begin
        genvar i;
        for (i = 0; i < NUM_LEDS; ++i) begin: led_gen
            always_ff @(posedge clk)
                if (opl3_reg_wr.valid && opl3_reg_wr.bank_num == 0 && opl3_reg_wr.address == 'hB0 + i)
                    led[i] <= opl3_reg_wr.data[5]; // kon bit
        end
    end
    endgenerate
endmodule
`default_nettype wire
