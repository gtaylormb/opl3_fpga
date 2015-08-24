/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: opl3_axi_wrapper.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 15 Nov 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   15 Nov 2014    Greg Taylor
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

module opl3_axi_wrapper #(
    // Parameters of Axi Slave Bus Interface S_AXI
    parameter integer C_S_AXI_DATA_WIDTH = 32,
    parameter integer C_S_AXI_ADDR_WIDTH = 9
)(
    (* mark_debug = "true" *) output logic cs,
    (* mark_debug = "true" *) output logic rd,
    (* mark_debug = "true" *) output logic wr,
    (* mark_debug = "true" *) output logic bank_select, // A1
    (* mark_debug = "true" *) output logic [REG_FILE_ADDRESS_WIDTH-1:0] address,
    (* mark_debug = "true" *) output logic [REG_FILE_DATA_WIDTH-1:0] data_in,
    (* mark_debug = "true" *) input wire [REG_FILE_DATA_WIDTH-1:0] data_out,
    (* mark_debug = "true" *) input wire  s_axi_aclk,
    (* mark_debug = "true" *) input wire  s_axi_aresetn,
    (* mark_debug = "true" *) input wire [C_S_AXI_ADDR_WIDTH-1 : 0] s_axi_awaddr,
    (* mark_debug = "true" *) input wire [2 : 0] s_axi_awprot,
    (* mark_debug = "true" *) input wire  s_axi_awvalid,
    (* mark_debug = "true" *) output logic  s_axi_awready,
    (* mark_debug = "true" *) input wire [C_S_AXI_DATA_WIDTH-1 : 0] s_axi_wdata,
    (* mark_debug = "true" *) input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] s_axi_wstrb,
    (* mark_debug = "true" *) input wire  s_axi_wvalid,
    (* mark_debug = "true" *) output logic  s_axi_wready,
    (* mark_debug = "true" *) output logic [1 : 0] s_axi_bresp,
    (* mark_debug = "true" *) output logic  s_axi_bvalid,
    (* mark_debug = "true" *) input wire  s_axi_bready,
    (* mark_debug = "true" *) input wire [C_S_AXI_ADDR_WIDTH-1 : 0] s_axi_araddr,
    (* mark_debug = "true" *) input wire [2 : 0] s_axi_arprot,
    (* mark_debug = "true" *) input wire  s_axi_arvalid,
    (* mark_debug = "true" *) output logic  s_axi_arready,
    (* mark_debug = "true" *) output logic [C_S_AXI_DATA_WIDTH-1 : 0] s_axi_rdata,
    (* mark_debug = "true" *) output logic [1 : 0] s_axi_rresp,
    (* mark_debug = "true" *) output logic  s_axi_rvalid,
    (* mark_debug = "true" *) input wire  s_axi_rready
);      
    (* mark_debug = "true" *) logic [2:0] byte_num;
    
    always_comb cs = 1;
    
    typedef enum {
        IDLE,
        READING,
        WRITING
    } state_t;
    
    (* mark_debug = "true" *) state_t state, next_state;
    
    always_ff @(posedge s_axi_aclk)
        if (!s_axi_aresetn)
            state <= IDLE;
        else
            state <= next_state;
        
    always_comb
        unique case (state)
        IDLE:
            if (!s_axi_awready && s_axi_awvalid && s_axi_wvalid)
                next_state = WRITING;
            else if (!s_axi_arready && s_axi_arvalid)
                next_state = READING;
            else
                next_state = IDLE;
        READING: next_state = byte_num == 4 ? IDLE : READING;
        WRITING: next_state = byte_num == 4 ? IDLE : WRITING;
        endcase
        
    
    // slave is ready to accept write address when 
    // there is a valid write address and write data
    // on the write address and data bus. This design 
    // expects no outstanding transactions. 
    always_ff @(posedge s_axi_aclk)
        if (!s_axi_aresetn)
            s_axi_awready <= 0;
        else
            s_axi_awready <= !s_axi_awready && s_axi_awvalid && s_axi_wvalid;
    
    /*
     * Since the ARM uses 32-bit data and the OPL3 uses 8-bit data, for each
     * read/write use 4 transactions, incrementing the address by 1 for each.
     * Prioritize writes over reads.
     */
    always_ff @(posedge s_axi_aclk)
        if (!s_axi_aresetn)
            byte_num <= 0;
        else if (!s_axi_awready && s_axi_awvalid && s_axi_wvalid)
            byte_num <= 0;
        else if (!s_axi_arready && s_axi_arvalid)
            byte_num <= 0;
        else if (byte_num != 4)
            byte_num <= byte_num + 1;
        
    always_ff @(posedge s_axi_aclk)
        if (!s_axi_aresetn) begin
            address <= 0;
            bank_select <= 0;
        end        
        else if (state == WRITING) begin
            address <= s_axi_awaddr + byte_num;
            bank_select <= s_axi_awaddr[C_S_AXI_ADDR_WIDTH-1];
        end
        else if (state == READING) begin
            address <= s_axi_araddr + byte_num;
            bank_select <= s_axi_araddr[C_S_AXI_ADDR_WIDTH-1];                
        end                              
                
    
    // latch in write/read addresses. Prioritize writes over reads.
