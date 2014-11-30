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
    output logic rd_valid = 0,
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
    output logic [REG_FNUM_WIDTH-1:0] fnum [2][9] = '{ default: '0 },
    output logic [REG_MULT_WIDTH-1:0] mult [2][18] = '{ default: '0 },
    output logic [REG_BLOCK_WIDTH-1:0] block [2][9] = '{ default: '0 },
    output logic [REG_WS_WIDTH-1:0] ws [2][18] = '{ default: '0 },
    output logic vib [2][18] = '{ default: '0 },
    output logic dvb = 0,
    output logic kon [2][9] = '{ default: '0 },  
    output logic [REG_ENV_WIDTH-1:0] ar [2][18] = '{ default: '0 }, // attack rate
    output logic [REG_ENV_WIDTH-1:0] dr [2][18] = '{ default: '0 }, // decay rate
    output logic [REG_ENV_WIDTH-1:0] sl [2][18] = '{ default: '0 }, // sustain level
    output logic [REG_ENV_WIDTH-1:0] rr [2][18] = '{ default: '0 }, // release rate
    output logic [REG_TL_WIDTH-1:0] tl [2][18] = '{ default: '0 },  // total level
    output logic ksr [2][18] = '{ default: '0 },                    // key scale rate
    output logic [REG_KSL_WIDTH-1:0] ksl [2][18] = '{ default: '0 }, // key scale level
    output logic egt [2][18] = '{ default: '0 },                     // envelope type
    output logic am [2][18] = '{ default: '0 },                      // amplitude modulation (tremolo)
    output logic dam = 0,                             // depth of tremolo
    output logic ryt = 0,
    output logic bd = 0,
    output logic sd = 0,
    output logic tom = 0,
    output logic tc = 0,
    output logic hh = 0,
    output logic cha [2][9] = '{ default: '0 },
    output logic chb [2][9] = '{ default: '0 },
    output logic chc [2][9] = '{ default: '0 },
    output logic chd [2][9] = '{ default: '0 },
    output logic [REG_FB_WIDTH-1:0] fb [2][9] = '{ default: '0 },
    output logic cnt [2][9] = '{ default: '0 }
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
    end                    
    endgenerate
    
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
            'h20: begin
                data_out[7] <= am[bank_select][0];
                data_out[6] <= vib[bank_select][0];
                data_out[5] <= egt[bank_select][0];
                data_out[4] <= ksr[bank_select][0];
                data_out[3:0] <= mult[bank_select][0];                        
            end
            'h21: begin
                data_out[7] <= am[bank_select][1];
                data_out[6] <= vib[bank_select][1];
                data_out[5] <= egt[bank_select][1];
                data_out[4] <= ksr[bank_select][1];
                data_out[3:0] <= mult[bank_select][1];                        
            end
            'h22: begin
                data_out[7] <= am[bank_select][2];
                data_out[6] <= vib[bank_select][2];
                data_out[5] <= egt[bank_select][2];
                data_out[4] <= ksr[bank_select][2];
                data_out[3:0] <= mult[bank_select][2];                        
            end
            'h23: begin
                data_out[7] <= am[bank_select][3];
                data_out[6] <= vib[bank_select][3];
                data_out[5] <= egt[bank_select][3];
                data_out[4] <= ksr[bank_select][3];
                data_out[3:0] <= mult[bank_select][3];                        
            end
            'h24: begin
                data_out[7] <= am[bank_select][4];
                data_out[6] <= vib[bank_select][4];
                data_out[5] <= egt[bank_select][4];
                data_out[4] <= ksr[bank_select][4];
                data_out[3:0] <= mult[bank_select][4];                        
            end
            'h25: begin
                data_out[7] <= am[bank_select][5];
                data_out[6] <= vib[bank_select][5];
                data_out[5] <= egt[bank_select][5];
                data_out[4] <= ksr[bank_select][5];
                data_out[3:0] <= mult[bank_select][5];                        
            end
            // skip 'h26 and 'h27
            'h28: begin
                data_out[7] <= am[bank_select][6];
                data_out[6] <= vib[bank_select][6];
                data_out[5] <= egt[bank_select][6];
                data_out[4] <= ksr[bank_select][6];
                data_out[3:0] <= mult[bank_select][6];                        
            end 
            'h29: begin
                data_out[7] <= am[bank_select][7];
                data_out[6] <= vib[bank_select][7];
                data_out[5] <= egt[bank_select][7];
                data_out[4] <= ksr[bank_select][7];
                data_out[3:0] <= mult[bank_select][7];                        
            end
            'h2a: begin
                data_out[7] <= am[bank_select][8];
                data_out[6] <= vib[bank_select][8];
                data_out[5] <= egt[bank_select][8];
                data_out[4] <= ksr[bank_select][8];
                data_out[3:0] <= mult[bank_select][8];                        
            end
            'h2b: begin
                data_out[7] <= am[bank_select][9];
                data_out[6] <= vib[bank_select][9];
                data_out[5] <= egt[bank_select][9];
                data_out[4] <= ksr[bank_select][9];
                data_out[3:0] <= mult[bank_select][9];                        
            end
            'h2c: begin
                data_out[7] <= am[bank_select][10];
                data_out[6] <= vib[bank_select][10];
                data_out[5] <= egt[bank_select][10];
                data_out[4] <= ksr[bank_select][10];
                data_out[3:0] <= mult[bank_select][10];                        
            end
            'h2d: begin
                data_out[7] <= am[bank_select][11];
                data_out[6] <= vib[bank_select][11];
                data_out[5] <= egt[bank_select][11];
                data_out[4] <= ksr[bank_select][11];
                data_out[3:0] <= mult[bank_select][11];                        
            end
            // skip 'h2e and 'h2d           
            'h30: begin
                data_out[7] <= am[bank_select][12];
                data_out[6] <= vib[bank_select][12];
                data_out[5] <= egt[bank_select][12];
                data_out[4] <= ksr[bank_select][12];
                data_out[3:0] <= mult[bank_select][12];                        
            end
            'h31: begin
                data_out[7] <= am[bank_select][13];
                data_out[6] <= vib[bank_select][13];
                data_out[5] <= egt[bank_select][13];
                data_out[4] <= ksr[bank_select][13];
                data_out[3:0] <= mult[bank_select][13];                        
            end
            'h32: begin
                data_out[7] <= am[bank_select][14];
                data_out[6] <= vib[bank_select][14];
                data_out[5] <= egt[bank_select][14];
                data_out[4] <= ksr[bank_select][14];
                data_out[3:0] <= mult[bank_select][14];                        
            end
            'h33: begin
                data_out[7] <= am[bank_select][15];
                data_out[6] <= vib[bank_select][15];
                data_out[5] <= egt[bank_select][15];
                data_out[4] <= ksr[bank_select][15];
                data_out[3:0] <= mult[bank_select][15];                        
            end
            'h34: begin
                data_out[7] <= am[bank_select][16];
                data_out[6] <= vib[bank_select][16];
                data_out[5] <= egt[bank_select][16];
                data_out[4] <= ksr[bank_select][16];
                data_out[3:0] <= mult[bank_select][16];                        
            end
            'h35: begin
                data_out[7] <= am[bank_select][17];
                data_out[6] <= vib[bank_select][17];
                data_out[5] <= egt[bank_select][17];
                data_out[4] <= ksr[bank_select][17];
                data_out[3:0] <= mult[bank_select][17];                        
            end                             
            'h40: begin
                data_out[7:6] <= ksl[bank_select][0];
                data_out[5:0] <= tl[bank_select][0];            
            end
            'h41: begin
                data_out[7:6] <= ksl[bank_select][1];
                data_out[5:0] <= tl[bank_select][1];            
            end
            'h42: begin
                data_out[7:6] <= ksl[bank_select][2];
                data_out[5:0] <= tl[bank_select][2];            
            end
            'h43: begin
                data_out[7:6] <= ksl[bank_select][3];
                data_out[5:0] <= tl[bank_select][3];            
            end
            'h44: begin
                data_out[7:6] <= ksl[bank_select][4];
                data_out[5:0] <= tl[bank_select][4];            
            end
            'h45: begin
                data_out[7:6] <= ksl[bank_select][5];
                data_out[5:0] <= tl[bank_select][5];            
            end
            // skip 46 and 47
            'h48: begin
                data_out[7:6] <= ksl[bank_select][6];
                data_out[5:0] <= tl[bank_select][6];            
            end
            'h49: begin
                data_out[7:6] <= ksl[bank_select][7];
                data_out[5:0] <= tl[bank_select][7];            
            end
            'h4a: begin
                data_out[7:6] <= ksl[bank_select][8];
                data_out[5:0] <= tl[bank_select][8];            
            end
            'h4b: begin
                data_out[7:6] <= ksl[bank_select][9];
                data_out[5:0] <= tl[bank_select][9];            
            end
            'h4c: begin
                data_out[7:6] <= ksl[bank_select][10];
                data_out[5:0] <= tl[bank_select][10];            
            end 
            'h4d: begin
                data_out[7:6] <= ksl[bank_select][11];
                data_out[5:0] <= tl[bank_select][11];            
            end
            // skip 4e and 4f
            'h50: begin
                data_out[7:6] <= ksl[bank_select][12];
                data_out[5:0] <= tl[bank_select][12];            
            end
            'h51: begin
                data_out[7:6] <= ksl[bank_select][13];
                data_out[5:0] <= tl[bank_select][13];            
            end
            'h52: begin
                data_out[7:6] <= ksl[bank_select][14];
                data_out[5:0] <= tl[bank_select][14];            
            end
            'h53: begin
                data_out[7:6] <= ksl[bank_select][15];
                data_out[5:0] <= tl[bank_select][15];            
            end 
            'h54: begin
                data_out[7:6] <= ksl[bank_select][16];
                data_out[5:0] <= tl[bank_select][16];            
            end
            'h55: begin
                data_out[7:6] <= ksl[bank_select][17];
                data_out[5:0] <= tl[bank_select][17];            
            end                                
            'h60: begin
                data_out[7:4] <= ar[bank_select][0];
                data_out[3:0] <= dr[bank_select][0];
            end
            'h61: begin
                data_out[7:4] <= ar[bank_select][1];
                data_out[3:0] <= dr[bank_select][1];
            end
            'h62: begin
                data_out[7:4] <= ar[bank_select][2];
                data_out[3:0] <= dr[bank_select][2];
            end
            'h63: begin
                data_out[7:4] <= ar[bank_select][3];
                data_out[3:0] <= dr[bank_select][3];
            end 
            'h64: begin
                data_out[7:4] <= ar[bank_select][4];
                data_out[3:0] <= dr[bank_select][4];
            end
            'h65: begin
                data_out[7:4] <= ar[bank_select][5];
                data_out[3:0] <= dr[bank_select][5];
            end   
            // skip 66 and 67
            'h68: begin
                data_out[7:4] <= ar[bank_select][6];
                data_out[3:0] <= dr[bank_select][6];
            end
            'h69: begin
                data_out[7:4] <= ar[bank_select][7];
                data_out[3:0] <= dr[bank_select][7];
            end 
            'h6a: begin
                data_out[7:4] <= ar[bank_select][8];
                data_out[3:0] <= dr[bank_select][8];
            end 
            'h6b: begin
                data_out[7:4] <= ar[bank_select][9];
                data_out[3:0] <= dr[bank_select][9];
            end 
            'h6c: begin
                data_out[7:4] <= ar[bank_select][10];
                data_out[3:0] <= dr[bank_select][10];
            end 
            'h6d: begin
                data_out[7:4] <= ar[bank_select][11];
                data_out[3:0] <= dr[bank_select][11];
            end   
            // skip 6e and 6f
            'h70: begin
                data_out[7:4] <= ar[bank_select][12];
                data_out[3:0] <= dr[bank_select][12];
            end
            'h71: begin
                data_out[7:4] <= ar[bank_select][13];
                data_out[3:0] <= dr[bank_select][13];
            end
            'h72: begin
                data_out[7:4] <= ar[bank_select][14];
                data_out[3:0] <= dr[bank_select][14];
            end   
            'h73: begin
                data_out[7:4] <= ar[bank_select][15];
                data_out[3:0] <= dr[bank_select][15];
            end  
            'h74: begin
                data_out[7:4] <= ar[bank_select][16];
                data_out[3:0] <= dr[bank_select][16];
            end
            'h75: begin
                data_out[7:4] <= ar[bank_select][17];
                data_out[3:0] <= dr[bank_select][17];
            end                                                                                                                                                                                                    
            'h80: begin
                data_out[7:4] <= sl[bank_select][0];
                data_out[3:0] <= rr[bank_select][0];
            end
            'h81: begin
                data_out[7:4] <= sl[bank_select][1];
                data_out[3:0] <= rr[bank_select][1];
            end
            'h82: begin
                data_out[7:4] <= sl[bank_select][2];
                data_out[3:0] <= rr[bank_select][2];
            end 
            'h83: begin
                data_out[7:4] <= sl[bank_select][3];
                data_out[3:0] <= rr[bank_select][3];
            end      
            'h84: begin
                data_out[7:4] <= sl[bank_select][4];
                data_out[3:0] <= rr[bank_select][4];
            end  
            'h85: begin
                data_out[7:4] <= sl[bank_select][5];
                data_out[3:0] <= rr[bank_select][5];
            end                          
            // skip 86 and 87
            'h88: begin
                data_out[7:4] <= sl[bank_select][6];
                data_out[3:0] <= rr[bank_select][6];
            end 
            'h89: begin
                data_out[7:4] <= sl[bank_select][7];
                data_out[3:0] <= rr[bank_select][7];
            end 
            'h8a: begin
                data_out[7:4] <= sl[bank_select][8];
                data_out[3:0] <= rr[bank_select][8];
            end         
            'h8b: begin
                data_out[7:4] <= sl[bank_select][9];
                data_out[3:0] <= rr[bank_select][9];
            end 
            'h8c: begin
                data_out[7:4] <= sl[bank_select][10];
                data_out[3:0] <= rr[bank_select][10];
            end 
            'h8d: begin
                data_out[7:4] <= sl[bank_select][11];
                data_out[3:0] <= rr[bank_select][11];
            end
            // skip 8e and 8f
            'h90: begin
                data_out[7:4] <= sl[bank_select][12];
                data_out[3:0] <= rr[bank_select][12];
            end 
            'h91: begin
                data_out[7:4] <= sl[bank_select][13];
                data_out[3:0] <= rr[bank_select][13];
            end                         
            'h92: begin
                data_out[7:4] <= sl[bank_select][14];
                data_out[3:0] <= rr[bank_select][14];
            end   
            'h93: begin
                data_out[7:4] <= sl[bank_select][15];
                data_out[3:0] <= rr[bank_select][15];
            end              
            'h94: begin
                data_out[7:4] <= sl[bank_select][16];
                data_out[3:0] <= rr[bank_select][16];
            end  
            'h95: begin
                data_out[7:4] <= sl[bank_select][17];
                data_out[3:0] <= rr[bank_select][17];
            end               
            'hA0: data_out <= fnum[bank_select][0][7:0];
            'hA1: data_out <= fnum[bank_select][1][7:0];
            'hA2: data_out <= fnum[bank_select][2][7:0];
            'hA3: data_out <= fnum[bank_select][3][7:0];
            'hA4: data_out <= fnum[bank_select][4][7:0];
            'hA5: data_out <= fnum[bank_select][5][7:0];          
            'hA6: data_out <= fnum[bank_select][6][7:0];
            'hA7: data_out <= fnum[bank_select][7][7:0];
            'hA8: data_out <= fnum[bank_select][8][7:0];
            'hB0: begin
                data_out[7:6] <= 0;
                data_out[5] <= kon[bank_select][0];
                data_out[4:2] <= block[bank_select][0];
                data_out[1:0] <= fnum[bank_select][0][9:8];
            end
            'hB1: begin
                data_out[7:6] <= 0;
                data_out[5] <= kon[bank_select][1];
                data_out[4:2] <= block[bank_select][1];
                data_out[1:0] <= fnum[bank_select][1][9:8];
            end
            'hB2: begin
                data_out[7:6] <= 0;
                data_out[5] <= kon[bank_select][2];
                data_out[4:2] <= block[bank_select][2];
                data_out[1:0] <= fnum[bank_select][2][9:8];
            end
            'hB3: begin
                data_out[7:6] <= 0;
                data_out[5] <= kon[bank_select][3];
                data_out[4:2] <= block[bank_select][3];
                data_out[1:0] <= fnum[bank_select][3][9:8];
            end
            'hB4: begin
                data_out[7:6] <= 0;
                data_out[5] <= kon[bank_select][4];
                data_out[4:2] <= block[bank_select][4];
                data_out[1:0] <= fnum[bank_select][4][9:8];
            end
            'hB5: begin
                data_out[7:6] <= 0;
                data_out[5] <= kon[bank_select][5];
                data_out[4:2] <= block[bank_select][5];
                data_out[1:0] <= fnum[bank_select][5][9:8];
            end 
            'hB6: begin
                data_out[7:6] <= 0;
                data_out[5] <= kon[bank_select][6];
                data_out[4:2] <= block[bank_select][6];
                data_out[1:0] <= fnum[bank_select][6][9:8];
            end
            'hB7: begin
                data_out[7:6] <= 0;
                data_out[5] <= kon[bank_select][7];
                data_out[4:2] <= block[bank_select][7];
                data_out[1:0] <= fnum[bank_select][7][9:8];
            end
            'hB8: begin
                data_out[7:6] <= 0;
                data_out[5] <= kon[bank_select][8];
                data_out[4:2] <= block[bank_select][8];
                data_out[1:0] <= fnum[bank_select][8][9:8];
            end            
            'hBD: if (!bank_select) begin
                data_out[7] <= dam;
                data_out[6] <= dvb;
                data_out[5] <= ryt;
                data_out[4] <= bd;
                data_out[3] <= sd;
                data_out[2] <= tom;
                data_out[1] <= tc;
                data_out[0] <= hh;
            end           
            'hC0: begin
                data_out[7] <= chd[bank_select][0];
                data_out[6] <= chc[bank_select][0];
                data_out[5] <= chb[bank_select][0];
                data_out[4] <= cha[bank_select][0];
                data_out[3:1] <= fb[bank_select][0];
                data_out[0] <= cnt[bank_select][0];
            end
            'hC1: begin
                data_out[7] <= chd[bank_select][1];
                data_out[6] <= chc[bank_select][1];
                data_out[5] <= chb[bank_select][1];
                data_out[4] <= cha[bank_select][1];
                data_out[3:1] <= fb[bank_select][1];
                data_out[0] <= cnt[bank_select][1];
            end
            'hC2: begin
                data_out[7] <= chd[bank_select][2];
                data_out[6] <= chc[bank_select][2];
                data_out[5] <= chb[bank_select][2];
                data_out[4] <= cha[bank_select][2];
                data_out[3:1] <= fb[bank_select][2];
                data_out[0] <= cnt[bank_select][2];
            end     
            'hC3: begin
                data_out[7] <= chd[bank_select][3];
                data_out[6] <= chc[bank_select][3];
                data_out[5] <= chb[bank_select][3];
                data_out[4] <= cha[bank_select][3];
                data_out[3:1] <= fb[bank_select][3];
                data_out[0] <= cnt[bank_select][3];
            end   
            'hC4: begin
                data_out[7] <= chd[bank_select][4];
                data_out[6] <= chc[bank_select][4];
                data_out[5] <= chb[bank_select][4];
                data_out[4] <= cha[bank_select][4];
                data_out[3:1] <= fb[bank_select][4];
                data_out[0] <= cnt[bank_select][4];
            end
            'hC5: begin
                data_out[7] <= chd[bank_select][5];
                data_out[6] <= chc[bank_select][5];
                data_out[5] <= chb[bank_select][5];
                data_out[4] <= cha[bank_select][5];
                data_out[3:1] <= fb[bank_select][5];
                data_out[0] <= cnt[bank_select][5];
            end 
            'hC6: begin
                data_out[7] <= chd[bank_select][6];
                data_out[6] <= chc[bank_select][6];
                data_out[5] <= chb[bank_select][6];
                data_out[4] <= cha[bank_select][6];
                data_out[3:1] <= fb[bank_select][6];
                data_out[0] <= cnt[bank_select][6];
            end
            'hC7: begin
                data_out[7] <= chd[bank_select][7];
                data_out[6] <= chc[bank_select][7];
                data_out[5] <= chb[bank_select][7];
                data_out[4] <= cha[bank_select][7];
                data_out[3:1] <= fb[bank_select][7];
                data_out[0] <= cnt[bank_select][7];
            end
            'hC8: begin
                data_out[7] <= chd[bank_select][8];
                data_out[6] <= chc[bank_select][8];
                data_out[5] <= chb[bank_select][8];
                data_out[4] <= cha[bank_select][8];
                data_out[3:1] <= fb[bank_select][8];
                data_out[0] <= cnt[bank_select][8];
            end                                                           
            'hE0: begin
                data_out[7:3] <= 0;
                data_out[2:0] <= ws[bank_select][0];
            end
            'hE1: begin
                data_out[7:3] <= 0;
                data_out[2:0] <= ws[bank_select][1];
            end
            'hE2: begin
                data_out[7:3] <= 0;
                data_out[2:0] <= ws[bank_select][2];
            end 
            'hE3: begin
                data_out[7:3] <= 0;
                data_out[2:0] <= ws[bank_select][3];
            end
            'hE4: begin
                data_out[7:3] <= 0;
                data_out[2:0] <= ws[bank_select][4];
            end 
            'hE5: begin
                data_out[7:3] <= 0;
                data_out[2:0] <= ws[bank_select][5];
            end  
            // skip e6 and e7
            'hE8: begin
                data_out[7:3] <= 0;
                data_out[2:0] <= ws[bank_select][6];
            end
            'hE9: begin
                data_out[7:3] <= 0;
                data_out[2:0] <= ws[bank_select][7];
            end
            'hEA: begin
                data_out[7:3] <= 0;
                data_out[2:0] <= ws[bank_select][8];
            end 
            'hEB: begin
                data_out[7:3] <= 0;
                data_out[2:0] <= ws[bank_select][9];
            end 
            'hEC: begin
                data_out[7:3] <= 0;
                data_out[2:0] <= ws[bank_select][10];
            end  
            'hED: begin
                data_out[7:3] <= 0;
                data_out[2:0] <= ws[bank_select][11];
            end
            // skip ee and ef
            'hD0: begin
                data_out[7:3] <= 0;
                data_out[2:0] <= ws[bank_select][12];
            end
            'hD1: begin
                data_out[7:3] <= 0;
                data_out[2:0] <= ws[bank_select][13];
            end      
            'hD2: begin
                data_out[7:3] <= 0;
                data_out[2:0] <= ws[bank_select][14];
            end  
            'hD3: begin
                data_out[7:3] <= 0;
                data_out[2:0] <= ws[bank_select][15];
            end    
            'hD4: begin
                data_out[7:3] <= 0;
                data_out[2:0] <= ws[bank_select][16];
            end    
            'hD5: begin
                data_out[7:3] <= 0;
                data_out[2:0] <= ws[bank_select][17];
            end                                                                       
            default: data_out <= 'hff;
            endcase           
    
    always_ff @(posedge clk)
        rd_valid <= cs && rd;
    
endmodule
`default_nettype wire  // re-enable implicit net type declarations