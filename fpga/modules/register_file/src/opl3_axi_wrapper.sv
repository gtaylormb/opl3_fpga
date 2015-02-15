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
    parameter AXI_BASE_ADDR = 'h22000000
)(
    input wire clk,
    input wire reset,
    output logic cs,
    output logic rd,
    output logic wr,
    output logic bank_select, // A1
    output logic [REG_FILE_ADDRESS_WIDTH-1:0] address,
    output logic [REG_FILE_DATA_WIDTH-1:0] data_in,
    input wire [REG_FILE_DATA_WIDTH-1:0] data_out,
    input wire rd_valid,
    input wire [31:0]m_axi_awaddr,
    input wire [2:0]m_axi_awprot,
    input wire m_axi_awvalid,
    output logic m_axi_awready,
    input wire [31:0]m_axi_wdata,
    input wire [3:0]m_axi_wstrb,
    input wire m_axi_wvalid,
    output logic m_axi_wready,
    output logic [1:0]m_axi_bresp,
    output logic m_axi_bvalid,
    input wire m_axi_bready,
    input wire [31:0]m_axi_araddr,
    input wire [2:0]m_axi_arprot,
    input wire m_axi_arvalid,
    output logic m_axi_arready,
    output logic [31:0]m_axi_rdata,
    output logic [1:0]m_axi_rresp,
    output logic m_axi_rvalid,
    input wire m_axi_rready
);  
    /*
     * Initial implementation, prioritize writes over reads. The OPL3 didn't
     * come with parallel read/write busses, though the AXI bus is. Shouldn't
     * be a problem as long as one CPU is accessing the OPL3.
     */
    always_comb begin
        address = m_axi_wvalid ? m_axi_awaddr[REG_FILE_ADDRESS_WIDTH-1:0] :
         m_axi_araddr[REG_FILE_ADDRESS_WIDTH-1:0];
        bank_select = m_axi_wvalid ? m_axi_awaddr[REG_FILE_ADDRESS_WIDTH] :
         m_axi_araddr[REG_FILE_ADDRESS_WIDTH];
        cs = ((m_axi_awaddr & AXI_BASE_ADDR) == AXI_BASE_ADDR) ||
         ((m_axi_araddr & AXI_BASE_ADDR) == AXI_BASE_ADDR);
        
        wr = m_axi_wvalid && m_axi_wstrb[0];
        data_in = m_axi_wdata[REG_FILE_DATA_WIDTH-1:0];
        m_axi_bresp = 0; // OKAY
        m_axi_bvalid = 1;
        m_axi_awready = 1;
        m_axi_wready = 1;
        
        rd = m_axi_arvalid;
        m_axi_rvalid = rd_valid;
        m_axi_arready = 1;
        m_axi_rdata[31:REG_FILE_DATA_WIDTH] = 0;
        m_axi_rdata[REG_FILE_DATA_WIDTH-1:0] = data_out;
        m_axi_rresp = 0; // OKAY
    end 

endmodule
`default_nettype wire  // re-enable implicit net type declarations