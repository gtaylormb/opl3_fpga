// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.3 (lin64) Build 1034051 Fri Oct  3 16:31:15 MDT 2014
// Date        : Sun Nov  2 16:51:54 2014
// Host        : edinburgh running 64-bit Ubuntu 14.04.1 LTS
// Command     : write_verilog -force -mode funcsim
//               /media/sf_D_DRIVE/Users/Greg/workspace/OPL3/vivado_logic_only/vivado_logic_only.srcs/sources_1/ip/axi_protocol_converter_0/axi_protocol_converter_0_funcsim.v
// Design      : axi_protocol_converter_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* X_CORE_INFO = "axi_protocol_converter_v2_1_axi_protocol_converter,Vivado 2014.3" *) (* CHECK_LICENSE_TYPE = "axi_protocol_converter_0,axi_protocol_converter_v2_1_axi_protocol_converter,{}" *) (* CORE_GENERATION_INFO = "axi_protocol_converter_0,axi_protocol_converter_v2_1_axi_protocol_converter,{x_ipProduct=Vivado 2014.3,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=axi_protocol_converter,x_ipVersion=2.1,x_ipCoreRevision=3,x_ipLanguage=VERILOG,C_FAMILY=zynq,C_M_AXI_PROTOCOL=2,C_S_AXI_PROTOCOL=1,C_IGNORE_ID=1,C_AXI_ID_WIDTH=1,C_AXI_ADDR_WIDTH=32,C_AXI_DATA_WIDTH=32,C_AXI_SUPPORTS_WRITE=1,C_AXI_SUPPORTS_READ=1,C_AXI_SUPPORTS_USER_SIGNALS=0,C_AXI_AWUSER_WIDTH=1,C_AXI_ARUSER_WIDTH=1,C_AXI_WUSER_WIDTH=1,C_AXI_RUSER_WIDTH=1,C_AXI_BUSER_WIDTH=1,C_TRANSLATION_MODE=2}" *) 
(* DowngradeIPIdentifiedWarnings = "yes" *) 
(* NotValidForBitStream *)
module axi_protocol_converter_0
   (aclk,
    aresetn,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awaddr,
    m_axi_awprot,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_araddr,
    m_axi_arprot,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rvalid,
    m_axi_rready);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK CLK" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST RST" *) input aresetn;
  input [31:0]s_axi_awaddr;
  input [3:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input s_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WLAST" *) input s_axi_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input s_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output s_axi_wready;
  output [1:0]s_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output s_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input s_axi_bready;
  input [31:0]s_axi_araddr;
  input [3:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input s_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output s_axi_arready;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RLAST" *) output s_axi_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output s_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) input s_axi_rready;
  output [31:0]m_axi_awaddr;
  output [2:0]m_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWVALID" *) output m_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWREADY" *) input m_axi_awready;
  output [31:0]m_axi_wdata;
  output [3:0]m_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WVALID" *) output m_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WREADY" *) input m_axi_wready;
  input [1:0]m_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BVALID" *) input m_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BREADY" *) output m_axi_bready;
  output [31:0]m_axi_araddr;
  output [2:0]m_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARVALID" *) output m_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARREADY" *) input m_axi_arready;
  input [31:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RVALID" *) input m_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RREADY" *) output m_axi_rready;

  wire aclk;
  wire aresetn;
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
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [3:0]s_axi_arcache;
  wire [3:0]s_axi_arlen;
  wire [1:0]s_axi_arlock;
  wire [2:0]s_axi_arprot;
  wire [3:0]s_axi_arqos;
  wire s_axi_arready;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
  wire [3:0]s_axi_awlen;
  wire [1:0]s_axi_awlock;
  wire [2:0]s_axi_awprot;
  wire [3:0]s_axi_awqos;
  wire s_axi_awready;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire [1:0]s_axi_rresp;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire NLW_inst_m_axi_wlast_UNCONNECTED;
  wire [1:0]NLW_inst_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_inst_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_arlock_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_inst_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_aruser_UNCONNECTED;
  wire [1:0]NLW_inst_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_inst_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_awlock_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_inst_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_awuser_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_wid_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_wuser_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_bid_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_buser_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_rid_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_ruser_UNCONNECTED;

(* C_AXI_ADDR_WIDTH = "32" *) 
   (* C_AXI_ARUSER_WIDTH = "1" *) 
   (* C_AXI_AWUSER_WIDTH = "1" *) 
   (* C_AXI_BUSER_WIDTH = "1" *) 
   (* C_AXI_DATA_WIDTH = "32" *) 
   (* C_AXI_ID_WIDTH = "1" *) 
   (* C_AXI_RUSER_WIDTH = "1" *) 
   (* C_AXI_SUPPORTS_READ = "1" *) 
   (* C_AXI_SUPPORTS_USER_SIGNALS = "0" *) 
   (* C_AXI_SUPPORTS_WRITE = "1" *) 
   (* C_AXI_WUSER_WIDTH = "1" *) 
   (* C_FAMILY = "zynq" *) 
   (* C_IGNORE_ID = "1" *) 
   (* C_M_AXI_PROTOCOL = "2" *) 
   (* C_S_AXI_PROTOCOL = "1" *) 
   (* C_TRANSLATION_MODE = "2" *) 
   (* DONT_TOUCH *) 
   (* DowngradeIPIdentifiedWarnings = "yes" *) 
   (* P_AXI3 = "1" *) 
   (* P_AXI4 = "0" *) 
   (* P_AXILITE = "2" *) 
   (* P_AXILITE_SIZE = "3'b010" *) 
   (* P_CONVERSION = "2" *) 
   (* P_DECERR = "2'b11" *) 
   (* P_INCR = "2'b01" *) 
   (* P_PROTECTION = "1" *) 
   (* P_SLVERR = "2'b10" *) 
   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) 
   axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter inst
       (.aclk(aclk),
        .aresetn(aresetn),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_arburst(NLW_inst_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_inst_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_inst_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_inst_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_inst_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(m_axi_arprot),
        .m_axi_arqos(NLW_inst_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(m_axi_arready),
        .m_axi_arregion(NLW_inst_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_inst_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_inst_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awburst(NLW_inst_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_inst_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_inst_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_inst_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_inst_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(m_axi_awprot),
        .m_axi_awqos(NLW_inst_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(m_axi_awready),
        .m_axi_awregion(NLW_inst_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_inst_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_inst_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_bid(1'b0),
        .m_axi_bready(m_axi_bready),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_rdata(m_axi_rdata),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b1),
        .m_axi_rready(m_axi_rready),
        .m_axi_rresp(m_axi_rresp),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(m_axi_rvalid),
        .m_axi_wdata(m_axi_wdata),
        .m_axi_wid(NLW_inst_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_inst_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(m_axi_wready),
        .m_axi_wstrb(m_axi_wstrb),
        .m_axi_wuser(NLW_inst_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(m_axi_wvalid),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arcache(s_axi_arcache),
        .s_axi_arid(1'b0),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arlock(s_axi_arlock),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arqos(s_axi_arqos),
        .s_axi_arready(s_axi_arready),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awcache(s_axi_awcache),
        .s_axi_awid(1'b0),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awlock(s_axi_awlock),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awqos(s_axi_awqos),
        .s_axi_awready(s_axi_awready),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(NLW_inst_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_buser(NLW_inst_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rid(NLW_inst_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_ruser(NLW_inst_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wid(1'b0),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* DowngradeIPIdentifiedWarnings = "yes" *) (* C_FAMILY = "zynq" *) (* C_M_AXI_PROTOCOL = "2" *) 
(* C_S_AXI_PROTOCOL = "1" *) (* C_IGNORE_ID = "1" *) (* C_AXI_ID_WIDTH = "1" *) 
(* C_AXI_ADDR_WIDTH = "32" *) (* C_AXI_DATA_WIDTH = "32" *) (* C_AXI_SUPPORTS_WRITE = "1" *) 
(* C_AXI_SUPPORTS_READ = "1" *) (* C_AXI_SUPPORTS_USER_SIGNALS = "0" *) (* C_AXI_AWUSER_WIDTH = "1" *) 
(* C_AXI_ARUSER_WIDTH = "1" *) (* C_AXI_WUSER_WIDTH = "1" *) (* C_AXI_RUSER_WIDTH = "1" *) 
(* C_AXI_BUSER_WIDTH = "1" *) (* C_TRANSLATION_MODE = "2" *) (* P_AXI4 = "0" *) 
(* P_AXI3 = "1" *) (* P_AXILITE = "2" *) (* P_AXILITE_SIZE = "3'b010" *) 
(* P_INCR = "2'b01" *) (* P_DECERR = "2'b11" *) (* P_SLVERR = "2'b10" *) 
(* P_PROTECTION = "1" *) (* P_CONVERSION = "2" *) (* ORIG_REF_NAME = "axi_protocol_converter_v2_1_axi_protocol_converter" *) 
module axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter
   (aclk,
    aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awregion,
    s_axi_awqos,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wuser,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arregion,
    s_axi_arqos,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awregion,
    m_axi_awqos,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wuser,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bid,
    m_axi_bresp,
    m_axi_buser,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_arid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arregion,
    m_axi_arqos,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_ruser,
    m_axi_rvalid,
    m_axi_rready);
  input aclk;
  input aresetn;
  input [0:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [3:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awregion;
  input [3:0]s_axi_awqos;
  input [0:0]s_axi_awuser;
  input s_axi_awvalid;
  output s_axi_awready;
  input [0:0]s_axi_wid;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  input s_axi_wlast;
  input [0:0]s_axi_wuser;
  input s_axi_wvalid;
  output s_axi_wready;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output [0:0]s_axi_buser;
  output s_axi_bvalid;
  input s_axi_bready;
  input [0:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [3:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arregion;
  input [3:0]s_axi_arqos;
  input [0:0]s_axi_aruser;
  input s_axi_arvalid;
  output s_axi_arready;
  output [0:0]s_axi_rid;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output [0:0]s_axi_ruser;
  output s_axi_rvalid;
  input s_axi_rready;
  output [0:0]m_axi_awid;
  output [31:0]m_axi_awaddr;
  output [7:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [0:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awregion;
  output [3:0]m_axi_awqos;
  output [0:0]m_axi_awuser;
  output m_axi_awvalid;
  input m_axi_awready;
  output [0:0]m_axi_wid;
  output [31:0]m_axi_wdata;
  output [3:0]m_axi_wstrb;
  output m_axi_wlast;
  output [0:0]m_axi_wuser;
  output m_axi_wvalid;
  input m_axi_wready;
  input [0:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input [0:0]m_axi_buser;
  input m_axi_bvalid;
  output m_axi_bready;
  output [0:0]m_axi_arid;
  output [31:0]m_axi_araddr;
  output [7:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [0:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arregion;
  output [3:0]m_axi_arqos;
  output [0:0]m_axi_aruser;
  output m_axi_arvalid;
  input m_axi_arready;
  input [0:0]m_axi_rid;
  input [31:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input [0:0]m_axi_ruser;
  input m_axi_rvalid;
  output m_axi_rready;

  wire \<const0> ;
  wire \<const1> ;
  wire aclk;
  wire aresetn;
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
  wire m_axi_wready;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [0:0]s_axi_arid;
  wire [3:0]s_axi_arlen;
  wire [2:0]s_axi_arprot;
  wire s_axi_arready;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [0:0]s_axi_awid;
  wire [3:0]s_axi_awlen;
  wire [2:0]s_axi_awprot;
  wire s_axi_awready;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire [0:0]s_axi_bid;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire [0:0]s_axi_rid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire [1:0]s_axi_rresp;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wlast;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;

  assign m_axi_arburst[1] = \<const0> ;
  assign m_axi_arburst[0] = \<const1> ;
  assign m_axi_arcache[3] = \<const0> ;
  assign m_axi_arcache[2] = \<const0> ;
  assign m_axi_arcache[1] = \<const0> ;
  assign m_axi_arcache[0] = \<const0> ;
  assign m_axi_arid[0] = \<const0> ;
  assign m_axi_arlen[7] = \<const0> ;
  assign m_axi_arlen[6] = \<const0> ;
  assign m_axi_arlen[5] = \<const0> ;
  assign m_axi_arlen[4] = \<const0> ;
  assign m_axi_arlen[3] = \<const0> ;
  assign m_axi_arlen[2] = \<const0> ;
  assign m_axi_arlen[1] = \<const0> ;
  assign m_axi_arlen[0] = \<const0> ;
  assign m_axi_arlock[0] = \<const0> ;
  assign m_axi_arqos[3] = \<const0> ;
  assign m_axi_arqos[2] = \<const0> ;
  assign m_axi_arqos[1] = \<const0> ;
  assign m_axi_arqos[0] = \<const0> ;
  assign m_axi_arregion[3] = \<const0> ;
  assign m_axi_arregion[2] = \<const0> ;
  assign m_axi_arregion[1] = \<const0> ;
  assign m_axi_arregion[0] = \<const0> ;
  assign m_axi_arsize[2] = \<const0> ;
  assign m_axi_arsize[1] = \<const1> ;
  assign m_axi_arsize[0] = \<const0> ;
  assign m_axi_aruser[0] = \<const0> ;
  assign m_axi_awburst[1] = \<const0> ;
  assign m_axi_awburst[0] = \<const1> ;
  assign m_axi_awcache[3] = \<const0> ;
  assign m_axi_awcache[2] = \<const0> ;
  assign m_axi_awcache[1] = \<const0> ;
  assign m_axi_awcache[0] = \<const0> ;
  assign m_axi_awid[0] = \<const0> ;
  assign m_axi_awlen[7] = \<const0> ;
  assign m_axi_awlen[6] = \<const0> ;
  assign m_axi_awlen[5] = \<const0> ;
  assign m_axi_awlen[4] = \<const0> ;
  assign m_axi_awlen[3] = \<const0> ;
  assign m_axi_awlen[2] = \<const0> ;
  assign m_axi_awlen[1] = \<const0> ;
  assign m_axi_awlen[0] = \<const0> ;
  assign m_axi_awlock[0] = \<const0> ;
  assign m_axi_awqos[3] = \<const0> ;
  assign m_axi_awqos[2] = \<const0> ;
  assign m_axi_awqos[1] = \<const0> ;
  assign m_axi_awqos[0] = \<const0> ;
  assign m_axi_awregion[3] = \<const0> ;
  assign m_axi_awregion[2] = \<const0> ;
  assign m_axi_awregion[1] = \<const0> ;
  assign m_axi_awregion[0] = \<const0> ;
  assign m_axi_awsize[2] = \<const0> ;
  assign m_axi_awsize[1] = \<const1> ;
  assign m_axi_awsize[0] = \<const0> ;
  assign m_axi_awuser[0] = \<const0> ;
  assign m_axi_wdata[31:0] = s_axi_wdata;
  assign m_axi_wid[0] = \<const0> ;
  assign m_axi_wlast = \<const1> ;
  assign m_axi_wstrb[3:0] = s_axi_wstrb;
  assign m_axi_wuser[0] = \<const0> ;
  assign m_axi_wvalid = s_axi_wvalid;
  assign s_axi_buser[0] = \<const0> ;
  assign s_axi_ruser[0] = \<const0> ;
  assign s_axi_wready = m_axi_wready;
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s \gen_axilite.gen_b2s_conv.axilite_b2s 
       (.O1(s_axi_awready),
        .O2(s_axi_rvalid),
        .O3(s_axi_bvalid),
        .O4(s_axi_arready),
        .O5({m_axi_arprot,m_axi_araddr[31:12]}),
        .O6({s_axi_rid,s_axi_rlast,s_axi_rresp,s_axi_rdata}),
        .Q({m_axi_awprot,m_axi_awaddr[31:12]}),
        .aclk(aclk),
        .aresetn(aresetn),
        .in({m_axi_rresp,m_axi_rdata}),
        .m_axi_araddr(m_axi_araddr[11:0]),
        .m_axi_arready(m_axi_arready),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_awaddr(m_axi_awaddr[11:0]),
        .m_axi_awready(m_axi_awready),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_bready(m_axi_bready),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_rready(m_axi_rready),
        .m_axi_rvalid(m_axi_rvalid),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arsize(s_axi_arsize[1:0]),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awsize(s_axi_awsize[1:0]),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(s_axi_bid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_rready(s_axi_rready));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_b2s" *) 
module axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s
   (O1,
    O2,
    O3,
    O4,
    Q,
    s_axi_bid,
    s_axi_bresp,
    O5,
    O6,
    m_axi_awvalid,
    m_axi_bready,
    m_axi_arvalid,
    m_axi_rready,
    m_axi_awaddr,
    m_axi_araddr,
    s_axi_awvalid,
    m_axi_arready,
    s_axi_rready,
    s_axi_bready,
    s_axi_arvalid,
    aclk,
    in,
    s_axi_awid,
    s_axi_awlen,
    s_axi_awburst,
    s_axi_awsize,
    s_axi_awprot,
    s_axi_awaddr,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arburst,
    s_axi_arsize,
    s_axi_arprot,
    s_axi_araddr,
    m_axi_bresp,
    m_axi_awready,
    m_axi_bvalid,
    m_axi_rvalid,
    aresetn);
  output O1;
  output O2;
  output O3;
  output O4;
  output [22:0]Q;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output [22:0]O5;
  output [35:0]O6;
  output m_axi_awvalid;
  output m_axi_bready;
  output m_axi_arvalid;
  output m_axi_rready;
  output [11:0]m_axi_awaddr;
  output [11:0]m_axi_araddr;
  input s_axi_awvalid;
  input m_axi_arready;
  input s_axi_rready;
  input s_axi_bready;
  input s_axi_arvalid;
  input aclk;
  input [33:0]in;
  input [0:0]s_axi_awid;
  input [3:0]s_axi_awlen;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awsize;
  input [2:0]s_axi_awprot;
  input [31:0]s_axi_awaddr;
  input [0:0]s_axi_arid;
  input [3:0]s_axi_arlen;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arsize;
  input [2:0]s_axi_arprot;
  input [31:0]s_axi_araddr;
  input [1:0]m_axi_bresp;
  input m_axi_awready;
  input m_axi_bvalid;
  input m_axi_rvalid;
  input aresetn;

  wire O1;
  wire O2;
  wire O3;
  wire O4;
  wire [22:0]O5;
  wire [35:0]O6;
  wire [22:0]Q;
  wire aclk;
  wire [1:0]\ar_cmd_fsm_0/state ;
  wire \ar_pipe/p_1_in ;
  wire areset_d1;
  wire aresetn;
  wire [1:0]\aw_cmd_fsm_0/state ;
  wire \aw_pipe/p_1_in ;
  wire b_awid;
  wire [3:0]b_awlen;
  wire b_push;
  wire \cmd_translator_0/incr_cmd_0/sel_first ;
  wire \cmd_translator_0/incr_cmd_0/sel_first_2 ;
  wire [3:0]\cmd_translator_0/wrap_cmd_0/axaddr_offset ;
  wire [3:0]\cmd_translator_0/wrap_cmd_0/axaddr_offset_0 ;
  wire [3:0]\cmd_translator_0/wrap_cmd_0/axaddr_offset_r ;
  wire [3:0]\cmd_translator_0/wrap_cmd_0/axaddr_offset_r_3 ;
  wire [2:1]\cmd_translator_0/wrap_cmd_0/wrap_second_len ;
  wire [3:1]\cmd_translator_0/wrap_cmd_0/wrap_second_len_1 ;
  wire [2:0]\cmd_translator_0/wrap_cmd_0/wrap_second_len_r ;
  wire [3:0]\cmd_translator_0/wrap_cmd_0/wrap_second_len_r_4 ;
  wire [33:0]in;
  wire [11:0]m_axi_araddr;
  wire m_axi_arready;
  wire m_axi_arvalid;
  wire [11:0]m_axi_awaddr;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire m_axi_rready;
  wire m_axi_rvalid;
  wire \n_0_RD.r_channel_0 ;
  wire \n_0_WR.b_channel_0 ;
  wire n_100_SI_REG;
  wire n_101_SI_REG;
  wire n_102_SI_REG;
  wire n_103_SI_REG;
  wire n_104_SI_REG;
  wire n_105_SI_REG;
  wire n_106_SI_REG;
  wire n_107_SI_REG;
  wire n_108_SI_REG;
  wire n_109_SI_REG;
  wire n_10_SI_REG;
  wire n_110_SI_REG;
  wire n_11_SI_REG;
  wire n_121_SI_REG;
  wire n_122_SI_REG;
  wire n_123_SI_REG;
  wire n_124_SI_REG;
  wire n_125_SI_REG;
  wire n_127_SI_REG;
  wire n_129_SI_REG;
  wire n_12_SI_REG;
  wire n_133_SI_REG;
  wire n_134_SI_REG;
  wire n_135_SI_REG;
  wire n_136_SI_REG;
  wire n_137_SI_REG;
  wire n_138_SI_REG;
  wire n_139_SI_REG;
  wire \n_13_WR.aw_channel_0 ;
  wire n_140_SI_REG;
  wire n_141_SI_REG;
  wire n_142_SI_REG;
  wire n_143_SI_REG;
  wire n_144_SI_REG;
  wire n_145_SI_REG;
  wire n_146_SI_REG;
  wire n_147_SI_REG;
  wire n_148_SI_REG;
  wire n_149_SI_REG;
  wire n_150_SI_REG;
  wire n_151_SI_REG;
  wire n_152_SI_REG;
  wire n_153_SI_REG;
  wire n_154_SI_REG;
  wire n_155_SI_REG;
  wire n_156_SI_REG;
  wire n_157_SI_REG;
  wire n_158_SI_REG;
  wire n_159_SI_REG;
  wire n_160_SI_REG;
  wire n_161_SI_REG;
  wire n_162_SI_REG;
  wire n_163_SI_REG;
  wire n_164_SI_REG;
  wire n_165_SI_REG;
  wire n_166_SI_REG;
  wire n_167_SI_REG;
  wire n_168_SI_REG;
  wire \n_18_WR.aw_channel_0 ;
  wire \n_1_RD.r_channel_0 ;
  wire \n_1_WR.b_channel_0 ;
  wire \n_2_WR.b_channel_0 ;
  wire \n_3_WR.b_channel_0 ;
  wire \n_4_RD.ar_channel_0 ;
  wire n_51_SI_REG;
  wire n_53_SI_REG;
  wire n_54_SI_REG;
  wire n_55_SI_REG;
  wire n_56_SI_REG;
  wire \n_5_RD.ar_channel_0 ;
  wire \n_6_RD.ar_channel_0 ;
  wire \n_8_WR.aw_channel_0 ;
  wire n_95_SI_REG;
  wire n_96_SI_REG;
  wire n_97_SI_REG;
  wire n_98_SI_REG;
  wire n_99_SI_REG;
  wire \n_9_RD.ar_channel_0 ;
  wire n_9_SI_REG;
  wire r_push;
  wire r_rlast;
  wire s_arid;
  wire s_arid_r;
  wire s_awid;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [0:0]s_axi_arid;
  wire [3:0]s_axi_arlen;
  wire [2:0]s_axi_arprot;
  wire [1:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [0:0]s_axi_awid;
  wire [3:0]s_axi_awlen;
  wire [2:0]s_axi_awprot;
  wire [1:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire [0:0]s_axi_bid;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_rready;
  wire shandshake;
  wire [11:0]si_rs_araddr;
  wire [1:1]si_rs_arburst;
  wire [1:0]si_rs_arsize;
  wire si_rs_arvalid;
  wire [11:0]si_rs_awaddr;
  wire [1:1]si_rs_awburst;
  wire [1:0]si_rs_awsize;
  wire si_rs_awvalid;
  wire si_rs_bid;
  wire si_rs_bready;
  wire [1:0]si_rs_bresp;
  wire si_rs_bvalid;
  wire [31:0]si_rs_rdata;
  wire si_rs_rid;
  wire si_rs_rlast;
  wire si_rs_rready;
  wire [1:0]si_rs_rresp;
  wire [3:1]wrap_cnt;

axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_ar_channel \RD.ar_channel_0 
       (.D(\cmd_translator_0/wrap_cmd_0/wrap_second_len [2]),
        .E(\ar_pipe/p_1_in ),
        .I1(n_129_SI_REG),
        .I10(n_134_SI_REG),
        .I11(n_133_SI_REG),
        .I12(n_158_SI_REG),
        .I13(n_167_SI_REG),
        .I14(n_127_SI_REG),
        .I15({n_159_SI_REG,n_160_SI_REG,n_161_SI_REG,n_162_SI_REG,n_163_SI_REG,n_164_SI_REG,n_165_SI_REG}),
        .I16({n_103_SI_REG,n_104_SI_REG,n_105_SI_REG,n_106_SI_REG}),
        .I17({n_107_SI_REG,n_108_SI_REG,n_109_SI_REG,n_110_SI_REG}),
        .I2(n_135_SI_REG),
        .I26({n_145_SI_REG,n_146_SI_REG,n_147_SI_REG}),
        .I3(n_144_SI_REG),
        .I4(n_148_SI_REG),
        .I5(n_149_SI_REG),
        .I6(n_150_SI_REG),
        .I7(\n_1_RD.r_channel_0 ),
        .I8(n_136_SI_REG),
        .I9({\cmd_translator_0/wrap_cmd_0/axaddr_offset [3],\cmd_translator_0/wrap_cmd_0/axaddr_offset [1:0]}),
        .O1(\cmd_translator_0/wrap_cmd_0/wrap_second_len [1]),
        .O2(\ar_cmd_fsm_0/state ),
        .O3(\n_4_RD.ar_channel_0 ),
        .O4(\n_5_RD.ar_channel_0 ),
        .O5(\n_6_RD.ar_channel_0 ),
        .O6({\cmd_translator_0/wrap_cmd_0/wrap_second_len_r [2],\cmd_translator_0/wrap_cmd_0/wrap_second_len_r [0]}),
        .O7(\n_9_RD.ar_channel_0 ),
        .O8({\cmd_translator_0/wrap_cmd_0/axaddr_offset_r [3],\cmd_translator_0/wrap_cmd_0/axaddr_offset_r [1:0]}),
        .Q({s_arid,n_53_SI_REG,n_54_SI_REG,n_55_SI_REG,n_56_SI_REG,si_rs_arburst,si_rs_arsize,si_rs_araddr}),
        .S(n_51_SI_REG),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_arready(m_axi_arready),
        .m_axi_arvalid(m_axi_arvalid),
        .r_push(r_push),
        .r_rlast(r_rlast),
        .s_arid_r(s_arid_r),
        .sel_first(\cmd_translator_0/incr_cmd_0/sel_first ),
        .si_rs_arvalid(si_rs_arvalid));
axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_r_channel \RD.r_channel_0 
       (.O1(\n_0_RD.r_channel_0 ),
        .O2(\n_1_RD.r_channel_0 ),
        .O3({si_rs_rid,si_rs_rlast}),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .in(in),
        .m_axi_rready(m_axi_rready),
        .m_axi_rvalid(m_axi_rvalid),
        .out({si_rs_rresp,si_rs_rdata}),
        .r_push(r_push),
        .r_rlast(r_rlast),
        .s_arid_r(s_arid_r),
        .si_rs_rready(si_rs_rready));
axi_protocol_converter_0_axi_register_slice_v2_1_axi_register_slice SI_REG
       (.D(wrap_cnt),
        .E(\aw_pipe/p_1_in ),
        .I1(\aw_cmd_fsm_0/state ),
        .I10(\cmd_translator_0/wrap_cmd_0/wrap_second_len [1]),
        .I11(\n_9_RD.ar_channel_0 ),
        .I12(\n_4_RD.ar_channel_0 ),
        .I13({\cmd_translator_0/wrap_cmd_0/wrap_second_len_r [2],\cmd_translator_0/wrap_cmd_0/wrap_second_len_r [0]}),
        .I14(n_127_SI_REG),
        .I15({\cmd_translator_0/wrap_cmd_0/axaddr_offset_r [3],\cmd_translator_0/wrap_cmd_0/axaddr_offset_r [1:0]}),
        .I16({n_103_SI_REG,n_104_SI_REG,n_105_SI_REG,n_106_SI_REG}),
        .I17({n_107_SI_REG,n_108_SI_REG,n_109_SI_REG,n_110_SI_REG}),
        .I18(\ar_cmd_fsm_0/state ),
        .I19(si_rs_bresp),
        .I2(\n_5_RD.ar_channel_0 ),
        .I20({si_rs_rid,si_rs_rlast}),
        .I21({si_rs_rresp,si_rs_rdata}),
        .I22(\ar_pipe/p_1_in ),
        .I26({n_145_SI_REG,n_146_SI_REG,n_147_SI_REG}),
        .I3(\n_6_RD.ar_channel_0 ),
        .I4(\n_0_RD.r_channel_0 ),
        .I5(\n_8_WR.aw_channel_0 ),
        .I6(\cmd_translator_0/wrap_cmd_0/wrap_second_len_r_4 ),
        .I7(\n_13_WR.aw_channel_0 ),
        .I8(\n_18_WR.aw_channel_0 ),
        .I9(\cmd_translator_0/wrap_cmd_0/axaddr_offset_r_3 ),
        .O1(O1),
        .O10(n_122_SI_REG),
        .O11(n_123_SI_REG),
        .O12(n_124_SI_REG),
        .O13(n_125_SI_REG),
        .O14(\cmd_translator_0/wrap_cmd_0/wrap_second_len [2]),
        .O15(n_129_SI_REG),
        .O16({\cmd_translator_0/wrap_cmd_0/axaddr_offset [3],\cmd_translator_0/wrap_cmd_0/axaddr_offset [1:0]}),
        .O17(n_133_SI_REG),
        .O18(n_134_SI_REG),
        .O19(n_135_SI_REG),
        .O2(O3),
        .O20(n_136_SI_REG),
        .O21(n_137_SI_REG),
        .O22(n_141_SI_REG),
        .O23(n_142_SI_REG),
        .O24(n_143_SI_REG),
        .O25(n_144_SI_REG),
        .O26(n_148_SI_REG),
        .O27(n_149_SI_REG),
        .O28(n_150_SI_REG),
        .O29({n_151_SI_REG,n_152_SI_REG,n_153_SI_REG,n_154_SI_REG,n_155_SI_REG,n_156_SI_REG,n_157_SI_REG}),
        .O3(O4),
        .O30(n_158_SI_REG),
        .O31({n_159_SI_REG,n_160_SI_REG,n_161_SI_REG,n_162_SI_REG,n_163_SI_REG,n_164_SI_REG,n_165_SI_REG}),
        .O32(n_166_SI_REG),
        .O33(n_167_SI_REG),
        .O34(O6),
        .O4(O2),
        .O5({s_arid,n_53_SI_REG,n_54_SI_REG,n_55_SI_REG,n_56_SI_REG,si_rs_arburst,si_rs_arsize,O5,si_rs_araddr}),
        .O6({n_95_SI_REG,n_96_SI_REG,n_97_SI_REG,n_98_SI_REG}),
        .O7({n_99_SI_REG,n_100_SI_REG,n_101_SI_REG,n_102_SI_REG}),
        .O8(\cmd_translator_0/wrap_cmd_0/wrap_second_len_1 ),
        .O9(n_121_SI_REG),
        .Q({s_awid,n_9_SI_REG,n_10_SI_REG,n_11_SI_REG,n_12_SI_REG,si_rs_awburst,si_rs_awsize,Q,si_rs_awaddr}),
        .S(n_51_SI_REG),
        .SR(n_168_SI_REG),
        .aclk(aclk),
        .aresetn(aresetn),
        .axaddr_incr0({n_138_SI_REG,n_139_SI_REG,n_140_SI_REG}),
        .axaddr_offset(\cmd_translator_0/wrap_cmd_0/axaddr_offset_0 ),
        .b_push(b_push),
        .m_axi_arready(m_axi_arready),
        .out(si_rs_bid),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(s_axi_bid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_rready(s_axi_rready),
        .sel_first(\cmd_translator_0/incr_cmd_0/sel_first_2 ),
        .sel_first_0(\cmd_translator_0/incr_cmd_0/sel_first ),
        .shandshake(shandshake),
        .si_rs_arvalid(si_rs_arvalid),
        .si_rs_awvalid(si_rs_awvalid),
        .si_rs_bready(si_rs_bready),
        .si_rs_bvalid(si_rs_bvalid),
        .si_rs_rready(si_rs_rready));
axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_aw_channel \WR.aw_channel_0 
       (.D(wrap_cnt),
        .E(\aw_pipe/p_1_in ),
        .I1(n_124_SI_REG),
        .I10(\cmd_translator_0/wrap_cmd_0/axaddr_offset_0 ),
        .I11(n_125_SI_REG),
        .I12(\n_3_WR.b_channel_0 ),
        .I13(\n_2_WR.b_channel_0 ),
        .I14(\n_1_WR.b_channel_0 ),
        .I15(n_166_SI_REG),
        .I16(\n_0_WR.b_channel_0 ),
        .I17({n_151_SI_REG,n_152_SI_REG,n_153_SI_REG,n_154_SI_REG,n_155_SI_REG,n_156_SI_REG,n_157_SI_REG}),
        .I18({n_95_SI_REG,n_96_SI_REG,n_97_SI_REG,n_98_SI_REG}),
        .I2(n_137_SI_REG),
        .I3(n_141_SI_REG),
        .I4(n_142_SI_REG),
        .I5(n_143_SI_REG),
        .I6(n_123_SI_REG),
        .I7(n_122_SI_REG),
        .I8(\cmd_translator_0/wrap_cmd_0/wrap_second_len_1 ),
        .I9(n_121_SI_REG),
        .O1(\aw_cmd_fsm_0/state ),
        .O2(\n_8_WR.aw_channel_0 ),
        .O3(\cmd_translator_0/wrap_cmd_0/wrap_second_len_r_4 ),
        .O4(\n_13_WR.aw_channel_0 ),
        .O5(\cmd_translator_0/wrap_cmd_0/axaddr_offset_r_3 ),
        .O6(\n_18_WR.aw_channel_0 ),
        .O7({n_99_SI_REG,n_100_SI_REG,n_101_SI_REG,n_102_SI_REG}),
        .Q({s_awid,n_9_SI_REG,n_10_SI_REG,n_11_SI_REG,n_12_SI_REG,si_rs_awburst,si_rs_awsize,si_rs_awaddr}),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .axaddr_incr0({n_138_SI_REG,n_139_SI_REG,n_140_SI_REG}),
        .b_push(b_push),
        .in({b_awid,b_awlen}),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awready(m_axi_awready),
        .m_axi_awvalid(m_axi_awvalid),
        .sel_first(\cmd_translator_0/incr_cmd_0/sel_first_2 ),
        .si_rs_awvalid(si_rs_awvalid));
axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_b_channel \WR.b_channel_0 
       (.O1(\n_0_WR.b_channel_0 ),
        .O2(\n_1_WR.b_channel_0 ),
        .O3(\n_2_WR.b_channel_0 ),
        .O4(\n_3_WR.b_channel_0 ),
        .O5(si_rs_bresp),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .b_push(b_push),
        .in({b_awid,b_awlen}),
        .m_axi_bready(m_axi_bready),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_bvalid(m_axi_bvalid),
        .out(si_rs_bid),
        .shandshake(shandshake),
        .si_rs_bready(si_rs_bready),
        .si_rs_bvalid(si_rs_bvalid));
FDRE areset_d1_reg
       (.C(aclk),
        .CE(1'b1),
        .D(n_168_SI_REG),
        .Q(areset_d1),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_b2s_ar_channel" *) 
module axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_ar_channel
   (s_arid_r,
    O1,
    O2,
    O3,
    O4,
    O5,
    O6,
    O7,
    O8,
    sel_first,
    r_push,
    m_axi_arvalid,
    r_rlast,
    m_axi_araddr,
    E,
    aclk,
    Q,
    I1,
    I2,
    si_rs_arvalid,
    m_axi_arready,
    I3,
    I4,
    I5,
    I6,
    I7,
    D,
    I8,
    I9,
    I10,
    areset_d1,
    I11,
    I12,
    I13,
    I14,
    I15,
    I26,
    S,
    I16,
    I17);
  output s_arid_r;
  output [0:0]O1;
  output [1:0]O2;
  output O3;
  output O4;
  output O5;
  output [1:0]O6;
  output O7;
  output [2:0]O8;
  output sel_first;
  output r_push;
  output m_axi_arvalid;
  output r_rlast;
  output [11:0]m_axi_araddr;
  output [0:0]E;
  input aclk;
  input [19:0]Q;
  input I1;
  input I2;
  input si_rs_arvalid;
  input m_axi_arready;
  input I3;
  input I4;
  input I5;
  input I6;
  input I7;
  input [0:0]D;
  input I8;
  input [2:0]I9;
  input I10;
  input areset_d1;
  input I11;
  input I12;
  input I13;
  input [0:0]I14;
  input [6:0]I15;
  input [2:0]I26;
  input [0:0]S;
  input [3:0]I16;
  input [3:0]I17;

  wire [0:0]D;
  wire [0:0]E;
  wire I1;
  wire I10;
  wire I11;
  wire I12;
  wire I13;
  wire [0:0]I14;
  wire [6:0]I15;
  wire [3:0]I16;
  wire [3:0]I17;
  wire I2;
  wire [2:0]I26;
  wire I3;
  wire I4;
  wire I5;
  wire I6;
  wire I7;
  wire I8;
  wire [2:0]I9;
  wire [0:0]O1;
  wire [1:0]O2;
  wire O3;
  wire O4;
  wire O5;
  wire [1:0]O6;
  wire O7;
  wire [2:0]O8;
  wire [19:0]Q;
  wire [0:0]S;
  wire aclk;
  wire areset_d1;
  wire incr_next_pending;
  wire [11:0]m_axi_araddr;
  wire m_axi_arready;
  wire m_axi_arvalid;
  wire n_0_ar_cmd_fsm_0;
  wire n_11_ar_cmd_fsm_0;
  wire n_12_ar_cmd_fsm_0;
  wire n_17_ar_cmd_fsm_0;
  wire n_1_ar_cmd_fsm_0;
  wire n_1_cmd_translator_0;
  wire n_20_ar_cmd_fsm_0;
  wire n_21_ar_cmd_fsm_0;
  wire n_22_ar_cmd_fsm_0;
  wire n_23_ar_cmd_fsm_0;
  wire n_25_ar_cmd_fsm_0;
  wire n_2_ar_cmd_fsm_0;
  wire n_2_cmd_translator_0;
  wire n_3_cmd_translator_0;
  wire n_4_cmd_translator_0;
  wire n_5_cmd_translator_0;
  wire n_6_ar_cmd_fsm_0;
  wire n_6_cmd_translator_0;
  wire n_7_ar_cmd_fsm_0;
  wire n_8_ar_cmd_fsm_0;
  wire n_9_cmd_translator_0;
  wire r_push;
  wire r_rlast;
  wire s_arid_r;
  wire sel_first;
  wire sel_first_i;
  wire si_rs_arvalid;
  wire [2:2]\wrap_cmd_0/axaddr_offset ;
  wire [2:2]\wrap_cmd_0/axaddr_offset_r ;
  wire [3:0]\wrap_cmd_0/wrap_second_len ;
  wire [3:1]\wrap_cmd_0/wrap_second_len_r ;
  wire wrap_next_pending;

axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_rd_cmd_fsm ar_cmd_fsm_0
       (.D({n_0_ar_cmd_fsm_0,n_1_ar_cmd_fsm_0,n_2_ar_cmd_fsm_0}),
        .E(O3),
        .I1(I1),
        .I10({O8[2],\wrap_cmd_0/axaddr_offset_r }),
        .I11(I10),
        .I12(n_2_cmd_translator_0),
        .I13(n_1_cmd_translator_0),
        .I14(n_6_cmd_translator_0),
        .I15(I11),
        .I16(I12),
        .I17(sel_first),
        .I2(Q[17:14]),
        .I3(n_5_cmd_translator_0),
        .I4(n_9_cmd_translator_0),
        .I5(D),
        .I6({\wrap_cmd_0/wrap_second_len_r [3],\wrap_cmd_0/wrap_second_len_r [1],O6[0]}),
        .I7(I7),
        .I8(I8),
        .I9(I9),
        .O1({\wrap_cmd_0/wrap_second_len [3],O1,\wrap_cmd_0/wrap_second_len [0]}),
        .O10(n_17_ar_cmd_fsm_0),
        .O11(n_20_ar_cmd_fsm_0),
        .O12(n_21_ar_cmd_fsm_0),
        .O13(n_22_ar_cmd_fsm_0),
        .O14(n_23_ar_cmd_fsm_0),
        .O15(\wrap_cmd_0/axaddr_offset ),
        .O16(n_25_ar_cmd_fsm_0),
        .O17(E),
        .O2({n_6_ar_cmd_fsm_0,n_7_ar_cmd_fsm_0}),
        .O3(n_8_ar_cmd_fsm_0),
        .O4(O2),
        .O5(n_11_ar_cmd_fsm_0),
        .O6(n_12_ar_cmd_fsm_0),
        .O7(O4),
        .O8(O5),
        .O9(O7),
        .Q({n_3_cmd_translator_0,n_4_cmd_translator_0}),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .incr_next_pending(incr_next_pending),
        .m_axi_arready(m_axi_arready),
        .m_axi_arvalid(m_axi_arvalid),
        .r_push(r_push),
        .sel_first_i(sel_first_i),
        .si_rs_arvalid(si_rs_arvalid),
        .wrap_next_pending(wrap_next_pending));
axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_cmd_translator_1 cmd_translator_0
       (.D({n_6_ar_cmd_fsm_0,n_7_ar_cmd_fsm_0}),
        .E(O3),
        .I1(n_17_ar_cmd_fsm_0),
        .I10(I6),
        .I11(n_12_ar_cmd_fsm_0),
        .I12(I11),
        .I13(I13),
        .I14(O2),
        .I15(n_21_ar_cmd_fsm_0),
        .I16(n_11_ar_cmd_fsm_0),
        .I17({I9[2],\wrap_cmd_0/axaddr_offset ,I9[1:0]}),
        .I18({\wrap_cmd_0/wrap_second_len [3],D,O1,\wrap_cmd_0/wrap_second_len [0]}),
        .I19(n_23_ar_cmd_fsm_0),
        .I2(n_20_ar_cmd_fsm_0),
        .I20({n_0_ar_cmd_fsm_0,I14,n_1_ar_cmd_fsm_0,n_2_ar_cmd_fsm_0}),
        .I21(I15),
        .I22(n_22_ar_cmd_fsm_0),
        .I23(I16),
        .I24(I17),
        .I26(I26),
        .I3(n_25_ar_cmd_fsm_0),
        .I4(n_8_ar_cmd_fsm_0),
        .I5(I2),
        .I6(Q[18:0]),
        .I7(I3),
        .I8(I4),
        .I9(I5),
        .O1(n_1_cmd_translator_0),
        .O2(n_2_cmd_translator_0),
        .O3(n_5_cmd_translator_0),
        .O4(n_6_cmd_translator_0),
        .O5(sel_first),
        .O6(n_9_cmd_translator_0),
        .O7({O8[2],\wrap_cmd_0/axaddr_offset_r ,O8[1:0]}),
        .O8({\wrap_cmd_0/wrap_second_len_r [3],O6[1],\wrap_cmd_0/wrap_second_len_r [1],O6[0]}),
        .Q({n_3_cmd_translator_0,n_4_cmd_translator_0}),
        .S(S),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .incr_next_pending(incr_next_pending),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_arready(m_axi_arready),
        .r_rlast(r_rlast),
        .sel_first_i(sel_first_i),
        .si_rs_arvalid(si_rs_arvalid),
        .wrap_next_pending(wrap_next_pending));
FDRE \s_arid_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(Q[19]),
        .Q(s_arid_r),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_b2s_aw_channel" *) 
module axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_aw_channel
   (in,
    O1,
    b_push,
    O2,
    O3,
    O4,
    O5,
    O6,
    sel_first,
    E,
    m_axi_awvalid,
    m_axi_awaddr,
    aclk,
    Q,
    si_rs_awvalid,
    I1,
    I2,
    I3,
    I4,
    I5,
    D,
    I6,
    I7,
    I8,
    I9,
    I10,
    I11,
    areset_d1,
    I12,
    m_axi_awready,
    I13,
    I14,
    I15,
    I16,
    I17,
    axaddr_incr0,
    I18,
    O7);
  output [4:0]in;
  output [1:0]O1;
  output b_push;
  output O2;
  output [3:0]O3;
  output O4;
  output [3:0]O5;
  output O6;
  output sel_first;
  output [0:0]E;
  output m_axi_awvalid;
  output [11:0]m_axi_awaddr;
  input aclk;
  input [19:0]Q;
  input si_rs_awvalid;
  input I1;
  input I2;
  input I3;
  input I4;
  input I5;
  input [2:0]D;
  input I6;
  input I7;
  input [2:0]I8;
  input I9;
  input [3:0]I10;
  input I11;
  input areset_d1;
  input I12;
  input m_axi_awready;
  input I13;
  input I14;
  input I15;
  input I16;
  input [6:0]I17;
  input [2:0]axaddr_incr0;
  input [3:0]I18;
  input [3:0]O7;

  wire [2:0]D;
  wire [0:0]E;
  wire I1;
  wire [3:0]I10;
  wire I11;
  wire I12;
  wire I13;
  wire I14;
  wire I15;
  wire I16;
  wire [6:0]I17;
  wire [3:0]I18;
  wire I2;
  wire I3;
  wire I4;
  wire I5;
  wire I6;
  wire I7;
  wire [2:0]I8;
  wire I9;
  wire [1:0]O1;
  wire O2;
  wire [3:0]O3;
  wire O4;
  wire [3:0]O5;
  wire O6;
  wire [3:0]O7;
  wire [19:0]Q;
  wire aclk;
  wire areset_d1;
  wire [2:0]axaddr_incr0;
  wire b_push;
  wire [4:0]in;
  wire incr_next_pending;
  wire [11:0]m_axi_awaddr;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire n_0_aw_cmd_fsm_0;
  wire n_0_cmd_translator_0;
  wire n_10_aw_cmd_fsm_0;
  wire n_11_aw_cmd_fsm_0;
  wire n_16_aw_cmd_fsm_0;
  wire n_1_cmd_translator_0;
  wire n_20_aw_cmd_fsm_0;
  wire n_21_aw_cmd_fsm_0;
  wire n_22_aw_cmd_fsm_0;
  wire n_23_aw_cmd_fsm_0;
  wire n_24_aw_cmd_fsm_0;
  wire n_25_aw_cmd_fsm_0;
  wire n_2_cmd_translator_0;
  wire n_3_cmd_translator_0;
  wire n_4_aw_cmd_fsm_0;
  wire n_4_cmd_translator_0;
  wire n_5_aw_cmd_fsm_0;
  wire n_5_cmd_translator_0;
  wire n_6_aw_cmd_fsm_0;
  wire n_6_cmd_translator_0;
  wire n_7_cmd_translator_0;
  wire n_8_aw_cmd_fsm_0;
  wire n_9_aw_cmd_fsm_0;
  wire sel_first;
  wire sel_first_i;
  wire si_rs_awvalid;
  wire [0:0]\wrap_cmd_0/wrap_second_len ;
  wire [0:0]wrap_cnt;
  wire wrap_next_pending;

axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_wr_cmd_fsm aw_cmd_fsm_0
       (.D({n_5_aw_cmd_fsm_0,n_6_aw_cmd_fsm_0}),
        .E(O2),
        .I1({n_3_cmd_translator_0,n_4_cmd_translator_0}),
        .I10(I10[2]),
        .I11(I11),
        .I12(n_1_cmd_translator_0),
        .I13(n_0_cmd_translator_0),
        .I14(n_2_cmd_translator_0),
        .I15(I12),
        .I16(n_5_cmd_translator_0),
        .I17(sel_first),
        .I18(I13),
        .I19(I14),
        .I2({Q[16:12],Q[3:0]}),
        .I20(I16),
        .I3(O3[0]),
        .I4(O5[3]),
        .I5(n_6_cmd_translator_0),
        .I6(I6),
        .I7(I7),
        .I8(n_7_cmd_translator_0),
        .I9(I9),
        .O1(n_0_aw_cmd_fsm_0),
        .O10(n_21_aw_cmd_fsm_0),
        .O11(n_22_aw_cmd_fsm_0),
        .O12(n_23_aw_cmd_fsm_0),
        .O13(n_24_aw_cmd_fsm_0),
        .O14(n_25_aw_cmd_fsm_0),
        .O15(E),
        .O2(b_push),
        .O3(n_4_aw_cmd_fsm_0),
        .O4(wrap_cnt),
        .O5(\wrap_cmd_0/wrap_second_len ),
        .O6(O4),
        .O7(O6),
        .O8(n_16_aw_cmd_fsm_0),
        .O9(n_20_aw_cmd_fsm_0),
        .Q(O1),
        .S({n_8_aw_cmd_fsm_0,n_9_aw_cmd_fsm_0,n_10_aw_cmd_fsm_0,n_11_aw_cmd_fsm_0}),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .incr_next_pending(incr_next_pending),
        .m_axi_awready(m_axi_awready),
        .m_axi_awvalid(m_axi_awvalid),
        .sel_first_i(sel_first_i),
        .si_rs_awvalid(si_rs_awvalid),
        .wrap_next_pending(wrap_next_pending));
axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_cmd_translator cmd_translator_0
       (.D({n_5_aw_cmd_fsm_0,n_6_aw_cmd_fsm_0}),
        .E(O2),
        .I1(n_16_aw_cmd_fsm_0),
        .I10(I5),
        .I11(n_21_aw_cmd_fsm_0),
        .I12(O1),
        .I13(n_24_aw_cmd_fsm_0),
        .I14(n_0_aw_cmd_fsm_0),
        .I15(I15),
        .I16(I10),
        .I17({I8,\wrap_cmd_0/wrap_second_len }),
        .I18(n_22_aw_cmd_fsm_0),
        .I19({D,wrap_cnt}),
        .I2(n_20_aw_cmd_fsm_0),
        .I20(I17),
        .I21(n_23_aw_cmd_fsm_0),
        .I22(I18),
        .I23(O7),
        .I3(n_25_aw_cmd_fsm_0),
        .I4(n_4_aw_cmd_fsm_0),
        .I5(I1),
        .I6(Q[18:0]),
        .I7(I2),
        .I8(I3),
        .I9(I4),
        .O1(n_0_cmd_translator_0),
        .O2(n_1_cmd_translator_0),
        .O3(n_2_cmd_translator_0),
        .O4(n_5_cmd_translator_0),
        .O5(n_6_cmd_translator_0),
        .O6(n_7_cmd_translator_0),
        .O7(sel_first),
        .O8(O5),
        .O9(O3),
        .Q({n_3_cmd_translator_0,n_4_cmd_translator_0}),
        .S({n_8_aw_cmd_fsm_0,n_9_aw_cmd_fsm_0,n_10_aw_cmd_fsm_0,n_11_aw_cmd_fsm_0}),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .axaddr_incr0(axaddr_incr0),
        .b_push(b_push),
        .incr_next_pending(incr_next_pending),
        .m_axi_awaddr(m_axi_awaddr),
        .sel_first_i(sel_first_i),
        .si_rs_awvalid(si_rs_awvalid),
        .wrap_next_pending(wrap_next_pending));
FDRE \s_awid_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(Q[19]),
        .Q(in[4]),
        .R(1'b0));
FDRE \s_awlen_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(Q[15]),
        .Q(in[0]),
        .R(1'b0));
FDRE \s_awlen_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(Q[16]),
        .Q(in[1]),
        .R(1'b0));
FDRE \s_awlen_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(Q[17]),
        .Q(in[2]),
        .R(1'b0));
FDRE \s_awlen_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(Q[18]),
        .Q(in[3]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_b2s_b_channel" *) 
module axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_b_channel
   (O1,
    O2,
    O3,
    O4,
    m_axi_bready,
    out,
    O5,
    si_rs_bvalid,
    shandshake,
    aclk,
    b_push,
    m_axi_bresp,
    m_axi_bvalid,
    areset_d1,
    in,
    si_rs_bready);
  output O1;
  output O2;
  output O3;
  output O4;
  output m_axi_bready;
  output [0:0]out;
  output [1:0]O5;
  output si_rs_bvalid;
  input shandshake;
  input aclk;
  input b_push;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  input areset_d1;
  input [4:0]in;
  input si_rs_bready;

  wire O1;
  wire O2;
  wire O3;
  wire O4;
  wire [1:0]O5;
  wire aclk;
  wire areset_d1;
  wire b_push;
  wire [7:0]bresp_cnt_reg__0;
  wire bresp_push;
  wire [4:0]in;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire mhandshake;
  wire mhandshake_r;
  wire \n_0_bresp_cnt[7]_i_3 ;
  wire n_0_bresp_fifo_0;
  wire n_0_bvalid_i_i_1;
  wire \n_0_s_bresp_acc[0]_i_1 ;
  wire \n_0_s_bresp_acc[1]_i_1 ;
  wire \n_0_s_bresp_acc_reg[0] ;
  wire \n_0_s_bresp_acc_reg[1] ;
  wire n_1_bresp_fifo_0;
  wire [0:0]out;
  wire [7:0]p_0_in;
  wire s_bresp_acc0;
  wire shandshake;
  wire shandshake_r;
  wire si_rs_bready;
  wire si_rs_bvalid;

axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo bid_fifo_0
       (.O1(O1),
        .O2(O2),
        .O3(O3),
        .O4(O4),
        .Q(bresp_cnt_reg__0),
        .SR(s_bresp_acc0),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .b_push(b_push),
        .bresp_push(bresp_push),
        .in(in),
        .mhandshake_r(mhandshake_r),
        .out(out),
        .shandshake_r(shandshake_r));
LUT1 #(
    .INIT(2'h1)) 
     \bresp_cnt[0]_i_1 
       (.I0(bresp_cnt_reg__0[0]),
        .O(p_0_in[0]));
(* SOFT_HLUTNM = "soft_lutpair112" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \bresp_cnt[1]_i_1 
       (.I0(bresp_cnt_reg__0[0]),
        .I1(bresp_cnt_reg__0[1]),
        .O(p_0_in[1]));
(* SOFT_HLUTNM = "soft_lutpair112" *) 
   LUT3 #(
    .INIT(8'h6A)) 
     \bresp_cnt[2]_i_1 
       (.I0(bresp_cnt_reg__0[2]),
        .I1(bresp_cnt_reg__0[1]),
        .I2(bresp_cnt_reg__0[0]),
        .O(p_0_in[2]));
(* SOFT_HLUTNM = "soft_lutpair110" *) 
   LUT4 #(
    .INIT(16'h6AAA)) 
     \bresp_cnt[3]_i_1 
       (.I0(bresp_cnt_reg__0[3]),
        .I1(bresp_cnt_reg__0[0]),
        .I2(bresp_cnt_reg__0[1]),
        .I3(bresp_cnt_reg__0[2]),
        .O(p_0_in[3]));
(* SOFT_HLUTNM = "soft_lutpair110" *) 
   LUT5 #(
    .INIT(32'h6AAAAAAA)) 
     \bresp_cnt[4]_i_1 
       (.I0(bresp_cnt_reg__0[4]),
        .I1(bresp_cnt_reg__0[2]),
        .I2(bresp_cnt_reg__0[1]),
        .I3(bresp_cnt_reg__0[0]),
        .I4(bresp_cnt_reg__0[3]),
        .O(p_0_in[4]));
LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
     \bresp_cnt[5]_i_1 
       (.I0(bresp_cnt_reg__0[5]),
        .I1(bresp_cnt_reg__0[3]),
        .I2(bresp_cnt_reg__0[0]),
        .I3(bresp_cnt_reg__0[1]),
        .I4(bresp_cnt_reg__0[2]),
        .I5(bresp_cnt_reg__0[4]),
        .O(p_0_in[5]));
(* SOFT_HLUTNM = "soft_lutpair111" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \bresp_cnt[6]_i_1 
       (.I0(bresp_cnt_reg__0[6]),
        .I1(\n_0_bresp_cnt[7]_i_3 ),
        .O(p_0_in[6]));
(* SOFT_HLUTNM = "soft_lutpair111" *) 
   LUT3 #(
    .INIT(8'h6A)) 
     \bresp_cnt[7]_i_2 
       (.I0(bresp_cnt_reg__0[7]),
        .I1(\n_0_bresp_cnt[7]_i_3 ),
        .I2(bresp_cnt_reg__0[6]),
        .O(p_0_in[7]));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     \bresp_cnt[7]_i_3 
       (.I0(bresp_cnt_reg__0[5]),
        .I1(bresp_cnt_reg__0[3]),
        .I2(bresp_cnt_reg__0[0]),
        .I3(bresp_cnt_reg__0[1]),
        .I4(bresp_cnt_reg__0[2]),
        .I5(bresp_cnt_reg__0[4]),
        .O(\n_0_bresp_cnt[7]_i_3 ));
FDRE \bresp_cnt_reg[0] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[0]),
        .Q(bresp_cnt_reg__0[0]),
        .R(s_bresp_acc0));
FDRE \bresp_cnt_reg[1] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[1]),
        .Q(bresp_cnt_reg__0[1]),
        .R(s_bresp_acc0));
FDRE \bresp_cnt_reg[2] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[2]),
        .Q(bresp_cnt_reg__0[2]),
        .R(s_bresp_acc0));
FDRE \bresp_cnt_reg[3] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[3]),
        .Q(bresp_cnt_reg__0[3]),
        .R(s_bresp_acc0));
FDRE \bresp_cnt_reg[4] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[4]),
        .Q(bresp_cnt_reg__0[4]),
        .R(s_bresp_acc0));
FDRE \bresp_cnt_reg[5] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[5]),
        .Q(bresp_cnt_reg__0[5]),
        .R(s_bresp_acc0));
FDRE \bresp_cnt_reg[6] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[6]),
        .Q(bresp_cnt_reg__0[6]),
        .R(s_bresp_acc0));
FDRE \bresp_cnt_reg[7] 
       (.C(aclk),
        .CE(mhandshake_r),
        .D(p_0_in[7]),
        .Q(bresp_cnt_reg__0[7]),
        .R(s_bresp_acc0));
axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo__parameterized0 bresp_fifo_0
       (.I1(O1),
        .O1(n_0_bresp_fifo_0),
        .O2(O2),
        .O3(n_1_bresp_fifo_0),
        .O5(O5),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .bresp_push(bresp_push),
        .in({\n_0_s_bresp_acc_reg[1] ,\n_0_s_bresp_acc_reg[0] }),
        .m_axi_bready(m_axi_bready),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_bvalid(m_axi_bvalid),
        .mhandshake(mhandshake),
        .mhandshake_r(mhandshake_r),
        .shandshake_r(shandshake_r));
LUT4 #(
    .INIT(16'h003A)) 
     bvalid_i_i_1
       (.I0(n_0_bresp_fifo_0),
        .I1(si_rs_bready),
        .I2(si_rs_bvalid),
        .I3(areset_d1),
        .O(n_0_bvalid_i_i_1));
FDRE bvalid_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(n_0_bvalid_i_i_1),
        .Q(si_rs_bvalid),
        .R(1'b0));
FDRE mhandshake_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(mhandshake),
        .Q(mhandshake_r),
        .R(1'b0));
LUT5 #(
    .INIT(32'h000000E2)) 
     \s_bresp_acc[0]_i_1 
       (.I0(\n_0_s_bresp_acc_reg[0] ),
        .I1(n_1_bresp_fifo_0),
        .I2(m_axi_bresp[0]),
        .I3(bresp_push),
        .I4(areset_d1),
        .O(\n_0_s_bresp_acc[0]_i_1 ));
LUT5 #(
    .INIT(32'h000000E2)) 
     \s_bresp_acc[1]_i_1 
       (.I0(\n_0_s_bresp_acc_reg[1] ),
        .I1(n_1_bresp_fifo_0),
        .I2(m_axi_bresp[1]),
        .I3(bresp_push),
        .I4(areset_d1),
        .O(\n_0_s_bresp_acc[1]_i_1 ));
FDRE \s_bresp_acc_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_s_bresp_acc[0]_i_1 ),
        .Q(\n_0_s_bresp_acc_reg[0] ),
        .R(1'b0));
FDRE \s_bresp_acc_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_s_bresp_acc[1]_i_1 ),
        .Q(\n_0_s_bresp_acc_reg[1] ),
        .R(1'b0));
FDRE shandshake_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(shandshake),
        .Q(shandshake_r),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_b2s_cmd_translator" *) 
module axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_cmd_translator
   (O1,
    O2,
    O3,
    Q,
    O4,
    O5,
    O6,
    O7,
    m_axi_awaddr,
    O8,
    O9,
    incr_next_pending,
    aclk,
    wrap_next_pending,
    sel_first_i,
    I1,
    I2,
    I3,
    I4,
    I5,
    E,
    I6,
    I7,
    I8,
    I9,
    I10,
    I11,
    I15,
    b_push,
    I12,
    si_rs_awvalid,
    areset_d1,
    I13,
    D,
    I14,
    I16,
    I17,
    I18,
    I19,
    I20,
    I21,
    axaddr_incr0,
    S,
    I22,
    I23);
  output O1;
  output O2;
  output O3;
  output [1:0]Q;
  output O4;
  output O5;
  output O6;
  output O7;
  output [11:0]m_axi_awaddr;
  output [3:0]O8;
  output [3:0]O9;
  input incr_next_pending;
  input aclk;
  input wrap_next_pending;
  input sel_first_i;
  input I1;
  input I2;
  input I3;
  input I4;
  input I5;
  input [0:0]E;
  input [18:0]I6;
  input I7;
  input I8;
  input I9;
  input I10;
  input I11;
  input I15;
  input b_push;
  input [1:0]I12;
  input si_rs_awvalid;
  input areset_d1;
  input I13;
  input [1:0]D;
  input I14;
  input [3:0]I16;
  input [3:0]I17;
  input [0:0]I18;
  input [3:0]I19;
  input [6:0]I20;
  input [0:0]I21;
  input [2:0]axaddr_incr0;
  input [3:0]S;
  input [3:0]I22;
  input [3:0]I23;

  wire [1:0]D;
  wire [0:0]E;
  wire I1;
  wire I10;
  wire I11;
  wire [1:0]I12;
  wire I13;
  wire I14;
  wire I15;
  wire [3:0]I16;
  wire [3:0]I17;
  wire [0:0]I18;
  wire [3:0]I19;
  wire I2;
  wire [6:0]I20;
  wire [0:0]I21;
  wire [3:0]I22;
  wire [3:0]I23;
  wire I3;
  wire I4;
  wire I5;
  wire [18:0]I6;
  wire I7;
  wire I8;
  wire I9;
  wire O1;
  wire O2;
  wire O3;
  wire O4;
  wire O5;
  wire O6;
  wire O7;
  wire [3:0]O8;
  wire [3:0]O9;
  wire [1:0]Q;
  wire [3:0]S;
  wire aclk;
  wire areset_d1;
  wire [2:0]axaddr_incr0;
  wire [11:0]axaddr_incr_reg;
  wire b_push;
  wire incr_next_pending;
  wire [11:0]m_axi_awaddr;
  wire s_axburst_eq0;
  wire s_axburst_eq1;
  wire sel_first_i;
  wire si_rs_awvalid;
  wire wrap_next_pending;

axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_incr_cmd incr_cmd_0
       (.D(D),
        .E(E),
        .I10(I10),
        .I12(I12),
        .I13(I13),
        .I14(I14),
        .I22(I22),
        .I23(I23),
        .I3(I3),
        .I4(I4),
        .I5(I5),
        .I6({I6[17],I6[13:12],I6[3]}),
        .I7(I7),
        .I8(I8),
        .I9(I9),
        .O1(O1),
        .O2(O7),
        .O5(O5),
        .Q(Q),
        .S(S),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .axaddr_incr0(axaddr_incr0),
        .axaddr_incr_reg(axaddr_incr_reg),
        .b_push(b_push),
        .incr_next_pending(incr_next_pending),
        .si_rs_awvalid(si_rs_awvalid));
LUT3 #(
    .INIT(8'hB8)) 
     \memory_reg[3][0]_srl4_i_2 
       (.I0(s_axburst_eq1),
        .I1(I6[14]),
        .I2(s_axburst_eq0),
        .O(O4));
FDRE s_axburst_eq0_reg
       (.C(aclk),
        .CE(1'b1),
        .D(I1),
        .Q(s_axburst_eq0),
        .R(1'b0));
FDRE s_axburst_eq1_reg
       (.C(aclk),
        .CE(1'b1),
        .D(I2),
        .Q(s_axburst_eq1),
        .R(1'b0));
FDRE sel_first_reg
       (.C(aclk),
        .CE(1'b1),
        .D(sel_first_i),
        .Q(O3),
        .R(1'b0));
axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_wrap_cmd wrap_cmd_0
       (.E(E),
        .I11(I11),
        .I12(I12),
        .I15(I15),
        .I16(I16),
        .I17(I17),
        .I18(I18),
        .I19(I19),
        .I20(I20),
        .I21(I21),
        .I6(I6),
        .O2(O2),
        .O6(O6),
        .O8(O8),
        .O9(O9),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .axaddr_incr_reg(axaddr_incr_reg),
        .b_push(b_push),
        .m_axi_awaddr(m_axi_awaddr),
        .si_rs_awvalid(si_rs_awvalid),
        .wrap_next_pending(wrap_next_pending));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_b2s_cmd_translator" *) 
module axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_cmd_translator_1
   (incr_next_pending,
    O1,
    O2,
    Q,
    O3,
    O4,
    O5,
    r_rlast,
    O6,
    m_axi_araddr,
    O7,
    O8,
    aclk,
    wrap_next_pending,
    sel_first_i,
    I1,
    I2,
    I3,
    I4,
    I5,
    E,
    I6,
    I7,
    I8,
    I9,
    I10,
    I11,
    I12,
    I13,
    m_axi_arready,
    I14,
    si_rs_arvalid,
    areset_d1,
    I15,
    D,
    I16,
    I17,
    I18,
    I19,
    I20,
    I21,
    I22,
    I26,
    S,
    I23,
    I24);
  output incr_next_pending;
  output O1;
  output O2;
  output [1:0]Q;
  output O3;
  output O4;
  output O5;
  output r_rlast;
  output O6;
  output [11:0]m_axi_araddr;
  output [3:0]O7;
  output [3:0]O8;
  input aclk;
  input wrap_next_pending;
  input sel_first_i;
  input I1;
  input I2;
  input I3;
  input I4;
  input I5;
  input [0:0]E;
  input [18:0]I6;
  input I7;
  input I8;
  input I9;
  input I10;
  input I11;
  input I12;
  input I13;
  input m_axi_arready;
  input [1:0]I14;
  input si_rs_arvalid;
  input areset_d1;
  input I15;
  input [1:0]D;
  input I16;
  input [3:0]I17;
  input [3:0]I18;
  input [0:0]I19;
  input [3:0]I20;
  input [6:0]I21;
  input [0:0]I22;
  input [2:0]I26;
  input [0:0]S;
  input [3:0]I23;
  input [3:0]I24;

  wire [1:0]D;
  wire [0:0]E;
  wire I1;
  wire I10;
  wire I11;
  wire I12;
  wire I13;
  wire [1:0]I14;
  wire I15;
  wire I16;
  wire [3:0]I17;
  wire [3:0]I18;
  wire [0:0]I19;
  wire I2;
  wire [3:0]I20;
  wire [6:0]I21;
  wire [0:0]I22;
  wire [3:0]I23;
  wire [3:0]I24;
  wire [2:0]I26;
  wire I3;
  wire I4;
  wire I5;
  wire [18:0]I6;
  wire I7;
  wire I8;
  wire I9;
  wire O1;
  wire O2;
  wire O3;
  wire O4;
  wire O5;
  wire O6;
  wire [3:0]O7;
  wire [3:0]O8;
  wire [1:0]Q;
  wire [0:0]S;
  wire aclk;
  wire areset_d1;
  wire [11:0]axaddr_incr_reg;
  wire incr_next_pending;
  wire [11:0]m_axi_araddr;
  wire m_axi_arready;
  wire r_rlast;
  wire s_axburst_eq0;
  wire s_axburst_eq1;
  wire sel_first_i;
  wire si_rs_arvalid;
  wire wrap_next_pending;

axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_incr_cmd_2 incr_cmd_0
       (.D(D),
        .E(E),
        .I10(I10),
        .I11(I11),
        .I12(I12),
        .I14(I14),
        .I15(I15),
        .I16(I16),
        .I23(I23),
        .I24(I24),
        .I26(I26),
        .I3(I3),
        .I4(I4),
        .I5(I5),
        .I6({I6[17],I6[13:12],I6[3:1]}),
        .I7(I7),
        .I8(I8),
        .I9(I9),
        .O1(O5),
        .O3(O3),
        .Q(Q),
        .S(S),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .axaddr_incr_reg(axaddr_incr_reg),
        .incr_next_pending(incr_next_pending),
        .m_axi_arready(m_axi_arready),
        .si_rs_arvalid(si_rs_arvalid));
(* SOFT_HLUTNM = "soft_lutpair10" *) 
   LUT3 #(
    .INIT(8'h27)) 
     r_rlast_r_i_1
       (.I0(I6[14]),
        .I1(s_axburst_eq1),
        .I2(s_axburst_eq0),
        .O(r_rlast));
FDRE s_axburst_eq0_reg
       (.C(aclk),
        .CE(1'b1),
        .D(I1),
        .Q(s_axburst_eq0),
        .R(1'b0));
FDRE s_axburst_eq1_reg
       (.C(aclk),
        .CE(1'b1),
        .D(I2),
        .Q(s_axburst_eq1),
        .R(1'b0));
FDRE sel_first_reg
       (.C(aclk),
        .CE(1'b1),
        .D(sel_first_i),
        .Q(O2),
        .R(1'b0));
(* SOFT_HLUTNM = "soft_lutpair10" *) 
   LUT3 #(
    .INIT(8'hCA)) 
     \state[1]_i_2 
       (.I0(s_axburst_eq0),
        .I1(s_axburst_eq1),
        .I2(I6[14]),
        .O(O6));
axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_wrap_cmd_3 wrap_cmd_0
       (.E(E),
        .I11(I11),
        .I13(I13),
        .I14(I14),
        .I17(I17),
        .I18(I18),
        .I19(I19),
        .I20(I20),
        .I21(I21),
        .I22(I22),
        .I6(I6),
        .O1(O1),
        .O4(O4),
        .O7(O7),
        .O8(O8),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .axaddr_incr_reg(axaddr_incr_reg),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_arready(m_axi_arready),
        .si_rs_arvalid(si_rs_arvalid),
        .wrap_next_pending(wrap_next_pending));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_b2s_incr_cmd" *) 
module axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_incr_cmd
   (O1,
    axaddr_incr_reg,
    Q,
    O5,
    O2,
    incr_next_pending,
    aclk,
    I3,
    I4,
    I5,
    I7,
    I8,
    I9,
    I10,
    E,
    I6,
    b_push,
    I12,
    si_rs_awvalid,
    areset_d1,
    I13,
    D,
    I14,
    axaddr_incr0,
    S,
    I22,
    I23);
  output O1;
  output [11:0]axaddr_incr_reg;
  output [1:0]Q;
  output O5;
  output O2;
  input incr_next_pending;
  input aclk;
  input I3;
  input I4;
  input I5;
  input I7;
  input I8;
  input I9;
  input I10;
  input [0:0]E;
  input [3:0]I6;
  input b_push;
  input [1:0]I12;
  input si_rs_awvalid;
  input areset_d1;
  input I13;
  input [1:0]D;
  input I14;
  input [2:0]axaddr_incr0;
  input [3:0]S;
  input [3:0]I22;
  input [3:0]I23;

  wire [1:0]D;
  wire [0:0]E;
  wire I10;
  wire [1:0]I12;
  wire I13;
  wire I14;
  wire [3:0]I22;
  wire [3:0]I23;
  wire I3;
  wire I4;
  wire I5;
  wire [3:0]I6;
  wire I7;
  wire I8;
  wire I9;
  wire O1;
  wire O2;
  wire O5;
  wire [1:0]Q;
  wire [3:0]S;
  wire aclk;
  wire areset_d1;
  wire [2:0]axaddr_incr0;
  wire [11:0]axaddr_incr_reg;
  wire b_push;
  wire [11:0]data;
  wire incr_next_pending;
  wire \n_0_axaddr_incr[0]_i_3 ;
  wire \n_0_axaddr_incr[10]_i_2 ;
  wire \n_0_axaddr_incr[11]_i_2 ;
  wire \n_0_axaddr_incr[1]_i_2 ;
  wire \n_0_axaddr_incr[2]_i_2 ;
  wire \n_0_axaddr_incr[3]_i_2 ;
  wire \n_0_axaddr_incr[4]_i_2 ;
  wire \n_0_axaddr_incr[5]_i_2 ;
  wire \n_0_axaddr_incr[6]_i_2 ;
  wire \n_0_axaddr_incr[7]_i_2 ;
  wire \n_0_axaddr_incr[8]_i_2 ;
  wire \n_0_axaddr_incr[9]_i_2 ;
  wire \n_0_axaddr_incr_reg[0]_i_2 ;
  wire \n_0_axaddr_incr_reg[0]_i_4 ;
  wire \n_0_axaddr_incr_reg[10]_i_1 ;
  wire \n_0_axaddr_incr_reg[10]_i_3 ;
  wire \n_0_axaddr_incr_reg[11]_i_1 ;
  wire \n_0_axaddr_incr_reg[1]_i_1 ;
  wire \n_0_axaddr_incr_reg[1]_i_3 ;
  wire \n_0_axaddr_incr_reg[2]_i_1 ;
  wire \n_0_axaddr_incr_reg[2]_i_3 ;
  wire \n_0_axaddr_incr_reg[3]_i_1 ;
  wire \n_0_axaddr_incr_reg[3]_i_3 ;
  wire \n_0_axaddr_incr_reg[4]_i_1 ;
  wire \n_0_axaddr_incr_reg[4]_i_3 ;
  wire \n_0_axaddr_incr_reg[4]_i_4 ;
  wire \n_0_axaddr_incr_reg[5]_i_1 ;
  wire \n_0_axaddr_incr_reg[5]_i_3 ;
  wire \n_0_axaddr_incr_reg[6]_i_1 ;
  wire \n_0_axaddr_incr_reg[6]_i_3 ;
  wire \n_0_axaddr_incr_reg[7]_i_1 ;
  wire \n_0_axaddr_incr_reg[7]_i_3 ;
  wire \n_0_axaddr_incr_reg[8]_i_1 ;
  wire \n_0_axaddr_incr_reg[8]_i_3 ;
  wire \n_0_axaddr_incr_reg[9]_i_1 ;
  wire \n_0_axaddr_incr_reg[9]_i_3 ;
  wire \n_0_axlen_cnt[2]_i_1 ;
  wire \n_0_axlen_cnt[3]_i_2 ;
  wire \n_0_axlen_cnt[4]_i_1 ;
  wire \n_0_axlen_cnt[5]_i_1 ;
  wire \n_0_axlen_cnt[6]_i_1 ;
  wire \n_0_axlen_cnt[7]_i_2 ;
  wire \n_0_axlen_cnt[7]_i_3 ;
  wire \n_0_axlen_cnt_reg[2] ;
  wire \n_0_axlen_cnt_reg[3] ;
  wire \n_0_axlen_cnt_reg[4] ;
  wire \n_0_axlen_cnt_reg[5] ;
  wire \n_0_axlen_cnt_reg[6] ;
  wire \n_0_axlen_cnt_reg[7] ;
  wire n_0_next_pending_r_i_5;
  wire n_0_sel_first_i_1;
  wire \n_1_axaddr_incr_reg[0]_i_4 ;
  wire \n_1_axaddr_incr_reg[4]_i_4 ;
  wire \n_1_axaddr_incr_reg[8]_i_4 ;
  wire \n_2_axaddr_incr_reg[0]_i_4 ;
  wire \n_2_axaddr_incr_reg[4]_i_4 ;
  wire \n_2_axaddr_incr_reg[8]_i_4 ;
  wire \n_3_axaddr_incr_reg[0]_i_4 ;
  wire \n_3_axaddr_incr_reg[4]_i_4 ;
  wire \n_3_axaddr_incr_reg[8]_i_4 ;
  wire si_rs_awvalid;
  wire [3:3]\NLW_axaddr_incr_reg[8]_i_4_CO_UNCONNECTED ;
  wire [3:2]\NLW_axaddr_incr_reg[9]_i_3_CARRY4_CO_UNCONNECTED ;
  wire [3:3]\NLW_axaddr_incr_reg[9]_i_3_CARRY4_DI_UNCONNECTED ;

LUT5 #(
    .INIT(32'hFFE100E1)) 
     \axaddr_incr[0]_i_3 
       (.I0(I6[2]),
        .I1(I6[1]),
        .I2(axaddr_incr_reg[0]),
        .I3(O2),
        .I4(data[0]),
        .O(\n_0_axaddr_incr[0]_i_3 ));
LUT3 #(
    .INIT(8'hB8)) 
     \axaddr_incr[10]_i_2 
       (.I0(data[10]),
        .I1(O2),
        .I2(axaddr_incr_reg[10]),
        .O(\n_0_axaddr_incr[10]_i_2 ));
LUT3 #(
    .INIT(8'hB8)) 
     \axaddr_incr[11]_i_2 
       (.I0(data[11]),
        .I1(O2),
        .I2(axaddr_incr_reg[11]),
        .O(\n_0_axaddr_incr[11]_i_2 ));
LUT5 #(
    .INIT(32'hFFD200D2)) 
     \axaddr_incr[1]_i_2 
       (.I0(I6[1]),
        .I1(I6[2]),
        .I2(axaddr_incr_reg[1]),
        .I3(O2),
        .I4(data[1]),
        .O(\n_0_axaddr_incr[1]_i_2 ));
LUT5 #(
    .INIT(32'hFFD200D2)) 
     \axaddr_incr[2]_i_2 
       (.I0(I6[2]),
        .I1(I6[1]),
        .I2(axaddr_incr_reg[2]),
        .I3(O2),
        .I4(data[2]),
        .O(\n_0_axaddr_incr[2]_i_2 ));
LUT5 #(
    .INIT(32'hFF780078)) 
     \axaddr_incr[3]_i_2 
       (.I0(I6[2]),
        .I1(I6[1]),
        .I2(axaddr_incr_reg[3]),
        .I3(O2),
        .I4(data[3]),
        .O(\n_0_axaddr_incr[3]_i_2 ));
LUT3 #(
    .INIT(8'hB8)) 
     \axaddr_incr[4]_i_2 
       (.I0(data[4]),
        .I1(O2),
        .I2(axaddr_incr_reg[4]),
        .O(\n_0_axaddr_incr[4]_i_2 ));
LUT3 #(
    .INIT(8'hB8)) 
     \axaddr_incr[5]_i_2 
       (.I0(data[5]),
        .I1(O2),
        .I2(axaddr_incr_reg[5]),
        .O(\n_0_axaddr_incr[5]_i_2 ));
LUT3 #(
    .INIT(8'hB8)) 
     \axaddr_incr[6]_i_2 
       (.I0(data[6]),
        .I1(O2),
        .I2(axaddr_incr_reg[6]),
        .O(\n_0_axaddr_incr[6]_i_2 ));
LUT3 #(
    .INIT(8'hB8)) 
     \axaddr_incr[7]_i_2 
       (.I0(data[7]),
        .I1(O2),
        .I2(axaddr_incr_reg[7]),
        .O(\n_0_axaddr_incr[7]_i_2 ));
LUT3 #(
    .INIT(8'hB8)) 
     \axaddr_incr[8]_i_2 
       (.I0(data[8]),
        .I1(O2),
        .I2(axaddr_incr_reg[8]),
        .O(\n_0_axaddr_incr[8]_i_2 ));
LUT3 #(
    .INIT(8'hB8)) 
     \axaddr_incr[9]_i_2 
       (.I0(data[9]),
        .I1(O2),
        .I2(axaddr_incr_reg[9]),
        .O(\n_0_axaddr_incr[9]_i_2 ));
FDRE \axaddr_incr_reg[0] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[0]_i_2 ),
        .Q(axaddr_incr_reg[0]),
        .R(1'b0));
CARRY4 \axaddr_incr_reg[0]_i_4 
       (.CI(1'b0),
        .CO({\n_0_axaddr_incr_reg[0]_i_4 ,\n_1_axaddr_incr_reg[0]_i_4 ,\n_2_axaddr_incr_reg[0]_i_4 ,\n_3_axaddr_incr_reg[0]_i_4 }),
        .CYINIT(1'b0),
        .DI({I6[0],axaddr_incr0}),
        .O(data[3:0]),
        .S(S));
FDRE \axaddr_incr_reg[10] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[10]_i_1 ),
        .Q(axaddr_incr_reg[10]),
        .R(1'b0));
FDRE \axaddr_incr_reg[11] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[11]_i_1 ),
        .Q(axaddr_incr_reg[11]),
        .R(1'b0));
FDRE \axaddr_incr_reg[1] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[1]_i_1 ),
        .Q(axaddr_incr_reg[1]),
        .R(1'b0));
(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* XILINX_TRANSFORM_PINMAP = "LO:O" *) 
   CARRY4 \axaddr_incr_reg[1]_i_3_CARRY4 
       (.CI(1'b0),
        .CO({\n_0_axaddr_incr_reg[4]_i_3 ,\n_0_axaddr_incr_reg[3]_i_3 ,\n_0_axaddr_incr_reg[2]_i_3 ,\n_0_axaddr_incr_reg[1]_i_3 }),
        .CYINIT(1'b0),
        .DI({I10,I9,I8,I7}),
        .O({\n_0_axaddr_incr_reg[3]_i_1 ,\n_0_axaddr_incr_reg[2]_i_1 ,\n_0_axaddr_incr_reg[1]_i_1 ,\n_0_axaddr_incr_reg[0]_i_2 }),
        .S({\n_0_axaddr_incr[3]_i_2 ,\n_0_axaddr_incr[2]_i_2 ,\n_0_axaddr_incr[1]_i_2 ,\n_0_axaddr_incr[0]_i_3 }));
FDRE \axaddr_incr_reg[2] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[2]_i_1 ),
        .Q(axaddr_incr_reg[2]),
        .R(1'b0));
FDRE \axaddr_incr_reg[3] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[3]_i_1 ),
        .Q(axaddr_incr_reg[3]),
        .R(1'b0));
FDRE \axaddr_incr_reg[4] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[4]_i_1 ),
        .Q(axaddr_incr_reg[4]),
        .R(1'b0));
CARRY4 \axaddr_incr_reg[4]_i_4 
       (.CI(\n_0_axaddr_incr_reg[0]_i_4 ),
        .CO({\n_0_axaddr_incr_reg[4]_i_4 ,\n_1_axaddr_incr_reg[4]_i_4 ,\n_2_axaddr_incr_reg[4]_i_4 ,\n_3_axaddr_incr_reg[4]_i_4 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data[7:4]),
        .S(I22));
FDRE \axaddr_incr_reg[5] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[5]_i_1 ),
        .Q(axaddr_incr_reg[5]),
        .R(1'b0));
(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* XILINX_TRANSFORM_PINMAP = "LO:O" *) 
   CARRY4 \axaddr_incr_reg[5]_i_3_CARRY4 
       (.CI(\n_0_axaddr_incr_reg[4]_i_3 ),
        .CO({\n_0_axaddr_incr_reg[8]_i_3 ,\n_0_axaddr_incr_reg[7]_i_3 ,\n_0_axaddr_incr_reg[6]_i_3 ,\n_0_axaddr_incr_reg[5]_i_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_0_axaddr_incr_reg[7]_i_1 ,\n_0_axaddr_incr_reg[6]_i_1 ,\n_0_axaddr_incr_reg[5]_i_1 ,\n_0_axaddr_incr_reg[4]_i_1 }),
        .S({\n_0_axaddr_incr[7]_i_2 ,\n_0_axaddr_incr[6]_i_2 ,\n_0_axaddr_incr[5]_i_2 ,\n_0_axaddr_incr[4]_i_2 }));
FDRE \axaddr_incr_reg[6] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[6]_i_1 ),
        .Q(axaddr_incr_reg[6]),
        .R(1'b0));
FDRE \axaddr_incr_reg[7] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[7]_i_1 ),
        .Q(axaddr_incr_reg[7]),
        .R(1'b0));
FDRE \axaddr_incr_reg[8] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[8]_i_1 ),
        .Q(axaddr_incr_reg[8]),
        .R(1'b0));
CARRY4 \axaddr_incr_reg[8]_i_4 
       (.CI(\n_0_axaddr_incr_reg[4]_i_4 ),
        .CO({\NLW_axaddr_incr_reg[8]_i_4_CO_UNCONNECTED [3],\n_1_axaddr_incr_reg[8]_i_4 ,\n_2_axaddr_incr_reg[8]_i_4 ,\n_3_axaddr_incr_reg[8]_i_4 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data[11:8]),
        .S(I23));
FDRE \axaddr_incr_reg[9] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[9]_i_1 ),
        .Q(axaddr_incr_reg[9]),
        .R(1'b0));
(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* XILINX_TRANSFORM_PINMAP = "LO:O" *) 
   CARRY4 \axaddr_incr_reg[9]_i_3_CARRY4 
       (.CI(\n_0_axaddr_incr_reg[8]_i_3 ),
        .CO({\NLW_axaddr_incr_reg[9]_i_3_CARRY4_CO_UNCONNECTED [3:2],\n_0_axaddr_incr_reg[10]_i_3 ,\n_0_axaddr_incr_reg[9]_i_3 }),
        .CYINIT(1'b0),
        .DI({\NLW_axaddr_incr_reg[9]_i_3_CARRY4_DI_UNCONNECTED [3],1'b0,1'b0,1'b0}),
        .O({\n_0_axaddr_incr_reg[11]_i_1 ,\n_0_axaddr_incr_reg[10]_i_1 ,\n_0_axaddr_incr_reg[9]_i_1 ,\n_0_axaddr_incr_reg[8]_i_1 }),
        .S({\n_0_axaddr_incr[11]_i_2 ,\n_0_axaddr_incr[10]_i_2 ,\n_0_axaddr_incr[9]_i_2 ,\n_0_axaddr_incr[8]_i_2 }));
LUT6 #(
    .INIT(64'hF8F8F88F88888888)) 
     \axlen_cnt[2]_i_1 
       (.I0(E),
        .I1(I6[3]),
        .I2(\n_0_axlen_cnt_reg[2] ),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(I4),
        .O(\n_0_axlen_cnt[2]_i_1 ));
LUT6 #(
    .INIT(64'hAAA90000FFFFFFFF)) 
     \axlen_cnt[3]_i_2 
       (.I0(\n_0_axlen_cnt_reg[3] ),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(\n_0_axlen_cnt_reg[2] ),
        .I4(I4),
        .I5(I5),
        .O(\n_0_axlen_cnt[3]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair101" *) 
   LUT5 #(
    .INIT(32'hAAAAAAA9)) 
     \axlen_cnt[4]_i_1 
       (.I0(\n_0_axlen_cnt_reg[4] ),
        .I1(\n_0_axlen_cnt_reg[2] ),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\n_0_axlen_cnt_reg[3] ),
        .O(\n_0_axlen_cnt[4]_i_1 ));
LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA9)) 
     \axlen_cnt[5]_i_1 
       (.I0(\n_0_axlen_cnt_reg[5] ),
        .I1(\n_0_axlen_cnt_reg[3] ),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\n_0_axlen_cnt_reg[2] ),
        .I5(\n_0_axlen_cnt_reg[4] ),
        .O(\n_0_axlen_cnt[5]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair102" *) 
   LUT3 #(
    .INIT(8'hA9)) 
     \axlen_cnt[6]_i_1 
       (.I0(\n_0_axlen_cnt_reg[6] ),
        .I1(\n_0_axlen_cnt[7]_i_3 ),
        .I2(\n_0_axlen_cnt_reg[5] ),
        .O(\n_0_axlen_cnt[6]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair102" *) 
   LUT4 #(
    .INIT(16'hAAA9)) 
     \axlen_cnt[7]_i_2 
       (.I0(\n_0_axlen_cnt_reg[7] ),
        .I1(\n_0_axlen_cnt[7]_i_3 ),
        .I2(\n_0_axlen_cnt_reg[5] ),
        .I3(\n_0_axlen_cnt_reg[6] ),
        .O(\n_0_axlen_cnt[7]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair101" *) 
   LUT5 #(
    .INIT(32'hFFFFFFFE)) 
     \axlen_cnt[7]_i_3 
       (.I0(\n_0_axlen_cnt_reg[4] ),
        .I1(\n_0_axlen_cnt_reg[2] ),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\n_0_axlen_cnt_reg[3] ),
        .O(\n_0_axlen_cnt[7]_i_3 ));
FDRE \axlen_cnt_reg[0] 
       (.C(aclk),
        .CE(I13),
        .D(D[0]),
        .Q(Q[0]),
        .R(1'b0));
FDRE \axlen_cnt_reg[1] 
       (.C(aclk),
        .CE(I13),
        .D(D[1]),
        .Q(Q[1]),
        .R(1'b0));
FDRE \axlen_cnt_reg[2] 
       (.C(aclk),
        .CE(I13),
        .D(\n_0_axlen_cnt[2]_i_1 ),
        .Q(\n_0_axlen_cnt_reg[2] ),
        .R(1'b0));
FDRE \axlen_cnt_reg[3] 
       (.C(aclk),
        .CE(I13),
        .D(\n_0_axlen_cnt[3]_i_2 ),
        .Q(\n_0_axlen_cnt_reg[3] ),
        .R(1'b0));
FDRE \axlen_cnt_reg[4] 
       (.C(aclk),
        .CE(I13),
        .D(\n_0_axlen_cnt[4]_i_1 ),
        .Q(\n_0_axlen_cnt_reg[4] ),
        .R(I14));
FDRE \axlen_cnt_reg[5] 
       (.C(aclk),
        .CE(I13),
        .D(\n_0_axlen_cnt[5]_i_1 ),
        .Q(\n_0_axlen_cnt_reg[5] ),
        .R(I14));
FDRE \axlen_cnt_reg[6] 
       (.C(aclk),
        .CE(I13),
        .D(\n_0_axlen_cnt[6]_i_1 ),
        .Q(\n_0_axlen_cnt_reg[6] ),
        .R(I14));
FDRE \axlen_cnt_reg[7] 
       (.C(aclk),
        .CE(I13),
        .D(\n_0_axlen_cnt[7]_i_2 ),
        .Q(\n_0_axlen_cnt_reg[7] ),
        .R(I14));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
     next_pending_r_i_4
       (.I0(\n_0_axlen_cnt_reg[3] ),
        .I1(\n_0_axlen_cnt_reg[4] ),
        .I2(Q[1]),
        .I3(\n_0_axlen_cnt_reg[2] ),
        .I4(n_0_next_pending_r_i_5),
        .I5(\n_0_axlen_cnt_reg[7] ),
        .O(O5));
LUT2 #(
    .INIT(4'hE)) 
     next_pending_r_i_5
       (.I0(\n_0_axlen_cnt_reg[5] ),
        .I1(\n_0_axlen_cnt_reg[6] ),
        .O(n_0_next_pending_r_i_5));
FDRE next_pending_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(incr_next_pending),
        .Q(O1),
        .R(1'b0));
LUT6 #(
    .INIT(64'hFFFFFFFF44440F04)) 
     sel_first_i_1
       (.I0(b_push),
        .I1(O2),
        .I2(I12[1]),
        .I3(si_rs_awvalid),
        .I4(I12[0]),
        .I5(areset_d1),
        .O(n_0_sel_first_i_1));
FDRE sel_first_reg
       (.C(aclk),
        .CE(1'b1),
        .D(n_0_sel_first_i_1),
        .Q(O2),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_b2s_incr_cmd" *) 
module axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_incr_cmd_2
   (incr_next_pending,
    axaddr_incr_reg,
    Q,
    O3,
    O1,
    aclk,
    I3,
    I4,
    I5,
    I7,
    I8,
    I9,
    I10,
    E,
    I6,
    I11,
    I12,
    m_axi_arready,
    I14,
    si_rs_arvalid,
    areset_d1,
    I15,
    D,
    I16,
    I26,
    S,
    I23,
    I24);
  output incr_next_pending;
  output [11:0]axaddr_incr_reg;
  output [1:0]Q;
  output O3;
  output O1;
  input aclk;
  input I3;
  input I4;
  input I5;
  input I7;
  input I8;
  input I9;
  input I10;
  input [0:0]E;
  input [5:0]I6;
  input I11;
  input I12;
  input m_axi_arready;
  input [1:0]I14;
  input si_rs_arvalid;
  input areset_d1;
  input I15;
  input [1:0]D;
  input I16;
  input [2:0]I26;
  input [0:0]S;
  input [3:0]I23;
  input [3:0]I24;

  wire [1:0]D;
  wire [0:0]E;
  wire I10;
  wire I11;
  wire I12;
  wire [1:0]I14;
  wire I15;
  wire I16;
  wire [3:0]I23;
  wire [3:0]I24;
  wire [2:0]I26;
  wire I3;
  wire I4;
  wire I5;
  wire [5:0]I6;
  wire I7;
  wire I8;
  wire I9;
  wire O1;
  wire O3;
  wire [1:0]Q;
  wire [0:0]S;
  wire aclk;
  wire areset_d1;
  wire [11:0]axaddr_incr_reg;
  wire incr_next_pending;
  wire m_axi_arready;
  wire \n_0_axaddr_incr[0]_i_10 ;
  wire \n_0_axaddr_incr[0]_i_3__0 ;
  wire \n_0_axaddr_incr[0]_i_8 ;
  wire \n_0_axaddr_incr[0]_i_9 ;
  wire \n_0_axaddr_incr[10]_i_2__0 ;
  wire \n_0_axaddr_incr[11]_i_2__0 ;
  wire \n_0_axaddr_incr[1]_i_2__0 ;
  wire \n_0_axaddr_incr[2]_i_2__0 ;
  wire \n_0_axaddr_incr[3]_i_2__0 ;
  wire \n_0_axaddr_incr[4]_i_2__0 ;
  wire \n_0_axaddr_incr[5]_i_2__0 ;
  wire \n_0_axaddr_incr[6]_i_2__0 ;
  wire \n_0_axaddr_incr[7]_i_2__0 ;
  wire \n_0_axaddr_incr[8]_i_2__0 ;
  wire \n_0_axaddr_incr[9]_i_2__0 ;
  wire \n_0_axaddr_incr_reg[0]_i_2__0 ;
  wire \n_0_axaddr_incr_reg[0]_i_4 ;
  wire \n_0_axaddr_incr_reg[10]_i_1__0 ;
  wire \n_0_axaddr_incr_reg[10]_i_3__0 ;
  wire \n_0_axaddr_incr_reg[11]_i_1__0 ;
  wire \n_0_axaddr_incr_reg[1]_i_1__0 ;
  wire \n_0_axaddr_incr_reg[1]_i_3__0 ;
  wire \n_0_axaddr_incr_reg[2]_i_1__0 ;
  wire \n_0_axaddr_incr_reg[2]_i_3__0 ;
  wire \n_0_axaddr_incr_reg[3]_i_1__0 ;
  wire \n_0_axaddr_incr_reg[3]_i_3__0 ;
  wire \n_0_axaddr_incr_reg[4]_i_1__0 ;
  wire \n_0_axaddr_incr_reg[4]_i_3__0 ;
  wire \n_0_axaddr_incr_reg[4]_i_4 ;
  wire \n_0_axaddr_incr_reg[5]_i_1__0 ;
  wire \n_0_axaddr_incr_reg[5]_i_3__0 ;
  wire \n_0_axaddr_incr_reg[6]_i_1__0 ;
  wire \n_0_axaddr_incr_reg[6]_i_3__0 ;
  wire \n_0_axaddr_incr_reg[7]_i_1__0 ;
  wire \n_0_axaddr_incr_reg[7]_i_3__0 ;
  wire \n_0_axaddr_incr_reg[8]_i_1__0 ;
  wire \n_0_axaddr_incr_reg[8]_i_3__0 ;
  wire \n_0_axaddr_incr_reg[9]_i_1__0 ;
  wire \n_0_axaddr_incr_reg[9]_i_3__0 ;
  wire \n_0_axlen_cnt[2]_i_1__1 ;
  wire \n_0_axlen_cnt[3]_i_2__1 ;
  wire \n_0_axlen_cnt[4]_i_1__0 ;
  wire \n_0_axlen_cnt[5]_i_1__0 ;
  wire \n_0_axlen_cnt[6]_i_1__0 ;
  wire \n_0_axlen_cnt[7]_i_2__0 ;
  wire \n_0_axlen_cnt[7]_i_3__0 ;
  wire \n_0_axlen_cnt_reg[2] ;
  wire \n_0_axlen_cnt_reg[3] ;
  wire \n_0_axlen_cnt_reg[4] ;
  wire \n_0_axlen_cnt_reg[5] ;
  wire \n_0_axlen_cnt_reg[6] ;
  wire \n_0_axlen_cnt_reg[7] ;
  wire n_0_next_pending_r_i_5__0;
  wire n_0_next_pending_r_reg;
  wire n_0_sel_first_i_1;
  wire \n_1_axaddr_incr_reg[0]_i_4 ;
  wire \n_1_axaddr_incr_reg[4]_i_4 ;
  wire \n_1_axaddr_incr_reg[8]_i_4 ;
  wire \n_2_axaddr_incr_reg[0]_i_4 ;
  wire \n_2_axaddr_incr_reg[4]_i_4 ;
  wire \n_2_axaddr_incr_reg[8]_i_4 ;
  wire \n_3_axaddr_incr_reg[0]_i_4 ;
  wire \n_3_axaddr_incr_reg[4]_i_4 ;
  wire \n_3_axaddr_incr_reg[8]_i_4 ;
  wire \n_4_axaddr_incr_reg[0]_i_4 ;
  wire \n_4_axaddr_incr_reg[4]_i_4 ;
  wire \n_4_axaddr_incr_reg[8]_i_4 ;
  wire \n_5_axaddr_incr_reg[0]_i_4 ;
  wire \n_5_axaddr_incr_reg[4]_i_4 ;
  wire \n_5_axaddr_incr_reg[8]_i_4 ;
  wire \n_6_axaddr_incr_reg[0]_i_4 ;
  wire \n_6_axaddr_incr_reg[4]_i_4 ;
  wire \n_6_axaddr_incr_reg[8]_i_4 ;
  wire \n_7_axaddr_incr_reg[0]_i_4 ;
  wire \n_7_axaddr_incr_reg[4]_i_4 ;
  wire \n_7_axaddr_incr_reg[8]_i_4 ;
  wire si_rs_arvalid;
  wire [3:3]\NLW_axaddr_incr_reg[8]_i_4_CO_UNCONNECTED ;
  wire [3:2]\NLW_axaddr_incr_reg[9]_i_3__0_CARRY4_CO_UNCONNECTED ;
  wire [3:3]\NLW_axaddr_incr_reg[9]_i_3__0_CARRY4_DI_UNCONNECTED ;

LUT6 #(
    .INIT(64'h00000000A6AAAAAA)) 
     \axaddr_incr[0]_i_10 
       (.I0(I6[0]),
        .I1(I14[0]),
        .I2(I14[1]),
        .I3(m_axi_arready),
        .I4(I6[3]),
        .I5(I6[4]),
        .O(\n_0_axaddr_incr[0]_i_10 ));
LUT5 #(
    .INIT(32'hFFE100E1)) 
     \axaddr_incr[0]_i_3__0 
       (.I0(I6[4]),
        .I1(I6[3]),
        .I2(axaddr_incr_reg[0]),
        .I3(O1),
        .I4(\n_7_axaddr_incr_reg[0]_i_4 ),
        .O(\n_0_axaddr_incr[0]_i_3__0 ));
LUT6 #(
    .INIT(64'hA6AAAAAAAAAAAAAA)) 
     \axaddr_incr[0]_i_8 
       (.I0(I6[2]),
        .I1(I14[0]),
        .I2(I14[1]),
        .I3(m_axi_arready),
        .I4(I6[4]),
        .I5(I6[3]),
        .O(\n_0_axaddr_incr[0]_i_8 ));
LUT6 #(
    .INIT(64'h0000AAAAA6AAAAAA)) 
     \axaddr_incr[0]_i_9 
       (.I0(I6[1]),
        .I1(I14[0]),
        .I2(I14[1]),
        .I3(m_axi_arready),
        .I4(I6[4]),
        .I5(I6[3]),
        .O(\n_0_axaddr_incr[0]_i_9 ));
LUT3 #(
    .INIT(8'hB8)) 
     \axaddr_incr[10]_i_2__0 
       (.I0(\n_5_axaddr_incr_reg[8]_i_4 ),
        .I1(O1),
        .I2(axaddr_incr_reg[10]),
        .O(\n_0_axaddr_incr[10]_i_2__0 ));
LUT3 #(
    .INIT(8'hB8)) 
     \axaddr_incr[11]_i_2__0 
       (.I0(\n_4_axaddr_incr_reg[8]_i_4 ),
        .I1(O1),
        .I2(axaddr_incr_reg[11]),
        .O(\n_0_axaddr_incr[11]_i_2__0 ));
LUT5 #(
    .INIT(32'hFFD200D2)) 
     \axaddr_incr[1]_i_2__0 
       (.I0(I6[3]),
        .I1(I6[4]),
        .I2(axaddr_incr_reg[1]),
        .I3(O1),
        .I4(\n_6_axaddr_incr_reg[0]_i_4 ),
        .O(\n_0_axaddr_incr[1]_i_2__0 ));
LUT5 #(
    .INIT(32'hFFD200D2)) 
     \axaddr_incr[2]_i_2__0 
       (.I0(I6[4]),
        .I1(I6[3]),
        .I2(axaddr_incr_reg[2]),
        .I3(O1),
        .I4(\n_5_axaddr_incr_reg[0]_i_4 ),
        .O(\n_0_axaddr_incr[2]_i_2__0 ));
LUT5 #(
    .INIT(32'hFF780078)) 
     \axaddr_incr[3]_i_2__0 
       (.I0(I6[4]),
        .I1(I6[3]),
        .I2(axaddr_incr_reg[3]),
        .I3(O1),
        .I4(\n_4_axaddr_incr_reg[0]_i_4 ),
        .O(\n_0_axaddr_incr[3]_i_2__0 ));
LUT3 #(
    .INIT(8'hB8)) 
     \axaddr_incr[4]_i_2__0 
       (.I0(\n_7_axaddr_incr_reg[4]_i_4 ),
        .I1(O1),
        .I2(axaddr_incr_reg[4]),
        .O(\n_0_axaddr_incr[4]_i_2__0 ));
LUT3 #(
    .INIT(8'hB8)) 
     \axaddr_incr[5]_i_2__0 
       (.I0(\n_6_axaddr_incr_reg[4]_i_4 ),
        .I1(O1),
        .I2(axaddr_incr_reg[5]),
        .O(\n_0_axaddr_incr[5]_i_2__0 ));
LUT3 #(
    .INIT(8'hB8)) 
     \axaddr_incr[6]_i_2__0 
       (.I0(\n_5_axaddr_incr_reg[4]_i_4 ),
        .I1(O1),
        .I2(axaddr_incr_reg[6]),
        .O(\n_0_axaddr_incr[6]_i_2__0 ));
LUT3 #(
    .INIT(8'hB8)) 
     \axaddr_incr[7]_i_2__0 
       (.I0(\n_4_axaddr_incr_reg[4]_i_4 ),
        .I1(O1),
        .I2(axaddr_incr_reg[7]),
        .O(\n_0_axaddr_incr[7]_i_2__0 ));
LUT3 #(
    .INIT(8'hB8)) 
     \axaddr_incr[8]_i_2__0 
       (.I0(\n_7_axaddr_incr_reg[8]_i_4 ),
        .I1(O1),
        .I2(axaddr_incr_reg[8]),
        .O(\n_0_axaddr_incr[8]_i_2__0 ));
LUT3 #(
    .INIT(8'hB8)) 
     \axaddr_incr[9]_i_2__0 
       (.I0(\n_6_axaddr_incr_reg[8]_i_4 ),
        .I1(O1),
        .I2(axaddr_incr_reg[9]),
        .O(\n_0_axaddr_incr[9]_i_2__0 ));
FDRE \axaddr_incr_reg[0] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[0]_i_2__0 ),
        .Q(axaddr_incr_reg[0]),
        .R(1'b0));
CARRY4 \axaddr_incr_reg[0]_i_4 
       (.CI(1'b0),
        .CO({\n_0_axaddr_incr_reg[0]_i_4 ,\n_1_axaddr_incr_reg[0]_i_4 ,\n_2_axaddr_incr_reg[0]_i_4 ,\n_3_axaddr_incr_reg[0]_i_4 }),
        .CYINIT(1'b0),
        .DI({I6[2],I26}),
        .O({\n_4_axaddr_incr_reg[0]_i_4 ,\n_5_axaddr_incr_reg[0]_i_4 ,\n_6_axaddr_incr_reg[0]_i_4 ,\n_7_axaddr_incr_reg[0]_i_4 }),
        .S({\n_0_axaddr_incr[0]_i_8 ,\n_0_axaddr_incr[0]_i_9 ,\n_0_axaddr_incr[0]_i_10 ,S}));
FDRE \axaddr_incr_reg[10] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[10]_i_1__0 ),
        .Q(axaddr_incr_reg[10]),
        .R(1'b0));
FDRE \axaddr_incr_reg[11] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[11]_i_1__0 ),
        .Q(axaddr_incr_reg[11]),
        .R(1'b0));
FDRE \axaddr_incr_reg[1] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[1]_i_1__0 ),
        .Q(axaddr_incr_reg[1]),
        .R(1'b0));
(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* XILINX_TRANSFORM_PINMAP = "LO:O" *) 
   CARRY4 \axaddr_incr_reg[1]_i_3__0_CARRY4 
       (.CI(1'b0),
        .CO({\n_0_axaddr_incr_reg[4]_i_3__0 ,\n_0_axaddr_incr_reg[3]_i_3__0 ,\n_0_axaddr_incr_reg[2]_i_3__0 ,\n_0_axaddr_incr_reg[1]_i_3__0 }),
        .CYINIT(1'b0),
        .DI({I10,I9,I8,I7}),
        .O({\n_0_axaddr_incr_reg[3]_i_1__0 ,\n_0_axaddr_incr_reg[2]_i_1__0 ,\n_0_axaddr_incr_reg[1]_i_1__0 ,\n_0_axaddr_incr_reg[0]_i_2__0 }),
        .S({\n_0_axaddr_incr[3]_i_2__0 ,\n_0_axaddr_incr[2]_i_2__0 ,\n_0_axaddr_incr[1]_i_2__0 ,\n_0_axaddr_incr[0]_i_3__0 }));
FDRE \axaddr_incr_reg[2] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[2]_i_1__0 ),
        .Q(axaddr_incr_reg[2]),
        .R(1'b0));
FDRE \axaddr_incr_reg[3] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[3]_i_1__0 ),
        .Q(axaddr_incr_reg[3]),
        .R(1'b0));
FDRE \axaddr_incr_reg[4] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[4]_i_1__0 ),
        .Q(axaddr_incr_reg[4]),
        .R(1'b0));
CARRY4 \axaddr_incr_reg[4]_i_4 
       (.CI(\n_0_axaddr_incr_reg[0]_i_4 ),
        .CO({\n_0_axaddr_incr_reg[4]_i_4 ,\n_1_axaddr_incr_reg[4]_i_4 ,\n_2_axaddr_incr_reg[4]_i_4 ,\n_3_axaddr_incr_reg[4]_i_4 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_axaddr_incr_reg[4]_i_4 ,\n_5_axaddr_incr_reg[4]_i_4 ,\n_6_axaddr_incr_reg[4]_i_4 ,\n_7_axaddr_incr_reg[4]_i_4 }),
        .S(I23));
FDRE \axaddr_incr_reg[5] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[5]_i_1__0 ),
        .Q(axaddr_incr_reg[5]),
        .R(1'b0));
(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* XILINX_TRANSFORM_PINMAP = "LO:O" *) 
   CARRY4 \axaddr_incr_reg[5]_i_3__0_CARRY4 
       (.CI(\n_0_axaddr_incr_reg[4]_i_3__0 ),
        .CO({\n_0_axaddr_incr_reg[8]_i_3__0 ,\n_0_axaddr_incr_reg[7]_i_3__0 ,\n_0_axaddr_incr_reg[6]_i_3__0 ,\n_0_axaddr_incr_reg[5]_i_3__0 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_0_axaddr_incr_reg[7]_i_1__0 ,\n_0_axaddr_incr_reg[6]_i_1__0 ,\n_0_axaddr_incr_reg[5]_i_1__0 ,\n_0_axaddr_incr_reg[4]_i_1__0 }),
        .S({\n_0_axaddr_incr[7]_i_2__0 ,\n_0_axaddr_incr[6]_i_2__0 ,\n_0_axaddr_incr[5]_i_2__0 ,\n_0_axaddr_incr[4]_i_2__0 }));
FDRE \axaddr_incr_reg[6] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[6]_i_1__0 ),
        .Q(axaddr_incr_reg[6]),
        .R(1'b0));
FDRE \axaddr_incr_reg[7] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[7]_i_1__0 ),
        .Q(axaddr_incr_reg[7]),
        .R(1'b0));
FDRE \axaddr_incr_reg[8] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[8]_i_1__0 ),
        .Q(axaddr_incr_reg[8]),
        .R(1'b0));
CARRY4 \axaddr_incr_reg[8]_i_4 
       (.CI(\n_0_axaddr_incr_reg[4]_i_4 ),
        .CO({\NLW_axaddr_incr_reg[8]_i_4_CO_UNCONNECTED [3],\n_1_axaddr_incr_reg[8]_i_4 ,\n_2_axaddr_incr_reg[8]_i_4 ,\n_3_axaddr_incr_reg[8]_i_4 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_axaddr_incr_reg[8]_i_4 ,\n_5_axaddr_incr_reg[8]_i_4 ,\n_6_axaddr_incr_reg[8]_i_4 ,\n_7_axaddr_incr_reg[8]_i_4 }),
        .S(I24));
FDRE \axaddr_incr_reg[9] 
       (.C(aclk),
        .CE(I3),
        .D(\n_0_axaddr_incr_reg[9]_i_1__0 ),
        .Q(axaddr_incr_reg[9]),
        .R(1'b0));
(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* XILINX_TRANSFORM_PINMAP = "LO:O" *) 
   CARRY4 \axaddr_incr_reg[9]_i_3__0_CARRY4 
       (.CI(\n_0_axaddr_incr_reg[8]_i_3__0 ),
        .CO({\NLW_axaddr_incr_reg[9]_i_3__0_CARRY4_CO_UNCONNECTED [3:2],\n_0_axaddr_incr_reg[10]_i_3__0 ,\n_0_axaddr_incr_reg[9]_i_3__0 }),
        .CYINIT(1'b0),
        .DI({\NLW_axaddr_incr_reg[9]_i_3__0_CARRY4_DI_UNCONNECTED [3],1'b0,1'b0,1'b0}),
        .O({\n_0_axaddr_incr_reg[11]_i_1__0 ,\n_0_axaddr_incr_reg[10]_i_1__0 ,\n_0_axaddr_incr_reg[9]_i_1__0 ,\n_0_axaddr_incr_reg[8]_i_1__0 }),
        .S({\n_0_axaddr_incr[11]_i_2__0 ,\n_0_axaddr_incr[10]_i_2__0 ,\n_0_axaddr_incr[9]_i_2__0 ,\n_0_axaddr_incr[8]_i_2__0 }));
LUT6 #(
    .INIT(64'hF8F8F88F88888888)) 
     \axlen_cnt[2]_i_1__1 
       (.I0(E),
        .I1(I6[5]),
        .I2(\n_0_axlen_cnt_reg[2] ),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(I4),
        .O(\n_0_axlen_cnt[2]_i_1__1 ));
LUT6 #(
    .INIT(64'hAAA90000FFFFFFFF)) 
     \axlen_cnt[3]_i_2__1 
       (.I0(\n_0_axlen_cnt_reg[3] ),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(\n_0_axlen_cnt_reg[2] ),
        .I4(I4),
        .I5(I5),
        .O(\n_0_axlen_cnt[3]_i_2__1 ));
(* SOFT_HLUTNM = "soft_lutpair7" *) 
   LUT5 #(
    .INIT(32'hAAAAAAA9)) 
     \axlen_cnt[4]_i_1__0 
       (.I0(\n_0_axlen_cnt_reg[4] ),
        .I1(\n_0_axlen_cnt_reg[2] ),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\n_0_axlen_cnt_reg[3] ),
        .O(\n_0_axlen_cnt[4]_i_1__0 ));
LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA9)) 
     \axlen_cnt[5]_i_1__0 
       (.I0(\n_0_axlen_cnt_reg[5] ),
        .I1(\n_0_axlen_cnt_reg[3] ),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\n_0_axlen_cnt_reg[2] ),
        .I5(\n_0_axlen_cnt_reg[4] ),
        .O(\n_0_axlen_cnt[5]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair8" *) 
   LUT3 #(
    .INIT(8'hA9)) 
     \axlen_cnt[6]_i_1__0 
       (.I0(\n_0_axlen_cnt_reg[6] ),
        .I1(\n_0_axlen_cnt[7]_i_3__0 ),
        .I2(\n_0_axlen_cnt_reg[5] ),
        .O(\n_0_axlen_cnt[6]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair8" *) 
   LUT4 #(
    .INIT(16'hAAA9)) 
     \axlen_cnt[7]_i_2__0 
       (.I0(\n_0_axlen_cnt_reg[7] ),
        .I1(\n_0_axlen_cnt[7]_i_3__0 ),
        .I2(\n_0_axlen_cnt_reg[5] ),
        .I3(\n_0_axlen_cnt_reg[6] ),
        .O(\n_0_axlen_cnt[7]_i_2__0 ));
(* SOFT_HLUTNM = "soft_lutpair7" *) 
   LUT5 #(
    .INIT(32'hFFFFFFFE)) 
     \axlen_cnt[7]_i_3__0 
       (.I0(\n_0_axlen_cnt_reg[4] ),
        .I1(\n_0_axlen_cnt_reg[2] ),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\n_0_axlen_cnt_reg[3] ),
        .O(\n_0_axlen_cnt[7]_i_3__0 ));
FDRE \axlen_cnt_reg[0] 
       (.C(aclk),
        .CE(I15),
        .D(D[0]),
        .Q(Q[0]),
        .R(1'b0));
FDRE \axlen_cnt_reg[1] 
       (.C(aclk),
        .CE(I15),
        .D(D[1]),
        .Q(Q[1]),
        .R(1'b0));
FDRE \axlen_cnt_reg[2] 
       (.C(aclk),
        .CE(I15),
        .D(\n_0_axlen_cnt[2]_i_1__1 ),
        .Q(\n_0_axlen_cnt_reg[2] ),
        .R(1'b0));
FDRE \axlen_cnt_reg[3] 
       (.C(aclk),
        .CE(I15),
        .D(\n_0_axlen_cnt[3]_i_2__1 ),
        .Q(\n_0_axlen_cnt_reg[3] ),
        .R(1'b0));
FDRE \axlen_cnt_reg[4] 
       (.C(aclk),
        .CE(I15),
        .D(\n_0_axlen_cnt[4]_i_1__0 ),
        .Q(\n_0_axlen_cnt_reg[4] ),
        .R(I16));
FDRE \axlen_cnt_reg[5] 
       (.C(aclk),
        .CE(I15),
        .D(\n_0_axlen_cnt[5]_i_1__0 ),
        .Q(\n_0_axlen_cnt_reg[5] ),
        .R(I16));
FDRE \axlen_cnt_reg[6] 
       (.C(aclk),
        .CE(I15),
        .D(\n_0_axlen_cnt[6]_i_1__0 ),
        .Q(\n_0_axlen_cnt_reg[6] ),
        .R(I16));
FDRE \axlen_cnt_reg[7] 
       (.C(aclk),
        .CE(I15),
        .D(\n_0_axlen_cnt[7]_i_2__0 ),
        .Q(\n_0_axlen_cnt_reg[7] ),
        .R(I16));
LUT5 #(
    .INIT(32'hFFFF05C5)) 
     next_pending_r_i_1__2
       (.I0(O3),
        .I1(n_0_next_pending_r_reg),
        .I2(I11),
        .I3(E),
        .I4(I12),
        .O(incr_next_pending));
LUT6 #(
    .INIT(64'h0000000000000004)) 
     next_pending_r_i_2__2
       (.I0(\n_0_axlen_cnt_reg[7] ),
        .I1(n_0_next_pending_r_i_5__0),
        .I2(\n_0_axlen_cnt_reg[3] ),
        .I3(\n_0_axlen_cnt_reg[4] ),
        .I4(Q[1]),
        .I5(\n_0_axlen_cnt_reg[2] ),
        .O(O3));
LUT2 #(
    .INIT(4'h1)) 
     next_pending_r_i_5__0
       (.I0(\n_0_axlen_cnt_reg[5] ),
        .I1(\n_0_axlen_cnt_reg[6] ),
        .O(n_0_next_pending_r_i_5__0));
FDRE next_pending_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(incr_next_pending),
        .Q(n_0_next_pending_r_reg),
        .R(1'b0));
LUT6 #(
    .INIT(64'hFFFFFFFFA2A2AFAA)) 
     sel_first_i_1
       (.I0(O1),
        .I1(m_axi_arready),
        .I2(I14[1]),
        .I3(si_rs_arvalid),
        .I4(I14[0]),
        .I5(areset_d1),
        .O(n_0_sel_first_i_1));
FDRE sel_first_reg
       (.C(aclk),
        .CE(1'b1),
        .D(n_0_sel_first_i_1),
        .Q(O1),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_b2s_r_channel" *) 
module axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_r_channel
   (O1,
    O2,
    m_axi_rready,
    out,
    O3,
    r_push,
    aclk,
    r_rlast,
    s_arid_r,
    si_rs_rready,
    m_axi_rvalid,
    in,
    areset_d1);
  output O1;
  output O2;
  output m_axi_rready;
  output [33:0]out;
  output [1:0]O3;
  input r_push;
  input aclk;
  input r_rlast;
  input s_arid_r;
  input si_rs_rready;
  input m_axi_rvalid;
  input [33:0]in;
  input areset_d1;

  wire O1;
  wire O2;
  wire [1:0]O3;
  wire aclk;
  wire areset_d1;
  wire [33:0]in;
  wire m_axi_rready;
  wire m_axi_rvalid;
  wire n_0_rd_data_fifo_0;
  wire n_1_transaction_fifo_0;
  wire n_3_rd_data_fifo_0;
  wire [33:0]out;
  wire r_push;
  wire r_push_r;
  wire r_rlast;
  wire s_arid_r;
  wire si_rs_rready;
  wire [1:0]trans_in;

FDRE \r_arid_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(s_arid_r),
        .Q(trans_in[1]),
        .R(1'b0));
FDRE r_push_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(r_push),
        .Q(r_push_r),
        .R(1'b0));
FDRE r_rlast_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(r_rlast),
        .Q(trans_in[0]),
        .R(1'b0));
axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo__parameterized1 rd_data_fifo_0
       (.I1(n_1_transaction_fifo_0),
        .O1(n_0_rd_data_fifo_0),
        .O2(O1),
        .O3(n_3_rd_data_fifo_0),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .in(in),
        .m_axi_rready(m_axi_rready),
        .m_axi_rvalid(m_axi_rvalid),
        .out(out),
        .si_rs_rready(si_rs_rready));
axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo__parameterized2 transaction_fifo_0
       (.I1(n_0_rd_data_fifo_0),
        .I2(n_3_rd_data_fifo_0),
        .O1(O1),
        .O2(O2),
        .O3(n_1_transaction_fifo_0),
        .O4(O3),
        .aclk(aclk),
        .areset_d1(areset_d1),
        .in(trans_in),
        .r_push_r(r_push_r),
        .si_rs_rready(si_rs_rready));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_b2s_rd_cmd_fsm" *) 
module axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_rd_cmd_fsm
   (D,
    O1,
    O2,
    O3,
    O4,
    O5,
    O6,
    O7,
    O8,
    E,
    O9,
    O10,
    sel_first_i,
    wrap_next_pending,
    O11,
    O12,
    O13,
    O14,
    O15,
    O16,
    r_push,
    m_axi_arvalid,
    O17,
    I1,
    Q,
    si_rs_arvalid,
    I2,
    m_axi_arready,
    I3,
    I7,
    I4,
    I5,
    I8,
    I6,
    I9,
    I10,
    I11,
    incr_next_pending,
    areset_d1,
    I12,
    I13,
    I14,
    I15,
    I16,
    I17,
    aclk);
  output [2:0]D;
  output [2:0]O1;
  output [1:0]O2;
  output O3;
  output [1:0]O4;
  output O5;
  output O6;
  output O7;
  output O8;
  output [0:0]E;
  output O9;
  output O10;
  output sel_first_i;
  output wrap_next_pending;
  output O11;
  output O12;
  output [0:0]O13;
  output [0:0]O14;
  output [0:0]O15;
  output O16;
  output r_push;
  output m_axi_arvalid;
  output [0:0]O17;
  input I1;
  input [1:0]Q;
  input si_rs_arvalid;
  input [3:0]I2;
  input m_axi_arready;
  input I3;
  input I7;
  input I4;
  input [0:0]I5;
  input I8;
  input [2:0]I6;
  input [2:0]I9;
  input [1:0]I10;
  input I11;
  input incr_next_pending;
  input areset_d1;
  input I12;
  input I13;
  input I14;
  input I15;
  input I16;
  input I17;
  input aclk;

  wire [2:0]D;
  wire [0:0]E;
  wire I1;
  wire [1:0]I10;
  wire I11;
  wire I12;
  wire I13;
  wire I14;
  wire I15;
  wire I16;
  wire I17;
  wire [3:0]I2;
  wire I3;
  wire I4;
  wire [0:0]I5;
  wire [2:0]I6;
  wire I7;
  wire I8;
  wire [2:0]I9;
  wire [2:0]O1;
  wire O10;
  wire O11;
  wire O12;
  wire [0:0]O13;
  wire [0:0]O14;
  wire [0:0]O15;
  wire O16;
  wire [0:0]O17;
  wire [1:0]O2;
  wire O3;
  wire [1:0]O4;
  wire O5;
  wire O6;
  wire O7;
  wire O8;
  wire O9;
  wire [1:0]Q;
  wire aclk;
  wire areset_d1;
  wire incr_next_pending;
  wire m_axi_arready;
  wire m_axi_arvalid;
  wire \n_0_state[0]_rep_i_1 ;
  wire \n_0_state[1]_rep_i_1 ;
  wire \n_0_wrap_second_len_r[0]_i_2__0 ;
  wire [1:0]next_state;
  wire r_push;
  wire sel_first_i;
  wire si_rs_arvalid;
  wire wrap_next_pending;

(* SOFT_HLUTNM = "soft_lutpair5" *) 
   LUT4 #(
    .INIT(16'hAEAA)) 
     \axaddr_incr[0]_i_1__0 
       (.I0(I17),
        .I1(m_axi_arready),
        .I2(O8),
        .I3(O7),
        .O(O16));
LUT1 #(
    .INIT(2'h1)) 
     \axaddr_offset_r[2]_i_1__0 
       (.I0(O9),
        .O(O15));
LUT6 #(
    .INIT(64'h55555555553F5555)) 
     \axaddr_offset_r[2]_i_2 
       (.I0(I10[0]),
        .I1(I2[3]),
        .I2(I16),
        .I3(O8),
        .I4(si_rs_arvalid),
        .I5(O7),
        .O(O9));
(* SOFT_HLUTNM = "soft_lutpair3" *) 
   LUT4 #(
    .INIT(16'h0C0A)) 
     \axaddr_wrap[11]_i_1__0 
       (.I0(si_rs_arvalid),
        .I1(m_axi_arready),
        .I2(O4[1]),
        .I3(O4[0]),
        .O(O13));
LUT6 #(
    .INIT(64'h44444F4444444444)) 
     \axlen_cnt[0]_i_1__1 
       (.I0(Q[0]),
        .I1(O3),
        .I2(O4[1]),
        .I3(si_rs_arvalid),
        .I4(O4[0]),
        .I5(I2[1]),
        .O(O2[0]));
LUT5 #(
    .INIT(32'hF88F8888)) 
     \axlen_cnt[1]_i_1__1 
       (.I0(E),
        .I1(I2[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(O3),
        .O(O2[1]));
(* SOFT_HLUTNM = "soft_lutpair0" *) 
   LUT4 #(
    .INIT(16'h0C0A)) 
     \axlen_cnt[3]_i_1__1 
       (.I0(si_rs_arvalid),
        .I1(m_axi_arready),
        .I2(O4[1]),
        .I3(O4[0]),
        .O(O12));
(* SOFT_HLUTNM = "soft_lutpair4" *) 
   LUT4 #(
    .INIT(16'h0C0A)) 
     \axlen_cnt[3]_i_1__2 
       (.I0(si_rs_arvalid),
        .I1(m_axi_arready),
        .I2(O8),
        .I3(O4[0]),
        .O(O14));
(* SOFT_HLUTNM = "soft_lutpair3" *) 
   LUT4 #(
    .INIT(16'h00FB)) 
     \axlen_cnt[3]_i_3__0 
       (.I0(O4[0]),
        .I1(si_rs_arvalid),
        .I2(O4[1]),
        .I3(I3),
        .O(O3));
(* SOFT_HLUTNM = "soft_lutpair0" *) 
   LUT5 #(
    .INIT(32'h00003120)) 
     \axlen_cnt[7]_i_1__0 
       (.I0(O4[0]),
        .I1(O4[1]),
        .I2(m_axi_arready),
        .I3(si_rs_arvalid),
        .I4(O3),
        .O(O5));
LUT2 #(
    .INIT(4'h2)) 
     m_axi_arvalid_INST_0
       (.I0(O7),
        .I1(O8),
        .O(m_axi_arvalid));
(* SOFT_HLUTNM = "soft_lutpair6" *) 
   LUT3 #(
    .INIT(8'hB3)) 
     \m_payload_i[31]_i_1__1 
       (.I0(O8),
        .I1(si_rs_arvalid),
        .I2(O7),
        .O(O17));
LUT5 #(
    .INIT(32'hFFFF404F)) 
     next_pending_r_i_1__1
       (.I0(E),
        .I1(I13),
        .I2(O6),
        .I3(I14),
        .I4(I15),
        .O(wrap_next_pending));
(* SOFT_HLUTNM = "soft_lutpair4" *) 
   LUT3 #(
    .INIT(8'hDF)) 
     next_pending_r_i_3__1
       (.I0(O7),
        .I1(O8),
        .I2(m_axi_arready),
        .O(O6));
(* SOFT_HLUTNM = "soft_lutpair5" *) 
   LUT3 #(
    .INIT(8'h20)) 
     r_push_r_i_1
       (.I0(m_axi_arready),
        .I1(O8),
        .I2(O7),
        .O(r_push));
(* SOFT_HLUTNM = "soft_lutpair1" *) 
   LUT4 #(
    .INIT(16'hBA8A)) 
     s_axburst_eq0_i_1__0
       (.I0(incr_next_pending),
        .I1(sel_first_i),
        .I2(I2[0]),
        .I3(wrap_next_pending),
        .O(O10));
(* SOFT_HLUTNM = "soft_lutpair1" *) 
   LUT4 #(
    .INIT(16'hFE02)) 
     s_axburst_eq1_i_1__0
       (.I0(incr_next_pending),
        .I1(I2[0]),
        .I2(sel_first_i),
        .I3(wrap_next_pending),
        .O(O11));
LUT6 #(
    .INIT(64'hFFCFFFFFCCCECCCE)) 
     sel_first_i_1__0
       (.I0(si_rs_arvalid),
        .I1(areset_d1),
        .I2(O4[0]),
        .I3(O4[1]),
        .I4(m_axi_arready),
        .I5(I12),
        .O(sel_first_i));
LUT6 #(
    .INIT(64'h005E0A5E0A5E0A5E)) 
     \state[0]_i_1__0 
       (.I0(O4[0]),
        .I1(si_rs_arvalid),
        .I2(O4[1]),
        .I3(I7),
        .I4(m_axi_arready),
        .I5(I4),
        .O(next_state[0]));
LUT6 #(
    .INIT(64'h005E0A5E0A5E0A5E)) 
     \state[0]_rep_i_1 
       (.I0(O7),
        .I1(si_rs_arvalid),
        .I2(O4[1]),
        .I3(I7),
        .I4(m_axi_arready),
        .I5(I4),
        .O(\n_0_state[0]_rep_i_1 ));
LUT5 #(
    .INIT(32'h0FC00040)) 
     \state[1]_i_1__0 
       (.I0(I4),
        .I1(m_axi_arready),
        .I2(O7),
        .I3(O4[1]),
        .I4(I7),
        .O(next_state[1]));
LUT5 #(
    .INIT(32'h0FC00040)) 
     \state[1]_rep_i_1 
       (.I0(I4),
        .I1(m_axi_arready),
        .I2(O4[0]),
        .I3(O8),
        .I4(I7),
        .O(\n_0_state[1]_rep_i_1 ));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "state_reg[0]" *) 
   FDRE \state_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(next_state[0]),
        .Q(O4[0]),
        .R(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "state_reg[0]" *) 
   FDRE \state_reg[0]_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_state[0]_rep_i_1 ),
        .Q(O7),
        .R(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "state_reg[1]" *) 
   FDRE \state_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(next_state[1]),
        .Q(O4[1]),
        .R(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "state_reg[1]" *) 
   FDRE \state_reg[1]_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_state[1]_rep_i_1 ),
        .Q(O8),
        .R(areset_d1));
(* SOFT_HLUTNM = "soft_lutpair6" *) 
   LUT3 #(
    .INIT(8'h04)) 
     \wrap_boundary_axaddr_r[11]_i_1 
       (.I0(O8),
        .I1(si_rs_arvalid),
        .I2(O7),
        .O(E));
LUT6 #(
    .INIT(64'h55555855AAAAA8AA)) 
     \wrap_cnt_r[0]_i_1__0 
       (.I0(\n_0_wrap_second_len_r[0]_i_2__0 ),
        .I1(I8),
        .I2(O4[1]),
        .I3(si_rs_arvalid),
        .I4(O4[0]),
        .I5(I6[0]),
        .O(D[0]));
(* SOFT_HLUTNM = "soft_lutpair2" *) 
   LUT2 #(
    .INIT(4'h9)) 
     \wrap_cnt_r[1]_i_1__0 
       (.I0(O1[1]),
        .I1(I1),
        .O(D[1]));
(* SOFT_HLUTNM = "soft_lutpair2" *) 
   LUT4 #(
    .INIT(16'hA6AA)) 
     \wrap_cnt_r[3]_i_1__0 
       (.I0(O1[2]),
        .I1(O1[1]),
        .I2(I1),
        .I3(I5),
        .O(D[2]));
LUT6 #(
    .INIT(64'hCCCCC0CCCCCCCACC)) 
     \wrap_second_len_r[0]_i_1__0 
       (.I0(\n_0_wrap_second_len_r[0]_i_2__0 ),
        .I1(I6[0]),
        .I2(O4[0]),
        .I3(si_rs_arvalid),
        .I4(O4[1]),
        .I5(I8),
        .O(O1[0]));
LUT6 #(
    .INIT(64'hFFFFFFF2FFFFFFFF)) 
     \wrap_second_len_r[0]_i_2__0 
       (.I0(I10[1]),
        .I1(E),
        .I2(I11),
        .I3(I9[1]),
        .I4(I9[0]),
        .I5(O9),
        .O(\n_0_wrap_second_len_r[0]_i_2__0 ));
LUT6 #(
    .INIT(64'hC3AAC0AAC3AAC3AA)) 
     \wrap_second_len_r[1]_i_1__0 
       (.I0(I6[1]),
        .I1(I9[0]),
        .I2(I9[1]),
        .I3(E),
        .I4(I9[2]),
        .I5(O9),
        .O(O1[1]));
LUT6 #(
    .INIT(64'hFD00FFFFFD00FD00)) 
     \wrap_second_len_r[3]_i_1__0 
       (.I0(O9),
        .I1(I9[0]),
        .I2(I9[1]),
        .I3(I11),
        .I4(E),
        .I5(I6[2]),
        .O(O1[2]));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_b2s_simple_fifo" *) 
module axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo
   (bresp_push,
    O1,
    O2,
    O3,
    O4,
    SR,
    out,
    Q,
    mhandshake_r,
    shandshake_r,
    b_push,
    areset_d1,
    in,
    aclk);
  output bresp_push;
  output O1;
  output O2;
  output O3;
  output O4;
  output [0:0]SR;
  output [0:0]out;
  input [7:0]Q;
  input mhandshake_r;
  input shandshake_r;
  input b_push;
  input areset_d1;
  input [4:0]in;
  input aclk;

  wire O1;
  wire O2;
  wire O3;
  wire O4;
  wire [7:0]Q;
  wire [0:0]SR;
  wire aclk;
  wire areset_d1;
  wire b_push;
  wire bresp_push;
  wire [1:0]cnt_read;
  wire [1:0]cnt_read_0;
  wire [4:0]in;
  wire mhandshake_r;
  wire \n_0_cnt_read[0]_rep_i_1 ;
  wire \n_0_cnt_read[0]_rep_rep_i_1 ;
  wire \n_0_cnt_read[1]_rep__0_i_1 ;
  wire \n_0_cnt_read[1]_rep_i_1 ;
  wire \n_0_cnt_read_reg[1]_rep ;
  wire \n_0_memory_reg[3][0]_srl4 ;
  wire \n_0_memory_reg[3][0]_srl4_i_2__0 ;
  wire \n_0_memory_reg[3][0]_srl4_i_3 ;
  wire \n_0_memory_reg[3][0]_srl4_i_4 ;
  wire \n_0_memory_reg[3][0]_srl4_i_5 ;
  wire \n_0_memory_reg[3][0]_srl4_i_6 ;
  wire \n_0_memory_reg[3][1]_srl4 ;
  wire \n_0_memory_reg[3][2]_srl4 ;
  wire \n_0_memory_reg[3][3]_srl4 ;
  wire \n_0_memory_reg[3][4]_srl4 ;
  wire \n_0_memory_reg[3][5]_srl4 ;
  wire \n_0_memory_reg[3][6]_srl4 ;
  wire \n_0_memory_reg[3][7]_srl4 ;
  wire [0:0]out;
  wire shandshake_r;

LUT2 #(
    .INIT(4'hE)) 
     \bresp_cnt[7]_i_1 
       (.I0(areset_d1),
        .I1(bresp_push),
        .O(SR));
(* SOFT_HLUTNM = "soft_lutpair107" *) 
   LUT3 #(
    .INIT(8'h96)) 
     \cnt_read[0]_i_1 
       (.I0(cnt_read_0[0]),
        .I1(shandshake_r),
        .I2(b_push),
        .O(cnt_read[0]));
(* SOFT_HLUTNM = "soft_lutpair106" *) 
   LUT3 #(
    .INIT(8'h96)) 
     \cnt_read[0]_rep_i_1 
       (.I0(O1),
        .I1(shandshake_r),
        .I2(b_push),
        .O(\n_0_cnt_read[0]_rep_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair105" *) 
   LUT3 #(
    .INIT(8'h96)) 
     \cnt_read[0]_rep_rep_i_1 
       (.I0(O3),
        .I1(shandshake_r),
        .I2(b_push),
        .O(\n_0_cnt_read[0]_rep_rep_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair105" *) 
   LUT4 #(
    .INIT(16'hDB24)) 
     \cnt_read[1]_i_1 
       (.I0(O3),
        .I1(shandshake_r),
        .I2(b_push),
        .I3(cnt_read_0[1]),
        .O(cnt_read[1]));
(* SOFT_HLUTNM = "soft_lutpair106" *) 
   LUT4 #(
    .INIT(16'hDB24)) 
     \cnt_read[1]_rep__0_i_1 
       (.I0(O1),
        .I1(shandshake_r),
        .I2(b_push),
        .I3(O2),
        .O(\n_0_cnt_read[1]_rep__0_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair107" *) 
   LUT4 #(
    .INIT(16'hDB24)) 
     \cnt_read[1]_rep_i_1 
       (.I0(O1),
        .I1(shandshake_r),
        .I2(b_push),
        .I3(\n_0_cnt_read_reg[1]_rep ),
        .O(\n_0_cnt_read[1]_rep_i_1 ));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[0]" *) 
   FDSE \cnt_read_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(cnt_read[0]),
        .Q(cnt_read_0[0]),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[0]" *) 
   FDSE \cnt_read_reg[0]_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[0]_rep_i_1 ),
        .Q(O1),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[0]" *) 
   FDSE \cnt_read_reg[0]_rep_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[0]_rep_rep_i_1 ),
        .Q(O3),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[1]" *) 
   FDSE \cnt_read_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(cnt_read[1]),
        .Q(cnt_read_0[1]),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[1]" *) 
   FDSE \cnt_read_reg[1]_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[1]_rep_i_1 ),
        .Q(\n_0_cnt_read_reg[1]_rep ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[1]" *) 
   FDSE \cnt_read_reg[1]_rep__0 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[1]_rep__0_i_1 ),
        .Q(O2),
        .S(areset_d1));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][0]_srl4 " *) 
   SRL16E #(
    .INIT(16'h0000)) 
     \memory_reg[3][0]_srl4 
       (.A0(cnt_read_0[0]),
        .A1(\n_0_cnt_read_reg[1]_rep ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[0]),
        .Q(\n_0_memory_reg[3][0]_srl4 ));
LUT5 #(
    .INIT(32'h99090000)) 
     \memory_reg[3][0]_srl4_i_1__0 
       (.I0(Q[6]),
        .I1(\n_0_memory_reg[3][6]_srl4 ),
        .I2(\n_0_memory_reg[3][5]_srl4 ),
        .I3(Q[5]),
        .I4(\n_0_memory_reg[3][0]_srl4_i_2__0 ),
        .O(bresp_push));
LUT6 #(
    .INIT(64'h8000808000000000)) 
     \memory_reg[3][0]_srl4_i_2__0 
       (.I0(\n_0_memory_reg[3][0]_srl4_i_3 ),
        .I1(\n_0_memory_reg[3][0]_srl4_i_4 ),
        .I2(\n_0_memory_reg[3][0]_srl4_i_5 ),
        .I3(Q[0]),
        .I4(\n_0_memory_reg[3][0]_srl4 ),
        .I5(\n_0_memory_reg[3][0]_srl4_i_6 ),
        .O(\n_0_memory_reg[3][0]_srl4_i_2__0 ));
LUT6 #(
    .INIT(64'h9009000090099009)) 
     \memory_reg[3][0]_srl4_i_3 
       (.I0(Q[7]),
        .I1(\n_0_memory_reg[3][7]_srl4 ),
        .I2(\n_0_memory_reg[3][4]_srl4 ),
        .I3(Q[4]),
        .I4(Q[2]),
        .I5(\n_0_memory_reg[3][2]_srl4 ),
        .O(\n_0_memory_reg[3][0]_srl4_i_3 ));
LUT6 #(
    .INIT(64'hDD0D0000DD0DDD0D)) 
     \memory_reg[3][0]_srl4_i_4 
       (.I0(Q[0]),
        .I1(\n_0_memory_reg[3][0]_srl4 ),
        .I2(Q[5]),
        .I3(\n_0_memory_reg[3][5]_srl4 ),
        .I4(Q[3]),
        .I5(\n_0_memory_reg[3][3]_srl4 ),
        .O(\n_0_memory_reg[3][0]_srl4_i_4 ));
(* SOFT_HLUTNM = "soft_lutpair104" *) 
   LUT5 #(
    .INIT(32'h70007070)) 
     \memory_reg[3][0]_srl4_i_5 
       (.I0(O1),
        .I1(O2),
        .I2(mhandshake_r),
        .I3(\n_0_memory_reg[3][1]_srl4 ),
        .I4(Q[1]),
        .O(\n_0_memory_reg[3][0]_srl4_i_5 ));
LUT6 #(
    .INIT(64'hDD0D0000DD0DDD0D)) 
     \memory_reg[3][0]_srl4_i_6 
       (.I0(Q[3]),
        .I1(\n_0_memory_reg[3][3]_srl4 ),
        .I2(Q[2]),
        .I3(\n_0_memory_reg[3][2]_srl4 ),
        .I4(Q[1]),
        .I5(\n_0_memory_reg[3][1]_srl4 ),
        .O(\n_0_memory_reg[3][0]_srl4_i_6 ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][1]_srl4 " *) 
   SRL16E #(
    .INIT(16'h0000)) 
     \memory_reg[3][1]_srl4 
       (.A0(cnt_read_0[0]),
        .A1(\n_0_cnt_read_reg[1]_rep ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[1]),
        .Q(\n_0_memory_reg[3][1]_srl4 ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][2]_srl4 " *) 
   SRL16E #(
    .INIT(16'h0000)) 
     \memory_reg[3][2]_srl4 
       (.A0(cnt_read_0[0]),
        .A1(\n_0_cnt_read_reg[1]_rep ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[2]),
        .Q(\n_0_memory_reg[3][2]_srl4 ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][3]_srl4 " *) 
   SRL16E #(
    .INIT(16'h0000)) 
     \memory_reg[3][3]_srl4 
       (.A0(cnt_read_0[0]),
        .A1(\n_0_cnt_read_reg[1]_rep ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[3]),
        .Q(\n_0_memory_reg[3][3]_srl4 ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][4]_srl4 " *) 
   SRL16E #(
    .INIT(16'h0000)) 
     \memory_reg[3][4]_srl4 
       (.A0(cnt_read_0[0]),
        .A1(cnt_read_0[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(1'b0),
        .Q(\n_0_memory_reg[3][4]_srl4 ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][5]_srl4 " *) 
   SRL16E #(
    .INIT(16'h0000)) 
     \memory_reg[3][5]_srl4 
       (.A0(cnt_read_0[0]),
        .A1(cnt_read_0[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(1'b0),
        .Q(\n_0_memory_reg[3][5]_srl4 ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][6]_srl4 " *) 
   SRL16E #(
    .INIT(16'h0000)) 
     \memory_reg[3][6]_srl4 
       (.A0(cnt_read_0[0]),
        .A1(cnt_read_0[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(1'b0),
        .Q(\n_0_memory_reg[3][6]_srl4 ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][7]_srl4 " *) 
   SRL16E #(
    .INIT(16'h0000)) 
     \memory_reg[3][7]_srl4 
       (.A0(cnt_read_0[0]),
        .A1(cnt_read_0[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(1'b0),
        .Q(\n_0_memory_reg[3][7]_srl4 ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][8]_srl4 " *) 
   SRL16E #(
    .INIT(16'h0000)) 
     \memory_reg[3][8]_srl4 
       (.A0(cnt_read_0[0]),
        .A1(cnt_read_0[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(b_push),
        .CLK(aclk),
        .D(in[4]),
        .Q(out));
(* SOFT_HLUTNM = "soft_lutpair104" *) 
   LUT2 #(
    .INIT(4'h2)) 
     \state[0]_i_2 
       (.I0(O2),
        .I1(O1),
        .O(O4));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_b2s_simple_fifo" *) 
module axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo__parameterized0
   (O1,
    O3,
    mhandshake,
    m_axi_bready,
    O5,
    I1,
    O2,
    shandshake_r,
    m_axi_bresp,
    in,
    m_axi_bvalid,
    mhandshake_r,
    bresp_push,
    aclk,
    areset_d1);
  output O1;
  output O3;
  output mhandshake;
  output m_axi_bready;
  output [1:0]O5;
  input I1;
  input O2;
  input shandshake_r;
  input [1:0]m_axi_bresp;
  input [1:0]in;
  input m_axi_bvalid;
  input mhandshake_r;
  input bresp_push;
  input aclk;
  input areset_d1;

  wire I1;
  wire O1;
  wire O2;
  wire O3;
  wire [1:0]O5;
  wire aclk;
  wire areset_d1;
  wire bresp_push;
  wire [1:0]cnt_read;
  wire [1:0]in;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire mhandshake;
  wire mhandshake_r;
  wire \n_0_cnt_read[0]_i_1__0 ;
  wire \n_0_cnt_read[1]_i_1__0 ;
  wire shandshake_r;

LUT5 #(
    .INIT(32'h00000777)) 
     bvalid_i_i_2
       (.I0(cnt_read[1]),
        .I1(cnt_read[0]),
        .I2(I1),
        .I3(O2),
        .I4(shandshake_r),
        .O(O1));
(* SOFT_HLUTNM = "soft_lutpair109" *) 
   LUT3 #(
    .INIT(8'h96)) 
     \cnt_read[0]_i_1__0 
       (.I0(cnt_read[0]),
        .I1(shandshake_r),
        .I2(bresp_push),
        .O(\n_0_cnt_read[0]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair109" *) 
   LUT4 #(
    .INIT(16'hDB24)) 
     \cnt_read[1]_i_1__0 
       (.I0(cnt_read[0]),
        .I1(shandshake_r),
        .I2(bresp_push),
        .I3(cnt_read[1]),
        .O(\n_0_cnt_read[1]_i_1__0 ));
(* KEEP = "yes" *) 
   FDSE \cnt_read_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[0]_i_1__0 ),
        .Q(cnt_read[0]),
        .S(areset_d1));
(* KEEP = "yes" *) 
   FDSE \cnt_read_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[1]_i_1__0 ),
        .Q(cnt_read[1]),
        .S(areset_d1));
(* SOFT_HLUTNM = "soft_lutpair108" *) 
   LUT3 #(
    .INIT(8'h40)) 
     m_axi_bready_INST_0
       (.I0(mhandshake_r),
        .I1(cnt_read[1]),
        .I2(cnt_read[0]),
        .O(m_axi_bready));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3][0]_srl4 " *) 
   SRL16E #(
    .INIT(16'h0000)) 
     \memory_reg[3][0]_srl4 
       (.A0(cnt_read[0]),
        .A1(cnt_read[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(bresp_push),
        .CLK(aclk),
        .D(in[0]),
        .Q(O5[0]));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3][1]_srl4 " *) 
   SRL16E #(
    .INIT(16'h0000)) 
     \memory_reg[3][1]_srl4 
       (.A0(cnt_read[0]),
        .A1(cnt_read[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(bresp_push),
        .CLK(aclk),
        .D(in[1]),
        .Q(O5[1]));
(* SOFT_HLUTNM = "soft_lutpair108" *) 
   LUT4 #(
    .INIT(16'h0080)) 
     mhandshake_r_i_1
       (.I0(m_axi_bvalid),
        .I1(cnt_read[0]),
        .I2(cnt_read[1]),
        .I3(mhandshake_r),
        .O(mhandshake));
LUT5 #(
    .INIT(32'h088A0808)) 
     \s_bresp_acc[1]_i_2 
       (.I0(mhandshake),
        .I1(m_axi_bresp[1]),
        .I2(in[1]),
        .I3(in[0]),
        .I4(m_axi_bresp[0]),
        .O(O3));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_b2s_simple_fifo" *) 
module axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo__parameterized1
   (O1,
    O2,
    m_axi_rready,
    O3,
    out,
    si_rs_rready,
    m_axi_rvalid,
    I1,
    in,
    aclk,
    areset_d1);
  output O1;
  output O2;
  output m_axi_rready;
  output O3;
  output [33:0]out;
  input si_rs_rready;
  input m_axi_rvalid;
  input I1;
  input [33:0]in;
  input aclk;
  input areset_d1;

  wire I1;
  wire O1;
  wire O2;
  wire O3;
  wire aclk;
  wire areset_d1;
  wire [4:0]cnt_read;
  wire [33:0]in;
  wire m_axi_rready;
  wire m_axi_rvalid;
  wire \n_0_cnt_read[0]_i_1__1 ;
  wire \n_0_cnt_read[0]_rep__0_i_1 ;
  wire \n_0_cnt_read[0]_rep__1_i_1 ;
  wire \n_0_cnt_read[0]_rep__2_i_1 ;
  wire \n_0_cnt_read[0]_rep__2_rep__0_i_1 ;
  wire \n_0_cnt_read[0]_rep__2_rep__1_i_1 ;
  wire \n_0_cnt_read[0]_rep__2_rep_i_1 ;
  wire \n_0_cnt_read[0]_rep__2_rep_rep_i_1 ;
  wire \n_0_cnt_read[0]_rep_i_1__0 ;
  wire \n_0_cnt_read[1]_i_1__1 ;
  wire \n_0_cnt_read[1]_rep__0_i_1__0 ;
  wire \n_0_cnt_read[1]_rep__1_i_1 ;
  wire \n_0_cnt_read[1]_rep__2_i_1 ;
  wire \n_0_cnt_read[1]_rep__3_i_1 ;
  wire \n_0_cnt_read[1]_rep__4_i_1 ;
  wire \n_0_cnt_read[1]_rep__4_rep_i_1 ;
  wire \n_0_cnt_read[1]_rep_i_1__0 ;
  wire \n_0_cnt_read[2]_i_1 ;
  wire \n_0_cnt_read[2]_rep__0_i_1 ;
  wire \n_0_cnt_read[2]_rep__1_i_1 ;
  wire \n_0_cnt_read[2]_rep__2_i_1 ;
  wire \n_0_cnt_read[2]_rep__3_i_1 ;
  wire \n_0_cnt_read[2]_rep__3_rep_i_1 ;
  wire \n_0_cnt_read[2]_rep_i_1 ;
  wire \n_0_cnt_read[3]_i_1 ;
  wire \n_0_cnt_read[3]_rep__0_i_1 ;
  wire \n_0_cnt_read[3]_rep__1_i_1 ;
  wire \n_0_cnt_read[3]_rep__2_i_1 ;
  wire \n_0_cnt_read[3]_rep__3_i_1 ;
  wire \n_0_cnt_read[3]_rep__3_rep_i_1 ;
  wire \n_0_cnt_read[3]_rep_i_1 ;
  wire \n_0_cnt_read[4]_i_1 ;
  wire \n_0_cnt_read[4]_i_2 ;
  wire \n_0_cnt_read[4]_i_3 ;
  wire \n_0_cnt_read[4]_rep__0_i_1 ;
  wire \n_0_cnt_read[4]_rep__1_i_1 ;
  wire \n_0_cnt_read[4]_rep__2_i_1 ;
  wire \n_0_cnt_read[4]_rep__3_i_1 ;
  wire \n_0_cnt_read[4]_rep_i_1 ;
  wire \n_0_cnt_read_reg[0]_rep ;
  wire \n_0_cnt_read_reg[0]_rep__0 ;
  wire \n_0_cnt_read_reg[0]_rep__1 ;
  wire \n_0_cnt_read_reg[0]_rep__2 ;
  wire \n_0_cnt_read_reg[0]_rep__2_rep ;
  wire \n_0_cnt_read_reg[0]_rep__2_rep__0 ;
  wire \n_0_cnt_read_reg[0]_rep__2_rep__1 ;
  wire \n_0_cnt_read_reg[0]_rep__2_rep_rep ;
  wire \n_0_cnt_read_reg[1]_rep ;
  wire \n_0_cnt_read_reg[1]_rep__0 ;
  wire \n_0_cnt_read_reg[1]_rep__1 ;
  wire \n_0_cnt_read_reg[1]_rep__2 ;
  wire \n_0_cnt_read_reg[1]_rep__3 ;
  wire \n_0_cnt_read_reg[1]_rep__4 ;
  wire \n_0_cnt_read_reg[1]_rep__4_rep ;
  wire \n_0_cnt_read_reg[2]_rep ;
  wire \n_0_cnt_read_reg[2]_rep__0 ;
  wire \n_0_cnt_read_reg[2]_rep__1 ;
  wire \n_0_cnt_read_reg[2]_rep__2 ;
  wire \n_0_cnt_read_reg[2]_rep__3 ;
  wire \n_0_cnt_read_reg[2]_rep__3_rep ;
  wire \n_0_cnt_read_reg[3]_rep ;
  wire \n_0_cnt_read_reg[3]_rep__0 ;
  wire \n_0_cnt_read_reg[3]_rep__1 ;
  wire \n_0_cnt_read_reg[3]_rep__2 ;
  wire \n_0_cnt_read_reg[3]_rep__3 ;
  wire \n_0_cnt_read_reg[3]_rep__3_rep ;
  wire \n_0_cnt_read_reg[4]_rep ;
  wire \n_0_cnt_read_reg[4]_rep__0 ;
  wire \n_0_cnt_read_reg[4]_rep__1 ;
  wire \n_0_cnt_read_reg[4]_rep__2 ;
  wire \n_0_cnt_read_reg[4]_rep__3 ;
  wire [33:0]out;
  wire si_rs_rready;
  wire wr_en0;
  wire \NLW_memory_reg[31][0]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][10]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][11]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][12]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][13]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][14]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][15]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][16]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][17]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][18]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][19]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][1]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][20]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][21]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][22]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][23]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][24]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][25]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][26]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][27]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][28]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][29]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][2]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][30]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][31]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][32]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][33]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][3]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][4]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][5]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][6]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][7]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][8]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][9]_srl32_Q31_UNCONNECTED ;

(* SOFT_HLUTNM = "soft_lutpair16" *) 
   LUT3 #(
    .INIT(8'h69)) 
     \cnt_read[0]_i_1__1 
       (.I0(cnt_read[0]),
        .I1(O1),
        .I2(wr_en0),
        .O(\n_0_cnt_read[0]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair21" *) 
   LUT3 #(
    .INIT(8'h69)) 
     \cnt_read[0]_rep__0_i_1 
       (.I0(\n_0_cnt_read_reg[0]_rep__0 ),
        .I1(O1),
        .I2(wr_en0),
        .O(\n_0_cnt_read[0]_rep__0_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair21" *) 
   LUT3 #(
    .INIT(8'h69)) 
     \cnt_read[0]_rep__1_i_1 
       (.I0(\n_0_cnt_read_reg[0]_rep__1 ),
        .I1(O1),
        .I2(wr_en0),
        .O(\n_0_cnt_read[0]_rep__1_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair20" *) 
   LUT3 #(
    .INIT(8'h69)) 
     \cnt_read[0]_rep__2_i_1 
       (.I0(\n_0_cnt_read_reg[0]_rep__2 ),
        .I1(O1),
        .I2(wr_en0),
        .O(\n_0_cnt_read[0]_rep__2_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair12" *) 
   LUT3 #(
    .INIT(8'h69)) 
     \cnt_read[0]_rep__2_rep__0_i_1 
       (.I0(\n_0_cnt_read_reg[0]_rep__2_rep__0 ),
        .I1(O1),
        .I2(wr_en0),
        .O(\n_0_cnt_read[0]_rep__2_rep__0_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair17" *) 
   LUT3 #(
    .INIT(8'h69)) 
     \cnt_read[0]_rep__2_rep__1_i_1 
       (.I0(\n_0_cnt_read_reg[0]_rep__2_rep__1 ),
        .I1(O1),
        .I2(wr_en0),
        .O(\n_0_cnt_read[0]_rep__2_rep__1_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair13" *) 
   LUT3 #(
    .INIT(8'h69)) 
     \cnt_read[0]_rep__2_rep_i_1 
       (.I0(\n_0_cnt_read_reg[0]_rep__2_rep ),
        .I1(O1),
        .I2(wr_en0),
        .O(\n_0_cnt_read[0]_rep__2_rep_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair11" *) 
   LUT3 #(
    .INIT(8'h69)) 
     \cnt_read[0]_rep__2_rep_rep_i_1 
       (.I0(\n_0_cnt_read_reg[0]_rep__2_rep_rep ),
        .I1(O1),
        .I2(wr_en0),
        .O(\n_0_cnt_read[0]_rep__2_rep_rep_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair19" *) 
   LUT3 #(
    .INIT(8'h69)) 
     \cnt_read[0]_rep_i_1__0 
       (.I0(\n_0_cnt_read_reg[0]_rep ),
        .I1(O1),
        .I2(wr_en0),
        .O(\n_0_cnt_read[0]_rep_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair16" *) 
   LUT4 #(
    .INIT(16'h7E81)) 
     \cnt_read[1]_i_1__1 
       (.I0(\n_0_cnt_read_reg[0]_rep__2_rep__0 ),
        .I1(wr_en0),
        .I2(O1),
        .I3(cnt_read[1]),
        .O(\n_0_cnt_read[1]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair15" *) 
   LUT4 #(
    .INIT(16'h7E81)) 
     \cnt_read[1]_rep__0_i_1__0 
       (.I0(\n_0_cnt_read_reg[0]_rep__2_rep_rep ),
        .I1(wr_en0),
        .I2(O1),
        .I3(\n_0_cnt_read_reg[1]_rep__0 ),
        .O(\n_0_cnt_read[1]_rep__0_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair19" *) 
   LUT4 #(
    .INIT(16'h7E81)) 
     \cnt_read[1]_rep__1_i_1 
       (.I0(\n_0_cnt_read_reg[0]_rep__2_rep_rep ),
        .I1(wr_en0),
        .I2(O1),
        .I3(\n_0_cnt_read_reg[1]_rep__1 ),
        .O(\n_0_cnt_read[1]_rep__1_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair17" *) 
   LUT4 #(
    .INIT(16'h7E81)) 
     \cnt_read[1]_rep__2_i_1 
       (.I0(\n_0_cnt_read_reg[0]_rep__2_rep__1 ),
        .I1(wr_en0),
        .I2(O1),
        .I3(\n_0_cnt_read_reg[1]_rep__2 ),
        .O(\n_0_cnt_read[1]_rep__2_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair18" *) 
   LUT4 #(
    .INIT(16'h7E81)) 
     \cnt_read[1]_rep__3_i_1 
       (.I0(\n_0_cnt_read_reg[0]_rep__2_rep__1 ),
        .I1(wr_en0),
        .I2(O1),
        .I3(\n_0_cnt_read_reg[1]_rep__3 ),
        .O(\n_0_cnt_read[1]_rep__3_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair18" *) 
   LUT4 #(
    .INIT(16'h7E81)) 
     \cnt_read[1]_rep__4_i_1 
       (.I0(\n_0_cnt_read_reg[0]_rep__2_rep__1 ),
        .I1(wr_en0),
        .I2(O1),
        .I3(\n_0_cnt_read_reg[1]_rep__4 ),
        .O(\n_0_cnt_read[1]_rep__4_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair20" *) 
   LUT4 #(
    .INIT(16'h7E81)) 
     \cnt_read[1]_rep__4_rep_i_1 
       (.I0(\n_0_cnt_read_reg[0]_rep__2 ),
        .I1(wr_en0),
        .I2(O1),
        .I3(\n_0_cnt_read_reg[1]_rep__4_rep ),
        .O(\n_0_cnt_read[1]_rep__4_rep_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair15" *) 
   LUT4 #(
    .INIT(16'h7E81)) 
     \cnt_read[1]_rep_i_1__0 
       (.I0(\n_0_cnt_read_reg[0]_rep__2_rep_rep ),
        .I1(wr_en0),
        .I2(O1),
        .I3(\n_0_cnt_read_reg[1]_rep ),
        .O(\n_0_cnt_read[1]_rep_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair12" *) 
   LUT5 #(
    .INIT(32'h7FFE8001)) 
     \cnt_read[2]_i_1 
       (.I0(\n_0_cnt_read_reg[1]_rep__3 ),
        .I1(\n_0_cnt_read_reg[0]_rep__2_rep__0 ),
        .I2(wr_en0),
        .I3(O1),
        .I4(cnt_read[2]),
        .O(\n_0_cnt_read[2]_i_1 ));
LUT5 #(
    .INIT(32'h7FFE8001)) 
     \cnt_read[2]_rep__0_i_1 
       (.I0(\n_0_cnt_read_reg[1]_rep__3 ),
        .I1(\n_0_cnt_read_reg[0]_rep__2_rep ),
        .I2(wr_en0),
        .I3(O1),
        .I4(\n_0_cnt_read_reg[2]_rep__0 ),
        .O(\n_0_cnt_read[2]_rep__0_i_1 ));
LUT5 #(
    .INIT(32'h7FFE8001)) 
     \cnt_read[2]_rep__1_i_1 
       (.I0(\n_0_cnt_read_reg[1]_rep__3 ),
        .I1(\n_0_cnt_read_reg[0]_rep__2_rep ),
        .I2(wr_en0),
        .I3(O1),
        .I4(\n_0_cnt_read_reg[2]_rep__1 ),
        .O(\n_0_cnt_read[2]_rep__1_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair11" *) 
   LUT5 #(
    .INIT(32'h7FFE8001)) 
     \cnt_read[2]_rep__2_i_1 
       (.I0(\n_0_cnt_read_reg[1]_rep__3 ),
        .I1(\n_0_cnt_read_reg[0]_rep__2_rep_rep ),
        .I2(wr_en0),
        .I3(O1),
        .I4(\n_0_cnt_read_reg[2]_rep__2 ),
        .O(\n_0_cnt_read[2]_rep__2_i_1 ));
LUT5 #(
    .INIT(32'h7FFE8001)) 
     \cnt_read[2]_rep__3_i_1 
       (.I0(\n_0_cnt_read_reg[1]_rep__3 ),
        .I1(\n_0_cnt_read_reg[0]_rep__2_rep_rep ),
        .I2(wr_en0),
        .I3(O1),
        .I4(\n_0_cnt_read_reg[2]_rep__3 ),
        .O(\n_0_cnt_read[2]_rep__3_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair13" *) 
   LUT5 #(
    .INIT(32'h7FFE8001)) 
     \cnt_read[2]_rep__3_rep_i_1 
       (.I0(\n_0_cnt_read_reg[1]_rep__3 ),
        .I1(\n_0_cnt_read_reg[0]_rep__2_rep ),
        .I2(wr_en0),
        .I3(O1),
        .I4(\n_0_cnt_read_reg[2]_rep__3_rep ),
        .O(\n_0_cnt_read[2]_rep__3_rep_i_1 ));
LUT5 #(
    .INIT(32'h7FFE8001)) 
     \cnt_read[2]_rep_i_1 
       (.I0(\n_0_cnt_read_reg[1]_rep__3 ),
        .I1(\n_0_cnt_read_reg[0]_rep__2_rep ),
        .I2(wr_en0),
        .I3(O1),
        .I4(\n_0_cnt_read_reg[2]_rep ),
        .O(\n_0_cnt_read[2]_rep_i_1 ));
LUT6 #(
    .INIT(64'h7FFF8000FFFE0001)) 
     \cnt_read[3]_i_1 
       (.I0(\n_0_cnt_read_reg[1]_rep__4_rep ),
        .I1(O1),
        .I2(wr_en0),
        .I3(\n_0_cnt_read_reg[0]_rep__2_rep__0 ),
        .I4(cnt_read[3]),
        .I5(\n_0_cnt_read_reg[2]_rep__3_rep ),
        .O(\n_0_cnt_read[3]_i_1 ));
LUT2 #(
    .INIT(4'hB)) 
     \cnt_read[3]_i_2 
       (.I0(O2),
        .I1(si_rs_rready),
        .O(O1));
LUT6 #(
    .INIT(64'h7FFF8000FFFE0001)) 
     \cnt_read[3]_rep__0_i_1 
       (.I0(\n_0_cnt_read_reg[1]_rep__4 ),
        .I1(O1),
        .I2(wr_en0),
        .I3(\n_0_cnt_read_reg[0]_rep__2_rep__1 ),
        .I4(\n_0_cnt_read_reg[3]_rep__0 ),
        .I5(\n_0_cnt_read_reg[2]_rep__3_rep ),
        .O(\n_0_cnt_read[3]_rep__0_i_1 ));
LUT6 #(
    .INIT(64'h7FFF8000FFFE0001)) 
     \cnt_read[3]_rep__1_i_1 
       (.I0(\n_0_cnt_read_reg[1]_rep__4 ),
        .I1(O1),
        .I2(wr_en0),
        .I3(\n_0_cnt_read_reg[0]_rep__2 ),
        .I4(\n_0_cnt_read_reg[3]_rep__1 ),
        .I5(\n_0_cnt_read_reg[2]_rep__3 ),
        .O(\n_0_cnt_read[3]_rep__1_i_1 ));
LUT6 #(
    .INIT(64'h7FFF8000FFFE0001)) 
     \cnt_read[3]_rep__2_i_1 
       (.I0(\n_0_cnt_read_reg[1]_rep__4 ),
        .I1(O1),
        .I2(wr_en0),
        .I3(\n_0_cnt_read_reg[0]_rep__2 ),
        .I4(\n_0_cnt_read_reg[3]_rep__2 ),
        .I5(\n_0_cnt_read_reg[2]_rep__3 ),
        .O(\n_0_cnt_read[3]_rep__2_i_1 ));
LUT6 #(
    .INIT(64'h7FFF8000FFFE0001)) 
     \cnt_read[3]_rep__3_i_1 
       (.I0(\n_0_cnt_read_reg[1]_rep__4 ),
        .I1(O1),
        .I2(wr_en0),
        .I3(\n_0_cnt_read_reg[0]_rep__2 ),
        .I4(\n_0_cnt_read_reg[3]_rep__3 ),
        .I5(\n_0_cnt_read_reg[2]_rep__3 ),
        .O(\n_0_cnt_read[3]_rep__3_i_1 ));
LUT6 #(
    .INIT(64'h7FFF8000FFFE0001)) 
     \cnt_read[3]_rep__3_rep_i_1 
       (.I0(\n_0_cnt_read_reg[1]_rep__4 ),
        .I1(O1),
        .I2(wr_en0),
        .I3(\n_0_cnt_read_reg[0]_rep__2 ),
        .I4(\n_0_cnt_read_reg[3]_rep__3_rep ),
        .I5(\n_0_cnt_read_reg[2]_rep__3 ),
        .O(\n_0_cnt_read[3]_rep__3_rep_i_1 ));
LUT6 #(
    .INIT(64'h7FFF8000FFFE0001)) 
     \cnt_read[3]_rep_i_1 
       (.I0(\n_0_cnt_read_reg[1]_rep__4 ),
        .I1(O1),
        .I2(wr_en0),
        .I3(\n_0_cnt_read_reg[0]_rep__2_rep__1 ),
        .I4(\n_0_cnt_read_reg[3]_rep ),
        .I5(\n_0_cnt_read_reg[2]_rep__3_rep ),
        .O(\n_0_cnt_read[3]_rep_i_1 ));
LUT5 #(
    .INIT(32'h9AAA9AA6)) 
     \cnt_read[4]_i_1 
       (.I0(cnt_read[4]),
        .I1(\n_0_cnt_read[4]_i_2 ),
        .I2(\n_0_cnt_read_reg[3]_rep__3_rep ),
        .I3(\n_0_cnt_read_reg[2]_rep__3_rep ),
        .I4(\n_0_cnt_read[4]_i_3 ),
        .O(\n_0_cnt_read[4]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair14" *) 
   LUT5 #(
    .INIT(32'h4FFFFFFF)) 
     \cnt_read[4]_i_2 
       (.I0(O2),
        .I1(si_rs_rready),
        .I2(wr_en0),
        .I3(\n_0_cnt_read_reg[0]_rep__2_rep__0 ),
        .I4(\n_0_cnt_read_reg[1]_rep__4_rep ),
        .O(\n_0_cnt_read[4]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair14" *) 
   LUT5 #(
    .INIT(32'hFFFFFFEF)) 
     \cnt_read[4]_i_3 
       (.I0(\n_0_cnt_read_reg[0]_rep__2_rep__0 ),
        .I1(wr_en0),
        .I2(si_rs_rready),
        .I3(O2),
        .I4(\n_0_cnt_read_reg[1]_rep__4_rep ),
        .O(\n_0_cnt_read[4]_i_3 ));
LUT5 #(
    .INIT(32'h9AAA9AA6)) 
     \cnt_read[4]_rep__0_i_1 
       (.I0(\n_0_cnt_read_reg[4]_rep__0 ),
        .I1(\n_0_cnt_read[4]_i_2 ),
        .I2(\n_0_cnt_read_reg[3]_rep__3 ),
        .I3(\n_0_cnt_read_reg[2]_rep__3 ),
        .I4(\n_0_cnt_read[4]_i_3 ),
        .O(\n_0_cnt_read[4]_rep__0_i_1 ));
LUT5 #(
    .INIT(32'h9AAA9AA6)) 
     \cnt_read[4]_rep__1_i_1 
       (.I0(\n_0_cnt_read_reg[4]_rep__1 ),
        .I1(\n_0_cnt_read[4]_i_2 ),
        .I2(\n_0_cnt_read_reg[3]_rep__3 ),
        .I3(\n_0_cnt_read_reg[2]_rep__3 ),
        .I4(\n_0_cnt_read[4]_i_3 ),
        .O(\n_0_cnt_read[4]_rep__1_i_1 ));
LUT5 #(
    .INIT(32'h9AAA9AA6)) 
     \cnt_read[4]_rep__2_i_1 
       (.I0(\n_0_cnt_read_reg[4]_rep__2 ),
        .I1(\n_0_cnt_read[4]_i_2 ),
        .I2(\n_0_cnt_read_reg[3]_rep__3 ),
        .I3(\n_0_cnt_read_reg[2]_rep__3 ),
        .I4(\n_0_cnt_read[4]_i_3 ),
        .O(\n_0_cnt_read[4]_rep__2_i_1 ));
LUT5 #(
    .INIT(32'h9AAA9AA6)) 
     \cnt_read[4]_rep__3_i_1 
       (.I0(\n_0_cnt_read_reg[4]_rep__3 ),
        .I1(\n_0_cnt_read[4]_i_2 ),
        .I2(\n_0_cnt_read_reg[3]_rep__3 ),
        .I3(\n_0_cnt_read_reg[2]_rep__3 ),
        .I4(\n_0_cnt_read[4]_i_3 ),
        .O(\n_0_cnt_read[4]_rep__3_i_1 ));
LUT5 #(
    .INIT(32'h9AAA9AA6)) 
     \cnt_read[4]_rep_i_1 
       (.I0(\n_0_cnt_read_reg[4]_rep ),
        .I1(\n_0_cnt_read[4]_i_2 ),
        .I2(\n_0_cnt_read_reg[3]_rep__3 ),
        .I3(\n_0_cnt_read_reg[2]_rep__3 ),
        .I4(\n_0_cnt_read[4]_i_3 ),
        .O(\n_0_cnt_read[4]_rep_i_1 ));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[0]" *) 
   FDSE \cnt_read_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[0]_i_1__1 ),
        .Q(cnt_read[0]),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[0]" *) 
   FDSE \cnt_read_reg[0]_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[0]_rep_i_1__0 ),
        .Q(\n_0_cnt_read_reg[0]_rep ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[0]" *) 
   FDSE \cnt_read_reg[0]_rep__0 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[0]_rep__0_i_1 ),
        .Q(\n_0_cnt_read_reg[0]_rep__0 ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[0]" *) 
   FDSE \cnt_read_reg[0]_rep__1 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[0]_rep__1_i_1 ),
        .Q(\n_0_cnt_read_reg[0]_rep__1 ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[0]" *) 
   FDSE \cnt_read_reg[0]_rep__2 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[0]_rep__2_i_1 ),
        .Q(\n_0_cnt_read_reg[0]_rep__2 ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[0]" *) 
   FDSE \cnt_read_reg[0]_rep__2_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[0]_rep__2_rep_i_1 ),
        .Q(\n_0_cnt_read_reg[0]_rep__2_rep ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[0]" *) 
   FDSE \cnt_read_reg[0]_rep__2_rep__0 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[0]_rep__2_rep__0_i_1 ),
        .Q(\n_0_cnt_read_reg[0]_rep__2_rep__0 ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[0]" *) 
   FDSE \cnt_read_reg[0]_rep__2_rep__1 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[0]_rep__2_rep__1_i_1 ),
        .Q(\n_0_cnt_read_reg[0]_rep__2_rep__1 ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[0]" *) 
   FDSE \cnt_read_reg[0]_rep__2_rep_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[0]_rep__2_rep_rep_i_1 ),
        .Q(\n_0_cnt_read_reg[0]_rep__2_rep_rep ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[1]" *) 
   FDSE \cnt_read_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[1]_i_1__1 ),
        .Q(cnt_read[1]),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[1]" *) 
   FDSE \cnt_read_reg[1]_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[1]_rep_i_1__0 ),
        .Q(\n_0_cnt_read_reg[1]_rep ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[1]" *) 
   FDSE \cnt_read_reg[1]_rep__0 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[1]_rep__0_i_1__0 ),
        .Q(\n_0_cnt_read_reg[1]_rep__0 ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[1]" *) 
   FDSE \cnt_read_reg[1]_rep__1 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[1]_rep__1_i_1 ),
        .Q(\n_0_cnt_read_reg[1]_rep__1 ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[1]" *) 
   FDSE \cnt_read_reg[1]_rep__2 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[1]_rep__2_i_1 ),
        .Q(\n_0_cnt_read_reg[1]_rep__2 ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[1]" *) 
   FDSE \cnt_read_reg[1]_rep__3 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[1]_rep__3_i_1 ),
        .Q(\n_0_cnt_read_reg[1]_rep__3 ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[1]" *) 
   FDSE \cnt_read_reg[1]_rep__4 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[1]_rep__4_i_1 ),
        .Q(\n_0_cnt_read_reg[1]_rep__4 ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[1]" *) 
   FDSE \cnt_read_reg[1]_rep__4_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[1]_rep__4_rep_i_1 ),
        .Q(\n_0_cnt_read_reg[1]_rep__4_rep ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[2]" *) 
   FDSE \cnt_read_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[2]_i_1 ),
        .Q(cnt_read[2]),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[2]" *) 
   FDSE \cnt_read_reg[2]_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[2]_rep_i_1 ),
        .Q(\n_0_cnt_read_reg[2]_rep ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[2]" *) 
   FDSE \cnt_read_reg[2]_rep__0 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[2]_rep__0_i_1 ),
        .Q(\n_0_cnt_read_reg[2]_rep__0 ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[2]" *) 
   FDSE \cnt_read_reg[2]_rep__1 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[2]_rep__1_i_1 ),
        .Q(\n_0_cnt_read_reg[2]_rep__1 ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[2]" *) 
   FDSE \cnt_read_reg[2]_rep__2 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[2]_rep__2_i_1 ),
        .Q(\n_0_cnt_read_reg[2]_rep__2 ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[2]" *) 
   FDSE \cnt_read_reg[2]_rep__3 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[2]_rep__3_i_1 ),
        .Q(\n_0_cnt_read_reg[2]_rep__3 ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[2]" *) 
   FDSE \cnt_read_reg[2]_rep__3_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[2]_rep__3_rep_i_1 ),
        .Q(\n_0_cnt_read_reg[2]_rep__3_rep ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[3]" *) 
   FDSE \cnt_read_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[3]_i_1 ),
        .Q(cnt_read[3]),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[3]" *) 
   FDSE \cnt_read_reg[3]_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[3]_rep_i_1 ),
        .Q(\n_0_cnt_read_reg[3]_rep ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[3]" *) 
   FDSE \cnt_read_reg[3]_rep__0 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[3]_rep__0_i_1 ),
        .Q(\n_0_cnt_read_reg[3]_rep__0 ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[3]" *) 
   FDSE \cnt_read_reg[3]_rep__1 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[3]_rep__1_i_1 ),
        .Q(\n_0_cnt_read_reg[3]_rep__1 ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[3]" *) 
   FDSE \cnt_read_reg[3]_rep__2 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[3]_rep__2_i_1 ),
        .Q(\n_0_cnt_read_reg[3]_rep__2 ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[3]" *) 
   FDSE \cnt_read_reg[3]_rep__3 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[3]_rep__3_i_1 ),
        .Q(\n_0_cnt_read_reg[3]_rep__3 ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[3]" *) 
   FDSE \cnt_read_reg[3]_rep__3_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[3]_rep__3_rep_i_1 ),
        .Q(\n_0_cnt_read_reg[3]_rep__3_rep ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[4]" *) 
   FDSE \cnt_read_reg[4] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[4]_i_1 ),
        .Q(cnt_read[4]),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[4]" *) 
   FDSE \cnt_read_reg[4]_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[4]_rep_i_1 ),
        .Q(\n_0_cnt_read_reg[4]_rep ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[4]" *) 
   FDSE \cnt_read_reg[4]_rep__0 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[4]_rep__0_i_1 ),
        .Q(\n_0_cnt_read_reg[4]_rep__0 ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[4]" *) 
   FDSE \cnt_read_reg[4]_rep__1 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[4]_rep__1_i_1 ),
        .Q(\n_0_cnt_read_reg[4]_rep__1 ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[4]" *) 
   FDSE \cnt_read_reg[4]_rep__2 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[4]_rep__2_i_1 ),
        .Q(\n_0_cnt_read_reg[4]_rep__2 ),
        .S(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "cnt_read_reg[4]" *) 
   FDSE \cnt_read_reg[4]_rep__3 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[4]_rep__3_i_1 ),
        .Q(\n_0_cnt_read_reg[4]_rep__3 ),
        .S(areset_d1));
LUT5 #(
    .INIT(32'hF77F777F)) 
     m_axi_rready_INST_0
       (.I0(\n_0_cnt_read_reg[4]_rep__3 ),
        .I1(\n_0_cnt_read_reg[3]_rep__3_rep ),
        .I2(\n_0_cnt_read_reg[1]_rep__3 ),
        .I3(\n_0_cnt_read_reg[2]_rep__3_rep ),
        .I4(\n_0_cnt_read_reg[0]_rep__2_rep__0 ),
        .O(m_axi_rready));
LUT6 #(
    .INIT(64'hFFFFFFFF80000000)) 
     m_valid_i_i_2
       (.I0(\n_0_cnt_read_reg[3]_rep__3_rep ),
        .I1(\n_0_cnt_read_reg[4]_rep__3 ),
        .I2(\n_0_cnt_read_reg[1]_rep__4 ),
        .I3(\n_0_cnt_read_reg[2]_rep__3_rep ),
        .I4(\n_0_cnt_read_reg[0]_rep__2_rep ),
        .I5(I1),
        .O(O2));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][0]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][0]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep__2 ,\n_0_cnt_read_reg[3]_rep__2 ,\n_0_cnt_read_reg[2]_rep__2 ,\n_0_cnt_read_reg[1]_rep__2 ,\n_0_cnt_read_reg[0]_rep__1 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[0]),
        .Q(out[0]),
        .Q31(\NLW_memory_reg[31][0]_srl32_Q31_UNCONNECTED ));
LUT6 #(
    .INIT(64'hAA2A2AAA2A2A2AAA)) 
     \memory_reg[31][0]_srl32_i_1 
       (.I0(m_axi_rvalid),
        .I1(\n_0_cnt_read_reg[4]_rep__3 ),
        .I2(\n_0_cnt_read_reg[3]_rep__3_rep ),
        .I3(\n_0_cnt_read_reg[1]_rep__4_rep ),
        .I4(\n_0_cnt_read_reg[2]_rep__3_rep ),
        .I5(\n_0_cnt_read_reg[0]_rep__2_rep__0 ),
        .O(wr_en0));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][10]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][10]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep__1 ,\n_0_cnt_read_reg[3]_rep__1 ,\n_0_cnt_read_reg[2]_rep__1 ,\n_0_cnt_read_reg[1]_rep__1 ,\n_0_cnt_read_reg[0]_rep__0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[10]),
        .Q(out[10]),
        .Q31(\NLW_memory_reg[31][10]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][11]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][11]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep__1 ,\n_0_cnt_read_reg[3]_rep__1 ,\n_0_cnt_read_reg[2]_rep__1 ,\n_0_cnt_read_reg[1]_rep__1 ,\n_0_cnt_read_reg[0]_rep__0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[11]),
        .Q(out[11]),
        .Q31(\NLW_memory_reg[31][11]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][12]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][12]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep__1 ,\n_0_cnt_read_reg[3]_rep__1 ,\n_0_cnt_read_reg[2]_rep__1 ,\n_0_cnt_read_reg[1]_rep__1 ,\n_0_cnt_read_reg[0]_rep__0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[12]),
        .Q(out[12]),
        .Q31(\NLW_memory_reg[31][12]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][13]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][13]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep__0 ,\n_0_cnt_read_reg[3]_rep__0 ,\n_0_cnt_read_reg[2]_rep__0 ,\n_0_cnt_read_reg[1]_rep__0 ,\n_0_cnt_read_reg[0]_rep__0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[13]),
        .Q(out[13]),
        .Q31(\NLW_memory_reg[31][13]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][14]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][14]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep__0 ,\n_0_cnt_read_reg[3]_rep__0 ,\n_0_cnt_read_reg[2]_rep__0 ,\n_0_cnt_read_reg[1]_rep__0 ,\n_0_cnt_read_reg[0]_rep__0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[14]),
        .Q(out[14]),
        .Q31(\NLW_memory_reg[31][14]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][15]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][15]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep__0 ,\n_0_cnt_read_reg[3]_rep__0 ,\n_0_cnt_read_reg[2]_rep__0 ,\n_0_cnt_read_reg[1]_rep__0 ,\n_0_cnt_read_reg[0]_rep__0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[15]),
        .Q(out[15]),
        .Q31(\NLW_memory_reg[31][15]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][16]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][16]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep__0 ,\n_0_cnt_read_reg[3]_rep__0 ,\n_0_cnt_read_reg[2]_rep__0 ,\n_0_cnt_read_reg[1]_rep__0 ,\n_0_cnt_read_reg[0]_rep }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[16]),
        .Q(out[16]),
        .Q31(\NLW_memory_reg[31][16]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][17]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][17]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep__0 ,\n_0_cnt_read_reg[3]_rep__0 ,\n_0_cnt_read_reg[2]_rep__0 ,\n_0_cnt_read_reg[1]_rep__0 ,\n_0_cnt_read_reg[0]_rep }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[17]),
        .Q(out[17]),
        .Q31(\NLW_memory_reg[31][17]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][18]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][18]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep__0 ,\n_0_cnt_read_reg[3]_rep__0 ,\n_0_cnt_read_reg[2]_rep__0 ,\n_0_cnt_read_reg[1]_rep__0 ,\n_0_cnt_read_reg[0]_rep }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[18]),
        .Q(out[18]),
        .Q31(\NLW_memory_reg[31][18]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][19]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][19]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep__0 ,\n_0_cnt_read_reg[3]_rep__0 ,\n_0_cnt_read_reg[2]_rep__0 ,\n_0_cnt_read_reg[1]_rep__0 ,\n_0_cnt_read_reg[0]_rep }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[19]),
        .Q(out[19]),
        .Q31(\NLW_memory_reg[31][19]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][1]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][1]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep__2 ,\n_0_cnt_read_reg[3]_rep__2 ,\n_0_cnt_read_reg[2]_rep__2 ,\n_0_cnt_read_reg[1]_rep__2 ,\n_0_cnt_read_reg[0]_rep__1 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[1]),
        .Q(out[1]),
        .Q31(\NLW_memory_reg[31][1]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][20]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][20]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep ,\n_0_cnt_read_reg[3]_rep ,\n_0_cnt_read_reg[2]_rep ,\n_0_cnt_read_reg[1]_rep ,\n_0_cnt_read_reg[0]_rep }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[20]),
        .Q(out[20]),
        .Q31(\NLW_memory_reg[31][20]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][21]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][21]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep ,\n_0_cnt_read_reg[3]_rep ,\n_0_cnt_read_reg[2]_rep ,\n_0_cnt_read_reg[1]_rep ,\n_0_cnt_read_reg[0]_rep }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[21]),
        .Q(out[21]),
        .Q31(\NLW_memory_reg[31][21]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][22]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][22]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep ,\n_0_cnt_read_reg[3]_rep ,\n_0_cnt_read_reg[2]_rep ,\n_0_cnt_read_reg[1]_rep ,\n_0_cnt_read_reg[0]_rep }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[22]),
        .Q(out[22]),
        .Q31(\NLW_memory_reg[31][22]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][23]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][23]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep ,\n_0_cnt_read_reg[3]_rep ,\n_0_cnt_read_reg[2]_rep ,\n_0_cnt_read_reg[1]_rep ,\n_0_cnt_read_reg[0]_rep }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[23]),
        .Q(out[23]),
        .Q31(\NLW_memory_reg[31][23]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][24]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][24]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep ,\n_0_cnt_read_reg[3]_rep ,\n_0_cnt_read_reg[2]_rep ,\n_0_cnt_read_reg[1]_rep ,\n_0_cnt_read_reg[0]_rep }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[24]),
        .Q(out[24]),
        .Q31(\NLW_memory_reg[31][24]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][25]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][25]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep ,\n_0_cnt_read_reg[3]_rep ,\n_0_cnt_read_reg[2]_rep ,\n_0_cnt_read_reg[1]_rep ,cnt_read[0]}),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[25]),
        .Q(out[25]),
        .Q31(\NLW_memory_reg[31][25]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][26]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][26]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep ,\n_0_cnt_read_reg[3]_rep ,\n_0_cnt_read_reg[2]_rep ,\n_0_cnt_read_reg[1]_rep ,cnt_read[0]}),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[26]),
        .Q(out[26]),
        .Q31(\NLW_memory_reg[31][26]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][27]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][27]_srl32 
       (.A(cnt_read),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[27]),
        .Q(out[27]),
        .Q31(\NLW_memory_reg[31][27]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][28]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][28]_srl32 
       (.A(cnt_read),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[28]),
        .Q(out[28]),
        .Q31(\NLW_memory_reg[31][28]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][29]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][29]_srl32 
       (.A(cnt_read),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[29]),
        .Q(out[29]),
        .Q31(\NLW_memory_reg[31][29]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][2]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][2]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep__2 ,\n_0_cnt_read_reg[3]_rep__2 ,\n_0_cnt_read_reg[2]_rep__2 ,\n_0_cnt_read_reg[1]_rep__2 ,\n_0_cnt_read_reg[0]_rep__1 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[2]),
        .Q(out[2]),
        .Q31(\NLW_memory_reg[31][2]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][30]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][30]_srl32 
       (.A(cnt_read),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[30]),
        .Q(out[30]),
        .Q31(\NLW_memory_reg[31][30]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][31]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][31]_srl32 
       (.A(cnt_read),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[31]),
        .Q(out[31]),
        .Q31(\NLW_memory_reg[31][31]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][32]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][32]_srl32 
       (.A(cnt_read),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[32]),
        .Q(out[32]),
        .Q31(\NLW_memory_reg[31][32]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][33]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][33]_srl32 
       (.A(cnt_read),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[33]),
        .Q(out[33]),
        .Q31(\NLW_memory_reg[31][33]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][3]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][3]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep__2 ,\n_0_cnt_read_reg[3]_rep__2 ,\n_0_cnt_read_reg[2]_rep__2 ,\n_0_cnt_read_reg[1]_rep__2 ,\n_0_cnt_read_reg[0]_rep__1 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[3]),
        .Q(out[3]),
        .Q31(\NLW_memory_reg[31][3]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][4]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][4]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep__2 ,\n_0_cnt_read_reg[3]_rep__2 ,\n_0_cnt_read_reg[2]_rep__2 ,\n_0_cnt_read_reg[1]_rep__2 ,\n_0_cnt_read_reg[0]_rep__1 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[4]),
        .Q(out[4]),
        .Q31(\NLW_memory_reg[31][4]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][5]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][5]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep__2 ,\n_0_cnt_read_reg[3]_rep__2 ,\n_0_cnt_read_reg[2]_rep__2 ,\n_0_cnt_read_reg[1]_rep__2 ,\n_0_cnt_read_reg[0]_rep__1 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[5]),
        .Q(out[5]),
        .Q31(\NLW_memory_reg[31][5]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][6]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][6]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep__1 ,\n_0_cnt_read_reg[3]_rep__1 ,\n_0_cnt_read_reg[2]_rep__1 ,\n_0_cnt_read_reg[1]_rep__1 ,\n_0_cnt_read_reg[0]_rep__1 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[6]),
        .Q(out[6]),
        .Q31(\NLW_memory_reg[31][6]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][7]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][7]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep__1 ,\n_0_cnt_read_reg[3]_rep__1 ,\n_0_cnt_read_reg[2]_rep__1 ,\n_0_cnt_read_reg[1]_rep__1 ,\n_0_cnt_read_reg[0]_rep__0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[7]),
        .Q(out[7]),
        .Q31(\NLW_memory_reg[31][7]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][8]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][8]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep__1 ,\n_0_cnt_read_reg[3]_rep__1 ,\n_0_cnt_read_reg[2]_rep__1 ,\n_0_cnt_read_reg[1]_rep__1 ,\n_0_cnt_read_reg[0]_rep__0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[8]),
        .Q(out[8]),
        .Q31(\NLW_memory_reg[31][8]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][9]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][9]_srl32 
       (.A({\n_0_cnt_read_reg[4]_rep__1 ,\n_0_cnt_read_reg[3]_rep__1 ,\n_0_cnt_read_reg[2]_rep__1 ,\n_0_cnt_read_reg[1]_rep__1 ,\n_0_cnt_read_reg[0]_rep__0 }),
        .CE(wr_en0),
        .CLK(aclk),
        .D(in[9]),
        .Q(out[9]),
        .Q31(\NLW_memory_reg[31][9]_srl32_Q31_UNCONNECTED ));
LUT5 #(
    .INIT(32'h7C000000)) 
     \state[1]_i_4 
       (.I0(\n_0_cnt_read_reg[0]_rep__2_rep__0 ),
        .I1(\n_0_cnt_read_reg[2]_rep__3_rep ),
        .I2(\n_0_cnt_read_reg[1]_rep__4_rep ),
        .I3(\n_0_cnt_read_reg[3]_rep__3_rep ),
        .I4(\n_0_cnt_read_reg[4]_rep__3 ),
        .O(O3));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_b2s_simple_fifo" *) 
module axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo__parameterized2
   (O2,
    O3,
    O4,
    I1,
    r_push_r,
    I2,
    O1,
    si_rs_rready,
    in,
    aclk,
    areset_d1);
  output O2;
  output O3;
  output [1:0]O4;
  input I1;
  input r_push_r;
  input I2;
  input O1;
  input si_rs_rready;
  input [1:0]in;
  input aclk;
  input areset_d1;

  wire I1;
  wire I2;
  wire O1;
  wire O2;
  wire O3;
  wire [1:0]O4;
  wire aclk;
  wire areset_d1;
  wire [4:0]cnt_read;
  wire [1:0]in;
  wire \n_0_cnt_read[0]_i_1__2 ;
  wire \n_0_cnt_read[1]_i_1__2 ;
  wire \n_0_cnt_read[2]_i_1__0 ;
  wire \n_0_cnt_read[3]_i_1__0 ;
  wire \n_0_cnt_read[4]_i_1__0 ;
  wire \n_0_cnt_read[4]_i_2__0 ;
  wire \n_0_cnt_read[4]_i_3__0 ;
  wire r_push_r;
  wire si_rs_rready;
  wire \NLW_memory_reg[31][0]_srl32_Q31_UNCONNECTED ;
  wire \NLW_memory_reg[31][1]_srl32_Q31_UNCONNECTED ;

LUT3 #(
    .INIT(8'h69)) 
     \cnt_read[0]_i_1__2 
       (.I0(cnt_read[0]),
        .I1(I1),
        .I2(r_push_r),
        .O(\n_0_cnt_read[0]_i_1__2 ));
(* SOFT_HLUTNM = "soft_lutpair22" *) 
   LUT4 #(
    .INIT(16'h7E81)) 
     \cnt_read[1]_i_1__2 
       (.I0(cnt_read[0]),
        .I1(r_push_r),
        .I2(I1),
        .I3(cnt_read[1]),
        .O(\n_0_cnt_read[1]_i_1__2 ));
(* SOFT_HLUTNM = "soft_lutpair22" *) 
   LUT5 #(
    .INIT(32'h7FFE8001)) 
     \cnt_read[2]_i_1__0 
       (.I0(cnt_read[1]),
        .I1(cnt_read[0]),
        .I2(r_push_r),
        .I3(I1),
        .I4(cnt_read[2]),
        .O(\n_0_cnt_read[2]_i_1__0 ));
LUT6 #(
    .INIT(64'h7FFF8000FFFE0001)) 
     \cnt_read[3]_i_1__0 
       (.I0(cnt_read[1]),
        .I1(I1),
        .I2(r_push_r),
        .I3(cnt_read[0]),
        .I4(cnt_read[3]),
        .I5(cnt_read[2]),
        .O(\n_0_cnt_read[3]_i_1__0 ));
LUT5 #(
    .INIT(32'h9AAA9AA6)) 
     \cnt_read[4]_i_1__0 
       (.I0(cnt_read[4]),
        .I1(\n_0_cnt_read[4]_i_2__0 ),
        .I2(cnt_read[3]),
        .I3(cnt_read[2]),
        .I4(\n_0_cnt_read[4]_i_3__0 ),
        .O(\n_0_cnt_read[4]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair23" *) 
   LUT5 #(
    .INIT(32'h4FFFFFFF)) 
     \cnt_read[4]_i_2__0 
       (.I0(O1),
        .I1(si_rs_rready),
        .I2(r_push_r),
        .I3(cnt_read[0]),
        .I4(cnt_read[1]),
        .O(\n_0_cnt_read[4]_i_2__0 ));
(* SOFT_HLUTNM = "soft_lutpair23" *) 
   LUT5 #(
    .INIT(32'hFFFFFFEF)) 
     \cnt_read[4]_i_3__0 
       (.I0(cnt_read[0]),
        .I1(r_push_r),
        .I2(si_rs_rready),
        .I3(O1),
        .I4(cnt_read[1]),
        .O(\n_0_cnt_read[4]_i_3__0 ));
(* KEEP = "yes" *) 
   FDSE \cnt_read_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[0]_i_1__2 ),
        .Q(cnt_read[0]),
        .S(areset_d1));
(* KEEP = "yes" *) 
   FDSE \cnt_read_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[1]_i_1__2 ),
        .Q(cnt_read[1]),
        .S(areset_d1));
(* KEEP = "yes" *) 
   FDSE \cnt_read_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[2]_i_1__0 ),
        .Q(cnt_read[2]),
        .S(areset_d1));
(* KEEP = "yes" *) 
   FDSE \cnt_read_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[3]_i_1__0 ),
        .Q(cnt_read[3]),
        .S(areset_d1));
(* KEEP = "yes" *) 
   FDSE \cnt_read_reg[4] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_cnt_read[4]_i_1__0 ),
        .Q(cnt_read[4]),
        .S(areset_d1));
LUT5 #(
    .INIT(32'h80000000)) 
     m_valid_i_i_3
       (.I0(cnt_read[2]),
        .I1(cnt_read[1]),
        .I2(cnt_read[0]),
        .I3(cnt_read[4]),
        .I4(cnt_read[3]),
        .O(O3));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][0]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][0]_srl32 
       (.A(cnt_read),
        .CE(r_push_r),
        .CLK(aclk),
        .D(in[0]),
        .Q(O4[0]),
        .Q31(\NLW_memory_reg[31][0]_srl32_Q31_UNCONNECTED ));
(* srl_bus_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] " *) 
   (* srl_name = "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][1]_srl32 " *) 
   SRLC32E #(
    .INIT(32'h00000000)) 
     \memory_reg[31][1]_srl32 
       (.A(cnt_read),
        .CE(r_push_r),
        .CLK(aclk),
        .D(in[1]),
        .Q(O4[1]),
        .Q31(\NLW_memory_reg[31][1]_srl32_Q31_UNCONNECTED ));
LUT6 #(
    .INIT(64'hBFFAAAAAAAAAAAAA)) 
     \state[1]_i_3 
       (.I0(I2),
        .I1(cnt_read[0]),
        .I2(cnt_read[1]),
        .I3(cnt_read[2]),
        .I4(cnt_read[4]),
        .I5(cnt_read[3]),
        .O(O2));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_b2s_wr_cmd_fsm" *) 
module axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_wr_cmd_fsm
   (O1,
    Q,
    O2,
    O3,
    D,
    E,
    S,
    O4,
    O5,
    O6,
    O7,
    O8,
    wrap_next_pending,
    sel_first_i,
    incr_next_pending,
    O9,
    O10,
    O11,
    O12,
    O13,
    O14,
    O15,
    m_axi_awvalid,
    si_rs_awvalid,
    I1,
    I2,
    I3,
    I6,
    I7,
    I4,
    I9,
    I10,
    I5,
    I11,
    I8,
    I12,
    I13,
    areset_d1,
    I14,
    I15,
    m_axi_awready,
    I16,
    I17,
    I18,
    I19,
    I20,
    aclk);
  output O1;
  output [1:0]Q;
  output O2;
  output O3;
  output [1:0]D;
  output [0:0]E;
  output [3:0]S;
  output [0:0]O4;
  output [0:0]O5;
  output O6;
  output O7;
  output O8;
  output wrap_next_pending;
  output sel_first_i;
  output incr_next_pending;
  output O9;
  output O10;
  output [0:0]O11;
  output [0:0]O12;
  output O13;
  output O14;
  output [0:0]O15;
  output m_axi_awvalid;
  input si_rs_awvalid;
  input [1:0]I1;
  input [8:0]I2;
  input [0:0]I3;
  input I6;
  input I7;
  input [0:0]I4;
  input I9;
  input [0:0]I10;
  input I5;
  input I11;
  input I8;
  input I12;
  input I13;
  input areset_d1;
  input I14;
  input I15;
  input m_axi_awready;
  input I16;
  input I17;
  input I18;
  input I19;
  input I20;
  input aclk;

  wire [1:0]D;
  wire [0:0]E;
  wire [1:0]I1;
  wire [0:0]I10;
  wire I11;
  wire I12;
  wire I13;
  wire I14;
  wire I15;
  wire I16;
  wire I17;
  wire I18;
  wire I19;
  wire [8:0]I2;
  wire I20;
  wire [0:0]I3;
  wire [0:0]I4;
  wire I5;
  wire I6;
  wire I7;
  wire I8;
  wire I9;
  wire O1;
  wire O10;
  wire [0:0]O11;
  wire [0:0]O12;
  wire O13;
  wire O14;
  wire [0:0]O15;
  wire O2;
  wire O3;
  wire [0:0]O4;
  wire [0:0]O5;
  wire O6;
  wire O7;
  wire O8;
  wire O9;
  wire [1:0]Q;
  wire [3:0]S;
  wire aclk;
  wire areset_d1;
  wire incr_next_pending;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire \n_0_state[0]_rep_i_1__0 ;
  wire \n_0_state[1]_rep_i_1__0 ;
  wire \n_0_state_reg[0]_rep ;
  wire \n_0_state_reg[1]_rep ;
  wire next;
  wire [1:0]next_state;
  wire sel_first_i;
  wire si_rs_awvalid;
  wire wrap_next_pending;

(* SOFT_HLUTNM = "soft_lutpair97" *) 
   LUT4 #(
    .INIT(16'hEEFE)) 
     \axaddr_incr[0]_i_1 
       (.I0(I17),
        .I1(O2),
        .I2(\n_0_state_reg[1]_rep ),
        .I3(\n_0_state_reg[0]_rep ),
        .O(O14));
LUT6 #(
    .INIT(64'h000000006366CCCC)) 
     \axaddr_incr[0]_i_10 
       (.I0(O2),
        .I1(I2[1]),
        .I2(\n_0_state_reg[0]_rep ),
        .I3(\n_0_state_reg[1]_rep ),
        .I4(I2[4]),
        .I5(I2[5]),
        .O(S[1]));
LUT6 #(
    .INIT(64'h0000000000006366)) 
     \axaddr_incr[0]_i_11 
       (.I0(O2),
        .I1(I2[0]),
        .I2(\n_0_state_reg[0]_rep ),
        .I3(\n_0_state_reg[1]_rep ),
        .I4(I2[5]),
        .I5(I2[4]),
        .O(S[0]));
LUT6 #(
    .INIT(64'h6366CCCCCCCCCCCC)) 
     \axaddr_incr[0]_i_8 
       (.I0(O2),
        .I1(I2[3]),
        .I2(\n_0_state_reg[0]_rep ),
        .I3(\n_0_state_reg[1]_rep ),
        .I4(I2[5]),
        .I5(I2[4]),
        .O(S[3]));
LUT6 #(
    .INIT(64'h0000CCCC6366CCCC)) 
     \axaddr_incr[0]_i_9 
       (.I0(O2),
        .I1(I2[2]),
        .I2(\n_0_state_reg[0]_rep ),
        .I3(\n_0_state_reg[1]_rep ),
        .I4(I2[5]),
        .I5(I2[4]),
        .O(S[2]));
(* SOFT_HLUTNM = "soft_lutpair96" *) 
   LUT4 #(
    .INIT(16'hCCFE)) 
     \axaddr_wrap[11]_i_1 
       (.I0(si_rs_awvalid),
        .I1(O2),
        .I2(\n_0_state_reg[1]_rep ),
        .I3(\n_0_state_reg[0]_rep ),
        .O(O12));
LUT6 #(
    .INIT(64'h44444F4444444444)) 
     \axlen_cnt[0]_i_1 
       (.I0(I1[0]),
        .I1(O3),
        .I2(Q[1]),
        .I3(si_rs_awvalid),
        .I4(Q[0]),
        .I5(I2[7]),
        .O(D[0]));
LUT5 #(
    .INIT(32'hF88F8888)) 
     \axlen_cnt[1]_i_1 
       (.I0(E),
        .I1(I2[8]),
        .I2(I1[0]),
        .I3(I1[1]),
        .I4(O3),
        .O(D[1]));
(* SOFT_HLUTNM = "soft_lutpair100" *) 
   LUT4 #(
    .INIT(16'hCCFE)) 
     \axlen_cnt[3]_i_1 
       (.I0(si_rs_awvalid),
        .I1(O2),
        .I2(Q[1]),
        .I3(\n_0_state_reg[0]_rep ),
        .O(O11));
(* SOFT_HLUTNM = "soft_lutpair96" *) 
   LUT4 #(
    .INIT(16'hCCFE)) 
     \axlen_cnt[3]_i_1__0 
       (.I0(si_rs_awvalid),
        .I1(O2),
        .I2(\n_0_state_reg[1]_rep ),
        .I3(\n_0_state_reg[0]_rep ),
        .O(O13));
(* SOFT_HLUTNM = "soft_lutpair99" *) 
   LUT4 #(
    .INIT(16'hAA8A)) 
     \axlen_cnt[3]_i_3 
       (.I0(I5),
        .I1(Q[0]),
        .I2(si_rs_awvalid),
        .I3(Q[1]),
        .O(O3));
(* SOFT_HLUTNM = "soft_lutpair95" *) 
   LUT5 #(
    .INIT(32'h0000F5F4)) 
     \axlen_cnt[7]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(O2),
        .I3(si_rs_awvalid),
        .I4(O3),
        .O(O1));
(* SOFT_HLUTNM = "soft_lutpair100" *) 
   LUT2 #(
    .INIT(4'h2)) 
     m_axi_awvalid_INST_0
       (.I0(\n_0_state_reg[0]_rep ),
        .I1(\n_0_state_reg[1]_rep ),
        .O(m_axi_awvalid));
(* SOFT_HLUTNM = "soft_lutpair95" *) 
   LUT2 #(
    .INIT(4'hB)) 
     \m_payload_i[31]_i_1 
       (.I0(O2),
        .I1(si_rs_awvalid),
        .O(O15));
LUT6 #(
    .INIT(64'hAA0A2202AA0A0000)) 
     \memory_reg[3][0]_srl4_i_1 
       (.I0(\n_0_state_reg[0]_rep ),
        .I1(I16),
        .I2(I19),
        .I3(I18),
        .I4(\n_0_state_reg[1]_rep ),
        .I5(m_axi_awready),
        .O(O2));
LUT5 #(
    .INIT(32'h8BBB8B88)) 
     next_pending_r_i_1
       (.I0(I11),
        .I1(E),
        .I2(I8),
        .I3(next),
        .I4(I12),
        .O(wrap_next_pending));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     next_pending_r_i_1__0
       (.I0(I11),
        .I1(E),
        .I2(I13),
        .I3(O10),
        .I4(I5),
        .O(incr_next_pending));
LUT6 #(
    .INIT(64'hC0CCE0EECCCCCCCC)) 
     next_pending_r_i_3
       (.I0(m_axi_awready),
        .I1(\n_0_state_reg[1]_rep ),
        .I2(I18),
        .I3(I19),
        .I4(I16),
        .I5(\n_0_state_reg[0]_rep ),
        .O(next));
LUT6 #(
    .INIT(64'h3F331F1133333333)) 
     next_pending_r_i_3__0
       (.I0(m_axi_awready),
        .I1(\n_0_state_reg[1]_rep ),
        .I2(I18),
        .I3(I19),
        .I4(I16),
        .I5(\n_0_state_reg[0]_rep ),
        .O(O10));
(* SOFT_HLUTNM = "soft_lutpair98" *) 
   LUT4 #(
    .INIT(16'hFB08)) 
     s_axburst_eq0_i_1
       (.I0(wrap_next_pending),
        .I1(I2[6]),
        .I2(sel_first_i),
        .I3(incr_next_pending),
        .O(O8));
(* SOFT_HLUTNM = "soft_lutpair98" *) 
   LUT4 #(
    .INIT(16'hABA8)) 
     s_axburst_eq1_i_1
       (.I0(wrap_next_pending),
        .I1(I2[6]),
        .I2(sel_first_i),
        .I3(incr_next_pending),
        .O(O9));
LUT6 #(
    .INIT(64'hCCCEFCFFCCCECCCE)) 
     sel_first_i_1
       (.I0(si_rs_awvalid),
        .I1(areset_d1),
        .I2(\n_0_state_reg[0]_rep ),
        .I3(\n_0_state_reg[1]_rep ),
        .I4(O2),
        .I5(I14),
        .O(sel_first_i));
LUT6 #(
    .INIT(64'hF232FE3EFE32FE3E)) 
     \state[0]_i_1 
       (.I0(si_rs_awvalid),
        .I1(Q[0]),
        .I2(\n_0_state_reg[1]_rep ),
        .I3(I15),
        .I4(m_axi_awready),
        .I5(I16),
        .O(next_state[0]));
LUT6 #(
    .INIT(64'hF232FE3EFE32FE3E)) 
     \state[0]_rep_i_1__0 
       (.I0(si_rs_awvalid),
        .I1(\n_0_state_reg[0]_rep ),
        .I2(\n_0_state_reg[1]_rep ),
        .I3(I15),
        .I4(m_axi_awready),
        .I5(I16),
        .O(\n_0_state[0]_rep_i_1__0 ));
LUT6 #(
    .INIT(64'h0CAE0C0000000000)) 
     \state[1]_i_1 
       (.I0(I16),
        .I1(I19),
        .I2(I18),
        .I3(Q[1]),
        .I4(m_axi_awready),
        .I5(\n_0_state_reg[0]_rep ),
        .O(next_state[1]));
LUT6 #(
    .INIT(64'h0CAE0C0000000000)) 
     \state[1]_rep_i_1__0 
       (.I0(I16),
        .I1(I19),
        .I2(I20),
        .I3(\n_0_state_reg[1]_rep ),
        .I4(m_axi_awready),
        .I5(Q[0]),
        .O(\n_0_state[1]_rep_i_1__0 ));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "state_reg[0]" *) 
   FDRE \state_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(next_state[0]),
        .Q(Q[0]),
        .R(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "state_reg[0]" *) 
   FDRE \state_reg[0]_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_state[0]_rep_i_1__0 ),
        .Q(\n_0_state_reg[0]_rep ),
        .R(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "state_reg[1]" *) 
   FDRE \state_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(next_state[1]),
        .Q(Q[1]),
        .R(areset_d1));
(* KEEP = "yes" *) 
   (* ORIG_CELL_NAME = "state_reg[1]" *) 
   FDRE \state_reg[1]_rep 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_state[1]_rep_i_1__0 ),
        .Q(\n_0_state_reg[1]_rep ),
        .R(areset_d1));
(* SOFT_HLUTNM = "soft_lutpair97" *) 
   LUT3 #(
    .INIT(8'h04)) 
     \wrap_boundary_axaddr_r[11]_i_1__0 
       (.I0(\n_0_state_reg[1]_rep ),
        .I1(si_rs_awvalid),
        .I2(\n_0_state_reg[0]_rep ),
        .O(E));
LUT6 #(
    .INIT(64'hAA8A5575AA8A5545)) 
     \wrap_cnt_r[0]_i_1 
       (.I0(I3),
        .I1(Q[0]),
        .I2(si_rs_awvalid),
        .I3(Q[1]),
        .I4(I6),
        .I5(I7),
        .O(O4));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFAA8A)) 
     \wrap_cnt_r[1]_i_3 
       (.I0(I4),
        .I1(Q[0]),
        .I2(si_rs_awvalid),
        .I3(Q[1]),
        .I4(I9),
        .I5(I10),
        .O(O6));
(* SOFT_HLUTNM = "soft_lutpair99" *) 
   LUT4 #(
    .INIT(16'hAA8A)) 
     \wrap_cnt_r[3]_i_3 
       (.I0(I3),
        .I1(Q[0]),
        .I2(si_rs_awvalid),
        .I3(Q[1]),
        .O(O7));
LUT6 #(
    .INIT(64'hAA8AAA8AAA8AAABA)) 
     \wrap_second_len_r[0]_i_1 
       (.I0(I3),
        .I1(Q[0]),
        .I2(si_rs_awvalid),
        .I3(Q[1]),
        .I4(I6),
        .I5(I7),
        .O(O5));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_b2s_wrap_cmd" *) 
module axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_wrap_cmd
   (O2,
    O6,
    m_axi_awaddr,
    O8,
    O9,
    wrap_next_pending,
    aclk,
    E,
    I6,
    I11,
    axaddr_incr_reg,
    I15,
    I16,
    I17,
    I18,
    I19,
    I20,
    I21,
    b_push,
    I12,
    si_rs_awvalid,
    areset_d1);
  output O2;
  output O6;
  output [11:0]m_axi_awaddr;
  output [3:0]O8;
  output [3:0]O9;
  input wrap_next_pending;
  input aclk;
  input [0:0]E;
  input [18:0]I6;
  input I11;
  input [11:0]axaddr_incr_reg;
  input I15;
  input [3:0]I16;
  input [3:0]I17;
  input [0:0]I18;
  input [3:0]I19;
  input [6:0]I20;
  input [0:0]I21;
  input b_push;
  input [1:0]I12;
  input si_rs_awvalid;
  input areset_d1;

  wire [0:0]E;
  wire I11;
  wire [1:0]I12;
  wire I15;
  wire [3:0]I16;
  wire [3:0]I17;
  wire [0:0]I18;
  wire [3:0]I19;
  wire [6:0]I20;
  wire [0:0]I21;
  wire [18:0]I6;
  wire O2;
  wire O6;
  wire [3:0]O8;
  wire [3:0]O9;
  wire aclk;
  wire areset_d1;
  wire [11:0]axaddr_incr_reg;
  wire [11:0]axaddr_wrap;
  wire [11:0]axaddr_wrap0;
  wire b_push;
  wire [11:0]m_axi_awaddr;
  wire \n_0_axaddr_wrap[0]_i_1 ;
  wire \n_0_axaddr_wrap[10]_i_1 ;
  wire \n_0_axaddr_wrap[11]_i_2 ;
  wire \n_0_axaddr_wrap[11]_i_4 ;
  wire \n_0_axaddr_wrap[11]_i_5 ;
  wire \n_0_axaddr_wrap[11]_i_6 ;
  wire \n_0_axaddr_wrap[11]_i_7 ;
  wire \n_0_axaddr_wrap[11]_i_8 ;
  wire \n_0_axaddr_wrap[11]_i_9 ;
  wire \n_0_axaddr_wrap[1]_i_1 ;
  wire \n_0_axaddr_wrap[2]_i_1 ;
  wire \n_0_axaddr_wrap[3]_i_1 ;
  wire \n_0_axaddr_wrap[3]_i_3 ;
  wire \n_0_axaddr_wrap[3]_i_4 ;
  wire \n_0_axaddr_wrap[3]_i_5 ;
  wire \n_0_axaddr_wrap[3]_i_6 ;
  wire \n_0_axaddr_wrap[4]_i_1 ;
  wire \n_0_axaddr_wrap[5]_i_1 ;
  wire \n_0_axaddr_wrap[6]_i_1 ;
  wire \n_0_axaddr_wrap[7]_i_1 ;
  wire \n_0_axaddr_wrap[7]_i_3 ;
  wire \n_0_axaddr_wrap[7]_i_4 ;
  wire \n_0_axaddr_wrap[7]_i_5 ;
  wire \n_0_axaddr_wrap[7]_i_6 ;
  wire \n_0_axaddr_wrap[8]_i_1 ;
  wire \n_0_axaddr_wrap[9]_i_1 ;
  wire \n_0_axaddr_wrap_reg[3]_i_2 ;
  wire \n_0_axaddr_wrap_reg[7]_i_2 ;
  wire \n_0_axlen_cnt[0]_i_1__0 ;
  wire \n_0_axlen_cnt[1]_i_1__0 ;
  wire \n_0_axlen_cnt[2]_i_1__0 ;
  wire \n_0_axlen_cnt[3]_i_2__0 ;
  wire \n_0_axlen_cnt_reg[0] ;
  wire \n_0_axlen_cnt_reg[1] ;
  wire \n_0_axlen_cnt_reg[2] ;
  wire \n_0_axlen_cnt_reg[3] ;
  wire n_0_sel_first_i_1;
  wire n_0_sel_first_reg;
  wire \n_1_axaddr_wrap_reg[11]_i_3 ;
  wire \n_1_axaddr_wrap_reg[3]_i_2 ;
  wire \n_1_axaddr_wrap_reg[7]_i_2 ;
  wire \n_2_axaddr_wrap_reg[11]_i_3 ;
  wire \n_2_axaddr_wrap_reg[3]_i_2 ;
  wire \n_2_axaddr_wrap_reg[7]_i_2 ;
  wire \n_3_axaddr_wrap_reg[11]_i_3 ;
  wire \n_3_axaddr_wrap_reg[3]_i_2 ;
  wire \n_3_axaddr_wrap_reg[7]_i_2 ;
  wire si_rs_awvalid;
  wire [11:0]wrap_boundary_axaddr_r;
  wire [3:0]wrap_cnt_r;
  wire wrap_next_pending;
  wire [3:3]\NLW_axaddr_wrap_reg[11]_i_3_CO_UNCONNECTED ;

FDRE \axaddr_offset_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(I16[0]),
        .Q(O8[0]),
        .R(1'b0));
FDRE \axaddr_offset_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(I16[1]),
        .Q(O8[1]),
        .R(1'b0));
FDRE \axaddr_offset_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(I16[2]),
        .Q(O8[2]),
        .R(1'b0));
FDRE \axaddr_offset_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(I16[3]),
        .Q(O8[3]),
        .R(1'b0));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[0]_i_1 
       (.I0(I6[0]),
        .I1(I11),
        .I2(axaddr_wrap0[0]),
        .I3(\n_0_axaddr_wrap[11]_i_4 ),
        .I4(wrap_boundary_axaddr_r[0]),
        .O(\n_0_axaddr_wrap[0]_i_1 ));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[10]_i_1 
       (.I0(I6[10]),
        .I1(I11),
        .I2(axaddr_wrap0[10]),
        .I3(\n_0_axaddr_wrap[11]_i_4 ),
        .I4(wrap_boundary_axaddr_r[10]),
        .O(\n_0_axaddr_wrap[10]_i_1 ));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[11]_i_2 
       (.I0(I6[11]),
        .I1(I11),
        .I2(axaddr_wrap0[11]),
        .I3(\n_0_axaddr_wrap[11]_i_4 ),
        .I4(wrap_boundary_axaddr_r[11]),
        .O(\n_0_axaddr_wrap[11]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair103" *) 
   LUT3 #(
    .INIT(8'h6F)) 
     \axaddr_wrap[11]_i_4 
       (.I0(wrap_cnt_r[3]),
        .I1(\n_0_axlen_cnt_reg[3] ),
        .I2(\n_0_axaddr_wrap[11]_i_9 ),
        .O(\n_0_axaddr_wrap[11]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_wrap[11]_i_5 
       (.I0(axaddr_wrap[11]),
        .O(\n_0_axaddr_wrap[11]_i_5 ));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_wrap[11]_i_6 
       (.I0(axaddr_wrap[10]),
        .O(\n_0_axaddr_wrap[11]_i_6 ));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_wrap[11]_i_7 
       (.I0(axaddr_wrap[9]),
        .O(\n_0_axaddr_wrap[11]_i_7 ));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_wrap[11]_i_8 
       (.I0(axaddr_wrap[8]),
        .O(\n_0_axaddr_wrap[11]_i_8 ));
LUT6 #(
    .INIT(64'h9009000000009009)) 
     \axaddr_wrap[11]_i_9 
       (.I0(wrap_cnt_r[0]),
        .I1(\n_0_axlen_cnt_reg[0] ),
        .I2(\n_0_axlen_cnt_reg[2] ),
        .I3(wrap_cnt_r[2]),
        .I4(\n_0_axlen_cnt_reg[1] ),
        .I5(wrap_cnt_r[1]),
        .O(\n_0_axaddr_wrap[11]_i_9 ));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[1]_i_1 
       (.I0(I6[1]),
        .I1(I11),
        .I2(axaddr_wrap0[1]),
        .I3(\n_0_axaddr_wrap[11]_i_4 ),
        .I4(wrap_boundary_axaddr_r[1]),
        .O(\n_0_axaddr_wrap[1]_i_1 ));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[2]_i_1 
       (.I0(I6[2]),
        .I1(I11),
        .I2(axaddr_wrap0[2]),
        .I3(\n_0_axaddr_wrap[11]_i_4 ),
        .I4(wrap_boundary_axaddr_r[2]),
        .O(\n_0_axaddr_wrap[2]_i_1 ));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[3]_i_1 
       (.I0(I6[3]),
        .I1(I11),
        .I2(axaddr_wrap0[3]),
        .I3(\n_0_axaddr_wrap[11]_i_4 ),
        .I4(wrap_boundary_axaddr_r[3]),
        .O(\n_0_axaddr_wrap[3]_i_1 ));
LUT3 #(
    .INIT(8'h6A)) 
     \axaddr_wrap[3]_i_3 
       (.I0(axaddr_wrap[3]),
        .I1(I6[12]),
        .I2(I6[13]),
        .O(\n_0_axaddr_wrap[3]_i_3 ));
LUT3 #(
    .INIT(8'h9A)) 
     \axaddr_wrap[3]_i_4 
       (.I0(axaddr_wrap[2]),
        .I1(I6[12]),
        .I2(I6[13]),
        .O(\n_0_axaddr_wrap[3]_i_4 ));
LUT3 #(
    .INIT(8'h9A)) 
     \axaddr_wrap[3]_i_5 
       (.I0(axaddr_wrap[1]),
        .I1(I6[13]),
        .I2(I6[12]),
        .O(\n_0_axaddr_wrap[3]_i_5 ));
LUT3 #(
    .INIT(8'hA9)) 
     \axaddr_wrap[3]_i_6 
       (.I0(axaddr_wrap[0]),
        .I1(I6[12]),
        .I2(I6[13]),
        .O(\n_0_axaddr_wrap[3]_i_6 ));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[4]_i_1 
       (.I0(I6[4]),
        .I1(I11),
        .I2(axaddr_wrap0[4]),
        .I3(\n_0_axaddr_wrap[11]_i_4 ),
        .I4(wrap_boundary_axaddr_r[4]),
        .O(\n_0_axaddr_wrap[4]_i_1 ));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[5]_i_1 
       (.I0(I6[5]),
        .I1(I11),
        .I2(axaddr_wrap0[5]),
        .I3(\n_0_axaddr_wrap[11]_i_4 ),
        .I4(wrap_boundary_axaddr_r[5]),
        .O(\n_0_axaddr_wrap[5]_i_1 ));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[6]_i_1 
       (.I0(I6[6]),
        .I1(I11),
        .I2(axaddr_wrap0[6]),
        .I3(\n_0_axaddr_wrap[11]_i_4 ),
        .I4(wrap_boundary_axaddr_r[6]),
        .O(\n_0_axaddr_wrap[6]_i_1 ));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[7]_i_1 
       (.I0(I6[7]),
        .I1(I11),
        .I2(axaddr_wrap0[7]),
        .I3(\n_0_axaddr_wrap[11]_i_4 ),
        .I4(wrap_boundary_axaddr_r[7]),
        .O(\n_0_axaddr_wrap[7]_i_1 ));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_wrap[7]_i_3 
       (.I0(axaddr_wrap[7]),
        .O(\n_0_axaddr_wrap[7]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_wrap[7]_i_4 
       (.I0(axaddr_wrap[6]),
        .O(\n_0_axaddr_wrap[7]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_wrap[7]_i_5 
       (.I0(axaddr_wrap[5]),
        .O(\n_0_axaddr_wrap[7]_i_5 ));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_wrap[7]_i_6 
       (.I0(axaddr_wrap[4]),
        .O(\n_0_axaddr_wrap[7]_i_6 ));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[8]_i_1 
       (.I0(I6[8]),
        .I1(I11),
        .I2(axaddr_wrap0[8]),
        .I3(\n_0_axaddr_wrap[11]_i_4 ),
        .I4(wrap_boundary_axaddr_r[8]),
        .O(\n_0_axaddr_wrap[8]_i_1 ));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[9]_i_1 
       (.I0(I6[9]),
        .I1(I11),
        .I2(axaddr_wrap0[9]),
        .I3(\n_0_axaddr_wrap[11]_i_4 ),
        .I4(wrap_boundary_axaddr_r[9]),
        .O(\n_0_axaddr_wrap[9]_i_1 ));
FDRE \axaddr_wrap_reg[0] 
       (.C(aclk),
        .CE(I21),
        .D(\n_0_axaddr_wrap[0]_i_1 ),
        .Q(axaddr_wrap[0]),
        .R(1'b0));
FDRE \axaddr_wrap_reg[10] 
       (.C(aclk),
        .CE(I21),
        .D(\n_0_axaddr_wrap[10]_i_1 ),
        .Q(axaddr_wrap[10]),
        .R(1'b0));
FDRE \axaddr_wrap_reg[11] 
       (.C(aclk),
        .CE(I21),
        .D(\n_0_axaddr_wrap[11]_i_2 ),
        .Q(axaddr_wrap[11]),
        .R(1'b0));
CARRY4 \axaddr_wrap_reg[11]_i_3 
       (.CI(\n_0_axaddr_wrap_reg[7]_i_2 ),
        .CO({\NLW_axaddr_wrap_reg[11]_i_3_CO_UNCONNECTED [3],\n_1_axaddr_wrap_reg[11]_i_3 ,\n_2_axaddr_wrap_reg[11]_i_3 ,\n_3_axaddr_wrap_reg[11]_i_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(axaddr_wrap0[11:8]),
        .S({\n_0_axaddr_wrap[11]_i_5 ,\n_0_axaddr_wrap[11]_i_6 ,\n_0_axaddr_wrap[11]_i_7 ,\n_0_axaddr_wrap[11]_i_8 }));
FDRE \axaddr_wrap_reg[1] 
       (.C(aclk),
        .CE(I21),
        .D(\n_0_axaddr_wrap[1]_i_1 ),
        .Q(axaddr_wrap[1]),
        .R(1'b0));
FDRE \axaddr_wrap_reg[2] 
       (.C(aclk),
        .CE(I21),
        .D(\n_0_axaddr_wrap[2]_i_1 ),
        .Q(axaddr_wrap[2]),
        .R(1'b0));
FDRE \axaddr_wrap_reg[3] 
       (.C(aclk),
        .CE(I21),
        .D(\n_0_axaddr_wrap[3]_i_1 ),
        .Q(axaddr_wrap[3]),
        .R(1'b0));
CARRY4 \axaddr_wrap_reg[3]_i_2 
       (.CI(1'b0),
        .CO({\n_0_axaddr_wrap_reg[3]_i_2 ,\n_1_axaddr_wrap_reg[3]_i_2 ,\n_2_axaddr_wrap_reg[3]_i_2 ,\n_3_axaddr_wrap_reg[3]_i_2 }),
        .CYINIT(1'b0),
        .DI(axaddr_wrap[3:0]),
        .O(axaddr_wrap0[3:0]),
        .S({\n_0_axaddr_wrap[3]_i_3 ,\n_0_axaddr_wrap[3]_i_4 ,\n_0_axaddr_wrap[3]_i_5 ,\n_0_axaddr_wrap[3]_i_6 }));
FDRE \axaddr_wrap_reg[4] 
       (.C(aclk),
        .CE(I21),
        .D(\n_0_axaddr_wrap[4]_i_1 ),
        .Q(axaddr_wrap[4]),
        .R(1'b0));
FDRE \axaddr_wrap_reg[5] 
       (.C(aclk),
        .CE(I21),
        .D(\n_0_axaddr_wrap[5]_i_1 ),
        .Q(axaddr_wrap[5]),
        .R(1'b0));
FDRE \axaddr_wrap_reg[6] 
       (.C(aclk),
        .CE(I21),
        .D(\n_0_axaddr_wrap[6]_i_1 ),
        .Q(axaddr_wrap[6]),
        .R(1'b0));
FDRE \axaddr_wrap_reg[7] 
       (.C(aclk),
        .CE(I21),
        .D(\n_0_axaddr_wrap[7]_i_1 ),
        .Q(axaddr_wrap[7]),
        .R(1'b0));
CARRY4 \axaddr_wrap_reg[7]_i_2 
       (.CI(\n_0_axaddr_wrap_reg[3]_i_2 ),
        .CO({\n_0_axaddr_wrap_reg[7]_i_2 ,\n_1_axaddr_wrap_reg[7]_i_2 ,\n_2_axaddr_wrap_reg[7]_i_2 ,\n_3_axaddr_wrap_reg[7]_i_2 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(axaddr_wrap0[7:4]),
        .S({\n_0_axaddr_wrap[7]_i_3 ,\n_0_axaddr_wrap[7]_i_4 ,\n_0_axaddr_wrap[7]_i_5 ,\n_0_axaddr_wrap[7]_i_6 }));
FDRE \axaddr_wrap_reg[8] 
       (.C(aclk),
        .CE(I21),
        .D(\n_0_axaddr_wrap[8]_i_1 ),
        .Q(axaddr_wrap[8]),
        .R(1'b0));
FDRE \axaddr_wrap_reg[9] 
       (.C(aclk),
        .CE(I21),
        .D(\n_0_axaddr_wrap[9]_i_1 ),
        .Q(axaddr_wrap[9]),
        .R(1'b0));
LUT6 #(
    .INIT(64'hFFFF555400005554)) 
     \axlen_cnt[0]_i_1__0 
       (.I0(\n_0_axlen_cnt_reg[0] ),
        .I1(\n_0_axlen_cnt_reg[1] ),
        .I2(\n_0_axlen_cnt_reg[2] ),
        .I3(\n_0_axlen_cnt_reg[3] ),
        .I4(E),
        .I5(I6[15]),
        .O(\n_0_axlen_cnt[0]_i_1__0 ));
LUT6 #(
    .INIT(64'hAAC3AAC3AAC3AAC0)) 
     \axlen_cnt[1]_i_1__0 
       (.I0(I6[16]),
        .I1(\n_0_axlen_cnt_reg[0] ),
        .I2(\n_0_axlen_cnt_reg[1] ),
        .I3(E),
        .I4(\n_0_axlen_cnt_reg[2] ),
        .I5(\n_0_axlen_cnt_reg[3] ),
        .O(\n_0_axlen_cnt[1]_i_1__0 ));
LUT6 #(
    .INIT(64'hAAAACCC3AAAACCC0)) 
     \axlen_cnt[2]_i_1__0 
       (.I0(I6[17]),
        .I1(\n_0_axlen_cnt_reg[2] ),
        .I2(\n_0_axlen_cnt_reg[1] ),
        .I3(\n_0_axlen_cnt_reg[0] ),
        .I4(E),
        .I5(\n_0_axlen_cnt_reg[3] ),
        .O(\n_0_axlen_cnt[2]_i_1__0 ));
LUT6 #(
    .INIT(64'hFFFFAAA80000AAA8)) 
     \axlen_cnt[3]_i_2__0 
       (.I0(\n_0_axlen_cnt_reg[3] ),
        .I1(\n_0_axlen_cnt_reg[2] ),
        .I2(\n_0_axlen_cnt_reg[0] ),
        .I3(\n_0_axlen_cnt_reg[1] ),
        .I4(E),
        .I5(I6[18]),
        .O(\n_0_axlen_cnt[3]_i_2__0 ));
FDRE \axlen_cnt_reg[0] 
       (.C(aclk),
        .CE(I18),
        .D(\n_0_axlen_cnt[0]_i_1__0 ),
        .Q(\n_0_axlen_cnt_reg[0] ),
        .R(1'b0));
FDRE \axlen_cnt_reg[1] 
       (.C(aclk),
        .CE(I18),
        .D(\n_0_axlen_cnt[1]_i_1__0 ),
        .Q(\n_0_axlen_cnt_reg[1] ),
        .R(1'b0));
FDRE \axlen_cnt_reg[2] 
       (.C(aclk),
        .CE(I18),
        .D(\n_0_axlen_cnt[2]_i_1__0 ),
        .Q(\n_0_axlen_cnt_reg[2] ),
        .R(1'b0));
FDRE \axlen_cnt_reg[3] 
       (.C(aclk),
        .CE(I18),
        .D(\n_0_axlen_cnt[3]_i_2__0 ),
        .Q(\n_0_axlen_cnt_reg[3] ),
        .R(1'b0));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_awaddr[0]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(axaddr_wrap[0]),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[0]),
        .I4(I15),
        .I5(I6[0]),
        .O(m_axi_awaddr[0]));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_awaddr[10]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(axaddr_wrap[10]),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[10]),
        .I4(I15),
        .I5(I6[10]),
        .O(m_axi_awaddr[10]));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_awaddr[11]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(axaddr_wrap[11]),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[11]),
        .I4(I15),
        .I5(I6[11]),
        .O(m_axi_awaddr[11]));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_awaddr[1]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(axaddr_wrap[1]),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[1]),
        .I4(I15),
        .I5(I6[1]),
        .O(m_axi_awaddr[1]));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_awaddr[2]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(axaddr_wrap[2]),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[2]),
        .I4(I15),
        .I5(I6[2]),
        .O(m_axi_awaddr[2]));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_awaddr[3]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(axaddr_wrap[3]),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[3]),
        .I4(I15),
        .I5(I6[3]),
        .O(m_axi_awaddr[3]));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_awaddr[4]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(axaddr_wrap[4]),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[4]),
        .I4(I15),
        .I5(I6[4]),
        .O(m_axi_awaddr[4]));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_awaddr[5]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(axaddr_wrap[5]),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[5]),
        .I4(I15),
        .I5(I6[5]),
        .O(m_axi_awaddr[5]));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_awaddr[6]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(axaddr_wrap[6]),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[6]),
        .I4(I15),
        .I5(I6[6]),
        .O(m_axi_awaddr[6]));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_awaddr[7]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(axaddr_wrap[7]),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[7]),
        .I4(I15),
        .I5(I6[7]),
        .O(m_axi_awaddr[7]));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_awaddr[8]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(axaddr_wrap[8]),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[8]),
        .I4(I15),
        .I5(I6[8]),
        .O(m_axi_awaddr[8]));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_awaddr[9]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(axaddr_wrap[9]),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[9]),
        .I4(I15),
        .I5(I6[9]),
        .O(m_axi_awaddr[9]));
(* SOFT_HLUTNM = "soft_lutpair103" *) 
   LUT3 #(
    .INIT(8'h01)) 
     next_pending_r_i_2__0
       (.I0(\n_0_axlen_cnt_reg[3] ),
        .I1(\n_0_axlen_cnt_reg[2] ),
        .I2(\n_0_axlen_cnt_reg[1] ),
        .O(O6));
FDRE next_pending_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(wrap_next_pending),
        .Q(O2),
        .R(1'b0));
LUT6 #(
    .INIT(64'hFFFFFFFF44440F04)) 
     sel_first_i_1
       (.I0(b_push),
        .I1(n_0_sel_first_reg),
        .I2(I12[1]),
        .I3(si_rs_awvalid),
        .I4(I12[0]),
        .I5(areset_d1),
        .O(n_0_sel_first_i_1));
FDRE sel_first_reg
       (.C(aclk),
        .CE(1'b1),
        .D(n_0_sel_first_i_1),
        .Q(n_0_sel_first_reg),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(I20[0]),
        .Q(wrap_boundary_axaddr_r[0]),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(I6[10]),
        .Q(wrap_boundary_axaddr_r[10]),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(I6[11]),
        .Q(wrap_boundary_axaddr_r[11]),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(I20[1]),
        .Q(wrap_boundary_axaddr_r[1]),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(I20[2]),
        .Q(wrap_boundary_axaddr_r[2]),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(I20[3]),
        .Q(wrap_boundary_axaddr_r[3]),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(I20[4]),
        .Q(wrap_boundary_axaddr_r[4]),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(I20[5]),
        .Q(wrap_boundary_axaddr_r[5]),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(I20[6]),
        .Q(wrap_boundary_axaddr_r[6]),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(I6[7]),
        .Q(wrap_boundary_axaddr_r[7]),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(I6[8]),
        .Q(wrap_boundary_axaddr_r[8]),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(I6[9]),
        .Q(wrap_boundary_axaddr_r[9]),
        .R(1'b0));
FDRE \wrap_cnt_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(I19[0]),
        .Q(wrap_cnt_r[0]),
        .R(1'b0));
FDRE \wrap_cnt_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(I19[1]),
        .Q(wrap_cnt_r[1]),
        .R(1'b0));
FDRE \wrap_cnt_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(I19[2]),
        .Q(wrap_cnt_r[2]),
        .R(1'b0));
FDRE \wrap_cnt_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(I19[3]),
        .Q(wrap_cnt_r[3]),
        .R(1'b0));
FDRE \wrap_second_len_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(I17[0]),
        .Q(O9[0]),
        .R(1'b0));
FDRE \wrap_second_len_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(I17[1]),
        .Q(O9[1]),
        .R(1'b0));
FDRE \wrap_second_len_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(I17[2]),
        .Q(O9[2]),
        .R(1'b0));
FDRE \wrap_second_len_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(I17[3]),
        .Q(O9[3]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_b2s_wrap_cmd" *) 
module axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_wrap_cmd_3
   (O1,
    O4,
    m_axi_araddr,
    O7,
    O8,
    wrap_next_pending,
    aclk,
    E,
    I6,
    I11,
    axaddr_incr_reg,
    I13,
    I17,
    I18,
    I19,
    I20,
    I21,
    I22,
    m_axi_arready,
    I14,
    si_rs_arvalid,
    areset_d1);
  output O1;
  output O4;
  output [11:0]m_axi_araddr;
  output [3:0]O7;
  output [3:0]O8;
  input wrap_next_pending;
  input aclk;
  input [0:0]E;
  input [18:0]I6;
  input I11;
  input [11:0]axaddr_incr_reg;
  input I13;
  input [3:0]I17;
  input [3:0]I18;
  input [0:0]I19;
  input [3:0]I20;
  input [6:0]I21;
  input [0:0]I22;
  input m_axi_arready;
  input [1:0]I14;
  input si_rs_arvalid;
  input areset_d1;

  wire [0:0]E;
  wire I11;
  wire I13;
  wire [1:0]I14;
  wire [3:0]I17;
  wire [3:0]I18;
  wire [0:0]I19;
  wire [3:0]I20;
  wire [6:0]I21;
  wire [0:0]I22;
  wire [18:0]I6;
  wire O1;
  wire O4;
  wire [3:0]O7;
  wire [3:0]O8;
  wire aclk;
  wire areset_d1;
  wire [11:0]axaddr_incr_reg;
  wire [11:0]m_axi_araddr;
  wire m_axi_arready;
  wire \n_0_axaddr_wrap[0]_i_1__0 ;
  wire \n_0_axaddr_wrap[10]_i_1__0 ;
  wire \n_0_axaddr_wrap[11]_i_2__0 ;
  wire \n_0_axaddr_wrap[11]_i_4__0 ;
  wire \n_0_axaddr_wrap[11]_i_5__0 ;
  wire \n_0_axaddr_wrap[11]_i_6__0 ;
  wire \n_0_axaddr_wrap[11]_i_7__0 ;
  wire \n_0_axaddr_wrap[11]_i_8__0 ;
  wire \n_0_axaddr_wrap[11]_i_9__0 ;
  wire \n_0_axaddr_wrap[1]_i_1__0 ;
  wire \n_0_axaddr_wrap[2]_i_1__0 ;
  wire \n_0_axaddr_wrap[3]_i_1__0 ;
  wire \n_0_axaddr_wrap[3]_i_3 ;
  wire \n_0_axaddr_wrap[3]_i_4 ;
  wire \n_0_axaddr_wrap[3]_i_5 ;
  wire \n_0_axaddr_wrap[3]_i_6 ;
  wire \n_0_axaddr_wrap[4]_i_1__0 ;
  wire \n_0_axaddr_wrap[5]_i_1__0 ;
  wire \n_0_axaddr_wrap[6]_i_1__0 ;
  wire \n_0_axaddr_wrap[7]_i_1__0 ;
  wire \n_0_axaddr_wrap[7]_i_3__0 ;
  wire \n_0_axaddr_wrap[7]_i_4__0 ;
  wire \n_0_axaddr_wrap[7]_i_5__0 ;
  wire \n_0_axaddr_wrap[7]_i_6__0 ;
  wire \n_0_axaddr_wrap[8]_i_1__0 ;
  wire \n_0_axaddr_wrap[9]_i_1__0 ;
  wire \n_0_axaddr_wrap_reg[0] ;
  wire \n_0_axaddr_wrap_reg[10] ;
  wire \n_0_axaddr_wrap_reg[11] ;
  wire \n_0_axaddr_wrap_reg[1] ;
  wire \n_0_axaddr_wrap_reg[2] ;
  wire \n_0_axaddr_wrap_reg[3] ;
  wire \n_0_axaddr_wrap_reg[3]_i_2 ;
  wire \n_0_axaddr_wrap_reg[4] ;
  wire \n_0_axaddr_wrap_reg[5] ;
  wire \n_0_axaddr_wrap_reg[6] ;
  wire \n_0_axaddr_wrap_reg[7] ;
  wire \n_0_axaddr_wrap_reg[7]_i_2 ;
  wire \n_0_axaddr_wrap_reg[8] ;
  wire \n_0_axaddr_wrap_reg[9] ;
  wire \n_0_axlen_cnt[0]_i_1__2 ;
  wire \n_0_axlen_cnt[1]_i_1__2 ;
  wire \n_0_axlen_cnt[2]_i_1__2 ;
  wire \n_0_axlen_cnt[3]_i_2__2 ;
  wire \n_0_axlen_cnt_reg[0] ;
  wire \n_0_axlen_cnt_reg[1] ;
  wire \n_0_axlen_cnt_reg[2] ;
  wire \n_0_axlen_cnt_reg[3] ;
  wire n_0_sel_first_i_1;
  wire n_0_sel_first_reg;
  wire \n_0_wrap_boundary_axaddr_r_reg[0] ;
  wire \n_0_wrap_boundary_axaddr_r_reg[10] ;
  wire \n_0_wrap_boundary_axaddr_r_reg[11] ;
  wire \n_0_wrap_boundary_axaddr_r_reg[1] ;
  wire \n_0_wrap_boundary_axaddr_r_reg[2] ;
  wire \n_0_wrap_boundary_axaddr_r_reg[3] ;
  wire \n_0_wrap_boundary_axaddr_r_reg[4] ;
  wire \n_0_wrap_boundary_axaddr_r_reg[5] ;
  wire \n_0_wrap_boundary_axaddr_r_reg[6] ;
  wire \n_0_wrap_boundary_axaddr_r_reg[7] ;
  wire \n_0_wrap_boundary_axaddr_r_reg[8] ;
  wire \n_0_wrap_boundary_axaddr_r_reg[9] ;
  wire \n_0_wrap_cnt_r_reg[0] ;
  wire \n_0_wrap_cnt_r_reg[1] ;
  wire \n_0_wrap_cnt_r_reg[2] ;
  wire \n_0_wrap_cnt_r_reg[3] ;
  wire \n_1_axaddr_wrap_reg[11]_i_3 ;
  wire \n_1_axaddr_wrap_reg[3]_i_2 ;
  wire \n_1_axaddr_wrap_reg[7]_i_2 ;
  wire \n_2_axaddr_wrap_reg[11]_i_3 ;
  wire \n_2_axaddr_wrap_reg[3]_i_2 ;
  wire \n_2_axaddr_wrap_reg[7]_i_2 ;
  wire \n_3_axaddr_wrap_reg[11]_i_3 ;
  wire \n_3_axaddr_wrap_reg[3]_i_2 ;
  wire \n_3_axaddr_wrap_reg[7]_i_2 ;
  wire \n_4_axaddr_wrap_reg[11]_i_3 ;
  wire \n_4_axaddr_wrap_reg[3]_i_2 ;
  wire \n_4_axaddr_wrap_reg[7]_i_2 ;
  wire \n_5_axaddr_wrap_reg[11]_i_3 ;
  wire \n_5_axaddr_wrap_reg[3]_i_2 ;
  wire \n_5_axaddr_wrap_reg[7]_i_2 ;
  wire \n_6_axaddr_wrap_reg[11]_i_3 ;
  wire \n_6_axaddr_wrap_reg[3]_i_2 ;
  wire \n_6_axaddr_wrap_reg[7]_i_2 ;
  wire \n_7_axaddr_wrap_reg[11]_i_3 ;
  wire \n_7_axaddr_wrap_reg[3]_i_2 ;
  wire \n_7_axaddr_wrap_reg[7]_i_2 ;
  wire si_rs_arvalid;
  wire wrap_next_pending;
  wire [3:3]\NLW_axaddr_wrap_reg[11]_i_3_CO_UNCONNECTED ;

FDRE \axaddr_offset_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(I17[0]),
        .Q(O7[0]),
        .R(1'b0));
FDRE \axaddr_offset_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(I17[1]),
        .Q(O7[1]),
        .R(1'b0));
FDRE \axaddr_offset_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(I17[2]),
        .Q(O7[2]),
        .R(1'b0));
FDRE \axaddr_offset_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(I17[3]),
        .Q(O7[3]),
        .R(1'b0));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[0]_i_1__0 
       (.I0(I6[0]),
        .I1(I11),
        .I2(\n_7_axaddr_wrap_reg[3]_i_2 ),
        .I3(\n_0_axaddr_wrap[11]_i_4__0 ),
        .I4(\n_0_wrap_boundary_axaddr_r_reg[0] ),
        .O(\n_0_axaddr_wrap[0]_i_1__0 ));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[10]_i_1__0 
       (.I0(I6[10]),
        .I1(I11),
        .I2(\n_5_axaddr_wrap_reg[11]_i_3 ),
        .I3(\n_0_axaddr_wrap[11]_i_4__0 ),
        .I4(\n_0_wrap_boundary_axaddr_r_reg[10] ),
        .O(\n_0_axaddr_wrap[10]_i_1__0 ));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[11]_i_2__0 
       (.I0(I6[11]),
        .I1(I11),
        .I2(\n_4_axaddr_wrap_reg[11]_i_3 ),
        .I3(\n_0_axaddr_wrap[11]_i_4__0 ),
        .I4(\n_0_wrap_boundary_axaddr_r_reg[11] ),
        .O(\n_0_axaddr_wrap[11]_i_2__0 ));
(* SOFT_HLUTNM = "soft_lutpair9" *) 
   LUT3 #(
    .INIT(8'h6F)) 
     \axaddr_wrap[11]_i_4__0 
       (.I0(\n_0_wrap_cnt_r_reg[3] ),
        .I1(\n_0_axlen_cnt_reg[3] ),
        .I2(\n_0_axaddr_wrap[11]_i_9__0 ),
        .O(\n_0_axaddr_wrap[11]_i_4__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_wrap[11]_i_5__0 
       (.I0(\n_0_axaddr_wrap_reg[11] ),
        .O(\n_0_axaddr_wrap[11]_i_5__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_wrap[11]_i_6__0 
       (.I0(\n_0_axaddr_wrap_reg[10] ),
        .O(\n_0_axaddr_wrap[11]_i_6__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_wrap[11]_i_7__0 
       (.I0(\n_0_axaddr_wrap_reg[9] ),
        .O(\n_0_axaddr_wrap[11]_i_7__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_wrap[11]_i_8__0 
       (.I0(\n_0_axaddr_wrap_reg[8] ),
        .O(\n_0_axaddr_wrap[11]_i_8__0 ));
LUT6 #(
    .INIT(64'h9009000000009009)) 
     \axaddr_wrap[11]_i_9__0 
       (.I0(\n_0_axlen_cnt_reg[1] ),
        .I1(\n_0_wrap_cnt_r_reg[1] ),
        .I2(\n_0_axlen_cnt_reg[2] ),
        .I3(\n_0_wrap_cnt_r_reg[2] ),
        .I4(\n_0_wrap_cnt_r_reg[0] ),
        .I5(\n_0_axlen_cnt_reg[0] ),
        .O(\n_0_axaddr_wrap[11]_i_9__0 ));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[1]_i_1__0 
       (.I0(I6[1]),
        .I1(I11),
        .I2(\n_6_axaddr_wrap_reg[3]_i_2 ),
        .I3(\n_0_axaddr_wrap[11]_i_4__0 ),
        .I4(\n_0_wrap_boundary_axaddr_r_reg[1] ),
        .O(\n_0_axaddr_wrap[1]_i_1__0 ));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[2]_i_1__0 
       (.I0(I6[2]),
        .I1(I11),
        .I2(\n_5_axaddr_wrap_reg[3]_i_2 ),
        .I3(\n_0_axaddr_wrap[11]_i_4__0 ),
        .I4(\n_0_wrap_boundary_axaddr_r_reg[2] ),
        .O(\n_0_axaddr_wrap[2]_i_1__0 ));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[3]_i_1__0 
       (.I0(I6[3]),
        .I1(I11),
        .I2(\n_4_axaddr_wrap_reg[3]_i_2 ),
        .I3(\n_0_axaddr_wrap[11]_i_4__0 ),
        .I4(\n_0_wrap_boundary_axaddr_r_reg[3] ),
        .O(\n_0_axaddr_wrap[3]_i_1__0 ));
LUT3 #(
    .INIT(8'h6A)) 
     \axaddr_wrap[3]_i_3 
       (.I0(\n_0_axaddr_wrap_reg[3] ),
        .I1(I6[12]),
        .I2(I6[13]),
        .O(\n_0_axaddr_wrap[3]_i_3 ));
LUT3 #(
    .INIT(8'h9A)) 
     \axaddr_wrap[3]_i_4 
       (.I0(\n_0_axaddr_wrap_reg[2] ),
        .I1(I6[12]),
        .I2(I6[13]),
        .O(\n_0_axaddr_wrap[3]_i_4 ));
LUT3 #(
    .INIT(8'h9A)) 
     \axaddr_wrap[3]_i_5 
       (.I0(\n_0_axaddr_wrap_reg[1] ),
        .I1(I6[13]),
        .I2(I6[12]),
        .O(\n_0_axaddr_wrap[3]_i_5 ));
LUT3 #(
    .INIT(8'hA9)) 
     \axaddr_wrap[3]_i_6 
       (.I0(\n_0_axaddr_wrap_reg[0] ),
        .I1(I6[12]),
        .I2(I6[13]),
        .O(\n_0_axaddr_wrap[3]_i_6 ));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[4]_i_1__0 
       (.I0(I6[4]),
        .I1(I11),
        .I2(\n_7_axaddr_wrap_reg[7]_i_2 ),
        .I3(\n_0_axaddr_wrap[11]_i_4__0 ),
        .I4(\n_0_wrap_boundary_axaddr_r_reg[4] ),
        .O(\n_0_axaddr_wrap[4]_i_1__0 ));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[5]_i_1__0 
       (.I0(I6[5]),
        .I1(I11),
        .I2(\n_6_axaddr_wrap_reg[7]_i_2 ),
        .I3(\n_0_axaddr_wrap[11]_i_4__0 ),
        .I4(\n_0_wrap_boundary_axaddr_r_reg[5] ),
        .O(\n_0_axaddr_wrap[5]_i_1__0 ));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[6]_i_1__0 
       (.I0(I6[6]),
        .I1(I11),
        .I2(\n_5_axaddr_wrap_reg[7]_i_2 ),
        .I3(\n_0_axaddr_wrap[11]_i_4__0 ),
        .I4(\n_0_wrap_boundary_axaddr_r_reg[6] ),
        .O(\n_0_axaddr_wrap[6]_i_1__0 ));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[7]_i_1__0 
       (.I0(I6[7]),
        .I1(I11),
        .I2(\n_4_axaddr_wrap_reg[7]_i_2 ),
        .I3(\n_0_axaddr_wrap[11]_i_4__0 ),
        .I4(\n_0_wrap_boundary_axaddr_r_reg[7] ),
        .O(\n_0_axaddr_wrap[7]_i_1__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_wrap[7]_i_3__0 
       (.I0(\n_0_axaddr_wrap_reg[7] ),
        .O(\n_0_axaddr_wrap[7]_i_3__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_wrap[7]_i_4__0 
       (.I0(\n_0_axaddr_wrap_reg[6] ),
        .O(\n_0_axaddr_wrap[7]_i_4__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_wrap[7]_i_5__0 
       (.I0(\n_0_axaddr_wrap_reg[5] ),
        .O(\n_0_axaddr_wrap[7]_i_5__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_wrap[7]_i_6__0 
       (.I0(\n_0_axaddr_wrap_reg[4] ),
        .O(\n_0_axaddr_wrap[7]_i_6__0 ));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[8]_i_1__0 
       (.I0(I6[8]),
        .I1(I11),
        .I2(\n_7_axaddr_wrap_reg[11]_i_3 ),
        .I3(\n_0_axaddr_wrap[11]_i_4__0 ),
        .I4(\n_0_wrap_boundary_axaddr_r_reg[8] ),
        .O(\n_0_axaddr_wrap[8]_i_1__0 ));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     \axaddr_wrap[9]_i_1__0 
       (.I0(I6[9]),
        .I1(I11),
        .I2(\n_6_axaddr_wrap_reg[11]_i_3 ),
        .I3(\n_0_axaddr_wrap[11]_i_4__0 ),
        .I4(\n_0_wrap_boundary_axaddr_r_reg[9] ),
        .O(\n_0_axaddr_wrap[9]_i_1__0 ));
FDRE \axaddr_wrap_reg[0] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_axaddr_wrap[0]_i_1__0 ),
        .Q(\n_0_axaddr_wrap_reg[0] ),
        .R(1'b0));
FDRE \axaddr_wrap_reg[10] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_axaddr_wrap[10]_i_1__0 ),
        .Q(\n_0_axaddr_wrap_reg[10] ),
        .R(1'b0));
FDRE \axaddr_wrap_reg[11] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_axaddr_wrap[11]_i_2__0 ),
        .Q(\n_0_axaddr_wrap_reg[11] ),
        .R(1'b0));
CARRY4 \axaddr_wrap_reg[11]_i_3 
       (.CI(\n_0_axaddr_wrap_reg[7]_i_2 ),
        .CO({\NLW_axaddr_wrap_reg[11]_i_3_CO_UNCONNECTED [3],\n_1_axaddr_wrap_reg[11]_i_3 ,\n_2_axaddr_wrap_reg[11]_i_3 ,\n_3_axaddr_wrap_reg[11]_i_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_axaddr_wrap_reg[11]_i_3 ,\n_5_axaddr_wrap_reg[11]_i_3 ,\n_6_axaddr_wrap_reg[11]_i_3 ,\n_7_axaddr_wrap_reg[11]_i_3 }),
        .S({\n_0_axaddr_wrap[11]_i_5__0 ,\n_0_axaddr_wrap[11]_i_6__0 ,\n_0_axaddr_wrap[11]_i_7__0 ,\n_0_axaddr_wrap[11]_i_8__0 }));
FDRE \axaddr_wrap_reg[1] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_axaddr_wrap[1]_i_1__0 ),
        .Q(\n_0_axaddr_wrap_reg[1] ),
        .R(1'b0));
FDRE \axaddr_wrap_reg[2] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_axaddr_wrap[2]_i_1__0 ),
        .Q(\n_0_axaddr_wrap_reg[2] ),
        .R(1'b0));
FDRE \axaddr_wrap_reg[3] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_axaddr_wrap[3]_i_1__0 ),
        .Q(\n_0_axaddr_wrap_reg[3] ),
        .R(1'b0));
CARRY4 \axaddr_wrap_reg[3]_i_2 
       (.CI(1'b0),
        .CO({\n_0_axaddr_wrap_reg[3]_i_2 ,\n_1_axaddr_wrap_reg[3]_i_2 ,\n_2_axaddr_wrap_reg[3]_i_2 ,\n_3_axaddr_wrap_reg[3]_i_2 }),
        .CYINIT(1'b0),
        .DI({\n_0_axaddr_wrap_reg[3] ,\n_0_axaddr_wrap_reg[2] ,\n_0_axaddr_wrap_reg[1] ,\n_0_axaddr_wrap_reg[0] }),
        .O({\n_4_axaddr_wrap_reg[3]_i_2 ,\n_5_axaddr_wrap_reg[3]_i_2 ,\n_6_axaddr_wrap_reg[3]_i_2 ,\n_7_axaddr_wrap_reg[3]_i_2 }),
        .S({\n_0_axaddr_wrap[3]_i_3 ,\n_0_axaddr_wrap[3]_i_4 ,\n_0_axaddr_wrap[3]_i_5 ,\n_0_axaddr_wrap[3]_i_6 }));
FDRE \axaddr_wrap_reg[4] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_axaddr_wrap[4]_i_1__0 ),
        .Q(\n_0_axaddr_wrap_reg[4] ),
        .R(1'b0));
FDRE \axaddr_wrap_reg[5] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_axaddr_wrap[5]_i_1__0 ),
        .Q(\n_0_axaddr_wrap_reg[5] ),
        .R(1'b0));
FDRE \axaddr_wrap_reg[6] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_axaddr_wrap[6]_i_1__0 ),
        .Q(\n_0_axaddr_wrap_reg[6] ),
        .R(1'b0));
FDRE \axaddr_wrap_reg[7] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_axaddr_wrap[7]_i_1__0 ),
        .Q(\n_0_axaddr_wrap_reg[7] ),
        .R(1'b0));
CARRY4 \axaddr_wrap_reg[7]_i_2 
       (.CI(\n_0_axaddr_wrap_reg[3]_i_2 ),
        .CO({\n_0_axaddr_wrap_reg[7]_i_2 ,\n_1_axaddr_wrap_reg[7]_i_2 ,\n_2_axaddr_wrap_reg[7]_i_2 ,\n_3_axaddr_wrap_reg[7]_i_2 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_axaddr_wrap_reg[7]_i_2 ,\n_5_axaddr_wrap_reg[7]_i_2 ,\n_6_axaddr_wrap_reg[7]_i_2 ,\n_7_axaddr_wrap_reg[7]_i_2 }),
        .S({\n_0_axaddr_wrap[7]_i_3__0 ,\n_0_axaddr_wrap[7]_i_4__0 ,\n_0_axaddr_wrap[7]_i_5__0 ,\n_0_axaddr_wrap[7]_i_6__0 }));
FDRE \axaddr_wrap_reg[8] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_axaddr_wrap[8]_i_1__0 ),
        .Q(\n_0_axaddr_wrap_reg[8] ),
        .R(1'b0));
FDRE \axaddr_wrap_reg[9] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_axaddr_wrap[9]_i_1__0 ),
        .Q(\n_0_axaddr_wrap_reg[9] ),
        .R(1'b0));
LUT6 #(
    .INIT(64'hFFFF555400005554)) 
     \axlen_cnt[0]_i_1__2 
       (.I0(\n_0_axlen_cnt_reg[0] ),
        .I1(\n_0_axlen_cnt_reg[1] ),
        .I2(\n_0_axlen_cnt_reg[2] ),
        .I3(\n_0_axlen_cnt_reg[3] ),
        .I4(E),
        .I5(I6[15]),
        .O(\n_0_axlen_cnt[0]_i_1__2 ));
LUT6 #(
    .INIT(64'hAAC3AAC3AAC3AAC0)) 
     \axlen_cnt[1]_i_1__2 
       (.I0(I6[16]),
        .I1(\n_0_axlen_cnt_reg[0] ),
        .I2(\n_0_axlen_cnt_reg[1] ),
        .I3(E),
        .I4(\n_0_axlen_cnt_reg[2] ),
        .I5(\n_0_axlen_cnt_reg[3] ),
        .O(\n_0_axlen_cnt[1]_i_1__2 ));
LUT6 #(
    .INIT(64'hAAAACCC3AAAACCC0)) 
     \axlen_cnt[2]_i_1__2 
       (.I0(I6[17]),
        .I1(\n_0_axlen_cnt_reg[2] ),
        .I2(\n_0_axlen_cnt_reg[1] ),
        .I3(\n_0_axlen_cnt_reg[0] ),
        .I4(E),
        .I5(\n_0_axlen_cnt_reg[3] ),
        .O(\n_0_axlen_cnt[2]_i_1__2 ));
LUT6 #(
    .INIT(64'hFFFFAAA80000AAA8)) 
     \axlen_cnt[3]_i_2__2 
       (.I0(\n_0_axlen_cnt_reg[3] ),
        .I1(\n_0_axlen_cnt_reg[2] ),
        .I2(\n_0_axlen_cnt_reg[0] ),
        .I3(\n_0_axlen_cnt_reg[1] ),
        .I4(E),
        .I5(I6[18]),
        .O(\n_0_axlen_cnt[3]_i_2__2 ));
FDRE \axlen_cnt_reg[0] 
       (.C(aclk),
        .CE(I19),
        .D(\n_0_axlen_cnt[0]_i_1__2 ),
        .Q(\n_0_axlen_cnt_reg[0] ),
        .R(1'b0));
FDRE \axlen_cnt_reg[1] 
       (.C(aclk),
        .CE(I19),
        .D(\n_0_axlen_cnt[1]_i_1__2 ),
        .Q(\n_0_axlen_cnt_reg[1] ),
        .R(1'b0));
FDRE \axlen_cnt_reg[2] 
       (.C(aclk),
        .CE(I19),
        .D(\n_0_axlen_cnt[2]_i_1__2 ),
        .Q(\n_0_axlen_cnt_reg[2] ),
        .R(1'b0));
FDRE \axlen_cnt_reg[3] 
       (.C(aclk),
        .CE(I19),
        .D(\n_0_axlen_cnt[3]_i_2__2 ),
        .Q(\n_0_axlen_cnt_reg[3] ),
        .R(1'b0));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_araddr[0]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(\n_0_axaddr_wrap_reg[0] ),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[0]),
        .I4(I13),
        .I5(I6[0]),
        .O(m_axi_araddr[0]));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_araddr[10]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(\n_0_axaddr_wrap_reg[10] ),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[10]),
        .I4(I13),
        .I5(I6[10]),
        .O(m_axi_araddr[10]));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_araddr[11]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(\n_0_axaddr_wrap_reg[11] ),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[11]),
        .I4(I13),
        .I5(I6[11]),
        .O(m_axi_araddr[11]));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_araddr[1]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(\n_0_axaddr_wrap_reg[1] ),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[1]),
        .I4(I13),
        .I5(I6[1]),
        .O(m_axi_araddr[1]));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_araddr[2]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(\n_0_axaddr_wrap_reg[2] ),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[2]),
        .I4(I13),
        .I5(I6[2]),
        .O(m_axi_araddr[2]));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_araddr[3]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(\n_0_axaddr_wrap_reg[3] ),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[3]),
        .I4(I13),
        .I5(I6[3]),
        .O(m_axi_araddr[3]));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_araddr[4]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(\n_0_axaddr_wrap_reg[4] ),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[4]),
        .I4(I13),
        .I5(I6[4]),
        .O(m_axi_araddr[4]));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_araddr[5]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(\n_0_axaddr_wrap_reg[5] ),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[5]),
        .I4(I13),
        .I5(I6[5]),
        .O(m_axi_araddr[5]));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_araddr[6]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(\n_0_axaddr_wrap_reg[6] ),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[6]),
        .I4(I13),
        .I5(I6[6]),
        .O(m_axi_araddr[6]));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_araddr[7]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(\n_0_axaddr_wrap_reg[7] ),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[7]),
        .I4(I13),
        .I5(I6[7]),
        .O(m_axi_araddr[7]));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_araddr[8]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(\n_0_axaddr_wrap_reg[8] ),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[8]),
        .I4(I13),
        .I5(I6[8]),
        .O(m_axi_araddr[8]));
LUT6 #(
    .INIT(64'hEFE0EFEF4F404040)) 
     \m_axi_araddr[9]_INST_0 
       (.I0(n_0_sel_first_reg),
        .I1(\n_0_axaddr_wrap_reg[9] ),
        .I2(I6[14]),
        .I3(axaddr_incr_reg[9]),
        .I4(I13),
        .I5(I6[9]),
        .O(m_axi_araddr[9]));
(* SOFT_HLUTNM = "soft_lutpair9" *) 
   LUT3 #(
    .INIT(8'h01)) 
     next_pending_r_i_2__1
       (.I0(\n_0_axlen_cnt_reg[3] ),
        .I1(\n_0_axlen_cnt_reg[2] ),
        .I2(\n_0_axlen_cnt_reg[1] ),
        .O(O4));
FDRE next_pending_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(wrap_next_pending),
        .Q(O1),
        .R(1'b0));
LUT6 #(
    .INIT(64'hFFFFFFFFA2A2AFAA)) 
     sel_first_i_1
       (.I0(n_0_sel_first_reg),
        .I1(m_axi_arready),
        .I2(I14[1]),
        .I3(si_rs_arvalid),
        .I4(I14[0]),
        .I5(areset_d1),
        .O(n_0_sel_first_i_1));
FDRE sel_first_reg
       (.C(aclk),
        .CE(1'b1),
        .D(n_0_sel_first_i_1),
        .Q(n_0_sel_first_reg),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(I21[0]),
        .Q(\n_0_wrap_boundary_axaddr_r_reg[0] ),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(I6[10]),
        .Q(\n_0_wrap_boundary_axaddr_r_reg[10] ),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(I6[11]),
        .Q(\n_0_wrap_boundary_axaddr_r_reg[11] ),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(I21[1]),
        .Q(\n_0_wrap_boundary_axaddr_r_reg[1] ),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(I21[2]),
        .Q(\n_0_wrap_boundary_axaddr_r_reg[2] ),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(I21[3]),
        .Q(\n_0_wrap_boundary_axaddr_r_reg[3] ),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(I21[4]),
        .Q(\n_0_wrap_boundary_axaddr_r_reg[4] ),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(I21[5]),
        .Q(\n_0_wrap_boundary_axaddr_r_reg[5] ),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(I21[6]),
        .Q(\n_0_wrap_boundary_axaddr_r_reg[6] ),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(I6[7]),
        .Q(\n_0_wrap_boundary_axaddr_r_reg[7] ),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(I6[8]),
        .Q(\n_0_wrap_boundary_axaddr_r_reg[8] ),
        .R(1'b0));
FDRE \wrap_boundary_axaddr_r_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(I6[9]),
        .Q(\n_0_wrap_boundary_axaddr_r_reg[9] ),
        .R(1'b0));
FDRE \wrap_cnt_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(I20[0]),
        .Q(\n_0_wrap_cnt_r_reg[0] ),
        .R(1'b0));
FDRE \wrap_cnt_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(I20[1]),
        .Q(\n_0_wrap_cnt_r_reg[1] ),
        .R(1'b0));
FDRE \wrap_cnt_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(I20[2]),
        .Q(\n_0_wrap_cnt_r_reg[2] ),
        .R(1'b0));
FDRE \wrap_cnt_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(I20[3]),
        .Q(\n_0_wrap_cnt_r_reg[3] ),
        .R(1'b0));
FDRE \wrap_second_len_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(I18[0]),
        .Q(O8[0]),
        .R(1'b0));
FDRE \wrap_second_len_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(I18[1]),
        .Q(O8[1]),
        .R(1'b0));
FDRE \wrap_second_len_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(I18[2]),
        .Q(O8[2]),
        .R(1'b0));
FDRE \wrap_second_len_r_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(I18[3]),
        .Q(O8[3]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_register_slice_v2_1_axi_register_slice" *) 
module axi_protocol_converter_0_axi_register_slice_v2_1_axi_register_slice
   (si_rs_awvalid,
    O1,
    O2,
    si_rs_bready,
    si_rs_arvalid,
    O3,
    O4,
    si_rs_rready,
    Q,
    S,
    O5,
    O6,
    O7,
    I16,
    I17,
    D,
    O8,
    axaddr_offset,
    O9,
    O10,
    O11,
    O12,
    O13,
    shandshake,
    I14,
    O14,
    O15,
    O16,
    O17,
    O18,
    O19,
    O20,
    O21,
    axaddr_incr0,
    O22,
    O23,
    O24,
    O25,
    I26,
    O26,
    O27,
    O28,
    O29,
    O30,
    O31,
    O32,
    O33,
    SR,
    s_axi_bid,
    s_axi_bresp,
    O34,
    aclk,
    I1,
    b_push,
    s_axi_awvalid,
    I2,
    I3,
    m_axi_arready,
    s_axi_rready,
    I4,
    s_axi_bready,
    si_rs_bvalid,
    s_axi_arvalid,
    I5,
    I6,
    I7,
    I8,
    I9,
    I10,
    I11,
    I12,
    I13,
    I15,
    I18,
    sel_first,
    sel_first_0,
    out,
    I19,
    s_axi_awid,
    s_axi_awlen,
    s_axi_awburst,
    s_axi_awsize,
    s_axi_awprot,
    s_axi_awaddr,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arburst,
    s_axi_arsize,
    s_axi_arprot,
    s_axi_araddr,
    I20,
    I21,
    aresetn,
    E,
    I22);
  output si_rs_awvalid;
  output O1;
  output O2;
  output si_rs_bready;
  output si_rs_arvalid;
  output O3;
  output O4;
  output si_rs_rready;
  output [42:0]Q;
  output [0:0]S;
  output [42:0]O5;
  output [3:0]O6;
  output [3:0]O7;
  output [3:0]I16;
  output [3:0]I17;
  output [2:0]D;
  output [2:0]O8;
  output [3:0]axaddr_offset;
  output O9;
  output O10;
  output O11;
  output O12;
  output O13;
  output shandshake;
  output [0:0]I14;
  output [0:0]O14;
  output O15;
  output [2:0]O16;
  output O17;
  output O18;
  output O19;
  output O20;
  output O21;
  output [2:0]axaddr_incr0;
  output O22;
  output O23;
  output O24;
  output O25;
  output [2:0]I26;
  output O26;
  output O27;
  output O28;
  output [6:0]O29;
  output O30;
  output [6:0]O31;
  output O32;
  output O33;
  output [0:0]SR;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output [35:0]O34;
  input aclk;
  input [1:0]I1;
  input b_push;
  input s_axi_awvalid;
  input I2;
  input I3;
  input m_axi_arready;
  input s_axi_rready;
  input I4;
  input s_axi_bready;
  input si_rs_bvalid;
  input s_axi_arvalid;
  input I5;
  input [3:0]I6;
  input I7;
  input I8;
  input [3:0]I9;
  input [0:0]I10;
  input I11;
  input I12;
  input [1:0]I13;
  input [2:0]I15;
  input [1:0]I18;
  input sel_first;
  input sel_first_0;
  input [0:0]out;
  input [1:0]I19;
  input [0:0]s_axi_awid;
  input [3:0]s_axi_awlen;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awsize;
  input [2:0]s_axi_awprot;
  input [31:0]s_axi_awaddr;
  input [0:0]s_axi_arid;
  input [3:0]s_axi_arlen;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arsize;
  input [2:0]s_axi_arprot;
  input [31:0]s_axi_araddr;
  input [1:0]I20;
  input [33:0]I21;
  input aresetn;
  input [0:0]E;
  input [0:0]I22;

  wire [2:0]D;
  wire [0:0]E;
  wire [1:0]I1;
  wire [0:0]I10;
  wire I11;
  wire I12;
  wire [1:0]I13;
  wire [0:0]I14;
  wire [2:0]I15;
  wire [3:0]I16;
  wire [3:0]I17;
  wire [1:0]I18;
  wire [1:0]I19;
  wire I2;
  wire [1:0]I20;
  wire [33:0]I21;
  wire [0:0]I22;
  wire [2:0]I26;
  wire I3;
  wire I4;
  wire I5;
  wire [3:0]I6;
  wire I7;
  wire I8;
  wire [3:0]I9;
  wire O1;
  wire O10;
  wire O11;
  wire O12;
  wire O13;
  wire [0:0]O14;
  wire O15;
  wire [2:0]O16;
  wire O17;
  wire O18;
  wire O19;
  wire O2;
  wire O20;
  wire O21;
  wire O22;
  wire O23;
  wire O24;
  wire O25;
  wire O26;
  wire O27;
  wire O28;
  wire [6:0]O29;
  wire O3;
  wire O30;
  wire [6:0]O31;
  wire O32;
  wire O33;
  wire [35:0]O34;
  wire O4;
  wire [42:0]O5;
  wire [3:0]O6;
  wire [3:0]O7;
  wire [2:0]O8;
  wire O9;
  wire [42:0]Q;
  wire [0:0]S;
  wire [0:0]SR;
  wire aclk;
  wire aresetn;
  wire [2:0]axaddr_incr0;
  wire [3:0]axaddr_offset;
  wire b_push;
  wire m_axi_arready;
  wire [0:0]out;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [0:0]s_axi_arid;
  wire [3:0]s_axi_arlen;
  wire [2:0]s_axi_arprot;
  wire [1:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [0:0]s_axi_awid;
  wire [3:0]s_axi_awlen;
  wire [2:0]s_axi_awprot;
  wire [1:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire [0:0]s_axi_bid;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_rready;
  wire sel_first;
  wire sel_first_0;
  wire shandshake;
  wire si_rs_arvalid;
  wire si_rs_awvalid;
  wire si_rs_bready;
  wire si_rs_bvalid;
  wire si_rs_rready;

axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice ar_pipe
       (.I10(I10),
        .I11(I11),
        .I12(I12),
        .I13(I13),
        .I14(I14),
        .I15(I15),
        .I16(I16),
        .I17(I17),
        .I18(I18),
        .I2(I2),
        .I22(I22),
        .I26(I26),
        .I3(I3),
        .O1(si_rs_arvalid),
        .O14(O14),
        .O15(O15),
        .O16(O16),
        .O17(O17),
        .O18(O18),
        .O19(O19),
        .O2(O3),
        .O20(O20),
        .O25(O25),
        .O26(O26),
        .O27(O27),
        .O28(O28),
        .O30(O30),
        .O31(O31),
        .O33(O33),
        .Q(O5),
        .S(S),
        .SR(SR),
        .aclk(aclk),
        .aresetn(aresetn),
        .m_axi_arready(m_axi_arready),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_arvalid(s_axi_arvalid),
        .sel_first_0(sel_first_0));
axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice_0 aw_pipe
       (.D(D),
        .E(E),
        .I1(I1),
        .I5(I5),
        .I6(I6),
        .I7(I7),
        .I8(I8),
        .I9(I9),
        .O1(si_rs_awvalid),
        .O10(O10),
        .O11(axaddr_offset[3]),
        .O12(O11),
        .O13(O12),
        .O14(O13),
        .O2(O1),
        .O21(O21),
        .O22(O22),
        .O23(O23),
        .O24(O24),
        .O29(O29),
        .O3(axaddr_offset[0]),
        .O32(O32),
        .O4(axaddr_offset[1]),
        .O5(axaddr_offset[2]),
        .O6(O6),
        .O7(O7),
        .O8(O8),
        .O9(O9),
        .Q(Q),
        .SR(SR),
        .aclk(aclk),
        .axaddr_incr0(axaddr_incr0),
        .b_push(b_push),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .sel_first(sel_first));
axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice__parameterized1 b_pipe
       (.I19(I19),
        .O1(O2),
        .O2(si_rs_bready),
        .SR(SR),
        .aclk(aclk),
        .out(out),
        .s_axi_bid(s_axi_bid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .shandshake(shandshake),
        .si_rs_bvalid(si_rs_bvalid));
axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice__parameterized2 r_pipe
       (.I20(I20),
        .I21(I21),
        .I4(I4),
        .O1(O4),
        .O2(si_rs_rready),
        .O34(O34),
        .SR(SR),
        .aclk(aclk),
        .s_axi_rready(s_axi_rready));
endmodule

(* ORIG_REF_NAME = "axi_register_slice_v2_1_axic_register_slice" *) 
module axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice
   (O1,
    O2,
    S,
    Q,
    I16,
    I17,
    I14,
    O14,
    O15,
    O16,
    O17,
    O18,
    O19,
    O20,
    O25,
    I26,
    O26,
    O27,
    O28,
    O30,
    O31,
    O33,
    SR,
    aclk,
    I2,
    I3,
    m_axi_arready,
    s_axi_arvalid,
    I10,
    I11,
    I12,
    I13,
    I15,
    I18,
    sel_first_0,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arburst,
    s_axi_arsize,
    s_axi_arprot,
    s_axi_araddr,
    aresetn,
    I22);
  output O1;
  output O2;
  output [0:0]S;
  output [42:0]Q;
  output [3:0]I16;
  output [3:0]I17;
  output [0:0]I14;
  output [0:0]O14;
  output O15;
  output [2:0]O16;
  output O17;
  output O18;
  output O19;
  output O20;
  output O25;
  output [2:0]I26;
  output O26;
  output O27;
  output O28;
  output O30;
  output [6:0]O31;
  output O33;
  output [0:0]SR;
  input aclk;
  input I2;
  input I3;
  input m_axi_arready;
  input s_axi_arvalid;
  input [0:0]I10;
  input I11;
  input I12;
  input [1:0]I13;
  input [2:0]I15;
  input [1:0]I18;
  input sel_first_0;
  input [0:0]s_axi_arid;
  input [3:0]s_axi_arlen;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arsize;
  input [2:0]s_axi_arprot;
  input [31:0]s_axi_araddr;
  input aresetn;
  input [0:0]I22;

  wire [0:0]I10;
  wire I11;
  wire I12;
  wire [1:0]I13;
  wire [0:0]I14;
  wire [2:0]I15;
  wire [3:0]I16;
  wire [3:0]I17;
  wire [1:0]I18;
  wire I2;
  wire [0:0]I22;
  wire [2:0]I26;
  wire I3;
  wire O1;
  wire [0:0]O14;
  wire O15;
  wire [2:0]O16;
  wire O17;
  wire O18;
  wire O19;
  wire O2;
  wire O20;
  wire O25;
  wire O26;
  wire O27;
  wire O28;
  wire O30;
  wire [6:0]O31;
  wire O33;
  wire [42:0]Q;
  wire [0:0]S;
  wire [0:0]SR;
  wire aclk;
  wire aresetn;
  wire m_axi_arready;
  wire \n_0_aresetn_d_reg[0] ;
  wire \n_0_aresetn_d_reg[1] ;
  wire \n_0_axaddr_offset_r[0]_i_2__0 ;
  wire \n_0_axaddr_offset_r[1]_i_2__0 ;
  wire \n_0_axaddr_offset_r[1]_i_3 ;
  wire \n_0_axaddr_offset_r[3]_i_2__0 ;
  wire \n_0_m_payload_i[0]_i_1__0 ;
  wire \n_0_m_payload_i[10]_i_1__0 ;
  wire \n_0_m_payload_i[11]_i_1__0 ;
  wire \n_0_m_payload_i[12]_i_1__0 ;
  wire \n_0_m_payload_i[13]_i_1__0 ;
  wire \n_0_m_payload_i[14]_i_1__0 ;
  wire \n_0_m_payload_i[15]_i_1__0 ;
  wire \n_0_m_payload_i[16]_i_1__0 ;
  wire \n_0_m_payload_i[17]_i_1__0 ;
  wire \n_0_m_payload_i[18]_i_1__0 ;
  wire \n_0_m_payload_i[19]_i_1__0 ;
  wire \n_0_m_payload_i[1]_i_1__0 ;
  wire \n_0_m_payload_i[20]_i_1__0 ;
  wire \n_0_m_payload_i[21]_i_1__0 ;
  wire \n_0_m_payload_i[22]_i_1__0 ;
  wire \n_0_m_payload_i[23]_i_1__0 ;
  wire \n_0_m_payload_i[24]_i_1__0 ;
  wire \n_0_m_payload_i[25]_i_1__0 ;
  wire \n_0_m_payload_i[26]_i_1__0 ;
  wire \n_0_m_payload_i[27]_i_1__0 ;
  wire \n_0_m_payload_i[28]_i_1__0 ;
  wire \n_0_m_payload_i[29]_i_1__0 ;
  wire \n_0_m_payload_i[2]_i_1__0 ;
  wire \n_0_m_payload_i[30]_i_1__0 ;
  wire \n_0_m_payload_i[31]_i_2__0 ;
  wire \n_0_m_payload_i[32]_i_1__0 ;
  wire \n_0_m_payload_i[33]_i_1__0 ;
  wire \n_0_m_payload_i[34]_i_1__0 ;
  wire \n_0_m_payload_i[35]_i_1__1 ;
  wire \n_0_m_payload_i[36]_i_1__0 ;
  wire \n_0_m_payload_i[38]_i_1__0 ;
  wire \n_0_m_payload_i[39]_i_1__0 ;
  wire \n_0_m_payload_i[3]_i_1__0 ;
  wire \n_0_m_payload_i[44]_i_1__0 ;
  wire \n_0_m_payload_i[45]_i_1__0 ;
  wire \n_0_m_payload_i[46]_i_1__0 ;
  wire \n_0_m_payload_i[47]_i_1__0 ;
  wire \n_0_m_payload_i[4]_i_1__0 ;
  wire \n_0_m_payload_i[50]_i_1__0 ;
  wire \n_0_m_payload_i[5]_i_1__0 ;
  wire \n_0_m_payload_i[6]_i_1__0 ;
  wire \n_0_m_payload_i[7]_i_1__0 ;
  wire \n_0_m_payload_i[8]_i_1__0 ;
  wire \n_0_m_payload_i[9]_i_1__0 ;
  wire \n_0_m_payload_i_reg[38] ;
  wire n_0_m_valid_i_i_1__2;
  wire n_0_s_ready_i_i_1__2;
  wire \n_0_skid_buffer_reg[0] ;
  wire \n_0_skid_buffer_reg[10] ;
  wire \n_0_skid_buffer_reg[11] ;
  wire \n_0_skid_buffer_reg[12] ;
  wire \n_0_skid_buffer_reg[13] ;
  wire \n_0_skid_buffer_reg[14] ;
  wire \n_0_skid_buffer_reg[15] ;
  wire \n_0_skid_buffer_reg[16] ;
  wire \n_0_skid_buffer_reg[17] ;
  wire \n_0_skid_buffer_reg[18] ;
  wire \n_0_skid_buffer_reg[19] ;
  wire \n_0_skid_buffer_reg[1] ;
  wire \n_0_skid_buffer_reg[20] ;
  wire \n_0_skid_buffer_reg[21] ;
  wire \n_0_skid_buffer_reg[22] ;
  wire \n_0_skid_buffer_reg[23] ;
  wire \n_0_skid_buffer_reg[24] ;
  wire \n_0_skid_buffer_reg[25] ;
  wire \n_0_skid_buffer_reg[26] ;
  wire \n_0_skid_buffer_reg[27] ;
  wire \n_0_skid_buffer_reg[28] ;
  wire \n_0_skid_buffer_reg[29] ;
  wire \n_0_skid_buffer_reg[2] ;
  wire \n_0_skid_buffer_reg[30] ;
  wire \n_0_skid_buffer_reg[31] ;
  wire \n_0_skid_buffer_reg[32] ;
  wire \n_0_skid_buffer_reg[33] ;
  wire \n_0_skid_buffer_reg[34] ;
  wire \n_0_skid_buffer_reg[35] ;
  wire \n_0_skid_buffer_reg[36] ;
  wire \n_0_skid_buffer_reg[38] ;
  wire \n_0_skid_buffer_reg[39] ;
  wire \n_0_skid_buffer_reg[3] ;
  wire \n_0_skid_buffer_reg[44] ;
  wire \n_0_skid_buffer_reg[45] ;
  wire \n_0_skid_buffer_reg[46] ;
  wire \n_0_skid_buffer_reg[47] ;
  wire \n_0_skid_buffer_reg[4] ;
  wire \n_0_skid_buffer_reg[50] ;
  wire \n_0_skid_buffer_reg[5] ;
  wire \n_0_skid_buffer_reg[6] ;
  wire \n_0_skid_buffer_reg[7] ;
  wire \n_0_skid_buffer_reg[8] ;
  wire \n_0_skid_buffer_reg[9] ;
  wire \n_0_wrap_boundary_axaddr_r[3]_i_2__0 ;
  wire \n_0_wrap_cnt_r[3]_i_3__0 ;
  wire \n_0_wrap_second_len_r[0]_i_4__0 ;
  wire \n_0_wrap_second_len_r[3]_i_3 ;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [0:0]s_axi_arid;
  wire [3:0]s_axi_arlen;
  wire [2:0]s_axi_arprot;
  wire [1:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire sel_first_0;

LUT1 #(
    .INIT(2'h1)) 
     \aresetn_d[1]_i_1 
       (.I0(aresetn),
        .O(SR));
FDRE #(
    .INIT(1'b0)) 
     \aresetn_d_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(1'b1),
        .Q(\n_0_aresetn_d_reg[0] ),
        .R(SR));
FDRE #(
    .INIT(1'b0)) 
     \aresetn_d_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_aresetn_d_reg[0] ),
        .Q(\n_0_aresetn_d_reg[1] ),
        .R(SR));
LUT6 #(
    .INIT(64'h1010011010101010)) 
     \axaddr_incr[0]_i_11__0 
       (.I0(Q[36]),
        .I1(Q[35]),
        .I2(Q[0]),
        .I3(I2),
        .I4(I3),
        .I5(m_axi_arready),
        .O(S));
LUT3 #(
    .INIT(8'h2A)) 
     \axaddr_incr[0]_i_5__0 
       (.I0(Q[2]),
        .I1(Q[35]),
        .I2(Q[36]),
        .O(I26[2]));
LUT2 #(
    .INIT(4'h2)) 
     \axaddr_incr[0]_i_6__0 
       (.I0(Q[1]),
        .I1(Q[36]),
        .O(I26[1]));
LUT3 #(
    .INIT(8'h02)) 
     \axaddr_incr[0]_i_7__0 
       (.I0(Q[0]),
        .I1(Q[35]),
        .I2(Q[36]),
        .O(I26[0]));
LUT3 #(
    .INIT(8'h01)) 
     \axaddr_incr[1]_i_4__0 
       (.I0(Q[35]),
        .I1(Q[36]),
        .I2(sel_first_0),
        .O(O25));
LUT3 #(
    .INIT(8'h04)) 
     \axaddr_incr[2]_i_4__0 
       (.I0(Q[36]),
        .I1(Q[35]),
        .I2(sel_first_0),
        .O(O26));
LUT3 #(
    .INIT(8'h04)) 
     \axaddr_incr[3]_i_4__0 
       (.I0(Q[35]),
        .I1(Q[36]),
        .I2(sel_first_0),
        .O(O27));
LUT3 #(
    .INIT(8'h08)) 
     \axaddr_incr[4]_i_5__0 
       (.I0(Q[35]),
        .I1(Q[36]),
        .I2(sel_first_0),
        .O(O28));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_incr[4]_i_6__0 
       (.I0(Q[7]),
        .O(I16[3]));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_incr[4]_i_7__0 
       (.I0(Q[6]),
        .O(I16[2]));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_incr[4]_i_8__0 
       (.I0(Q[5]),
        .O(I16[1]));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_incr[4]_i_9__0 
       (.I0(Q[4]),
        .O(I16[0]));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_incr[8]_i_5__0 
       (.I0(Q[11]),
        .O(I17[3]));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_incr[8]_i_6__0 
       (.I0(Q[10]),
        .O(I17[2]));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_incr[8]_i_7__0 
       (.I0(Q[9]),
        .O(I17[1]));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_incr[8]_i_8__0 
       (.I0(Q[8]),
        .O(I17[0]));
LUT6 #(
    .INIT(64'hFFFFF8FF00000800)) 
     \axaddr_offset_r[0]_i_1__0 
       (.I0(Q[38]),
        .I1(\n_0_axaddr_offset_r[0]_i_2__0 ),
        .I2(I3),
        .I3(O1),
        .I4(I2),
        .I5(I15[0]),
        .O(O16[0]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \axaddr_offset_r[0]_i_2__0 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[35]),
        .I3(Q[2]),
        .I4(Q[36]),
        .I5(Q[0]),
        .O(\n_0_axaddr_offset_r[0]_i_2__0 ));
LUT6 #(
    .INIT(64'hAC00FFFFAC000000)) 
     \axaddr_offset_r[1]_i_1__0 
       (.I0(\n_0_axaddr_offset_r[1]_i_2__0 ),
        .I1(\n_0_axaddr_offset_r[1]_i_3 ),
        .I2(Q[35]),
        .I3(Q[39]),
        .I4(I12),
        .I5(I15[1]),
        .O(O16[1]));
(* SOFT_HLUTNM = "soft_lutpair26" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \axaddr_offset_r[1]_i_2__0 
       (.I0(Q[4]),
        .I1(Q[36]),
        .I2(Q[2]),
        .O(\n_0_axaddr_offset_r[1]_i_2__0 ));
LUT3 #(
    .INIT(8'hB8)) 
     \axaddr_offset_r[1]_i_3 
       (.I0(Q[3]),
        .I1(Q[36]),
        .I2(Q[1]),
        .O(\n_0_axaddr_offset_r[1]_i_3 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \axaddr_offset_r[2]_i_3__0 
       (.I0(Q[5]),
        .I1(Q[3]),
        .I2(Q[35]),
        .I3(Q[4]),
        .I4(Q[36]),
        .I5(Q[2]),
        .O(O30));
LUT6 #(
    .INIT(64'hFFFFF8FF00000800)) 
     \axaddr_offset_r[3]_i_1__0 
       (.I0(Q[41]),
        .I1(\n_0_axaddr_offset_r[3]_i_2__0 ),
        .I2(I3),
        .I3(O1),
        .I4(I2),
        .I5(I15[2]),
        .O(O16[2]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \axaddr_offset_r[3]_i_2__0 
       (.I0(Q[6]),
        .I1(Q[4]),
        .I2(Q[35]),
        .I3(Q[5]),
        .I4(Q[36]),
        .I5(Q[3]),
        .O(\n_0_axaddr_offset_r[3]_i_2__0 ));
(* SOFT_HLUTNM = "soft_lutpair25" *) 
   LUT4 #(
    .INIT(16'hFFDF)) 
     \axlen_cnt[3]_i_4__0 
       (.I0(Q[41]),
        .I1(I2),
        .I2(O1),
        .I3(I3),
        .O(O19));
LUT2 #(
    .INIT(4'h2)) 
     \m_axi_araddr[11]_INST_0_i_1 
       (.I0(\n_0_m_payload_i_reg[38] ),
        .I1(sel_first_0),
        .O(O33));
(* SOFT_HLUTNM = "soft_lutpair48" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[0]_i_1__0 
       (.I0(s_axi_araddr[0]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[0] ),
        .O(\n_0_m_payload_i[0]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair43" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[10]_i_1__0 
       (.I0(s_axi_araddr[10]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[10] ),
        .O(\n_0_m_payload_i[10]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair43" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[11]_i_1__0 
       (.I0(s_axi_araddr[11]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[11] ),
        .O(\n_0_m_payload_i[11]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair42" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[12]_i_1__0 
       (.I0(s_axi_araddr[12]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[12] ),
        .O(\n_0_m_payload_i[12]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair42" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[13]_i_1__0 
       (.I0(s_axi_araddr[13]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[13] ),
        .O(\n_0_m_payload_i[13]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair41" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[14]_i_1__0 
       (.I0(s_axi_araddr[14]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[14] ),
        .O(\n_0_m_payload_i[14]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair41" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[15]_i_1__0 
       (.I0(s_axi_araddr[15]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[15] ),
        .O(\n_0_m_payload_i[15]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair40" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[16]_i_1__0 
       (.I0(s_axi_araddr[16]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[16] ),
        .O(\n_0_m_payload_i[16]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair40" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[17]_i_1__0 
       (.I0(s_axi_araddr[17]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[17] ),
        .O(\n_0_m_payload_i[17]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair39" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[18]_i_1__0 
       (.I0(s_axi_araddr[18]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[18] ),
        .O(\n_0_m_payload_i[18]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair39" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[19]_i_1__0 
       (.I0(s_axi_araddr[19]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[19] ),
        .O(\n_0_m_payload_i[19]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair48" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[1]_i_1__0 
       (.I0(s_axi_araddr[1]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[1] ),
        .O(\n_0_m_payload_i[1]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair38" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[20]_i_1__0 
       (.I0(s_axi_araddr[20]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[20] ),
        .O(\n_0_m_payload_i[20]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair38" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[21]_i_1__0 
       (.I0(s_axi_araddr[21]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[21] ),
        .O(\n_0_m_payload_i[21]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair37" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[22]_i_1__0 
       (.I0(s_axi_araddr[22]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[22] ),
        .O(\n_0_m_payload_i[22]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair37" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[23]_i_1__0 
       (.I0(s_axi_araddr[23]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[23] ),
        .O(\n_0_m_payload_i[23]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair36" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[24]_i_1__0 
       (.I0(s_axi_araddr[24]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[24] ),
        .O(\n_0_m_payload_i[24]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair36" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[25]_i_1__0 
       (.I0(s_axi_araddr[25]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[25] ),
        .O(\n_0_m_payload_i[25]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair35" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[26]_i_1__0 
       (.I0(s_axi_araddr[26]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[26] ),
        .O(\n_0_m_payload_i[26]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair35" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[27]_i_1__0 
       (.I0(s_axi_araddr[27]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[27] ),
        .O(\n_0_m_payload_i[27]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair34" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[28]_i_1__0 
       (.I0(s_axi_araddr[28]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[28] ),
        .O(\n_0_m_payload_i[28]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair34" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[29]_i_1__0 
       (.I0(s_axi_araddr[29]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[29] ),
        .O(\n_0_m_payload_i[29]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair47" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[2]_i_1__0 
       (.I0(s_axi_araddr[2]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[2] ),
        .O(\n_0_m_payload_i[2]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair33" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[30]_i_1__0 
       (.I0(s_axi_araddr[30]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[30] ),
        .O(\n_0_m_payload_i[30]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair33" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[31]_i_2__0 
       (.I0(s_axi_araddr[31]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[31] ),
        .O(\n_0_m_payload_i[31]_i_2__0 ));
(* SOFT_HLUTNM = "soft_lutpair32" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[32]_i_1__0 
       (.I0(s_axi_arprot[0]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[32] ),
        .O(\n_0_m_payload_i[32]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair32" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[33]_i_1__0 
       (.I0(s_axi_arprot[1]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[33] ),
        .O(\n_0_m_payload_i[33]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair31" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[34]_i_1__0 
       (.I0(s_axi_arprot[2]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[34] ),
        .O(\n_0_m_payload_i[34]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair31" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[35]_i_1__1 
       (.I0(s_axi_arsize[0]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[35] ),
        .O(\n_0_m_payload_i[35]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair30" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[36]_i_1__0 
       (.I0(s_axi_arsize[1]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[36] ),
        .O(\n_0_m_payload_i[36]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair30" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[38]_i_1__0 
       (.I0(s_axi_arburst[0]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[38] ),
        .O(\n_0_m_payload_i[38]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair29" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[39]_i_1__0 
       (.I0(s_axi_arburst[1]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[39] ),
        .O(\n_0_m_payload_i[39]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair47" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[3]_i_1__0 
       (.I0(s_axi_araddr[3]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[3] ),
        .O(\n_0_m_payload_i[3]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair29" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[44]_i_1__0 
       (.I0(s_axi_arlen[0]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[44] ),
        .O(\n_0_m_payload_i[44]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair28" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[45]_i_1__0 
       (.I0(s_axi_arlen[1]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[45] ),
        .O(\n_0_m_payload_i[45]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair28" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[46]_i_1__0 
       (.I0(s_axi_arlen[2]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[46] ),
        .O(\n_0_m_payload_i[46]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair27" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[47]_i_1__0 
       (.I0(s_axi_arlen[3]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[47] ),
        .O(\n_0_m_payload_i[47]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair46" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[4]_i_1__0 
       (.I0(s_axi_araddr[4]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[4] ),
        .O(\n_0_m_payload_i[4]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair27" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[50]_i_1__0 
       (.I0(s_axi_arid),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[50] ),
        .O(\n_0_m_payload_i[50]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair46" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[5]_i_1__0 
       (.I0(s_axi_araddr[5]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[5] ),
        .O(\n_0_m_payload_i[5]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair45" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[6]_i_1__0 
       (.I0(s_axi_araddr[6]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[6] ),
        .O(\n_0_m_payload_i[6]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair45" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[7]_i_1__0 
       (.I0(s_axi_araddr[7]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[7] ),
        .O(\n_0_m_payload_i[7]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair44" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[8]_i_1__0 
       (.I0(s_axi_araddr[8]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[8] ),
        .O(\n_0_m_payload_i[8]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair44" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[9]_i_1__0 
       (.I0(s_axi_araddr[9]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[9] ),
        .O(\n_0_m_payload_i[9]_i_1__0 ));
FDRE \m_payload_i_reg[0] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[0]_i_1__0 ),
        .Q(Q[0]),
        .R(1'b0));
FDRE \m_payload_i_reg[10] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[10]_i_1__0 ),
        .Q(Q[10]),
        .R(1'b0));
FDRE \m_payload_i_reg[11] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[11]_i_1__0 ),
        .Q(Q[11]),
        .R(1'b0));
FDRE \m_payload_i_reg[12] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[12]_i_1__0 ),
        .Q(Q[12]),
        .R(1'b0));
FDRE \m_payload_i_reg[13] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[13]_i_1__0 ),
        .Q(Q[13]),
        .R(1'b0));
FDRE \m_payload_i_reg[14] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[14]_i_1__0 ),
        .Q(Q[14]),
        .R(1'b0));
FDRE \m_payload_i_reg[15] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[15]_i_1__0 ),
        .Q(Q[15]),
        .R(1'b0));
FDRE \m_payload_i_reg[16] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[16]_i_1__0 ),
        .Q(Q[16]),
        .R(1'b0));
FDRE \m_payload_i_reg[17] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[17]_i_1__0 ),
        .Q(Q[17]),
        .R(1'b0));
FDRE \m_payload_i_reg[18] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[18]_i_1__0 ),
        .Q(Q[18]),
        .R(1'b0));
FDRE \m_payload_i_reg[19] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[19]_i_1__0 ),
        .Q(Q[19]),
        .R(1'b0));
FDRE \m_payload_i_reg[1] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[1]_i_1__0 ),
        .Q(Q[1]),
        .R(1'b0));
FDRE \m_payload_i_reg[20] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[20]_i_1__0 ),
        .Q(Q[20]),
        .R(1'b0));
FDRE \m_payload_i_reg[21] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[21]_i_1__0 ),
        .Q(Q[21]),
        .R(1'b0));
FDRE \m_payload_i_reg[22] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[22]_i_1__0 ),
        .Q(Q[22]),
        .R(1'b0));
FDRE \m_payload_i_reg[23] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[23]_i_1__0 ),
        .Q(Q[23]),
        .R(1'b0));
FDRE \m_payload_i_reg[24] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[24]_i_1__0 ),
        .Q(Q[24]),
        .R(1'b0));
FDRE \m_payload_i_reg[25] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[25]_i_1__0 ),
        .Q(Q[25]),
        .R(1'b0));
FDRE \m_payload_i_reg[26] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[26]_i_1__0 ),
        .Q(Q[26]),
        .R(1'b0));
FDRE \m_payload_i_reg[27] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[27]_i_1__0 ),
        .Q(Q[27]),
        .R(1'b0));
FDRE \m_payload_i_reg[28] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[28]_i_1__0 ),
        .Q(Q[28]),
        .R(1'b0));
FDRE \m_payload_i_reg[29] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[29]_i_1__0 ),
        .Q(Q[29]),
        .R(1'b0));
FDRE \m_payload_i_reg[2] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[2]_i_1__0 ),
        .Q(Q[2]),
        .R(1'b0));
FDRE \m_payload_i_reg[30] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[30]_i_1__0 ),
        .Q(Q[30]),
        .R(1'b0));
FDRE \m_payload_i_reg[31] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[31]_i_2__0 ),
        .Q(Q[31]),
        .R(1'b0));
FDRE \m_payload_i_reg[32] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[32]_i_1__0 ),
        .Q(Q[32]),
        .R(1'b0));
FDRE \m_payload_i_reg[33] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[33]_i_1__0 ),
        .Q(Q[33]),
        .R(1'b0));
FDRE \m_payload_i_reg[34] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[34]_i_1__0 ),
        .Q(Q[34]),
        .R(1'b0));
FDRE \m_payload_i_reg[35] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[35]_i_1__1 ),
        .Q(Q[35]),
        .R(1'b0));
FDRE \m_payload_i_reg[36] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[36]_i_1__0 ),
        .Q(Q[36]),
        .R(1'b0));
FDRE \m_payload_i_reg[38] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[38]_i_1__0 ),
        .Q(\n_0_m_payload_i_reg[38] ),
        .R(1'b0));
FDRE \m_payload_i_reg[39] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[39]_i_1__0 ),
        .Q(Q[37]),
        .R(1'b0));
FDRE \m_payload_i_reg[3] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[3]_i_1__0 ),
        .Q(Q[3]),
        .R(1'b0));
FDRE \m_payload_i_reg[44] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[44]_i_1__0 ),
        .Q(Q[38]),
        .R(1'b0));
FDRE \m_payload_i_reg[45] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[45]_i_1__0 ),
        .Q(Q[39]),
        .R(1'b0));
FDRE \m_payload_i_reg[46] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[46]_i_1__0 ),
        .Q(Q[40]),
        .R(1'b0));
FDRE \m_payload_i_reg[47] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[47]_i_1__0 ),
        .Q(Q[41]),
        .R(1'b0));
FDRE \m_payload_i_reg[4] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[4]_i_1__0 ),
        .Q(Q[4]),
        .R(1'b0));
FDRE \m_payload_i_reg[50] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[50]_i_1__0 ),
        .Q(Q[42]),
        .R(1'b0));
FDRE \m_payload_i_reg[5] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[5]_i_1__0 ),
        .Q(Q[5]),
        .R(1'b0));
FDRE \m_payload_i_reg[6] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[6]_i_1__0 ),
        .Q(Q[6]),
        .R(1'b0));
FDRE \m_payload_i_reg[7] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[7]_i_1__0 ),
        .Q(Q[7]),
        .R(1'b0));
FDRE \m_payload_i_reg[8] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[8]_i_1__0 ),
        .Q(Q[8]),
        .R(1'b0));
FDRE \m_payload_i_reg[9] 
       (.C(aclk),
        .CE(I22),
        .D(\n_0_m_payload_i[9]_i_1__0 ),
        .Q(Q[9]),
        .R(1'b0));
LUT6 #(
    .INIT(64'hFF00FF004C00FF00)) 
     m_valid_i_i_1__2
       (.I0(I3),
        .I1(O1),
        .I2(I2),
        .I3(\n_0_aresetn_d_reg[1] ),
        .I4(O2),
        .I5(s_axi_arvalid),
        .O(n_0_m_valid_i_i_1__2));
FDRE m_valid_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(n_0_m_valid_i_i_1__2),
        .Q(O1),
        .R(1'b0));
LUT5 #(
    .INIT(32'hAAAAAAA8)) 
     next_pending_r_i_4__0
       (.I0(I12),
        .I1(Q[38]),
        .I2(Q[41]),
        .I3(Q[39]),
        .I4(Q[40]),
        .O(O17));
LUT6 #(
    .INIT(64'hB300B300FF00B300)) 
     s_ready_i_i_1__2
       (.I0(I3),
        .I1(O1),
        .I2(I2),
        .I3(\n_0_aresetn_d_reg[0] ),
        .I4(O2),
        .I5(s_axi_arvalid),
        .O(n_0_s_ready_i_i_1__2));
FDRE s_ready_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(n_0_s_ready_i_i_1__2),
        .Q(O2),
        .R(1'b0));
FDRE \skid_buffer_reg[0] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[0]),
        .Q(\n_0_skid_buffer_reg[0] ),
        .R(1'b0));
FDRE \skid_buffer_reg[10] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[10]),
        .Q(\n_0_skid_buffer_reg[10] ),
        .R(1'b0));
FDRE \skid_buffer_reg[11] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[11]),
        .Q(\n_0_skid_buffer_reg[11] ),
        .R(1'b0));
FDRE \skid_buffer_reg[12] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[12]),
        .Q(\n_0_skid_buffer_reg[12] ),
        .R(1'b0));
FDRE \skid_buffer_reg[13] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[13]),
        .Q(\n_0_skid_buffer_reg[13] ),
        .R(1'b0));
FDRE \skid_buffer_reg[14] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[14]),
        .Q(\n_0_skid_buffer_reg[14] ),
        .R(1'b0));
FDRE \skid_buffer_reg[15] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[15]),
        .Q(\n_0_skid_buffer_reg[15] ),
        .R(1'b0));
FDRE \skid_buffer_reg[16] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[16]),
        .Q(\n_0_skid_buffer_reg[16] ),
        .R(1'b0));
FDRE \skid_buffer_reg[17] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[17]),
        .Q(\n_0_skid_buffer_reg[17] ),
        .R(1'b0));
FDRE \skid_buffer_reg[18] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[18]),
        .Q(\n_0_skid_buffer_reg[18] ),
        .R(1'b0));
FDRE \skid_buffer_reg[19] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[19]),
        .Q(\n_0_skid_buffer_reg[19] ),
        .R(1'b0));
FDRE \skid_buffer_reg[1] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[1]),
        .Q(\n_0_skid_buffer_reg[1] ),
        .R(1'b0));
FDRE \skid_buffer_reg[20] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[20]),
        .Q(\n_0_skid_buffer_reg[20] ),
        .R(1'b0));
FDRE \skid_buffer_reg[21] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[21]),
        .Q(\n_0_skid_buffer_reg[21] ),
        .R(1'b0));
FDRE \skid_buffer_reg[22] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[22]),
        .Q(\n_0_skid_buffer_reg[22] ),
        .R(1'b0));
FDRE \skid_buffer_reg[23] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[23]),
        .Q(\n_0_skid_buffer_reg[23] ),
        .R(1'b0));
FDRE \skid_buffer_reg[24] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[24]),
        .Q(\n_0_skid_buffer_reg[24] ),
        .R(1'b0));
FDRE \skid_buffer_reg[25] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[25]),
        .Q(\n_0_skid_buffer_reg[25] ),
        .R(1'b0));
FDRE \skid_buffer_reg[26] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[26]),
        .Q(\n_0_skid_buffer_reg[26] ),
        .R(1'b0));
FDRE \skid_buffer_reg[27] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[27]),
        .Q(\n_0_skid_buffer_reg[27] ),
        .R(1'b0));
FDRE \skid_buffer_reg[28] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[28]),
        .Q(\n_0_skid_buffer_reg[28] ),
        .R(1'b0));
FDRE \skid_buffer_reg[29] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[29]),
        .Q(\n_0_skid_buffer_reg[29] ),
        .R(1'b0));
FDRE \skid_buffer_reg[2] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[2]),
        .Q(\n_0_skid_buffer_reg[2] ),
        .R(1'b0));
FDRE \skid_buffer_reg[30] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[30]),
        .Q(\n_0_skid_buffer_reg[30] ),
        .R(1'b0));
FDRE \skid_buffer_reg[31] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[31]),
        .Q(\n_0_skid_buffer_reg[31] ),
        .R(1'b0));
FDRE \skid_buffer_reg[32] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_arprot[0]),
        .Q(\n_0_skid_buffer_reg[32] ),
        .R(1'b0));
FDRE \skid_buffer_reg[33] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_arprot[1]),
        .Q(\n_0_skid_buffer_reg[33] ),
        .R(1'b0));
FDRE \skid_buffer_reg[34] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_arprot[2]),
        .Q(\n_0_skid_buffer_reg[34] ),
        .R(1'b0));
FDRE \skid_buffer_reg[35] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_arsize[0]),
        .Q(\n_0_skid_buffer_reg[35] ),
        .R(1'b0));
FDRE \skid_buffer_reg[36] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_arsize[1]),
        .Q(\n_0_skid_buffer_reg[36] ),
        .R(1'b0));
FDRE \skid_buffer_reg[38] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_arburst[0]),
        .Q(\n_0_skid_buffer_reg[38] ),
        .R(1'b0));
FDRE \skid_buffer_reg[39] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_arburst[1]),
        .Q(\n_0_skid_buffer_reg[39] ),
        .R(1'b0));
FDRE \skid_buffer_reg[3] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[3]),
        .Q(\n_0_skid_buffer_reg[3] ),
        .R(1'b0));
FDRE \skid_buffer_reg[44] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_arlen[0]),
        .Q(\n_0_skid_buffer_reg[44] ),
        .R(1'b0));
FDRE \skid_buffer_reg[45] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_arlen[1]),
        .Q(\n_0_skid_buffer_reg[45] ),
        .R(1'b0));
FDRE \skid_buffer_reg[46] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_arlen[2]),
        .Q(\n_0_skid_buffer_reg[46] ),
        .R(1'b0));
FDRE \skid_buffer_reg[47] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_arlen[3]),
        .Q(\n_0_skid_buffer_reg[47] ),
        .R(1'b0));
FDRE \skid_buffer_reg[4] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[4]),
        .Q(\n_0_skid_buffer_reg[4] ),
        .R(1'b0));
FDRE \skid_buffer_reg[50] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_arid),
        .Q(\n_0_skid_buffer_reg[50] ),
        .R(1'b0));
FDRE \skid_buffer_reg[5] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[5]),
        .Q(\n_0_skid_buffer_reg[5] ),
        .R(1'b0));
FDRE \skid_buffer_reg[6] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[6]),
        .Q(\n_0_skid_buffer_reg[6] ),
        .R(1'b0));
FDRE \skid_buffer_reg[7] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[7]),
        .Q(\n_0_skid_buffer_reg[7] ),
        .R(1'b0));
FDRE \skid_buffer_reg[8] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[8]),
        .Q(\n_0_skid_buffer_reg[8] ),
        .R(1'b0));
FDRE \skid_buffer_reg[9] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_araddr[9]),
        .Q(\n_0_skid_buffer_reg[9] ),
        .R(1'b0));
LUT4 #(
    .INIT(16'hAA8A)) 
     \wrap_boundary_axaddr_r[0]_i_1__0 
       (.I0(Q[0]),
        .I1(Q[36]),
        .I2(Q[38]),
        .I3(Q[35]),
        .O(O31[0]));
LUT5 #(
    .INIT(32'h8A888AAA)) 
     \wrap_boundary_axaddr_r[1]_i_1__0 
       (.I0(Q[1]),
        .I1(Q[36]),
        .I2(Q[38]),
        .I3(Q[35]),
        .I4(Q[39]),
        .O(O31[1]));
LUT6 #(
    .INIT(64'hA0A002A2AAAA02A2)) 
     \wrap_boundary_axaddr_r[2]_i_1__0 
       (.I0(Q[2]),
        .I1(Q[40]),
        .I2(Q[35]),
        .I3(Q[39]),
        .I4(Q[36]),
        .I5(Q[38]),
        .O(O31[2]));
LUT6 #(
    .INIT(64'h020202A2A2A202A2)) 
     \wrap_boundary_axaddr_r[3]_i_1__0 
       (.I0(Q[3]),
        .I1(\n_0_wrap_boundary_axaddr_r[3]_i_2__0 ),
        .I2(Q[36]),
        .I3(Q[39]),
        .I4(Q[35]),
        .I5(Q[38]),
        .O(O31[3]));
(* SOFT_HLUTNM = "soft_lutpair24" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \wrap_boundary_axaddr_r[3]_i_2__0 
       (.I0(Q[40]),
        .I1(Q[35]),
        .I2(Q[41]),
        .O(\n_0_wrap_boundary_axaddr_r[3]_i_2__0 ));
LUT6 #(
    .INIT(64'h002A0A2AA02AAA2A)) 
     \wrap_boundary_axaddr_r[4]_i_1__0 
       (.I0(Q[4]),
        .I1(Q[41]),
        .I2(Q[35]),
        .I3(Q[36]),
        .I4(Q[40]),
        .I5(Q[39]),
        .O(O31[4]));
(* SOFT_HLUTNM = "soft_lutpair24" *) 
   LUT5 #(
    .INIT(32'h2A222AAA)) 
     \wrap_boundary_axaddr_r[5]_i_1__0 
       (.I0(Q[5]),
        .I1(Q[36]),
        .I2(Q[40]),
        .I3(Q[35]),
        .I4(Q[41]),
        .O(O31[5]));
LUT4 #(
    .INIT(16'h2AAA)) 
     \wrap_boundary_axaddr_r[6]_i_1__0 
       (.I0(Q[6]),
        .I1(Q[36]),
        .I2(Q[35]),
        .I3(Q[41]),
        .O(O31[6]));
LUT3 #(
    .INIT(8'h9A)) 
     \wrap_cnt_r[2]_i_1__0 
       (.I0(O14),
        .I1(O15),
        .I2(I10),
        .O(I14));
LUT5 #(
    .INIT(32'hAAAAAAAE)) 
     \wrap_cnt_r[3]_i_2__0 
       (.I0(\n_0_wrap_cnt_r[3]_i_3__0 ),
        .I1(I11),
        .I2(O16[0]),
        .I3(O16[1]),
        .I4(O16[2]),
        .O(O15));
LUT6 #(
    .INIT(64'h00000800FFFFF8FF)) 
     \wrap_cnt_r[3]_i_3__0 
       (.I0(\n_0_axaddr_offset_r[0]_i_2__0 ),
        .I1(Q[38]),
        .I2(I18[1]),
        .I3(O1),
        .I4(I18[0]),
        .I5(I13[0]),
        .O(\n_0_wrap_cnt_r[3]_i_3__0 ));
LUT6 #(
    .INIT(64'h00000000FFE200E2)) 
     \wrap_second_len_r[0]_i_3__0 
       (.I0(Q[0]),
        .I1(Q[36]),
        .I2(Q[2]),
        .I3(Q[35]),
        .I4(\n_0_axaddr_offset_r[1]_i_3 ),
        .I5(\n_0_wrap_second_len_r[0]_i_4__0 ),
        .O(O20));
(* SOFT_HLUTNM = "soft_lutpair25" *) 
   LUT4 #(
    .INIT(16'hFFDF)) 
     \wrap_second_len_r[0]_i_4__0 
       (.I0(Q[38]),
        .I1(I2),
        .I2(O1),
        .I3(I3),
        .O(\n_0_wrap_second_len_r[0]_i_4__0 ));
LUT6 #(
    .INIT(64'h02FCFFFF02FC0000)) 
     \wrap_second_len_r[2]_i_1__0 
       (.I0(O16[2]),
        .I1(O16[1]),
        .I2(O16[0]),
        .I3(I11),
        .I4(I12),
        .I5(I13[1]),
        .O(O14));
LUT6 #(
    .INIT(64'h00000000EEE222E2)) 
     \wrap_second_len_r[3]_i_2__0 
       (.I0(\n_0_wrap_second_len_r[3]_i_3 ),
        .I1(Q[35]),
        .I2(Q[4]),
        .I3(Q[36]),
        .I4(Q[6]),
        .I5(O19),
        .O(O18));
(* SOFT_HLUTNM = "soft_lutpair26" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \wrap_second_len_r[3]_i_3 
       (.I0(Q[5]),
        .I1(Q[36]),
        .I2(Q[3]),
        .O(\n_0_wrap_second_len_r[3]_i_3 ));
endmodule

(* ORIG_REF_NAME = "axi_register_slice_v2_1_axic_register_slice" *) 
module axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice_0
   (O1,
    O2,
    Q,
    O6,
    O7,
    D,
    O8,
    O3,
    O4,
    O5,
    O9,
    O10,
    O11,
    O12,
    O13,
    O14,
    O21,
    axaddr_incr0,
    O22,
    O23,
    O24,
    O29,
    O32,
    aclk,
    I1,
    b_push,
    s_axi_awvalid,
    I5,
    I6,
    I7,
    I8,
    I9,
    sel_first,
    s_axi_awid,
    s_axi_awlen,
    s_axi_awburst,
    s_axi_awsize,
    s_axi_awprot,
    s_axi_awaddr,
    SR,
    E);
  output O1;
  output O2;
  output [42:0]Q;
  output [3:0]O6;
  output [3:0]O7;
  output [2:0]D;
  output [2:0]O8;
  output O3;
  output O4;
  output O5;
  output O9;
  output O10;
  output O11;
  output O12;
  output O13;
  output O14;
  output O21;
  output [2:0]axaddr_incr0;
  output O22;
  output O23;
  output O24;
  output [6:0]O29;
  output O32;
  input aclk;
  input [1:0]I1;
  input b_push;
  input s_axi_awvalid;
  input I5;
  input [3:0]I6;
  input I7;
  input I8;
  input [3:0]I9;
  input sel_first;
  input [0:0]s_axi_awid;
  input [3:0]s_axi_awlen;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awsize;
  input [2:0]s_axi_awprot;
  input [31:0]s_axi_awaddr;
  input [0:0]SR;
  input [0:0]E;

  wire [2:0]D;
  wire [0:0]E;
  wire [1:0]I1;
  wire I5;
  wire [3:0]I6;
  wire I7;
  wire I8;
  wire [3:0]I9;
  wire O1;
  wire O10;
  wire O11;
  wire O12;
  wire O13;
  wire O14;
  wire O2;
  wire O21;
  wire O22;
  wire O23;
  wire O24;
  wire [6:0]O29;
  wire O3;
  wire O32;
  wire O4;
  wire O5;
  wire [3:0]O6;
  wire [3:0]O7;
  wire [2:0]O8;
  wire O9;
  wire [42:0]Q;
  wire [0:0]SR;
  wire aclk;
  wire [2:0]axaddr_incr0;
  wire b_push;
  wire \n_0_aresetn_d_reg[0] ;
  wire \n_0_aresetn_d_reg[1] ;
  wire \n_0_axaddr_offset_r[0]_i_2 ;
  wire \n_0_axaddr_offset_r[1]_i_2 ;
  wire \n_0_axaddr_offset_r[2]_i_2__0 ;
  wire \n_0_axaddr_offset_r[2]_i_3 ;
  wire \n_0_axaddr_offset_r[3]_i_2 ;
  wire \n_0_m_payload_i_reg[38] ;
  wire n_0_m_valid_i_i_1;
  wire n_0_s_ready_i_i_1;
  wire \n_0_skid_buffer_reg[0] ;
  wire \n_0_skid_buffer_reg[10] ;
  wire \n_0_skid_buffer_reg[11] ;
  wire \n_0_skid_buffer_reg[12] ;
  wire \n_0_skid_buffer_reg[13] ;
  wire \n_0_skid_buffer_reg[14] ;
  wire \n_0_skid_buffer_reg[15] ;
  wire \n_0_skid_buffer_reg[16] ;
  wire \n_0_skid_buffer_reg[17] ;
  wire \n_0_skid_buffer_reg[18] ;
  wire \n_0_skid_buffer_reg[19] ;
  wire \n_0_skid_buffer_reg[1] ;
  wire \n_0_skid_buffer_reg[20] ;
  wire \n_0_skid_buffer_reg[21] ;
  wire \n_0_skid_buffer_reg[22] ;
  wire \n_0_skid_buffer_reg[23] ;
  wire \n_0_skid_buffer_reg[24] ;
  wire \n_0_skid_buffer_reg[25] ;
  wire \n_0_skid_buffer_reg[26] ;
  wire \n_0_skid_buffer_reg[27] ;
  wire \n_0_skid_buffer_reg[28] ;
  wire \n_0_skid_buffer_reg[29] ;
  wire \n_0_skid_buffer_reg[2] ;
  wire \n_0_skid_buffer_reg[30] ;
  wire \n_0_skid_buffer_reg[31] ;
  wire \n_0_skid_buffer_reg[32] ;
  wire \n_0_skid_buffer_reg[33] ;
  wire \n_0_skid_buffer_reg[34] ;
  wire \n_0_skid_buffer_reg[35] ;
  wire \n_0_skid_buffer_reg[36] ;
  wire \n_0_skid_buffer_reg[38] ;
  wire \n_0_skid_buffer_reg[39] ;
  wire \n_0_skid_buffer_reg[3] ;
  wire \n_0_skid_buffer_reg[44] ;
  wire \n_0_skid_buffer_reg[45] ;
  wire \n_0_skid_buffer_reg[46] ;
  wire \n_0_skid_buffer_reg[47] ;
  wire \n_0_skid_buffer_reg[4] ;
  wire \n_0_skid_buffer_reg[50] ;
  wire \n_0_skid_buffer_reg[5] ;
  wire \n_0_skid_buffer_reg[6] ;
  wire \n_0_skid_buffer_reg[7] ;
  wire \n_0_skid_buffer_reg[8] ;
  wire \n_0_skid_buffer_reg[9] ;
  wire \n_0_wrap_boundary_axaddr_r[3]_i_2 ;
  wire \n_0_wrap_cnt_r[1]_i_2 ;
  wire \n_0_wrap_cnt_r[3]_i_2 ;
  wire \n_0_wrap_cnt_r[3]_i_4 ;
  wire \n_0_wrap_second_len_r[0]_i_4 ;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [0:0]s_axi_awid;
  wire [3:0]s_axi_awlen;
  wire [2:0]s_axi_awprot;
  wire [1:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire sel_first;
  wire [50:0]skid_buffer;

FDRE #(
    .INIT(1'b0)) 
     \aresetn_d_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(1'b1),
        .Q(\n_0_aresetn_d_reg[0] ),
        .R(SR));
FDRE #(
    .INIT(1'b0)) 
     \aresetn_d_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_aresetn_d_reg[0] ),
        .Q(\n_0_aresetn_d_reg[1] ),
        .R(SR));
LUT3 #(
    .INIT(8'h2A)) 
     \axaddr_incr[0]_i_5 
       (.I0(Q[2]),
        .I1(Q[35]),
        .I2(Q[36]),
        .O(axaddr_incr0[2]));
LUT2 #(
    .INIT(4'h2)) 
     \axaddr_incr[0]_i_6 
       (.I0(Q[1]),
        .I1(Q[36]),
        .O(axaddr_incr0[1]));
LUT3 #(
    .INIT(8'h02)) 
     \axaddr_incr[0]_i_7 
       (.I0(Q[0]),
        .I1(Q[35]),
        .I2(Q[36]),
        .O(axaddr_incr0[0]));
LUT3 #(
    .INIT(8'h01)) 
     \axaddr_incr[1]_i_4 
       (.I0(Q[35]),
        .I1(Q[36]),
        .I2(sel_first),
        .O(O21));
LUT3 #(
    .INIT(8'h04)) 
     \axaddr_incr[2]_i_4 
       (.I0(Q[36]),
        .I1(Q[35]),
        .I2(sel_first),
        .O(O22));
LUT3 #(
    .INIT(8'h04)) 
     \axaddr_incr[3]_i_4 
       (.I0(Q[35]),
        .I1(Q[36]),
        .I2(sel_first),
        .O(O23));
LUT3 #(
    .INIT(8'h08)) 
     \axaddr_incr[4]_i_5 
       (.I0(Q[35]),
        .I1(Q[36]),
        .I2(sel_first),
        .O(O24));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_incr[4]_i_6 
       (.I0(Q[7]),
        .O(O6[3]));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_incr[4]_i_7 
       (.I0(Q[6]),
        .O(O6[2]));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_incr[4]_i_8 
       (.I0(Q[5]),
        .O(O6[1]));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_incr[4]_i_9 
       (.I0(Q[4]),
        .O(O6[0]));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_incr[8]_i_5 
       (.I0(Q[11]),
        .O(O7[3]));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_incr[8]_i_6 
       (.I0(Q[10]),
        .O(O7[2]));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_incr[8]_i_7 
       (.I0(Q[9]),
        .O(O7[1]));
LUT1 #(
    .INIT(2'h2)) 
     \axaddr_incr[8]_i_8 
       (.I0(Q[8]),
        .O(O7[0]));
LUT6 #(
    .INIT(64'hFFFFF8FF00000800)) 
     \axaddr_offset_r[0]_i_1 
       (.I0(Q[38]),
        .I1(\n_0_axaddr_offset_r[0]_i_2 ),
        .I2(I1[1]),
        .I3(O1),
        .I4(I1[0]),
        .I5(I9[0]),
        .O(O3));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \axaddr_offset_r[0]_i_2 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[35]),
        .I3(Q[2]),
        .I4(Q[36]),
        .I5(Q[0]),
        .O(\n_0_axaddr_offset_r[0]_i_2 ));
LUT6 #(
    .INIT(64'hAC00FFFFAC000000)) 
     \axaddr_offset_r[1]_i_1 
       (.I0(\n_0_axaddr_offset_r[2]_i_3 ),
        .I1(\n_0_axaddr_offset_r[1]_i_2 ),
        .I2(Q[35]),
        .I3(Q[39]),
        .I4(I5),
        .I5(I9[1]),
        .O(O4));
(* SOFT_HLUTNM = "soft_lutpair52" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \axaddr_offset_r[1]_i_2 
       (.I0(Q[3]),
        .I1(Q[36]),
        .I2(Q[1]),
        .O(\n_0_axaddr_offset_r[1]_i_2 ));
LUT6 #(
    .INIT(64'hAC00FFFFAC000000)) 
     \axaddr_offset_r[2]_i_1 
       (.I0(\n_0_axaddr_offset_r[2]_i_2__0 ),
        .I1(\n_0_axaddr_offset_r[2]_i_3 ),
        .I2(Q[35]),
        .I3(Q[40]),
        .I4(I5),
        .I5(I9[2]),
        .O(O5));
(* SOFT_HLUTNM = "soft_lutpair52" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \axaddr_offset_r[2]_i_2__0 
       (.I0(Q[5]),
        .I1(Q[36]),
        .I2(Q[3]),
        .O(\n_0_axaddr_offset_r[2]_i_2__0 ));
LUT3 #(
    .INIT(8'hB8)) 
     \axaddr_offset_r[2]_i_3 
       (.I0(Q[4]),
        .I1(Q[36]),
        .I2(Q[2]),
        .O(\n_0_axaddr_offset_r[2]_i_3 ));
LUT6 #(
    .INIT(64'hFFFFF8FF00000800)) 
     \axaddr_offset_r[3]_i_1 
       (.I0(Q[41]),
        .I1(\n_0_axaddr_offset_r[3]_i_2 ),
        .I2(I1[1]),
        .I3(O1),
        .I4(I1[0]),
        .I5(I9[3]),
        .O(O11));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \axaddr_offset_r[3]_i_2 
       (.I0(Q[6]),
        .I1(Q[4]),
        .I2(Q[35]),
        .I3(Q[5]),
        .I4(Q[36]),
        .I5(Q[3]),
        .O(\n_0_axaddr_offset_r[3]_i_2 ));
LUT4 #(
    .INIT(16'hFFDF)) 
     \axlen_cnt[3]_i_4 
       (.I0(Q[41]),
        .I1(I1[0]),
        .I2(O1),
        .I3(I1[1]),
        .O(O13));
LUT2 #(
    .INIT(4'h2)) 
     \m_axi_awaddr[11]_INST_0_i_1 
       (.I0(\n_0_m_payload_i_reg[38] ),
        .I1(sel_first),
        .O(O32));
(* SOFT_HLUTNM = "soft_lutpair74" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[0]_i_1 
       (.I0(s_axi_awaddr[0]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[0] ),
        .O(skid_buffer[0]));
(* SOFT_HLUTNM = "soft_lutpair70" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[10]_i_1 
       (.I0(s_axi_awaddr[10]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[10] ),
        .O(skid_buffer[10]));
(* SOFT_HLUTNM = "soft_lutpair69" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[11]_i_1 
       (.I0(s_axi_awaddr[11]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[11] ),
        .O(skid_buffer[11]));
(* SOFT_HLUTNM = "soft_lutpair69" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[12]_i_1 
       (.I0(s_axi_awaddr[12]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[12] ),
        .O(skid_buffer[12]));
(* SOFT_HLUTNM = "soft_lutpair68" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[13]_i_1 
       (.I0(s_axi_awaddr[13]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[13] ),
        .O(skid_buffer[13]));
(* SOFT_HLUTNM = "soft_lutpair68" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[14]_i_1 
       (.I0(s_axi_awaddr[14]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[14] ),
        .O(skid_buffer[14]));
(* SOFT_HLUTNM = "soft_lutpair67" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[15]_i_1 
       (.I0(s_axi_awaddr[15]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[15] ),
        .O(skid_buffer[15]));
(* SOFT_HLUTNM = "soft_lutpair67" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[16]_i_1 
       (.I0(s_axi_awaddr[16]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[16] ),
        .O(skid_buffer[16]));
(* SOFT_HLUTNM = "soft_lutpair66" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[17]_i_1 
       (.I0(s_axi_awaddr[17]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[17] ),
        .O(skid_buffer[17]));
(* SOFT_HLUTNM = "soft_lutpair65" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[18]_i_1 
       (.I0(s_axi_awaddr[18]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[18] ),
        .O(skid_buffer[18]));
(* SOFT_HLUTNM = "soft_lutpair65" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[19]_i_1 
       (.I0(s_axi_awaddr[19]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[19] ),
        .O(skid_buffer[19]));
(* SOFT_HLUTNM = "soft_lutpair74" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[1]_i_1 
       (.I0(s_axi_awaddr[1]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[1] ),
        .O(skid_buffer[1]));
(* SOFT_HLUTNM = "soft_lutpair64" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[20]_i_1 
       (.I0(s_axi_awaddr[20]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[20] ),
        .O(skid_buffer[20]));
(* SOFT_HLUTNM = "soft_lutpair56" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[21]_i_1 
       (.I0(s_axi_awaddr[21]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[21] ),
        .O(skid_buffer[21]));
(* SOFT_HLUTNM = "soft_lutpair64" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[22]_i_1 
       (.I0(s_axi_awaddr[22]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[22] ),
        .O(skid_buffer[22]));
(* SOFT_HLUTNM = "soft_lutpair63" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[23]_i_1 
       (.I0(s_axi_awaddr[23]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[23] ),
        .O(skid_buffer[23]));
(* SOFT_HLUTNM = "soft_lutpair63" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[24]_i_1 
       (.I0(s_axi_awaddr[24]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[24] ),
        .O(skid_buffer[24]));
(* SOFT_HLUTNM = "soft_lutpair62" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[25]_i_1 
       (.I0(s_axi_awaddr[25]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[25] ),
        .O(skid_buffer[25]));
(* SOFT_HLUTNM = "soft_lutpair62" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[26]_i_1 
       (.I0(s_axi_awaddr[26]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[26] ),
        .O(skid_buffer[26]));
(* SOFT_HLUTNM = "soft_lutpair61" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[27]_i_1 
       (.I0(s_axi_awaddr[27]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[27] ),
        .O(skid_buffer[27]));
(* SOFT_HLUTNM = "soft_lutpair61" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[28]_i_1 
       (.I0(s_axi_awaddr[28]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[28] ),
        .O(skid_buffer[28]));
(* SOFT_HLUTNM = "soft_lutpair60" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[29]_i_1 
       (.I0(s_axi_awaddr[29]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[29] ),
        .O(skid_buffer[29]));
(* SOFT_HLUTNM = "soft_lutpair73" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[2]_i_1 
       (.I0(s_axi_awaddr[2]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[2] ),
        .O(skid_buffer[2]));
(* SOFT_HLUTNM = "soft_lutpair60" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[30]_i_1 
       (.I0(s_axi_awaddr[30]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[30] ),
        .O(skid_buffer[30]));
(* SOFT_HLUTNM = "soft_lutpair59" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[31]_i_2 
       (.I0(s_axi_awaddr[31]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[31] ),
        .O(skid_buffer[31]));
(* SOFT_HLUTNM = "soft_lutpair59" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[32]_i_1 
       (.I0(s_axi_awprot[0]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[32] ),
        .O(skid_buffer[32]));
(* SOFT_HLUTNM = "soft_lutpair58" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[33]_i_1 
       (.I0(s_axi_awprot[1]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[33] ),
        .O(skid_buffer[33]));
(* SOFT_HLUTNM = "soft_lutpair58" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[34]_i_1 
       (.I0(s_axi_awprot[2]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[34] ),
        .O(skid_buffer[34]));
(* SOFT_HLUTNM = "soft_lutpair57" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[35]_i_1__0 
       (.I0(s_axi_awsize[0]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[35] ),
        .O(skid_buffer[35]));
(* SOFT_HLUTNM = "soft_lutpair57" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[36]_i_1 
       (.I0(s_axi_awsize[1]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[36] ),
        .O(skid_buffer[36]));
(* SOFT_HLUTNM = "soft_lutpair56" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[38]_i_1 
       (.I0(s_axi_awburst[0]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[38] ),
        .O(skid_buffer[38]));
(* SOFT_HLUTNM = "soft_lutpair53" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[39]_i_1 
       (.I0(s_axi_awburst[1]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[39] ),
        .O(skid_buffer[39]));
(* SOFT_HLUTNM = "soft_lutpair71" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[3]_i_1 
       (.I0(s_axi_awaddr[3]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[3] ),
        .O(skid_buffer[3]));
(* SOFT_HLUTNM = "soft_lutpair55" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[44]_i_1 
       (.I0(s_axi_awlen[0]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[44] ),
        .O(skid_buffer[44]));
(* SOFT_HLUTNM = "soft_lutpair55" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[45]_i_1 
       (.I0(s_axi_awlen[1]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[45] ),
        .O(skid_buffer[45]));
(* SOFT_HLUTNM = "soft_lutpair54" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[46]_i_1 
       (.I0(s_axi_awlen[2]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[46] ),
        .O(skid_buffer[46]));
(* SOFT_HLUTNM = "soft_lutpair54" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[47]_i_1 
       (.I0(s_axi_awlen[3]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[47] ),
        .O(skid_buffer[47]));
(* SOFT_HLUTNM = "soft_lutpair73" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[4]_i_1 
       (.I0(s_axi_awaddr[4]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[4] ),
        .O(skid_buffer[4]));
(* SOFT_HLUTNM = "soft_lutpair53" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[50]_i_1 
       (.I0(s_axi_awid),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[50] ),
        .O(skid_buffer[50]));
(* SOFT_HLUTNM = "soft_lutpair72" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[5]_i_1 
       (.I0(s_axi_awaddr[5]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[5] ),
        .O(skid_buffer[5]));
(* SOFT_HLUTNM = "soft_lutpair72" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[6]_i_1 
       (.I0(s_axi_awaddr[6]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[6] ),
        .O(skid_buffer[6]));
(* SOFT_HLUTNM = "soft_lutpair71" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[7]_i_1 
       (.I0(s_axi_awaddr[7]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[7] ),
        .O(skid_buffer[7]));
(* SOFT_HLUTNM = "soft_lutpair70" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[8]_i_1 
       (.I0(s_axi_awaddr[8]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[8] ),
        .O(skid_buffer[8]));
(* SOFT_HLUTNM = "soft_lutpair66" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[9]_i_1 
       (.I0(s_axi_awaddr[9]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[9] ),
        .O(skid_buffer[9]));
FDRE \m_payload_i_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[0]),
        .Q(Q[0]),
        .R(1'b0));
FDRE \m_payload_i_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[10]),
        .Q(Q[10]),
        .R(1'b0));
FDRE \m_payload_i_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[11]),
        .Q(Q[11]),
        .R(1'b0));
FDRE \m_payload_i_reg[12] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[12]),
        .Q(Q[12]),
        .R(1'b0));
FDRE \m_payload_i_reg[13] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[13]),
        .Q(Q[13]),
        .R(1'b0));
FDRE \m_payload_i_reg[14] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[14]),
        .Q(Q[14]),
        .R(1'b0));
FDRE \m_payload_i_reg[15] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[15]),
        .Q(Q[15]),
        .R(1'b0));
FDRE \m_payload_i_reg[16] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[16]),
        .Q(Q[16]),
        .R(1'b0));
FDRE \m_payload_i_reg[17] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[17]),
        .Q(Q[17]),
        .R(1'b0));
FDRE \m_payload_i_reg[18] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[18]),
        .Q(Q[18]),
        .R(1'b0));
FDRE \m_payload_i_reg[19] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[19]),
        .Q(Q[19]),
        .R(1'b0));
FDRE \m_payload_i_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[1]),
        .Q(Q[1]),
        .R(1'b0));
FDRE \m_payload_i_reg[20] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[20]),
        .Q(Q[20]),
        .R(1'b0));
FDRE \m_payload_i_reg[21] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[21]),
        .Q(Q[21]),
        .R(1'b0));
FDRE \m_payload_i_reg[22] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[22]),
        .Q(Q[22]),
        .R(1'b0));
FDRE \m_payload_i_reg[23] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[23]),
        .Q(Q[23]),
        .R(1'b0));
FDRE \m_payload_i_reg[24] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[24]),
        .Q(Q[24]),
        .R(1'b0));
FDRE \m_payload_i_reg[25] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[25]),
        .Q(Q[25]),
        .R(1'b0));
FDRE \m_payload_i_reg[26] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[26]),
        .Q(Q[26]),
        .R(1'b0));
FDRE \m_payload_i_reg[27] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[27]),
        .Q(Q[27]),
        .R(1'b0));
FDRE \m_payload_i_reg[28] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[28]),
        .Q(Q[28]),
        .R(1'b0));
FDRE \m_payload_i_reg[29] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[29]),
        .Q(Q[29]),
        .R(1'b0));
FDRE \m_payload_i_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[2]),
        .Q(Q[2]),
        .R(1'b0));
FDRE \m_payload_i_reg[30] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[30]),
        .Q(Q[30]),
        .R(1'b0));
FDRE \m_payload_i_reg[31] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[31]),
        .Q(Q[31]),
        .R(1'b0));
FDRE \m_payload_i_reg[32] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[32]),
        .Q(Q[32]),
        .R(1'b0));
FDRE \m_payload_i_reg[33] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[33]),
        .Q(Q[33]),
        .R(1'b0));
FDRE \m_payload_i_reg[34] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[34]),
        .Q(Q[34]),
        .R(1'b0));
FDRE \m_payload_i_reg[35] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[35]),
        .Q(Q[35]),
        .R(1'b0));
FDRE \m_payload_i_reg[36] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[36]),
        .Q(Q[36]),
        .R(1'b0));
FDRE \m_payload_i_reg[38] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[38]),
        .Q(\n_0_m_payload_i_reg[38] ),
        .R(1'b0));
FDRE \m_payload_i_reg[39] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[39]),
        .Q(Q[37]),
        .R(1'b0));
FDRE \m_payload_i_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[3]),
        .Q(Q[3]),
        .R(1'b0));
FDRE \m_payload_i_reg[44] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[44]),
        .Q(Q[38]),
        .R(1'b0));
FDRE \m_payload_i_reg[45] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[45]),
        .Q(Q[39]),
        .R(1'b0));
FDRE \m_payload_i_reg[46] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[46]),
        .Q(Q[40]),
        .R(1'b0));
FDRE \m_payload_i_reg[47] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[47]),
        .Q(Q[41]),
        .R(1'b0));
FDRE \m_payload_i_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[4]),
        .Q(Q[4]),
        .R(1'b0));
FDRE \m_payload_i_reg[50] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[50]),
        .Q(Q[42]),
        .R(1'b0));
FDRE \m_payload_i_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[5]),
        .Q(Q[5]),
        .R(1'b0));
FDRE \m_payload_i_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[6]),
        .Q(Q[6]),
        .R(1'b0));
FDRE \m_payload_i_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[7]),
        .Q(Q[7]),
        .R(1'b0));
FDRE \m_payload_i_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[8]),
        .Q(Q[8]),
        .R(1'b0));
FDRE \m_payload_i_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(skid_buffer[9]),
        .Q(Q[9]),
        .R(1'b0));
LUT5 #(
    .INIT(32'hA2A2AAA2)) 
     m_valid_i_i_1
       (.I0(\n_0_aresetn_d_reg[1] ),
        .I1(O2),
        .I2(s_axi_awvalid),
        .I3(O1),
        .I4(b_push),
        .O(n_0_m_valid_i_i_1));
FDRE m_valid_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(n_0_m_valid_i_i_1),
        .Q(O1),
        .R(1'b0));
LUT4 #(
    .INIT(16'hFFFE)) 
     next_pending_r_i_2
       (.I0(Q[40]),
        .I1(Q[39]),
        .I2(Q[41]),
        .I3(Q[38]),
        .O(O14));
LUT5 #(
    .INIT(32'hA2A2AAA2)) 
     s_ready_i_i_1
       (.I0(\n_0_aresetn_d_reg[0] ),
        .I1(O1),
        .I2(b_push),
        .I3(O2),
        .I4(s_axi_awvalid),
        .O(n_0_s_ready_i_i_1));
FDRE s_ready_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(n_0_s_ready_i_i_1),
        .Q(O2),
        .R(1'b0));
FDRE \skid_buffer_reg[0] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[0]),
        .Q(\n_0_skid_buffer_reg[0] ),
        .R(1'b0));
FDRE \skid_buffer_reg[10] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[10]),
        .Q(\n_0_skid_buffer_reg[10] ),
        .R(1'b0));
FDRE \skid_buffer_reg[11] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[11]),
        .Q(\n_0_skid_buffer_reg[11] ),
        .R(1'b0));
FDRE \skid_buffer_reg[12] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[12]),
        .Q(\n_0_skid_buffer_reg[12] ),
        .R(1'b0));
FDRE \skid_buffer_reg[13] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[13]),
        .Q(\n_0_skid_buffer_reg[13] ),
        .R(1'b0));
FDRE \skid_buffer_reg[14] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[14]),
        .Q(\n_0_skid_buffer_reg[14] ),
        .R(1'b0));
FDRE \skid_buffer_reg[15] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[15]),
        .Q(\n_0_skid_buffer_reg[15] ),
        .R(1'b0));
FDRE \skid_buffer_reg[16] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[16]),
        .Q(\n_0_skid_buffer_reg[16] ),
        .R(1'b0));
FDRE \skid_buffer_reg[17] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[17]),
        .Q(\n_0_skid_buffer_reg[17] ),
        .R(1'b0));
FDRE \skid_buffer_reg[18] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[18]),
        .Q(\n_0_skid_buffer_reg[18] ),
        .R(1'b0));
FDRE \skid_buffer_reg[19] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[19]),
        .Q(\n_0_skid_buffer_reg[19] ),
        .R(1'b0));
FDRE \skid_buffer_reg[1] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[1]),
        .Q(\n_0_skid_buffer_reg[1] ),
        .R(1'b0));
FDRE \skid_buffer_reg[20] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[20]),
        .Q(\n_0_skid_buffer_reg[20] ),
        .R(1'b0));
FDRE \skid_buffer_reg[21] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[21]),
        .Q(\n_0_skid_buffer_reg[21] ),
        .R(1'b0));
FDRE \skid_buffer_reg[22] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[22]),
        .Q(\n_0_skid_buffer_reg[22] ),
        .R(1'b0));
FDRE \skid_buffer_reg[23] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[23]),
        .Q(\n_0_skid_buffer_reg[23] ),
        .R(1'b0));
FDRE \skid_buffer_reg[24] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[24]),
        .Q(\n_0_skid_buffer_reg[24] ),
        .R(1'b0));
FDRE \skid_buffer_reg[25] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[25]),
        .Q(\n_0_skid_buffer_reg[25] ),
        .R(1'b0));
FDRE \skid_buffer_reg[26] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[26]),
        .Q(\n_0_skid_buffer_reg[26] ),
        .R(1'b0));
FDRE \skid_buffer_reg[27] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[27]),
        .Q(\n_0_skid_buffer_reg[27] ),
        .R(1'b0));
FDRE \skid_buffer_reg[28] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[28]),
        .Q(\n_0_skid_buffer_reg[28] ),
        .R(1'b0));
FDRE \skid_buffer_reg[29] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[29]),
        .Q(\n_0_skid_buffer_reg[29] ),
        .R(1'b0));
FDRE \skid_buffer_reg[2] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[2]),
        .Q(\n_0_skid_buffer_reg[2] ),
        .R(1'b0));
FDRE \skid_buffer_reg[30] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[30]),
        .Q(\n_0_skid_buffer_reg[30] ),
        .R(1'b0));
FDRE \skid_buffer_reg[31] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[31]),
        .Q(\n_0_skid_buffer_reg[31] ),
        .R(1'b0));
FDRE \skid_buffer_reg[32] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awprot[0]),
        .Q(\n_0_skid_buffer_reg[32] ),
        .R(1'b0));
FDRE \skid_buffer_reg[33] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awprot[1]),
        .Q(\n_0_skid_buffer_reg[33] ),
        .R(1'b0));
FDRE \skid_buffer_reg[34] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awprot[2]),
        .Q(\n_0_skid_buffer_reg[34] ),
        .R(1'b0));
FDRE \skid_buffer_reg[35] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awsize[0]),
        .Q(\n_0_skid_buffer_reg[35] ),
        .R(1'b0));
FDRE \skid_buffer_reg[36] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awsize[1]),
        .Q(\n_0_skid_buffer_reg[36] ),
        .R(1'b0));
FDRE \skid_buffer_reg[38] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awburst[0]),
        .Q(\n_0_skid_buffer_reg[38] ),
        .R(1'b0));
FDRE \skid_buffer_reg[39] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awburst[1]),
        .Q(\n_0_skid_buffer_reg[39] ),
        .R(1'b0));
FDRE \skid_buffer_reg[3] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[3]),
        .Q(\n_0_skid_buffer_reg[3] ),
        .R(1'b0));
FDRE \skid_buffer_reg[44] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awlen[0]),
        .Q(\n_0_skid_buffer_reg[44] ),
        .R(1'b0));
FDRE \skid_buffer_reg[45] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awlen[1]),
        .Q(\n_0_skid_buffer_reg[45] ),
        .R(1'b0));
FDRE \skid_buffer_reg[46] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awlen[2]),
        .Q(\n_0_skid_buffer_reg[46] ),
        .R(1'b0));
FDRE \skid_buffer_reg[47] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awlen[3]),
        .Q(\n_0_skid_buffer_reg[47] ),
        .R(1'b0));
FDRE \skid_buffer_reg[4] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[4]),
        .Q(\n_0_skid_buffer_reg[4] ),
        .R(1'b0));
FDRE \skid_buffer_reg[50] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awid),
        .Q(\n_0_skid_buffer_reg[50] ),
        .R(1'b0));
FDRE \skid_buffer_reg[5] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[5]),
        .Q(\n_0_skid_buffer_reg[5] ),
        .R(1'b0));
FDRE \skid_buffer_reg[6] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[6]),
        .Q(\n_0_skid_buffer_reg[6] ),
        .R(1'b0));
FDRE \skid_buffer_reg[7] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[7]),
        .Q(\n_0_skid_buffer_reg[7] ),
        .R(1'b0));
FDRE \skid_buffer_reg[8] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[8]),
        .Q(\n_0_skid_buffer_reg[8] ),
        .R(1'b0));
FDRE \skid_buffer_reg[9] 
       (.C(aclk),
        .CE(O2),
        .D(s_axi_awaddr[9]),
        .Q(\n_0_skid_buffer_reg[9] ),
        .R(1'b0));
LUT4 #(
    .INIT(16'hAA8A)) 
     \wrap_boundary_axaddr_r[0]_i_1 
       (.I0(Q[0]),
        .I1(Q[36]),
        .I2(Q[38]),
        .I3(Q[35]),
        .O(O29[0]));
LUT5 #(
    .INIT(32'h8A888AAA)) 
     \wrap_boundary_axaddr_r[1]_i_1 
       (.I0(Q[1]),
        .I1(Q[36]),
        .I2(Q[38]),
        .I3(Q[35]),
        .I4(Q[39]),
        .O(O29[1]));
LUT6 #(
    .INIT(64'h8888082AAAAA082A)) 
     \wrap_boundary_axaddr_r[2]_i_1 
       (.I0(Q[2]),
        .I1(Q[35]),
        .I2(Q[39]),
        .I3(Q[40]),
        .I4(Q[36]),
        .I5(Q[38]),
        .O(O29[2]));
LUT6 #(
    .INIT(64'h020202A2A2A202A2)) 
     \wrap_boundary_axaddr_r[3]_i_1 
       (.I0(Q[3]),
        .I1(\n_0_wrap_boundary_axaddr_r[3]_i_2 ),
        .I2(Q[36]),
        .I3(Q[39]),
        .I4(Q[35]),
        .I5(Q[38]),
        .O(O29[3]));
(* SOFT_HLUTNM = "soft_lutpair50" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \wrap_boundary_axaddr_r[3]_i_2 
       (.I0(Q[40]),
        .I1(Q[35]),
        .I2(Q[41]),
        .O(\n_0_wrap_boundary_axaddr_r[3]_i_2 ));
LUT6 #(
    .INIT(64'h002AA02A0A2AAA2A)) 
     \wrap_boundary_axaddr_r[4]_i_1 
       (.I0(Q[4]),
        .I1(Q[41]),
        .I2(Q[35]),
        .I3(Q[36]),
        .I4(Q[39]),
        .I5(Q[40]),
        .O(O29[4]));
(* SOFT_HLUTNM = "soft_lutpair50" *) 
   LUT5 #(
    .INIT(32'h2A222AAA)) 
     \wrap_boundary_axaddr_r[5]_i_1 
       (.I0(Q[5]),
        .I1(Q[36]),
        .I2(Q[40]),
        .I3(Q[35]),
        .I4(Q[41]),
        .O(O29[5]));
LUT4 #(
    .INIT(16'h2AAA)) 
     \wrap_boundary_axaddr_r[6]_i_1 
       (.I0(Q[6]),
        .I1(Q[36]),
        .I2(Q[35]),
        .I3(Q[41]),
        .O(O29[6]));
LUT6 #(
    .INIT(64'h99A955A599A9AAAA)) 
     \wrap_cnt_r[1]_i_1 
       (.I0(O8[0]),
        .I1(O10),
        .I2(\n_0_wrap_cnt_r[1]_i_2 ),
        .I3(I7),
        .I4(I5),
        .I5(I6[0]),
        .O(D[0]));
LUT2 #(
    .INIT(4'h1)) 
     \wrap_cnt_r[1]_i_2 
       (.I0(O4),
        .I1(O3),
        .O(\n_0_wrap_cnt_r[1]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair51" *) 
   LUT3 #(
    .INIT(8'h6A)) 
     \wrap_cnt_r[2]_i_1 
       (.I0(O8[1]),
        .I1(\n_0_wrap_cnt_r[3]_i_2 ),
        .I2(O8[0]),
        .O(D[1]));
(* SOFT_HLUTNM = "soft_lutpair51" *) 
   LUT4 #(
    .INIT(16'h6AAA)) 
     \wrap_cnt_r[3]_i_1 
       (.I0(O8[2]),
        .I1(O8[0]),
        .I2(\n_0_wrap_cnt_r[3]_i_2 ),
        .I3(O8[1]),
        .O(D[2]));
LUT6 #(
    .INIT(64'hAAAAAAA8FFFFFFFC)) 
     \wrap_cnt_r[3]_i_2 
       (.I0(I8),
        .I1(O11),
        .I2(O5),
        .I3(O4),
        .I4(O3),
        .I5(\n_0_wrap_cnt_r[3]_i_4 ),
        .O(\n_0_wrap_cnt_r[3]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair49" *) 
   LUT5 #(
    .INIT(32'hFFFFF8FF)) 
     \wrap_cnt_r[3]_i_4 
       (.I0(Q[38]),
        .I1(\n_0_axaddr_offset_r[0]_i_2 ),
        .I2(I1[0]),
        .I3(O1),
        .I4(I1[1]),
        .O(\n_0_wrap_cnt_r[3]_i_4 ));
LUT6 #(
    .INIT(64'h0001000000010001)) 
     \wrap_second_len_r[0]_i_2 
       (.I0(O3),
        .I1(O4),
        .I2(O5),
        .I3(O9),
        .I4(I5),
        .I5(I9[3]),
        .O(O12));
LUT6 #(
    .INIT(64'h00000000FFE200E2)) 
     \wrap_second_len_r[0]_i_3 
       (.I0(Q[0]),
        .I1(Q[36]),
        .I2(Q[2]),
        .I3(Q[35]),
        .I4(\n_0_axaddr_offset_r[1]_i_2 ),
        .I5(\n_0_wrap_second_len_r[0]_i_4 ),
        .O(O10));
(* SOFT_HLUTNM = "soft_lutpair49" *) 
   LUT4 #(
    .INIT(16'hFFDF)) 
     \wrap_second_len_r[0]_i_4 
       (.I0(Q[38]),
        .I1(I1[0]),
        .I2(O1),
        .I3(I1[1]),
        .O(\n_0_wrap_second_len_r[0]_i_4 ));
LUT6 #(
    .INIT(64'hF00EFFFFF00E0000)) 
     \wrap_second_len_r[1]_i_1 
       (.I0(O11),
        .I1(O5),
        .I2(O3),
        .I3(O4),
        .I4(I5),
        .I5(I6[1]),
        .O(O8[0]));
LUT6 #(
    .INIT(64'hCCC2FFFFCCC20000)) 
     \wrap_second_len_r[2]_i_1 
       (.I0(O11),
        .I1(O5),
        .I2(O4),
        .I3(O3),
        .I4(I5),
        .I5(I6[2]),
        .O(O8[1]));
LUT6 #(
    .INIT(64'hFE00FFFFFE00FE00)) 
     \wrap_second_len_r[3]_i_1 
       (.I0(O3),
        .I1(O4),
        .I2(O5),
        .I3(O9),
        .I4(I5),
        .I5(I6[3]),
        .O(O8[2]));
LUT6 #(
    .INIT(64'h00000000EEE222E2)) 
     \wrap_second_len_r[3]_i_2 
       (.I0(\n_0_axaddr_offset_r[2]_i_2__0 ),
        .I1(Q[35]),
        .I2(Q[4]),
        .I3(Q[36]),
        .I4(Q[6]),
        .I5(O13),
        .O(O9));
endmodule

(* ORIG_REF_NAME = "axi_register_slice_v2_1_axic_register_slice" *) 
module axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice__parameterized1
   (O1,
    O2,
    shandshake,
    s_axi_bid,
    s_axi_bresp,
    aclk,
    s_axi_bready,
    si_rs_bvalid,
    out,
    I19,
    SR);
  output O1;
  output O2;
  output shandshake;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  input aclk;
  input s_axi_bready;
  input si_rs_bvalid;
  input [0:0]out;
  input [1:0]I19;
  input [0:0]SR;

  wire [1:0]I19;
  wire O1;
  wire O2;
  wire [0:0]SR;
  wire aclk;
  wire \n_0_aresetn_d_reg[0] ;
  wire \n_0_aresetn_d_reg[1] ;
  wire \n_0_m_payload_i[0]_i_1 ;
  wire \n_0_m_payload_i[1]_i_1 ;
  wire \n_0_m_payload_i[2]_i_1 ;
  wire n_0_m_valid_i_i_1__1;
  wire n_0_s_ready_i_i_1__1;
  wire \n_0_skid_buffer[0]_i_1 ;
  wire \n_0_skid_buffer[1]_i_1 ;
  wire \n_0_skid_buffer[2]_i_1 ;
  wire \n_0_skid_buffer_reg[0] ;
  wire \n_0_skid_buffer_reg[1] ;
  wire \n_0_skid_buffer_reg[2] ;
  wire [0:0]out;
  wire [0:0]s_axi_bid;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire shandshake;
  wire si_rs_bvalid;

FDRE #(
    .INIT(1'b0)) 
     \aresetn_d_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(1'b1),
        .Q(\n_0_aresetn_d_reg[0] ),
        .R(SR));
FDRE #(
    .INIT(1'b0)) 
     \aresetn_d_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_aresetn_d_reg[0] ),
        .Q(\n_0_aresetn_d_reg[1] ),
        .R(SR));
LUT6 #(
    .INIT(64'hB8FFB8B8B800B8B8)) 
     \m_payload_i[0]_i_1 
       (.I0(I19[0]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[0] ),
        .I3(s_axi_bready),
        .I4(O1),
        .I5(s_axi_bresp[0]),
        .O(\n_0_m_payload_i[0]_i_1 ));
LUT6 #(
    .INIT(64'hB8FFB8B8B800B8B8)) 
     \m_payload_i[1]_i_1 
       (.I0(I19[1]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[1] ),
        .I3(s_axi_bready),
        .I4(O1),
        .I5(s_axi_bresp[1]),
        .O(\n_0_m_payload_i[1]_i_1 ));
LUT6 #(
    .INIT(64'hB8FFB8B8B800B8B8)) 
     \m_payload_i[2]_i_1 
       (.I0(out),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[2] ),
        .I3(s_axi_bready),
        .I4(O1),
        .I5(s_axi_bid),
        .O(\n_0_m_payload_i[2]_i_1 ));
FDRE \m_payload_i_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_m_payload_i[0]_i_1 ),
        .Q(s_axi_bresp[0]),
        .R(1'b0));
FDRE \m_payload_i_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_m_payload_i[1]_i_1 ),
        .Q(s_axi_bresp[1]),
        .R(1'b0));
FDRE \m_payload_i_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_m_payload_i[2]_i_1 ),
        .Q(s_axi_bid),
        .R(1'b0));
(* SOFT_HLUTNM = "soft_lutpair75" *) 
   LUT5 #(
    .INIT(32'hA2A2AAA2)) 
     m_valid_i_i_1__1
       (.I0(\n_0_aresetn_d_reg[1] ),
        .I1(O2),
        .I2(si_rs_bvalid),
        .I3(O1),
        .I4(s_axi_bready),
        .O(n_0_m_valid_i_i_1__1));
FDRE m_valid_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(n_0_m_valid_i_i_1__1),
        .Q(O1),
        .R(1'b0));
LUT5 #(
    .INIT(32'hA2A2AAA2)) 
     s_ready_i_i_1__1
       (.I0(\n_0_aresetn_d_reg[0] ),
        .I1(O1),
        .I2(s_axi_bready),
        .I3(O2),
        .I4(si_rs_bvalid),
        .O(n_0_s_ready_i_i_1__1));
FDRE s_ready_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(n_0_s_ready_i_i_1__1),
        .Q(O2),
        .R(1'b0));
(* SOFT_HLUTNM = "soft_lutpair75" *) 
   LUT2 #(
    .INIT(4'h8)) 
     shandshake_r_i_1
       (.I0(O2),
        .I1(si_rs_bvalid),
        .O(shandshake));
(* SOFT_HLUTNM = "soft_lutpair76" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \skid_buffer[0]_i_1 
       (.I0(I19[0]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[0] ),
        .O(\n_0_skid_buffer[0]_i_1 ));
LUT3 #(
    .INIT(8'hB8)) 
     \skid_buffer[1]_i_1 
       (.I0(I19[1]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[1] ),
        .O(\n_0_skid_buffer[1]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair76" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \skid_buffer[2]_i_1 
       (.I0(out),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[2] ),
        .O(\n_0_skid_buffer[2]_i_1 ));
FDRE \skid_buffer_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_skid_buffer[0]_i_1 ),
        .Q(\n_0_skid_buffer_reg[0] ),
        .R(1'b0));
FDRE \skid_buffer_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_skid_buffer[1]_i_1 ),
        .Q(\n_0_skid_buffer_reg[1] ),
        .R(1'b0));
FDRE \skid_buffer_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_skid_buffer[2]_i_1 ),
        .Q(\n_0_skid_buffer_reg[2] ),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_register_slice_v2_1_axic_register_slice" *) 
module axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice__parameterized2
   (O1,
    O2,
    O34,
    aclk,
    s_axi_rready,
    I4,
    I20,
    I21,
    SR);
  output O1;
  output O2;
  output [35:0]O34;
  input aclk;
  input s_axi_rready;
  input I4;
  input [1:0]I20;
  input [33:0]I21;
  input [0:0]SR;

  wire [1:0]I20;
  wire [33:0]I21;
  wire I4;
  wire O1;
  wire O2;
  wire [35:0]O34;
  wire [0:0]SR;
  wire aclk;
  wire \n_0_aresetn_d_reg[0] ;
  wire \n_0_aresetn_d_reg[1] ;
  wire \n_0_m_payload_i[0]_i_1__1 ;
  wire \n_0_m_payload_i[10]_i_1__1 ;
  wire \n_0_m_payload_i[11]_i_1__1 ;
  wire \n_0_m_payload_i[12]_i_1__1 ;
  wire \n_0_m_payload_i[13]_i_1__1 ;
  wire \n_0_m_payload_i[14]_i_1__1 ;
  wire \n_0_m_payload_i[15]_i_1__1 ;
  wire \n_0_m_payload_i[16]_i_1__1 ;
  wire \n_0_m_payload_i[17]_i_1__1 ;
  wire \n_0_m_payload_i[18]_i_1__1 ;
  wire \n_0_m_payload_i[19]_i_1__1 ;
  wire \n_0_m_payload_i[1]_i_1__1 ;
  wire \n_0_m_payload_i[20]_i_1__1 ;
  wire \n_0_m_payload_i[21]_i_1__1 ;
  wire \n_0_m_payload_i[22]_i_1__1 ;
  wire \n_0_m_payload_i[23]_i_1__1 ;
  wire \n_0_m_payload_i[24]_i_1__1 ;
  wire \n_0_m_payload_i[25]_i_1__1 ;
  wire \n_0_m_payload_i[26]_i_1__1 ;
  wire \n_0_m_payload_i[27]_i_1__1 ;
  wire \n_0_m_payload_i[28]_i_1__1 ;
  wire \n_0_m_payload_i[29]_i_1__1 ;
  wire \n_0_m_payload_i[2]_i_1__1 ;
  wire \n_0_m_payload_i[30]_i_1__1 ;
  wire \n_0_m_payload_i[31]_i_1__0 ;
  wire \n_0_m_payload_i[32]_i_1__1 ;
  wire \n_0_m_payload_i[33]_i_1__1 ;
  wire \n_0_m_payload_i[34]_i_1__1 ;
  wire \n_0_m_payload_i[35]_i_2 ;
  wire \n_0_m_payload_i[3]_i_1__1 ;
  wire \n_0_m_payload_i[4]_i_1__1 ;
  wire \n_0_m_payload_i[5]_i_1__1 ;
  wire \n_0_m_payload_i[6]_i_1__1 ;
  wire \n_0_m_payload_i[7]_i_1__1 ;
  wire \n_0_m_payload_i[8]_i_1__1 ;
  wire \n_0_m_payload_i[9]_i_1__1 ;
  wire n_0_m_valid_i_i_1__0;
  wire n_0_s_ready_i_i_1__0;
  wire \n_0_skid_buffer_reg[0] ;
  wire \n_0_skid_buffer_reg[10] ;
  wire \n_0_skid_buffer_reg[11] ;
  wire \n_0_skid_buffer_reg[12] ;
  wire \n_0_skid_buffer_reg[13] ;
  wire \n_0_skid_buffer_reg[14] ;
  wire \n_0_skid_buffer_reg[15] ;
  wire \n_0_skid_buffer_reg[16] ;
  wire \n_0_skid_buffer_reg[17] ;
  wire \n_0_skid_buffer_reg[18] ;
  wire \n_0_skid_buffer_reg[19] ;
  wire \n_0_skid_buffer_reg[1] ;
  wire \n_0_skid_buffer_reg[20] ;
  wire \n_0_skid_buffer_reg[21] ;
  wire \n_0_skid_buffer_reg[22] ;
  wire \n_0_skid_buffer_reg[23] ;
  wire \n_0_skid_buffer_reg[24] ;
  wire \n_0_skid_buffer_reg[25] ;
  wire \n_0_skid_buffer_reg[26] ;
  wire \n_0_skid_buffer_reg[27] ;
  wire \n_0_skid_buffer_reg[28] ;
  wire \n_0_skid_buffer_reg[29] ;
  wire \n_0_skid_buffer_reg[2] ;
  wire \n_0_skid_buffer_reg[30] ;
  wire \n_0_skid_buffer_reg[31] ;
  wire \n_0_skid_buffer_reg[32] ;
  wire \n_0_skid_buffer_reg[33] ;
  wire \n_0_skid_buffer_reg[34] ;
  wire \n_0_skid_buffer_reg[35] ;
  wire \n_0_skid_buffer_reg[3] ;
  wire \n_0_skid_buffer_reg[4] ;
  wire \n_0_skid_buffer_reg[5] ;
  wire \n_0_skid_buffer_reg[6] ;
  wire \n_0_skid_buffer_reg[7] ;
  wire \n_0_skid_buffer_reg[8] ;
  wire \n_0_skid_buffer_reg[9] ;
  wire p_1_in;
  wire s_axi_rready;

FDRE #(
    .INIT(1'b0)) 
     \aresetn_d_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(1'b1),
        .Q(\n_0_aresetn_d_reg[0] ),
        .R(SR));
FDRE #(
    .INIT(1'b0)) 
     \aresetn_d_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\n_0_aresetn_d_reg[0] ),
        .Q(\n_0_aresetn_d_reg[1] ),
        .R(SR));
(* SOFT_HLUTNM = "soft_lutpair94" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[0]_i_1__1 
       (.I0(I21[0]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[0] ),
        .O(\n_0_m_payload_i[0]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair89" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[10]_i_1__1 
       (.I0(I21[10]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[10] ),
        .O(\n_0_m_payload_i[10]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair89" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[11]_i_1__1 
       (.I0(I21[11]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[11] ),
        .O(\n_0_m_payload_i[11]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair88" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[12]_i_1__1 
       (.I0(I21[12]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[12] ),
        .O(\n_0_m_payload_i[12]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair88" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[13]_i_1__1 
       (.I0(I21[13]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[13] ),
        .O(\n_0_m_payload_i[13]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair87" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[14]_i_1__1 
       (.I0(I21[14]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[14] ),
        .O(\n_0_m_payload_i[14]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair87" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[15]_i_1__1 
       (.I0(I21[15]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[15] ),
        .O(\n_0_m_payload_i[15]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair86" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[16]_i_1__1 
       (.I0(I21[16]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[16] ),
        .O(\n_0_m_payload_i[16]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair86" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[17]_i_1__1 
       (.I0(I21[17]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[17] ),
        .O(\n_0_m_payload_i[17]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair85" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[18]_i_1__1 
       (.I0(I21[18]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[18] ),
        .O(\n_0_m_payload_i[18]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair85" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[19]_i_1__1 
       (.I0(I21[19]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[19] ),
        .O(\n_0_m_payload_i[19]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair94" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[1]_i_1__1 
       (.I0(I21[1]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[1] ),
        .O(\n_0_m_payload_i[1]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair84" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[20]_i_1__1 
       (.I0(I21[20]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[20] ),
        .O(\n_0_m_payload_i[20]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair84" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[21]_i_1__1 
       (.I0(I21[21]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[21] ),
        .O(\n_0_m_payload_i[21]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair83" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[22]_i_1__1 
       (.I0(I21[22]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[22] ),
        .O(\n_0_m_payload_i[22]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair83" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[23]_i_1__1 
       (.I0(I21[23]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[23] ),
        .O(\n_0_m_payload_i[23]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair82" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[24]_i_1__1 
       (.I0(I21[24]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[24] ),
        .O(\n_0_m_payload_i[24]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair82" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[25]_i_1__1 
       (.I0(I21[25]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[25] ),
        .O(\n_0_m_payload_i[25]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair81" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[26]_i_1__1 
       (.I0(I21[26]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[26] ),
        .O(\n_0_m_payload_i[26]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair81" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[27]_i_1__1 
       (.I0(I21[27]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[27] ),
        .O(\n_0_m_payload_i[27]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair80" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[28]_i_1__1 
       (.I0(I21[28]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[28] ),
        .O(\n_0_m_payload_i[28]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair80" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[29]_i_1__1 
       (.I0(I21[29]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[29] ),
        .O(\n_0_m_payload_i[29]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair93" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[2]_i_1__1 
       (.I0(I21[2]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[2] ),
        .O(\n_0_m_payload_i[2]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair79" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[30]_i_1__1 
       (.I0(I21[30]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[30] ),
        .O(\n_0_m_payload_i[30]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair79" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[31]_i_1__0 
       (.I0(I21[31]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[31] ),
        .O(\n_0_m_payload_i[31]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair78" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[32]_i_1__1 
       (.I0(I21[32]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[32] ),
        .O(\n_0_m_payload_i[32]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair78" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[33]_i_1__1 
       (.I0(I21[33]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[33] ),
        .O(\n_0_m_payload_i[33]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair77" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[34]_i_1__1 
       (.I0(I20[0]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[34] ),
        .O(\n_0_m_payload_i[34]_i_1__1 ));
LUT2 #(
    .INIT(4'hB)) 
     \m_payload_i[35]_i_1 
       (.I0(s_axi_rready),
        .I1(O1),
        .O(p_1_in));
(* SOFT_HLUTNM = "soft_lutpair77" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[35]_i_2 
       (.I0(I20[1]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[35] ),
        .O(\n_0_m_payload_i[35]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair93" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[3]_i_1__1 
       (.I0(I21[3]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[3] ),
        .O(\n_0_m_payload_i[3]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair92" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[4]_i_1__1 
       (.I0(I21[4]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[4] ),
        .O(\n_0_m_payload_i[4]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair92" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[5]_i_1__1 
       (.I0(I21[5]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[5] ),
        .O(\n_0_m_payload_i[5]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair91" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[6]_i_1__1 
       (.I0(I21[6]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[6] ),
        .O(\n_0_m_payload_i[6]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair91" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[7]_i_1__1 
       (.I0(I21[7]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[7] ),
        .O(\n_0_m_payload_i[7]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair90" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[8]_i_1__1 
       (.I0(I21[8]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[8] ),
        .O(\n_0_m_payload_i[8]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair90" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_payload_i[9]_i_1__1 
       (.I0(I21[9]),
        .I1(O2),
        .I2(\n_0_skid_buffer_reg[9] ),
        .O(\n_0_m_payload_i[9]_i_1__1 ));
FDRE \m_payload_i_reg[0] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[0]_i_1__1 ),
        .Q(O34[0]),
        .R(1'b0));
FDRE \m_payload_i_reg[10] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[10]_i_1__1 ),
        .Q(O34[10]),
        .R(1'b0));
FDRE \m_payload_i_reg[11] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[11]_i_1__1 ),
        .Q(O34[11]),
        .R(1'b0));
FDRE \m_payload_i_reg[12] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[12]_i_1__1 ),
        .Q(O34[12]),
        .R(1'b0));
FDRE \m_payload_i_reg[13] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[13]_i_1__1 ),
        .Q(O34[13]),
        .R(1'b0));
FDRE \m_payload_i_reg[14] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[14]_i_1__1 ),
        .Q(O34[14]),
        .R(1'b0));
FDRE \m_payload_i_reg[15] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[15]_i_1__1 ),
        .Q(O34[15]),
        .R(1'b0));
FDRE \m_payload_i_reg[16] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[16]_i_1__1 ),
        .Q(O34[16]),
        .R(1'b0));
FDRE \m_payload_i_reg[17] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[17]_i_1__1 ),
        .Q(O34[17]),
        .R(1'b0));
FDRE \m_payload_i_reg[18] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[18]_i_1__1 ),
        .Q(O34[18]),
        .R(1'b0));
FDRE \m_payload_i_reg[19] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[19]_i_1__1 ),
        .Q(O34[19]),
        .R(1'b0));
FDRE \m_payload_i_reg[1] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[1]_i_1__1 ),
        .Q(O34[1]),
        .R(1'b0));
FDRE \m_payload_i_reg[20] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[20]_i_1__1 ),
        .Q(O34[20]),
        .R(1'b0));
FDRE \m_payload_i_reg[21] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[21]_i_1__1 ),
        .Q(O34[21]),
        .R(1'b0));
FDRE \m_payload_i_reg[22] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[22]_i_1__1 ),
        .Q(O34[22]),
        .R(1'b0));
FDRE \m_payload_i_reg[23] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[23]_i_1__1 ),
        .Q(O34[23]),
        .R(1'b0));
FDRE \m_payload_i_reg[24] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[24]_i_1__1 ),
        .Q(O34[24]),
        .R(1'b0));
FDRE \m_payload_i_reg[25] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[25]_i_1__1 ),
        .Q(O34[25]),
        .R(1'b0));
FDRE \m_payload_i_reg[26] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[26]_i_1__1 ),
        .Q(O34[26]),
        .R(1'b0));
FDRE \m_payload_i_reg[27] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[27]_i_1__1 ),
        .Q(O34[27]),
        .R(1'b0));
FDRE \m_payload_i_reg[28] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[28]_i_1__1 ),
        .Q(O34[28]),
        .R(1'b0));
FDRE \m_payload_i_reg[29] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[29]_i_1__1 ),
        .Q(O34[29]),
        .R(1'b0));
FDRE \m_payload_i_reg[2] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[2]_i_1__1 ),
        .Q(O34[2]),
        .R(1'b0));
FDRE \m_payload_i_reg[30] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[30]_i_1__1 ),
        .Q(O34[30]),
        .R(1'b0));
FDRE \m_payload_i_reg[31] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[31]_i_1__0 ),
        .Q(O34[31]),
        .R(1'b0));
FDRE \m_payload_i_reg[32] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[32]_i_1__1 ),
        .Q(O34[32]),
        .R(1'b0));
FDRE \m_payload_i_reg[33] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[33]_i_1__1 ),
        .Q(O34[33]),
        .R(1'b0));
FDRE \m_payload_i_reg[34] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[34]_i_1__1 ),
        .Q(O34[34]),
        .R(1'b0));
FDRE \m_payload_i_reg[35] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[35]_i_2 ),
        .Q(O34[35]),
        .R(1'b0));
FDRE \m_payload_i_reg[3] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[3]_i_1__1 ),
        .Q(O34[3]),
        .R(1'b0));
FDRE \m_payload_i_reg[4] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[4]_i_1__1 ),
        .Q(O34[4]),
        .R(1'b0));
FDRE \m_payload_i_reg[5] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[5]_i_1__1 ),
        .Q(O34[5]),
        .R(1'b0));
FDRE \m_payload_i_reg[6] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[6]_i_1__1 ),
        .Q(O34[6]),
        .R(1'b0));
FDRE \m_payload_i_reg[7] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[7]_i_1__1 ),
        .Q(O34[7]),
        .R(1'b0));
FDRE \m_payload_i_reg[8] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[8]_i_1__1 ),
        .Q(O34[8]),
        .R(1'b0));
FDRE \m_payload_i_reg[9] 
       (.C(aclk),
        .CE(p_1_in),
        .D(\n_0_m_payload_i[9]_i_1__1 ),
        .Q(O34[9]),
        .R(1'b0));
LUT5 #(
    .INIT(32'h2A2AAA2A)) 
     m_valid_i_i_1__0
       (.I0(\n_0_aresetn_d_reg[1] ),
        .I1(I4),
        .I2(O2),
        .I3(O1),
        .I4(s_axi_rready),
        .O(n_0_m_valid_i_i_1__0));
FDRE m_valid_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(n_0_m_valid_i_i_1__0),
        .Q(O1),
        .R(1'b0));
LUT5 #(
    .INIT(32'hAAA2A2A2)) 
     s_ready_i_i_1__0
       (.I0(\n_0_aresetn_d_reg[0] ),
        .I1(O1),
        .I2(s_axi_rready),
        .I3(I4),
        .I4(O2),
        .O(n_0_s_ready_i_i_1__0));
FDRE s_ready_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(n_0_s_ready_i_i_1__0),
        .Q(O2),
        .R(1'b0));
FDRE \skid_buffer_reg[0] 
       (.C(aclk),
        .CE(O2),
        .D(I21[0]),
        .Q(\n_0_skid_buffer_reg[0] ),
        .R(1'b0));
FDRE \skid_buffer_reg[10] 
       (.C(aclk),
        .CE(O2),
        .D(I21[10]),
        .Q(\n_0_skid_buffer_reg[10] ),
        .R(1'b0));
FDRE \skid_buffer_reg[11] 
       (.C(aclk),
        .CE(O2),
        .D(I21[11]),
        .Q(\n_0_skid_buffer_reg[11] ),
        .R(1'b0));
FDRE \skid_buffer_reg[12] 
       (.C(aclk),
        .CE(O2),
        .D(I21[12]),
        .Q(\n_0_skid_buffer_reg[12] ),
        .R(1'b0));
FDRE \skid_buffer_reg[13] 
       (.C(aclk),
        .CE(O2),
        .D(I21[13]),
        .Q(\n_0_skid_buffer_reg[13] ),
        .R(1'b0));
FDRE \skid_buffer_reg[14] 
       (.C(aclk),
        .CE(O2),
        .D(I21[14]),
        .Q(\n_0_skid_buffer_reg[14] ),
        .R(1'b0));
FDRE \skid_buffer_reg[15] 
       (.C(aclk),
        .CE(O2),
        .D(I21[15]),
        .Q(\n_0_skid_buffer_reg[15] ),
        .R(1'b0));
FDRE \skid_buffer_reg[16] 
       (.C(aclk),
        .CE(O2),
        .D(I21[16]),
        .Q(\n_0_skid_buffer_reg[16] ),
        .R(1'b0));
FDRE \skid_buffer_reg[17] 
       (.C(aclk),
        .CE(O2),
        .D(I21[17]),
        .Q(\n_0_skid_buffer_reg[17] ),
        .R(1'b0));
FDRE \skid_buffer_reg[18] 
       (.C(aclk),
        .CE(O2),
        .D(I21[18]),
        .Q(\n_0_skid_buffer_reg[18] ),
        .R(1'b0));
FDRE \skid_buffer_reg[19] 
       (.C(aclk),
        .CE(O2),
        .D(I21[19]),
        .Q(\n_0_skid_buffer_reg[19] ),
        .R(1'b0));
FDRE \skid_buffer_reg[1] 
       (.C(aclk),
        .CE(O2),
        .D(I21[1]),
        .Q(\n_0_skid_buffer_reg[1] ),
        .R(1'b0));
FDRE \skid_buffer_reg[20] 
       (.C(aclk),
        .CE(O2),
        .D(I21[20]),
        .Q(\n_0_skid_buffer_reg[20] ),
        .R(1'b0));
FDRE \skid_buffer_reg[21] 
       (.C(aclk),
        .CE(O2),
        .D(I21[21]),
        .Q(\n_0_skid_buffer_reg[21] ),
        .R(1'b0));
FDRE \skid_buffer_reg[22] 
       (.C(aclk),
        .CE(O2),
        .D(I21[22]),
        .Q(\n_0_skid_buffer_reg[22] ),
        .R(1'b0));
FDRE \skid_buffer_reg[23] 
       (.C(aclk),
        .CE(O2),
        .D(I21[23]),
        .Q(\n_0_skid_buffer_reg[23] ),
        .R(1'b0));
FDRE \skid_buffer_reg[24] 
       (.C(aclk),
        .CE(O2),
        .D(I21[24]),
        .Q(\n_0_skid_buffer_reg[24] ),
        .R(1'b0));
FDRE \skid_buffer_reg[25] 
       (.C(aclk),
        .CE(O2),
        .D(I21[25]),
        .Q(\n_0_skid_buffer_reg[25] ),
        .R(1'b0));
FDRE \skid_buffer_reg[26] 
       (.C(aclk),
        .CE(O2),
        .D(I21[26]),
        .Q(\n_0_skid_buffer_reg[26] ),
        .R(1'b0));
FDRE \skid_buffer_reg[27] 
       (.C(aclk),
        .CE(O2),
        .D(I21[27]),
        .Q(\n_0_skid_buffer_reg[27] ),
        .R(1'b0));
FDRE \skid_buffer_reg[28] 
       (.C(aclk),
        .CE(O2),
        .D(I21[28]),
        .Q(\n_0_skid_buffer_reg[28] ),
        .R(1'b0));
FDRE \skid_buffer_reg[29] 
       (.C(aclk),
        .CE(O2),
        .D(I21[29]),
        .Q(\n_0_skid_buffer_reg[29] ),
        .R(1'b0));
FDRE \skid_buffer_reg[2] 
       (.C(aclk),
        .CE(O2),
        .D(I21[2]),
        .Q(\n_0_skid_buffer_reg[2] ),
        .R(1'b0));
FDRE \skid_buffer_reg[30] 
       (.C(aclk),
        .CE(O2),
        .D(I21[30]),
        .Q(\n_0_skid_buffer_reg[30] ),
        .R(1'b0));
FDRE \skid_buffer_reg[31] 
       (.C(aclk),
        .CE(O2),
        .D(I21[31]),
        .Q(\n_0_skid_buffer_reg[31] ),
        .R(1'b0));
FDRE \skid_buffer_reg[32] 
       (.C(aclk),
        .CE(O2),
        .D(I21[32]),
        .Q(\n_0_skid_buffer_reg[32] ),
        .R(1'b0));
FDRE \skid_buffer_reg[33] 
       (.C(aclk),
        .CE(O2),
        .D(I21[33]),
        .Q(\n_0_skid_buffer_reg[33] ),
        .R(1'b0));
FDRE \skid_buffer_reg[34] 
       (.C(aclk),
        .CE(O2),
        .D(I20[0]),
        .Q(\n_0_skid_buffer_reg[34] ),
        .R(1'b0));
FDRE \skid_buffer_reg[35] 
       (.C(aclk),
        .CE(O2),
        .D(I20[1]),
        .Q(\n_0_skid_buffer_reg[35] ),
        .R(1'b0));
FDRE \skid_buffer_reg[3] 
       (.C(aclk),
        .CE(O2),
        .D(I21[3]),
        .Q(\n_0_skid_buffer_reg[3] ),
        .R(1'b0));
FDRE \skid_buffer_reg[4] 
       (.C(aclk),
        .CE(O2),
        .D(I21[4]),
        .Q(\n_0_skid_buffer_reg[4] ),
        .R(1'b0));
FDRE \skid_buffer_reg[5] 
       (.C(aclk),
        .CE(O2),
        .D(I21[5]),
        .Q(\n_0_skid_buffer_reg[5] ),
        .R(1'b0));
FDRE \skid_buffer_reg[6] 
       (.C(aclk),
        .CE(O2),
        .D(I21[6]),
        .Q(\n_0_skid_buffer_reg[6] ),
        .R(1'b0));
FDRE \skid_buffer_reg[7] 
       (.C(aclk),
        .CE(O2),
        .D(I21[7]),
        .Q(\n_0_skid_buffer_reg[7] ),
        .R(1'b0));
FDRE \skid_buffer_reg[8] 
       (.C(aclk),
        .CE(O2),
        .D(I21[8]),
        .Q(\n_0_skid_buffer_reg[8] ),
        .R(1'b0));
FDRE \skid_buffer_reg[9] 
       (.C(aclk),
        .CE(O2),
        .D(I21[9]),
        .Q(\n_0_skid_buffer_reg[9] ),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
