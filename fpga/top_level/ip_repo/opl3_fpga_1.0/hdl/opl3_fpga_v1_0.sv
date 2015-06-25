
`timescale 1 ns / 1 ps

	module opl3_fpga_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S_AXI
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		parameter integer C_S_AXI_ADDR_WIDTH	= 8,

		// Parameters of Axi Slave Bus Interface S_AXI_INTR
		parameter integer C_S_AXI_INTR_DATA_WIDTH	= 32,
		parameter integer C_S_AXI_INTR_ADDR_WIDTH	= 5,
		parameter integer C_NUM_OF_INTR	= 1,
		parameter  C_INTR_SENSITIVITY	= 32'hFFFFFFFF,
		parameter  C_INTR_ACTIVE_STATE	= 32'hFFFFFFFF,
		parameter integer C_IRQ_SENSITIVITY	= 1,
		parameter integer C_IRQ_ACTIVE_STATE	= 1
	)
	(
		// Users to add ports here
		input wire clk125,
        output wire clk12,
        
        output wire i2s_sclk,
        output wire i2s_ws,
        output wire i2s_sd,
        output wire ac_mute_n,        
        output wire [3:0] led,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S_AXI
		input wire  s_axi_aclk,
		input wire  s_axi_aresetn,
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] s_axi_awaddr,
		input wire [2 : 0] s_axi_awprot,
		input wire  s_axi_awvalid,
		output wire  s_axi_awready,
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] s_axi_wdata,
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] s_axi_wstrb,
		input wire  s_axi_wvalid,
		output wire  s_axi_wready,
		output wire [1 : 0] s_axi_bresp,
		output wire  s_axi_bvalid,
		input wire  s_axi_bready,
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] s_axi_araddr,
		input wire [2 : 0] s_axi_arprot,
		input wire  s_axi_arvalid,
		output wire  s_axi_arready,
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] s_axi_rdata,
		output wire [1 : 0] s_axi_rresp,
		output wire  s_axi_rvalid,
		input wire  s_axi_rready,

		// Ports of Axi Slave Bus Interface S_AXI_INTR
		input wire  s_axi_intr_aclk,
		input wire  s_axi_intr_aresetn,
		input wire [C_S_AXI_INTR_ADDR_WIDTH-1 : 0] s_axi_intr_awaddr,
		input wire [2 : 0] s_axi_intr_awprot,
		input wire  s_axi_intr_awvalid,
		output wire  s_axi_intr_awready,
		input wire [C_S_AXI_INTR_DATA_WIDTH-1 : 0] s_axi_intr_wdata,
		input wire [(C_S_AXI_INTR_DATA_WIDTH/8)-1 : 0] s_axi_intr_wstrb,
		input wire  s_axi_intr_wvalid,
		output wire  s_axi_intr_wready,
		output wire [1 : 0] s_axi_intr_bresp,
		output wire  s_axi_intr_bvalid,
		input wire  s_axi_intr_bready,
		input wire [C_S_AXI_INTR_ADDR_WIDTH-1 : 0] s_axi_intr_araddr,
		input wire [2 : 0] s_axi_intr_arprot,
		input wire  s_axi_intr_arvalid,
		output wire  s_axi_intr_arready,
		output wire [C_S_AXI_INTR_DATA_WIDTH-1 : 0] s_axi_intr_rdata,
		output wire [1 : 0] s_axi_intr_rresp,
		output wire  s_axi_intr_rvalid,
		input wire  s_axi_intr_rready,
		output wire  irq
	);
	
	//----------------------------------------------
    //-- Signals for user logic register space example
    //------------------------------------------------
    //-- Number of Slave Registers 61
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg0;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg1;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg2;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg3;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg4;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg5;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg6;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg7;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg8;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg9;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg10;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg11;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg12;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg13;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg14;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg15;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg16;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg17;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg18;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg19;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg20;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg21;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg22;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg23;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg24;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg25;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg26;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg27;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg28;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg29;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg30;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg31;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg32;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg33;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg34;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg35;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg36;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg37;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg38;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg39;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg40;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg41;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg42;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg43;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg44;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg45;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg46;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg47;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg48;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg49;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg50;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg51;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg52;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg53;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg54;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg55;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg56;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg57;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg58;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg59;
    logic [C_S_AXI_DATA_WIDTH-1:0]    slv_reg60;	
    
    logic [C_S_AXI_DATA_WIDTH-1:0] slv_reg [61];
	
// Instantiation of Axi Bus Interface S_AXI
	opl3_fpga_v1_0_S_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH)
	) opl3_fpga_v1_0_S_AXI_inst (
		.S_AXI_ACLK(s_axi_aclk),
		.S_AXI_ARESETN(s_axi_aresetn),
		.S_AXI_AWADDR(s_axi_awaddr),
		.S_AXI_AWPROT(s_axi_awprot),
		.S_AXI_AWVALID(s_axi_awvalid),
		.S_AXI_AWREADY(s_axi_awready),
		.S_AXI_WDATA(s_axi_wdata),
		.S_AXI_WSTRB(s_axi_wstrb),
		.S_AXI_WVALID(s_axi_wvalid),
		.S_AXI_WREADY(s_axi_wready),
		.S_AXI_BRESP(s_axi_bresp),
		.S_AXI_BVALID(s_axi_bvalid),
		.S_AXI_BREADY(s_axi_bready),
		.S_AXI_ARADDR(s_axi_araddr),
		.S_AXI_ARPROT(s_axi_arprot),
		.S_AXI_ARVALID(s_axi_arvalid),
		.S_AXI_ARREADY(s_axi_arready),
		.S_AXI_RDATA(s_axi_rdata),
		.S_AXI_RRESP(s_axi_rresp),
		.S_AXI_RVALID(s_axi_rvalid),
		.S_AXI_RREADY(s_axi_rready)
	);

// Instantiation of Axi Bus Interface S_AXI_INTR
	opl3_fpga_v1_0_S_AXI_INTR # ( 
		.C_S_AXI_DATA_WIDTH(C_S_AXI_INTR_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S_AXI_INTR_ADDR_WIDTH),
		.C_NUM_OF_INTR(C_NUM_OF_INTR),
		.C_INTR_SENSITIVITY(C_INTR_SENSITIVITY),
		.C_INTR_ACTIVE_STATE(C_INTR_ACTIVE_STATE),
		.C_IRQ_SENSITIVITY(C_IRQ_SENSITIVITY),
		.C_IRQ_ACTIVE_STATE(C_IRQ_ACTIVE_STATE)
	) opl3_fpga_v1_0_S_AXI_INTR_inst (
		.S_AXI_ACLK(s_axi_intr_aclk),
		.S_AXI_ARESETN(s_axi_intr_aresetn),
		.S_AXI_AWADDR(s_axi_intr_awaddr),
		.S_AXI_AWPROT(s_axi_intr_awprot),
		.S_AXI_AWVALID(s_axi_intr_awvalid),
		.S_AXI_AWREADY(s_axi_intr_awready),
		.S_AXI_WDATA(s_axi_intr_wdata),
		.S_AXI_WSTRB(s_axi_intr_wstrb),
		.S_AXI_WVALID(s_axi_intr_wvalid),
		.S_AXI_WREADY(s_axi_intr_wready),
		.S_AXI_BRESP(s_axi_intr_bresp),
		.S_AXI_BVALID(s_axi_intr_bvalid),
		.S_AXI_BREADY(s_axi_intr_bready),
		.S_AXI_ARADDR(s_axi_intr_araddr),
		.S_AXI_ARPROT(s_axi_intr_arprot),
		.S_AXI_ARVALID(s_axi_intr_arvalid),
		.S_AXI_ARREADY(s_axi_intr_arready),
		.S_AXI_RDATA(s_axi_intr_rdata),
		.S_AXI_RRESP(s_axi_intr_rresp),
		.S_AXI_RVALID(s_axi_intr_rvalid),
		.S_AXI_RREADY(s_axi_intr_rready),
		.irq(irq)
	);

	// Add user logic here
    
    /*
     * Convert the auto generated Verilog registers into a SV-style unpacked 2D
     * array.
     */
    always_comb begin
         slv_reg[0] = slv_reg0;
         slv_reg[1] = slv_reg1;         
         slv_reg[2] = slv_reg2;
         slv_reg[3] = slv_reg3;
         slv_reg[4] = slv_reg4;         
         slv_reg[5] = slv_reg5;             
         slv_reg[6] = slv_reg6;
         slv_reg[7] = slv_reg7;         
         slv_reg[8] = slv_reg8;             
         slv_reg[9] = slv_reg9;
         slv_reg[10] = slv_reg10;         
         slv_reg[11] = slv_reg11;             
         slv_reg[12] = slv_reg12;
         slv_reg[13] = slv_reg13;         
         slv_reg[14] = slv_reg14;             
         slv_reg[15] = slv_reg15;
         slv_reg[16] = slv_reg16;         
         slv_reg[17] = slv_reg17;             
         slv_reg[18] = slv_reg18;
         slv_reg[19] = slv_reg19;         
         slv_reg[20] = slv_reg20;
         slv_reg[21] = slv_reg21;
         slv_reg[22] = slv_reg22;         
         slv_reg[23] = slv_reg23;
         slv_reg[24] = slv_reg24;
         slv_reg[25] = slv_reg25;         
         slv_reg[26] = slv_reg26;
         slv_reg[27] = slv_reg27;
         slv_reg[28] = slv_reg28;         
         slv_reg[29] = slv_reg29;
         slv_reg[30] = slv_reg30;
         slv_reg[31] = slv_reg31;         
         slv_reg[32] = slv_reg32;
         slv_reg[33] = slv_reg33;
         slv_reg[34] = slv_reg34;         
         slv_reg[35] = slv_reg35;             
         slv_reg[36] = slv_reg36;
         slv_reg[37] = slv_reg37;         
         slv_reg[38] = slv_reg38;             
         slv_reg[39] = slv_reg39;
         slv_reg[40] = slv_reg40;         
         slv_reg[41] = slv_reg41;             
         slv_reg[42] = slv_reg42;
         slv_reg[43] = slv_reg43;         
         slv_reg[44] = slv_reg44;             
         slv_reg[45] = slv_reg45;
         slv_reg[46] = slv_reg46;         
         slv_reg[47] = slv_reg47;             
         slv_reg[48] = slv_reg48;
         slv_reg[49] = slv_reg49;         
         slv_reg[50] = slv_reg50;
         slv_reg[51] = slv_reg51;
         slv_reg[52] = slv_reg52;         
         slv_reg[53] = slv_reg53;
         slv_reg[54] = slv_reg54;
         slv_reg[55] = slv_reg55;         
         slv_reg[56] = slv_reg56;
         slv_reg[57] = slv_reg57;
         slv_reg[58] = slv_reg58;         
         slv_reg[59] = slv_reg59;
         slv_reg[60] = slv_reg60;
    end
                                                                       
	opl3 #(
		.C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH)	
	) opl3 (
       .clk(clk12),
       .*
    );      

	// User logic ends

	endmodule
