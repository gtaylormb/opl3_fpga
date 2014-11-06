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
    logic M_AXI_GP0_ACLK;
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
    
    wire [31:0]m_axi_araddr;
    wire [2:0]m_axi_arprot;
    wire m_axi_arready;
    wire m_axi_arvalid;
    wire [31:0]m_axi_awaddr;
    wire [2:0]m_axi_awprot;
    wire m_axi_awready;
    wire m_axi_awvalid;
    wire m_axi_bready;
    wire [1:0]m_axi_bresp;
    wire m_axi_bvalid;
    wire [31:0]m_axi_rdata;
    wire m_axi_rready;
    wire [1:0]m_axi_rresp;
    wire m_axi_rvalid;
    wire [31:0]m_axi_wdata;
    wire m_axi_wready;
    wire [3:0]m_axi_wstrb;
    wire m_axi_wvalid;
    
    wire cs;
    wire rd;
    wire wr;
    wire bank_select; // A1
    wire [REG_FILE_ADDRESS_WIDTH-1:0] address;
    wire [REG_FILE_DATA_WIDTH-1:0] data_in;
    wire [REG_FILE_DATA_WIDTH-1:0] data_out;
    wire [REG_TIMER_WIDTH-1:0] timer1;
    wire [REG_TIMER_WIDTH-1:0] timer2;
    wire irq_rst;
    wire mt1;
    wire mt2;
    wire st1;
    wire st2;
    wire [REG_CONNECTION_SEL_WIDTH-1:0] connection_sel;
    wire is_new;
    wire nts;                     // keyboard split selection     
    wire [REG_FNUM_WIDTH-1:0] fnum [2][9];
    wire [REG_MULT_WIDTH-1:0] mult [2][18];
    wire [REG_BLOCK_WIDTH-1:0] block [2][9];
    wire [REG_WS_WIDTH-1:0] ws [2][18];
    wire vib [2][18];
    wire dvb;
    wire kon [2][9];  
    wire [REG_ENV_WIDTH-1:0] ar [2][18]; // attack rate
    wire [REG_ENV_WIDTH-1:0] dr [2][18]; // decay rate
    wire [REG_ENV_WIDTH-1:0] sl [2][18]; // sustain level
    wire [REG_ENV_WIDTH-1:0] rr [2][18]; // release rate
    wire [REG_TL_WIDTH-1:0] tl [2][18];  // total level
    wire ksr [2][18];                    // key scale rate
    wire [REG_KSL_WIDTH-1:0] ksl [2][18]; // key scale level
    wire egt [2][18];                     // envelope type
    wire am [2][18];                      // amplitude modulation (tremolo)
    wire dam;                             // depth of tremolo
    wire ryt;
    wire bd;
    wire sd;
    wire tom;
    wire tc;
    wire hh;
    wire cha [2][9];
    wire chb [2][9];
    wire chc [2][9];
    wire chd [2][9];
    wire [REG_FB_WIDTH-1:0] fb [2][9];
    wire cnt [2][9];

    logic signed [SAMPLE_WIDTH-1:0] sample_l;
    logic signed [SAMPLE_WIDTH-1:0] sample_r;    
    wire signed [OP_OUT_WIDTH-1:0] op_out_l;
    wire signed [OP_OUT_WIDTH-1:0] op_out_r;    
    
    always_comb sample_l = op_out_l;
    always_comb sample_r = op_out_r;    
    
    /*
     * Generate the 12.727MHz clock
     */
    clk_gen clk_gen (
        .*
    );
    always_comb reset = !clk_locked;
    always_comb ac_mclk = clk;
    
    /*
     * Generate the 12.727MHz/256 sample clock enable
     */
    clk_div #(
        .INPUT_CLK_FREQ(CLK_FREQ),       
        .OUTPUT_CLK_EN_FREQ(SAMPLE_FREQ) 
    ) sample_clk_gen (
        .clk_en(sample_clk_en),
        .*
    );
    
    logic [$clog2(CLK_FREQ)-1:0] counter = 0;
    logic kon_tmp = 0;
    
    always_ff @(posedge clk)
        if (counter == CLK_FREQ - 1)
            counter <= 0;
        else
            counter <= counter + 1;
        
    always_ff @(posedge clk)
        if (counter == CLK_FREQ - 1)
            kon_tmp <= 1;
        else if (counter == CLK_FREQ/3 - 1)
            kon_tmp <= 0;

    operator operator_l (      
        .out(op_out_l),
        .fnum(512),
        .mult(1),
        .block(4),
        .ws(1),
        .vib(0),
        .dvb(0),
        .kon(kon_tmp),
        .ar(6), 
        .dr(7),
        .sl(2), 
        .rr(7), 
        .tl(0),  
        .ksr(0),                  
        .ksl(0), 
        .egt(0),                    
        .am(0),                      
        .dam(1),                     
        .nts(0),                   
        .*
    );
    
    operator operator_r (      
            .out(op_out_r),
            .fnum(512),
            .mult(1),
            .block(2),
            .ws(3),
            .vib(0),
            .dvb(0),
            .kon(kon_tmp),
            .ar(6), 
            .dr(7),
            .sl(2), 
            .rr(7), 
            .tl(0),  
            .ksr(0),                  
            .ksl(0), 
            .egt(0),                    
            .am(0),                      
            .dam(1),                     
            .nts(0),                   
            .*
            );     
    
    
    i2s i2s (
        .left_channel(sample_l),
        .right_channel(sample_r),
        .*
    );
    
    always_comb led[0] = ac_mute_n;
    always_comb led[1] = 1;
    always_comb led[2] = 1;
    always_comb led[3] = 1;
    
