/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: register_file.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 2 Nov 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   2 Nov 2014    Greg Taylor
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

module register_file
    import opl3_pkg::*;
(
    input wire clk,
    input var opl3_reg_wr_t opl3_reg_wr,
    input wire irq,
    input wire ft1,
    input wire ft2,
    output logic [REG_TIMER_WIDTH-1:0] timer1 = 0,
    output logic [REG_TIMER_WIDTH-1:0] timer2 = 0,
    output logic irq_rst = 0,
    output logic mt1 = 0,
    output logic mt2 = 0,
    output logic st1 = 0,
    output logic st2 = 0,
    output logic [REG_CONNECTION_SEL_WIDTH-1:0] connection_sel = 0,
    output logic is_new = 0,
    output logic nts = 0,                     // keyboard split selection
    output logic dvb = 0,
    output logic dam = 0,                             // depth of tremolo
    output logic ryt = 0,
    output logic bd = 0,
    output logic sd = 0,
    output logic tom = 0,
    output logic tc = 0,
    output logic hh = 0,
    output logic cha [2][9],
    output logic chb [2][9],
    output logic chc [2][9],
    output logic chd [2][9],
    output logic cnt [2][9],
    output logic [REG_FILE_DATA_WIDTH-1:0] status
);
    /*
     * Registers that are specific to a particular bank
     */
    always_ff @(posedge clk)
        if (opl3_reg_wr.valid) begin
            if (opl3_reg_wr.bank_num == 0 && opl3_reg_wr.address == 2)
                timer1 <= opl3_reg_wr.data;

            if (opl3_reg_wr.bank_num == 0 && opl3_reg_wr.address == 3)
                timer2 <= opl3_reg_wr.data;

            if (opl3_reg_wr.bank_num == 0 && opl3_reg_wr.address == 4) begin
                irq_rst <= opl3_reg_wr.data[7];
                mt1 <= opl3_reg_wr.data[6];
                mt2 <= opl3_reg_wr.data[5];
                st2 <= opl3_reg_wr.data[1];
                st1 <= opl3_reg_wr.data[0];
            end

            if (opl3_reg_wr.bank_num == 1 && opl3_reg_wr.address == 4)
                connection_sel <= opl3_reg_wr.data[REG_CONNECTION_SEL_WIDTH-1:0];

            if (opl3_reg_wr.bank_num == 1 && opl3_reg_wr.address == 5)
                is_new <= opl3_reg_wr.data[0];

            if (opl3_reg_wr.bank_num == 0 && opl3_reg_wr.address == 8)
                nts <= opl3_reg_wr.data[6];

            if (opl3_reg_wr.bank_num == 0 && opl3_reg_wr.address == 'hBD) begin
                dam <= opl3_reg_wr.data[7];
                dvb <= opl3_reg_wr.data[6];
                ryt <= opl3_reg_wr.data[5];
                bd  <= opl3_reg_wr.data[4];
                sd  <= opl3_reg_wr.data[3];
                tom <= opl3_reg_wr.data[2];
                tc  <= opl3_reg_wr.data[1];
                hh  <= opl3_reg_wr.data[0];
            end
        end

    always_ff @(posedge clk)
        if (opl3_reg_wr.valid && opl3_reg_wr.address >= 'hC0 && opl3_reg_wr.address <= 'hC8) begin
            chd[opl3_reg_wr.bank_num][opl3_reg_wr.address - 'hC0] = opl3_reg_wr.data[7];
            chc[opl3_reg_wr.bank_num][opl3_reg_wr.address - 'hC0] = opl3_reg_wr.data[6];
            chb[opl3_reg_wr.bank_num][opl3_reg_wr.address - 'hC0] = opl3_reg_wr.data[5];
            cha[opl3_reg_wr.bank_num][opl3_reg_wr.address - 'hC0] = opl3_reg_wr.data[4];

            cnt[opl3_reg_wr.bank_num][opl3_reg_wr.address - 'hC0] = opl3_reg_wr.data[0];
        end

    always_comb begin
        status = 0;
        status[7] = irq;
        status[6] = ft1;
        status[5] = ft2;
    end
endmodule
`default_nettype wire