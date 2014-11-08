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
    input wire cnt [2][9]
);   
    logic signed [OP_OUT_WIDTH-1:0] operator_out [2][18];
    logic [REG_FNUM_WIDTH-1:0] fnum_tmp [2][18];
    logic [REG_BLOCK_WIDTH-1:0] block_tmp [2][18];
    logic kon_tmp [2][18];
    logic [REG_FB_WIDTH-1:0] fb_tmp [2][18];
    logic use_feedback [2][18];
    logic [OP_OUT_WIDTH-1:0] modulation [2][18];
    logic signed [SAMPLE_WIDTH-1:0] channel_2_op [2][9];
    logic signed [SAMPLE_WIDTH-1:0] channel_4_op [2][3];
    logic signed [SAMPLE_WIDTH-1:0] channel_a = 0;
    logic signed [SAMPLE_WIDTH-1:0] channel_b = 0;
    logic signed [SAMPLE_WIDTH-1:0] channel_c = 0;
    logic signed [SAMPLE_WIDTH-1:0] channel_d = 0;

    always_comb begin
        /*
         * Operator input mappings
         * 
         * The first mappings are static whether the operator is configured
         * in a 2 channel or a 4 channel mode. Next we start mapping connections
         * for operators whose input varies depending on the mode.
         */
        fnum_tmp[0][0] = fnum[0][0];
        block_tmp[0][0] = block[0][0];
        kon_tmp[0][0] = kon[0][0];
        fb_tmp[0][0] = fb[0][0];
        use_feedback[0][0] = 1;
        modulation[0][0] = 0;
        
        fnum_tmp[0][3] = fnum[0][0];
        block_tmp[0][3] = block[0][0];
        kon_tmp[0][3] = kon[0][0];
        fb_tmp[0][3] = 0;
        use_feedback[0][3] = 0;
        modulation[0][3] = cnt[0][0] ? 0 : operator_out[0][0];
        
        fnum_tmp[0][1] = fnum[0][1];
        block_tmp[0][1] = block[0][1];
        kon_tmp[0][1] = kon[0][1];
        fb_tmp[0][1] = fb[0][1];
        use_feedback[0][1] = 1;
        modulation[0][1] = 0;
        
        fnum_tmp[0][4] = fnum[0][1];
        block_tmp[0][4] = block[0][1];
        kon_tmp[0][4] = kon[0][1];
        fb_tmp[0][4] = 0;
        use_feedback[0][4] = 0;
        modulation[0][4] = cnt[0][1] ? 0 : operator_out[0][1];
        
        fnum_tmp[0][2] = fnum[0][2];
        block_tmp[0][2] = block[0][2];
        kon_tmp[0][2] = kon[0][2];
        fb_tmp[0][2] = fb[0][2];
        use_feedback[0][2] = 1;
        modulation[0][2] = 0;
        
        fnum_tmp[0][5] = fnum[0][2];
        block_tmp[0][5] = block[0][2];
        kon_tmp[0][5] = kon[0][2];
        fb_tmp[0][5] = 0;
        use_feedback[0][5] = 0;
        modulation[0][5] = cnt[0][2] ? 0 : operator_out[0][2];
        
        fnum_tmp[1][0] = fnum[1][0];
        block_tmp[1][0] = block[1][0];
        kon_tmp[1][0] = kon[1][0];
        fb_tmp[1][0] = fb[1][0];
        use_feedback[1][0] = 1;
        modulation[1][0] = 0;
        
        fnum_tmp[1][3] = fnum[1][0];
        block_tmp[1][3] = block[1][0];
        kon_tmp[1][3] = kon[1][0];
        fb_tmp[1][3] = 0;
        use_feedback[1][3] = 0;
        modulation[1][0] = cnt[1][0] ? 0 : operator_out[1][0];
        
        fnum_tmp[1][1] = fnum[1][1];
        block_tmp[0][1] = block[1][1];
        kon_tmp[1][1] = kon[1][1];
        fb_tmp[1][1] = fb[1][1];
        use_feedback[1][1] = 1;
        modulation[1][1] = 0;
        
        fnum_tmp[1][4] = fnum[1][1];
        block_tmp[1][4] = block[1][1];
        kon_tmp[1][4] = kon[1][1];
        fb_tmp[1][4] = 0;
        use_feedback[1][4] = 0;
        modulation[1][4] = cnt[1][1] ? 0 : operator_out[1][1];
        
        fnum_tmp[1][2] = fnum[1][2];
        block_tmp[1][2] = block[1][2];
        kon_tmp[1][2] = kon[1][2];
        fb_tmp[1][2] = fb[1][2];
        use_feedback[1][2] = 1;
        modulation[1][2] = 0;
        
        fnum_tmp[1][5] = fnum[1][2];
        block_tmp[1][5] = block[1][2];
        kon_tmp[1][5] = kon[1][2];
        fb_tmp[1][5] = 0;
        use_feedback[1][5] = 0;
        modulation[1][5] = cnt[1][2] ? 0 : operator_out[1][2];
        
        /*
         * Todo: implement rhythm mode
         */
        fnum_tmp[0][12] = fnum[0][6];
        block_tmp[0][12] = block[0][6];
        kon_tmp[0][12] = kon[0][6];
        fb_tmp[0][12] = fb[0][6];
        use_feedback[0][12] = 1;
        modulation[0][12] = 0;
        
        fnum_tmp[0][15] = fnum[0][6];
        block_tmp[0][15] = block[0][6];
        kon_tmp[0][15] = kon[0][6];
        fb_tmp[0][15] = 0;
        use_feedback[0][15] = 0;
        modulation[0][15] = cnt[0][6] ? 0 : operator_out[0][12];
        
        fnum_tmp[0][13] = fnum[0][7];
        block_tmp[0][13] = block[0][7];
        kon_tmp[0][13] = kon[0][7];
        fb_tmp[0][13] = fb[0][7];
        use_feedback[0][15] = 1;
        modulation[0][13] = 0;
        
        fnum_tmp[0][16] = fnum[0][7];
        block_tmp[0][16] = block[0][7];
        kon_tmp[0][16] = kon[0][7];
        fb_tmp[0][16] = 0;
        use_feedback[0][16] = 0;
        modulation[0][16] = cnt[0][7] ? 0 : operator_out[0][13];
        
        fnum_tmp[0][14] = fnum[0][8];
        block_tmp[0][14] = block[0][8];
        kon_tmp[0][14] = kon[0][8];
        fb_tmp[0][14] = fb[0][8];
        use_feedback[0][14] = 1;
        modulation[0][14] = 0;
        
        fnum_tmp[0][17] = fnum[0][8];
        block_tmp[0][17] = block[0][8];
        kon_tmp[0][17] = kon[0][8];
        fb_tmp[0][17] = 0;
        use_feedback[0][17] = 0;
        modulation[0][17] = cnt[0][8] ? 0 : operator_out[0][14];
        
        fnum_tmp[1][12] = fnum[1][6];
        block_tmp[1][12] = block[1][6];
        kon_tmp[1][12] = kon[1][6];
        fb_tmp[1][12] = fb[1][6];
        use_feedback[1][12] = 1;
        modulation[1][12] = 0;
        
        fnum_tmp[1][15] = fnum[1][6];
        block_tmp[1][15] = block[1][6];
        kon_tmp[1][15] = kon[1][6];
        fb_tmp[1][15] = 0;
        use_feedback[1][15] = 1;
        modulation[1][15] = cnt[1][6] ? 0 : operator_out[1][12];
        
        fnum_tmp[1][13] = fnum[1][7];
        block_tmp[1][13] = block[1][7];
        kon_tmp[1][13] = kon[1][7];
        fb_tmp[1][13] = fb[1][7];
        use_feedback[1][13] = 1;
        modulation[1][13] = 0;
        
        fnum_tmp[1][16] = fnum[1][7];
        block_tmp[1][16] = block[1][7];
        kon_tmp[1][16] = kon[1][7];
        fb_tmp[1][16] = 0;
        use_feedback[1][16] = 0;
        modulation[1][16] = cnt[1][7] ? 0 : operator_out[1][13];
        
        fnum_tmp[1][14] = fnum[1][8];
        block_tmp[1][14] = block[1][8];
        kon_tmp[1][14] = kon[1][8];
        fb_tmp[1][14] = fb[1][8];
        use_feedback[1][14] = 1;
        modulation[1][14] = 0;
        
        fnum_tmp[1][17] = fnum[1][8];
        block_tmp[1][17] = block[1][8];
        kon_tmp[1][17] = kon[1][8];
        fb_tmp[1][17] = 0;  
        use_feedback[1][17] = 0;
        modulation[1][17] = cnt[1][8] ? 0 : operator_out[1][14];
   
        if (connection_sel[0]) begin
            fnum_tmp[0][6] = fnum[0][0];
            block_tmp[0][6] = block[0][0];
            kon_tmp[0][6] = kon[0][0];
            fb_tmp[0][6] = 0;
            use_feedback[0][6] = 0;
            modulation[0][6] = !cnt[0][0] && cnt[0][3] ? 0 : operator_out[0][3]; 
        
            fnum_tmp[0][9] = fnum[0][0];
            block_tmp[0][9] = block[0][0];
            kon_tmp[0][9] = kon[0][0];
            fb_tmp[0][9] = 0;
            use_feedback[0][9] = 0;
            modulation[0][9] = cnt[0][0] && cnt[0][3] ? 0 : operator_out[0][6];
        end
        else begin
            fnum_tmp[0][6] = fnum[0][3];
            block_tmp[0][6] = block[0][3];
            kon_tmp[0][6] = kon[0][3];
            fb_tmp[0][6] = fb[0][3];
            use_feedback[0][6] = 1;
            modulation[0][6] = 0;
        
            fnum_tmp[0][9] = fnum[0][3];
            block_tmp[0][9] = block[0][3];
            kon_tmp[0][9] = kon[0][3];
            fb_tmp[0][9] = 0; 
            use_feedback[0][9] = 0;
            modulation[0][9] = cnt[0][3] ? 0 : operator_out[0][6];
        end
        if (connection_sel[1]) begin
            fnum_tmp[0][7] = fnum[0][1];
            block_tmp[0][7] = block[0][1];
            kon_tmp[0][7] = kon[0][1];
            fb_tmp[0][7] = 0;
            use_feedback[0][7] = 0;
            modulation[0][7] = !cnt[0][1] && cnt[0][4] ? 0 : operator_out[0][4]; 
        
            fnum_tmp[0][10] = fnum[0][1];
            block_tmp[0][10] = block[0][1];
            kon_tmp[0][10] = kon[0][1];
            fb_tmp[0][10] = 0;
            use_feedback[0][10] = 0;
            modulation[0][10] = cnt[0][1] && cnt[0][4] ? 0 : operator_out[0][7];
        end
        else begin
            fnum_tmp[0][7] = fnum[0][4];
            block_tmp[0][7] = block[0][4];
            kon_tmp[0][7] = kon[0][4];
            fb_tmp[0][7] = fb[0][4];
            use_feedback[0][7] = 1;
            modulation[0][7] = 0;
            
            fnum_tmp[0][10] = fnum[0][4];
            block_tmp[0][10] = block[0][4];
            kon_tmp[0][10] = kon[0][4];
            fb_tmp[0][10] = 0;
            use_feedback[0][10] = 0;
            modulation[0][10] = cnt[0][4] ? 0 : operator_out[0][7];
        end
        if (connection_sel[2]) begin
            fnum_tmp[0][8] = fnum[0][2];
            block_tmp[0][8] = block[0][2];
            kon_tmp[0][8] = kon[0][2];
            fb_tmp[0][8] = 0;
            use_feedback[0][8] = 0;
            modulation[0][8] = !cnt[0][2] && cnt[0][5] ? 0 : operator_out[0][5];             
        
            fnum_tmp[0][11] = fnum[0][2];
            block_tmp[0][11] = block[0][2];
            kon_tmp[0][11] = kon[0][2];
            fb_tmp[0][11] = 0;
            use_feedback[0][11] = 0;
            modulation[0][11] = cnt[0][2] && cnt[0][5] ? 0 : operator_out[0][8];
        end
        else begin
            fnum_tmp[0][8] = fnum[0][5];
            block_tmp[0][8] = block[0][5];
            kon_tmp[0][8] = kon[0][5];
            fb_tmp[0][8] = fb[0][5];
            use_feedback[0][8] = 1;
            modulation[0][8] = 0;
        
            fnum_tmp[0][11] = fnum[0][5];
            block_tmp[0][11] = block[0][5];
            kon_tmp[0][11] = kon[0][5];
            fb_tmp[0][11] = 0;   
            use_feedback[0][11] = 0;
            modulation[0][11] = cnt[0][5] ? 0 : operator_out[0][8];
        end
        if (connection_sel[3]) begin
            fnum_tmp[1][6] = fnum[1][0];
            block_tmp[1][6] = block[1][0];
            kon_tmp[1][6] = kon[1][0];
            fb_tmp[1][6] = 0;
            use_feedback[1][6] = 0;
            modulation[1][6] = !cnt[1][0] && cnt[1][3] ? 0 : operator_out[1][3];            
        
            fnum_tmp[1][9] = fnum[1][0];
            block_tmp[1][9] = block[1][0];
            kon_tmp[1][9] = kon[1][0];
            fb_tmp[1][9] = 0;
            use_feedback[1][9] = 0;
            modulation[1][9] = cnt[1][0] && cnt[1][3] ? 0 : operator_out[1][6];           
        end
        else begin
            fnum_tmp[1][6] = fnum[1][3];
            block_tmp[1][6] = block[1][3];
            kon_tmp[1][6] = kon[1][3];
            fb_tmp[1][6] = fb[1][3];
            use_feedback[1][6] = 1;
            modulation[1][6] = 0;
        
            fnum_tmp[1][9] = fnum[1][3];
            block_tmp[1][9] = block[1][3];
            kon_tmp[1][9] = kon[1][3];
            fb_tmp[1][9] = 0; 
            use_feedback[1][9] = 0;
            modulation[1][9] = cnt[1][3] ? 0 : operator_out[1][6];
        end
        if (connection_sel[4]) begin
            fnum_tmp[1][7] = fnum[1][1];
            block_tmp[1][7] = block[1][1];
            kon_tmp[1][7] = kon[1][1];
            fb_tmp[1][7] = 0;
            use_feedback[1][7] = 0;
            modulation[1][7] = !cnt[1][1] && cnt[1][4] ? 0 : operator_out[1][4];            
        
            fnum_tmp[1][10] = fnum[1][1];
            block_tmp[1][10] = block[1][1];
            kon_tmp[1][10] = kon[1][1];
            fb_tmp[1][10] = 0;
            use_feedback[1][10] = 0;
            modulation[1][10] = cnt[1][1] && cnt[1][4] ? 0 : operator_out[1][7]; 
        end
        else begin
            fnum_tmp[1][7] = fnum[1][4];
            block_tmp[1][7] = block[1][4];
            kon_tmp[1][7] = kon[1][4];
            fb_tmp[1][7] = fb[1][4];
            use_feedback[1][7] = 1;
            modulation[1][7] = 0;
        
            fnum_tmp[1][10] = fnum[1][4];
            block_tmp[1][10] = block[1][4];
            kon_tmp[1][10] = kon[1][4];
            fb_tmp[1][10] = 0;   
            use_feedback[1][10] = 0;
            modulation[1][10] = cnt[1][4] ? 0 : operator_out[1][7];
        end
        if (connection_sel[5]) begin
            fnum_tmp[1][8] = fnum[1][2];
            block_tmp[1][8] = block[1][2];
            kon_tmp[1][8] = kon[1][2];
            fb_tmp[1][8] = 0;
            use_feedback[1][8] = 0;
            modulation[1][8] = !cnt[1][2] && cnt[1][5] ? 0 : operator_out[1][5];            
        
            fnum_tmp[1][11] = fnum[1][2];
            block_tmp[1][11] = block[1][2];
            kon_tmp[1][11] = kon[1][2];
            fb_tmp[1][11] = 0;
            use_feedback[1][11] = 0;
            modulation[1][11] = cnt[1][2] && cnt[1][5] ? 0 : operator_out[1][8]; 
        end
        else begin
            fnum_tmp[1][8] = fnum[1][5];
            block_tmp[1][8] = block[1][5];
            kon_tmp[1][8] = kon[1][5];
            fb_tmp[1][8] = fb[1][5];
            use_feedback[1][8] = 1;
            modulation[1][8] = 0;
        
            fnum_tmp[1][11] = fnum[1][5];
            block_tmp[1][11] = block[1][5];
            kon_tmp[1][11] = kon[1][5];
            fb_tmp[1][11] = 0; 
            use_feedback[1][11] = 0;
            modulation[1][11] = cnt[1][5] ? 0 : operator_out[1][8];
        end
    end       
  
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
            'b11: channel_4_op[i][0] = operator_out[i][0] + operator_out[i][6] + operator_out[9];
            endcase
                
            unique case ({cnt[i][1], cnt[i][4]})
            'b00: channel_4_op[i][1] = operator_out[i][10];
            'b01: channel_4_op[i][1] = operator_out[i][4] + operator_out[i][10];
            'b10: channel_4_op[i][1] = operator_out[i][1] + operator_out[i][10];
            'b11: channel_4_op[i][1] = operator_out[i][1] + operator_out[i][7] + operator_out[10];
            endcase
                
            unique case ({cnt[i][2], cnt[i][5]})
            'b00: channel_4_op[i][2] = operator_out[i][11];
            'b01: channel_4_op[i][2] = operator_out[i][5] + operator_out[i][11];
            'b10: channel_4_op[i][2] = operator_out[i][2] + operator_out[i][11];
            'b11: channel_4_op[i][2] = operator_out[i][2] + operator_out[i][8] + operator_out[11];
            endcase 
        end
    end        
       
    for (i = 0; i < 2; i++)
        for (j = 0; j < 18; j++)
            operator operator (
                .fnum(fnum_tmp[i][j]),
                .mult(mult[i][j]),
                .block(block_tmp[i][j]),
                .ws(ws[i][j]),
                .vib(vib[i][j]),
                .dvb(dvb),
                .kon(kon_tmp[i][j]),  
                .ar(ar[i][j]), 
                .dr(dr[i][j]),
                .sl(sl[i][j]), 
                .rr(rr[i][j]), 
                .tl(tl[i][j]),  
                .ksr(ksr[i][j]),                   
                .ksl(ksl[i][j]), 
                .egt(egt[i][j]),                    
                .am(am[i][j]),                    
                .dam(dam),                     
                .nts(nts),      
                .use_feedback(use_feedback[i][j]),
                .fb(fb_tmp[i][j]),
                .modulation(modulation[i][j]),
                .out(operator_out[i][j]),
                .*
            );        
    endgenerate
        
endmodule
`default_nettype wire  // re-enable implicit net type declarations