`ifdef SIM    
    save_dac_input #(
        .DAC_WIDTH(SAMPLE_WIDTH),
        .NUM_SAMPLES(128),
        .FILENAME("modules/operator/analysis/dac_data.bin")
    ) save_dac_input (
        .dac_input(sample_l),
        .clk_en(sample_clk_en),
        .*
    ); 
`endif    
    
    /*
     * The Zynq CPU
     */
    processing_system7_0 cpu (
        .*
    );
    
    //always_comb M_AXI_GP0_ACLK = clk;
    
/*    axi_protocol_converter_0 axi_protocol_converter(
        .aclk(clk),
        .aresetn(!reset),
        .s_axi_awaddr(M_AXI_GP0_AWADDR),
        .s_axi_awlen(M_AXI_GP0_AWLEN),
        .s_axi_awsize(M_AXI_GP0_AWSIZE),
        .s_axi_awburst(M_AXI_GP0_AWBURST),
        .s_axi_awlock(M_AXI_GP0_AWLOCK),
        .s_axi_awcache(M_AXI_GP0_AWCACHE),
        .s_axi_awprot(M_AXI_GP0_AWPROT),
        .s_axi_awqos(M_AXI_GP0_AWQOS),
        .s_axi_awvalid(M_AXI_GP0_AWVALID),
        .s_axi_awready(M_AXI_GP0_AWREADY),
        .s_axi_wdata(M_AXI_GP0_WDATA),
        .s_axi_wstrb(M_AXI_GP0_WSTRB),
        .s_axi_wlast(M_AXI_GP0_WLAST),
        .s_axi_wvalid(M_AXI_GP0_WVALID),
        .s_axi_wready(M_AXI_GP0_WREADY),
        .s_axi_bresp(M_AXI_GP0_BRESP),
        .s_axi_bvalid(M_AXI_GP0_BVALID),
        .s_axi_bready(M_AXI_GP0_BREADY),
        .s_axi_araddr(M_AXI_GP0_ARADDR),
        .s_axi_arlen(M_AXI_GP0_ARLEN),
        .s_axi_arsize(M_AXI_GP0_ARSIZE),
        .s_axi_arburst(M_AXI_GP0_ARBURST),
        .s_axi_arlock(M_AXI_GP0_ARLOCK),
        .s_axi_arcache(M_AXI_GP0_ARCACHE),
        .s_axi_arprot(M_AXI_GP0_ARPROT),
        .s_axi_arqos(M_AXI_GP0_ARQOS),
        .s_axi_arvalid(M_AXI_GP0_ARVALID),
        .s_axi_arready(M_AXI_GP0_ARREADY),
        .s_axi_rdata(M_AXI_GP0_RDATA),
        .s_axi_rresp(M_AXI_GP0_RRESP),
        .s_axi_rlast(M_AXI_GP0_RLAST),
        .s_axi_rvalid(M_AXI_GP0_RVALID),
        .s_axi_rready(M_AXI_GP0_RREADY),
        .*
    ); */
    
 /*   register_file register_file (
        .*
    );    */
    
    always_comb ac_mute_n = 1;
    
    /*
     * Instantiate tri-state buffers for I2C
     */
    assign i2c_scl = I2C0_SCL_T ? 1'bZ : I2C0_SCL_O;
    assign i2c_sda = I2C0_SDA_T ? 1'bZ : I2C0_SDA_O;
    assign I2C0_SCL_I = i2c_scl;
    assign I2C0_SDA_I = i2c_sda;
endmodule
`default_nettype wire  // re-enable implicit net type declarations
