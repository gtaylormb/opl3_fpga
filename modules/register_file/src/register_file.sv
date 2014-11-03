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
#   SVN Identification
#   $Id$
#******************************************************************************/
`timescale 1ns / 1ps
`default_nettype none  // disable implicit net type declarations

import opl3_pkg::*;

module register_file (
	input wire clk,
    input wire cs,
    input wire rd,
    input wire wr,
    input wire bank_select, // A1
    input wire [REG_FILE_ADDRESS_WIDTH-1:0] address,
    input wire [REG_FILE_DATA_WIDTH-1:0] data_in,
    output logic [REG_FILE_DATA_WIDTH-1:0] data_out = 0,
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
    output logic cnt [2][9]
);           
    genvar i;
    generate
    for (i = 0; i < 'h16; i++) begin
        always_ff @(posedge clk)
            if (cs && wr)
                unique case (address)
                'h2: if (!bank_select) timer1 <= data_in;
                'h3: if (!bank_select) timer2 <= data_in;
                'h4:
                    if (!bank_select) begin
                        irq_rst <= data_in[7];
                        mt1     <= data_in[6];
                        mt2     <= data_in[5];
                        st2     <= data_in[1];
                        st1     <= data_in[0];
                    end
                    else
                        connection_sel <= data_in[REG_CONNECTION_SEL_WIDTH-1:0];
                'h5: if (bank_select) is_new <= data_in[0];
                'h8: if (!bank_select) nts <= data_in[6];                                                       
                'h20 + i:                    
                    if (i < 6) begin
                        am[bank_select][i]   <= data_in[7];
                        vib[bank_select][i]  <= data_in[6];
                        egt[bank_select][i]  <= data_in[5];
                        ksr[bank_select][i]  <= data_in[4];
                        mult[bank_select][i] <= data_in[3:0];
                    end
                    else if (i >= 8 && i < 14) begin
                        am[bank_select][i-2]   <= data_in[7];
                        vib[bank_select][i-2]  <= data_in[6];
                        egt[bank_select][i-2]  <= data_in[5];
                        ksr[bank_select][i-2]  <= data_in[4];
                        mult[bank_select][i-2] <= data_in[3:0];
                    end
                    else if (i >= 16) begin
                        am[bank_select][i-4]   <= data_in[7];
                        vib[bank_select][i-4]  <= data_in[6];
                        egt[bank_select][i-4]  <= data_in[5];
                        ksr[bank_select][i-4]  <= data_in[4];
                        mult[bank_select][i-4] <= data_in[3:0];                    
                    end
                'h40 + i:
                    if (i < 6) begin
                        ksl[bank_select][i] <= data_in[7:6];
                        tl[bank_select][i]  <= data_in[5:0];
                    end
                    else if (i >= 8 && i < 14) begin
                        ksl[bank_select][i-2] <= data_in[7:6];
                        tl[bank_select][i-2]  <= data_in[5:0];
                    end
                    else if (i >= 16) begin
                        ksl[bank_select][i-4] <= data_in[7:6];
                        tl[bank_select][i-4]  <= data_in[5:0];                             
                    end               
                'h60 + i:
                    if (i < 6) begin
                        ar[bank_select][i] <= data_in[7:4];
                        dr[bank_select][i] <= data_in[3:0];
                    end
                    else if (i >= 8 && i < 14) begin
                        ar[bank_select][i-2] <= data_in[7:4];
                        dr[bank_select][i-2] <= data_in[3:0];
                    end
                    else if (i >= 16) begin
                        ar[bank_select][i-4] <= data_in[7:4];
                        dr[bank_select][i-4] <= data_in[3:0];                                                      
                    end
                'h80 + i:
                    if (i < 6) begin
                        sl[bank_select][i] <= data_in[7:4];
                        rr[bank_select][i] <= data_in[3:0];
                    end
                    else if (i >= 8 && i < 14) begin
                        sl[bank_select][i-2] <= data_in[7:4];
                        rr[bank_select][i-2] <= data_in[3:0];
                    end
                    else if (i >= 16) begin
                        sl[bank_select][i-4] <= data_in[7:4];
                        rr[bank_select][i-4] <= data_in[3:0];                                                      
                    end
                'hA0 + i:
                    if (i < 9)
                        fnum[bank_select][i][7:0] <= data_in;
                'hB0 + i:
                    if (i < 9) begin
                        kon[bank_select][i]       <= data_in[5];
                        block[bank_select][i]     <= data_in[4:2];
                        fnum[bank_select][i][9:8] <= data_in[1:0];
                    end
                    else if (i == 'hD && !bank_select) begin // address 'hBD
                        dam <= data_in[7];
                        dvb <= data_in[6];
                        ryt <= data_in[5];
                        bd  <= data_in[4];
                        sd  <= data_in[3];
                        tom <= data_in[2];
                        tc  <= data_in[1];
                        hh  <= data_in[0];
                    end                                              
                'hC0 + i:
                    if (i < 9) begin
                        chd[bank_select][i] <= data_in[7];
                        chc[bank_select][i] <= data_in[6];
                        chb[bank_select][i] <= data_in[5];
                        cha[bank_select][i] <= data_in[4];
                        fb[bank_select][i]  <= data_in[3:1];
                        cnt[bank_select][i] <= data_in[0];
                    end
                'hE0 + i:
                    if (i < 6)
                        ws[bank_select][i] <= data_in[2:0];
                    else if (i >= 8 && i < 14)
                        ws[bank_select][i-2] <= data_in[2:0];
                    else if (i >= 16)
                        ws[bank_select][i-4] <= data_in[2:0];
                default:;                    
                endcase
        
        always_ff @(posedge clk)
            if (cs && rd)
                unique case (address)
                'h2: data_out <= !bank_select ? timer1 : 0;
                'h3: data_out <= !bank_select ? timer2 : 0;
                'h4:
                    if (!bank_select) begin
                        data_out[7] <= irq_rst;
                        data_out[6] <= mt1;
                        data_out[5] <= mt2;
                        data_out[4:2] <= 0;
                        data_out[1] <= st2;
                        data_out[0] <= st1;
                    end
                    else
                        data_out <= 8'hFF;
                'h5: begin
                    data_out[0] <= bank_select ? is_new : 0;
                    data_out[7:1] <= 0;
                end
                'h8: begin
                    data_out[6] <= !bank_select ? nts : 0;
                    data_out[7] <= 0;
                    data_out[5:0] <= 0;
                end
                'h20 + i:
                    if (i < 6) begin
                        data_out[7] <= am[bank_select][i];
                        data_out[6] <= vib[bank_select][i];
                        data_out[5] <= egt[bank_select][i];
                        data_out[4] <= ksr[bank_select][i];
                        data_out[3:0] <= mult[bank_select][i];
                    end
                    else if (i >= 8 && i < 14) begin
                        data_out[7] <= am[bank_select][i-2];
                        data_out[6] <= vib[bank_select][i-2];
                        data_out[5] <= egt[bank_select][i-2];
                        data_out[4] <= ksr[bank_select][i-2];
                        data_out[3:0] <= mult[bank_select][i-2];
                    end
                    else if (i >= 16) begin
                        data_out[7] <= am[bank_select][i-4];
                        data_out[6] <= vib[bank_select][i-4];
                        data_out[5] <= egt[bank_select][i-4];
                        data_out[4] <= ksr[bank_select][i-4];
                        data_out[3:0] <= mult[bank_select][i-4];
                    end
                    else
                        data_out <= 8'hFF;
                'h40 + i:
                    if (i < 6) begin
                        data_out[7:6] <= ksl[bank_select][i];
                        data_out[5:0] <= tl[bank_select][i];
                    end
                    else if (i >= 8 && i < 14) begin
                        data_out[7:6] <= ksl[bank_select][i-2];
                        data_out[5:0] <= tl[bank_select][i-2];
                    end
                    else if (i >= 16) begin
                        data_out[7:6] <= ksl[bank_select][i-4];
                        data_out[5:0] <= tl[bank_select][i-4];
                    end
                    else
                        data_out <= 8'hFF;
                'h60 + i:
                    if (i < 6) begin
                        data_out[7:4] <= ar[bank_select][i];
                        data_out[3:0] <= dr[bank_select][i];
                    end
                    else if (i >= 8 && i < 14) begin
                        data_out[7:4] <= ar[bank_select][i-2];
                        data_out[3:0] <= dr[bank_select][i-2];
                    end
                    else if (i >= 16) begin
                        data_out[7:4] <= ar[bank_select][i-4];
                        data_out[3:0] <= dr[bank_select][i-4];
                    end
                    else
                        data_out <= 8'hFF;
                'h80 + i:
                    if (i < 6) begin
                        data_out[7:4] <= sl[bank_select][i];
                        data_out[3:0] <= rr[bank_select][i];
                    end
                    else if (i >= 8 && i < 14) begin
                        data_out[7:4] <= sl[bank_select][i-2];
                        data_out[3:0] <= rr[bank_select][i-2];
                    end
                    else if (i >= 16) begin
                        data_out[7:4] <= sl[bank_select][i-4];
                        data_out[3:0] <= rr[bank_select][i-4];
                    end
                    else
                        data_out <= 8'hFF;
                'hA0 + i:
                    if (i < 9)
                        data_out <= fnum[bank_select][i][7:0];
                    else
                        data_out <= 8'hFF;
                'hB0 + i:
                    if (i < 9) begin
                        data_out[7:6] <= 0;
                        data_out[5] <= kon[bank_select][i];
                        data_out[4:2] <= block[bank_select][i];
                        data_out[1:0] <= fnum[bank_select][i][9:8];
                    end
                    else if (i == 'hD && !bank_select) begin // address 'hBD
                        data_out[7] <= dam;
                        data_out[6] <= dvb;
                        data_out[5] <= ryt;
                        data_out[4] <= bd;
                        data_out[3] <= sd;
                        data_out[2] <= tom;
                        data_out[1] <= tc;
                        data_out[0] <= hh;
                    end
                    else
                        data_out <= 8'hFF;
                'hC0 + i:
                    if (i < 9) begin
                        data_out[7] <= chd[bank_select][i];
                        data_out[6] <= chc[bank_select][i];
                        data_out[5] <= chb[bank_select][i];
                        data_out[4] <= cha[bank_select][i];
                        data_out[3:1] <= fb[bank_select][i];
                        data_out[0] <= cnt[bank_select][i];
                    end
                    else
                        data_out <= 8'hFF;
                'hE0 + i:
                    if (i < 6) begin
                        data_out[7:3] <= 0;
                        data_out[2:0] <= ws[bank_select][i];
                    end                         
                    else if (i >= 8 && i < 14) begin
                        data_out[7:3] <= 0;
                        data_out[2:0] <= ws[bank_select][i-2];
                    end                         
                    else if (i >= 16) begin
                        data_out[7:3] <= 0;
                        data_out[2:0] <= ws[bank_select][i-4];
                    end                         
                    else
                        data_out <= 8'hFF;
                default:;
                endcase
    end                    
    endgenerate        
    
endmodule
`default_nettype wire  // re-enable implicit net type declarations