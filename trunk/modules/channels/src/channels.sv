/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: channels.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 7 Nov 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   7 Nov 2014    Greg Taylor
#       Initial version
#
#   SVN Identification
#   $Id$
#******************************************************************************/
`timescale 1ns / 1ps
`default_nettype none  // disable implicit net type declarations

import opl3_pkg::*;

module channels (
	input wire clk,
	input wire sample_clk_en,
    input wire [REG_CONNECTION_SEL_WIDTH-1:0] connection_sel,
    input wire is_new,
    input wire nts,                     // keyboard split selection     
    input wire [REG_FNUM_WIDTH-1:0] fnum [2][9],
    input wire [REG_MULT_WIDTH-1:0] mult [2][18],
    input wire [REG_BLOCK_WIDTH-1:0] block [2][9],
    input wire [REG_WS_WIDTH-1:0] ws [2][18],
    input wire vib [2][18],
    input wire dvb,
    input wire kon [2][9],  
    input wire [REG_ENV_WIDTH-1:0] ar [2][18], // attack rate
    input wire [REG_ENV_WIDTH-1:0] dr [2][18], // decay rate
    input wire [REG_ENV_WIDTH-1:0] sl [2][18], // sustain level
    input wire [REG_ENV_WIDTH-1:0] rr [2][18], // release rate
    input wire [REG_TL_WIDTH-1:0] tl [2][18],  // total level
    input wire ksr [2][18],                    // key scale rate
    input wire [REG_KSL_WIDTH-1:0] ksl [2][18], // key scale level
    input wire egt [2][18],                     // envelope type
    input wire am [2][18],                      // amplitude modulation (tremolo)
    input wire dam,                             // depth of tremolo
    input wire ryt,
    input wire bd,
    input wire sd,
    input wire tom,
    input wire tc,
    input wire hh,
    input wire cha [2][9],
    input wire chb [2][9],
    input wire chc [2][9],
    input wire chd [2][9],
    input wire [REG_FB_WIDTH-1:0] fb [2][9],
    input wire cnt [2][9],
    output logic signed [SAMPLE_WIDTH-1:0] channel_a = 0,
    output logic signed [SAMPLE_WIDTH-1:0] channel_b = 0,
    output logic signed [SAMPLE_WIDTH-1:0] channel_c = 0,
    output logic signed [SAMPLE_WIDTH-1:0] channel_d = 0
);  
    localparam NUM_CHANNEL_ADD_STATES = 19; // 18 channels + idle state
    
    logic signed [SAMPLE_WIDTH-1:0] channel_2_op [2][9];
    logic signed [SAMPLE_WIDTH-1:0] channel_4_op [2][3];
    logic [$clog2(NUM_CHANNEL_ADD_STATES)-1:0] state = 0;
    logic [$clog2(NUM_CHANNEL_ADD_STATES)-1:0] next_state;
    logic signed [OP_OUT_WIDTH-1:0] operator_out [NUM_BANKS][NUM_OPERATORS_PER_BANK];
  
    genvar i, j;
    generate            
    for (i = 0; i < 2; i++) begin
        /*
         * 2 operator channel output connections
         */
        always_comb begin
            channel_2_op[i][0] = cnt[i][0] ? operator_out[i][0] + operator_out[i][3]
                : operator_out[i][3];
            channel_2_op[i][1] = cnt[i][1] ? operator_out[i][1] + operator_out[i][4]
                : operator_out[i][4];
            channel_2_op[i][2] = cnt[i][2] ? operator_out[i][2] + operator_out[i][5]
                : operator_out[i][5];        
            channel_2_op[i][3] = cnt[i][3] ? operator_out[i][6] + operator_out[i][9]
                : operator_out[i][9];
            channel_2_op[i][4] = cnt[i][4] ? operator_out[i][7] + operator_out[i][10]
                : operator_out[i][10];
            channel_2_op[i][5] = cnt[i][5] ? operator_out[i][8] + operator_out[i][11]
                : operator_out[i][11];        
            channel_2_op[i][6] = cnt[i][6] ? operator_out[i][12] + operator_out[i][15]
                : operator_out[i][15];
            channel_2_op[i][7] = cnt[i][7] ? operator_out[i][13] + operator_out[i][16]
                : operator_out[i][16];
            channel_2_op[i][8] = cnt[i][8] ? operator_out[i][14] + operator_out[i][17]
                : operator_out[i][17];
        end
    
        /*
         * 4 operator channel output connections
         */
        always_comb begin
            unique case ({cnt[i][0], cnt[i][3]})
            'b00: channel_4_op[i][0] = operator_out[i][9];
            'b01: channel_4_op[i][0] = operator_out[i][3] + operator_out[i][9];
            'b10: channel_4_op[i][0] = operator_out[i][0] + operator_out[i][9];
            'b11: channel_4_op[i][0] = operator_out[i][0] + operator_out[i][6] + operator_out[i][9];
            endcase
                
            unique case ({cnt[i][1], cnt[i][4]})
            'b00: channel_4_op[i][1] = operator_out[i][10];
            'b01: channel_4_op[i][1] = operator_out[i][4] + operator_out[i][10];
            'b10: channel_4_op[i][1] = operator_out[i][1] + operator_out[i][10];
            'b11: channel_4_op[i][1] = operator_out[i][1] + operator_out[i][7] + operator_out[i][10];
            endcase
                
            unique case ({cnt[i][2], cnt[i][5]})
            'b00: channel_4_op[i][2] = operator_out[i][11];
            'b01: channel_4_op[i][2] = operator_out[i][5] + operator_out[i][11];
            'b10: channel_4_op[i][2] = operator_out[i][2] + operator_out[i][11];
            'b11: channel_4_op[i][2] = operator_out[i][2] + operator_out[i][8] + operator_out[i][11];
            endcase 
        end
    end        
    
    always_ff @(posedge clk)
        state <= next_state;
    
    /* 
     * State 0 is idle, states 1-18 represent that channel 
     * is_new specifies OPL3 mode vs. OPL2 mode. Only 9 channels in OPL2.
     */
    always_comb
        if (state == 0)
            next_state = sample_clk_en ? 1 : 0;
        else if ((is_new && state == 18) || (!is_new && state == 9))
            next_state = 0;
        else
            next_state = state + 1;
        
    always_ff @(posedge clk)
        unique case (state)
        0: channel_a <= 0;
        1: if (cha[0][0])
            channel_a <= connection_sel[0] ? channel_4_op[0][0] : channel_2_op[0][0];
        2: if (cha[0][1])
            channel_a <= channel_a + (connection_sel[1] ? channel_4_op[0][1] : channel_2_op[0][1]);
        3: if (cha[0][2])
            channel_a <= channel_a + (connection_sel[2] ? channel_4_op[0][2] : channel_2_op[0][2]);
        4: if (cha[0][3])
            channel_a <= channel_a + (connection_sel[0] ? 0 : channel_2_op[0][3]);
        5: if (cha[0][4])
            channel_a <= channel_a + (connection_sel[1] ? 0 : channel_2_op[0][4]);
        6: if (cha[0][5])
            channel_a <= channel_a + (connection_sel[2] ? 0 : channel_2_op[0][5]);
        7: if (cha[0][6])
            channel_a <= channel_a + channel_2_op[0][6];
        8: if (cha[0][7])
            channel_a <= channel_a + channel_2_op[0][7];
        9: if (cha[0][8])
            channel_a <= channel_a + channel_2_op[0][8];
        10: if (cha[1][0])
            channel_a <= connection_sel[3] ? channel_4_op[1][0] : channel_2_op[1][0];
        11: if (cha[1][1])
            channel_a <= channel_a + (connection_sel[4] ? channel_4_op[1][1] : channel_2_op[1][1]);
        12: if (cha[1][2])
            channel_a <= channel_a + (connection_sel[5] ? channel_4_op[1][2] : channel_2_op[1][2]);
        13: if (cha[1][3])
            channel_a <= channel_a + (connection_sel[3] ? 0 : channel_2_op[1][3]);
        14: if (cha[1][4])
            channel_a <= channel_a + (connection_sel[4] ? 0 : channel_2_op[1][4]);
        15: if (cha[1][5])
            channel_a <= channel_a + (connection_sel[5] ? 0 : channel_2_op[1][5]);
        16: if (cha[1][6])
            channel_a <= channel_a + channel_2_op[1][6];
        17: if (cha[1][7])
            channel_a <= channel_a + channel_2_op[1][7];
        18: if (cha[1][8])
            channel_a <= channel_a + channel_2_op[1][8];
        endcase
            
    always_ff @(posedge clk)
        unique case (state)
        0: channel_b <= 0;
        1: if (chb[0][0])
            channel_b <= connection_sel[0] ? channel_4_op[0][0] : channel_2_op[0][0];
        2: if (chb[0][1])
            channel_b <= channel_b + (connection_sel[1] ? channel_4_op[0][1] : channel_2_op[0][1]);
        3: if (chb[0][2])
            channel_b <= channel_b + (connection_sel[2] ? channel_4_op[0][2] : channel_2_op[0][2]);
        4: if (chb[0][3])
            channel_b <= channel_b + (connection_sel[0] ? 0 : channel_2_op[0][3]);
        5: if (chb[0][4])
            channel_b <= channel_b + (connection_sel[1] ? 0 : channel_2_op[0][4]);
        6: if (chb[0][5])
            channel_b <= channel_b + (connection_sel[2] ? 0 : channel_2_op[0][5]);
        7: if (chb[0][6])
            channel_b <= channel_b + channel_2_op[0][6];
        8: if (chb[0][7])
            channel_b <= channel_b + channel_2_op[0][7];
        9: if (chb[0][8])
            channel_b <= channel_b + channel_2_op[0][8];
        10: if (chb[1][0])
            channel_b <= connection_sel[3] ? channel_4_op[1][0] : channel_2_op[1][0];
        11: if (chb[1][1])
            channel_b <= channel_b + (connection_sel[4] ? channel_4_op[1][1] : channel_2_op[1][1]);
        12: if (chb[1][2])
            channel_b <= channel_b + (connection_sel[5] ? channel_4_op[1][2] : channel_2_op[1][2]);
        13: if (chb[1][3])
            channel_b <= channel_b + (connection_sel[3] ? 0 : channel_2_op[1][3]);
        14: if (chb[1][4])
            channel_b <= channel_b + (connection_sel[4] ? 0 : channel_2_op[1][4]);
        15: if (chb[1][5])
            channel_b <= channel_b + (connection_sel[5] ? 0 : channel_2_op[1][5]);
        16: if (chb[1][6])
            channel_b <= channel_b + channel_2_op[1][6];
        17: if (chb[1][7])
            channel_b <= channel_b + channel_2_op[1][7];
        18: if (chb[1][8])
            channel_b <= channel_b + channel_2_op[1][8];
        endcase              
            
    always_ff @(posedge clk)
        unique case (state)
        0: channel_c <= 0;
        1: if (chc[0][0])
            channel_c <= connection_sel[0] ? channel_4_op[0][0] : channel_2_op[0][0];
        2: if (chc[0][1])
            channel_c <= channel_c + (connection_sel[1] ? channel_4_op[0][1] : channel_2_op[0][1]);
        3: if (chc[0][2])
            channel_c <= channel_c + (connection_sel[2] ? channel_4_op[0][2] : channel_2_op[0][2]);
        4: if (chc[0][3])
            channel_c <= channel_c + (connection_sel[0] ? 0 : channel_2_op[0][3]);
        5: if (chc[0][4])
            channel_c <= channel_c + (connection_sel[1] ? 0 : channel_2_op[0][4]);
        6: if (chc[0][5])
            channel_c <= channel_c + (connection_sel[2] ? 0 : channel_2_op[0][5]);
        7: if (chc[0][6])
            channel_c <= channel_c + channel_2_op[0][6];
        8: if (chc[0][7])
            channel_c <= channel_c + channel_2_op[0][7];
        9: if (chc[0][8])
            channel_c <= channel_c + channel_2_op[0][8];
        10: if (chc[1][0])
            channel_c <= connection_sel[3] ? channel_4_op[1][0] : channel_2_op[1][0];
        11: if (chc[1][1])
            channel_c <= channel_c + (connection_sel[4] ? channel_4_op[1][1] : channel_2_op[1][1]);
        12: if (chc[1][2])
            channel_c <= channel_c + (connection_sel[5] ? channel_4_op[1][2] : channel_2_op[1][2]);
        13: if (chc[1][3])
            channel_c <= channel_c + (connection_sel[3] ? 0 : channel_2_op[1][3]);
        14: if (chc[1][4])
            channel_c <= channel_c + (connection_sel[4] ? 0 : channel_2_op[1][4]);
        15: if (chc[1][5])
            channel_c <= channel_c + (connection_sel[5] ? 0 : channel_2_op[1][5]);
        16: if (chc[1][6])
            channel_c <= channel_c + channel_2_op[1][6];
        17: if (chc[1][7])
            channel_c <= channel_c + channel_2_op[1][7];
        18: if (chc[1][8])
            channel_c <= channel_c + channel_2_op[1][8];
        endcase
            
    always_ff @(posedge clk)
        unique case (state)
        0: channel_d <= 0;
        1: if (chd[0][0])
            channel_d <= connection_sel[0] ? channel_4_op[0][0] : channel_2_op[0][0];
        2: if (chd[0][1])
            channel_d <= channel_d + (connection_sel[1] ? channel_4_op[0][1] : channel_2_op[0][1]);
        3: if (chd[0][2])
            channel_d <= channel_d + (connection_sel[2] ? channel_4_op[0][2] : channel_2_op[0][2]);
        4: if (chd[0][3])
            channel_d <= channel_d + (connection_sel[0] ? 0 : channel_2_op[0][3]);
        5: if (chd[0][4])
            channel_d <= channel_d + (connection_sel[1] ? 0 : channel_2_op[0][4]);
        6: if (chd[0][5])
            channel_d <= channel_d + (connection_sel[2] ? 0 : channel_2_op[0][5]);
        7: if (chd[0][6])
            channel_d <= channel_d + channel_2_op[0][6];
        8: if (chd[0][7])
            channel_d <= channel_d + channel_2_op[0][7];
        9: if (chd[0][8])
            channel_d <= channel_d + channel_2_op[0][8];
        10: if (chd[1][0])
            channel_d <= connection_sel[3] ? channel_4_op[1][0] : channel_2_op[1][0];
        11: if (chd[1][1])
            channel_d <= channel_d + (connection_sel[4] ? channel_4_op[1][1] : channel_2_op[1][1]);
        12: if (chd[1][2])
            channel_d <= channel_d + (connection_sel[5] ? channel_4_op[1][2] : channel_2_op[1][2]);
        13: if (chd[1][3])
            channel_d <= channel_d + (connection_sel[3] ? 0 : channel_2_op[1][3]);
        14: if (chd[1][4])
            channel_d <= channel_d + (connection_sel[4] ? 0 : channel_2_op[1][4]);
        15: if (chd[1][5])
            channel_d <= channel_d + (connection_sel[5] ? 0 : channel_2_op[1][5]);
        16: if (chd[1][6])
            channel_d <= channel_d + channel_2_op[1][6];
        17: if (chd[1][7])
            channel_d <= channel_d + channel_2_op[1][7];
        18: if (chd[1][8])
            channel_d <= channel_d + channel_2_op[1][8];
        endcase     
    endgenerate
    
    control_operators control_operators (
        .*
    );
        
endmodule
`default_nettype wire  // re-enable implicit net type declarations