/*    always_ff @(posedge s_axi_aclk)
        if (!s_axi_aresetn) begin
            address <= 0;
            bank_select <= 0;
        end
        else if (!axi_awready && s_axi_awvalid && s_axi_wvalid) begin
            address <= s_axi_awaddr;
            bank_select <= s_axi_awaddr[C_S_AXI_ADDR_WIDTH-1];
        end
        else if (!s_axi_arready && s_axi_arvalid) begin
            address <= s_axi_araddr;
            bank_select <= s_axi_araddr[C_S_AXI_ADDR_WIDTH-1];
        end      */  
        
    // slave is ready to accept write data when 
    // there is a valid write address and write data
    // on the write address and data bus. This design 
    // expects no outstanding transactions.           
    always_ff @(posedge s_axi_aclk)
        if (!s_axi_aresetn)
            s_axi_wready <= 0;
        else 
            s_axi_wready <= !s_axi_wready && s_axi_wvalid && s_axi_awvalid;
        
    // Slave register write enable is asserted when valid address and data are available
    // and the slave is ready to accept the write address and write data. 
//    always_comb wr = s_axi_wready && s_axi_wvalid && s_axi_awready && s_axi_awvalid && byte_num != 4;
    always_comb wr = state == WRITING;
    
    always_comb data_in = s_axi_wdata >> (byte_num << 3);
    
    // The write response and response valid signals are asserted by the slave 
    // when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
    // This marks the acceptance of address and indicates the status of 
    // write transaction.            
    always_ff @(posedge s_axi_aclk)
        if (!s_axi_aresetn)
            s_axi_bvalid <= 0;
        else if (s_axi_awready && s_axi_awvalid && !s_axi_bvalid && s_axi_wready &&
         s_axi_wvalid)
            s_axi_bvalid <= 1;
        else if (s_axi_bready && s_axi_bvalid)
            //check if bready is asserted while bvalid is high) 
            //(there is a possibility that bready is always asserted high)                           
            s_axi_bvalid <= 0;
   
    always_comb s_axi_bresp = 0; // 'OKAY' response
    
    // indicates that the slave has accepted the valid read address  
    always_ff @(posedge s_axi_aclk)
        if (!s_axi_aresetn)    
            s_axi_arready <= 0;
        else
            s_axi_arready <= !s_axi_arready && s_axi_arvalid;
        
    always_ff @(posedge s_axi_aclk)
        if (!s_axi_aresetn)            
            s_axi_rvalid <= 0;
        //else if (s_axi_arready && s_axi_arvalid && !s_axi_rvalid && byte_num == 4)
        else if (state == READING && byte_num == 4)
            // Valid read data is available at the read data bus
            s_axi_rvalid <= 1;
        else if (s_axi_rvalid && s_axi_arready)
            // Read data is accepted by the master
            s_axi_rvalid <= 0;
        
    always_comb s_axi_rresp = 0; // 'OKAY' response       

    // Slave register read enable is asserted when valid address is available
    // and the slave is ready to accept the read address.
    always_comb rd = state == READING;
        
    always_ff @(posedge s_axi_aclk)
        if (!s_axi_aresetn)           
            s_axi_rdata <= 0;
        else if (state == READING) begin 
            s_axi_rdata <= s_axi_rdata >> 8;
            s_axi_rdata[31:24] <= data_out;
        end
        
    logic [199:0] probe0;
    
    always_comb probe0 = {
    next_state,
    state,
    cs,
    rd,
    wr,
    bank_select, // A1
    address,
    data_in,
    data_out,
    byte_num,
     s_axi_aclk,
     s_axi_aresetn,
    s_axi_awaddr,
    s_axi_awprot,
     s_axi_awvalid,
     s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wvalid,
     s_axi_wready,
    s_axi_bresp,
     s_axi_bvalid,
     s_axi_bready,
    s_axi_araddr,
    s_axi_arprot,
     s_axi_arvalid,
     s_axi_arready,
    s_axi_rdata,
     s_axi_rresp,
     s_axi_rvalid,
     s_axi_rready };

    ila_0 ila (
        .clk(s_axi_aclk),
        .probe0                
    ); 
    

endmodule
`default_nettype wire  // re-enable implicit net type declarations