/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: top_level.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 13 Oct 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   13 Oct 2014        Greg Taylor
#       Initial version
#
#   SVN Identification
#   $Id$
#******************************************************************************/
`timescale 1ns / 1ps
`default_nettype none // disable implicit net type declarations

`include "top_level/pkg/opl3_pkg.sv"
import opl3_pkg::*;

module top_level (
    input wire clk125,
    output wire i2s_sclk,
    output wire i2s_ws,
    output wire i2s_sd,
    output logic ac_mclk,
    output logic ac_mute_n,
    inout wire i2c_scl,
    inout wire i2c_sda,
    output logic [3:0] led,
    
    inout wire [53:0]MIO,
    inout wire DDR_CAS_n,
    inout wire DDR_CKE,
    inout wire DDR_Clk_n,
    inout wire DDR_Clk,
    inout wire DDR_CS_n,
    inout wire DDR_DRSTB,
    inout wire DDR_ODT,
    inout wire DDR_RAS_n,
    inout wire DDR_WEB,
    inout wire [2:0]DDR_BankAddr,
    inout wire [14:0]DDR_Addr,
    inout wire DDR_VRN,
    inout wire DDR_VRP,
    inout wire [3:0]DDR_DM,
    inout wire [31:0]DDR_DQ,
    inout wire [3:0]DDR_DQS_n,
    inout wire [3:0]DDR_DQS,
    inout wire PS_SRSTB,
    inout wire PS_CLK,
    inout wire PS_PORB
);
    logic reset;
    wire clk_locked;
    wire clk;
    wire sample_clk_en;
    
    wire I2C0_SDA_I;
    wire I2C0_SDA_O;
    wire I2C0_SDA_T;
    wire I2C0_SCL_I;
    wire I2C0_SCL_O;
    wire I2C0_SCL_T;
    
    wire M_AXI_GP0_ARVALID;
    wire M_AXI_GP0_AWVALID;
    wire M_AXI_GP0_BREADY;
    wire M_AXI_GP0_RREADY;
    wire M_AXI_GP0_WLAST;
    wire M_AXI_GP0_WVALID;
    wire [11:0]M_AXI_GP0_ARID;
    wire [11:0]M_AXI_GP0_AWID;
    wire [11:0]M_AXI_GP0_WID;
    wire [1:0]M_AXI_GP0_ARBURST;
    wire [1:0]M_AXI_GP0_ARLOCK;
    wire [2:0]M_AXI_GP0_ARSIZE;
    wire [1:0]M_AXI_GP0_AWBURST;
    wire [1:0]M_AXI_GP0_AWLOCK;
    wire [2:0]M_AXI_GP0_AWSIZE;
    wire [2:0]M_AXI_GP0_ARPROT;
    wire [2:0]M_AXI_GP0_AWPROT;
    wire [31:0]M_AXI_GP0_ARADDR;
    wire [31:0]M_AXI_GP0_AWADDR;
    wire [31:0]M_AXI_GP0_WDATA;
    wire [3:0]M_AXI_GP0_ARCACHE;
    wire [3:0]M_AXI_GP0_ARLEN;
    wire [3:0]M_AXI_GP0_ARQOS;
    wire [3:0]M_AXI_GP0_AWCACHE;
    wire [3:0]M_AXI_GP0_AWLEN;
    wire [3:0]M_AXI_GP0_AWQOS;
    wire [3:0]M_AXI_GP0_WSTRB;
    wire M_AXI_GP0_ACLK;
    wire M_AXI_GP0_ARREADY;
    wire M_AXI_GP0_AWREADY;
    wire M_AXI_GP0_BVALID;
    wire M_AXI_GP0_RLAST;
    wire M_AXI_GP0_RVALID;
    wire M_AXI_GP0_WREADY;
    wire [11:0]M_AXI_GP0_BID;
    wire [11:0]M_AXI_GP0_RID;
    wire [1:0]M_AXI_GP0_BRESP;
    wire [1:0]M_AXI_GP0_RRESP;
    wire [31:0]M_AXI_GP0_RDATA;    
    wire FCLK_CLK0;
    wire FCLK_RESET0_N;    
    wire ENET0_PTP_DELAY_REQ_RX;
    wire ENET0_PTP_DELAY_REQ_TX;
    wire ENET0_PTP_PDELAY_REQ_RX;
    wire ENET0_PTP_PDELAY_REQ_TX;
    wire ENET0_PTP_PDELAY_RESP_RX;
    wire ENET0_PTP_PDELAY_RESP_TX;
    wire ENET0_PTP_SYNC_FRAME_RX;
    wire ENET0_PTP_SYNC_FRAME_TX;
    wire ENET0_SOF_RX;
    wire ENET0_SOF_TX;    
    wire SDIO0_WP;
    wire [1:0]USB0_PORT_INDCTL;
    wire USB0_VBUS_PWRSELECT;
    wire USB0_VBUS_PWRFAULT; 
    
    logic [REG_FNUM_WIDTH-1:0] fnum = 1023;
    logic [REG_MULT_WIDTH-1:0] mult = 1;
    logic [REG_BLOCK_WIDTH-1:0] block = 4;
    logic [REG_WS_WIDTH-1:0] ws = 0;
    
    localparam int CLK_COUNT = CLK_FREQ;
    
    logic [$clog2(CLK_COUNT)-1:0] counter = 0;
    
    always_ff @(posedge clk)
        if (counter == CLK_COUNT - 1)
            counter <= 0;
        else
            counter <= counter + 1;
        
    always_ff @(posedge clk)
        if (counter == CLK_COUNT -1)
            block <= block + 1;

    wire [SAMPLE_WIDTH-1:0] sample;
      
    clk_gen clk_gen_inst(
        .*
    );
    always_comb reset = !clk_locked;
    always_comb ac_mclk = clk;
    
    clk_div #(
        .INPUT_CLK_FREQ(CLK_FREQ),       
        .OUTPUT_CLK_EN_FREQ(SAMPLE_FREQ) 
    ) sample_clk_gen_inst (
        .clk_en(sample_clk_en),
        .*
    );

    /*
     * Frequency resolution can be found from the formula for F_NUM in ymf262
     * datasheet. Set F_NUM to 1, solve for frequency. This gives away the width
     * of the NCO
     */
    nco_control #(
        .CLK_FREQ(SAMPLE_FREQ),
        .FREQ_RES(0.047397614),
        .PHASE_ACC_WIDTH(20),
        .OUTPUT_WIDTH(SAMPLE_WIDTH)
    ) phase_gen_inst (
        .en(sample_clk_en),        
        .out(sample),
        .*
    );
    
    i2s i2s_inst (
        .left_channel(sample),
        .right_channel(sample),
        .*
    );
    
    always_comb led[0] = ac_mute_n;
    always_comb led[1] = 1;
    always_comb led[2] = 1;
    always_comb led[3] = 1;
    
    
    save_dac_input #(
        .DAC_WIDTH(SAMPLE_WIDTH),
        .NUM_SAMPLES(128)
    ) save_dac_input_inst (
        .dac_input(sample),
        .clk_en(sample_clk_en),
        .*
    );  
    
    processing_system7_0 cpu_inst (
        .*
    );   
    
    always_comb ac_mute_n = 1;
    
    assign i2c_scl = I2C0_SCL_T ? 1'bZ : I2C0_SCL_O;
    assign i2c_sda = I2C0_SDA_T ? 1'bZ : I2C0_SDA_O;
    assign I2C0_SCL_I = i2c_scl;
    assign I2C0_SDA_I = i2c_sda;
endmodule
`default_nettype wire  // re-enable implicit net type declarations
