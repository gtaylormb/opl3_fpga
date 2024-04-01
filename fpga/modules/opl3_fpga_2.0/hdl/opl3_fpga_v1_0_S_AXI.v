/*
 * This module was automatically created by the Xilinx AXI Peripheral wizard.
 * 
 * I modified it to remove unused registers and also removed some dumb code.
 *  -Greg
 */

`timescale 1 ns / 1 ps

	module opl3_fpga_v1_0_S_AXI #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Width of S_AXI data bus
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		// Width of S_AXI address bus
		parameter integer C_S_AXI_ADDR_WIDTH	= 9
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line

		// Global Clock Signal
		input wire  S_AXI_ACLK,
		// Global Reset Signal. This Signal is Active LOW
		input wire  S_AXI_ARESETN,
		// Write address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
		// Write channel Protection type. This signal indicates the
    		// privilege and security level of the transaction, and whether
    		// the transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_AWPROT,
		// Write address valid. This signal indicates that the master signaling
    		// valid write address and control information.
		input wire  S_AXI_AWVALID,
		// Write address ready. This signal indicates that the slave is ready
    		// to accept an address and associated control signals.
		output wire  S_AXI_AWREADY,
		// Write data (issued by master, acceped by Slave) 
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
		// Write strobes. This signal indicates which byte lanes hold
    		// valid data. There is one write strobe bit for each eight
    		// bits of the write data bus.    
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
		// Write valid. This signal indicates that valid write
    		// data and strobes are available.
		input wire  S_AXI_WVALID,
		// Write ready. This signal indicates that the slave
    		// can accept the write data.
		output wire  S_AXI_WREADY,
		// Write response. This signal indicates the status
    		// of the write transaction.
		output wire [1 : 0] S_AXI_BRESP,
		// Write response valid. This signal indicates that the channel
    		// is signaling a valid write response.
		output wire  S_AXI_BVALID,
		// Response ready. This signal indicates that the master
    		// can accept a write response.
		input wire  S_AXI_BREADY,
		// Read address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
		// Protection type. This signal indicates the privilege
    		// and security level of the transaction, and whether the
    		// transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_ARPROT,
		// Read address valid. This signal indicates that the channel
    		// is signaling valid read address and control information.
		input wire  S_AXI_ARVALID,
		// Read address ready. This signal indicates that the slave is
    		// ready to accept an address and associated control signals.
		output wire  S_AXI_ARREADY,
		// Read data (issued by slave)
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
		// Read response. This signal indicates the status of the
    		// read transfer.
		output wire [1 : 0] S_AXI_RRESP,
		// Read valid. This signal indicates that the channel is
    		// signaling the required read data.
		output wire  S_AXI_RVALID,
		// Read ready. This signal indicates that the master can
    		// accept the read data and response information.
		input wire  S_AXI_RREADY,
        
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg0,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg1,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg2,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg3,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg4,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg5,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg6,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg7,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg8,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg9,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg10,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg11,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg12,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg13,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg14,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg15,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg16,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg17,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg18,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg19,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg20,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg21,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg22,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg23,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg24,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg25,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg26,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg27,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg28,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg29,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg30,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg31,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg32,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg33,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg34,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg35,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg36,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg37,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg38,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg39,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg40,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg41,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg42,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg43,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg44,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg45,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg46,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg47,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg48,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg49,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg50,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg51,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg52,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg53,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg54,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg55,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg56,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg57,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg58,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg59,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg60,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg61,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg62,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg63,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg64,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg65,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg66,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg67,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg68,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg69,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg70,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg71,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg72,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg73,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg74,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg75,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg76,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg77,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg78,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg79,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg80,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg81,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg82,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg83,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg84,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg85,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg86,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg87,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg88,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg89,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg90,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg91,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg92,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg93,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg94,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg95,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg96,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg97,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg98,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg99,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg100,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg101,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg102,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg103,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg104,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg105,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg106,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg107,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg108,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg109,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg110,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg111,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg112,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg113,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg114,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg115,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg116,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg117,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg118,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg119,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg120,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg121,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg122,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg123,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg124,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg125,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg126,
        output reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg127        
        
	);

	// AXI4LITE signals
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awready;
	reg  	axi_wready;
	reg [1 : 0] 	axi_bresp;
	reg  	axi_bvalid;
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	axi_arready;
	reg [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
	reg [1 : 0] 	axi_rresp;
	reg  	axi_rvalid;

	// Example-specific design signals
	// local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	// ADDR_LSB is used for addressing 32/64 bit registers/memories
	// ADDR_LSB = 2 for 32 bits (n downto 2)
	// ADDR_LSB = 3 for 64 bits (n downto 3)
	localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
	localparam integer OPT_MEM_ADDR_BITS = 6;
	//----------------------------------------------
	//-- Signals for user logic register space example
	//------------------------------------------------
	//-- Number of Slave Registers 128

	wire	 slv_reg_rden;
	wire	 slv_reg_wren;
	reg [C_S_AXI_DATA_WIDTH-1:0]	 reg_data_out;
	integer	 byte_index;

	// I/O Connections assignments

	assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY	= axi_wready;
	assign S_AXI_BRESP	= axi_bresp;
	assign S_AXI_BVALID	= axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	assign S_AXI_RDATA	= axi_rdata;
	assign S_AXI_RRESP	= axi_rresp;
	assign S_AXI_RVALID	= axi_rvalid;
	// Implement axi_awready generation
	// axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	// de-asserted when reset is low.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID)
	        begin
	          // slave is ready to accept write address when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_awready <= 1'b1;
	        end
	      else           
	        begin
	          axi_awready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_awaddr latching
	// This process is used to latch the address when both 
	// S_AXI_AWVALID and S_AXI_WVALID are valid. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awaddr <= 0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID)
	        begin
	          // Write Address latching 
	          axi_awaddr <= S_AXI_AWADDR;
	        end
	    end 
	end       

	// Implement axi_wready generation
	// axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	// de-asserted when reset is low. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_wready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID)
	        begin
	          // slave is ready to accept write data when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_wready <= 1'b1;
	        end
	      else
	        begin
	          axi_wready <= 1'b0;
	        end
	    end 
	end       

	// Implement memory mapped register select and write logic generation
	// The write data is accepted and written to memory mapped registers when
	// axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	// select byte enables of slave registers while writing.
	// These registers are cleared when reset (active low) is applied.
	// Slave register write enable is asserted when valid address and data are available
	// and the slave is ready to accept the write address and write data.
	assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      slv_reg0 <= 0;
	      slv_reg1 <= 0;
	      slv_reg2 <= 0;
	      slv_reg3 <= 0;
	      slv_reg4 <= 0;
	      slv_reg5 <= 0;
	      slv_reg6 <= 0;
	      slv_reg7 <= 0;
	      slv_reg8 <= 0;
	      slv_reg9 <= 0;
	      slv_reg10 <= 0;
	      slv_reg11 <= 0;
	      slv_reg12 <= 0;
	      slv_reg13 <= 0;
	      slv_reg14 <= 0;
	      slv_reg15 <= 0;
	      slv_reg16 <= 0;
	      slv_reg17 <= 0;
	      slv_reg18 <= 0;
	      slv_reg19 <= 0;
	      slv_reg20 <= 0;
	      slv_reg21 <= 0;
	      slv_reg22 <= 0;
	      slv_reg23 <= 0;
	      slv_reg24 <= 0;
	      slv_reg25 <= 0;
	      slv_reg26 <= 0;
	      slv_reg27 <= 0;
	      slv_reg28 <= 0;
	      slv_reg29 <= 0;
	      slv_reg30 <= 0;
	      slv_reg31 <= 0;
	      slv_reg32 <= 0;
	      slv_reg33 <= 0;
	      slv_reg34 <= 0;
	      slv_reg35 <= 0;
	      slv_reg36 <= 0;
	      slv_reg37 <= 0;
	      slv_reg38 <= 0;
	      slv_reg39 <= 0;
	      slv_reg40 <= 0;
	      slv_reg41 <= 0;
	      slv_reg42 <= 0;
	      slv_reg43 <= 0;
	      slv_reg44 <= 0;
	      slv_reg45 <= 0;
	      slv_reg46 <= 0;
	      slv_reg47 <= 0;
	      slv_reg48 <= 0;
	      slv_reg49 <= 0;
	      slv_reg50 <= 0;
	      slv_reg51 <= 0;
	      slv_reg52 <= 0;
	      slv_reg53 <= 0;
	      slv_reg54 <= 0;
	      slv_reg55 <= 0;
	      slv_reg56 <= 0;
	      slv_reg57 <= 0;
	      slv_reg58 <= 0;
	      slv_reg59 <= 0;
	      slv_reg60 <= 0;
	      slv_reg61 <= 0;
	      slv_reg62 <= 0;
	      slv_reg63 <= 0;
	      slv_reg64 <= 0;
	      slv_reg65 <= 0;
	      slv_reg66 <= 0;
	      slv_reg67 <= 0;
	      slv_reg68 <= 0;
	      slv_reg69 <= 0;
	      slv_reg70 <= 0;
	      slv_reg71 <= 0;
	      slv_reg72 <= 0;
	      slv_reg73 <= 0;
	      slv_reg74 <= 0;
	      slv_reg75 <= 0;
	      slv_reg76 <= 0;
	      slv_reg77 <= 0;
	      slv_reg78 <= 0;
	      slv_reg79 <= 0;
	      slv_reg80 <= 0;
	      slv_reg81 <= 0;
	      slv_reg82 <= 0;
	      slv_reg83 <= 0;
	      slv_reg84 <= 0;
	      slv_reg85 <= 0;
	      slv_reg86 <= 0;
	      slv_reg87 <= 0;
	      slv_reg88 <= 0;
	      slv_reg89 <= 0;
	      slv_reg90 <= 0;
	      slv_reg91 <= 0;
	      slv_reg92 <= 0;
	      slv_reg93 <= 0;
	      slv_reg94 <= 0;
	      slv_reg95 <= 0;
	      slv_reg96 <= 0;
	      slv_reg97 <= 0;
	      slv_reg98 <= 0;
	      slv_reg99 <= 0;
	      slv_reg100 <= 0;
	      slv_reg101 <= 0;
	      slv_reg102 <= 0;
	      slv_reg103 <= 0;
	      slv_reg104 <= 0;
	      slv_reg105 <= 0;
	      slv_reg106 <= 0;
	      slv_reg107 <= 0;
	      slv_reg108 <= 0;
	      slv_reg109 <= 0;
	      slv_reg110 <= 0;
	      slv_reg111 <= 0;
	      slv_reg112 <= 0;
	      slv_reg113 <= 0;
	      slv_reg114 <= 0;
	      slv_reg115 <= 0;
	      slv_reg116 <= 0;
	      slv_reg117 <= 0;
	      slv_reg118 <= 0;
	      slv_reg119 <= 0;
	      slv_reg120 <= 0;
	      slv_reg121 <= 0;
	      slv_reg122 <= 0;
	      slv_reg123 <= 0;
	      slv_reg124 <= 0;
	      slv_reg125 <= 0;
	      slv_reg126 <= 0;
	      slv_reg127 <= 0;
	    end 
	  else begin
	    if (slv_reg_wren)
	      begin
	        case ( axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
	          7'h00:
                if (INSTANTIATE_TIMERS)    
    	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
    	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
    	                // Respective byte enables are asserted as per write strobes 
    	                // Slave register 0
    	                slv_reg0[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
    	              end
	          7'h01:
                if (INSTANTIATE_TIMERS)   
    	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
    	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
    	                // Respective byte enables are asserted as per write strobes 
                        // Slave register 1
                        slv_reg1[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end
	          7'h02:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                  if (byte_index != 0)
                      slv_reg2[(byte_index*8) +: 8] <= 0;
                  else if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 2
	                slv_reg2[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h08:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 8
	                slv_reg8[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h09:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 9
	                slv_reg9[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h0A:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 10
	                slv_reg10[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h0B:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 11
	                slv_reg11[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h0C:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 12
	                slv_reg12[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h0D:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 13
	                slv_reg13[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h10:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 16
	                slv_reg16[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h11:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 17
	                slv_reg17[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h12:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 18
	                slv_reg18[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h13:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 19
	                slv_reg19[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h14:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 20
	                slv_reg20[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h15:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 21
	                slv_reg21[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h18:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 24
	                slv_reg24[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h19:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 25
	                slv_reg25[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h1A:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 26
	                slv_reg26[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h1B:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 27
	                slv_reg27[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h1C:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 28
	                slv_reg28[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h1D:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 29
	                slv_reg29[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h20:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 32
	                slv_reg32[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h21:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 33
	                slv_reg33[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h22:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 34
	                slv_reg34[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h23:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 35
	                slv_reg35[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h24:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 36
	                slv_reg36[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h25:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 37
	                slv_reg37[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h28:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 40
	                slv_reg40[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h29:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 41
	                slv_reg41[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h2A:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 42
	                slv_reg42[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h2C:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 44
	                slv_reg44[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h2D:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 45
	                slv_reg45[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h2E:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 46
	                slv_reg46[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h2F:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 47
	                slv_reg47[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h30:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 48
	                slv_reg48[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h31:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 49
	                slv_reg49[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h32:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 50
	                slv_reg50[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h38:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 56
	                slv_reg56[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h39:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 57
	                slv_reg57[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h3A:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 58
	                slv_reg58[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h3B:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 59
	                slv_reg59[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h3C:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 60
	                slv_reg60[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h3D:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 61
	                slv_reg61[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h41:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 65
	                slv_reg65[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h48:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 72
	                slv_reg72[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h49:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 73
	                slv_reg73[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h4A:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 74
	                slv_reg74[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h4B:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 75
	                slv_reg75[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h4C:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 76
	                slv_reg76[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h4D:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 77
	                slv_reg77[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h50:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 80
	                slv_reg80[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h51:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 81
	                slv_reg81[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h52:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 82
	                slv_reg82[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h53:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 83
	                slv_reg83[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h54:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 84
	                slv_reg84[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h55:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 85
	                slv_reg85[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h56:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 86
	                slv_reg86[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h57:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 87
	                slv_reg87[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h58:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 88
	                slv_reg88[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h59:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 89
	                slv_reg89[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h5A:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 90
	                slv_reg90[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h5B:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 91
	                slv_reg91[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h5C:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 92
	                slv_reg92[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h5D:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 93
	                slv_reg93[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h60:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 96
	                slv_reg96[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h61:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 97
	                slv_reg97[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h62:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 98
	                slv_reg98[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h63:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 99
	                slv_reg99[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h64:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 100
	                slv_reg100[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h65:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 101
	                slv_reg101[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h66:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 102
	                slv_reg102[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h67:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 103
	                slv_reg103[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h68:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 104
	                slv_reg104[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h69:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 105
	                slv_reg105[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h6A:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 106
	                slv_reg106[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h6C:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 108
	                slv_reg108[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h6D:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 109
	                slv_reg109[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h6E:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 110
	                slv_reg110[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h6F:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 111
	                slv_reg111[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h70:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 112
	                slv_reg112[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h71:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 113
	                slv_reg113[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h72:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 114
	                slv_reg114[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h78:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 120
	                slv_reg120[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h79:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 121
	                slv_reg121[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h7A:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 122
	                slv_reg122[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h7B:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 123
	                slv_reg123[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h7C:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 124
	                slv_reg124[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          7'h7D:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 125
	                slv_reg125[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          default : ;
	        endcase
	      end
	  end
	end    

	// Implement write response logic generation
	// The write response and response valid signals are asserted by the slave 
	// when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	// This marks the acceptance of address and indicates the status of 
	// write transaction.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_bvalid  <= 0;
	      axi_bresp   <= 2'b0;
	    end 
	  else
	    begin    
	      if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID)
	        begin
	          // indicates a valid write response is available
	          axi_bvalid <= 1'b1;
	          axi_bresp  <= 2'b0; // 'OKAY' response 
	        end                   // work error responses in future
	      else
	        begin
	          if (S_AXI_BREADY && axi_bvalid) 
	            //check if bready is asserted while bvalid is high) 
	            //(there is a possibility that bready is always asserted high)   
	            begin
	              axi_bvalid <= 1'b0; 
	            end  
	        end
	    end
	end   

	// Implement axi_arready generation
	// axi_arready is asserted for one S_AXI_ACLK clock cycle when
	// S_AXI_ARVALID is asserted. axi_awready is 
	// de-asserted when reset (active low) is asserted. 
	// The read address is also latched when S_AXI_ARVALID is 
	// asserted. axi_araddr is reset to zero on reset assertion.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_arready <= 1'b0;
	      axi_araddr  <= 32'b0;
	    end 
	  else
	    begin    
	      if (~axi_arready && S_AXI_ARVALID)
	        begin
	          // indicates that the slave has acceped the valid read address
	          axi_arready <= 1'b1;
	          // Read address latching
	          axi_araddr  <= S_AXI_ARADDR;
	        end
	      else
	        begin
	          axi_arready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_arvalid generation
	// axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	// S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	// data are available on the axi_rdata bus at this instance. The 
	// assertion of axi_rvalid marks the validity of read data on the 
	// bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	// is deasserted on reset (active low). axi_rresp and axi_rdata are 
	// cleared to zero on reset (active low).  
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rvalid <= 0;
	      axi_rresp  <= 0;
	    end 
	  else
	    begin    
	      if (axi_arready && S_AXI_ARVALID && ~axi_rvalid)
	        begin
	          // Valid read data is available at the read data bus
	          axi_rvalid <= 1'b1;
	          axi_rresp  <= 2'b0; // 'OKAY' response
	        end   
	      else if (axi_rvalid && S_AXI_RREADY)
	        begin
	          // Read data is accepted by the master
	          axi_rvalid <= 1'b0;
	        end                
	    end
	end    

	// Implement memory mapped register select and read logic generation
	// Slave register read enable is asserted when valid address is available
	// and the slave is ready to accept the read address.
	assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;
	always @(*)
	begin
	      // Address decoding for reading registers
	      case ( axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
	        7'h00   : reg_data_out <= slv_reg0;
	        7'h01   : reg_data_out <= slv_reg1;
	        7'h02   : reg_data_out <= slv_reg2;
	        7'h03   : reg_data_out <= slv_reg3;
	        7'h04   : reg_data_out <= slv_reg4;
	        7'h05   : reg_data_out <= slv_reg5;
	        7'h06   : reg_data_out <= slv_reg6;
	        7'h07   : reg_data_out <= slv_reg7;
	        7'h08   : reg_data_out <= slv_reg8;
	        7'h09   : reg_data_out <= slv_reg9;
	        7'h0A   : reg_data_out <= slv_reg10;
	        7'h0B   : reg_data_out <= slv_reg11;
	        7'h0C   : reg_data_out <= slv_reg12;
	        7'h0D   : reg_data_out <= slv_reg13;
	        7'h0E   : reg_data_out <= slv_reg14;
	        7'h0F   : reg_data_out <= slv_reg15;
	        7'h10   : reg_data_out <= slv_reg16;
	        7'h11   : reg_data_out <= slv_reg17;
	        7'h12   : reg_data_out <= slv_reg18;
	        7'h13   : reg_data_out <= slv_reg19;
	        7'h14   : reg_data_out <= slv_reg20;
	        7'h15   : reg_data_out <= slv_reg21;
	        7'h16   : reg_data_out <= slv_reg22;
	        7'h17   : reg_data_out <= slv_reg23;
	        7'h18   : reg_data_out <= slv_reg24;
	        7'h19   : reg_data_out <= slv_reg25;
	        7'h1A   : reg_data_out <= slv_reg26;
	        7'h1B   : reg_data_out <= slv_reg27;
	        7'h1C   : reg_data_out <= slv_reg28;
	        7'h1D   : reg_data_out <= slv_reg29;
	        7'h1E   : reg_data_out <= slv_reg30;
	        7'h1F   : reg_data_out <= slv_reg31;
	        7'h20   : reg_data_out <= slv_reg32;
	        7'h21   : reg_data_out <= slv_reg33;
	        7'h22   : reg_data_out <= slv_reg34;
	        7'h23   : reg_data_out <= slv_reg35;
	        7'h24   : reg_data_out <= slv_reg36;
	        7'h25   : reg_data_out <= slv_reg37;
	        7'h26   : reg_data_out <= slv_reg38;
	        7'h27   : reg_data_out <= slv_reg39;
	        7'h28   : reg_data_out <= slv_reg40;
	        7'h29   : reg_data_out <= slv_reg41;
	        7'h2A   : reg_data_out <= slv_reg42;
	        7'h2B   : reg_data_out <= slv_reg43;
	        7'h2C   : reg_data_out <= slv_reg44;
	        7'h2D   : reg_data_out <= slv_reg45;
	        7'h2E   : reg_data_out <= slv_reg46;
	        7'h2F   : reg_data_out <= slv_reg47;
	        7'h30   : reg_data_out <= slv_reg48;
	        7'h31   : reg_data_out <= slv_reg49;
	        7'h32   : reg_data_out <= slv_reg50;
	        7'h33   : reg_data_out <= slv_reg51;
	        7'h34   : reg_data_out <= slv_reg52;
	        7'h35   : reg_data_out <= slv_reg53;
	        7'h36   : reg_data_out <= slv_reg54;
	        7'h37   : reg_data_out <= slv_reg55;
	        7'h38   : reg_data_out <= slv_reg56;
	        7'h39   : reg_data_out <= slv_reg57;
	        7'h3A   : reg_data_out <= slv_reg58;
	        7'h3B   : reg_data_out <= slv_reg59;
	        7'h3C   : reg_data_out <= slv_reg60;
	        7'h3D   : reg_data_out <= slv_reg61;
	        7'h3E   : reg_data_out <= slv_reg62;
	        7'h3F   : reg_data_out <= slv_reg63;
	        7'h40   : reg_data_out <= slv_reg64;
	        7'h41   : reg_data_out <= slv_reg65;
	        7'h42   : reg_data_out <= slv_reg66;
	        7'h43   : reg_data_out <= slv_reg67;
	        7'h44   : reg_data_out <= slv_reg68;
	        7'h45   : reg_data_out <= slv_reg69;
	        7'h46   : reg_data_out <= slv_reg70;
	        7'h47   : reg_data_out <= slv_reg71;
	        7'h48   : reg_data_out <= slv_reg72;
	        7'h49   : reg_data_out <= slv_reg73;
	        7'h4A   : reg_data_out <= slv_reg74;
	        7'h4B   : reg_data_out <= slv_reg75;
	        7'h4C   : reg_data_out <= slv_reg76;
	        7'h4D   : reg_data_out <= slv_reg77;
	        7'h4E   : reg_data_out <= slv_reg78;
	        7'h4F   : reg_data_out <= slv_reg79;
	        7'h50   : reg_data_out <= slv_reg80;
	        7'h51   : reg_data_out <= slv_reg81;
	        7'h52   : reg_data_out <= slv_reg82;
	        7'h53   : reg_data_out <= slv_reg83;
	        7'h54   : reg_data_out <= slv_reg84;
	        7'h55   : reg_data_out <= slv_reg85;
	        7'h56   : reg_data_out <= slv_reg86;
	        7'h57   : reg_data_out <= slv_reg87;
	        7'h58   : reg_data_out <= slv_reg88;
	        7'h59   : reg_data_out <= slv_reg89;
	        7'h5A   : reg_data_out <= slv_reg90;
	        7'h5B   : reg_data_out <= slv_reg91;
	        7'h5C   : reg_data_out <= slv_reg92;
	        7'h5D   : reg_data_out <= slv_reg93;
	        7'h5E   : reg_data_out <= slv_reg94;
	        7'h5F   : reg_data_out <= slv_reg95;
	        7'h60   : reg_data_out <= slv_reg96;
	        7'h61   : reg_data_out <= slv_reg97;
	        7'h62   : reg_data_out <= slv_reg98;
	        7'h63   : reg_data_out <= slv_reg99;
	        7'h64   : reg_data_out <= slv_reg100;
	        7'h65   : reg_data_out <= slv_reg101;
	        7'h66   : reg_data_out <= slv_reg102;
	        7'h67   : reg_data_out <= slv_reg103;
	        7'h68   : reg_data_out <= slv_reg104;
	        7'h69   : reg_data_out <= slv_reg105;
	        7'h6A   : reg_data_out <= slv_reg106;
	        7'h6B   : reg_data_out <= slv_reg107;
	        7'h6C   : reg_data_out <= slv_reg108;
	        7'h6D   : reg_data_out <= slv_reg109;
	        7'h6E   : reg_data_out <= slv_reg110;
	        7'h6F   : reg_data_out <= slv_reg111;
	        7'h70   : reg_data_out <= slv_reg112;
	        7'h71   : reg_data_out <= slv_reg113;
	        7'h72   : reg_data_out <= slv_reg114;
	        7'h73   : reg_data_out <= slv_reg115;
	        7'h74   : reg_data_out <= slv_reg116;
	        7'h75   : reg_data_out <= slv_reg117;
	        7'h76   : reg_data_out <= slv_reg118;
	        7'h77   : reg_data_out <= slv_reg119;
	        7'h78   : reg_data_out <= slv_reg120;
	        7'h79   : reg_data_out <= slv_reg121;
	        7'h7A   : reg_data_out <= slv_reg122;
	        7'h7B   : reg_data_out <= slv_reg123;
	        7'h7C   : reg_data_out <= slv_reg124;
	        7'h7D   : reg_data_out <= slv_reg125;
	        7'h7E   : reg_data_out <= slv_reg126;
	        7'h7F   : reg_data_out <= slv_reg127;
	        default : reg_data_out <= 0;
	      endcase
	end

	// Output register or memory read data
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rdata  <= 0;
	    end 
	  else
	    begin    
	      // When there is a valid read address (S_AXI_ARVALID) with 
	      // acceptance of read address by the slave (axi_arready), 
	      // output the read dada 
	      if (slv_reg_rden)
	        begin
	          axi_rdata <= reg_data_out;     // register read data
	        end   
	    end
	end    

	// Add user logic here

	// User logic ends

	endmodule

