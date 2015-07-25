/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: register_file_axi.sv
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
`default_nettype none  // disable implicit net type declarations

import opl3_pkg::*;

module register_file_axi #(
    parameter integer C_S_AXI_DATA_WIDTH = 0,
    parameter NUM_AXI_REGISTERS = 0
) (
    input wire clk,
    input wire [7:0] slv8_reg[NUM_AXI_REGISTERS*4],        
    output logic [REG_TIMER_WIDTH-1:0] timer1,
    output logic [REG_TIMER_WIDTH-1:0] timer2,
    output logic irq_rst,
    output logic mt1,
    output logic mt2,
    output logic st1,
    output logic st2,
    output logic [REG_CONNECTION_SEL_WIDTH-1:0] connection_sel,
    output logic is_new,
    output logic nts,                     // keyboard split selection     
    output logic [REG_FNUM_WIDTH-1:0] fnum [2][9],
    output logic [REG_MULT_WIDTH-1:0] mult [2][18],
    output logic [REG_BLOCK_WIDTH-1:0] block [2][9],
    output logic [REG_WS_WIDTH-1:0] ws [2][18],
    output logic vib [2][18],
    output logic dvb,
    output logic kon [2][9],  
    output logic [REG_ENV_WIDTH-1:0] ar [2][18], // attack rate
    output logic [REG_ENV_WIDTH-1:0] dr [2][18], // decay rate
    output logic [REG_ENV_WIDTH-1:0] sl [2][18], // sustain level
    output logic [REG_ENV_WIDTH-1:0] rr [2][18], // release rate
    output logic [REG_TL_WIDTH-1:0] tl [2][18],  // total level
    output logic ksr [2][18],                    // key scale rate
    output logic [REG_KSL_WIDTH-1:0] ksl [2][18], // key scale level
    output logic egt [2][18],                     // envelope type
    output logic am [2][18],                      // amplitude modulation (tremolo)
    output logic dam,                             // depth of tremolo
    output logic ryt,
    output logic bd,
    output logic sd,
    output logic tom,
    output logic tc,
    output logic hh,
    output logic cha [2][9],
    output logic chb [2][9],
    output logic chc [2][9],
    output logic chd [2][9],
    output logic [REG_FB_WIDTH-1:0] fb [2][9],
    output logic cnt [2][9],
    output logic ac_mute_n
);  
    localparam BANK2_OFFSET = 256;
    
    /*
     * Registers that are not specific to a particular bank
     */
    always_comb begin
        timer1 = slv8_reg[2];
        timer2 = slv8_reg[3];
        
        ac_mute_n = slv8_reg[BANK2_OFFSET+2][0];
        
        irq_rst = slv8_reg[4][7];
        mt1 = slv8_reg[4][6];
        mt2 = slv8_reg[4][5];
        st2 = slv8_reg[4][1];
        st1 = slv8_reg[4][0];
        connection_sel = slv8_reg[BANK2_OFFSET+4][REG_CONNECTION_SEL_WIDTH-1:0];
        
        is_new = slv8_reg[BANK2_OFFSET+5][0];
        nts = slv8_reg[8][6];
        
        dam <= slv8_reg['hBD][7];
        dvb <= slv8_reg['hBD][6];
        ryt <= slv8_reg['hBD][5];
        bd  <= slv8_reg['hBD][4];
        sd  <= slv8_reg['hBD][3];
        tom <= slv8_reg['hBD][2];
        tc  <= slv8_reg['hBD][1];
        hh  <= slv8_reg['hBD][0];                               
    end
           
    genvar bank;
    genvar i;
    generate
    for (bank = 0; bank < 2; bank++) begin
        for (i = 0; i < 6; i++)
            always_comb begin
                am[bank][i]   = slv8_reg['h20+i+bank*BANK2_OFFSET][7];
                vib[bank][i]  = slv8_reg['h20+i+bank*BANK2_OFFSET][6];
                egt[bank][i]  = slv8_reg['h20+i+bank*BANK2_OFFSET][5];
                ksr[bank][i]  = slv8_reg['h20+i+bank*BANK2_OFFSET][4];
                mult[bank][i] = slv8_reg['h20+i+bank*BANK2_OFFSET][3:0];
                    
                ksl[bank][i] = slv8_reg['h40+i+bank*BANK2_OFFSET][7:6];
                tl[bank][i]  = slv8_reg['h40+i+bank*BANK2_OFFSET][5:0];
                    
                ar[bank][i] = slv8_reg['h60+i+bank*BANK2_OFFSET][7:4];
                dr[bank][i] = slv8_reg['h60+i+bank*BANK2_OFFSET][3:0]; 
                    
                sl[bank][i] = slv8_reg['h80+i+bank*BANK2_OFFSET][7:4];
                rr[bank][i] = slv8_reg['h80+i+bank*BANK2_OFFSET][3:0];
                    
                ws[bank][i] = slv8_reg['hE0+i+bank*BANK2_OFFSET][2:0];                   
            end
        
        for (i = 8; i < 14; i++)
            always_comb begin            
                am[bank][i-2]   = slv8_reg['h20+i+bank*BANK2_OFFSET][7];
                vib[bank][i-2]  = slv8_reg['h20+i+bank*BANK2_OFFSET][6];
                egt[bank][i-2]  = slv8_reg['h20+i+bank*BANK2_OFFSET][5];
                ksr[bank][i-2]  = slv8_reg['h20+i+bank*BANK2_OFFSET][4];
                mult[bank][i-2] = slv8_reg['h20+i+bank*BANK2_OFFSET][3:0];
                        
                ksl[bank][i-2] = slv8_reg['h40+i+bank*BANK2_OFFSET][7:6];
                tl[bank][i-2]  = slv8_reg['h40+i+bank*BANK2_OFFSET][5:0];
                        
                ar[bank][i-2] = slv8_reg['h60+i+bank*BANK2_OFFSET][7:4];
                dr[bank][i-2] = slv8_reg['h60+i+bank*BANK2_OFFSET][3:0];
                        
                sl[bank][i-2] = slv8_reg['h80+i+bank*BANK2_OFFSET][7:4];
                rr[bank][i-2] = slv8_reg['h80+i+bank*BANK2_OFFSET][3:0];                      
                        
                ws[bank][i-2] = slv8_reg['hE0+i+bank*BANK2_OFFSET][2:0];                 
            end
        
        for (i = 16; i < 22; i++)
            always_comb begin            
                am[bank][i-4]   = slv8_reg['h20+i+bank*BANK2_OFFSET][7];
                vib[bank][i-4]  = slv8_reg['h20+i+bank*BANK2_OFFSET][6];
                egt[bank][i-4]  = slv8_reg['h20+i+bank*BANK2_OFFSET][5];
                ksr[bank][i-4]  = slv8_reg['h20+i+bank*BANK2_OFFSET][4];
                mult[bank][i-4] = slv8_reg['h20+i+bank*BANK2_OFFSET][3:0];
                        
                ksl[bank][i-4] = slv8_reg['h40+i+bank*BANK2_OFFSET][7:6];
                tl[bank][i-4]  = slv8_reg['h40+i+bank*BANK2_OFFSET][5:0];
                        
                ar[bank][i-4] = slv8_reg['h60+i+bank*BANK2_OFFSET][7:4];
                dr[bank][i-4] = slv8_reg['h60+i+bank*BANK2_OFFSET][3:0];
                        
                sl[bank][i-4] = slv8_reg['h80+i+bank*BANK2_OFFSET][7:4];
                rr[bank][i-4] = slv8_reg['h80+i+bank*BANK2_OFFSET][3:0];
                        
                ws[bank][i-4] = slv8_reg['hE0+i+bank*BANK2_OFFSET][2:0];                 
            end
        
        for (i = 0; i < 9; i++)
            always_comb begin
                fnum[bank][i][7:0] = slv8_reg['hA0+i+bank*BANK2_OFFSET];
                
                kon[bank][i]       = slv8_reg['hB0+i+bank*BANK2_OFFSET][5];
                block[bank][i]     = slv8_reg['hB0+i+bank*BANK2_OFFSET][4:2];
                fnum[bank][i][9:8] = slv8_reg['hB0+i+bank*BANK2_OFFSET][1:0];
                
                chd[bank][i] = slv8_reg['hC0+i+bank*BANK2_OFFSET][7];
                chc[bank][i] = slv8_reg['hC0+i+bank*BANK2_OFFSET][6];
                chb[bank][i] = slv8_reg['hC0+i+bank*BANK2_OFFSET][5];
                cha[bank][i] = slv8_reg['hC0+i+bank*BANK2_OFFSET][4];
                fb[bank][i]  = slv8_reg['hC0+i+bank*BANK2_OFFSET][3:1];
                cnt[bank][i] = slv8_reg['hC0+i+bank*BANK2_OFFSET][0];                                
            end
    end                
    endgenerate   
endmodule
`default_nettype wire  // re-enable implicit net type declarations