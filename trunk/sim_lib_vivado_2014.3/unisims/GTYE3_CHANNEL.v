///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2014 Xilinx Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____   ____
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \   \   \/      Version     : 2012.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        _description_
// /___/   /\      Filename    : GTYE3_CHANNEL.v
// \   \  /  \ 
//  \___\/\___\                    
//                                 
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module GTYE3_CHANNEL #(
  `ifdef XIL_TIMING
  parameter LOC = "UNPLACED",  
  `endif
  parameter [0:0] ACJTAG_DEBUG_MODE = 1'b0,
  parameter [0:0] ACJTAG_MODE = 1'b0,
  parameter [0:0] ACJTAG_RESET = 1'b0,
  parameter [15:0] ADAPT_CFG0 = 16'h9200,
  parameter [15:0] ADAPT_CFG1 = 16'h801C,
  parameter [15:0] ADAPT_CFG2 = 16'b0000000000000000,
  parameter ALIGN_COMMA_DOUBLE = "FALSE",
  parameter [9:0] ALIGN_COMMA_ENABLE = 10'b0001111111,
  parameter integer ALIGN_COMMA_WORD = 1,
  parameter ALIGN_MCOMMA_DET = "TRUE",
  parameter [9:0] ALIGN_MCOMMA_VALUE = 10'b1010000011,
  parameter ALIGN_PCOMMA_DET = "TRUE",
  parameter [9:0] ALIGN_PCOMMA_VALUE = 10'b0101111100,
  parameter [0:0] AUTO_BW_SEL_BYPASS = 1'b0,
  parameter [0:0] A_RXOSCALRESET = 1'b0,
  parameter [0:0] A_RXPROGDIVRESET = 1'b0,
  parameter [4:0] A_TXDIFFCTRL = 5'b01100,
  parameter [0:0] A_TXPROGDIVRESET = 1'b0,
  parameter [0:0] CAPBYPASS_FORCE = 1'b0,
  parameter CBCC_DATA_SOURCE_SEL = "DECODED",
  parameter [0:0] CDR_SWAP_MODE_EN = 1'b0,
  parameter CHAN_BOND_KEEP_ALIGN = "FALSE",
  parameter integer CHAN_BOND_MAX_SKEW = 7,
  parameter [9:0] CHAN_BOND_SEQ_1_1 = 10'b0101111100,
  parameter [9:0] CHAN_BOND_SEQ_1_2 = 10'b0000000000,
  parameter [9:0] CHAN_BOND_SEQ_1_3 = 10'b0000000000,
  parameter [9:0] CHAN_BOND_SEQ_1_4 = 10'b0000000000,
  parameter [3:0] CHAN_BOND_SEQ_1_ENABLE = 4'b1111,
  parameter [9:0] CHAN_BOND_SEQ_2_1 = 10'b0100000000,
  parameter [9:0] CHAN_BOND_SEQ_2_2 = 10'b0100000000,
  parameter [9:0] CHAN_BOND_SEQ_2_3 = 10'b0100000000,
  parameter [9:0] CHAN_BOND_SEQ_2_4 = 10'b0100000000,
  parameter [3:0] CHAN_BOND_SEQ_2_ENABLE = 4'b1111,
  parameter CHAN_BOND_SEQ_2_USE = "FALSE",
  parameter integer CHAN_BOND_SEQ_LEN = 2,
  parameter [15:0] CH_HSPMUX = 16'h0000,
  parameter [15:0] CKCAL1_CFG_0 = 16'b0000000000000000,
  parameter [15:0] CKCAL1_CFG_1 = 16'b0000000000000000,
  parameter [15:0] CKCAL1_CFG_2 = 16'b0000000000000000,
  parameter [15:0] CKCAL1_CFG_3 = 16'b0000000000000000,
  parameter [15:0] CKCAL2_CFG_0 = 16'b0000000000000000,
  parameter [15:0] CKCAL2_CFG_1 = 16'b0000000000000000,
  parameter [15:0] CKCAL2_CFG_2 = 16'b0000000000000000,
  parameter [15:0] CKCAL2_CFG_3 = 16'b0000000000000000,
  parameter [15:0] CKCAL2_CFG_4 = 16'b0000000000000000,
  parameter [15:0] CKCAL_RSVD0 = 16'h0000,
  parameter [15:0] CKCAL_RSVD1 = 16'h0000,
  parameter CLK_CORRECT_USE = "TRUE",
  parameter CLK_COR_KEEP_IDLE = "FALSE",
  parameter integer CLK_COR_MAX_LAT = 20,
  parameter integer CLK_COR_MIN_LAT = 18,
  parameter CLK_COR_PRECEDENCE = "TRUE",
  parameter integer CLK_COR_REPEAT_WAIT = 0,
  parameter [9:0] CLK_COR_SEQ_1_1 = 10'b0100011100,
  parameter [9:0] CLK_COR_SEQ_1_2 = 10'b0000000000,
  parameter [9:0] CLK_COR_SEQ_1_3 = 10'b0000000000,
  parameter [9:0] CLK_COR_SEQ_1_4 = 10'b0000000000,
  parameter [3:0] CLK_COR_SEQ_1_ENABLE = 4'b1111,
  parameter [9:0] CLK_COR_SEQ_2_1 = 10'b0100000000,
  parameter [9:0] CLK_COR_SEQ_2_2 = 10'b0100000000,
  parameter [9:0] CLK_COR_SEQ_2_3 = 10'b0100000000,
  parameter [9:0] CLK_COR_SEQ_2_4 = 10'b0100000000,
  parameter [3:0] CLK_COR_SEQ_2_ENABLE = 4'b1111,
  parameter CLK_COR_SEQ_2_USE = "FALSE",
  parameter integer CLK_COR_SEQ_LEN = 2,
  parameter [15:0] CPLL_CFG0 = 16'h20F8,
  parameter [15:0] CPLL_CFG1 = 16'hA494,
  parameter [15:0] CPLL_CFG2 = 16'hF001,
  parameter [5:0] CPLL_CFG3 = 6'h00,
  parameter integer CPLL_FBDIV = 4,
  parameter integer CPLL_FBDIV_45 = 4,
  parameter [15:0] CPLL_INIT_CFG0 = 16'h001E,
  parameter [7:0] CPLL_INIT_CFG1 = 8'h00,
  parameter [15:0] CPLL_LOCK_CFG = 16'h01E8,
  parameter integer CPLL_REFCLK_DIV = 1,
  parameter [2:0] CTLE3_OCAP_EXT_CTRL = 3'b000,
  parameter [0:0] CTLE3_OCAP_EXT_EN = 1'b0,
  parameter [1:0] DDI_CTRL = 2'b00,
  parameter integer DDI_REALIGN_WAIT = 15,
  parameter DEC_MCOMMA_DETECT = "TRUE",
  parameter DEC_PCOMMA_DETECT = "TRUE",
  parameter DEC_VALID_COMMA_ONLY = "TRUE",
  parameter [0:0] DFE_D_X_REL_POS = 1'b0,
  parameter [0:0] DFE_VCM_COMP_EN = 1'b0,
  parameter [9:0] DMONITOR_CFG0 = 10'h000,
  parameter [7:0] DMONITOR_CFG1 = 8'h00,
  parameter [0:0] ES_CLK_PHASE_SEL = 1'b0,
  parameter [5:0] ES_CONTROL = 6'b000000,
  parameter ES_ERRDET_EN = "FALSE",
  parameter ES_EYE_SCAN_EN = "FALSE",
  parameter [11:0] ES_HORZ_OFFSET = 12'h000,
  parameter [9:0] ES_PMA_CFG = 10'b0000000000,
  parameter [4:0] ES_PRESCALE = 5'b00000,
  parameter [15:0] ES_QUALIFIER0 = 16'h0000,
  parameter [15:0] ES_QUALIFIER1 = 16'h0000,
  parameter [15:0] ES_QUALIFIER2 = 16'h0000,
  parameter [15:0] ES_QUALIFIER3 = 16'h0000,
  parameter [15:0] ES_QUALIFIER4 = 16'h0000,
  parameter [15:0] ES_QUALIFIER5 = 16'h0000,
  parameter [15:0] ES_QUALIFIER6 = 16'h0000,
  parameter [15:0] ES_QUALIFIER7 = 16'h0000,
  parameter [15:0] ES_QUALIFIER8 = 16'h0000,
  parameter [15:0] ES_QUALIFIER9 = 16'h0000,
  parameter [15:0] ES_QUAL_MASK0 = 16'h0000,
  parameter [15:0] ES_QUAL_MASK1 = 16'h0000,
  parameter [15:0] ES_QUAL_MASK2 = 16'h0000,
  parameter [15:0] ES_QUAL_MASK3 = 16'h0000,
  parameter [15:0] ES_QUAL_MASK4 = 16'h0000,
  parameter [15:0] ES_QUAL_MASK5 = 16'h0000,
  parameter [15:0] ES_QUAL_MASK6 = 16'h0000,
  parameter [15:0] ES_QUAL_MASK7 = 16'h0000,
  parameter [15:0] ES_QUAL_MASK8 = 16'h0000,
  parameter [15:0] ES_QUAL_MASK9 = 16'h0000,
  parameter [15:0] ES_SDATA_MASK0 = 16'h0000,
  parameter [15:0] ES_SDATA_MASK1 = 16'h0000,
  parameter [15:0] ES_SDATA_MASK2 = 16'h0000,
  parameter [15:0] ES_SDATA_MASK3 = 16'h0000,
  parameter [15:0] ES_SDATA_MASK4 = 16'h0000,
  parameter [15:0] ES_SDATA_MASK5 = 16'h0000,
  parameter [15:0] ES_SDATA_MASK6 = 16'h0000,
  parameter [15:0] ES_SDATA_MASK7 = 16'h0000,
  parameter [15:0] ES_SDATA_MASK8 = 16'h0000,
  parameter [15:0] ES_SDATA_MASK9 = 16'h0000,
  parameter [10:0] EVODD_PHI_CFG = 11'b00000000000,
  parameter [0:0] EYE_SCAN_SWAP_EN = 1'b0,
  parameter [3:0] FTS_DESKEW_SEQ_ENABLE = 4'b1111,
  parameter [3:0] FTS_LANE_DESKEW_CFG = 4'b1111,
  parameter FTS_LANE_DESKEW_EN = "FALSE",
  parameter [4:0] GEARBOX_MODE = 5'b00000,
  parameter [0:0] GM_BIAS_SELECT = 1'b0,
  parameter [0:0] ISCAN_CK_PH_SEL2 = 1'b0,
  parameter [0:0] LOCAL_MASTER = 1'b0,
  parameter [15:0] LOOP0_CFG = 16'h0000,
  parameter [15:0] LOOP10_CFG = 16'h0000,
  parameter [15:0] LOOP11_CFG = 16'h0000,
  parameter [15:0] LOOP12_CFG = 16'h0000,
  parameter [15:0] LOOP13_CFG = 16'h0000,
  parameter [15:0] LOOP1_CFG = 16'h0000,
  parameter [15:0] LOOP2_CFG = 16'h0000,
  parameter [15:0] LOOP3_CFG = 16'h0000,
  parameter [15:0] LOOP4_CFG = 16'h0000,
  parameter [15:0] LOOP5_CFG = 16'h0000,
  parameter [15:0] LOOP6_CFG = 16'h0000,
  parameter [15:0] LOOP7_CFG = 16'h0000,
  parameter [15:0] LOOP8_CFG = 16'h0000,
  parameter [15:0] LOOP9_CFG = 16'h0000,
  parameter [2:0] LPBK_BIAS_CTRL = 3'b000,
  parameter [0:0] LPBK_EN_RCAL_B = 1'b0,
  parameter [3:0] LPBK_EXT_RCAL = 4'b0000,
  parameter [3:0] LPBK_RG_CTRL = 4'b0000,
  parameter [1:0] OOBDIVCTL = 2'b00,
  parameter [0:0] OOB_PWRUP = 1'b0,
  parameter PCI3_AUTO_REALIGN = "FRST_SMPL",
  parameter [0:0] PCI3_PIPE_RX_ELECIDLE = 1'b1,
  parameter [1:0] PCI3_RX_ASYNC_EBUF_BYPASS = 2'b00,
  parameter [0:0] PCI3_RX_ELECIDLE_EI2_ENABLE = 1'b0,
  parameter [5:0] PCI3_RX_ELECIDLE_H2L_COUNT = 6'b000000,
  parameter [2:0] PCI3_RX_ELECIDLE_H2L_DISABLE = 3'b000,
  parameter [5:0] PCI3_RX_ELECIDLE_HI_COUNT = 6'b000000,
  parameter [0:0] PCI3_RX_ELECIDLE_LP4_DISABLE = 1'b0,
  parameter [0:0] PCI3_RX_FIFO_DISABLE = 1'b0,
  parameter [15:0] PCIE_BUFG_DIV_CTRL = 16'h0000,
  parameter [15:0] PCIE_RXPCS_CFG_GEN3 = 16'h0000,
  parameter [15:0] PCIE_RXPMA_CFG = 16'h0000,
  parameter [15:0] PCIE_TXPCS_CFG_GEN3 = 16'h0000,
  parameter [15:0] PCIE_TXPMA_CFG = 16'h0000,
  parameter PCS_PCIE_EN = "FALSE",
  parameter [15:0] PCS_RSVD0 = 16'b0000000000000000,
  parameter [2:0] PCS_RSVD1 = 3'b000,
  parameter [11:0] PD_TRANS_TIME_FROM_P2 = 12'h03C,
  parameter [7:0] PD_TRANS_TIME_NONE_P2 = 8'h19,
  parameter [7:0] PD_TRANS_TIME_TO_P2 = 8'h64,
  parameter [1:0] PLL_SEL_MODE_GEN12 = 2'h0,
  parameter [1:0] PLL_SEL_MODE_GEN3 = 2'h0,
  parameter [15:0] PMA_RSV0 = 16'h0000,
  parameter [15:0] PMA_RSV1 = 16'h0000,
  parameter integer PREIQ_FREQ_BST = 0,
  parameter [2:0] PROCESS_PAR = 3'b010,
  parameter [0:0] RATE_SW_USE_DRP = 1'b0,
  parameter [0:0] RESET_POWERSAVE_DISABLE = 1'b0,
  parameter [4:0] RXBUFRESET_TIME = 5'b00001,
  parameter RXBUF_ADDR_MODE = "FULL",
  parameter [3:0] RXBUF_EIDLE_HI_CNT = 4'b1000,
  parameter [3:0] RXBUF_EIDLE_LO_CNT = 4'b0000,
  parameter RXBUF_EN = "TRUE",
  parameter RXBUF_RESET_ON_CB_CHANGE = "TRUE",
  parameter RXBUF_RESET_ON_COMMAALIGN = "FALSE",
  parameter RXBUF_RESET_ON_EIDLE = "FALSE",
  parameter RXBUF_RESET_ON_RATE_CHANGE = "TRUE",
  parameter integer RXBUF_THRESH_OVFLW = 0,
  parameter RXBUF_THRESH_OVRD = "FALSE",
  parameter integer RXBUF_THRESH_UNDFLW = 4,
  parameter [4:0] RXCDRFREQRESET_TIME = 5'b00001,
  parameter [4:0] RXCDRPHRESET_TIME = 5'b00001,
  parameter [15:0] RXCDR_CFG0 = 16'h0000,
  parameter [15:0] RXCDR_CFG0_GEN3 = 16'h0000,
  parameter [15:0] RXCDR_CFG1 = 16'h0300,
  parameter [15:0] RXCDR_CFG1_GEN3 = 16'h0300,
  parameter [15:0] RXCDR_CFG2 = 16'h0060,
  parameter [15:0] RXCDR_CFG2_GEN3 = 16'h0060,
  parameter [15:0] RXCDR_CFG3 = 16'h0000,
  parameter [15:0] RXCDR_CFG3_GEN3 = 16'h0000,
  parameter [15:0] RXCDR_CFG4 = 16'h0002,
  parameter [15:0] RXCDR_CFG4_GEN3 = 16'h0002,
  parameter [15:0] RXCDR_CFG5 = 16'h0000,
  parameter [15:0] RXCDR_CFG5_GEN3 = 16'h0000,
  parameter [0:0] RXCDR_FR_RESET_ON_EIDLE = 1'b0,
  parameter [0:0] RXCDR_HOLD_DURING_EIDLE = 1'b0,
  parameter [15:0] RXCDR_LOCK_CFG0 = 16'h0001,
  parameter [15:0] RXCDR_LOCK_CFG1 = 16'h0000,
  parameter [15:0] RXCDR_LOCK_CFG2 = 16'h0000,
  parameter [15:0] RXCDR_LOCK_CFG3 = 16'h0000,
  parameter [0:0] RXCDR_PH_RESET_ON_EIDLE = 1'b0,
  parameter [1:0] RXCFOKDONE_SRC = 2'b00,
  parameter [15:0] RXCFOK_CFG0 = 16'h3E00,
  parameter [15:0] RXCFOK_CFG1 = 16'h0042,
  parameter [15:0] RXCFOK_CFG2 = 16'h002D,
  parameter [6:0] RXDFELPMRESET_TIME = 7'b0001111,
  parameter [15:0] RXDFELPM_KL_CFG0 = 16'h0000,
  parameter [15:0] RXDFELPM_KL_CFG1 = 16'h0022,
  parameter [15:0] RXDFELPM_KL_CFG2 = 16'h0100,
  parameter [15:0] RXDFE_CFG0 = 16'h4C00,
  parameter [15:0] RXDFE_CFG1 = 16'h0000,
  parameter [15:0] RXDFE_GC_CFG0 = 16'h1E00,
  parameter [15:0] RXDFE_GC_CFG1 = 16'h1900,
  parameter [15:0] RXDFE_GC_CFG2 = 16'h0000,
  parameter [15:0] RXDFE_H2_CFG0 = 16'h0000,
  parameter [15:0] RXDFE_H2_CFG1 = 16'h0002,
  parameter [15:0] RXDFE_H3_CFG0 = 16'h0000,
  parameter [15:0] RXDFE_H3_CFG1 = 16'h0002,
  parameter [15:0] RXDFE_H4_CFG0 = 16'h0000,
  parameter [15:0] RXDFE_H4_CFG1 = 16'h0003,
  parameter [15:0] RXDFE_H5_CFG0 = 16'h0000,
  parameter [15:0] RXDFE_H5_CFG1 = 16'h0002,
  parameter [15:0] RXDFE_H6_CFG0 = 16'h0000,
  parameter [15:0] RXDFE_H6_CFG1 = 16'h0002,
  parameter [15:0] RXDFE_H7_CFG0 = 16'h0000,
  parameter [15:0] RXDFE_H7_CFG1 = 16'h0002,
  parameter [15:0] RXDFE_H8_CFG0 = 16'h0000,
  parameter [15:0] RXDFE_H8_CFG1 = 16'h0002,
  parameter [15:0] RXDFE_H9_CFG0 = 16'h0000,
  parameter [15:0] RXDFE_H9_CFG1 = 16'h0002,
  parameter [15:0] RXDFE_HA_CFG0 = 16'h0000,
  parameter [15:0] RXDFE_HA_CFG1 = 16'h0002,
  parameter [15:0] RXDFE_HB_CFG0 = 16'h0000,
  parameter [15:0] RXDFE_HB_CFG1 = 16'h0002,
  parameter [15:0] RXDFE_HC_CFG0 = 16'h0000,
  parameter [15:0] RXDFE_HC_CFG1 = 16'h0002,
  parameter [15:0] RXDFE_HD_CFG0 = 16'h0000,
  parameter [15:0] RXDFE_HD_CFG1 = 16'h0002,
  parameter [15:0] RXDFE_HE_CFG0 = 16'h0000,
  parameter [15:0] RXDFE_HE_CFG1 = 16'h0002,
  parameter [15:0] RXDFE_HF_CFG0 = 16'h0000,
  parameter [15:0] RXDFE_HF_CFG1 = 16'h0002,
  parameter [15:0] RXDFE_OS_CFG0 = 16'h0000,
  parameter [15:0] RXDFE_OS_CFG1 = 16'h0200,
  parameter [0:0] RXDFE_PWR_SAVING = 1'b0,
  parameter [15:0] RXDFE_UT_CFG0 = 16'h0000,
  parameter [15:0] RXDFE_UT_CFG1 = 16'h0002,
  parameter [15:0] RXDFE_VP_CFG0 = 16'h0000,
  parameter [15:0] RXDFE_VP_CFG1 = 16'h0022,
  parameter [15:0] RXDLY_CFG = 16'h001F,
  parameter [15:0] RXDLY_LCFG = 16'h0030,
  parameter RXELECIDLE_CFG = "SIGCFG_4",
  parameter integer RXGBOX_FIFO_INIT_RD_ADDR = 4,
  parameter RXGEARBOX_EN = "FALSE",
  parameter [4:0] RXISCANRESET_TIME = 5'b00001,
  parameter [15:0] RXLPM_CFG = 16'h0000,
  parameter [15:0] RXLPM_GC_CFG = 16'h0200,
  parameter [15:0] RXLPM_KH_CFG0 = 16'h0000,
  parameter [15:0] RXLPM_KH_CFG1 = 16'h0002,
  parameter [15:0] RXLPM_OS_CFG0 = 16'h0400,
  parameter [15:0] RXLPM_OS_CFG1 = 16'h0000,
  parameter [8:0] RXOOB_CFG = 9'b000000110,
  parameter RXOOB_CLK_CFG = "PMA",
  parameter [4:0] RXOSCALRESET_TIME = 5'b00011,
  parameter integer RXOUT_DIV = 4,
  parameter [4:0] RXPCSRESET_TIME = 5'b00001,
  parameter [15:0] RXPHBEACON_CFG = 16'h0000,
  parameter [15:0] RXPHDLY_CFG = 16'h2020,
  parameter [15:0] RXPHSAMP_CFG = 16'h2100,
  parameter [15:0] RXPHSLIP_CFG = 16'h9933,
  parameter [4:0] RXPH_MONITOR_SEL = 5'b00000,
  parameter [0:0] RXPI_AUTO_BW_SEL_BYPASS = 1'b0,
  parameter [15:0] RXPI_CFG = 16'h0100,
  parameter [0:0] RXPI_LPM = 1'b0,
  parameter [15:0] RXPI_RSV0 = 16'h0000,
  parameter [1:0] RXPI_SEL_LC = 2'b00,
  parameter [1:0] RXPI_STARTCODE = 2'b00,
  parameter [0:0] RXPI_VREFSEL = 1'b0,
  parameter RXPMACLK_SEL = "DATA",
  parameter [4:0] RXPMARESET_TIME = 5'b00001,
  parameter [0:0] RXPRBS_ERR_LOOPBACK = 1'b0,
  parameter integer RXPRBS_LINKACQ_CNT = 15,
  parameter integer RXSLIDE_AUTO_WAIT = 7,
  parameter RXSLIDE_MODE = "OFF",
  parameter [0:0] RXSYNC_MULTILANE = 1'b0,
  parameter [0:0] RXSYNC_OVRD = 1'b0,
  parameter [0:0] RXSYNC_SKIP_DA = 1'b0,
  parameter [0:0] RX_AFE_CM_EN = 1'b0,
  parameter [15:0] RX_BIAS_CFG0 = 16'h1534,
  parameter [5:0] RX_BUFFER_CFG = 6'b000000,
  parameter [0:0] RX_CAPFF_SARC_ENB = 1'b0,
  parameter integer RX_CLK25_DIV = 8,
  parameter [0:0] RX_CLKMUX_EN = 1'b1,
  parameter [4:0] RX_CLK_SLIP_OVRD = 5'b00000,
  parameter [3:0] RX_CM_BUF_CFG = 4'b1010,
  parameter [0:0] RX_CM_BUF_PD = 1'b0,
  parameter integer RX_CM_SEL = 3,
  parameter integer RX_CM_TRIM = 10,
  parameter [0:0] RX_CTLE1_KHKL = 1'b0,
  parameter [0:0] RX_CTLE2_KHKL = 1'b0,
  parameter [0:0] RX_CTLE3_AGC = 1'b0,
  parameter integer RX_DATA_WIDTH = 20,
  parameter [5:0] RX_DDI_SEL = 6'b000000,
  parameter RX_DEFER_RESET_BUF_EN = "TRUE",
  parameter [2:0] RX_DEGEN_CTRL = 3'b010,
  parameter integer RX_DFELPM_CFG0 = 6,
  parameter [0:0] RX_DFELPM_CFG1 = 1'b0,
  parameter [0:0] RX_DFELPM_KLKH_AGC_STUP_EN = 1'b1,
  parameter [1:0] RX_DFE_AGC_CFG0 = 2'b00,
  parameter integer RX_DFE_AGC_CFG1 = 4,
  parameter integer RX_DFE_KL_LPM_KH_CFG0 = 1,
  parameter integer RX_DFE_KL_LPM_KH_CFG1 = 2,
  parameter [1:0] RX_DFE_KL_LPM_KL_CFG0 = 2'b01,
  parameter [2:0] RX_DFE_KL_LPM_KL_CFG1 = 3'b010,
  parameter [0:0] RX_DFE_LPM_HOLD_DURING_EIDLE = 1'b0,
  parameter RX_DISPERR_SEQ_MATCH = "TRUE",
  parameter [0:0] RX_DIV2_MODE_B = 1'b0,
  parameter [4:0] RX_DIVRESET_TIME = 5'b00001,
  parameter [0:0] RX_EN_CTLE_RCAL_B = 1'b0,
  parameter [0:0] RX_EN_HI_LR = 1'b0,
  parameter [8:0] RX_EXT_RL_CTRL = 9'b000000000,
  parameter [6:0] RX_EYESCAN_VS_CODE = 7'b0000000,
  parameter [0:0] RX_EYESCAN_VS_NEG_DIR = 1'b0,
  parameter [1:0] RX_EYESCAN_VS_RANGE = 2'b00,
  parameter [0:0] RX_EYESCAN_VS_UT_SIGN = 1'b0,
  parameter [0:0] RX_FABINT_USRCLK_FLOP = 1'b0,
  parameter integer RX_INT_DATAWIDTH = 1,
  parameter [0:0] RX_PMA_POWER_SAVE = 1'b0,
  parameter real RX_PROGDIV_CFG = 0.0,
  parameter [15:0] RX_PROGDIV_RATE = 16'h0001,
  parameter [3:0] RX_RESLOAD_CTRL = 4'b0000,
  parameter [0:0] RX_RESLOAD_OVRD = 1'b0,
  parameter [2:0] RX_SAMPLE_PERIOD = 3'b101,
  parameter integer RX_SIG_VALID_DLY = 11,
  parameter [0:0] RX_SUM_DFETAPREP_EN = 1'b0,
  parameter [3:0] RX_SUM_IREF_TUNE = 4'b0000,
  parameter [3:0] RX_SUM_VCMTUNE = 4'b1000,
  parameter [0:0] RX_SUM_VCM_OVWR = 1'b0,
  parameter [2:0] RX_SUM_VREF_TUNE = 3'b100,
  parameter [1:0] RX_TUNE_AFE_OS = 2'b00,
  parameter [2:0] RX_VREG_CTRL = 3'b101,
  parameter [0:0] RX_VREG_PDB = 1'b1,
  parameter [1:0] RX_WIDEMODE_CDR = 2'b01,
  parameter RX_XCLK_SEL = "RXDES",
  parameter [0:0] RX_XMODE_SEL = 1'b0,
  parameter integer SAS_MAX_COM = 64,
  parameter integer SAS_MIN_COM = 36,
  parameter [3:0] SATA_BURST_SEQ_LEN = 4'b1111,
  parameter [2:0] SATA_BURST_VAL = 3'b100,
  parameter SATA_CPLL_CFG = "VCO_3000MHZ",
  parameter [2:0] SATA_EIDLE_VAL = 3'b100,
  parameter integer SATA_MAX_BURST = 8,
  parameter integer SATA_MAX_INIT = 21,
  parameter integer SATA_MAX_WAKE = 7,
  parameter integer SATA_MIN_BURST = 4,
  parameter integer SATA_MIN_INIT = 12,
  parameter integer SATA_MIN_WAKE = 4,
  parameter SHOW_REALIGN_COMMA = "TRUE",
  parameter SIM_RECEIVER_DETECT_PASS = "TRUE",
  parameter SIM_RESET_SPEEDUP = "TRUE",
  parameter [0:0] SIM_TX_EIDLE_DRIVE_LEVEL = 1'b0,
  parameter real SIM_VERSION = 1.0,
  parameter [1:0] TAPDLY_SET_TX = 2'h0,
  parameter [3:0] TEMPERATURE_PAR = 4'b0010,
  parameter [14:0] TERM_RCAL_CFG = 15'b100001000010000,
  parameter [2:0] TERM_RCAL_OVRD = 3'b000,
  parameter [7:0] TRANS_TIME_RATE = 8'h0E,
  parameter [7:0] TST_RSV0 = 8'h00,
  parameter [7:0] TST_RSV1 = 8'h00,
  parameter TXBUF_EN = "TRUE",
  parameter TXBUF_RESET_ON_RATE_CHANGE = "FALSE",
  parameter [15:0] TXDLY_CFG = 16'h001F,
  parameter [15:0] TXDLY_LCFG = 16'h0030,
  parameter TXFIFO_ADDR_CFG = "LOW",
  parameter integer TXGBOX_FIFO_INIT_RD_ADDR = 4,
  parameter TXGEARBOX_EN = "FALSE",
  parameter integer TXOUT_DIV = 4,
  parameter [4:0] TXPCSRESET_TIME = 5'b00001,
  parameter [15:0] TXPHDLY_CFG0 = 16'h2020,
  parameter [15:0] TXPHDLY_CFG1 = 16'h0001,
  parameter [15:0] TXPH_CFG = 16'h0123,
  parameter [15:0] TXPH_CFG2 = 16'h0000,
  parameter [4:0] TXPH_MONITOR_SEL = 5'b00000,
  parameter [1:0] TXPI_CFG0 = 2'b00,
  parameter [1:0] TXPI_CFG1 = 2'b00,
  parameter [1:0] TXPI_CFG2 = 2'b00,
  parameter [0:0] TXPI_CFG3 = 1'b0,
  parameter [0:0] TXPI_CFG4 = 1'b1,
  parameter [2:0] TXPI_CFG5 = 3'b000,
  parameter [0:0] TXPI_GRAY_SEL = 1'b0,
  parameter [0:0] TXPI_INVSTROBE_SEL = 1'b0,
  parameter [0:0] TXPI_LPM = 1'b0,
  parameter TXPI_PPMCLK_SEL = "TXUSRCLK2",
  parameter [7:0] TXPI_PPM_CFG = 8'b00000000,
  parameter [15:0] TXPI_RSV0 = 16'h0000,
  parameter [2:0] TXPI_SYNFREQ_PPM = 3'b000,
  parameter [0:0] TXPI_VREFSEL = 1'b0,
  parameter [4:0] TXPMARESET_TIME = 5'b00001,
  parameter [0:0] TXSYNC_MULTILANE = 1'b0,
  parameter [0:0] TXSYNC_OVRD = 1'b0,
  parameter [0:0] TXSYNC_SKIP_DA = 1'b0,
  parameter integer TX_CLK25_DIV = 8,
  parameter [0:0] TX_CLKMUX_EN = 1'b1,
  parameter [0:0] TX_CLKREG_PDB = 1'b0,
  parameter [2:0] TX_CLKREG_SET = 3'b000,
  parameter integer TX_DATA_WIDTH = 20,
  parameter [5:0] TX_DCD_CFG = 6'b000010,
  parameter [0:0] TX_DCD_EN = 1'b0,
  parameter [5:0] TX_DEEMPH0 = 6'b000000,
  parameter [5:0] TX_DEEMPH1 = 6'b000000,
  parameter [4:0] TX_DIVRESET_TIME = 5'b00001,
  parameter TX_DRIVE_MODE = "DIRECT",
  parameter integer TX_DRVMUX_CTRL = 2,
  parameter [2:0] TX_EIDLE_ASSERT_DELAY = 3'b110,
  parameter [2:0] TX_EIDLE_DEASSERT_DELAY = 3'b100,
  parameter [0:0] TX_EML_PHI_TUNE = 1'b0,
  parameter [0:0] TX_FABINT_USRCLK_FLOP = 1'b0,
  parameter [0:0] TX_FIFO_BYP_EN = 1'b0,
  parameter [0:0] TX_IDLE_DATA_ZERO = 1'b0,
  parameter integer TX_INT_DATAWIDTH = 1,
  parameter TX_LOOPBACK_DRIVE_HIZ = "FALSE",
  parameter [0:0] TX_MAINCURSOR_SEL = 1'b0,
  parameter [6:0] TX_MARGIN_FULL_0 = 7'b1001110,
  parameter [6:0] TX_MARGIN_FULL_1 = 7'b1001001,
  parameter [6:0] TX_MARGIN_FULL_2 = 7'b1000101,
  parameter [6:0] TX_MARGIN_FULL_3 = 7'b1000010,
  parameter [6:0] TX_MARGIN_FULL_4 = 7'b1000000,
  parameter [6:0] TX_MARGIN_LOW_0 = 7'b1000110,
  parameter [6:0] TX_MARGIN_LOW_1 = 7'b1000100,
  parameter [6:0] TX_MARGIN_LOW_2 = 7'b1000010,
  parameter [6:0] TX_MARGIN_LOW_3 = 7'b1000000,
  parameter [6:0] TX_MARGIN_LOW_4 = 7'b1000000,
  parameter [2:0] TX_MODE_SEL = 3'b000,
  parameter [15:0] TX_PHICAL_CFG0 = 16'h0000,
  parameter [15:0] TX_PHICAL_CFG1 = 16'h7E00,
  parameter [15:0] TX_PHICAL_CFG2 = 16'h0000,
  parameter integer TX_PI_BIASSET = 0,
  parameter [15:0] TX_PI_CFG0 = 16'h0000,
  parameter [15:0] TX_PI_CFG1 = 16'h0000,
  parameter [0:0] TX_PI_DIV2_MODE_B = 1'b0,
  parameter [0:0] TX_PI_SEL_QPLL0 = 1'b0,
  parameter [0:0] TX_PI_SEL_QPLL1 = 1'b0,
  parameter [0:0] TX_PMADATA_OPT = 1'b0,
  parameter [0:0] TX_PMA_POWER_SAVE = 1'b0,
  parameter integer TX_PREDRV_CTRL = 2,
  parameter TX_PROGCLK_SEL = "POSTPI",
  parameter real TX_PROGDIV_CFG = 0.0,
  parameter [15:0] TX_PROGDIV_RATE = 16'h0001,
  parameter [13:0] TX_RXDETECT_CFG = 14'h0032,
  parameter integer TX_RXDETECT_REF = 4,
  parameter [2:0] TX_SAMPLE_PERIOD = 3'b101,
  parameter [0:0] TX_SARC_LPBK_ENB = 1'b0,
  parameter TX_XCLK_SEL = "TXOUT",
  parameter [0:0] USE_PCS_CLK_PHASE_SEL = 1'b0
)(
  output [2:0] BUFGTCE,
  output [2:0] BUFGTCEMASK,
  output [8:0] BUFGTDIV,
  output [2:0] BUFGTRESET,
  output [2:0] BUFGTRSTMASK,
  output CPLLFBCLKLOST,
  output CPLLLOCK,
  output CPLLREFCLKLOST,
  output [16:0] DMONITOROUT,
  output [15:0] DRPDO,
  output DRPRDY,
  output EYESCANDATAERROR,
  output GTPOWERGOOD,
  output GTREFCLKMONITOR,
  output GTYTXN,
  output GTYTXP,
  output PCIERATEGEN3,
  output PCIERATEIDLE,
  output [1:0] PCIERATEQPLLPD,
  output [1:0] PCIERATEQPLLRESET,
  output PCIESYNCTXSYNCDONE,
  output PCIEUSERGEN3RDY,
  output PCIEUSERPHYSTATUSRST,
  output PCIEUSERRATESTART,
  output [15:0] PCSRSVDOUT,
  output PHYSTATUS,
  output [7:0] PINRSRVDAS,
  output RESETEXCEPTION,
  output [2:0] RXBUFSTATUS,
  output RXBYTEISALIGNED,
  output RXBYTEREALIGN,
  output RXCDRLOCK,
  output RXCDRPHDONE,
  output RXCHANBONDSEQ,
  output RXCHANISALIGNED,
  output RXCHANREALIGN,
  output [4:0] RXCHBONDO,
  output RXCKCALDONE,
  output [1:0] RXCLKCORCNT,
  output RXCOMINITDET,
  output RXCOMMADET,
  output RXCOMSASDET,
  output RXCOMWAKEDET,
  output [15:0] RXCTRL0,
  output [15:0] RXCTRL1,
  output [7:0] RXCTRL2,
  output [7:0] RXCTRL3,
  output [127:0] RXDATA,
  output [7:0] RXDATAEXTENDRSVD,
  output [1:0] RXDATAVALID,
  output RXDLYSRESETDONE,
  output RXELECIDLE,
  output [5:0] RXHEADER,
  output [1:0] RXHEADERVALID,
  output [6:0] RXMONITOROUT,
  output RXOSINTDONE,
  output RXOSINTSTARTED,
  output RXOSINTSTROBEDONE,
  output RXOSINTSTROBESTARTED,
  output RXOUTCLK,
  output RXOUTCLKFABRIC,
  output RXOUTCLKPCS,
  output RXPHALIGNDONE,
  output RXPHALIGNERR,
  output RXPMARESETDONE,
  output RXPRBSERR,
  output RXPRBSLOCKED,
  output RXPRGDIVRESETDONE,
  output RXRATEDONE,
  output RXRECCLKOUT,
  output RXRESETDONE,
  output RXSLIDERDY,
  output RXSLIPDONE,
  output RXSLIPOUTCLKRDY,
  output RXSLIPPMARDY,
  output [1:0] RXSTARTOFSEQ,
  output [2:0] RXSTATUS,
  output RXSYNCDONE,
  output RXSYNCOUT,
  output RXVALID,
  output [1:0] TXBUFSTATUS,
  output TXCOMFINISH,
  output TXDCCDONE,
  output TXDLYSRESETDONE,
  output TXOUTCLK,
  output TXOUTCLKFABRIC,
  output TXOUTCLKPCS,
  output TXPHALIGNDONE,
  output TXPHINITDONE,
  output TXPMARESETDONE,
  output TXPRGDIVRESETDONE,
  output TXRATEDONE,
  output TXRESETDONE,
  output TXSYNCDONE,
  output TXSYNCOUT,

  input CDRSTEPDIR,
  input CDRSTEPSQ,
  input CDRSTEPSX,
  input CFGRESET,
  input CLKRSVD0,
  input CLKRSVD1,
  input CPLLLOCKDETCLK,
  input CPLLLOCKEN,
  input CPLLPD,
  input [2:0] CPLLREFCLKSEL,
  input CPLLRESET,
  input DMONFIFORESET,
  input DMONITORCLK,
  input [9:0] DRPADDR,
  input DRPCLK,
  input [15:0] DRPDI,
  input DRPEN,
  input DRPWE,
  input ELPCALDVORWREN,
  input ELPCALPAORWREN,
  input EVODDPHICALDONE,
  input EVODDPHICALSTART,
  input EVODDPHIDRDEN,
  input EVODDPHIDWREN,
  input EVODDPHIXRDEN,
  input EVODDPHIXWREN,
  input EYESCANMODE,
  input EYESCANRESET,
  input EYESCANTRIGGER,
  input GTGREFCLK,
  input GTNORTHREFCLK0,
  input GTNORTHREFCLK1,
  input GTREFCLK0,
  input GTREFCLK1,
  input GTRESETSEL,
  input [15:0] GTRSVD,
  input GTRXRESET,
  input GTSOUTHREFCLK0,
  input GTSOUTHREFCLK1,
  input GTTXRESET,
  input GTYRXN,
  input GTYRXP,
  input [2:0] LOOPBACK,
  input [15:0] LOOPRSVD,
  input LPBKRXTXSEREN,
  input LPBKTXRXSEREN,
  input PCIEEQRXEQADAPTDONE,
  input PCIERSTIDLE,
  input PCIERSTTXSYNCSTART,
  input PCIEUSERRATEDONE,
  input [15:0] PCSRSVDIN,
  input [4:0] PCSRSVDIN2,
  input [4:0] PMARSVDIN,
  input QPLL0CLK,
  input QPLL0REFCLK,
  input QPLL1CLK,
  input QPLL1REFCLK,
  input RESETOVRD,
  input RSTCLKENTX,
  input RX8B10BEN,
  input RXBUFRESET,
  input RXCDRFREQRESET,
  input RXCDRHOLD,
  input RXCDROVRDEN,
  input RXCDRRESET,
  input RXCDRRESETRSV,
  input RXCHBONDEN,
  input [4:0] RXCHBONDI,
  input [2:0] RXCHBONDLEVEL,
  input RXCHBONDMASTER,
  input RXCHBONDSLAVE,
  input RXCKCALRESET,
  input RXCOMMADETEN,
  input RXDCCFORCESTART,
  input RXDFEAGCHOLD,
  input RXDFEAGCOVRDEN,
  input RXDFELFHOLD,
  input RXDFELFOVRDEN,
  input RXDFELPMRESET,
  input RXDFETAP10HOLD,
  input RXDFETAP10OVRDEN,
  input RXDFETAP11HOLD,
  input RXDFETAP11OVRDEN,
  input RXDFETAP12HOLD,
  input RXDFETAP12OVRDEN,
  input RXDFETAP13HOLD,
  input RXDFETAP13OVRDEN,
  input RXDFETAP14HOLD,
  input RXDFETAP14OVRDEN,
  input RXDFETAP15HOLD,
  input RXDFETAP15OVRDEN,
  input RXDFETAP2HOLD,
  input RXDFETAP2OVRDEN,
  input RXDFETAP3HOLD,
  input RXDFETAP3OVRDEN,
  input RXDFETAP4HOLD,
  input RXDFETAP4OVRDEN,
  input RXDFETAP5HOLD,
  input RXDFETAP5OVRDEN,
  input RXDFETAP6HOLD,
  input RXDFETAP6OVRDEN,
  input RXDFETAP7HOLD,
  input RXDFETAP7OVRDEN,
  input RXDFETAP8HOLD,
  input RXDFETAP8OVRDEN,
  input RXDFETAP9HOLD,
  input RXDFETAP9OVRDEN,
  input RXDFEUTHOLD,
  input RXDFEUTOVRDEN,
  input RXDFEVPHOLD,
  input RXDFEVPOVRDEN,
  input RXDFEVSEN,
  input RXDFEXYDEN,
  input RXDLYBYPASS,
  input RXDLYEN,
  input RXDLYOVRDEN,
  input RXDLYSRESET,
  input [1:0] RXELECIDLEMODE,
  input RXGEARBOXSLIP,
  input RXLATCLK,
  input RXLPMEN,
  input RXLPMGCHOLD,
  input RXLPMGCOVRDEN,
  input RXLPMHFHOLD,
  input RXLPMHFOVRDEN,
  input RXLPMLFHOLD,
  input RXLPMLFKLOVRDEN,
  input RXLPMOSHOLD,
  input RXLPMOSOVRDEN,
  input RXMCOMMAALIGNEN,
  input [1:0] RXMONITORSEL,
  input RXOOBRESET,
  input RXOSCALRESET,
  input RXOSHOLD,
  input [3:0] RXOSINTCFG,
  input RXOSINTEN,
  input RXOSINTHOLD,
  input RXOSINTOVRDEN,
  input RXOSINTSTROBE,
  input RXOSINTTESTOVRDEN,
  input RXOSOVRDEN,
  input [2:0] RXOUTCLKSEL,
  input RXPCOMMAALIGNEN,
  input RXPCSRESET,
  input [1:0] RXPD,
  input RXPHALIGN,
  input RXPHALIGNEN,
  input RXPHDLYPD,
  input RXPHDLYRESET,
  input RXPHOVRDEN,
  input [1:0] RXPLLCLKSEL,
  input RXPMARESET,
  input RXPOLARITY,
  input RXPRBSCNTRESET,
  input [3:0] RXPRBSSEL,
  input RXPROGDIVRESET,
  input [2:0] RXRATE,
  input RXRATEMODE,
  input RXSLIDE,
  input RXSLIPOUTCLK,
  input RXSLIPPMA,
  input RXSYNCALLIN,
  input RXSYNCIN,
  input RXSYNCMODE,
  input [1:0] RXSYSCLKSEL,
  input RXUSERRDY,
  input RXUSRCLK,
  input RXUSRCLK2,
  input SIGVALIDCLK,
  input [19:0] TSTIN,
  input [7:0] TX8B10BBYPASS,
  input TX8B10BEN,
  input [2:0] TXBUFDIFFCTRL,
  input TXCOMINIT,
  input TXCOMSAS,
  input TXCOMWAKE,
  input [15:0] TXCTRL0,
  input [15:0] TXCTRL1,
  input [7:0] TXCTRL2,
  input [127:0] TXDATA,
  input [7:0] TXDATAEXTENDRSVD,
  input TXDCCFORCESTART,
  input TXDCCRESET,
  input TXDEEMPH,
  input TXDETECTRX,
  input [4:0] TXDIFFCTRL,
  input TXDIFFPD,
  input TXDLYBYPASS,
  input TXDLYEN,
  input TXDLYHOLD,
  input TXDLYOVRDEN,
  input TXDLYSRESET,
  input TXDLYUPDOWN,
  input TXELECIDLE,
  input TXELFORCESTART,
  input [5:0] TXHEADER,
  input TXINHIBIT,
  input TXLATCLK,
  input [6:0] TXMAINCURSOR,
  input [2:0] TXMARGIN,
  input [2:0] TXOUTCLKSEL,
  input TXPCSRESET,
  input [1:0] TXPD,
  input TXPDELECIDLEMODE,
  input TXPHALIGN,
  input TXPHALIGNEN,
  input TXPHDLYPD,
  input TXPHDLYRESET,
  input TXPHDLYTSTCLK,
  input TXPHINIT,
  input TXPHOVRDEN,
  input TXPIPPMEN,
  input TXPIPPMOVRDEN,
  input TXPIPPMPD,
  input TXPIPPMSEL,
  input [4:0] TXPIPPMSTEPSIZE,
  input TXPISOPD,
  input [1:0] TXPLLCLKSEL,
  input TXPMARESET,
  input TXPOLARITY,
  input [4:0] TXPOSTCURSOR,
  input TXPRBSFORCEERR,
  input [3:0] TXPRBSSEL,
  input [4:0] TXPRECURSOR,
  input TXPROGDIVRESET,
  input [2:0] TXRATE,
  input TXRATEMODE,
  input [6:0] TXSEQUENCE,
  input TXSWING,
  input TXSYNCALLIN,
  input TXSYNCIN,
  input TXSYNCMODE,
  input [1:0] TXSYSCLKSEL,
  input TXUSERRDY,
  input TXUSRCLK,
  input TXUSRCLK2
);
  
// define constants
  localparam MODULE_NAME = "GTYE3_CHANNEL";
  localparam in_delay    = 0;
  localparam out_delay   = 0;
  localparam inclk_delay    = 0;
  localparam outclk_delay   = 0;

// Parameter encodings and registers

  `ifndef XIL_DR
  localparam [0:0] ACJTAG_DEBUG_MODE_REG = ACJTAG_DEBUG_MODE;
  localparam [0:0] ACJTAG_MODE_REG = ACJTAG_MODE;
  localparam [0:0] ACJTAG_RESET_REG = ACJTAG_RESET;
  localparam [15:0] ADAPT_CFG0_REG = ADAPT_CFG0;
  localparam [15:0] ADAPT_CFG1_REG = ADAPT_CFG1;
  localparam [15:0] ADAPT_CFG2_REG = ADAPT_CFG2;
  localparam [40:1] ALIGN_COMMA_DOUBLE_REG = ALIGN_COMMA_DOUBLE;
  localparam [9:0] ALIGN_COMMA_ENABLE_REG = ALIGN_COMMA_ENABLE;
  localparam [2:0] ALIGN_COMMA_WORD_REG = ALIGN_COMMA_WORD;
  localparam [40:1] ALIGN_MCOMMA_DET_REG = ALIGN_MCOMMA_DET;
  localparam [9:0] ALIGN_MCOMMA_VALUE_REG = ALIGN_MCOMMA_VALUE;
  localparam [40:1] ALIGN_PCOMMA_DET_REG = ALIGN_PCOMMA_DET;
  localparam [9:0] ALIGN_PCOMMA_VALUE_REG = ALIGN_PCOMMA_VALUE;
  localparam [0:0] AUTO_BW_SEL_BYPASS_REG = AUTO_BW_SEL_BYPASS;
  localparam [0:0] A_RXOSCALRESET_REG = A_RXOSCALRESET;
  localparam [0:0] A_RXPROGDIVRESET_REG = A_RXPROGDIVRESET;
  localparam [4:0] A_TXDIFFCTRL_REG = A_TXDIFFCTRL;
  localparam [0:0] A_TXPROGDIVRESET_REG = A_TXPROGDIVRESET;
  localparam [0:0] CAPBYPASS_FORCE_REG = CAPBYPASS_FORCE;
  localparam [56:1] CBCC_DATA_SOURCE_SEL_REG = CBCC_DATA_SOURCE_SEL;
  localparam [0:0] CDR_SWAP_MODE_EN_REG = CDR_SWAP_MODE_EN;
  localparam [40:1] CHAN_BOND_KEEP_ALIGN_REG = CHAN_BOND_KEEP_ALIGN;
  localparam [3:0] CHAN_BOND_MAX_SKEW_REG = CHAN_BOND_MAX_SKEW;
  localparam [9:0] CHAN_BOND_SEQ_1_1_REG = CHAN_BOND_SEQ_1_1;
  localparam [9:0] CHAN_BOND_SEQ_1_2_REG = CHAN_BOND_SEQ_1_2;
  localparam [9:0] CHAN_BOND_SEQ_1_3_REG = CHAN_BOND_SEQ_1_3;
  localparam [9:0] CHAN_BOND_SEQ_1_4_REG = CHAN_BOND_SEQ_1_4;
  localparam [3:0] CHAN_BOND_SEQ_1_ENABLE_REG = CHAN_BOND_SEQ_1_ENABLE;
  localparam [9:0] CHAN_BOND_SEQ_2_1_REG = CHAN_BOND_SEQ_2_1;
  localparam [9:0] CHAN_BOND_SEQ_2_2_REG = CHAN_BOND_SEQ_2_2;
  localparam [9:0] CHAN_BOND_SEQ_2_3_REG = CHAN_BOND_SEQ_2_3;
  localparam [9:0] CHAN_BOND_SEQ_2_4_REG = CHAN_BOND_SEQ_2_4;
  localparam [3:0] CHAN_BOND_SEQ_2_ENABLE_REG = CHAN_BOND_SEQ_2_ENABLE;
  localparam [40:1] CHAN_BOND_SEQ_2_USE_REG = CHAN_BOND_SEQ_2_USE;
  localparam [2:0] CHAN_BOND_SEQ_LEN_REG = CHAN_BOND_SEQ_LEN;
  localparam [15:0] CH_HSPMUX_REG = CH_HSPMUX;
  localparam [15:0] CKCAL1_CFG_0_REG = CKCAL1_CFG_0;
  localparam [15:0] CKCAL1_CFG_1_REG = CKCAL1_CFG_1;
  localparam [15:0] CKCAL1_CFG_2_REG = CKCAL1_CFG_2;
  localparam [15:0] CKCAL1_CFG_3_REG = CKCAL1_CFG_3;
  localparam [15:0] CKCAL2_CFG_0_REG = CKCAL2_CFG_0;
  localparam [15:0] CKCAL2_CFG_1_REG = CKCAL2_CFG_1;
  localparam [15:0] CKCAL2_CFG_2_REG = CKCAL2_CFG_2;
  localparam [15:0] CKCAL2_CFG_3_REG = CKCAL2_CFG_3;
  localparam [15:0] CKCAL2_CFG_4_REG = CKCAL2_CFG_4;
  localparam [15:0] CKCAL_RSVD0_REG = CKCAL_RSVD0;
  localparam [15:0] CKCAL_RSVD1_REG = CKCAL_RSVD1;
  localparam [40:1] CLK_CORRECT_USE_REG = CLK_CORRECT_USE;
  localparam [40:1] CLK_COR_KEEP_IDLE_REG = CLK_COR_KEEP_IDLE;
  localparam [5:0] CLK_COR_MAX_LAT_REG = CLK_COR_MAX_LAT;
  localparam [5:0] CLK_COR_MIN_LAT_REG = CLK_COR_MIN_LAT;
  localparam [40:1] CLK_COR_PRECEDENCE_REG = CLK_COR_PRECEDENCE;
  localparam [4:0] CLK_COR_REPEAT_WAIT_REG = CLK_COR_REPEAT_WAIT;
  localparam [9:0] CLK_COR_SEQ_1_1_REG = CLK_COR_SEQ_1_1;
  localparam [9:0] CLK_COR_SEQ_1_2_REG = CLK_COR_SEQ_1_2;
  localparam [9:0] CLK_COR_SEQ_1_3_REG = CLK_COR_SEQ_1_3;
  localparam [9:0] CLK_COR_SEQ_1_4_REG = CLK_COR_SEQ_1_4;
  localparam [3:0] CLK_COR_SEQ_1_ENABLE_REG = CLK_COR_SEQ_1_ENABLE;
  localparam [9:0] CLK_COR_SEQ_2_1_REG = CLK_COR_SEQ_2_1;
  localparam [9:0] CLK_COR_SEQ_2_2_REG = CLK_COR_SEQ_2_2;
  localparam [9:0] CLK_COR_SEQ_2_3_REG = CLK_COR_SEQ_2_3;
  localparam [9:0] CLK_COR_SEQ_2_4_REG = CLK_COR_SEQ_2_4;
  localparam [3:0] CLK_COR_SEQ_2_ENABLE_REG = CLK_COR_SEQ_2_ENABLE;
  localparam [40:1] CLK_COR_SEQ_2_USE_REG = CLK_COR_SEQ_2_USE;
  localparam [2:0] CLK_COR_SEQ_LEN_REG = CLK_COR_SEQ_LEN;
  localparam [15:0] CPLL_CFG0_REG = CPLL_CFG0;
  localparam [15:0] CPLL_CFG1_REG = CPLL_CFG1;
  localparam [15:0] CPLL_CFG2_REG = CPLL_CFG2;
  localparam [5:0] CPLL_CFG3_REG = CPLL_CFG3;
  localparam [4:0] CPLL_FBDIV_REG = CPLL_FBDIV;
  localparam [2:0] CPLL_FBDIV_45_REG = CPLL_FBDIV_45;
  localparam [15:0] CPLL_INIT_CFG0_REG = CPLL_INIT_CFG0;
  localparam [7:0] CPLL_INIT_CFG1_REG = CPLL_INIT_CFG1;
  localparam [15:0] CPLL_LOCK_CFG_REG = CPLL_LOCK_CFG;
  localparam [4:0] CPLL_REFCLK_DIV_REG = CPLL_REFCLK_DIV;
  localparam [2:0] CTLE3_OCAP_EXT_CTRL_REG = CTLE3_OCAP_EXT_CTRL;
  localparam [0:0] CTLE3_OCAP_EXT_EN_REG = CTLE3_OCAP_EXT_EN;
  localparam [1:0] DDI_CTRL_REG = DDI_CTRL;
  localparam [4:0] DDI_REALIGN_WAIT_REG = DDI_REALIGN_WAIT;
  localparam [40:1] DEC_MCOMMA_DETECT_REG = DEC_MCOMMA_DETECT;
  localparam [40:1] DEC_PCOMMA_DETECT_REG = DEC_PCOMMA_DETECT;
  localparam [40:1] DEC_VALID_COMMA_ONLY_REG = DEC_VALID_COMMA_ONLY;
  localparam [0:0] DFE_D_X_REL_POS_REG = DFE_D_X_REL_POS;
  localparam [0:0] DFE_VCM_COMP_EN_REG = DFE_VCM_COMP_EN;
  localparam [9:0] DMONITOR_CFG0_REG = DMONITOR_CFG0;
  localparam [7:0] DMONITOR_CFG1_REG = DMONITOR_CFG1;
  localparam [0:0] ES_CLK_PHASE_SEL_REG = ES_CLK_PHASE_SEL;
  localparam [5:0] ES_CONTROL_REG = ES_CONTROL;
  localparam [40:1] ES_ERRDET_EN_REG = ES_ERRDET_EN;
  localparam [40:1] ES_EYE_SCAN_EN_REG = ES_EYE_SCAN_EN;
  localparam [11:0] ES_HORZ_OFFSET_REG = ES_HORZ_OFFSET;
  localparam [9:0] ES_PMA_CFG_REG = ES_PMA_CFG;
  localparam [4:0] ES_PRESCALE_REG = ES_PRESCALE;
  localparam [15:0] ES_QUALIFIER0_REG = ES_QUALIFIER0;
  localparam [15:0] ES_QUALIFIER1_REG = ES_QUALIFIER1;
  localparam [15:0] ES_QUALIFIER2_REG = ES_QUALIFIER2;
  localparam [15:0] ES_QUALIFIER3_REG = ES_QUALIFIER3;
  localparam [15:0] ES_QUALIFIER4_REG = ES_QUALIFIER4;
  localparam [15:0] ES_QUALIFIER5_REG = ES_QUALIFIER5;
  localparam [15:0] ES_QUALIFIER6_REG = ES_QUALIFIER6;
  localparam [15:0] ES_QUALIFIER7_REG = ES_QUALIFIER7;
  localparam [15:0] ES_QUALIFIER8_REG = ES_QUALIFIER8;
  localparam [15:0] ES_QUALIFIER9_REG = ES_QUALIFIER9;
  localparam [15:0] ES_QUAL_MASK0_REG = ES_QUAL_MASK0;
  localparam [15:0] ES_QUAL_MASK1_REG = ES_QUAL_MASK1;
  localparam [15:0] ES_QUAL_MASK2_REG = ES_QUAL_MASK2;
  localparam [15:0] ES_QUAL_MASK3_REG = ES_QUAL_MASK3;
  localparam [15:0] ES_QUAL_MASK4_REG = ES_QUAL_MASK4;
  localparam [15:0] ES_QUAL_MASK5_REG = ES_QUAL_MASK5;
  localparam [15:0] ES_QUAL_MASK6_REG = ES_QUAL_MASK6;
  localparam [15:0] ES_QUAL_MASK7_REG = ES_QUAL_MASK7;
  localparam [15:0] ES_QUAL_MASK8_REG = ES_QUAL_MASK8;
  localparam [15:0] ES_QUAL_MASK9_REG = ES_QUAL_MASK9;
  localparam [15:0] ES_SDATA_MASK0_REG = ES_SDATA_MASK0;
  localparam [15:0] ES_SDATA_MASK1_REG = ES_SDATA_MASK1;
  localparam [15:0] ES_SDATA_MASK2_REG = ES_SDATA_MASK2;
  localparam [15:0] ES_SDATA_MASK3_REG = ES_SDATA_MASK3;
  localparam [15:0] ES_SDATA_MASK4_REG = ES_SDATA_MASK4;
  localparam [15:0] ES_SDATA_MASK5_REG = ES_SDATA_MASK5;
  localparam [15:0] ES_SDATA_MASK6_REG = ES_SDATA_MASK6;
  localparam [15:0] ES_SDATA_MASK7_REG = ES_SDATA_MASK7;
  localparam [15:0] ES_SDATA_MASK8_REG = ES_SDATA_MASK8;
  localparam [15:0] ES_SDATA_MASK9_REG = ES_SDATA_MASK9;
  localparam [10:0] EVODD_PHI_CFG_REG = EVODD_PHI_CFG;
  localparam [0:0] EYE_SCAN_SWAP_EN_REG = EYE_SCAN_SWAP_EN;
  localparam [3:0] FTS_DESKEW_SEQ_ENABLE_REG = FTS_DESKEW_SEQ_ENABLE;
  localparam [3:0] FTS_LANE_DESKEW_CFG_REG = FTS_LANE_DESKEW_CFG;
  localparam [40:1] FTS_LANE_DESKEW_EN_REG = FTS_LANE_DESKEW_EN;
  localparam [4:0] GEARBOX_MODE_REG = GEARBOX_MODE;
  localparam [0:0] GM_BIAS_SELECT_REG = GM_BIAS_SELECT;
  localparam [0:0] ISCAN_CK_PH_SEL2_REG = ISCAN_CK_PH_SEL2;
  localparam [0:0] LOCAL_MASTER_REG = LOCAL_MASTER;
  localparam [15:0] LOOP0_CFG_REG = LOOP0_CFG;
  localparam [15:0] LOOP10_CFG_REG = LOOP10_CFG;
  localparam [15:0] LOOP11_CFG_REG = LOOP11_CFG;
  localparam [15:0] LOOP12_CFG_REG = LOOP12_CFG;
  localparam [15:0] LOOP13_CFG_REG = LOOP13_CFG;
  localparam [15:0] LOOP1_CFG_REG = LOOP1_CFG;
  localparam [15:0] LOOP2_CFG_REG = LOOP2_CFG;
  localparam [15:0] LOOP3_CFG_REG = LOOP3_CFG;
  localparam [15:0] LOOP4_CFG_REG = LOOP4_CFG;
  localparam [15:0] LOOP5_CFG_REG = LOOP5_CFG;
  localparam [15:0] LOOP6_CFG_REG = LOOP6_CFG;
  localparam [15:0] LOOP7_CFG_REG = LOOP7_CFG;
  localparam [15:0] LOOP8_CFG_REG = LOOP8_CFG;
  localparam [15:0] LOOP9_CFG_REG = LOOP9_CFG;
  localparam [2:0] LPBK_BIAS_CTRL_REG = LPBK_BIAS_CTRL;
  localparam [0:0] LPBK_EN_RCAL_B_REG = LPBK_EN_RCAL_B;
  localparam [3:0] LPBK_EXT_RCAL_REG = LPBK_EXT_RCAL;
  localparam [3:0] LPBK_RG_CTRL_REG = LPBK_RG_CTRL;
  localparam [1:0] OOBDIVCTL_REG = OOBDIVCTL;
  localparam [0:0] OOB_PWRUP_REG = OOB_PWRUP;
  localparam [80:1] PCI3_AUTO_REALIGN_REG = PCI3_AUTO_REALIGN;
  localparam [0:0] PCI3_PIPE_RX_ELECIDLE_REG = PCI3_PIPE_RX_ELECIDLE;
  localparam [1:0] PCI3_RX_ASYNC_EBUF_BYPASS_REG = PCI3_RX_ASYNC_EBUF_BYPASS;
  localparam [0:0] PCI3_RX_ELECIDLE_EI2_ENABLE_REG = PCI3_RX_ELECIDLE_EI2_ENABLE;
  localparam [5:0] PCI3_RX_ELECIDLE_H2L_COUNT_REG = PCI3_RX_ELECIDLE_H2L_COUNT;
  localparam [2:0] PCI3_RX_ELECIDLE_H2L_DISABLE_REG = PCI3_RX_ELECIDLE_H2L_DISABLE;
  localparam [5:0] PCI3_RX_ELECIDLE_HI_COUNT_REG = PCI3_RX_ELECIDLE_HI_COUNT;
  localparam [0:0] PCI3_RX_ELECIDLE_LP4_DISABLE_REG = PCI3_RX_ELECIDLE_LP4_DISABLE;
  localparam [0:0] PCI3_RX_FIFO_DISABLE_REG = PCI3_RX_FIFO_DISABLE;
  localparam [15:0] PCIE_BUFG_DIV_CTRL_REG = PCIE_BUFG_DIV_CTRL;
  localparam [15:0] PCIE_RXPCS_CFG_GEN3_REG = PCIE_RXPCS_CFG_GEN3;
  localparam [15:0] PCIE_RXPMA_CFG_REG = PCIE_RXPMA_CFG;
  localparam [15:0] PCIE_TXPCS_CFG_GEN3_REG = PCIE_TXPCS_CFG_GEN3;
  localparam [15:0] PCIE_TXPMA_CFG_REG = PCIE_TXPMA_CFG;
  localparam [40:1] PCS_PCIE_EN_REG = PCS_PCIE_EN;
  localparam [15:0] PCS_RSVD0_REG = PCS_RSVD0;
  localparam [2:0] PCS_RSVD1_REG = PCS_RSVD1;
  localparam [11:0] PD_TRANS_TIME_FROM_P2_REG = PD_TRANS_TIME_FROM_P2;
  localparam [7:0] PD_TRANS_TIME_NONE_P2_REG = PD_TRANS_TIME_NONE_P2;
  localparam [7:0] PD_TRANS_TIME_TO_P2_REG = PD_TRANS_TIME_TO_P2;
  localparam [1:0] PLL_SEL_MODE_GEN12_REG = PLL_SEL_MODE_GEN12;
  localparam [1:0] PLL_SEL_MODE_GEN3_REG = PLL_SEL_MODE_GEN3;
  localparam [15:0] PMA_RSV0_REG = PMA_RSV0;
  localparam [15:0] PMA_RSV1_REG = PMA_RSV1;
  localparam [1:0] PREIQ_FREQ_BST_REG = PREIQ_FREQ_BST;
  localparam [2:0] PROCESS_PAR_REG = PROCESS_PAR;
  localparam [0:0] RATE_SW_USE_DRP_REG = RATE_SW_USE_DRP;
  localparam [0:0] RESET_POWERSAVE_DISABLE_REG = RESET_POWERSAVE_DISABLE;
  localparam [4:0] RXBUFRESET_TIME_REG = RXBUFRESET_TIME;
  localparam [32:1] RXBUF_ADDR_MODE_REG = RXBUF_ADDR_MODE;
  localparam [3:0] RXBUF_EIDLE_HI_CNT_REG = RXBUF_EIDLE_HI_CNT;
  localparam [3:0] RXBUF_EIDLE_LO_CNT_REG = RXBUF_EIDLE_LO_CNT;
  localparam [40:1] RXBUF_EN_REG = RXBUF_EN;
  localparam [40:1] RXBUF_RESET_ON_CB_CHANGE_REG = RXBUF_RESET_ON_CB_CHANGE;
  localparam [40:1] RXBUF_RESET_ON_COMMAALIGN_REG = RXBUF_RESET_ON_COMMAALIGN;
  localparam [40:1] RXBUF_RESET_ON_EIDLE_REG = RXBUF_RESET_ON_EIDLE;
  localparam [40:1] RXBUF_RESET_ON_RATE_CHANGE_REG = RXBUF_RESET_ON_RATE_CHANGE;
  localparam [5:0] RXBUF_THRESH_OVFLW_REG = RXBUF_THRESH_OVFLW;
  localparam [40:1] RXBUF_THRESH_OVRD_REG = RXBUF_THRESH_OVRD;
  localparam [5:0] RXBUF_THRESH_UNDFLW_REG = RXBUF_THRESH_UNDFLW;
  localparam [4:0] RXCDRFREQRESET_TIME_REG = RXCDRFREQRESET_TIME;
  localparam [4:0] RXCDRPHRESET_TIME_REG = RXCDRPHRESET_TIME;
  localparam [15:0] RXCDR_CFG0_REG = RXCDR_CFG0;
  localparam [15:0] RXCDR_CFG0_GEN3_REG = RXCDR_CFG0_GEN3;
  localparam [15:0] RXCDR_CFG1_REG = RXCDR_CFG1;
  localparam [15:0] RXCDR_CFG1_GEN3_REG = RXCDR_CFG1_GEN3;
  localparam [15:0] RXCDR_CFG2_REG = RXCDR_CFG2;
  localparam [15:0] RXCDR_CFG2_GEN3_REG = RXCDR_CFG2_GEN3;
  localparam [15:0] RXCDR_CFG3_REG = RXCDR_CFG3;
  localparam [15:0] RXCDR_CFG3_GEN3_REG = RXCDR_CFG3_GEN3;
  localparam [15:0] RXCDR_CFG4_REG = RXCDR_CFG4;
  localparam [15:0] RXCDR_CFG4_GEN3_REG = RXCDR_CFG4_GEN3;
  localparam [15:0] RXCDR_CFG5_REG = RXCDR_CFG5;
  localparam [15:0] RXCDR_CFG5_GEN3_REG = RXCDR_CFG5_GEN3;
  localparam [0:0] RXCDR_FR_RESET_ON_EIDLE_REG = RXCDR_FR_RESET_ON_EIDLE;
  localparam [0:0] RXCDR_HOLD_DURING_EIDLE_REG = RXCDR_HOLD_DURING_EIDLE;
  localparam [15:0] RXCDR_LOCK_CFG0_REG = RXCDR_LOCK_CFG0;
  localparam [15:0] RXCDR_LOCK_CFG1_REG = RXCDR_LOCK_CFG1;
  localparam [15:0] RXCDR_LOCK_CFG2_REG = RXCDR_LOCK_CFG2;
  localparam [15:0] RXCDR_LOCK_CFG3_REG = RXCDR_LOCK_CFG3;
  localparam [0:0] RXCDR_PH_RESET_ON_EIDLE_REG = RXCDR_PH_RESET_ON_EIDLE;
  localparam [1:0] RXCFOKDONE_SRC_REG = RXCFOKDONE_SRC;
  localparam [15:0] RXCFOK_CFG0_REG = RXCFOK_CFG0;
  localparam [15:0] RXCFOK_CFG1_REG = RXCFOK_CFG1;
  localparam [15:0] RXCFOK_CFG2_REG = RXCFOK_CFG2;
  localparam [6:0] RXDFELPMRESET_TIME_REG = RXDFELPMRESET_TIME;
  localparam [15:0] RXDFELPM_KL_CFG0_REG = RXDFELPM_KL_CFG0;
  localparam [15:0] RXDFELPM_KL_CFG1_REG = RXDFELPM_KL_CFG1;
  localparam [15:0] RXDFELPM_KL_CFG2_REG = RXDFELPM_KL_CFG2;
  localparam [15:0] RXDFE_CFG0_REG = RXDFE_CFG0;
  localparam [15:0] RXDFE_CFG1_REG = RXDFE_CFG1;
  localparam [15:0] RXDFE_GC_CFG0_REG = RXDFE_GC_CFG0;
  localparam [15:0] RXDFE_GC_CFG1_REG = RXDFE_GC_CFG1;
  localparam [15:0] RXDFE_GC_CFG2_REG = RXDFE_GC_CFG2;
  localparam [15:0] RXDFE_H2_CFG0_REG = RXDFE_H2_CFG0;
  localparam [15:0] RXDFE_H2_CFG1_REG = RXDFE_H2_CFG1;
  localparam [15:0] RXDFE_H3_CFG0_REG = RXDFE_H3_CFG0;
  localparam [15:0] RXDFE_H3_CFG1_REG = RXDFE_H3_CFG1;
  localparam [15:0] RXDFE_H4_CFG0_REG = RXDFE_H4_CFG0;
  localparam [15:0] RXDFE_H4_CFG1_REG = RXDFE_H4_CFG1;
  localparam [15:0] RXDFE_H5_CFG0_REG = RXDFE_H5_CFG0;
  localparam [15:0] RXDFE_H5_CFG1_REG = RXDFE_H5_CFG1;
  localparam [15:0] RXDFE_H6_CFG0_REG = RXDFE_H6_CFG0;
  localparam [15:0] RXDFE_H6_CFG1_REG = RXDFE_H6_CFG1;
  localparam [15:0] RXDFE_H7_CFG0_REG = RXDFE_H7_CFG0;
  localparam [15:0] RXDFE_H7_CFG1_REG = RXDFE_H7_CFG1;
  localparam [15:0] RXDFE_H8_CFG0_REG = RXDFE_H8_CFG0;
  localparam [15:0] RXDFE_H8_CFG1_REG = RXDFE_H8_CFG1;
  localparam [15:0] RXDFE_H9_CFG0_REG = RXDFE_H9_CFG0;
  localparam [15:0] RXDFE_H9_CFG1_REG = RXDFE_H9_CFG1;
  localparam [15:0] RXDFE_HA_CFG0_REG = RXDFE_HA_CFG0;
  localparam [15:0] RXDFE_HA_CFG1_REG = RXDFE_HA_CFG1;
  localparam [15:0] RXDFE_HB_CFG0_REG = RXDFE_HB_CFG0;
  localparam [15:0] RXDFE_HB_CFG1_REG = RXDFE_HB_CFG1;
  localparam [15:0] RXDFE_HC_CFG0_REG = RXDFE_HC_CFG0;
  localparam [15:0] RXDFE_HC_CFG1_REG = RXDFE_HC_CFG1;
  localparam [15:0] RXDFE_HD_CFG0_REG = RXDFE_HD_CFG0;
  localparam [15:0] RXDFE_HD_CFG1_REG = RXDFE_HD_CFG1;
  localparam [15:0] RXDFE_HE_CFG0_REG = RXDFE_HE_CFG0;
  localparam [15:0] RXDFE_HE_CFG1_REG = RXDFE_HE_CFG1;
  localparam [15:0] RXDFE_HF_CFG0_REG = RXDFE_HF_CFG0;
  localparam [15:0] RXDFE_HF_CFG1_REG = RXDFE_HF_CFG1;
  localparam [15:0] RXDFE_OS_CFG0_REG = RXDFE_OS_CFG0;
  localparam [15:0] RXDFE_OS_CFG1_REG = RXDFE_OS_CFG1;
  localparam [0:0] RXDFE_PWR_SAVING_REG = RXDFE_PWR_SAVING;
  localparam [15:0] RXDFE_UT_CFG0_REG = RXDFE_UT_CFG0;
  localparam [15:0] RXDFE_UT_CFG1_REG = RXDFE_UT_CFG1;
  localparam [15:0] RXDFE_VP_CFG0_REG = RXDFE_VP_CFG0;
  localparam [15:0] RXDFE_VP_CFG1_REG = RXDFE_VP_CFG1;
  localparam [15:0] RXDLY_CFG_REG = RXDLY_CFG;
  localparam [15:0] RXDLY_LCFG_REG = RXDLY_LCFG;
  localparam [72:1] RXELECIDLE_CFG_REG = RXELECIDLE_CFG;
  localparam [2:0] RXGBOX_FIFO_INIT_RD_ADDR_REG = RXGBOX_FIFO_INIT_RD_ADDR;
  localparam [40:1] RXGEARBOX_EN_REG = RXGEARBOX_EN;
  localparam [4:0] RXISCANRESET_TIME_REG = RXISCANRESET_TIME;
  localparam [15:0] RXLPM_CFG_REG = RXLPM_CFG;
  localparam [15:0] RXLPM_GC_CFG_REG = RXLPM_GC_CFG;
  localparam [15:0] RXLPM_KH_CFG0_REG = RXLPM_KH_CFG0;
  localparam [15:0] RXLPM_KH_CFG1_REG = RXLPM_KH_CFG1;
  localparam [15:0] RXLPM_OS_CFG0_REG = RXLPM_OS_CFG0;
  localparam [15:0] RXLPM_OS_CFG1_REG = RXLPM_OS_CFG1;
  localparam [8:0] RXOOB_CFG_REG = RXOOB_CFG;
  localparam [48:1] RXOOB_CLK_CFG_REG = RXOOB_CLK_CFG;
  localparam [4:0] RXOSCALRESET_TIME_REG = RXOSCALRESET_TIME;
  localparam [5:0] RXOUT_DIV_REG = RXOUT_DIV;
  localparam [4:0] RXPCSRESET_TIME_REG = RXPCSRESET_TIME;
  localparam [15:0] RXPHBEACON_CFG_REG = RXPHBEACON_CFG;
  localparam [15:0] RXPHDLY_CFG_REG = RXPHDLY_CFG;
  localparam [15:0] RXPHSAMP_CFG_REG = RXPHSAMP_CFG;
  localparam [15:0] RXPHSLIP_CFG_REG = RXPHSLIP_CFG;
  localparam [4:0] RXPH_MONITOR_SEL_REG = RXPH_MONITOR_SEL;
  localparam [0:0] RXPI_AUTO_BW_SEL_BYPASS_REG = RXPI_AUTO_BW_SEL_BYPASS;
  localparam [15:0] RXPI_CFG_REG = RXPI_CFG;
  localparam [0:0] RXPI_LPM_REG = RXPI_LPM;
  localparam [15:0] RXPI_RSV0_REG = RXPI_RSV0;
  localparam [1:0] RXPI_SEL_LC_REG = RXPI_SEL_LC;
  localparam [1:0] RXPI_STARTCODE_REG = RXPI_STARTCODE;
  localparam [0:0] RXPI_VREFSEL_REG = RXPI_VREFSEL;
  localparam [64:1] RXPMACLK_SEL_REG = RXPMACLK_SEL;
  localparam [4:0] RXPMARESET_TIME_REG = RXPMARESET_TIME;
  localparam [0:0] RXPRBS_ERR_LOOPBACK_REG = RXPRBS_ERR_LOOPBACK;
  localparam [7:0] RXPRBS_LINKACQ_CNT_REG = RXPRBS_LINKACQ_CNT;
  localparam [3:0] RXSLIDE_AUTO_WAIT_REG = RXSLIDE_AUTO_WAIT;
  localparam [32:1] RXSLIDE_MODE_REG = RXSLIDE_MODE;
  localparam [0:0] RXSYNC_MULTILANE_REG = RXSYNC_MULTILANE;
  localparam [0:0] RXSYNC_OVRD_REG = RXSYNC_OVRD;
  localparam [0:0] RXSYNC_SKIP_DA_REG = RXSYNC_SKIP_DA;
  localparam [0:0] RX_AFE_CM_EN_REG = RX_AFE_CM_EN;
  localparam [15:0] RX_BIAS_CFG0_REG = RX_BIAS_CFG0;
  localparam [5:0] RX_BUFFER_CFG_REG = RX_BUFFER_CFG;
  localparam [0:0] RX_CAPFF_SARC_ENB_REG = RX_CAPFF_SARC_ENB;
  localparam [5:0] RX_CLK25_DIV_REG = RX_CLK25_DIV;
  localparam [0:0] RX_CLKMUX_EN_REG = RX_CLKMUX_EN;
  localparam [4:0] RX_CLK_SLIP_OVRD_REG = RX_CLK_SLIP_OVRD;
  localparam [3:0] RX_CM_BUF_CFG_REG = RX_CM_BUF_CFG;
  localparam [0:0] RX_CM_BUF_PD_REG = RX_CM_BUF_PD;
  localparam [1:0] RX_CM_SEL_REG = RX_CM_SEL;
  localparam [3:0] RX_CM_TRIM_REG = RX_CM_TRIM;
  localparam [0:0] RX_CTLE1_KHKL_REG = RX_CTLE1_KHKL;
  localparam [0:0] RX_CTLE2_KHKL_REG = RX_CTLE2_KHKL;
  localparam [0:0] RX_CTLE3_AGC_REG = RX_CTLE3_AGC;
  localparam [7:0] RX_DATA_WIDTH_REG = RX_DATA_WIDTH;
  localparam [5:0] RX_DDI_SEL_REG = RX_DDI_SEL;
  localparam [40:1] RX_DEFER_RESET_BUF_EN_REG = RX_DEFER_RESET_BUF_EN;
  localparam [2:0] RX_DEGEN_CTRL_REG = RX_DEGEN_CTRL;
  localparam [2:0] RX_DFELPM_CFG0_REG = RX_DFELPM_CFG0;
  localparam [0:0] RX_DFELPM_CFG1_REG = RX_DFELPM_CFG1;
  localparam [0:0] RX_DFELPM_KLKH_AGC_STUP_EN_REG = RX_DFELPM_KLKH_AGC_STUP_EN;
  localparam [1:0] RX_DFE_AGC_CFG0_REG = RX_DFE_AGC_CFG0;
  localparam [2:0] RX_DFE_AGC_CFG1_REG = RX_DFE_AGC_CFG1;
  localparam [1:0] RX_DFE_KL_LPM_KH_CFG0_REG = RX_DFE_KL_LPM_KH_CFG0;
  localparam [2:0] RX_DFE_KL_LPM_KH_CFG1_REG = RX_DFE_KL_LPM_KH_CFG1;
  localparam [1:0] RX_DFE_KL_LPM_KL_CFG0_REG = RX_DFE_KL_LPM_KL_CFG0;
  localparam [2:0] RX_DFE_KL_LPM_KL_CFG1_REG = RX_DFE_KL_LPM_KL_CFG1;
  localparam [0:0] RX_DFE_LPM_HOLD_DURING_EIDLE_REG = RX_DFE_LPM_HOLD_DURING_EIDLE;
  localparam [40:1] RX_DISPERR_SEQ_MATCH_REG = RX_DISPERR_SEQ_MATCH;
  localparam [0:0] RX_DIV2_MODE_B_REG = RX_DIV2_MODE_B;
  localparam [4:0] RX_DIVRESET_TIME_REG = RX_DIVRESET_TIME;
  localparam [0:0] RX_EN_CTLE_RCAL_B_REG = RX_EN_CTLE_RCAL_B;
  localparam [0:0] RX_EN_HI_LR_REG = RX_EN_HI_LR;
  localparam [8:0] RX_EXT_RL_CTRL_REG = RX_EXT_RL_CTRL;
  localparam [6:0] RX_EYESCAN_VS_CODE_REG = RX_EYESCAN_VS_CODE;
  localparam [0:0] RX_EYESCAN_VS_NEG_DIR_REG = RX_EYESCAN_VS_NEG_DIR;
  localparam [1:0] RX_EYESCAN_VS_RANGE_REG = RX_EYESCAN_VS_RANGE;
  localparam [0:0] RX_EYESCAN_VS_UT_SIGN_REG = RX_EYESCAN_VS_UT_SIGN;
  localparam [0:0] RX_FABINT_USRCLK_FLOP_REG = RX_FABINT_USRCLK_FLOP;
  localparam [1:0] RX_INT_DATAWIDTH_REG = RX_INT_DATAWIDTH;
  localparam [0:0] RX_PMA_POWER_SAVE_REG = RX_PMA_POWER_SAVE;
  localparam real RX_PROGDIV_CFG_REG = RX_PROGDIV_CFG;
  localparam [15:0] RX_PROGDIV_RATE_REG = RX_PROGDIV_RATE;
  localparam [3:0] RX_RESLOAD_CTRL_REG = RX_RESLOAD_CTRL;
  localparam [0:0] RX_RESLOAD_OVRD_REG = RX_RESLOAD_OVRD;
  localparam [2:0] RX_SAMPLE_PERIOD_REG = RX_SAMPLE_PERIOD;
  localparam [5:0] RX_SIG_VALID_DLY_REG = RX_SIG_VALID_DLY;
  localparam [0:0] RX_SUM_DFETAPREP_EN_REG = RX_SUM_DFETAPREP_EN;
  localparam [3:0] RX_SUM_IREF_TUNE_REG = RX_SUM_IREF_TUNE;
  localparam [3:0] RX_SUM_VCMTUNE_REG = RX_SUM_VCMTUNE;
  localparam [0:0] RX_SUM_VCM_OVWR_REG = RX_SUM_VCM_OVWR;
  localparam [2:0] RX_SUM_VREF_TUNE_REG = RX_SUM_VREF_TUNE;
  localparam [1:0] RX_TUNE_AFE_OS_REG = RX_TUNE_AFE_OS;
  localparam [2:0] RX_VREG_CTRL_REG = RX_VREG_CTRL;
  localparam [0:0] RX_VREG_PDB_REG = RX_VREG_PDB;
  localparam [1:0] RX_WIDEMODE_CDR_REG = RX_WIDEMODE_CDR;
  localparam [40:1] RX_XCLK_SEL_REG = RX_XCLK_SEL;
  localparam [0:0] RX_XMODE_SEL_REG = RX_XMODE_SEL;
  localparam [6:0] SAS_MAX_COM_REG = SAS_MAX_COM;
  localparam [5:0] SAS_MIN_COM_REG = SAS_MIN_COM;
  localparam [3:0] SATA_BURST_SEQ_LEN_REG = SATA_BURST_SEQ_LEN;
  localparam [2:0] SATA_BURST_VAL_REG = SATA_BURST_VAL;
  localparam [88:1] SATA_CPLL_CFG_REG = SATA_CPLL_CFG;
  localparam [2:0] SATA_EIDLE_VAL_REG = SATA_EIDLE_VAL;
  localparam [5:0] SATA_MAX_BURST_REG = SATA_MAX_BURST;
  localparam [5:0] SATA_MAX_INIT_REG = SATA_MAX_INIT;
  localparam [5:0] SATA_MAX_WAKE_REG = SATA_MAX_WAKE;
  localparam [5:0] SATA_MIN_BURST_REG = SATA_MIN_BURST;
  localparam [5:0] SATA_MIN_INIT_REG = SATA_MIN_INIT;
  localparam [5:0] SATA_MIN_WAKE_REG = SATA_MIN_WAKE;
  localparam [40:1] SHOW_REALIGN_COMMA_REG = SHOW_REALIGN_COMMA;
  localparam [40:1] SIM_RECEIVER_DETECT_PASS_REG = SIM_RECEIVER_DETECT_PASS;
  localparam [40:1] SIM_RESET_SPEEDUP_REG = SIM_RESET_SPEEDUP;
  localparam [0:0] SIM_TX_EIDLE_DRIVE_LEVEL_REG = SIM_TX_EIDLE_DRIVE_LEVEL;
  localparam real SIM_VERSION_REG = SIM_VERSION;
  localparam [1:0] TAPDLY_SET_TX_REG = TAPDLY_SET_TX;
  localparam [3:0] TEMPERATURE_PAR_REG = TEMPERATURE_PAR;
  localparam [14:0] TERM_RCAL_CFG_REG = TERM_RCAL_CFG;
  localparam [2:0] TERM_RCAL_OVRD_REG = TERM_RCAL_OVRD;
  localparam [7:0] TRANS_TIME_RATE_REG = TRANS_TIME_RATE;
  localparam [7:0] TST_RSV0_REG = TST_RSV0;
  localparam [7:0] TST_RSV1_REG = TST_RSV1;
  localparam [40:1] TXBUF_EN_REG = TXBUF_EN;
  localparam [40:1] TXBUF_RESET_ON_RATE_CHANGE_REG = TXBUF_RESET_ON_RATE_CHANGE;
  localparam [15:0] TXDLY_CFG_REG = TXDLY_CFG;
  localparam [15:0] TXDLY_LCFG_REG = TXDLY_LCFG;
  localparam [32:1] TXFIFO_ADDR_CFG_REG = TXFIFO_ADDR_CFG;
  localparam [2:0] TXGBOX_FIFO_INIT_RD_ADDR_REG = TXGBOX_FIFO_INIT_RD_ADDR;
  localparam [40:1] TXGEARBOX_EN_REG = TXGEARBOX_EN;
  localparam [5:0] TXOUT_DIV_REG = TXOUT_DIV;
  localparam [4:0] TXPCSRESET_TIME_REG = TXPCSRESET_TIME;
  localparam [15:0] TXPHDLY_CFG0_REG = TXPHDLY_CFG0;
  localparam [15:0] TXPHDLY_CFG1_REG = TXPHDLY_CFG1;
  localparam [15:0] TXPH_CFG_REG = TXPH_CFG;
  localparam [15:0] TXPH_CFG2_REG = TXPH_CFG2;
  localparam [4:0] TXPH_MONITOR_SEL_REG = TXPH_MONITOR_SEL;
  localparam [1:0] TXPI_CFG0_REG = TXPI_CFG0;
  localparam [1:0] TXPI_CFG1_REG = TXPI_CFG1;
  localparam [1:0] TXPI_CFG2_REG = TXPI_CFG2;
  localparam [0:0] TXPI_CFG3_REG = TXPI_CFG3;
  localparam [0:0] TXPI_CFG4_REG = TXPI_CFG4;
  localparam [2:0] TXPI_CFG5_REG = TXPI_CFG5;
  localparam [0:0] TXPI_GRAY_SEL_REG = TXPI_GRAY_SEL;
  localparam [0:0] TXPI_INVSTROBE_SEL_REG = TXPI_INVSTROBE_SEL;
  localparam [0:0] TXPI_LPM_REG = TXPI_LPM;
  localparam [72:1] TXPI_PPMCLK_SEL_REG = TXPI_PPMCLK_SEL;
  localparam [7:0] TXPI_PPM_CFG_REG = TXPI_PPM_CFG;
  localparam [15:0] TXPI_RSV0_REG = TXPI_RSV0;
  localparam [2:0] TXPI_SYNFREQ_PPM_REG = TXPI_SYNFREQ_PPM;
  localparam [0:0] TXPI_VREFSEL_REG = TXPI_VREFSEL;
  localparam [4:0] TXPMARESET_TIME_REG = TXPMARESET_TIME;
  localparam [0:0] TXSYNC_MULTILANE_REG = TXSYNC_MULTILANE;
  localparam [0:0] TXSYNC_OVRD_REG = TXSYNC_OVRD;
  localparam [0:0] TXSYNC_SKIP_DA_REG = TXSYNC_SKIP_DA;
  localparam [5:0] TX_CLK25_DIV_REG = TX_CLK25_DIV;
  localparam [0:0] TX_CLKMUX_EN_REG = TX_CLKMUX_EN;
  localparam [0:0] TX_CLKREG_PDB_REG = TX_CLKREG_PDB;
  localparam [2:0] TX_CLKREG_SET_REG = TX_CLKREG_SET;
  localparam [7:0] TX_DATA_WIDTH_REG = TX_DATA_WIDTH;
  localparam [5:0] TX_DCD_CFG_REG = TX_DCD_CFG;
  localparam [0:0] TX_DCD_EN_REG = TX_DCD_EN;
  localparam [5:0] TX_DEEMPH0_REG = TX_DEEMPH0;
  localparam [5:0] TX_DEEMPH1_REG = TX_DEEMPH1;
  localparam [4:0] TX_DIVRESET_TIME_REG = TX_DIVRESET_TIME;
  localparam [64:1] TX_DRIVE_MODE_REG = TX_DRIVE_MODE;
  localparam [1:0] TX_DRVMUX_CTRL_REG = TX_DRVMUX_CTRL;
  localparam [2:0] TX_EIDLE_ASSERT_DELAY_REG = TX_EIDLE_ASSERT_DELAY;
  localparam [2:0] TX_EIDLE_DEASSERT_DELAY_REG = TX_EIDLE_DEASSERT_DELAY;
  localparam [0:0] TX_EML_PHI_TUNE_REG = TX_EML_PHI_TUNE;
  localparam [0:0] TX_FABINT_USRCLK_FLOP_REG = TX_FABINT_USRCLK_FLOP;
  localparam [0:0] TX_FIFO_BYP_EN_REG = TX_FIFO_BYP_EN;
  localparam [0:0] TX_IDLE_DATA_ZERO_REG = TX_IDLE_DATA_ZERO;
  localparam [1:0] TX_INT_DATAWIDTH_REG = TX_INT_DATAWIDTH;
  localparam [40:1] TX_LOOPBACK_DRIVE_HIZ_REG = TX_LOOPBACK_DRIVE_HIZ;
  localparam [0:0] TX_MAINCURSOR_SEL_REG = TX_MAINCURSOR_SEL;
  localparam [6:0] TX_MARGIN_FULL_0_REG = TX_MARGIN_FULL_0;
  localparam [6:0] TX_MARGIN_FULL_1_REG = TX_MARGIN_FULL_1;
  localparam [6:0] TX_MARGIN_FULL_2_REG = TX_MARGIN_FULL_2;
  localparam [6:0] TX_MARGIN_FULL_3_REG = TX_MARGIN_FULL_3;
  localparam [6:0] TX_MARGIN_FULL_4_REG = TX_MARGIN_FULL_4;
  localparam [6:0] TX_MARGIN_LOW_0_REG = TX_MARGIN_LOW_0;
  localparam [6:0] TX_MARGIN_LOW_1_REG = TX_MARGIN_LOW_1;
  localparam [6:0] TX_MARGIN_LOW_2_REG = TX_MARGIN_LOW_2;
  localparam [6:0] TX_MARGIN_LOW_3_REG = TX_MARGIN_LOW_3;
  localparam [6:0] TX_MARGIN_LOW_4_REG = TX_MARGIN_LOW_4;
  localparam [2:0] TX_MODE_SEL_REG = TX_MODE_SEL;
  localparam [15:0] TX_PHICAL_CFG0_REG = TX_PHICAL_CFG0;
  localparam [15:0] TX_PHICAL_CFG1_REG = TX_PHICAL_CFG1;
  localparam [15:0] TX_PHICAL_CFG2_REG = TX_PHICAL_CFG2;
  localparam [1:0] TX_PI_BIASSET_REG = TX_PI_BIASSET;
  localparam [15:0] TX_PI_CFG0_REG = TX_PI_CFG0;
  localparam [15:0] TX_PI_CFG1_REG = TX_PI_CFG1;
  localparam [0:0] TX_PI_DIV2_MODE_B_REG = TX_PI_DIV2_MODE_B;
  localparam [0:0] TX_PI_SEL_QPLL0_REG = TX_PI_SEL_QPLL0;
  localparam [0:0] TX_PI_SEL_QPLL1_REG = TX_PI_SEL_QPLL1;
  localparam [0:0] TX_PMADATA_OPT_REG = TX_PMADATA_OPT;
  localparam [0:0] TX_PMA_POWER_SAVE_REG = TX_PMA_POWER_SAVE;
  localparam [1:0] TX_PREDRV_CTRL_REG = TX_PREDRV_CTRL;
  localparam [48:1] TX_PROGCLK_SEL_REG = TX_PROGCLK_SEL;
  localparam real TX_PROGDIV_CFG_REG = TX_PROGDIV_CFG;
  localparam [15:0] TX_PROGDIV_RATE_REG = TX_PROGDIV_RATE;
  localparam [13:0] TX_RXDETECT_CFG_REG = TX_RXDETECT_CFG;
  localparam [2:0] TX_RXDETECT_REF_REG = TX_RXDETECT_REF;
  localparam [2:0] TX_SAMPLE_PERIOD_REG = TX_SAMPLE_PERIOD;
  localparam [0:0] TX_SARC_LPBK_ENB_REG = TX_SARC_LPBK_ENB;
  localparam [40:1] TX_XCLK_SEL_REG = TX_XCLK_SEL;
  localparam [0:0] USE_PCS_CLK_PHASE_SEL_REG = USE_PCS_CLK_PHASE_SEL;
  `endif

  localparam [0:0] AEN_CDRSTEPSEL_REG = 1'b0;
  localparam [0:0] AEN_CPLL_REG = 1'b0;
  localparam [0:0] AEN_ELPCAL_REG = 1'b0;
  localparam [0:0] AEN_EYESCAN_REG = 1'b1;
  localparam [0:0] AEN_LOOPBACK_REG = 1'b0;
  localparam [0:0] AEN_MASTER_REG = 1'b0;
  localparam [0:0] AEN_MUXDCD_REG = 1'b0;
  localparam [0:0] AEN_PD_AND_EIDLE_REG = 1'b0;
  localparam [0:0] AEN_POLARITY_REG = 1'b0;
  localparam [0:0] AEN_PRBS_REG = 1'b0;
  localparam [0:0] AEN_RESET_REG = 1'b0;
  localparam [0:0] AEN_RXCDR_REG = 1'b0;
  localparam [0:0] AEN_RXDFE_REG = 1'b0;
  localparam [0:0] AEN_RXDFELPM_REG = 1'b0;
  localparam [0:0] AEN_RXOUTCLK_SEL_REG = 1'b0;
  localparam [0:0] AEN_RXPHDLY_REG = 1'b0;
  localparam [0:0] AEN_RXPLLCLK_SEL_REG = 1'b0;
  localparam [0:0] AEN_RXSYSCLK_SEL_REG = 1'b0;
  localparam [0:0] AEN_TXOUTCLK_SEL_REG = 1'b0;
  localparam [0:0] AEN_TXPHDLY_REG = 1'b0;
  localparam [0:0] AEN_TXPI_PPM_REG = 1'b0;
  localparam [0:0] AEN_TXPLLCLK_SEL_REG = 1'b0;
  localparam [0:0] AEN_TXSYSCLK_SEL_REG = 1'b0;
  localparam [0:0] AEN_TX_DRIVE_MODE_REG = 1'b0;
  localparam [9:0] AMONITOR_CFG_REG = 1;
  localparam [0:0] A_AFECFOKEN_REG = 1'b0;
  localparam [0:0] A_CPLLLOCKEN_REG = 1'b0;
  localparam [0:0] A_CPLLPD_REG = 1'b0;
  localparam [0:0] A_CPLLRESET_REG = 1'b0;
  localparam [5:0] A_DFECFOKFCDAC_REG = 6'b000000;
  localparam [3:0] A_DFECFOKFCNUM_REG = 4'b0000;
  localparam [0:0] A_DFECFOKFPULSE_REG = 1'b0;
  localparam [0:0] A_DFECFOKHOLD_REG = 1'b0;
  localparam [0:0] A_DFECFOKOVREN_REG = 1'b0;
  localparam [0:0] A_ELPCALDVORWREN_REG = 1'b0;
  localparam [0:0] A_ELPCALPAORWREN_REG = 1'b0;
  localparam [0:0] A_EYESCANMODE_REG = 1'b0;
  localparam [0:0] A_EYESCANRESET_REG = 1'b0;
  localparam [0:0] A_GTRESETSEL_REG = 1'b0;
  localparam [0:0] A_GTRXRESET_REG = 1'b0;
  localparam [0:0] A_GTTXRESET_REG = 1'b0;
  localparam [80:1] A_LOOPBACK_REG = "NoLoopBack";
  localparam [0:0] A_LPMGCHOLD_REG = 1'b0;
  localparam [0:0] A_LPMGCOVREN_REG = 1'b0;
  localparam [0:0] A_LPMOSHOLD_REG = 1'b0;
  localparam [0:0] A_LPMOSOVREN_REG = 1'b0;
  localparam [0:0] A_MUXDCDEXHOLD_REG = 1'b0;
  localparam [0:0] A_MUXDCDORWREN_REG = 1'b0;
  localparam [0:0] A_RXBUFRESET_REG = 1'b0;
  localparam [0:0] A_RXCDRFREQRESET_REG = 1'b0;
  localparam [0:0] A_RXCDRHOLD_REG = 1'b0;
  localparam [0:0] A_RXCDROVRDEN_REG = 1'b0;
  localparam [0:0] A_RXCDRRESET_REG = 1'b0;
  localparam [0:0] A_RXDFEAGCHOLD_REG = 1'b0;
  localparam [0:0] A_RXDFEAGCOVRDEN_REG = 1'b0;
  localparam [0:0] A_RXDFECFOKFEN_REG = 1'b0;
  localparam [0:0] A_RXDFELFHOLD_REG = 1'b0;
  localparam [0:0] A_RXDFELFOVRDEN_REG = 1'b0;
  localparam [0:0] A_RXDFELPMRESET_REG = 1'b0;
  localparam [0:0] A_RXDFETAP10HOLD_REG = 1'b0;
  localparam [0:0] A_RXDFETAP10OVRDEN_REG = 1'b0;
  localparam [0:0] A_RXDFETAP11HOLD_REG = 1'b0;
  localparam [0:0] A_RXDFETAP11OVRDEN_REG = 1'b0;
  localparam [0:0] A_RXDFETAP12HOLD_REG = 1'b0;
  localparam [0:0] A_RXDFETAP12OVRDEN_REG = 1'b0;
  localparam [0:0] A_RXDFETAP13HOLD_REG = 1'b0;
  localparam [0:0] A_RXDFETAP13OVRDEN_REG = 1'b0;
  localparam [0:0] A_RXDFETAP14HOLD_REG = 1'b0;
  localparam [0:0] A_RXDFETAP14OVRDEN_REG = 1'b0;
  localparam [0:0] A_RXDFETAP15HOLD_REG = 1'b0;
  localparam [0:0] A_RXDFETAP15OVRDEN_REG = 1'b0;
  localparam [0:0] A_RXDFETAP2HOLD_REG = 1'b0;
  localparam [0:0] A_RXDFETAP2OVRDEN_REG = 1'b0;
  localparam [0:0] A_RXDFETAP3HOLD_REG = 1'b0;
  localparam [0:0] A_RXDFETAP3OVRDEN_REG = 1'b0;
  localparam [0:0] A_RXDFETAP4HOLD_REG = 1'b0;
  localparam [0:0] A_RXDFETAP4OVRDEN_REG = 1'b0;
  localparam [0:0] A_RXDFETAP5HOLD_REG = 1'b0;
  localparam [0:0] A_RXDFETAP5OVRDEN_REG = 1'b0;
  localparam [0:0] A_RXDFETAP6HOLD_REG = 1'b0;
  localparam [0:0] A_RXDFETAP6OVRDEN_REG = 1'b0;
  localparam [0:0] A_RXDFETAP7HOLD_REG = 1'b0;
  localparam [0:0] A_RXDFETAP7OVRDEN_REG = 1'b0;
  localparam [0:0] A_RXDFETAP8HOLD_REG = 1'b0;
  localparam [0:0] A_RXDFETAP8OVRDEN_REG = 1'b0;
  localparam [0:0] A_RXDFETAP9HOLD_REG = 1'b0;
  localparam [0:0] A_RXDFETAP9OVRDEN_REG = 1'b0;
  localparam [0:0] A_RXDFEUTHOLD_REG = 1'b0;
  localparam [0:0] A_RXDFEUTOVRDEN_REG = 1'b0;
  localparam [0:0] A_RXDFEVPHOLD_REG = 1'b0;
  localparam [0:0] A_RXDFEVPOVRDEN_REG = 1'b0;
  localparam [0:0] A_RXDFEVSEN_REG = 1'b0;
  localparam [0:0] A_RXDFEXYDEN_REG = 1'b0;
  localparam [0:0] A_RXDLYBYPASS_REG = 1'b0;
  localparam [0:0] A_RXDLYEN_REG = 1'b0;
  localparam [0:0] A_RXDLYOVRDEN_REG = 1'b0;
  localparam [0:0] A_RXDLYSRESET_REG = 1'b0;
  localparam [0:0] A_RXLPMEN_REG = 1'b0;
  localparam [0:0] A_RXLPMHFHOLD_REG = 1'b0;
  localparam [0:0] A_RXLPMHFOVRDEN_REG = 1'b0;
  localparam [0:0] A_RXLPMLFHOLD_REG = 1'b0;
  localparam [0:0] A_RXLPMLFKLOVRDEN_REG = 1'b0;
  localparam [1:0] A_RXMONITORSEL_REG = 2'b00;
  localparam [0:0] A_RXOOBRESET_REG = 1'b0;
  localparam [0:0] A_RXOSHOLD_REG = 1'b0;
  localparam [0:0] A_RXOSOVRDEN_REG = 1'b0;
  localparam [128:1] A_RXOUTCLKSEL_REG = "Disabled";
  localparam [0:0] A_RXPCSRESET_REG = 1'b0;
  localparam [24:1] A_RXPD_REG = "P0";
  localparam [0:0] A_RXPHALIGN_REG = 1'b0;
  localparam [0:0] A_RXPHALIGNEN_REG = 1'b0;
  localparam [0:0] A_RXPHDLYPD_REG = 1'b0;
  localparam [0:0] A_RXPHDLYRESET_REG = 1'b0;
  localparam [0:0] A_RXPHOVRDEN_REG = 1'b0;
  localparam [64:1] A_RXPLLCLKSEL_REG = "CPLLCLK";
  localparam [0:0] A_RXPMARESET_REG = 1'b0;
  localparam [0:0] A_RXPOLARITY_REG = 1'b0;
  localparam [0:0] A_RXPRBSCNTRESET_REG = 1'b0;
  localparam [48:1] A_RXPRBSSEL_REG = "PRBS7";
  localparam [88:1] A_RXSYSCLKSEL_REG = "CPLLREFCLK";
  localparam [2:0] A_TXBUFDIFFCTRL_REG = 3'b100;
  localparam [0:0] A_TXDEEMPH_REG = 1'b0;
  localparam [0:0] A_TXDLYBYPASS_REG = 1'b0;
  localparam [0:0] A_TXDLYEN_REG = 1'b0;
  localparam [0:0] A_TXDLYOVRDEN_REG = 1'b0;
  localparam [0:0] A_TXDLYSRESET_REG = 1'b0;
  localparam [0:0] A_TXELECIDLE_REG = 1'b0;
  localparam [0:0] A_TXINHIBIT_REG = 1'b0;
  localparam [6:0] A_TXMAINCURSOR_REG = 7'b0000000;
  localparam [2:0] A_TXMARGIN_REG = 3'b000;
  localparam [128:1] A_TXOUTCLKSEL_REG = "Disabled";
  localparam [0:0] A_TXPCSRESET_REG = 1'b0;
  localparam [24:1] A_TXPD_REG = "P0";
  localparam [0:0] A_TXPHALIGN_REG = 1'b0;
  localparam [0:0] A_TXPHALIGNEN_REG = 1'b0;
  localparam [0:0] A_TXPHDLYPD_REG = 1'b0;
  localparam [0:0] A_TXPHDLYRESET_REG = 1'b0;
  localparam [0:0] A_TXPHINIT_REG = 1'b0;
  localparam [0:0] A_TXPHOVRDEN_REG = 1'b0;
  localparam [0:0] A_TXPIPPMOVRDEN_REG = 1'b0;
  localparam [0:0] A_TXPIPPMPD_REG = 1'b0;
  localparam [0:0] A_TXPIPPMSEL_REG = 1'b0;
  localparam [64:1] A_TXPLLCLKSEL_REG = "CPLLCLK";
  localparam [0:0] A_TXPMARESET_REG = 1'b0;
  localparam [0:0] A_TXPOLARITY_REG = 1'b0;
  localparam [4:0] A_TXPOSTCURSOR_REG = 5'b00000;
  localparam [0:0] A_TXPRBSFORCEERR_REG = 1'b0;
  localparam [96:1] A_TXPRBSSEL_REG = "PRBS7";
  localparam [4:0] A_TXPRECURSOR_REG = 5'b00000;
  localparam [0:0] A_TXSWING_REG = 1'b0;
  localparam [88:1] A_TXSYSCLKSEL_REG = "CPLLREFCLK";
  localparam [40:1] GEN_RXUSRCLK_REG = "TRUE";
  localparam [40:1] GEN_TXUSRCLK_REG = "TRUE";
  localparam [0:0] GT_INSTANTIATED_REG = 1'b1;
  localparam [40:1] RXPLL_SEL_REG = "CPLL";
  localparam [0:0] TXOUTCLKPCS_SEL_REG = 1'b0;
  localparam [9:0] TX_USERPATTERN_DATA0_REG = 10'b0101111100;
  localparam [9:0] TX_USERPATTERN_DATA1_REG = 10'b0101010101;
  localparam [9:0] TX_USERPATTERN_DATA2_REG = 10'b1010000011;
  localparam [9:0] TX_USERPATTERN_DATA3_REG = 10'b1010101010;
  localparam [9:0] TX_USERPATTERN_DATA4_REG = 10'b0101111100;
  localparam [9:0] TX_USERPATTERN_DATA5_REG = 10'b0101010101;
  localparam [9:0] TX_USERPATTERN_DATA6_REG = 10'b1010000011;
  localparam [9:0] TX_USERPATTERN_DATA7_REG = 10'b1010101010;

  wire [63:0] RX_PROGDIV_CFG_BIN;
  wire [63:0] SIM_VERSION_BIN;
  wire [63:0] TX_PROGDIV_CFG_BIN;

`ifdef XIL_ATTR_TEST
  reg attr_test = 1'b1;
`else
  reg attr_test = 1'b0;
`endif
  tri0 glblGSR = glbl.GSR;

  `ifdef XIL_TIMING
  reg notifier;
  `endif
  reg trig_attr = 1'b0;
  reg attr_err = 1'b0;
  
// include dynamic registers - XILINX test only
  `ifdef XIL_DR
  `include "GTYE3_CHANNEL_dr.v"
  `endif

  wire CPLLFBCLKLOST_out;
  wire CPLLLOCK_out;
  wire CPLLREFCLKLOST_out;
  wire DRPRDY_out;
  wire EYESCANDATAERROR_out;
  wire GTPOWERGOOD_out;
  wire GTREFCLKMONITOR_out;
  wire GTYTXN_out;
  wire GTYTXP_out;
  wire PCIERATEGEN3_out;
  wire PCIERATEIDLE_out;
  wire PCIESYNCTXSYNCDONE_out;
  wire PCIEUSERGEN3RDY_out;
  wire PCIEUSERPHYSTATUSRST_out;
  wire PCIEUSERRATESTART_out;
  wire PHYSTATUS_out;
  wire RESETEXCEPTION_out;
  wire RXBYTEISALIGNED_out;
  wire RXBYTEREALIGN_out;
  wire RXCDRLOCK_out;
  wire RXCDRPHDONE_out;
  wire RXCHANBONDSEQ_out;
  wire RXCHANISALIGNED_out;
  wire RXCHANREALIGN_out;
  wire RXCKCALDONE_out;
  wire RXCOMINITDET_out;
  wire RXCOMMADET_out;
  wire RXCOMSASDET_out;
  wire RXCOMWAKEDET_out;
  wire RXDLYSRESETDONE_out;
  wire RXELECIDLE_out;
  wire RXOSINTDONE_out;
  wire RXOSINTSTARTED_out;
  wire RXOSINTSTROBEDONE_out;
  wire RXOSINTSTROBESTARTED_out;
  wire RXOUTCLKFABRIC_out;
  wire RXOUTCLKPCS_out;
  wire RXOUTCLK_out;
  wire RXPHALIGNDONE_out;
  wire RXPHALIGNERR_out;
  wire RXPMARESETDONE_out;
  wire RXPRBSERR_out;
  wire RXPRBSLOCKED_out;
  wire RXPRGDIVRESETDONE_out;
  wire RXRATEDONE_out;
  wire RXRECCLKOUT_out;
  wire RXRESETDONE_out;
  wire RXSLIDERDY_out;
  wire RXSLIPDONE_out;
  wire RXSLIPOUTCLKRDY_out;
  wire RXSLIPPMARDY_out;
  wire RXSYNCDONE_out;
  wire RXSYNCOUT_out;
  wire RXVALID_out;
  wire TXCOMFINISH_out;
  wire TXDCCDONE_out;
  wire TXDLYSRESETDONE_out;
  wire TXOUTCLKFABRIC_out;
  wire TXOUTCLKPCS_out;
  wire TXOUTCLK_out;
  wire TXPHALIGNDONE_out;
  wire TXPHINITDONE_out;
  wire TXPMARESETDONE_out;
  wire TXPRGDIVRESETDONE_out;
  wire TXRATEDONE_out;
  wire TXRESETDONE_out;
  wire TXSYNCDONE_out;
  wire TXSYNCOUT_out;
  wire [11:0] PMASCANOUT_out;
  wire [127:0] RXDATA_out;
  wire [15:0] DRPDO_out;
  wire [15:0] PCSRSVDOUT_out;
  wire [15:0] RXCTRL0_out;
  wire [15:0] RXCTRL1_out;
  wire [16:0] DMONITOROUT_out;
  wire [18:0] SCANOUT_out;
  wire [1:0] PCIERATEQPLLPD_out;
  wire [1:0] PCIERATEQPLLRESET_out;
  wire [1:0] RXCLKCORCNT_out;
  wire [1:0] RXDATAVALID_out;
  wire [1:0] RXHEADERVALID_out;
  wire [1:0] RXSTARTOFSEQ_out;
  wire [1:0] TXBUFSTATUS_out;
  wire [2:0] BUFGTCEMASK_out;
  wire [2:0] BUFGTCE_out;
  wire [2:0] BUFGTRESET_out;
  wire [2:0] BUFGTRSTMASK_out;
  wire [2:0] RXBUFSTATUS_out;
  wire [2:0] RXSTATUS_out;
  wire [4:0] RXCHBONDO_out;
  wire [5:0] RXHEADER_out;
  wire [6:0] RXMONITOROUT_out;
  wire [7:0] PINRSRVDAS_out;
  wire [7:0] RXCTRL2_out;
  wire [7:0] RXCTRL3_out;
  wire [7:0] RXDATAEXTENDRSVD_out;
  wire [8:0] BUFGTDIV_out;

  wire CPLLFBCLKLOST_delay;
  wire CPLLLOCK_delay;
  wire CPLLREFCLKLOST_delay;
  wire DRPRDY_delay;
  wire EYESCANDATAERROR_delay;
  wire GTPOWERGOOD_delay;
  wire GTREFCLKMONITOR_delay;
  wire GTYTXN_delay;
  wire GTYTXP_delay;
  wire PCIERATEGEN3_delay;
  wire PCIERATEIDLE_delay;
  wire PCIESYNCTXSYNCDONE_delay;
  wire PCIEUSERGEN3RDY_delay;
  wire PCIEUSERPHYSTATUSRST_delay;
  wire PCIEUSERRATESTART_delay;
  wire PHYSTATUS_delay;
  wire RESETEXCEPTION_delay;
  wire RXBYTEISALIGNED_delay;
  wire RXBYTEREALIGN_delay;
  wire RXCDRLOCK_delay;
  wire RXCDRPHDONE_delay;
  wire RXCHANBONDSEQ_delay;
  wire RXCHANISALIGNED_delay;
  wire RXCHANREALIGN_delay;
  wire RXCKCALDONE_delay;
  wire RXCOMINITDET_delay;
  wire RXCOMMADET_delay;
  wire RXCOMSASDET_delay;
  wire RXCOMWAKEDET_delay;
  wire RXDLYSRESETDONE_delay;
  wire RXELECIDLE_delay;
  wire RXOSINTDONE_delay;
  wire RXOSINTSTARTED_delay;
  wire RXOSINTSTROBEDONE_delay;
  wire RXOSINTSTROBESTARTED_delay;
  wire RXOUTCLKFABRIC_delay;
  wire RXOUTCLKPCS_delay;
  wire RXOUTCLK_delay;
  wire RXPHALIGNDONE_delay;
  wire RXPHALIGNERR_delay;
  wire RXPMARESETDONE_delay;
  wire RXPRBSERR_delay;
  wire RXPRBSLOCKED_delay;
  wire RXPRGDIVRESETDONE_delay;
  wire RXRATEDONE_delay;
  wire RXRECCLKOUT_delay;
  wire RXRESETDONE_delay;
  wire RXSLIDERDY_delay;
  wire RXSLIPDONE_delay;
  wire RXSLIPOUTCLKRDY_delay;
  wire RXSLIPPMARDY_delay;
  wire RXSYNCDONE_delay;
  wire RXSYNCOUT_delay;
  wire RXVALID_delay;
  wire TXCOMFINISH_delay;
  wire TXDCCDONE_delay;
  wire TXDLYSRESETDONE_delay;
  wire TXOUTCLKFABRIC_delay;
  wire TXOUTCLKPCS_delay;
  wire TXOUTCLK_delay;
  wire TXPHALIGNDONE_delay;
  wire TXPHINITDONE_delay;
  wire TXPMARESETDONE_delay;
  wire TXPRGDIVRESETDONE_delay;
  wire TXRATEDONE_delay;
  wire TXRESETDONE_delay;
  wire TXSYNCDONE_delay;
  wire TXSYNCOUT_delay;
  wire [127:0] RXDATA_delay;
  wire [15:0] DRPDO_delay;
  wire [15:0] PCSRSVDOUT_delay;
  wire [15:0] RXCTRL0_delay;
  wire [15:0] RXCTRL1_delay;
  wire [16:0] DMONITOROUT_delay;
  wire [1:0] PCIERATEQPLLPD_delay;
  wire [1:0] PCIERATEQPLLRESET_delay;
  wire [1:0] RXCLKCORCNT_delay;
  wire [1:0] RXDATAVALID_delay;
  wire [1:0] RXHEADERVALID_delay;
  wire [1:0] RXSTARTOFSEQ_delay;
  wire [1:0] TXBUFSTATUS_delay;
  wire [2:0] BUFGTCEMASK_delay;
  wire [2:0] BUFGTCE_delay;
  wire [2:0] BUFGTRESET_delay;
  wire [2:0] BUFGTRSTMASK_delay;
  wire [2:0] RXBUFSTATUS_delay;
  wire [2:0] RXSTATUS_delay;
  wire [4:0] RXCHBONDO_delay;
  wire [5:0] RXHEADER_delay;
  wire [6:0] RXMONITOROUT_delay;
  wire [7:0] PINRSRVDAS_delay;
  wire [7:0] RXCTRL2_delay;
  wire [7:0] RXCTRL3_delay;
  wire [7:0] RXDATAEXTENDRSVD_delay;
  wire [8:0] BUFGTDIV_delay;

  wire CDRSTEPDIR_in;
  wire CDRSTEPSQ_in;
  wire CDRSTEPSX_in;
  wire CFGRESET_in;
  wire CLKRSVD0_in;
  wire CLKRSVD1_in;
  wire CPLLLOCKDETCLK_in;
  wire CPLLLOCKEN_in;
  wire CPLLPD_in;
  wire CPLLRESET_in;
  wire DMONFIFORESET_in;
  wire DMONITORCLK_in;
  wire DRPCLK_in;
  wire DRPEN_in;
  wire DRPWE_in;
  wire ELPCALDVORWREN_in;
  wire ELPCALPAORWREN_in;
  wire EVODDPHICALDONE_in;
  wire EVODDPHICALSTART_in;
  wire EVODDPHIDRDEN_in;
  wire EVODDPHIDWREN_in;
  wire EVODDPHIXRDEN_in;
  wire EVODDPHIXWREN_in;
  wire EYESCANMODE_in;
  wire EYESCANRESET_in;
  wire EYESCANTRIGGER_in;
  wire GTGREFCLK_in;
  wire GTNORTHREFCLK0_in;
  wire GTNORTHREFCLK1_in;
  wire GTREFCLK0_in;
  wire GTREFCLK1_in;
  wire GTRESETSEL_in;
  wire GTRXRESET_in;
  wire GTSOUTHREFCLK0_in;
  wire GTSOUTHREFCLK1_in;
  wire GTTXRESET_in;
  wire GTYRXN_in;
  wire GTYRXP_in;
  wire LPBKRXTXSEREN_in;
  wire LPBKTXRXSEREN_in;
  wire PCIEEQRXEQADAPTDONE_in;
  wire PCIERSTIDLE_in;
  wire PCIERSTTXSYNCSTART_in;
  wire PCIEUSERRATEDONE_in;
  wire PMASCANCLK0_in;
  wire PMASCANCLK1_in;
  wire PMASCANCLK2_in;
  wire PMASCANCLK3_in;
  wire PMASCANCLK4_in;
  wire PMASCANCLK5_in;
  wire PMASCANENB_in;
  wire PMASCANMODEB_in;
  wire PMASCANRSTEN_in;
  wire QPLL0CLK_in;
  wire QPLL0REFCLK_in;
  wire QPLL1CLK_in;
  wire QPLL1REFCLK_in;
  wire RESETOVRD_in;
  wire RSTCLKENTX_in;
  wire RX8B10BEN_in;
  wire RXBUFRESET_in;
  wire RXCDRFREQRESET_in;
  wire RXCDRHOLD_in;
  wire RXCDROVRDEN_in;
  wire RXCDRRESETRSV_in;
  wire RXCDRRESET_in;
  wire RXCHBONDEN_in;
  wire RXCHBONDMASTER_in;
  wire RXCHBONDSLAVE_in;
  wire RXCKCALRESET_in;
  wire RXCOMMADETEN_in;
  wire RXDCCFORCESTART_in;
  wire RXDFEAGCHOLD_in;
  wire RXDFEAGCOVRDEN_in;
  wire RXDFELFHOLD_in;
  wire RXDFELFOVRDEN_in;
  wire RXDFELPMRESET_in;
  wire RXDFETAP10HOLD_in;
  wire RXDFETAP10OVRDEN_in;
  wire RXDFETAP11HOLD_in;
  wire RXDFETAP11OVRDEN_in;
  wire RXDFETAP12HOLD_in;
  wire RXDFETAP12OVRDEN_in;
  wire RXDFETAP13HOLD_in;
  wire RXDFETAP13OVRDEN_in;
  wire RXDFETAP14HOLD_in;
  wire RXDFETAP14OVRDEN_in;
  wire RXDFETAP15HOLD_in;
  wire RXDFETAP15OVRDEN_in;
  wire RXDFETAP2HOLD_in;
  wire RXDFETAP2OVRDEN_in;
  wire RXDFETAP3HOLD_in;
  wire RXDFETAP3OVRDEN_in;
  wire RXDFETAP4HOLD_in;
  wire RXDFETAP4OVRDEN_in;
  wire RXDFETAP5HOLD_in;
  wire RXDFETAP5OVRDEN_in;
  wire RXDFETAP6HOLD_in;
  wire RXDFETAP6OVRDEN_in;
  wire RXDFETAP7HOLD_in;
  wire RXDFETAP7OVRDEN_in;
  wire RXDFETAP8HOLD_in;
  wire RXDFETAP8OVRDEN_in;
  wire RXDFETAP9HOLD_in;
  wire RXDFETAP9OVRDEN_in;
  wire RXDFEUTHOLD_in;
  wire RXDFEUTOVRDEN_in;
  wire RXDFEVPHOLD_in;
  wire RXDFEVPOVRDEN_in;
  wire RXDFEVSEN_in;
  wire RXDFEXYDEN_in;
  wire RXDLYBYPASS_in;
  wire RXDLYEN_in;
  wire RXDLYOVRDEN_in;
  wire RXDLYSRESET_in;
  wire RXGEARBOXSLIP_in;
  wire RXLATCLK_in;
  wire RXLPMEN_in;
  wire RXLPMGCHOLD_in;
  wire RXLPMGCOVRDEN_in;
  wire RXLPMHFHOLD_in;
  wire RXLPMHFOVRDEN_in;
  wire RXLPMLFHOLD_in;
  wire RXLPMLFKLOVRDEN_in;
  wire RXLPMOSHOLD_in;
  wire RXLPMOSOVRDEN_in;
  wire RXMCOMMAALIGNEN_in;
  wire RXOOBRESET_in;
  wire RXOSCALRESET_in;
  wire RXOSHOLD_in;
  wire RXOSINTEN_in;
  wire RXOSINTHOLD_in;
  wire RXOSINTOVRDEN_in;
  wire RXOSINTSTROBE_in;
  wire RXOSINTTESTOVRDEN_in;
  wire RXOSOVRDEN_in;
  wire RXPCOMMAALIGNEN_in;
  wire RXPCSRESET_in;
  wire RXPHALIGNEN_in;
  wire RXPHALIGN_in;
  wire RXPHDLYPD_in;
  wire RXPHDLYRESET_in;
  wire RXPHOVRDEN_in;
  wire RXPMARESET_in;
  wire RXPOLARITY_in;
  wire RXPRBSCNTRESET_in;
  wire RXPROGDIVRESET_in;
  wire RXRATEMODE_in;
  wire RXSLIDE_in;
  wire RXSLIPOUTCLK_in;
  wire RXSLIPPMA_in;
  wire RXSYNCALLIN_in;
  wire RXSYNCIN_in;
  wire RXSYNCMODE_in;
  wire RXUSERRDY_in;
  wire RXUSRCLK2_in;
  wire RXUSRCLK_in;
  wire SARCCLK_in;
  wire SCANCLK_in;
  wire SCANENB_in;
  wire SCANMODEB_in;
  wire SIGVALIDCLK_in;
  wire TSTCLK0_in;
  wire TSTCLK1_in;
  wire TSTPDOVRDB_in;
  wire TX8B10BEN_in;
  wire TXCOMINIT_in;
  wire TXCOMSAS_in;
  wire TXCOMWAKE_in;
  wire TXDCCFORCESTART_in;
  wire TXDCCRESET_in;
  wire TXDEEMPH_in;
  wire TXDETECTRX_in;
  wire TXDIFFPD_in;
  wire TXDLYBYPASS_in;
  wire TXDLYEN_in;
  wire TXDLYHOLD_in;
  wire TXDLYOVRDEN_in;
  wire TXDLYSRESET_in;
  wire TXDLYUPDOWN_in;
  wire TXELECIDLE_in;
  wire TXELFORCESTART_in;
  wire TXINHIBIT_in;
  wire TXLATCLK_in;
  wire TXPCSRESET_in;
  wire TXPDELECIDLEMODE_in;
  wire TXPHALIGNEN_in;
  wire TXPHALIGN_in;
  wire TXPHDLYPD_in;
  wire TXPHDLYRESET_in;
  wire TXPHDLYTSTCLK_in;
  wire TXPHINIT_in;
  wire TXPHOVRDEN_in;
  wire TXPIPPMEN_in;
  wire TXPIPPMOVRDEN_in;
  wire TXPIPPMPD_in;
  wire TXPIPPMSEL_in;
  wire TXPISOPD_in;
  wire TXPMARESET_in;
  wire TXPOLARITY_in;
  wire TXPRBSFORCEERR_in;
  wire TXPROGDIVRESET_in;
  wire TXRATEMODE_in;
  wire TXSWING_in;
  wire TXSYNCALLIN_in;
  wire TXSYNCIN_in;
  wire TXSYNCMODE_in;
  wire TXUSERRDY_in;
  wire TXUSRCLK2_in;
  wire TXUSRCLK_in;
  wire [11:0] PMASCANIN_in;
  wire [127:0] TXDATA_in;
  wire [15:0] DRPDI_in;
  wire [15:0] GTRSVD_in;
  wire [15:0] LOOPRSVD_in;
  wire [15:0] PCSRSVDIN_in;
  wire [15:0] TXCTRL0_in;
  wire [15:0] TXCTRL1_in;
  wire [18:0] SCANIN_in;
  wire [19:0] TSTIN_in;
  wire [1:0] RXELECIDLEMODE_in;
  wire [1:0] RXMONITORSEL_in;
  wire [1:0] RXPD_in;
  wire [1:0] RXPLLCLKSEL_in;
  wire [1:0] RXSYSCLKSEL_in;
  wire [1:0] TXPD_in;
  wire [1:0] TXPLLCLKSEL_in;
  wire [1:0] TXSYSCLKSEL_in;
  wire [2:0] CPLLREFCLKSEL_in;
  wire [2:0] LOOPBACK_in;
  wire [2:0] RXCHBONDLEVEL_in;
  wire [2:0] RXOUTCLKSEL_in;
  wire [2:0] RXRATE_in;
  wire [2:0] TXBUFDIFFCTRL_in;
  wire [2:0] TXMARGIN_in;
  wire [2:0] TXOUTCLKSEL_in;
  wire [2:0] TXRATE_in;
  wire [3:0] RXOSINTCFG_in;
  wire [3:0] RXPRBSSEL_in;
  wire [3:0] TXPRBSSEL_in;
  wire [4:0] PCSRSVDIN2_in;
  wire [4:0] PMARSVDIN_in;
  wire [4:0] RXCHBONDI_in;
  wire [4:0] TSTPD_in;
  wire [4:0] TXDIFFCTRL_in;
  wire [4:0] TXPIPPMSTEPSIZE_in;
  wire [4:0] TXPOSTCURSOR_in;
  wire [4:0] TXPRECURSOR_in;
  wire [5:0] TXHEADER_in;
  wire [6:0] TXMAINCURSOR_in;
  wire [6:0] TXSEQUENCE_in;
  wire [7:0] TX8B10BBYPASS_in;
  wire [7:0] TXCTRL2_in;
  wire [7:0] TXDATAEXTENDRSVD_in;
  wire [9:0] DRPADDR_in;

  wire CDRSTEPDIR_delay;
  wire CDRSTEPSQ_delay;
  wire CDRSTEPSX_delay;
  wire CFGRESET_delay;
  wire CLKRSVD0_delay;
  wire CLKRSVD1_delay;
  wire CPLLLOCKDETCLK_delay;
  wire CPLLLOCKEN_delay;
  wire CPLLPD_delay;
  wire CPLLRESET_delay;
  wire DMONFIFORESET_delay;
  wire DMONITORCLK_delay;
  wire DRPCLK_delay;
  wire DRPEN_delay;
  wire DRPWE_delay;
  wire ELPCALDVORWREN_delay;
  wire ELPCALPAORWREN_delay;
  wire EVODDPHICALDONE_delay;
  wire EVODDPHICALSTART_delay;
  wire EVODDPHIDRDEN_delay;
  wire EVODDPHIDWREN_delay;
  wire EVODDPHIXRDEN_delay;
  wire EVODDPHIXWREN_delay;
  wire EYESCANMODE_delay;
  wire EYESCANRESET_delay;
  wire EYESCANTRIGGER_delay;
  wire GTGREFCLK_delay;
  wire GTNORTHREFCLK0_delay;
  wire GTNORTHREFCLK1_delay;
  wire GTREFCLK0_delay;
  wire GTREFCLK1_delay;
  wire GTRESETSEL_delay;
  wire GTRXRESET_delay;
  wire GTSOUTHREFCLK0_delay;
  wire GTSOUTHREFCLK1_delay;
  wire GTTXRESET_delay;
  wire GTYRXN_delay;
  wire GTYRXP_delay;
  wire LPBKRXTXSEREN_delay;
  wire LPBKTXRXSEREN_delay;
  wire PCIEEQRXEQADAPTDONE_delay;
  wire PCIERSTIDLE_delay;
  wire PCIERSTTXSYNCSTART_delay;
  wire PCIEUSERRATEDONE_delay;
  wire QPLL0CLK_delay;
  wire QPLL0REFCLK_delay;
  wire QPLL1CLK_delay;
  wire QPLL1REFCLK_delay;
  wire RESETOVRD_delay;
  wire RSTCLKENTX_delay;
  wire RX8B10BEN_delay;
  wire RXBUFRESET_delay;
  wire RXCDRFREQRESET_delay;
  wire RXCDRHOLD_delay;
  wire RXCDROVRDEN_delay;
  wire RXCDRRESETRSV_delay;
  wire RXCDRRESET_delay;
  wire RXCHBONDEN_delay;
  wire RXCHBONDMASTER_delay;
  wire RXCHBONDSLAVE_delay;
  wire RXCKCALRESET_delay;
  wire RXCOMMADETEN_delay;
  wire RXDCCFORCESTART_delay;
  wire RXDFEAGCHOLD_delay;
  wire RXDFEAGCOVRDEN_delay;
  wire RXDFELFHOLD_delay;
  wire RXDFELFOVRDEN_delay;
  wire RXDFELPMRESET_delay;
  wire RXDFETAP10HOLD_delay;
  wire RXDFETAP10OVRDEN_delay;
  wire RXDFETAP11HOLD_delay;
  wire RXDFETAP11OVRDEN_delay;
  wire RXDFETAP12HOLD_delay;
  wire RXDFETAP12OVRDEN_delay;
  wire RXDFETAP13HOLD_delay;
  wire RXDFETAP13OVRDEN_delay;
  wire RXDFETAP14HOLD_delay;
  wire RXDFETAP14OVRDEN_delay;
  wire RXDFETAP15HOLD_delay;
  wire RXDFETAP15OVRDEN_delay;
  wire RXDFETAP2HOLD_delay;
  wire RXDFETAP2OVRDEN_delay;
  wire RXDFETAP3HOLD_delay;
  wire RXDFETAP3OVRDEN_delay;
  wire RXDFETAP4HOLD_delay;
  wire RXDFETAP4OVRDEN_delay;
  wire RXDFETAP5HOLD_delay;
  wire RXDFETAP5OVRDEN_delay;
  wire RXDFETAP6HOLD_delay;
  wire RXDFETAP6OVRDEN_delay;
  wire RXDFETAP7HOLD_delay;
  wire RXDFETAP7OVRDEN_delay;
  wire RXDFETAP8HOLD_delay;
  wire RXDFETAP8OVRDEN_delay;
  wire RXDFETAP9HOLD_delay;
  wire RXDFETAP9OVRDEN_delay;
  wire RXDFEUTHOLD_delay;
  wire RXDFEUTOVRDEN_delay;
  wire RXDFEVPHOLD_delay;
  wire RXDFEVPOVRDEN_delay;
  wire RXDFEVSEN_delay;
  wire RXDFEXYDEN_delay;
  wire RXDLYBYPASS_delay;
  wire RXDLYEN_delay;
  wire RXDLYOVRDEN_delay;
  wire RXDLYSRESET_delay;
  wire RXGEARBOXSLIP_delay;
  wire RXLATCLK_delay;
  wire RXLPMEN_delay;
  wire RXLPMGCHOLD_delay;
  wire RXLPMGCOVRDEN_delay;
  wire RXLPMHFHOLD_delay;
  wire RXLPMHFOVRDEN_delay;
  wire RXLPMLFHOLD_delay;
  wire RXLPMLFKLOVRDEN_delay;
  wire RXLPMOSHOLD_delay;
  wire RXLPMOSOVRDEN_delay;
  wire RXMCOMMAALIGNEN_delay;
  wire RXOOBRESET_delay;
  wire RXOSCALRESET_delay;
  wire RXOSHOLD_delay;
  wire RXOSINTEN_delay;
  wire RXOSINTHOLD_delay;
  wire RXOSINTOVRDEN_delay;
  wire RXOSINTSTROBE_delay;
  wire RXOSINTTESTOVRDEN_delay;
  wire RXOSOVRDEN_delay;
  wire RXPCOMMAALIGNEN_delay;
  wire RXPCSRESET_delay;
  wire RXPHALIGNEN_delay;
  wire RXPHALIGN_delay;
  wire RXPHDLYPD_delay;
  wire RXPHDLYRESET_delay;
  wire RXPHOVRDEN_delay;
  wire RXPMARESET_delay;
  wire RXPOLARITY_delay;
  wire RXPRBSCNTRESET_delay;
  wire RXPROGDIVRESET_delay;
  wire RXRATEMODE_delay;
  wire RXSLIDE_delay;
  wire RXSLIPOUTCLK_delay;
  wire RXSLIPPMA_delay;
  wire RXSYNCALLIN_delay;
  wire RXSYNCIN_delay;
  wire RXSYNCMODE_delay;
  wire RXUSERRDY_delay;
  wire RXUSRCLK2_delay;
  wire RXUSRCLK_delay;
  wire SIGVALIDCLK_delay;
  wire TX8B10BEN_delay;
  wire TXCOMINIT_delay;
  wire TXCOMSAS_delay;
  wire TXCOMWAKE_delay;
  wire TXDCCFORCESTART_delay;
  wire TXDCCRESET_delay;
  wire TXDEEMPH_delay;
  wire TXDETECTRX_delay;
  wire TXDIFFPD_delay;
  wire TXDLYBYPASS_delay;
  wire TXDLYEN_delay;
  wire TXDLYHOLD_delay;
  wire TXDLYOVRDEN_delay;
  wire TXDLYSRESET_delay;
  wire TXDLYUPDOWN_delay;
  wire TXELECIDLE_delay;
  wire TXELFORCESTART_delay;
  wire TXINHIBIT_delay;
  wire TXLATCLK_delay;
  wire TXPCSRESET_delay;
  wire TXPDELECIDLEMODE_delay;
  wire TXPHALIGNEN_delay;
  wire TXPHALIGN_delay;
  wire TXPHDLYPD_delay;
  wire TXPHDLYRESET_delay;
  wire TXPHDLYTSTCLK_delay;
  wire TXPHINIT_delay;
  wire TXPHOVRDEN_delay;
  wire TXPIPPMEN_delay;
  wire TXPIPPMOVRDEN_delay;
  wire TXPIPPMPD_delay;
  wire TXPIPPMSEL_delay;
  wire TXPISOPD_delay;
  wire TXPMARESET_delay;
  wire TXPOLARITY_delay;
  wire TXPRBSFORCEERR_delay;
  wire TXPROGDIVRESET_delay;
  wire TXRATEMODE_delay;
  wire TXSWING_delay;
  wire TXSYNCALLIN_delay;
  wire TXSYNCIN_delay;
  wire TXSYNCMODE_delay;
  wire TXUSERRDY_delay;
  wire TXUSRCLK2_delay;
  wire TXUSRCLK_delay;
  wire [127:0] TXDATA_delay;
  wire [15:0] DRPDI_delay;
  wire [15:0] GTRSVD_delay;
  wire [15:0] LOOPRSVD_delay;
  wire [15:0] PCSRSVDIN_delay;
  wire [15:0] TXCTRL0_delay;
  wire [15:0] TXCTRL1_delay;
  wire [19:0] TSTIN_delay;
  wire [1:0] RXELECIDLEMODE_delay;
  wire [1:0] RXMONITORSEL_delay;
  wire [1:0] RXPD_delay;
  wire [1:0] RXPLLCLKSEL_delay;
  wire [1:0] RXSYSCLKSEL_delay;
  wire [1:0] TXPD_delay;
  wire [1:0] TXPLLCLKSEL_delay;
  wire [1:0] TXSYSCLKSEL_delay;
  wire [2:0] CPLLREFCLKSEL_delay;
  wire [2:0] LOOPBACK_delay;
  wire [2:0] RXCHBONDLEVEL_delay;
  wire [2:0] RXOUTCLKSEL_delay;
  wire [2:0] RXRATE_delay;
  wire [2:0] TXBUFDIFFCTRL_delay;
  wire [2:0] TXMARGIN_delay;
  wire [2:0] TXOUTCLKSEL_delay;
  wire [2:0] TXRATE_delay;
  wire [3:0] RXOSINTCFG_delay;
  wire [3:0] RXPRBSSEL_delay;
  wire [3:0] TXPRBSSEL_delay;
  wire [4:0] PCSRSVDIN2_delay;
  wire [4:0] PMARSVDIN_delay;
  wire [4:0] RXCHBONDI_delay;
  wire [4:0] TXDIFFCTRL_delay;
  wire [4:0] TXPIPPMSTEPSIZE_delay;
  wire [4:0] TXPOSTCURSOR_delay;
  wire [4:0] TXPRECURSOR_delay;
  wire [5:0] TXHEADER_delay;
  wire [6:0] TXMAINCURSOR_delay;
  wire [6:0] TXSEQUENCE_delay;
  wire [7:0] TX8B10BBYPASS_delay;
  wire [7:0] TXCTRL2_delay;
  wire [7:0] TXDATAEXTENDRSVD_delay;
  wire [9:0] DRPADDR_delay;

  
  assign #(out_delay) BUFGTCE = BUFGTCE_delay;
  assign #(out_delay) BUFGTCEMASK = BUFGTCEMASK_delay;
  assign #(out_delay) BUFGTDIV = BUFGTDIV_delay;
  assign #(out_delay) BUFGTRESET = BUFGTRESET_delay;
  assign #(out_delay) BUFGTRSTMASK = BUFGTRSTMASK_delay;
  assign #(out_delay) CPLLFBCLKLOST = CPLLFBCLKLOST_delay;
  assign #(out_delay) CPLLLOCK = CPLLLOCK_delay;
  assign #(out_delay) CPLLREFCLKLOST = CPLLREFCLKLOST_delay;
  assign #(out_delay) DMONITOROUT = DMONITOROUT_delay;
  assign #(out_delay) DRPDO = DRPDO_delay;
  assign #(out_delay) DRPRDY = DRPRDY_delay;
  assign #(out_delay) EYESCANDATAERROR = EYESCANDATAERROR_delay;
  assign #(out_delay) GTPOWERGOOD = GTPOWERGOOD_delay;
  assign #(out_delay) GTREFCLKMONITOR = GTREFCLKMONITOR_delay;
  assign #(out_delay) GTYTXN = GTYTXN_delay;
  assign #(out_delay) GTYTXP = GTYTXP_delay;
  assign #(out_delay) PCIERATEGEN3 = PCIERATEGEN3_delay;
  assign #(out_delay) PCIERATEIDLE = PCIERATEIDLE_delay;
  assign #(out_delay) PCIERATEQPLLPD = PCIERATEQPLLPD_delay;
  assign #(out_delay) PCIERATEQPLLRESET = PCIERATEQPLLRESET_delay;
  assign #(out_delay) PCIESYNCTXSYNCDONE = PCIESYNCTXSYNCDONE_delay;
  assign #(out_delay) PCIEUSERGEN3RDY = PCIEUSERGEN3RDY_delay;
  assign #(out_delay) PCIEUSERPHYSTATUSRST = PCIEUSERPHYSTATUSRST_delay;
  assign #(out_delay) PCIEUSERRATESTART = PCIEUSERRATESTART_delay;
  assign #(out_delay) PCSRSVDOUT = PCSRSVDOUT_delay;
  assign #(out_delay) PHYSTATUS = PHYSTATUS_delay;
  assign #(out_delay) PINRSRVDAS = PINRSRVDAS_delay;
  assign #(out_delay) RESETEXCEPTION = RESETEXCEPTION_delay;
  assign #(out_delay) RXBUFSTATUS = RXBUFSTATUS_delay;
  assign #(out_delay) RXBYTEISALIGNED = RXBYTEISALIGNED_delay;
  assign #(out_delay) RXBYTEREALIGN = RXBYTEREALIGN_delay;
  assign #(out_delay) RXCDRLOCK = RXCDRLOCK_delay;
  assign #(out_delay) RXCDRPHDONE = RXCDRPHDONE_delay;
  assign #(out_delay) RXCHANBONDSEQ = RXCHANBONDSEQ_delay;
  assign #(out_delay) RXCHANISALIGNED = RXCHANISALIGNED_delay;
  assign #(out_delay) RXCHANREALIGN = RXCHANREALIGN_delay;
  assign #(out_delay) RXCHBONDO = RXCHBONDO_delay;
  assign #(out_delay) RXCKCALDONE = RXCKCALDONE_delay;
  assign #(out_delay) RXCLKCORCNT = RXCLKCORCNT_delay;
  assign #(out_delay) RXCOMINITDET = RXCOMINITDET_delay;
  assign #(out_delay) RXCOMMADET = RXCOMMADET_delay;
  assign #(out_delay) RXCOMSASDET = RXCOMSASDET_delay;
  assign #(out_delay) RXCOMWAKEDET = RXCOMWAKEDET_delay;
  assign #(out_delay) RXCTRL0 = RXCTRL0_delay;
  assign #(out_delay) RXCTRL1 = RXCTRL1_delay;
  assign #(out_delay) RXCTRL2 = RXCTRL2_delay;
  assign #(out_delay) RXCTRL3 = RXCTRL3_delay;
  assign #(out_delay) RXDATA = RXDATA_delay;
  assign #(out_delay) RXDATAEXTENDRSVD = RXDATAEXTENDRSVD_delay;
  assign #(out_delay) RXDATAVALID = RXDATAVALID_delay;
  assign #(out_delay) RXDLYSRESETDONE = RXDLYSRESETDONE_delay;
  assign #(out_delay) RXELECIDLE = RXELECIDLE_delay;
  assign #(out_delay) RXHEADER = RXHEADER_delay;
  assign #(out_delay) RXHEADERVALID = RXHEADERVALID_delay;
  assign #(out_delay) RXMONITOROUT = RXMONITOROUT_delay;
  assign #(out_delay) RXOSINTDONE = RXOSINTDONE_delay;
  assign #(out_delay) RXOSINTSTARTED = RXOSINTSTARTED_delay;
  assign #(out_delay) RXOSINTSTROBEDONE = RXOSINTSTROBEDONE_delay;
  assign #(out_delay) RXOSINTSTROBESTARTED = RXOSINTSTROBESTARTED_delay;
  assign #(out_delay) RXOUTCLK = RXOUTCLK_delay;
  assign #(out_delay) RXOUTCLKFABRIC = RXOUTCLKFABRIC_delay;
  assign #(out_delay) RXOUTCLKPCS = RXOUTCLKPCS_delay;
  assign #(out_delay) RXPHALIGNDONE = RXPHALIGNDONE_delay;
  assign #(out_delay) RXPHALIGNERR = RXPHALIGNERR_delay;
  assign #(out_delay) RXPMARESETDONE = RXPMARESETDONE_delay;
  assign #(out_delay) RXPRBSERR = RXPRBSERR_delay;
  assign #(out_delay) RXPRBSLOCKED = RXPRBSLOCKED_delay;
  assign #(out_delay) RXPRGDIVRESETDONE = RXPRGDIVRESETDONE_delay;
  assign #(out_delay) RXRATEDONE = RXRATEDONE_delay;
  assign #(out_delay) RXRECCLKOUT = RXRECCLKOUT_delay;
  assign #(out_delay) RXRESETDONE = RXRESETDONE_delay;
  assign #(out_delay) RXSLIDERDY = RXSLIDERDY_delay;
  assign #(out_delay) RXSLIPDONE = RXSLIPDONE_delay;
  assign #(out_delay) RXSLIPOUTCLKRDY = RXSLIPOUTCLKRDY_delay;
  assign #(out_delay) RXSLIPPMARDY = RXSLIPPMARDY_delay;
  assign #(out_delay) RXSTARTOFSEQ = RXSTARTOFSEQ_delay;
  assign #(out_delay) RXSTATUS = RXSTATUS_delay;
  assign #(out_delay) RXSYNCDONE = RXSYNCDONE_delay;
  assign #(out_delay) RXSYNCOUT = RXSYNCOUT_delay;
  assign #(out_delay) RXVALID = RXVALID_delay;
  assign #(out_delay) TXBUFSTATUS = TXBUFSTATUS_delay;
  assign #(out_delay) TXCOMFINISH = TXCOMFINISH_delay;
  assign #(out_delay) TXDCCDONE = TXDCCDONE_delay;
  assign #(out_delay) TXDLYSRESETDONE = TXDLYSRESETDONE_delay;
  assign #(out_delay) TXOUTCLK = TXOUTCLK_delay;
  assign #(out_delay) TXOUTCLKFABRIC = TXOUTCLKFABRIC_delay;
  assign #(out_delay) TXOUTCLKPCS = TXOUTCLKPCS_delay;
  assign #(out_delay) TXPHALIGNDONE = TXPHALIGNDONE_delay;
  assign #(out_delay) TXPHINITDONE = TXPHINITDONE_delay;
  assign #(out_delay) TXPMARESETDONE = TXPMARESETDONE_delay;
  assign #(out_delay) TXPRGDIVRESETDONE = TXPRGDIVRESETDONE_delay;
  assign #(out_delay) TXRATEDONE = TXRATEDONE_delay;
  assign #(out_delay) TXRESETDONE = TXRESETDONE_delay;
  assign #(out_delay) TXSYNCDONE = TXSYNCDONE_delay;
  assign #(out_delay) TXSYNCOUT = TXSYNCOUT_delay;
  
`ifndef XIL_TIMING // inputs with timing checks
  assign #(inclk_delay) DRPCLK_delay = DRPCLK;
  assign #(inclk_delay) RXUSRCLK2_delay = RXUSRCLK2;
  assign #(inclk_delay) RXUSRCLK_delay = RXUSRCLK;
  assign #(inclk_delay) TXUSRCLK2_delay = TXUSRCLK2;

  assign #(in_delay) DRPEN_delay = DRPEN;
  assign #(in_delay) DRPWE_delay = DRPWE;
  assign #(in_delay) RX8B10BEN_delay = RX8B10BEN;
  assign #(in_delay) RXCHBONDEN_delay = RXCHBONDEN;
  assign #(in_delay) RXCHBONDMASTER_delay = RXCHBONDMASTER;
  assign #(in_delay) RXCHBONDSLAVE_delay = RXCHBONDSLAVE;
  assign #(in_delay) RXCOMMADETEN_delay = RXCOMMADETEN;
  assign #(in_delay) RXGEARBOXSLIP_delay = RXGEARBOXSLIP;
  assign #(in_delay) RXMCOMMAALIGNEN_delay = RXMCOMMAALIGNEN;
  assign #(in_delay) RXPCOMMAALIGNEN_delay = RXPCOMMAALIGNEN;
  assign #(in_delay) RXPOLARITY_delay = RXPOLARITY;
  assign #(in_delay) RXSLIDE_delay = RXSLIDE;
  assign #(in_delay) RXSLIPOUTCLK_delay = RXSLIPOUTCLK;
  assign #(in_delay) RXSLIPPMA_delay = RXSLIPPMA;
  assign #(in_delay) TX8B10BEN_delay = TX8B10BEN;
  assign #(in_delay) TXCOMINIT_delay = TXCOMINIT;
  assign #(in_delay) TXCOMSAS_delay = TXCOMSAS;
  assign #(in_delay) TXCOMWAKE_delay = TXCOMWAKE;
  assign #(in_delay) TXDETECTRX_delay = TXDETECTRX;
  assign #(in_delay) TXELECIDLE_delay = TXELECIDLE;
  assign #(in_delay) TXINHIBIT_delay = TXINHIBIT;
  assign #(in_delay) TXPOLARITY_delay = TXPOLARITY;
  assign #(in_delay) TXPRBSFORCEERR_delay = TXPRBSFORCEERR;
`endif //  `ifndef XIL_TIMING
// inputs with no timing checks
  assign #(inclk_delay) CLKRSVD0_delay = CLKRSVD0;
  assign #(inclk_delay) CLKRSVD1_delay = CLKRSVD1;
  assign #(inclk_delay) CPLLLOCKDETCLK_delay = CPLLLOCKDETCLK;
  assign #(inclk_delay) DMONITORCLK_delay = DMONITORCLK;
  assign #(inclk_delay) GTGREFCLK_delay = GTGREFCLK;
  assign #(inclk_delay) RXLATCLK_delay = RXLATCLK;
  assign #(inclk_delay) SIGVALIDCLK_delay = SIGVALIDCLK;
  assign #(inclk_delay) TXLATCLK_delay = TXLATCLK;
  assign #(inclk_delay) TXPHDLYTSTCLK_delay = TXPHDLYTSTCLK;
  assign #(inclk_delay) TXUSRCLK_delay = TXUSRCLK;

  assign #(in_delay) CDRSTEPDIR_delay = CDRSTEPDIR;
  assign #(in_delay) CDRSTEPSQ_delay = CDRSTEPSQ;
  assign #(in_delay) CDRSTEPSX_delay = CDRSTEPSX;
  assign #(in_delay) CFGRESET_delay = CFGRESET;
  assign #(in_delay) CPLLLOCKEN_delay = CPLLLOCKEN;
  assign #(in_delay) CPLLPD_delay = CPLLPD;
  assign #(in_delay) CPLLREFCLKSEL_delay = CPLLREFCLKSEL;
  assign #(in_delay) CPLLRESET_delay = CPLLRESET;
  assign #(in_delay) DMONFIFORESET_delay = DMONFIFORESET;
  assign #(in_delay) DRPADDR_delay = DRPADDR;
  assign #(in_delay) DRPDI_delay = DRPDI;
  assign #(in_delay) ELPCALDVORWREN_delay = ELPCALDVORWREN;
  assign #(in_delay) ELPCALPAORWREN_delay = ELPCALPAORWREN;
  assign #(in_delay) EVODDPHICALDONE_delay = EVODDPHICALDONE;
  assign #(in_delay) EVODDPHICALSTART_delay = EVODDPHICALSTART;
  assign #(in_delay) EVODDPHIDRDEN_delay = EVODDPHIDRDEN;
  assign #(in_delay) EVODDPHIDWREN_delay = EVODDPHIDWREN;
  assign #(in_delay) EVODDPHIXRDEN_delay = EVODDPHIXRDEN;
  assign #(in_delay) EVODDPHIXWREN_delay = EVODDPHIXWREN;
  assign #(in_delay) EYESCANMODE_delay = EYESCANMODE;
  assign #(in_delay) EYESCANRESET_delay = EYESCANRESET;
  assign #(in_delay) EYESCANTRIGGER_delay = EYESCANTRIGGER;
  assign #(in_delay) GTNORTHREFCLK0_delay = GTNORTHREFCLK0;
  assign #(in_delay) GTNORTHREFCLK1_delay = GTNORTHREFCLK1;
  assign #(in_delay) GTREFCLK0_delay = GTREFCLK0;
  assign #(in_delay) GTREFCLK1_delay = GTREFCLK1;
  assign #(in_delay) GTRESETSEL_delay = GTRESETSEL;
  assign #(in_delay) GTRSVD_delay = GTRSVD;
  assign #(in_delay) GTRXRESET_delay = GTRXRESET;
  assign #(in_delay) GTSOUTHREFCLK0_delay = GTSOUTHREFCLK0;
  assign #(in_delay) GTSOUTHREFCLK1_delay = GTSOUTHREFCLK1;
  assign #(in_delay) GTTXRESET_delay = GTTXRESET;
  assign #(in_delay) GTYRXN_delay = GTYRXN;
  assign #(in_delay) GTYRXP_delay = GTYRXP;
  assign #(in_delay) LOOPBACK_delay = LOOPBACK;
  assign #(in_delay) LOOPRSVD_delay = LOOPRSVD;
  assign #(in_delay) LPBKRXTXSEREN_delay = LPBKRXTXSEREN;
  assign #(in_delay) LPBKTXRXSEREN_delay = LPBKTXRXSEREN;
  assign #(in_delay) PCIEEQRXEQADAPTDONE_delay = PCIEEQRXEQADAPTDONE;
  assign #(in_delay) PCIERSTIDLE_delay = PCIERSTIDLE;
  assign #(in_delay) PCIERSTTXSYNCSTART_delay = PCIERSTTXSYNCSTART;
  assign #(in_delay) PCIEUSERRATEDONE_delay = PCIEUSERRATEDONE;
  assign #(in_delay) PCSRSVDIN2_delay = PCSRSVDIN2;
  assign #(in_delay) PCSRSVDIN_delay = PCSRSVDIN;
  assign #(in_delay) PMARSVDIN_delay = PMARSVDIN;
  assign #(in_delay) QPLL0CLK_delay = QPLL0CLK;
  assign #(in_delay) QPLL0REFCLK_delay = QPLL0REFCLK;
  assign #(in_delay) QPLL1CLK_delay = QPLL1CLK;
  assign #(in_delay) QPLL1REFCLK_delay = QPLL1REFCLK;
  assign #(in_delay) RESETOVRD_delay = RESETOVRD;
  assign #(in_delay) RSTCLKENTX_delay = RSTCLKENTX;
  assign #(in_delay) RXBUFRESET_delay = RXBUFRESET;
  assign #(in_delay) RXCDRFREQRESET_delay = RXCDRFREQRESET;
  assign #(in_delay) RXCDRHOLD_delay = RXCDRHOLD;
  assign #(in_delay) RXCDROVRDEN_delay = RXCDROVRDEN;
  assign #(in_delay) RXCDRRESETRSV_delay = RXCDRRESETRSV;
  assign #(in_delay) RXCDRRESET_delay = RXCDRRESET;
  assign #(in_delay) RXCHBONDI_delay = RXCHBONDI;
  assign #(in_delay) RXCHBONDLEVEL_delay = RXCHBONDLEVEL;
  assign #(in_delay) RXCKCALRESET_delay = RXCKCALRESET;
  assign #(in_delay) RXDCCFORCESTART_delay = RXDCCFORCESTART;
  assign #(in_delay) RXDFEAGCHOLD_delay = RXDFEAGCHOLD;
  assign #(in_delay) RXDFEAGCOVRDEN_delay = RXDFEAGCOVRDEN;
  assign #(in_delay) RXDFELFHOLD_delay = RXDFELFHOLD;
  assign #(in_delay) RXDFELFOVRDEN_delay = RXDFELFOVRDEN;
  assign #(in_delay) RXDFELPMRESET_delay = RXDFELPMRESET;
  assign #(in_delay) RXDFETAP10HOLD_delay = RXDFETAP10HOLD;
  assign #(in_delay) RXDFETAP10OVRDEN_delay = RXDFETAP10OVRDEN;
  assign #(in_delay) RXDFETAP11HOLD_delay = RXDFETAP11HOLD;
  assign #(in_delay) RXDFETAP11OVRDEN_delay = RXDFETAP11OVRDEN;
  assign #(in_delay) RXDFETAP12HOLD_delay = RXDFETAP12HOLD;
  assign #(in_delay) RXDFETAP12OVRDEN_delay = RXDFETAP12OVRDEN;
  assign #(in_delay) RXDFETAP13HOLD_delay = RXDFETAP13HOLD;
  assign #(in_delay) RXDFETAP13OVRDEN_delay = RXDFETAP13OVRDEN;
  assign #(in_delay) RXDFETAP14HOLD_delay = RXDFETAP14HOLD;
  assign #(in_delay) RXDFETAP14OVRDEN_delay = RXDFETAP14OVRDEN;
  assign #(in_delay) RXDFETAP15HOLD_delay = RXDFETAP15HOLD;
  assign #(in_delay) RXDFETAP15OVRDEN_delay = RXDFETAP15OVRDEN;
  assign #(in_delay) RXDFETAP2HOLD_delay = RXDFETAP2HOLD;
  assign #(in_delay) RXDFETAP2OVRDEN_delay = RXDFETAP2OVRDEN;
  assign #(in_delay) RXDFETAP3HOLD_delay = RXDFETAP3HOLD;
  assign #(in_delay) RXDFETAP3OVRDEN_delay = RXDFETAP3OVRDEN;
  assign #(in_delay) RXDFETAP4HOLD_delay = RXDFETAP4HOLD;
  assign #(in_delay) RXDFETAP4OVRDEN_delay = RXDFETAP4OVRDEN;
  assign #(in_delay) RXDFETAP5HOLD_delay = RXDFETAP5HOLD;
  assign #(in_delay) RXDFETAP5OVRDEN_delay = RXDFETAP5OVRDEN;
  assign #(in_delay) RXDFETAP6HOLD_delay = RXDFETAP6HOLD;
  assign #(in_delay) RXDFETAP6OVRDEN_delay = RXDFETAP6OVRDEN;
  assign #(in_delay) RXDFETAP7HOLD_delay = RXDFETAP7HOLD;
  assign #(in_delay) RXDFETAP7OVRDEN_delay = RXDFETAP7OVRDEN;
  assign #(in_delay) RXDFETAP8HOLD_delay = RXDFETAP8HOLD;
  assign #(in_delay) RXDFETAP8OVRDEN_delay = RXDFETAP8OVRDEN;
  assign #(in_delay) RXDFETAP9HOLD_delay = RXDFETAP9HOLD;
  assign #(in_delay) RXDFETAP9OVRDEN_delay = RXDFETAP9OVRDEN;
  assign #(in_delay) RXDFEUTHOLD_delay = RXDFEUTHOLD;
  assign #(in_delay) RXDFEUTOVRDEN_delay = RXDFEUTOVRDEN;
  assign #(in_delay) RXDFEVPHOLD_delay = RXDFEVPHOLD;
  assign #(in_delay) RXDFEVPOVRDEN_delay = RXDFEVPOVRDEN;
  assign #(in_delay) RXDFEVSEN_delay = RXDFEVSEN;
  assign #(in_delay) RXDFEXYDEN_delay = RXDFEXYDEN;
  assign #(in_delay) RXDLYBYPASS_delay = RXDLYBYPASS;
  assign #(in_delay) RXDLYEN_delay = RXDLYEN;
  assign #(in_delay) RXDLYOVRDEN_delay = RXDLYOVRDEN;
  assign #(in_delay) RXDLYSRESET_delay = RXDLYSRESET;
  assign #(in_delay) RXELECIDLEMODE_delay = RXELECIDLEMODE;
  assign #(in_delay) RXLPMEN_delay = RXLPMEN;
  assign #(in_delay) RXLPMGCHOLD_delay = RXLPMGCHOLD;
  assign #(in_delay) RXLPMGCOVRDEN_delay = RXLPMGCOVRDEN;
  assign #(in_delay) RXLPMHFHOLD_delay = RXLPMHFHOLD;
  assign #(in_delay) RXLPMHFOVRDEN_delay = RXLPMHFOVRDEN;
  assign #(in_delay) RXLPMLFHOLD_delay = RXLPMLFHOLD;
  assign #(in_delay) RXLPMLFKLOVRDEN_delay = RXLPMLFKLOVRDEN;
  assign #(in_delay) RXLPMOSHOLD_delay = RXLPMOSHOLD;
  assign #(in_delay) RXLPMOSOVRDEN_delay = RXLPMOSOVRDEN;
  assign #(in_delay) RXMONITORSEL_delay = RXMONITORSEL;
  assign #(in_delay) RXOOBRESET_delay = RXOOBRESET;
  assign #(in_delay) RXOSCALRESET_delay = RXOSCALRESET;
  assign #(in_delay) RXOSHOLD_delay = RXOSHOLD;
  assign #(in_delay) RXOSINTCFG_delay = RXOSINTCFG;
  assign #(in_delay) RXOSINTEN_delay = RXOSINTEN;
  assign #(in_delay) RXOSINTHOLD_delay = RXOSINTHOLD;
  assign #(in_delay) RXOSINTOVRDEN_delay = RXOSINTOVRDEN;
  assign #(in_delay) RXOSINTSTROBE_delay = RXOSINTSTROBE;
  assign #(in_delay) RXOSINTTESTOVRDEN_delay = RXOSINTTESTOVRDEN;
  assign #(in_delay) RXOSOVRDEN_delay = RXOSOVRDEN;
  assign #(in_delay) RXOUTCLKSEL_delay = RXOUTCLKSEL;
  assign #(in_delay) RXPCSRESET_delay = RXPCSRESET;
  assign #(in_delay) RXPD_delay = RXPD;
  assign #(in_delay) RXPHALIGNEN_delay = RXPHALIGNEN;
  assign #(in_delay) RXPHALIGN_delay = RXPHALIGN;
  assign #(in_delay) RXPHDLYPD_delay = RXPHDLYPD;
  assign #(in_delay) RXPHDLYRESET_delay = RXPHDLYRESET;
  assign #(in_delay) RXPHOVRDEN_delay = RXPHOVRDEN;
  assign #(in_delay) RXPLLCLKSEL_delay = RXPLLCLKSEL;
  assign #(in_delay) RXPMARESET_delay = RXPMARESET;
  assign #(in_delay) RXPRBSCNTRESET_delay = RXPRBSCNTRESET;
  assign #(in_delay) RXPRBSSEL_delay = RXPRBSSEL;
  assign #(in_delay) RXPROGDIVRESET_delay = RXPROGDIVRESET;
  assign #(in_delay) RXRATEMODE_delay = RXRATEMODE;
  assign #(in_delay) RXRATE_delay = RXRATE;
  assign #(in_delay) RXSYNCALLIN_delay = RXSYNCALLIN;
  assign #(in_delay) RXSYNCIN_delay = RXSYNCIN;
  assign #(in_delay) RXSYNCMODE_delay = RXSYNCMODE;
  assign #(in_delay) RXSYSCLKSEL_delay = RXSYSCLKSEL;
  assign #(in_delay) RXUSERRDY_delay = RXUSERRDY;
  assign #(in_delay) TSTIN_delay = TSTIN;
  assign #(in_delay) TX8B10BBYPASS_delay = TX8B10BBYPASS;
  assign #(in_delay) TXBUFDIFFCTRL_delay = TXBUFDIFFCTRL;
  assign #(in_delay) TXCTRL0_delay = TXCTRL0;
  assign #(in_delay) TXCTRL1_delay = TXCTRL1;
  assign #(in_delay) TXCTRL2_delay = TXCTRL2;
  assign #(in_delay) TXDATAEXTENDRSVD_delay = TXDATAEXTENDRSVD;
  assign #(in_delay) TXDATA_delay = TXDATA;
  assign #(in_delay) TXDCCFORCESTART_delay = TXDCCFORCESTART;
  assign #(in_delay) TXDCCRESET_delay = TXDCCRESET;
  assign #(in_delay) TXDEEMPH_delay = TXDEEMPH;
  assign #(in_delay) TXDIFFCTRL_delay = TXDIFFCTRL;
  assign #(in_delay) TXDIFFPD_delay = TXDIFFPD;
  assign #(in_delay) TXDLYBYPASS_delay = TXDLYBYPASS;
  assign #(in_delay) TXDLYEN_delay = TXDLYEN;
  assign #(in_delay) TXDLYHOLD_delay = TXDLYHOLD;
  assign #(in_delay) TXDLYOVRDEN_delay = TXDLYOVRDEN;
  assign #(in_delay) TXDLYSRESET_delay = TXDLYSRESET;
  assign #(in_delay) TXDLYUPDOWN_delay = TXDLYUPDOWN;
  assign #(in_delay) TXELFORCESTART_delay = TXELFORCESTART;
  assign #(in_delay) TXHEADER_delay = TXHEADER;
  assign #(in_delay) TXMAINCURSOR_delay = TXMAINCURSOR;
  assign #(in_delay) TXMARGIN_delay = TXMARGIN;
  assign #(in_delay) TXOUTCLKSEL_delay = TXOUTCLKSEL;
  assign #(in_delay) TXPCSRESET_delay = TXPCSRESET;
  assign #(in_delay) TXPDELECIDLEMODE_delay = TXPDELECIDLEMODE;
  assign #(in_delay) TXPD_delay = TXPD;
  assign #(in_delay) TXPHALIGNEN_delay = TXPHALIGNEN;
  assign #(in_delay) TXPHALIGN_delay = TXPHALIGN;
  assign #(in_delay) TXPHDLYPD_delay = TXPHDLYPD;
  assign #(in_delay) TXPHDLYRESET_delay = TXPHDLYRESET;
  assign #(in_delay) TXPHINIT_delay = TXPHINIT;
  assign #(in_delay) TXPHOVRDEN_delay = TXPHOVRDEN;
  assign #(in_delay) TXPIPPMEN_delay = TXPIPPMEN;
  assign #(in_delay) TXPIPPMOVRDEN_delay = TXPIPPMOVRDEN;
  assign #(in_delay) TXPIPPMPD_delay = TXPIPPMPD;
  assign #(in_delay) TXPIPPMSEL_delay = TXPIPPMSEL;
  assign #(in_delay) TXPIPPMSTEPSIZE_delay = TXPIPPMSTEPSIZE;
  assign #(in_delay) TXPISOPD_delay = TXPISOPD;
  assign #(in_delay) TXPLLCLKSEL_delay = TXPLLCLKSEL;
  assign #(in_delay) TXPMARESET_delay = TXPMARESET;
  assign #(in_delay) TXPOSTCURSOR_delay = TXPOSTCURSOR;
  assign #(in_delay) TXPRBSSEL_delay = TXPRBSSEL;
  assign #(in_delay) TXPRECURSOR_delay = TXPRECURSOR;
  assign #(in_delay) TXPROGDIVRESET_delay = TXPROGDIVRESET;
  assign #(in_delay) TXRATEMODE_delay = TXRATEMODE;
  assign #(in_delay) TXRATE_delay = TXRATE;
  assign #(in_delay) TXSEQUENCE_delay = TXSEQUENCE;
  assign #(in_delay) TXSWING_delay = TXSWING;
  assign #(in_delay) TXSYNCALLIN_delay = TXSYNCALLIN;
  assign #(in_delay) TXSYNCIN_delay = TXSYNCIN;
  assign #(in_delay) TXSYNCMODE_delay = TXSYNCMODE;
  assign #(in_delay) TXSYSCLKSEL_delay = TXSYSCLKSEL;
  assign #(in_delay) TXUSERRDY_delay = TXUSERRDY;

  assign BUFGTCEMASK_delay = BUFGTCEMASK_out;
  assign BUFGTCE_delay = BUFGTCE_out;
  assign BUFGTDIV_delay = BUFGTDIV_out;
  assign BUFGTRESET_delay = BUFGTRESET_out;
  assign BUFGTRSTMASK_delay = BUFGTRSTMASK_out;
  assign CPLLFBCLKLOST_delay = CPLLFBCLKLOST_out;
  assign CPLLLOCK_delay = CPLLLOCK_out;
  assign CPLLREFCLKLOST_delay = CPLLREFCLKLOST_out;
  assign DMONITOROUT_delay = DMONITOROUT_out;
  assign DRPDO_delay = DRPDO_out;
  assign DRPRDY_delay = DRPRDY_out;
  assign EYESCANDATAERROR_delay = EYESCANDATAERROR_out;
  assign GTPOWERGOOD_delay = GTPOWERGOOD_out;
  assign GTREFCLKMONITOR_delay = GTREFCLKMONITOR_out;
  assign GTYTXN_delay = GTYTXN_out;
  assign GTYTXP_delay = GTYTXP_out;
  assign PCIERATEGEN3_delay = PCIERATEGEN3_out;
  assign PCIERATEIDLE_delay = PCIERATEIDLE_out;
  assign PCIERATEQPLLPD_delay = PCIERATEQPLLPD_out;
  assign PCIERATEQPLLRESET_delay = PCIERATEQPLLRESET_out;
  assign PCIESYNCTXSYNCDONE_delay = PCIESYNCTXSYNCDONE_out;
  assign PCIEUSERGEN3RDY_delay = PCIEUSERGEN3RDY_out;
  assign PCIEUSERPHYSTATUSRST_delay = PCIEUSERPHYSTATUSRST_out;
  assign PCIEUSERRATESTART_delay = PCIEUSERRATESTART_out;
  assign PCSRSVDOUT_delay = PCSRSVDOUT_out;
  assign PHYSTATUS_delay = PHYSTATUS_out;
  assign PINRSRVDAS_delay = PINRSRVDAS_out;
  assign RESETEXCEPTION_delay = RESETEXCEPTION_out;
  assign RXBUFSTATUS_delay = RXBUFSTATUS_out;
  assign RXBYTEISALIGNED_delay = RXBYTEISALIGNED_out;
  assign RXBYTEREALIGN_delay = RXBYTEREALIGN_out;
  assign RXCDRLOCK_delay = RXCDRLOCK_out;
  assign RXCDRPHDONE_delay = RXCDRPHDONE_out;
  assign RXCHANBONDSEQ_delay = RXCHANBONDSEQ_out;
  assign RXCHANISALIGNED_delay = RXCHANISALIGNED_out;
  assign RXCHANREALIGN_delay = RXCHANREALIGN_out;
  assign RXCHBONDO_delay = RXCHBONDO_out;
  assign RXCKCALDONE_delay = RXCKCALDONE_out;
  assign RXCLKCORCNT_delay = RXCLKCORCNT_out;
  assign RXCOMINITDET_delay = RXCOMINITDET_out;
  assign RXCOMMADET_delay = RXCOMMADET_out;
  assign RXCOMSASDET_delay = RXCOMSASDET_out;
  assign RXCOMWAKEDET_delay = RXCOMWAKEDET_out;
  assign RXCTRL0_delay = RXCTRL0_out;
  assign RXCTRL1_delay = RXCTRL1_out;
  assign RXCTRL2_delay = RXCTRL2_out;
  assign RXCTRL3_delay = RXCTRL3_out;
  assign RXDATAEXTENDRSVD_delay = RXDATAEXTENDRSVD_out;
  assign RXDATAVALID_delay = RXDATAVALID_out;
  assign RXDATA_delay = RXDATA_out;
  assign RXDLYSRESETDONE_delay = RXDLYSRESETDONE_out;
  assign RXELECIDLE_delay = RXELECIDLE_out;
  assign RXHEADERVALID_delay = RXHEADERVALID_out;
  assign RXHEADER_delay = RXHEADER_out;
  assign RXMONITOROUT_delay = RXMONITOROUT_out;
  assign RXOSINTDONE_delay = RXOSINTDONE_out;
  assign RXOSINTSTARTED_delay = RXOSINTSTARTED_out;
  assign RXOSINTSTROBEDONE_delay = RXOSINTSTROBEDONE_out;
  assign RXOSINTSTROBESTARTED_delay = RXOSINTSTROBESTARTED_out;
  assign RXOUTCLKFABRIC_delay = RXOUTCLKFABRIC_out;
  assign RXOUTCLKPCS_delay = RXOUTCLKPCS_out;
  assign RXOUTCLK_delay = RXOUTCLK_out;
  assign RXPHALIGNDONE_delay = RXPHALIGNDONE_out;
  assign RXPHALIGNERR_delay = RXPHALIGNERR_out;
  assign RXPMARESETDONE_delay = RXPMARESETDONE_out;
  assign RXPRBSERR_delay = RXPRBSERR_out;
  assign RXPRBSLOCKED_delay = RXPRBSLOCKED_out;
  assign RXPRGDIVRESETDONE_delay = RXPRGDIVRESETDONE_out;
  assign RXRATEDONE_delay = RXRATEDONE_out;
  assign RXRECCLKOUT_delay = RXRECCLKOUT_out;
  assign RXRESETDONE_delay = RXRESETDONE_out;
  assign RXSLIDERDY_delay = RXSLIDERDY_out;
  assign RXSLIPDONE_delay = RXSLIPDONE_out;
  assign RXSLIPOUTCLKRDY_delay = RXSLIPOUTCLKRDY_out;
  assign RXSLIPPMARDY_delay = RXSLIPPMARDY_out;
  assign RXSTARTOFSEQ_delay = RXSTARTOFSEQ_out;
  assign RXSTATUS_delay = RXSTATUS_out;
  assign RXSYNCDONE_delay = RXSYNCDONE_out;
  assign RXSYNCOUT_delay = RXSYNCOUT_out;
  assign RXVALID_delay = RXVALID_out;
  assign TXBUFSTATUS_delay = TXBUFSTATUS_out;
  assign TXCOMFINISH_delay = TXCOMFINISH_out;
  assign TXDCCDONE_delay = TXDCCDONE_out;
  assign TXDLYSRESETDONE_delay = TXDLYSRESETDONE_out;
  assign TXOUTCLKFABRIC_delay = TXOUTCLKFABRIC_out;
  assign TXOUTCLKPCS_delay = TXOUTCLKPCS_out;
  assign TXOUTCLK_delay = TXOUTCLK_out;
  assign TXPHALIGNDONE_delay = TXPHALIGNDONE_out;
  assign TXPHINITDONE_delay = TXPHINITDONE_out;
  assign TXPMARESETDONE_delay = TXPMARESETDONE_out;
  assign TXPRGDIVRESETDONE_delay = TXPRGDIVRESETDONE_out;
  assign TXRATEDONE_delay = TXRATEDONE_out;
  assign TXRESETDONE_delay = TXRESETDONE_out;
  assign TXSYNCDONE_delay = TXSYNCDONE_out;
  assign TXSYNCOUT_delay = TXSYNCOUT_out;

  assign CDRSTEPDIR_in = (CDRSTEPDIR !== 1'bz) && CDRSTEPDIR_delay; // rv 0
  assign CDRSTEPSQ_in = (CDRSTEPSQ !== 1'bz) && CDRSTEPSQ_delay; // rv 0
  assign CDRSTEPSX_in = (CDRSTEPSX !== 1'bz) && CDRSTEPSX_delay; // rv 0
  assign CFGRESET_in = (CFGRESET !== 1'bz) && CFGRESET_delay; // rv 0
  assign CLKRSVD0_in = (CLKRSVD0 !== 1'bz) && CLKRSVD0_delay; // rv 0
  assign CLKRSVD1_in = (CLKRSVD1 !== 1'bz) && CLKRSVD1_delay; // rv 0
  assign CPLLLOCKDETCLK_in = (CPLLLOCKDETCLK !== 1'bz) && CPLLLOCKDETCLK_delay; // rv 0
  assign CPLLLOCKEN_in = (CPLLLOCKEN !== 1'bz) && CPLLLOCKEN_delay; // rv 0
  assign CPLLPD_in = (CPLLPD !== 1'bz) && CPLLPD_delay; // rv 0
  assign CPLLREFCLKSEL_in[0] = (CPLLREFCLKSEL[0] === 1'bz) || CPLLREFCLKSEL_delay[0]; // rv 1
  assign CPLLREFCLKSEL_in[1] = (CPLLREFCLKSEL[1] !== 1'bz) && CPLLREFCLKSEL_delay[1]; // rv 0
  assign CPLLREFCLKSEL_in[2] = (CPLLREFCLKSEL[2] !== 1'bz) && CPLLREFCLKSEL_delay[2]; // rv 0
  assign CPLLRESET_in = (CPLLRESET !== 1'bz) && CPLLRESET_delay; // rv 0
  assign DMONFIFORESET_in = (DMONFIFORESET !== 1'bz) && DMONFIFORESET_delay; // rv 0
  assign DMONITORCLK_in = (DMONITORCLK !== 1'bz) && DMONITORCLK_delay; // rv 0
  assign DRPADDR_in[0] = (DRPADDR[0] !== 1'bz) && DRPADDR_delay[0]; // rv 0
  assign DRPADDR_in[1] = (DRPADDR[1] !== 1'bz) && DRPADDR_delay[1]; // rv 0
  assign DRPADDR_in[2] = (DRPADDR[2] !== 1'bz) && DRPADDR_delay[2]; // rv 0
  assign DRPADDR_in[3] = (DRPADDR[3] !== 1'bz) && DRPADDR_delay[3]; // rv 0
  assign DRPADDR_in[4] = (DRPADDR[4] !== 1'bz) && DRPADDR_delay[4]; // rv 0
  assign DRPADDR_in[5] = (DRPADDR[5] !== 1'bz) && DRPADDR_delay[5]; // rv 0
  assign DRPADDR_in[6] = (DRPADDR[6] !== 1'bz) && DRPADDR_delay[6]; // rv 0
  assign DRPADDR_in[7] = (DRPADDR[7] !== 1'bz) && DRPADDR_delay[7]; // rv 0
  assign DRPADDR_in[8] = (DRPADDR[8] !== 1'bz) && DRPADDR_delay[8]; // rv 0
  assign DRPADDR_in[9] = (DRPADDR[9] !== 1'bz) && DRPADDR_delay[9]; // rv 0
  assign DRPCLK_in = (DRPCLK !== 1'bz) && DRPCLK_delay; // rv 0
  assign DRPDI_in[0] = (DRPDI[0] !== 1'bz) && DRPDI_delay[0]; // rv 0
  assign DRPDI_in[10] = (DRPDI[10] !== 1'bz) && DRPDI_delay[10]; // rv 0
  assign DRPDI_in[11] = (DRPDI[11] !== 1'bz) && DRPDI_delay[11]; // rv 0
  assign DRPDI_in[12] = (DRPDI[12] !== 1'bz) && DRPDI_delay[12]; // rv 0
  assign DRPDI_in[13] = (DRPDI[13] !== 1'bz) && DRPDI_delay[13]; // rv 0
  assign DRPDI_in[14] = (DRPDI[14] !== 1'bz) && DRPDI_delay[14]; // rv 0
  assign DRPDI_in[15] = (DRPDI[15] !== 1'bz) && DRPDI_delay[15]; // rv 0
  assign DRPDI_in[1] = (DRPDI[1] !== 1'bz) && DRPDI_delay[1]; // rv 0
  assign DRPDI_in[2] = (DRPDI[2] !== 1'bz) && DRPDI_delay[2]; // rv 0
  assign DRPDI_in[3] = (DRPDI[3] !== 1'bz) && DRPDI_delay[3]; // rv 0
  assign DRPDI_in[4] = (DRPDI[4] !== 1'bz) && DRPDI_delay[4]; // rv 0
  assign DRPDI_in[5] = (DRPDI[5] !== 1'bz) && DRPDI_delay[5]; // rv 0
  assign DRPDI_in[6] = (DRPDI[6] !== 1'bz) && DRPDI_delay[6]; // rv 0
  assign DRPDI_in[7] = (DRPDI[7] !== 1'bz) && DRPDI_delay[7]; // rv 0
  assign DRPDI_in[8] = (DRPDI[8] !== 1'bz) && DRPDI_delay[8]; // rv 0
  assign DRPDI_in[9] = (DRPDI[9] !== 1'bz) && DRPDI_delay[9]; // rv 0
  assign DRPEN_in = (DRPEN !== 1'bz) && DRPEN_delay; // rv 0
  assign DRPWE_in = (DRPWE !== 1'bz) && DRPWE_delay; // rv 0
  assign ELPCALDVORWREN_in = (ELPCALDVORWREN !== 1'bz) && ELPCALDVORWREN_delay; // rv 0
  assign ELPCALPAORWREN_in = (ELPCALPAORWREN !== 1'bz) && ELPCALPAORWREN_delay; // rv 0
  assign EVODDPHICALDONE_in = (EVODDPHICALDONE !== 1'bz) && EVODDPHICALDONE_delay; // rv 0
  assign EVODDPHICALSTART_in = (EVODDPHICALSTART !== 1'bz) && EVODDPHICALSTART_delay; // rv 0
  assign EVODDPHIDRDEN_in = (EVODDPHIDRDEN !== 1'bz) && EVODDPHIDRDEN_delay; // rv 0
  assign EVODDPHIDWREN_in = (EVODDPHIDWREN !== 1'bz) && EVODDPHIDWREN_delay; // rv 0
  assign EVODDPHIXRDEN_in = (EVODDPHIXRDEN !== 1'bz) && EVODDPHIXRDEN_delay; // rv 0
  assign EVODDPHIXWREN_in = (EVODDPHIXWREN !== 1'bz) && EVODDPHIXWREN_delay; // rv 0
  assign EYESCANMODE_in = (EYESCANMODE !== 1'bz) && EYESCANMODE_delay; // rv 0
  assign EYESCANRESET_in = (EYESCANRESET !== 1'bz) && EYESCANRESET_delay; // rv 0
  assign EYESCANTRIGGER_in = (EYESCANTRIGGER !== 1'bz) && EYESCANTRIGGER_delay; // rv 0
  assign GTGREFCLK_in = GTGREFCLK_delay;
  assign GTNORTHREFCLK0_in = GTNORTHREFCLK0_delay;
  assign GTNORTHREFCLK1_in = GTNORTHREFCLK1_delay;
  assign GTREFCLK0_in = GTREFCLK0_delay;
  assign GTREFCLK1_in = GTREFCLK1_delay;
  assign GTRESETSEL_in = (GTRESETSEL !== 1'bz) && GTRESETSEL_delay; // rv 0
  assign GTRSVD_in[0] = (GTRSVD[0] !== 1'bz) && GTRSVD_delay[0]; // rv 0
  assign GTRSVD_in[10] = (GTRSVD[10] !== 1'bz) && GTRSVD_delay[10]; // rv 0
  assign GTRSVD_in[11] = (GTRSVD[11] !== 1'bz) && GTRSVD_delay[11]; // rv 0
  assign GTRSVD_in[12] = (GTRSVD[12] !== 1'bz) && GTRSVD_delay[12]; // rv 0
  assign GTRSVD_in[13] = (GTRSVD[13] !== 1'bz) && GTRSVD_delay[13]; // rv 0
  assign GTRSVD_in[14] = (GTRSVD[14] !== 1'bz) && GTRSVD_delay[14]; // rv 0
  assign GTRSVD_in[15] = (GTRSVD[15] !== 1'bz) && GTRSVD_delay[15]; // rv 0
  assign GTRSVD_in[1] = (GTRSVD[1] !== 1'bz) && GTRSVD_delay[1]; // rv 0
  assign GTRSVD_in[2] = (GTRSVD[2] !== 1'bz) && GTRSVD_delay[2]; // rv 0
  assign GTRSVD_in[3] = (GTRSVD[3] !== 1'bz) && GTRSVD_delay[3]; // rv 0
  assign GTRSVD_in[4] = (GTRSVD[4] !== 1'bz) && GTRSVD_delay[4]; // rv 0
  assign GTRSVD_in[5] = (GTRSVD[5] !== 1'bz) && GTRSVD_delay[5]; // rv 0
  assign GTRSVD_in[6] = (GTRSVD[6] !== 1'bz) && GTRSVD_delay[6]; // rv 0
  assign GTRSVD_in[7] = (GTRSVD[7] !== 1'bz) && GTRSVD_delay[7]; // rv 0
  assign GTRSVD_in[8] = (GTRSVD[8] !== 1'bz) && GTRSVD_delay[8]; // rv 0
  assign GTRSVD_in[9] = (GTRSVD[9] !== 1'bz) && GTRSVD_delay[9]; // rv 0
  assign GTRXRESET_in = (GTRXRESET !== 1'bz) && GTRXRESET_delay; // rv 0
  assign GTSOUTHREFCLK0_in = GTSOUTHREFCLK0_delay;
  assign GTSOUTHREFCLK1_in = GTSOUTHREFCLK1_delay;
  assign GTTXRESET_in = (GTTXRESET !== 1'bz) && GTTXRESET_delay; // rv 0
  assign GTYRXN_in = GTYRXN_delay;
  assign GTYRXP_in = GTYRXP_delay;
  assign LOOPBACK_in[0] = (LOOPBACK[0] !== 1'bz) && LOOPBACK_delay[0]; // rv 0
  assign LOOPBACK_in[1] = (LOOPBACK[1] !== 1'bz) && LOOPBACK_delay[1]; // rv 0
  assign LOOPBACK_in[2] = (LOOPBACK[2] !== 1'bz) && LOOPBACK_delay[2]; // rv 0
  assign LOOPRSVD_in[0] = (LOOPRSVD[0] !== 1'bz) && LOOPRSVD_delay[0]; // rv 0
  assign LOOPRSVD_in[10] = (LOOPRSVD[10] !== 1'bz) && LOOPRSVD_delay[10]; // rv 0
  assign LOOPRSVD_in[11] = (LOOPRSVD[11] !== 1'bz) && LOOPRSVD_delay[11]; // rv 0
  assign LOOPRSVD_in[12] = (LOOPRSVD[12] !== 1'bz) && LOOPRSVD_delay[12]; // rv 0
  assign LOOPRSVD_in[13] = (LOOPRSVD[13] !== 1'bz) && LOOPRSVD_delay[13]; // rv 0
  assign LOOPRSVD_in[14] = (LOOPRSVD[14] !== 1'bz) && LOOPRSVD_delay[14]; // rv 0
  assign LOOPRSVD_in[15] = (LOOPRSVD[15] !== 1'bz) && LOOPRSVD_delay[15]; // rv 0
  assign LOOPRSVD_in[1] = (LOOPRSVD[1] !== 1'bz) && LOOPRSVD_delay[1]; // rv 0
  assign LOOPRSVD_in[2] = (LOOPRSVD[2] !== 1'bz) && LOOPRSVD_delay[2]; // rv 0
  assign LOOPRSVD_in[3] = (LOOPRSVD[3] !== 1'bz) && LOOPRSVD_delay[3]; // rv 0
  assign LOOPRSVD_in[4] = (LOOPRSVD[4] !== 1'bz) && LOOPRSVD_delay[4]; // rv 0
  assign LOOPRSVD_in[5] = (LOOPRSVD[5] !== 1'bz) && LOOPRSVD_delay[5]; // rv 0
  assign LOOPRSVD_in[6] = (LOOPRSVD[6] !== 1'bz) && LOOPRSVD_delay[6]; // rv 0
  assign LOOPRSVD_in[7] = (LOOPRSVD[7] !== 1'bz) && LOOPRSVD_delay[7]; // rv 0
  assign LOOPRSVD_in[8] = (LOOPRSVD[8] !== 1'bz) && LOOPRSVD_delay[8]; // rv 0
  assign LOOPRSVD_in[9] = (LOOPRSVD[9] !== 1'bz) && LOOPRSVD_delay[9]; // rv 0
  assign LPBKRXTXSEREN_in = (LPBKRXTXSEREN !== 1'bz) && LPBKRXTXSEREN_delay; // rv 0
  assign LPBKTXRXSEREN_in = (LPBKTXRXSEREN !== 1'bz) && LPBKTXRXSEREN_delay; // rv 0
  assign PCIEEQRXEQADAPTDONE_in = (PCIEEQRXEQADAPTDONE !== 1'bz) && PCIEEQRXEQADAPTDONE_delay; // rv 0
  assign PCIERSTIDLE_in = (PCIERSTIDLE !== 1'bz) && PCIERSTIDLE_delay; // rv 0
  assign PCIERSTTXSYNCSTART_in = (PCIERSTTXSYNCSTART !== 1'bz) && PCIERSTTXSYNCSTART_delay; // rv 0
  assign PCIEUSERRATEDONE_in = (PCIEUSERRATEDONE !== 1'bz) && PCIEUSERRATEDONE_delay; // rv 0
  assign PCSRSVDIN2_in[0] = (PCSRSVDIN2[0] !== 1'bz) && PCSRSVDIN2_delay[0]; // rv 0
  assign PCSRSVDIN2_in[1] = (PCSRSVDIN2[1] !== 1'bz) && PCSRSVDIN2_delay[1]; // rv 0
  assign PCSRSVDIN2_in[2] = (PCSRSVDIN2[2] !== 1'bz) && PCSRSVDIN2_delay[2]; // rv 0
  assign PCSRSVDIN2_in[3] = (PCSRSVDIN2[3] !== 1'bz) && PCSRSVDIN2_delay[3]; // rv 0
  assign PCSRSVDIN2_in[4] = (PCSRSVDIN2[4] !== 1'bz) && PCSRSVDIN2_delay[4]; // rv 0
  assign PCSRSVDIN_in[0] = (PCSRSVDIN[0] !== 1'bz) && PCSRSVDIN_delay[0]; // rv 0
  assign PCSRSVDIN_in[10] = (PCSRSVDIN[10] !== 1'bz) && PCSRSVDIN_delay[10]; // rv 0
  assign PCSRSVDIN_in[11] = (PCSRSVDIN[11] !== 1'bz) && PCSRSVDIN_delay[11]; // rv 0
  assign PCSRSVDIN_in[12] = (PCSRSVDIN[12] !== 1'bz) && PCSRSVDIN_delay[12]; // rv 0
  assign PCSRSVDIN_in[13] = (PCSRSVDIN[13] !== 1'bz) && PCSRSVDIN_delay[13]; // rv 0
  assign PCSRSVDIN_in[14] = (PCSRSVDIN[14] !== 1'bz) && PCSRSVDIN_delay[14]; // rv 0
  assign PCSRSVDIN_in[15] = (PCSRSVDIN[15] !== 1'bz) && PCSRSVDIN_delay[15]; // rv 0
  assign PCSRSVDIN_in[1] = (PCSRSVDIN[1] !== 1'bz) && PCSRSVDIN_delay[1]; // rv 0
  assign PCSRSVDIN_in[2] = (PCSRSVDIN[2] !== 1'bz) && PCSRSVDIN_delay[2]; // rv 0
  assign PCSRSVDIN_in[3] = (PCSRSVDIN[3] !== 1'bz) && PCSRSVDIN_delay[3]; // rv 0
  assign PCSRSVDIN_in[4] = (PCSRSVDIN[4] !== 1'bz) && PCSRSVDIN_delay[4]; // rv 0
  assign PCSRSVDIN_in[5] = (PCSRSVDIN[5] !== 1'bz) && PCSRSVDIN_delay[5]; // rv 0
  assign PCSRSVDIN_in[6] = (PCSRSVDIN[6] !== 1'bz) && PCSRSVDIN_delay[6]; // rv 0
  assign PCSRSVDIN_in[7] = (PCSRSVDIN[7] !== 1'bz) && PCSRSVDIN_delay[7]; // rv 0
  assign PCSRSVDIN_in[8] = (PCSRSVDIN[8] !== 1'bz) && PCSRSVDIN_delay[8]; // rv 0
  assign PCSRSVDIN_in[9] = (PCSRSVDIN[9] !== 1'bz) && PCSRSVDIN_delay[9]; // rv 0
  assign PMARSVDIN_in[0] = (PMARSVDIN[0] !== 1'bz) && PMARSVDIN_delay[0]; // rv 0
  assign PMARSVDIN_in[1] = (PMARSVDIN[1] !== 1'bz) && PMARSVDIN_delay[1]; // rv 0
  assign PMARSVDIN_in[2] = (PMARSVDIN[2] !== 1'bz) && PMARSVDIN_delay[2]; // rv 0
  assign PMARSVDIN_in[3] = (PMARSVDIN[3] !== 1'bz) && PMARSVDIN_delay[3]; // rv 0
  assign PMARSVDIN_in[4] = (PMARSVDIN[4] !== 1'bz) && PMARSVDIN_delay[4]; // rv 0
  assign QPLL0CLK_in = QPLL0CLK_delay;
  assign QPLL0REFCLK_in = QPLL0REFCLK_delay;
  assign QPLL1CLK_in = QPLL1CLK_delay;
  assign QPLL1REFCLK_in = QPLL1REFCLK_delay;
  assign RESETOVRD_in = (RESETOVRD !== 1'bz) && RESETOVRD_delay; // rv 0
  assign RSTCLKENTX_in = (RSTCLKENTX !== 1'bz) && RSTCLKENTX_delay; // rv 0
  assign RX8B10BEN_in = (RX8B10BEN !== 1'bz) && RX8B10BEN_delay; // rv 0
  assign RXBUFRESET_in = (RXBUFRESET !== 1'bz) && RXBUFRESET_delay; // rv 0
  assign RXCDRFREQRESET_in = (RXCDRFREQRESET !== 1'bz) && RXCDRFREQRESET_delay; // rv 0
  assign RXCDRHOLD_in = (RXCDRHOLD !== 1'bz) && RXCDRHOLD_delay; // rv 0
  assign RXCDROVRDEN_in = (RXCDROVRDEN !== 1'bz) && RXCDROVRDEN_delay; // rv 0
  assign RXCDRRESETRSV_in = (RXCDRRESETRSV !== 1'bz) && RXCDRRESETRSV_delay; // rv 0
  assign RXCDRRESET_in = (RXCDRRESET !== 1'bz) && RXCDRRESET_delay; // rv 0
  assign RXCHBONDEN_in = (RXCHBONDEN !== 1'bz) && RXCHBONDEN_delay; // rv 0
  assign RXCHBONDI_in[0] = (RXCHBONDI[0] !== 1'bz) && RXCHBONDI_delay[0]; // rv 0
  assign RXCHBONDI_in[1] = (RXCHBONDI[1] !== 1'bz) && RXCHBONDI_delay[1]; // rv 0
  assign RXCHBONDI_in[2] = (RXCHBONDI[2] !== 1'bz) && RXCHBONDI_delay[2]; // rv 0
  assign RXCHBONDI_in[3] = (RXCHBONDI[3] !== 1'bz) && RXCHBONDI_delay[3]; // rv 0
  assign RXCHBONDI_in[4] = (RXCHBONDI[4] !== 1'bz) && RXCHBONDI_delay[4]; // rv 0
  assign RXCHBONDLEVEL_in[0] = (RXCHBONDLEVEL[0] !== 1'bz) && RXCHBONDLEVEL_delay[0]; // rv 0
  assign RXCHBONDLEVEL_in[1] = (RXCHBONDLEVEL[1] !== 1'bz) && RXCHBONDLEVEL_delay[1]; // rv 0
  assign RXCHBONDLEVEL_in[2] = (RXCHBONDLEVEL[2] !== 1'bz) && RXCHBONDLEVEL_delay[2]; // rv 0
  assign RXCHBONDMASTER_in = (RXCHBONDMASTER !== 1'bz) && RXCHBONDMASTER_delay; // rv 0
  assign RXCHBONDSLAVE_in = (RXCHBONDSLAVE !== 1'bz) && RXCHBONDSLAVE_delay; // rv 0
  assign RXCKCALRESET_in = (RXCKCALRESET !== 1'bz) && RXCKCALRESET_delay; // rv 0
  assign RXCOMMADETEN_in = (RXCOMMADETEN !== 1'bz) && RXCOMMADETEN_delay; // rv 0
  assign RXDCCFORCESTART_in = (RXDCCFORCESTART !== 1'bz) && RXDCCFORCESTART_delay; // rv 0
  assign RXDFEAGCHOLD_in = (RXDFEAGCHOLD !== 1'bz) && RXDFEAGCHOLD_delay; // rv 0
  assign RXDFEAGCOVRDEN_in = (RXDFEAGCOVRDEN !== 1'bz) && RXDFEAGCOVRDEN_delay; // rv 0
  assign RXDFELFHOLD_in = (RXDFELFHOLD !== 1'bz) && RXDFELFHOLD_delay; // rv 0
  assign RXDFELFOVRDEN_in = (RXDFELFOVRDEN !== 1'bz) && RXDFELFOVRDEN_delay; // rv 0
  assign RXDFELPMRESET_in = (RXDFELPMRESET !== 1'bz) && RXDFELPMRESET_delay; // rv 0
  assign RXDFETAP10HOLD_in = (RXDFETAP10HOLD !== 1'bz) && RXDFETAP10HOLD_delay; // rv 0
  assign RXDFETAP10OVRDEN_in = (RXDFETAP10OVRDEN !== 1'bz) && RXDFETAP10OVRDEN_delay; // rv 0
  assign RXDFETAP11HOLD_in = (RXDFETAP11HOLD !== 1'bz) && RXDFETAP11HOLD_delay; // rv 0
  assign RXDFETAP11OVRDEN_in = (RXDFETAP11OVRDEN !== 1'bz) && RXDFETAP11OVRDEN_delay; // rv 0
  assign RXDFETAP12HOLD_in = (RXDFETAP12HOLD !== 1'bz) && RXDFETAP12HOLD_delay; // rv 0
  assign RXDFETAP12OVRDEN_in = (RXDFETAP12OVRDEN !== 1'bz) && RXDFETAP12OVRDEN_delay; // rv 0
  assign RXDFETAP13HOLD_in = (RXDFETAP13HOLD !== 1'bz) && RXDFETAP13HOLD_delay; // rv 0
  assign RXDFETAP13OVRDEN_in = (RXDFETAP13OVRDEN !== 1'bz) && RXDFETAP13OVRDEN_delay; // rv 0
  assign RXDFETAP14HOLD_in = (RXDFETAP14HOLD !== 1'bz) && RXDFETAP14HOLD_delay; // rv 0
  assign RXDFETAP14OVRDEN_in = (RXDFETAP14OVRDEN !== 1'bz) && RXDFETAP14OVRDEN_delay; // rv 0
  assign RXDFETAP15HOLD_in = (RXDFETAP15HOLD !== 1'bz) && RXDFETAP15HOLD_delay; // rv 0
  assign RXDFETAP15OVRDEN_in = (RXDFETAP15OVRDEN !== 1'bz) && RXDFETAP15OVRDEN_delay; // rv 0
  assign RXDFETAP2HOLD_in = (RXDFETAP2HOLD !== 1'bz) && RXDFETAP2HOLD_delay; // rv 0
  assign RXDFETAP2OVRDEN_in = (RXDFETAP2OVRDEN !== 1'bz) && RXDFETAP2OVRDEN_delay; // rv 0
  assign RXDFETAP3HOLD_in = (RXDFETAP3HOLD !== 1'bz) && RXDFETAP3HOLD_delay; // rv 0
  assign RXDFETAP3OVRDEN_in = (RXDFETAP3OVRDEN !== 1'bz) && RXDFETAP3OVRDEN_delay; // rv 0
  assign RXDFETAP4HOLD_in = (RXDFETAP4HOLD !== 1'bz) && RXDFETAP4HOLD_delay; // rv 0
  assign RXDFETAP4OVRDEN_in = (RXDFETAP4OVRDEN !== 1'bz) && RXDFETAP4OVRDEN_delay; // rv 0
  assign RXDFETAP5HOLD_in = (RXDFETAP5HOLD !== 1'bz) && RXDFETAP5HOLD_delay; // rv 0
  assign RXDFETAP5OVRDEN_in = (RXDFETAP5OVRDEN !== 1'bz) && RXDFETAP5OVRDEN_delay; // rv 0
  assign RXDFETAP6HOLD_in = (RXDFETAP6HOLD !== 1'bz) && RXDFETAP6HOLD_delay; // rv 0
  assign RXDFETAP6OVRDEN_in = (RXDFETAP6OVRDEN !== 1'bz) && RXDFETAP6OVRDEN_delay; // rv 0
  assign RXDFETAP7HOLD_in = (RXDFETAP7HOLD !== 1'bz) && RXDFETAP7HOLD_delay; // rv 0
  assign RXDFETAP7OVRDEN_in = (RXDFETAP7OVRDEN !== 1'bz) && RXDFETAP7OVRDEN_delay; // rv 0
  assign RXDFETAP8HOLD_in = (RXDFETAP8HOLD !== 1'bz) && RXDFETAP8HOLD_delay; // rv 0
  assign RXDFETAP8OVRDEN_in = (RXDFETAP8OVRDEN !== 1'bz) && RXDFETAP8OVRDEN_delay; // rv 0
  assign RXDFETAP9HOLD_in = (RXDFETAP9HOLD !== 1'bz) && RXDFETAP9HOLD_delay; // rv 0
  assign RXDFETAP9OVRDEN_in = (RXDFETAP9OVRDEN !== 1'bz) && RXDFETAP9OVRDEN_delay; // rv 0
  assign RXDFEUTHOLD_in = (RXDFEUTHOLD !== 1'bz) && RXDFEUTHOLD_delay; // rv 0
  assign RXDFEUTOVRDEN_in = (RXDFEUTOVRDEN !== 1'bz) && RXDFEUTOVRDEN_delay; // rv 0
  assign RXDFEVPHOLD_in = (RXDFEVPHOLD !== 1'bz) && RXDFEVPHOLD_delay; // rv 0
  assign RXDFEVPOVRDEN_in = (RXDFEVPOVRDEN !== 1'bz) && RXDFEVPOVRDEN_delay; // rv 0
  assign RXDFEVSEN_in = (RXDFEVSEN !== 1'bz) && RXDFEVSEN_delay; // rv 0
  assign RXDFEXYDEN_in = (RXDFEXYDEN !== 1'bz) && RXDFEXYDEN_delay; // rv 0
  assign RXDLYBYPASS_in = (RXDLYBYPASS !== 1'bz) && RXDLYBYPASS_delay; // rv 0
  assign RXDLYEN_in = (RXDLYEN !== 1'bz) && RXDLYEN_delay; // rv 0
  assign RXDLYOVRDEN_in = (RXDLYOVRDEN !== 1'bz) && RXDLYOVRDEN_delay; // rv 0
  assign RXDLYSRESET_in = (RXDLYSRESET !== 1'bz) && RXDLYSRESET_delay; // rv 0
  assign RXELECIDLEMODE_in[0] = (RXELECIDLEMODE[0] !== 1'bz) && RXELECIDLEMODE_delay[0]; // rv 0
  assign RXELECIDLEMODE_in[1] = (RXELECIDLEMODE[1] !== 1'bz) && RXELECIDLEMODE_delay[1]; // rv 0
  assign RXGEARBOXSLIP_in = (RXGEARBOXSLIP !== 1'bz) && RXGEARBOXSLIP_delay; // rv 0
  assign RXLATCLK_in = (RXLATCLK !== 1'bz) && RXLATCLK_delay; // rv 0
  assign RXLPMEN_in = (RXLPMEN !== 1'bz) && RXLPMEN_delay; // rv 0
  assign RXLPMGCHOLD_in = (RXLPMGCHOLD !== 1'bz) && RXLPMGCHOLD_delay; // rv 0
  assign RXLPMGCOVRDEN_in = (RXLPMGCOVRDEN !== 1'bz) && RXLPMGCOVRDEN_delay; // rv 0
  assign RXLPMHFHOLD_in = (RXLPMHFHOLD !== 1'bz) && RXLPMHFHOLD_delay; // rv 0
  assign RXLPMHFOVRDEN_in = (RXLPMHFOVRDEN !== 1'bz) && RXLPMHFOVRDEN_delay; // rv 0
  assign RXLPMLFHOLD_in = (RXLPMLFHOLD !== 1'bz) && RXLPMLFHOLD_delay; // rv 0
  assign RXLPMLFKLOVRDEN_in = (RXLPMLFKLOVRDEN !== 1'bz) && RXLPMLFKLOVRDEN_delay; // rv 0
  assign RXLPMOSHOLD_in = (RXLPMOSHOLD !== 1'bz) && RXLPMOSHOLD_delay; // rv 0
  assign RXLPMOSOVRDEN_in = (RXLPMOSOVRDEN !== 1'bz) && RXLPMOSOVRDEN_delay; // rv 0
  assign RXMCOMMAALIGNEN_in = (RXMCOMMAALIGNEN !== 1'bz) && RXMCOMMAALIGNEN_delay; // rv 0
  assign RXMONITORSEL_in[0] = (RXMONITORSEL[0] !== 1'bz) && RXMONITORSEL_delay[0]; // rv 0
  assign RXMONITORSEL_in[1] = (RXMONITORSEL[1] !== 1'bz) && RXMONITORSEL_delay[1]; // rv 0
  assign RXOOBRESET_in = (RXOOBRESET !== 1'bz) && RXOOBRESET_delay; // rv 0
  assign RXOSCALRESET_in = (RXOSCALRESET !== 1'bz) && RXOSCALRESET_delay; // rv 0
  assign RXOSHOLD_in = (RXOSHOLD !== 1'bz) && RXOSHOLD_delay; // rv 0
  assign RXOSINTCFG_in[0] = (RXOSINTCFG[0] !== 1'bz) && RXOSINTCFG_delay[0]; // rv 0
  assign RXOSINTCFG_in[1] = (RXOSINTCFG[1] === 1'bz) || RXOSINTCFG_delay[1]; // rv 1
  assign RXOSINTCFG_in[2] = (RXOSINTCFG[2] === 1'bz) || RXOSINTCFG_delay[2]; // rv 1
  assign RXOSINTCFG_in[3] = (RXOSINTCFG[3] !== 1'bz) && RXOSINTCFG_delay[3]; // rv 0
  assign RXOSINTEN_in = (RXOSINTEN === 1'bz) || RXOSINTEN_delay; // rv 1
  assign RXOSINTHOLD_in = (RXOSINTHOLD !== 1'bz) && RXOSINTHOLD_delay; // rv 0
  assign RXOSINTOVRDEN_in = (RXOSINTOVRDEN !== 1'bz) && RXOSINTOVRDEN_delay; // rv 0
  assign RXOSINTSTROBE_in = (RXOSINTSTROBE !== 1'bz) && RXOSINTSTROBE_delay; // rv 0
  assign RXOSINTTESTOVRDEN_in = (RXOSINTTESTOVRDEN !== 1'bz) && RXOSINTTESTOVRDEN_delay; // rv 0
  assign RXOSOVRDEN_in = (RXOSOVRDEN !== 1'bz) && RXOSOVRDEN_delay; // rv 0
  assign RXOUTCLKSEL_in[0] = (RXOUTCLKSEL[0] !== 1'bz) && RXOUTCLKSEL_delay[0]; // rv 0
  assign RXOUTCLKSEL_in[1] = (RXOUTCLKSEL[1] !== 1'bz) && RXOUTCLKSEL_delay[1]; // rv 0
  assign RXOUTCLKSEL_in[2] = (RXOUTCLKSEL[2] !== 1'bz) && RXOUTCLKSEL_delay[2]; // rv 0
  assign RXPCOMMAALIGNEN_in = (RXPCOMMAALIGNEN !== 1'bz) && RXPCOMMAALIGNEN_delay; // rv 0
  assign RXPCSRESET_in = (RXPCSRESET !== 1'bz) && RXPCSRESET_delay; // rv 0
  assign RXPD_in[0] = (RXPD[0] !== 1'bz) && RXPD_delay[0]; // rv 0
  assign RXPD_in[1] = (RXPD[1] !== 1'bz) && RXPD_delay[1]; // rv 0
  assign RXPHALIGNEN_in = (RXPHALIGNEN !== 1'bz) && RXPHALIGNEN_delay; // rv 0
  assign RXPHALIGN_in = (RXPHALIGN !== 1'bz) && RXPHALIGN_delay; // rv 0
  assign RXPHDLYPD_in = (RXPHDLYPD !== 1'bz) && RXPHDLYPD_delay; // rv 0
  assign RXPHDLYRESET_in = (RXPHDLYRESET !== 1'bz) && RXPHDLYRESET_delay; // rv 0
  assign RXPHOVRDEN_in = (RXPHOVRDEN !== 1'bz) && RXPHOVRDEN_delay; // rv 0
  assign RXPLLCLKSEL_in[0] = (RXPLLCLKSEL[0] !== 1'bz) && RXPLLCLKSEL_delay[0]; // rv 0
  assign RXPLLCLKSEL_in[1] = (RXPLLCLKSEL[1] !== 1'bz) && RXPLLCLKSEL_delay[1]; // rv 0
  assign RXPMARESET_in = (RXPMARESET !== 1'bz) && RXPMARESET_delay; // rv 0
  assign RXPOLARITY_in = (RXPOLARITY !== 1'bz) && RXPOLARITY_delay; // rv 0
  assign RXPRBSCNTRESET_in = (RXPRBSCNTRESET !== 1'bz) && RXPRBSCNTRESET_delay; // rv 0
  assign RXPRBSSEL_in[0] = (RXPRBSSEL[0] !== 1'bz) && RXPRBSSEL_delay[0]; // rv 0
  assign RXPRBSSEL_in[1] = (RXPRBSSEL[1] !== 1'bz) && RXPRBSSEL_delay[1]; // rv 0
  assign RXPRBSSEL_in[2] = (RXPRBSSEL[2] !== 1'bz) && RXPRBSSEL_delay[2]; // rv 0
  assign RXPRBSSEL_in[3] = (RXPRBSSEL[3] !== 1'bz) && RXPRBSSEL_delay[3]; // rv 0
  assign RXPROGDIVRESET_in = (RXPROGDIVRESET !== 1'bz) && RXPROGDIVRESET_delay; // rv 0
  assign RXRATEMODE_in = (RXRATEMODE !== 1'bz) && RXRATEMODE_delay; // rv 0
  assign RXRATE_in[0] = (RXRATE[0] !== 1'bz) && RXRATE_delay[0]; // rv 0
  assign RXRATE_in[1] = (RXRATE[1] !== 1'bz) && RXRATE_delay[1]; // rv 0
  assign RXRATE_in[2] = (RXRATE[2] !== 1'bz) && RXRATE_delay[2]; // rv 0
  assign RXSLIDE_in = (RXSLIDE !== 1'bz) && RXSLIDE_delay; // rv 0
  assign RXSLIPOUTCLK_in = (RXSLIPOUTCLK !== 1'bz) && RXSLIPOUTCLK_delay; // rv 0
  assign RXSLIPPMA_in = (RXSLIPPMA !== 1'bz) && RXSLIPPMA_delay; // rv 0
  assign RXSYNCALLIN_in = (RXSYNCALLIN !== 1'bz) && RXSYNCALLIN_delay; // rv 0
  assign RXSYNCIN_in = (RXSYNCIN !== 1'bz) && RXSYNCIN_delay; // rv 0
  assign RXSYNCMODE_in = (RXSYNCMODE === 1'bz) || RXSYNCMODE_delay; // rv 1
  assign RXSYSCLKSEL_in[0] = (RXSYSCLKSEL[0] !== 1'bz) && RXSYSCLKSEL_delay[0]; // rv 0
  assign RXSYSCLKSEL_in[1] = (RXSYSCLKSEL[1] !== 1'bz) && RXSYSCLKSEL_delay[1]; // rv 0
  assign RXUSERRDY_in = (RXUSERRDY !== 1'bz) && RXUSERRDY_delay; // rv 0
  assign RXUSRCLK2_in = (RXUSRCLK2 !== 1'bz) && RXUSRCLK2_delay; // rv 0
  assign RXUSRCLK_in = (RXUSRCLK !== 1'bz) && RXUSRCLK_delay; // rv 0
  assign SIGVALIDCLK_in = (SIGVALIDCLK !== 1'bz) && SIGVALIDCLK_delay; // rv 0
  assign TSTIN_in[0] = (TSTIN[0] !== 1'bz) && TSTIN_delay[0]; // rv 0
  assign TSTIN_in[10] = (TSTIN[10] !== 1'bz) && TSTIN_delay[10]; // rv 0
  assign TSTIN_in[11] = (TSTIN[11] !== 1'bz) && TSTIN_delay[11]; // rv 0
  assign TSTIN_in[12] = (TSTIN[12] !== 1'bz) && TSTIN_delay[12]; // rv 0
  assign TSTIN_in[13] = (TSTIN[13] !== 1'bz) && TSTIN_delay[13]; // rv 0
  assign TSTIN_in[14] = (TSTIN[14] !== 1'bz) && TSTIN_delay[14]; // rv 0
  assign TSTIN_in[15] = (TSTIN[15] !== 1'bz) && TSTIN_delay[15]; // rv 0
  assign TSTIN_in[16] = (TSTIN[16] !== 1'bz) && TSTIN_delay[16]; // rv 0
  assign TSTIN_in[17] = (TSTIN[17] !== 1'bz) && TSTIN_delay[17]; // rv 0
  assign TSTIN_in[18] = (TSTIN[18] !== 1'bz) && TSTIN_delay[18]; // rv 0
  assign TSTIN_in[19] = (TSTIN[19] !== 1'bz) && TSTIN_delay[19]; // rv 0
  assign TSTIN_in[1] = (TSTIN[1] !== 1'bz) && TSTIN_delay[1]; // rv 0
  assign TSTIN_in[2] = (TSTIN[2] !== 1'bz) && TSTIN_delay[2]; // rv 0
  assign TSTIN_in[3] = (TSTIN[3] !== 1'bz) && TSTIN_delay[3]; // rv 0
  assign TSTIN_in[4] = (TSTIN[4] !== 1'bz) && TSTIN_delay[4]; // rv 0
  assign TSTIN_in[5] = (TSTIN[5] !== 1'bz) && TSTIN_delay[5]; // rv 0
  assign TSTIN_in[6] = (TSTIN[6] !== 1'bz) && TSTIN_delay[6]; // rv 0
  assign TSTIN_in[7] = (TSTIN[7] !== 1'bz) && TSTIN_delay[7]; // rv 0
  assign TSTIN_in[8] = (TSTIN[8] !== 1'bz) && TSTIN_delay[8]; // rv 0
  assign TSTIN_in[9] = (TSTIN[9] !== 1'bz) && TSTIN_delay[9]; // rv 0
  assign TX8B10BBYPASS_in[0] = (TX8B10BBYPASS[0] !== 1'bz) && TX8B10BBYPASS_delay[0]; // rv 0
  assign TX8B10BBYPASS_in[1] = (TX8B10BBYPASS[1] !== 1'bz) && TX8B10BBYPASS_delay[1]; // rv 0
  assign TX8B10BBYPASS_in[2] = (TX8B10BBYPASS[2] !== 1'bz) && TX8B10BBYPASS_delay[2]; // rv 0
  assign TX8B10BBYPASS_in[3] = (TX8B10BBYPASS[3] !== 1'bz) && TX8B10BBYPASS_delay[3]; // rv 0
  assign TX8B10BBYPASS_in[4] = (TX8B10BBYPASS[4] !== 1'bz) && TX8B10BBYPASS_delay[4]; // rv 0
  assign TX8B10BBYPASS_in[5] = (TX8B10BBYPASS[5] !== 1'bz) && TX8B10BBYPASS_delay[5]; // rv 0
  assign TX8B10BBYPASS_in[6] = (TX8B10BBYPASS[6] !== 1'bz) && TX8B10BBYPASS_delay[6]; // rv 0
  assign TX8B10BBYPASS_in[7] = (TX8B10BBYPASS[7] !== 1'bz) && TX8B10BBYPASS_delay[7]; // rv 0
  assign TX8B10BEN_in = (TX8B10BEN !== 1'bz) && TX8B10BEN_delay; // rv 0
  assign TXBUFDIFFCTRL_in[0] = (TXBUFDIFFCTRL[0] !== 1'bz) && TXBUFDIFFCTRL_delay[0]; // rv 0
  assign TXBUFDIFFCTRL_in[1] = (TXBUFDIFFCTRL[1] !== 1'bz) && TXBUFDIFFCTRL_delay[1]; // rv 0
  assign TXBUFDIFFCTRL_in[2] = (TXBUFDIFFCTRL[2] !== 1'bz) && TXBUFDIFFCTRL_delay[2]; // rv 0
  assign TXCOMINIT_in = (TXCOMINIT !== 1'bz) && TXCOMINIT_delay; // rv 0
  assign TXCOMSAS_in = (TXCOMSAS !== 1'bz) && TXCOMSAS_delay; // rv 0
  assign TXCOMWAKE_in = (TXCOMWAKE !== 1'bz) && TXCOMWAKE_delay; // rv 0
  assign TXCTRL0_in[0] = (TXCTRL0[0] !== 1'bz) && TXCTRL0_delay[0]; // rv 0
  assign TXCTRL0_in[10] = (TXCTRL0[10] !== 1'bz) && TXCTRL0_delay[10]; // rv 0
  assign TXCTRL0_in[11] = (TXCTRL0[11] !== 1'bz) && TXCTRL0_delay[11]; // rv 0
  assign TXCTRL0_in[12] = (TXCTRL0[12] !== 1'bz) && TXCTRL0_delay[12]; // rv 0
  assign TXCTRL0_in[13] = (TXCTRL0[13] !== 1'bz) && TXCTRL0_delay[13]; // rv 0
  assign TXCTRL0_in[14] = (TXCTRL0[14] !== 1'bz) && TXCTRL0_delay[14]; // rv 0
  assign TXCTRL0_in[15] = (TXCTRL0[15] !== 1'bz) && TXCTRL0_delay[15]; // rv 0
  assign TXCTRL0_in[1] = (TXCTRL0[1] !== 1'bz) && TXCTRL0_delay[1]; // rv 0
  assign TXCTRL0_in[2] = (TXCTRL0[2] !== 1'bz) && TXCTRL0_delay[2]; // rv 0
  assign TXCTRL0_in[3] = (TXCTRL0[3] !== 1'bz) && TXCTRL0_delay[3]; // rv 0
  assign TXCTRL0_in[4] = (TXCTRL0[4] !== 1'bz) && TXCTRL0_delay[4]; // rv 0
  assign TXCTRL0_in[5] = (TXCTRL0[5] !== 1'bz) && TXCTRL0_delay[5]; // rv 0
  assign TXCTRL0_in[6] = (TXCTRL0[6] !== 1'bz) && TXCTRL0_delay[6]; // rv 0
  assign TXCTRL0_in[7] = (TXCTRL0[7] !== 1'bz) && TXCTRL0_delay[7]; // rv 0
  assign TXCTRL0_in[8] = (TXCTRL0[8] !== 1'bz) && TXCTRL0_delay[8]; // rv 0
  assign TXCTRL0_in[9] = (TXCTRL0[9] !== 1'bz) && TXCTRL0_delay[9]; // rv 0
  assign TXCTRL1_in[0] = (TXCTRL1[0] !== 1'bz) && TXCTRL1_delay[0]; // rv 0
  assign TXCTRL1_in[10] = (TXCTRL1[10] !== 1'bz) && TXCTRL1_delay[10]; // rv 0
  assign TXCTRL1_in[11] = (TXCTRL1[11] !== 1'bz) && TXCTRL1_delay[11]; // rv 0
  assign TXCTRL1_in[12] = (TXCTRL1[12] !== 1'bz) && TXCTRL1_delay[12]; // rv 0
  assign TXCTRL1_in[13] = (TXCTRL1[13] !== 1'bz) && TXCTRL1_delay[13]; // rv 0
  assign TXCTRL1_in[14] = (TXCTRL1[14] !== 1'bz) && TXCTRL1_delay[14]; // rv 0
  assign TXCTRL1_in[15] = (TXCTRL1[15] !== 1'bz) && TXCTRL1_delay[15]; // rv 0
  assign TXCTRL1_in[1] = (TXCTRL1[1] !== 1'bz) && TXCTRL1_delay[1]; // rv 0
  assign TXCTRL1_in[2] = (TXCTRL1[2] !== 1'bz) && TXCTRL1_delay[2]; // rv 0
  assign TXCTRL1_in[3] = (TXCTRL1[3] !== 1'bz) && TXCTRL1_delay[3]; // rv 0
  assign TXCTRL1_in[4] = (TXCTRL1[4] !== 1'bz) && TXCTRL1_delay[4]; // rv 0
  assign TXCTRL1_in[5] = (TXCTRL1[5] !== 1'bz) && TXCTRL1_delay[5]; // rv 0
  assign TXCTRL1_in[6] = (TXCTRL1[6] !== 1'bz) && TXCTRL1_delay[6]; // rv 0
  assign TXCTRL1_in[7] = (TXCTRL1[7] !== 1'bz) && TXCTRL1_delay[7]; // rv 0
  assign TXCTRL1_in[8] = (TXCTRL1[8] !== 1'bz) && TXCTRL1_delay[8]; // rv 0
  assign TXCTRL1_in[9] = (TXCTRL1[9] !== 1'bz) && TXCTRL1_delay[9]; // rv 0
  assign TXCTRL2_in[0] = (TXCTRL2[0] !== 1'bz) && TXCTRL2_delay[0]; // rv 0
  assign TXCTRL2_in[1] = (TXCTRL2[1] !== 1'bz) && TXCTRL2_delay[1]; // rv 0
  assign TXCTRL2_in[2] = (TXCTRL2[2] !== 1'bz) && TXCTRL2_delay[2]; // rv 0
  assign TXCTRL2_in[3] = (TXCTRL2[3] !== 1'bz) && TXCTRL2_delay[3]; // rv 0
  assign TXCTRL2_in[4] = (TXCTRL2[4] !== 1'bz) && TXCTRL2_delay[4]; // rv 0
  assign TXCTRL2_in[5] = (TXCTRL2[5] !== 1'bz) && TXCTRL2_delay[5]; // rv 0
  assign TXCTRL2_in[6] = (TXCTRL2[6] !== 1'bz) && TXCTRL2_delay[6]; // rv 0
  assign TXCTRL2_in[7] = (TXCTRL2[7] !== 1'bz) && TXCTRL2_delay[7]; // rv 0
  assign TXDATAEXTENDRSVD_in[0] = (TXDATAEXTENDRSVD[0] !== 1'bz) && TXDATAEXTENDRSVD_delay[0]; // rv 0
  assign TXDATAEXTENDRSVD_in[1] = (TXDATAEXTENDRSVD[1] !== 1'bz) && TXDATAEXTENDRSVD_delay[1]; // rv 0
  assign TXDATAEXTENDRSVD_in[2] = (TXDATAEXTENDRSVD[2] !== 1'bz) && TXDATAEXTENDRSVD_delay[2]; // rv 0
  assign TXDATAEXTENDRSVD_in[3] = (TXDATAEXTENDRSVD[3] !== 1'bz) && TXDATAEXTENDRSVD_delay[3]; // rv 0
  assign TXDATAEXTENDRSVD_in[4] = (TXDATAEXTENDRSVD[4] !== 1'bz) && TXDATAEXTENDRSVD_delay[4]; // rv 0
  assign TXDATAEXTENDRSVD_in[5] = (TXDATAEXTENDRSVD[5] !== 1'bz) && TXDATAEXTENDRSVD_delay[5]; // rv 0
  assign TXDATAEXTENDRSVD_in[6] = (TXDATAEXTENDRSVD[6] !== 1'bz) && TXDATAEXTENDRSVD_delay[6]; // rv 0
  assign TXDATAEXTENDRSVD_in[7] = (TXDATAEXTENDRSVD[7] !== 1'bz) && TXDATAEXTENDRSVD_delay[7]; // rv 0
  assign TXDATA_in[0] = (TXDATA[0] !== 1'bz) && TXDATA_delay[0]; // rv 0
  assign TXDATA_in[100] = (TXDATA[100] !== 1'bz) && TXDATA_delay[100]; // rv 0
  assign TXDATA_in[101] = (TXDATA[101] !== 1'bz) && TXDATA_delay[101]; // rv 0
  assign TXDATA_in[102] = (TXDATA[102] !== 1'bz) && TXDATA_delay[102]; // rv 0
  assign TXDATA_in[103] = (TXDATA[103] !== 1'bz) && TXDATA_delay[103]; // rv 0
  assign TXDATA_in[104] = (TXDATA[104] !== 1'bz) && TXDATA_delay[104]; // rv 0
  assign TXDATA_in[105] = (TXDATA[105] !== 1'bz) && TXDATA_delay[105]; // rv 0
  assign TXDATA_in[106] = (TXDATA[106] !== 1'bz) && TXDATA_delay[106]; // rv 0
  assign TXDATA_in[107] = (TXDATA[107] !== 1'bz) && TXDATA_delay[107]; // rv 0
  assign TXDATA_in[108] = (TXDATA[108] !== 1'bz) && TXDATA_delay[108]; // rv 0
  assign TXDATA_in[109] = (TXDATA[109] !== 1'bz) && TXDATA_delay[109]; // rv 0
  assign TXDATA_in[10] = (TXDATA[10] !== 1'bz) && TXDATA_delay[10]; // rv 0
  assign TXDATA_in[110] = (TXDATA[110] !== 1'bz) && TXDATA_delay[110]; // rv 0
  assign TXDATA_in[111] = (TXDATA[111] !== 1'bz) && TXDATA_delay[111]; // rv 0
  assign TXDATA_in[112] = (TXDATA[112] !== 1'bz) && TXDATA_delay[112]; // rv 0
  assign TXDATA_in[113] = (TXDATA[113] !== 1'bz) && TXDATA_delay[113]; // rv 0
  assign TXDATA_in[114] = (TXDATA[114] !== 1'bz) && TXDATA_delay[114]; // rv 0
  assign TXDATA_in[115] = (TXDATA[115] !== 1'bz) && TXDATA_delay[115]; // rv 0
  assign TXDATA_in[116] = (TXDATA[116] !== 1'bz) && TXDATA_delay[116]; // rv 0
  assign TXDATA_in[117] = (TXDATA[117] !== 1'bz) && TXDATA_delay[117]; // rv 0
  assign TXDATA_in[118] = (TXDATA[118] !== 1'bz) && TXDATA_delay[118]; // rv 0
  assign TXDATA_in[119] = (TXDATA[119] !== 1'bz) && TXDATA_delay[119]; // rv 0
  assign TXDATA_in[11] = (TXDATA[11] !== 1'bz) && TXDATA_delay[11]; // rv 0
  assign TXDATA_in[120] = (TXDATA[120] !== 1'bz) && TXDATA_delay[120]; // rv 0
  assign TXDATA_in[121] = (TXDATA[121] !== 1'bz) && TXDATA_delay[121]; // rv 0
  assign TXDATA_in[122] = (TXDATA[122] !== 1'bz) && TXDATA_delay[122]; // rv 0
  assign TXDATA_in[123] = (TXDATA[123] !== 1'bz) && TXDATA_delay[123]; // rv 0
  assign TXDATA_in[124] = (TXDATA[124] !== 1'bz) && TXDATA_delay[124]; // rv 0
  assign TXDATA_in[125] = (TXDATA[125] !== 1'bz) && TXDATA_delay[125]; // rv 0
  assign TXDATA_in[126] = (TXDATA[126] !== 1'bz) && TXDATA_delay[126]; // rv 0
  assign TXDATA_in[127] = (TXDATA[127] !== 1'bz) && TXDATA_delay[127]; // rv 0
  assign TXDATA_in[12] = (TXDATA[12] !== 1'bz) && TXDATA_delay[12]; // rv 0
  assign TXDATA_in[13] = (TXDATA[13] !== 1'bz) && TXDATA_delay[13]; // rv 0
  assign TXDATA_in[14] = (TXDATA[14] !== 1'bz) && TXDATA_delay[14]; // rv 0
  assign TXDATA_in[15] = (TXDATA[15] !== 1'bz) && TXDATA_delay[15]; // rv 0
  assign TXDATA_in[16] = (TXDATA[16] !== 1'bz) && TXDATA_delay[16]; // rv 0
  assign TXDATA_in[17] = (TXDATA[17] !== 1'bz) && TXDATA_delay[17]; // rv 0
  assign TXDATA_in[18] = (TXDATA[18] !== 1'bz) && TXDATA_delay[18]; // rv 0
  assign TXDATA_in[19] = (TXDATA[19] !== 1'bz) && TXDATA_delay[19]; // rv 0
  assign TXDATA_in[1] = (TXDATA[1] !== 1'bz) && TXDATA_delay[1]; // rv 0
  assign TXDATA_in[20] = (TXDATA[20] !== 1'bz) && TXDATA_delay[20]; // rv 0
  assign TXDATA_in[21] = (TXDATA[21] !== 1'bz) && TXDATA_delay[21]; // rv 0
  assign TXDATA_in[22] = (TXDATA[22] !== 1'bz) && TXDATA_delay[22]; // rv 0
  assign TXDATA_in[23] = (TXDATA[23] !== 1'bz) && TXDATA_delay[23]; // rv 0
  assign TXDATA_in[24] = (TXDATA[24] !== 1'bz) && TXDATA_delay[24]; // rv 0
  assign TXDATA_in[25] = (TXDATA[25] !== 1'bz) && TXDATA_delay[25]; // rv 0
  assign TXDATA_in[26] = (TXDATA[26] !== 1'bz) && TXDATA_delay[26]; // rv 0
  assign TXDATA_in[27] = (TXDATA[27] !== 1'bz) && TXDATA_delay[27]; // rv 0
  assign TXDATA_in[28] = (TXDATA[28] !== 1'bz) && TXDATA_delay[28]; // rv 0
  assign TXDATA_in[29] = (TXDATA[29] !== 1'bz) && TXDATA_delay[29]; // rv 0
  assign TXDATA_in[2] = (TXDATA[2] !== 1'bz) && TXDATA_delay[2]; // rv 0
  assign TXDATA_in[30] = (TXDATA[30] !== 1'bz) && TXDATA_delay[30]; // rv 0
  assign TXDATA_in[31] = (TXDATA[31] !== 1'bz) && TXDATA_delay[31]; // rv 0
  assign TXDATA_in[32] = (TXDATA[32] !== 1'bz) && TXDATA_delay[32]; // rv 0
  assign TXDATA_in[33] = (TXDATA[33] !== 1'bz) && TXDATA_delay[33]; // rv 0
  assign TXDATA_in[34] = (TXDATA[34] !== 1'bz) && TXDATA_delay[34]; // rv 0
  assign TXDATA_in[35] = (TXDATA[35] !== 1'bz) && TXDATA_delay[35]; // rv 0
  assign TXDATA_in[36] = (TXDATA[36] !== 1'bz) && TXDATA_delay[36]; // rv 0
  assign TXDATA_in[37] = (TXDATA[37] !== 1'bz) && TXDATA_delay[37]; // rv 0
  assign TXDATA_in[38] = (TXDATA[38] !== 1'bz) && TXDATA_delay[38]; // rv 0
  assign TXDATA_in[39] = (TXDATA[39] !== 1'bz) && TXDATA_delay[39]; // rv 0
  assign TXDATA_in[3] = (TXDATA[3] !== 1'bz) && TXDATA_delay[3]; // rv 0
  assign TXDATA_in[40] = (TXDATA[40] !== 1'bz) && TXDATA_delay[40]; // rv 0
  assign TXDATA_in[41] = (TXDATA[41] !== 1'bz) && TXDATA_delay[41]; // rv 0
  assign TXDATA_in[42] = (TXDATA[42] !== 1'bz) && TXDATA_delay[42]; // rv 0
  assign TXDATA_in[43] = (TXDATA[43] !== 1'bz) && TXDATA_delay[43]; // rv 0
  assign TXDATA_in[44] = (TXDATA[44] !== 1'bz) && TXDATA_delay[44]; // rv 0
  assign TXDATA_in[45] = (TXDATA[45] !== 1'bz) && TXDATA_delay[45]; // rv 0
  assign TXDATA_in[46] = (TXDATA[46] !== 1'bz) && TXDATA_delay[46]; // rv 0
  assign TXDATA_in[47] = (TXDATA[47] !== 1'bz) && TXDATA_delay[47]; // rv 0
  assign TXDATA_in[48] = (TXDATA[48] !== 1'bz) && TXDATA_delay[48]; // rv 0
  assign TXDATA_in[49] = (TXDATA[49] !== 1'bz) && TXDATA_delay[49]; // rv 0
  assign TXDATA_in[4] = (TXDATA[4] !== 1'bz) && TXDATA_delay[4]; // rv 0
  assign TXDATA_in[50] = (TXDATA[50] !== 1'bz) && TXDATA_delay[50]; // rv 0
  assign TXDATA_in[51] = (TXDATA[51] !== 1'bz) && TXDATA_delay[51]; // rv 0
  assign TXDATA_in[52] = (TXDATA[52] !== 1'bz) && TXDATA_delay[52]; // rv 0
  assign TXDATA_in[53] = (TXDATA[53] !== 1'bz) && TXDATA_delay[53]; // rv 0
  assign TXDATA_in[54] = (TXDATA[54] !== 1'bz) && TXDATA_delay[54]; // rv 0
  assign TXDATA_in[55] = (TXDATA[55] !== 1'bz) && TXDATA_delay[55]; // rv 0
  assign TXDATA_in[56] = (TXDATA[56] !== 1'bz) && TXDATA_delay[56]; // rv 0
  assign TXDATA_in[57] = (TXDATA[57] !== 1'bz) && TXDATA_delay[57]; // rv 0
  assign TXDATA_in[58] = (TXDATA[58] !== 1'bz) && TXDATA_delay[58]; // rv 0
  assign TXDATA_in[59] = (TXDATA[59] !== 1'bz) && TXDATA_delay[59]; // rv 0
  assign TXDATA_in[5] = (TXDATA[5] !== 1'bz) && TXDATA_delay[5]; // rv 0
  assign TXDATA_in[60] = (TXDATA[60] !== 1'bz) && TXDATA_delay[60]; // rv 0
  assign TXDATA_in[61] = (TXDATA[61] !== 1'bz) && TXDATA_delay[61]; // rv 0
  assign TXDATA_in[62] = (TXDATA[62] !== 1'bz) && TXDATA_delay[62]; // rv 0
  assign TXDATA_in[63] = (TXDATA[63] !== 1'bz) && TXDATA_delay[63]; // rv 0
  assign TXDATA_in[64] = (TXDATA[64] !== 1'bz) && TXDATA_delay[64]; // rv 0
  assign TXDATA_in[65] = (TXDATA[65] !== 1'bz) && TXDATA_delay[65]; // rv 0
  assign TXDATA_in[66] = (TXDATA[66] !== 1'bz) && TXDATA_delay[66]; // rv 0
  assign TXDATA_in[67] = (TXDATA[67] !== 1'bz) && TXDATA_delay[67]; // rv 0
  assign TXDATA_in[68] = (TXDATA[68] !== 1'bz) && TXDATA_delay[68]; // rv 0
  assign TXDATA_in[69] = (TXDATA[69] !== 1'bz) && TXDATA_delay[69]; // rv 0
  assign TXDATA_in[6] = (TXDATA[6] !== 1'bz) && TXDATA_delay[6]; // rv 0
  assign TXDATA_in[70] = (TXDATA[70] !== 1'bz) && TXDATA_delay[70]; // rv 0
  assign TXDATA_in[71] = (TXDATA[71] !== 1'bz) && TXDATA_delay[71]; // rv 0
  assign TXDATA_in[72] = (TXDATA[72] !== 1'bz) && TXDATA_delay[72]; // rv 0
  assign TXDATA_in[73] = (TXDATA[73] !== 1'bz) && TXDATA_delay[73]; // rv 0
  assign TXDATA_in[74] = (TXDATA[74] !== 1'bz) && TXDATA_delay[74]; // rv 0
  assign TXDATA_in[75] = (TXDATA[75] !== 1'bz) && TXDATA_delay[75]; // rv 0
  assign TXDATA_in[76] = (TXDATA[76] !== 1'bz) && TXDATA_delay[76]; // rv 0
  assign TXDATA_in[77] = (TXDATA[77] !== 1'bz) && TXDATA_delay[77]; // rv 0
  assign TXDATA_in[78] = (TXDATA[78] !== 1'bz) && TXDATA_delay[78]; // rv 0
  assign TXDATA_in[79] = (TXDATA[79] !== 1'bz) && TXDATA_delay[79]; // rv 0
  assign TXDATA_in[7] = (TXDATA[7] !== 1'bz) && TXDATA_delay[7]; // rv 0
  assign TXDATA_in[80] = (TXDATA[80] !== 1'bz) && TXDATA_delay[80]; // rv 0
  assign TXDATA_in[81] = (TXDATA[81] !== 1'bz) && TXDATA_delay[81]; // rv 0
  assign TXDATA_in[82] = (TXDATA[82] !== 1'bz) && TXDATA_delay[82]; // rv 0
  assign TXDATA_in[83] = (TXDATA[83] !== 1'bz) && TXDATA_delay[83]; // rv 0
  assign TXDATA_in[84] = (TXDATA[84] !== 1'bz) && TXDATA_delay[84]; // rv 0
  assign TXDATA_in[85] = (TXDATA[85] !== 1'bz) && TXDATA_delay[85]; // rv 0
  assign TXDATA_in[86] = (TXDATA[86] !== 1'bz) && TXDATA_delay[86]; // rv 0
  assign TXDATA_in[87] = (TXDATA[87] !== 1'bz) && TXDATA_delay[87]; // rv 0
  assign TXDATA_in[88] = (TXDATA[88] !== 1'bz) && TXDATA_delay[88]; // rv 0
  assign TXDATA_in[89] = (TXDATA[89] !== 1'bz) && TXDATA_delay[89]; // rv 0
  assign TXDATA_in[8] = (TXDATA[8] !== 1'bz) && TXDATA_delay[8]; // rv 0
  assign TXDATA_in[90] = (TXDATA[90] !== 1'bz) && TXDATA_delay[90]; // rv 0
  assign TXDATA_in[91] = (TXDATA[91] !== 1'bz) && TXDATA_delay[91]; // rv 0
  assign TXDATA_in[92] = (TXDATA[92] !== 1'bz) && TXDATA_delay[92]; // rv 0
  assign TXDATA_in[93] = (TXDATA[93] !== 1'bz) && TXDATA_delay[93]; // rv 0
  assign TXDATA_in[94] = (TXDATA[94] !== 1'bz) && TXDATA_delay[94]; // rv 0
  assign TXDATA_in[95] = (TXDATA[95] !== 1'bz) && TXDATA_delay[95]; // rv 0
  assign TXDATA_in[96] = (TXDATA[96] !== 1'bz) && TXDATA_delay[96]; // rv 0
  assign TXDATA_in[97] = (TXDATA[97] !== 1'bz) && TXDATA_delay[97]; // rv 0
  assign TXDATA_in[98] = (TXDATA[98] !== 1'bz) && TXDATA_delay[98]; // rv 0
  assign TXDATA_in[99] = (TXDATA[99] !== 1'bz) && TXDATA_delay[99]; // rv 0
  assign TXDATA_in[9] = (TXDATA[9] !== 1'bz) && TXDATA_delay[9]; // rv 0
  assign TXDCCFORCESTART_in = (TXDCCFORCESTART !== 1'bz) && TXDCCFORCESTART_delay; // rv 0
  assign TXDCCRESET_in = (TXDCCRESET !== 1'bz) && TXDCCRESET_delay; // rv 0
  assign TXDEEMPH_in = (TXDEEMPH !== 1'bz) && TXDEEMPH_delay; // rv 0
  assign TXDETECTRX_in = (TXDETECTRX !== 1'bz) && TXDETECTRX_delay; // rv 0
  assign TXDIFFCTRL_in[0] = (TXDIFFCTRL[0] !== 1'bz) && TXDIFFCTRL_delay[0]; // rv 0
  assign TXDIFFCTRL_in[1] = (TXDIFFCTRL[1] !== 1'bz) && TXDIFFCTRL_delay[1]; // rv 0
  assign TXDIFFCTRL_in[2] = (TXDIFFCTRL[2] !== 1'bz) && TXDIFFCTRL_delay[2]; // rv 0
  assign TXDIFFCTRL_in[3] = (TXDIFFCTRL[3] !== 1'bz) && TXDIFFCTRL_delay[3]; // rv 0
  assign TXDIFFCTRL_in[4] = (TXDIFFCTRL[4] !== 1'bz) && TXDIFFCTRL_delay[4]; // rv 0
  assign TXDIFFPD_in = (TXDIFFPD !== 1'bz) && TXDIFFPD_delay; // rv 0
  assign TXDLYBYPASS_in = (TXDLYBYPASS !== 1'bz) && TXDLYBYPASS_delay; // rv 0
  assign TXDLYEN_in = (TXDLYEN !== 1'bz) && TXDLYEN_delay; // rv 0
  assign TXDLYHOLD_in = (TXDLYHOLD !== 1'bz) && TXDLYHOLD_delay; // rv 0
  assign TXDLYOVRDEN_in = (TXDLYOVRDEN !== 1'bz) && TXDLYOVRDEN_delay; // rv 0
  assign TXDLYSRESET_in = (TXDLYSRESET !== 1'bz) && TXDLYSRESET_delay; // rv 0
  assign TXDLYUPDOWN_in = (TXDLYUPDOWN !== 1'bz) && TXDLYUPDOWN_delay; // rv 0
  assign TXELECIDLE_in = (TXELECIDLE !== 1'bz) && TXELECIDLE_delay; // rv 0
  assign TXELFORCESTART_in = (TXELFORCESTART !== 1'bz) && TXELFORCESTART_delay; // rv 0
  assign TXHEADER_in[0] = (TXHEADER[0] !== 1'bz) && TXHEADER_delay[0]; // rv 0
  assign TXHEADER_in[1] = (TXHEADER[1] !== 1'bz) && TXHEADER_delay[1]; // rv 0
  assign TXHEADER_in[2] = (TXHEADER[2] !== 1'bz) && TXHEADER_delay[2]; // rv 0
  assign TXHEADER_in[3] = (TXHEADER[3] !== 1'bz) && TXHEADER_delay[3]; // rv 0
  assign TXHEADER_in[4] = (TXHEADER[4] !== 1'bz) && TXHEADER_delay[4]; // rv 0
  assign TXHEADER_in[5] = (TXHEADER[5] !== 1'bz) && TXHEADER_delay[5]; // rv 0
  assign TXINHIBIT_in = (TXINHIBIT !== 1'bz) && TXINHIBIT_delay; // rv 0
  assign TXLATCLK_in = (TXLATCLK !== 1'bz) && TXLATCLK_delay; // rv 0
  assign TXMAINCURSOR_in[0] = (TXMAINCURSOR[0] !== 1'bz) && TXMAINCURSOR_delay[0]; // rv 0
  assign TXMAINCURSOR_in[1] = (TXMAINCURSOR[1] !== 1'bz) && TXMAINCURSOR_delay[1]; // rv 0
  assign TXMAINCURSOR_in[2] = (TXMAINCURSOR[2] !== 1'bz) && TXMAINCURSOR_delay[2]; // rv 0
  assign TXMAINCURSOR_in[3] = (TXMAINCURSOR[3] !== 1'bz) && TXMAINCURSOR_delay[3]; // rv 0
  assign TXMAINCURSOR_in[4] = (TXMAINCURSOR[4] !== 1'bz) && TXMAINCURSOR_delay[4]; // rv 0
  assign TXMAINCURSOR_in[5] = (TXMAINCURSOR[5] !== 1'bz) && TXMAINCURSOR_delay[5]; // rv 0
  assign TXMAINCURSOR_in[6] = (TXMAINCURSOR[6] !== 1'bz) && TXMAINCURSOR_delay[6]; // rv 0
  assign TXMARGIN_in[0] = (TXMARGIN[0] !== 1'bz) && TXMARGIN_delay[0]; // rv 0
  assign TXMARGIN_in[1] = (TXMARGIN[1] !== 1'bz) && TXMARGIN_delay[1]; // rv 0
  assign TXMARGIN_in[2] = (TXMARGIN[2] !== 1'bz) && TXMARGIN_delay[2]; // rv 0
  assign TXOUTCLKSEL_in[0] = (TXOUTCLKSEL[0] !== 1'bz) && TXOUTCLKSEL_delay[0]; // rv 0
  assign TXOUTCLKSEL_in[1] = (TXOUTCLKSEL[1] !== 1'bz) && TXOUTCLKSEL_delay[1]; // rv 0
  assign TXOUTCLKSEL_in[2] = (TXOUTCLKSEL[2] !== 1'bz) && TXOUTCLKSEL_delay[2]; // rv 0
  assign TXPCSRESET_in = (TXPCSRESET !== 1'bz) && TXPCSRESET_delay; // rv 0
  assign TXPDELECIDLEMODE_in = (TXPDELECIDLEMODE !== 1'bz) && TXPDELECIDLEMODE_delay; // rv 0
  assign TXPD_in[0] = (TXPD[0] !== 1'bz) && TXPD_delay[0]; // rv 0
  assign TXPD_in[1] = (TXPD[1] !== 1'bz) && TXPD_delay[1]; // rv 0
  assign TXPHALIGNEN_in = (TXPHALIGNEN !== 1'bz) && TXPHALIGNEN_delay; // rv 0
  assign TXPHALIGN_in = (TXPHALIGN !== 1'bz) && TXPHALIGN_delay; // rv 0
  assign TXPHDLYPD_in = (TXPHDLYPD !== 1'bz) && TXPHDLYPD_delay; // rv 0
  assign TXPHDLYRESET_in = (TXPHDLYRESET !== 1'bz) && TXPHDLYRESET_delay; // rv 0
  assign TXPHDLYTSTCLK_in = (TXPHDLYTSTCLK !== 1'bz) && TXPHDLYTSTCLK_delay; // rv 0
  assign TXPHINIT_in = (TXPHINIT !== 1'bz) && TXPHINIT_delay; // rv 0
  assign TXPHOVRDEN_in = (TXPHOVRDEN !== 1'bz) && TXPHOVRDEN_delay; // rv 0
  assign TXPIPPMEN_in = (TXPIPPMEN !== 1'bz) && TXPIPPMEN_delay; // rv 0
  assign TXPIPPMOVRDEN_in = (TXPIPPMOVRDEN !== 1'bz) && TXPIPPMOVRDEN_delay; // rv 0
  assign TXPIPPMPD_in = (TXPIPPMPD !== 1'bz) && TXPIPPMPD_delay; // rv 0
  assign TXPIPPMSEL_in = (TXPIPPMSEL !== 1'bz) && TXPIPPMSEL_delay; // rv 0
  assign TXPIPPMSTEPSIZE_in[0] = (TXPIPPMSTEPSIZE[0] !== 1'bz) && TXPIPPMSTEPSIZE_delay[0]; // rv 0
  assign TXPIPPMSTEPSIZE_in[1] = (TXPIPPMSTEPSIZE[1] !== 1'bz) && TXPIPPMSTEPSIZE_delay[1]; // rv 0
  assign TXPIPPMSTEPSIZE_in[2] = (TXPIPPMSTEPSIZE[2] !== 1'bz) && TXPIPPMSTEPSIZE_delay[2]; // rv 0
  assign TXPIPPMSTEPSIZE_in[3] = (TXPIPPMSTEPSIZE[3] !== 1'bz) && TXPIPPMSTEPSIZE_delay[3]; // rv 0
  assign TXPIPPMSTEPSIZE_in[4] = (TXPIPPMSTEPSIZE[4] !== 1'bz) && TXPIPPMSTEPSIZE_delay[4]; // rv 0
  assign TXPISOPD_in = (TXPISOPD !== 1'bz) && TXPISOPD_delay; // rv 0
  assign TXPLLCLKSEL_in[0] = (TXPLLCLKSEL[0] !== 1'bz) && TXPLLCLKSEL_delay[0]; // rv 0
  assign TXPLLCLKSEL_in[1] = (TXPLLCLKSEL[1] !== 1'bz) && TXPLLCLKSEL_delay[1]; // rv 0
  assign TXPMARESET_in = (TXPMARESET !== 1'bz) && TXPMARESET_delay; // rv 0
  assign TXPOLARITY_in = (TXPOLARITY !== 1'bz) && TXPOLARITY_delay; // rv 0
  assign TXPOSTCURSOR_in[0] = (TXPOSTCURSOR[0] !== 1'bz) && TXPOSTCURSOR_delay[0]; // rv 0
  assign TXPOSTCURSOR_in[1] = (TXPOSTCURSOR[1] !== 1'bz) && TXPOSTCURSOR_delay[1]; // rv 0
  assign TXPOSTCURSOR_in[2] = (TXPOSTCURSOR[2] !== 1'bz) && TXPOSTCURSOR_delay[2]; // rv 0
  assign TXPOSTCURSOR_in[3] = (TXPOSTCURSOR[3] !== 1'bz) && TXPOSTCURSOR_delay[3]; // rv 0
  assign TXPOSTCURSOR_in[4] = (TXPOSTCURSOR[4] !== 1'bz) && TXPOSTCURSOR_delay[4]; // rv 0
  assign TXPRBSFORCEERR_in = (TXPRBSFORCEERR !== 1'bz) && TXPRBSFORCEERR_delay; // rv 0
  assign TXPRBSSEL_in[0] = (TXPRBSSEL[0] !== 1'bz) && TXPRBSSEL_delay[0]; // rv 0
  assign TXPRBSSEL_in[1] = (TXPRBSSEL[1] !== 1'bz) && TXPRBSSEL_delay[1]; // rv 0
  assign TXPRBSSEL_in[2] = (TXPRBSSEL[2] !== 1'bz) && TXPRBSSEL_delay[2]; // rv 0
  assign TXPRBSSEL_in[3] = (TXPRBSSEL[3] !== 1'bz) && TXPRBSSEL_delay[3]; // rv 0
  assign TXPRECURSOR_in[0] = (TXPRECURSOR[0] !== 1'bz) && TXPRECURSOR_delay[0]; // rv 0
  assign TXPRECURSOR_in[1] = (TXPRECURSOR[1] !== 1'bz) && TXPRECURSOR_delay[1]; // rv 0
  assign TXPRECURSOR_in[2] = (TXPRECURSOR[2] !== 1'bz) && TXPRECURSOR_delay[2]; // rv 0
  assign TXPRECURSOR_in[3] = (TXPRECURSOR[3] !== 1'bz) && TXPRECURSOR_delay[3]; // rv 0
  assign TXPRECURSOR_in[4] = (TXPRECURSOR[4] !== 1'bz) && TXPRECURSOR_delay[4]; // rv 0
  assign TXPROGDIVRESET_in = (TXPROGDIVRESET !== 1'bz) && TXPROGDIVRESET_delay; // rv 0
  assign TXRATEMODE_in = (TXRATEMODE !== 1'bz) && TXRATEMODE_delay; // rv 0
  assign TXRATE_in[0] = (TXRATE[0] !== 1'bz) && TXRATE_delay[0]; // rv 0
  assign TXRATE_in[1] = (TXRATE[1] !== 1'bz) && TXRATE_delay[1]; // rv 0
  assign TXRATE_in[2] = (TXRATE[2] !== 1'bz) && TXRATE_delay[2]; // rv 0
  assign TXSEQUENCE_in[0] = (TXSEQUENCE[0] !== 1'bz) && TXSEQUENCE_delay[0]; // rv 0
  assign TXSEQUENCE_in[1] = (TXSEQUENCE[1] !== 1'bz) && TXSEQUENCE_delay[1]; // rv 0
  assign TXSEQUENCE_in[2] = (TXSEQUENCE[2] !== 1'bz) && TXSEQUENCE_delay[2]; // rv 0
  assign TXSEQUENCE_in[3] = (TXSEQUENCE[3] !== 1'bz) && TXSEQUENCE_delay[3]; // rv 0
  assign TXSEQUENCE_in[4] = (TXSEQUENCE[4] !== 1'bz) && TXSEQUENCE_delay[4]; // rv 0
  assign TXSEQUENCE_in[5] = (TXSEQUENCE[5] !== 1'bz) && TXSEQUENCE_delay[5]; // rv 0
  assign TXSEQUENCE_in[6] = (TXSEQUENCE[6] !== 1'bz) && TXSEQUENCE_delay[6]; // rv 0
  assign TXSWING_in = (TXSWING !== 1'bz) && TXSWING_delay; // rv 0
  assign TXSYNCALLIN_in = (TXSYNCALLIN !== 1'bz) && TXSYNCALLIN_delay; // rv 0
  assign TXSYNCIN_in = (TXSYNCIN !== 1'bz) && TXSYNCIN_delay; // rv 0
  assign TXSYNCMODE_in = (TXSYNCMODE === 1'bz) || TXSYNCMODE_delay; // rv 1
  assign TXSYSCLKSEL_in[0] = (TXSYSCLKSEL[0] !== 1'bz) && TXSYSCLKSEL_delay[0]; // rv 0
  assign TXSYSCLKSEL_in[1] = (TXSYSCLKSEL[1] !== 1'bz) && TXSYSCLKSEL_delay[1]; // rv 0
  assign TXUSERRDY_in = (TXUSERRDY !== 1'bz) && TXUSERRDY_delay; // rv 0
  assign TXUSRCLK2_in = (TXUSRCLK2 !== 1'bz) && TXUSRCLK2_delay; // rv 0
  assign TXUSRCLK_in = (TXUSRCLK !== 1'bz) && TXUSRCLK_delay; // rv 0


  initial begin
  #1;
  trig_attr = ~trig_attr;
  end

  assign RX_PROGDIV_CFG_BIN = RX_PROGDIV_CFG_REG * 1000;

  assign SIM_VERSION_BIN = SIM_VERSION_REG * 1000;

  assign TX_PROGDIV_CFG_BIN = TX_PROGDIV_CFG_REG * 1000;

  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
         ((CLK_COR_MAX_LAT_REG < 3) || (CLK_COR_MAX_LAT_REG > 60))) begin
      $display("Error: [Unisim %s-301] CLK_COR_MAX_LAT attribute is set to %d.  Legal values for this attribute are 3 to 60. Instance: %m", MODULE_NAME, CLK_COR_MAX_LAT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((CLK_COR_MIN_LAT_REG < 3) || (CLK_COR_MIN_LAT_REG > 63))) begin
      $display("Error: [Unisim %s-302] CLK_COR_MIN_LAT attribute is set to %d.  Legal values for this attribute are 3 to 63. Instance: %m", MODULE_NAME, CLK_COR_MIN_LAT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((CLK_COR_REPEAT_WAIT_REG < 0) || (CLK_COR_REPEAT_WAIT_REG > 31))) begin
      $display("Error: [Unisim %s-304] CLK_COR_REPEAT_WAIT attribute is set to %d.  Legal values for this attribute are 0 to 31. Instance: %m", MODULE_NAME, CLK_COR_REPEAT_WAIT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((DDI_REALIGN_WAIT_REG < 0) || (DDI_REALIGN_WAIT_REG > 31))) begin
      $display("Error: [Unisim %s-330] DDI_REALIGN_WAIT attribute is set to %d.  Legal values for this attribute are 0 to 31. Instance: %m", MODULE_NAME, DDI_REALIGN_WAIT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((RXBUF_THRESH_OVFLW_REG < 0) || (RXBUF_THRESH_OVFLW_REG > 63))) begin
      $display("Error: [Unisim %s-444] RXBUF_THRESH_OVFLW attribute is set to %d.  Legal values for this attribute are 0 to 63. Instance: %m", MODULE_NAME, RXBUF_THRESH_OVFLW_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((RXBUF_THRESH_UNDFLW_REG < 0) || (RXBUF_THRESH_UNDFLW_REG > 63))) begin
      $display("Error: [Unisim %s-446] RXBUF_THRESH_UNDFLW attribute is set to %d.  Legal values for this attribute are 0 to 63. Instance: %m", MODULE_NAME, RXBUF_THRESH_UNDFLW_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((RXPRBS_LINKACQ_CNT_REG < 15) || (RXPRBS_LINKACQ_CNT_REG > 255))) begin
      $display("Error: [Unisim %s-549] RXPRBS_LINKACQ_CNT attribute is set to %d.  Legal values for this attribute are 15 to 255. Instance: %m", MODULE_NAME, RXPRBS_LINKACQ_CNT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((RX_CLK25_DIV_REG < 1) || (RX_CLK25_DIV_REG > 32))) begin
      $display("Error: [Unisim %s-559] RX_CLK25_DIV attribute is set to %d.  Legal values for this attribute are 1 to 32. Instance: %m", MODULE_NAME, RX_CLK25_DIV_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((RX_SIG_VALID_DLY_REG < 1) || (RX_SIG_VALID_DLY_REG > 32))) begin
      $display("Error: [Unisim %s-601] RX_SIG_VALID_DLY attribute is set to %d.  Legal values for this attribute are 1 to 32. Instance: %m", MODULE_NAME, RX_SIG_VALID_DLY_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((SAS_MAX_COM_REG < 1) || (SAS_MAX_COM_REG > 127))) begin
      $display("Error: [Unisim %s-613] SAS_MAX_COM attribute is set to %d.  Legal values for this attribute are 1 to 127. Instance: %m", MODULE_NAME, SAS_MAX_COM_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((SAS_MIN_COM_REG < 1) || (SAS_MIN_COM_REG > 63))) begin
      $display("Error: [Unisim %s-614] SAS_MIN_COM attribute is set to %d.  Legal values for this attribute are 1 to 63. Instance: %m", MODULE_NAME, SAS_MIN_COM_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((SATA_MAX_BURST_REG < 1) || (SATA_MAX_BURST_REG > 63))) begin
      $display("Error: [Unisim %s-619] SATA_MAX_BURST attribute is set to %d.  Legal values for this attribute are 1 to 63. Instance: %m", MODULE_NAME, SATA_MAX_BURST_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((SATA_MAX_INIT_REG < 1) || (SATA_MAX_INIT_REG > 63))) begin
      $display("Error: [Unisim %s-620] SATA_MAX_INIT attribute is set to %d.  Legal values for this attribute are 1 to 63. Instance: %m", MODULE_NAME, SATA_MAX_INIT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((SATA_MAX_WAKE_REG < 1) || (SATA_MAX_WAKE_REG > 63))) begin
      $display("Error: [Unisim %s-621] SATA_MAX_WAKE attribute is set to %d.  Legal values for this attribute are 1 to 63. Instance: %m", MODULE_NAME, SATA_MAX_WAKE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((SATA_MIN_BURST_REG < 1) || (SATA_MIN_BURST_REG > 61))) begin
      $display("Error: [Unisim %s-622] SATA_MIN_BURST attribute is set to %d.  Legal values for this attribute are 1 to 61. Instance: %m", MODULE_NAME, SATA_MIN_BURST_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((SATA_MIN_INIT_REG < 1) || (SATA_MIN_INIT_REG > 63))) begin
      $display("Error: [Unisim %s-623] SATA_MIN_INIT attribute is set to %d.  Legal values for this attribute are 1 to 63. Instance: %m", MODULE_NAME, SATA_MIN_INIT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((SATA_MIN_WAKE_REG < 1) || (SATA_MIN_WAKE_REG > 63))) begin
      $display("Error: [Unisim %s-624] SATA_MIN_WAKE attribute is set to %d.  Legal values for this attribute are 1 to 63. Instance: %m", MODULE_NAME, SATA_MIN_WAKE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((TX_CLK25_DIV_REG < 1) || (TX_CLK25_DIV_REG > 32))) begin
      $display("Error: [Unisim %s-670] TX_CLK25_DIV attribute is set to %d.  Legal values for this attribute are 1 to 32. Instance: %m", MODULE_NAME, TX_CLK25_DIV_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ACJTAG_DEBUG_MODE_REG !== 1'b0) && (ACJTAG_DEBUG_MODE_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-101] ACJTAG_DEBUG_MODE attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, ACJTAG_DEBUG_MODE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ACJTAG_MODE_REG !== 1'b0) && (ACJTAG_MODE_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-102] ACJTAG_MODE attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, ACJTAG_MODE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ACJTAG_RESET_REG !== 1'b0) && (ACJTAG_RESET_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-103] ACJTAG_RESET attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, ACJTAG_RESET_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ADAPT_CFG0_REG < 16'h0000) || (ADAPT_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-104] ADAPT_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ADAPT_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ADAPT_CFG1_REG < 16'h0000) || (ADAPT_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-105] ADAPT_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ADAPT_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ADAPT_CFG2_REG < 16'b0000000000000000) || (ADAPT_CFG2_REG > 16'b1111111111111111))) begin
      $display("Error: [Unisim %s-106] ADAPT_CFG2 attribute is set to %b.  Legal values for this attribute are 16'b0000000000000000 to 16'b1111111111111111. Instance: %m", MODULE_NAME, ADAPT_CFG2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ALIGN_COMMA_DOUBLE_REG != "FALSE") &&
         (ALIGN_COMMA_DOUBLE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-131] ALIGN_COMMA_DOUBLE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, ALIGN_COMMA_DOUBLE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ALIGN_COMMA_ENABLE_REG < 10'b0000000000) || (ALIGN_COMMA_ENABLE_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-132] ALIGN_COMMA_ENABLE attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, ALIGN_COMMA_ENABLE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ALIGN_COMMA_WORD_REG != 1) &&
         (ALIGN_COMMA_WORD_REG != 2) &&
         (ALIGN_COMMA_WORD_REG != 4))) begin
      $display("Error: [Unisim %s-133] ALIGN_COMMA_WORD attribute is set to %d.  Legal values for this attribute are 1, 2 or 4. Instance: %m", MODULE_NAME, ALIGN_COMMA_WORD_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ALIGN_MCOMMA_DET_REG != "TRUE") &&
         (ALIGN_MCOMMA_DET_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-134] ALIGN_MCOMMA_DET attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, ALIGN_MCOMMA_DET_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ALIGN_MCOMMA_VALUE_REG < 10'b0000000000) || (ALIGN_MCOMMA_VALUE_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-135] ALIGN_MCOMMA_VALUE attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, ALIGN_MCOMMA_VALUE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ALIGN_PCOMMA_DET_REG != "TRUE") &&
         (ALIGN_PCOMMA_DET_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-136] ALIGN_PCOMMA_DET attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, ALIGN_PCOMMA_DET_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ALIGN_PCOMMA_VALUE_REG < 10'b0000000000) || (ALIGN_PCOMMA_VALUE_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-137] ALIGN_PCOMMA_VALUE attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, ALIGN_PCOMMA_VALUE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((AUTO_BW_SEL_BYPASS_REG !== 1'b0) && (AUTO_BW_SEL_BYPASS_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-139] AUTO_BW_SEL_BYPASS attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, AUTO_BW_SEL_BYPASS_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((A_RXOSCALRESET_REG !== 1'b0) && (A_RXOSCALRESET_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-219] A_RXOSCALRESET attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, A_RXOSCALRESET_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((A_RXPROGDIVRESET_REG !== 1'b0) && (A_RXPROGDIVRESET_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-235] A_RXPROGDIVRESET attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, A_RXPROGDIVRESET_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((A_TXDIFFCTRL_REG < 5'b00000) || (A_TXDIFFCTRL_REG > 5'b11111))) begin
      $display("Error: [Unisim %s-239] A_TXDIFFCTRL attribute is set to %b.  Legal values for this attribute are 5'b00000 to 5'b11111. Instance: %m", MODULE_NAME, A_TXDIFFCTRL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((A_TXPROGDIVRESET_REG !== 1'b0) && (A_TXPROGDIVRESET_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-267] A_TXPROGDIVRESET attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, A_TXPROGDIVRESET_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CAPBYPASS_FORCE_REG !== 1'b0) && (CAPBYPASS_FORCE_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-270] CAPBYPASS_FORCE attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, CAPBYPASS_FORCE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CBCC_DATA_SOURCE_SEL_REG != "DECODED") &&
         (CBCC_DATA_SOURCE_SEL_REG != "ENCODED"))) begin
      $display("Error: [Unisim %s-271] CBCC_DATA_SOURCE_SEL attribute is set to %s.  Legal values for this attribute are DECODED or ENCODED. Instance: %m", MODULE_NAME, CBCC_DATA_SOURCE_SEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CDR_SWAP_MODE_EN_REG !== 1'b0) && (CDR_SWAP_MODE_EN_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-272] CDR_SWAP_MODE_EN attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, CDR_SWAP_MODE_EN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CHAN_BOND_KEEP_ALIGN_REG != "FALSE") &&
         (CHAN_BOND_KEEP_ALIGN_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-273] CHAN_BOND_KEEP_ALIGN attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CHAN_BOND_KEEP_ALIGN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CHAN_BOND_MAX_SKEW_REG != 7) &&
         (CHAN_BOND_MAX_SKEW_REG != 1) &&
         (CHAN_BOND_MAX_SKEW_REG != 2) &&
         (CHAN_BOND_MAX_SKEW_REG != 3) &&
         (CHAN_BOND_MAX_SKEW_REG != 4) &&
         (CHAN_BOND_MAX_SKEW_REG != 5) &&
         (CHAN_BOND_MAX_SKEW_REG != 6) &&
         (CHAN_BOND_MAX_SKEW_REG != 8) &&
         (CHAN_BOND_MAX_SKEW_REG != 9) &&
         (CHAN_BOND_MAX_SKEW_REG != 10) &&
         (CHAN_BOND_MAX_SKEW_REG != 11) &&
         (CHAN_BOND_MAX_SKEW_REG != 12) &&
         (CHAN_BOND_MAX_SKEW_REG != 13) &&
         (CHAN_BOND_MAX_SKEW_REG != 14))) begin
      $display("Error: [Unisim %s-274] CHAN_BOND_MAX_SKEW attribute is set to %d.  Legal values for this attribute are 7, 1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13 or 14. Instance: %m", MODULE_NAME, CHAN_BOND_MAX_SKEW_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CHAN_BOND_SEQ_1_1_REG < 10'b0000000000) || (CHAN_BOND_SEQ_1_1_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-275] CHAN_BOND_SEQ_1_1 attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, CHAN_BOND_SEQ_1_1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CHAN_BOND_SEQ_1_2_REG < 10'b0000000000) || (CHAN_BOND_SEQ_1_2_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-276] CHAN_BOND_SEQ_1_2 attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, CHAN_BOND_SEQ_1_2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CHAN_BOND_SEQ_1_3_REG < 10'b0000000000) || (CHAN_BOND_SEQ_1_3_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-277] CHAN_BOND_SEQ_1_3 attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, CHAN_BOND_SEQ_1_3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CHAN_BOND_SEQ_1_4_REG < 10'b0000000000) || (CHAN_BOND_SEQ_1_4_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-278] CHAN_BOND_SEQ_1_4 attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, CHAN_BOND_SEQ_1_4_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CHAN_BOND_SEQ_1_ENABLE_REG < 4'b0000) || (CHAN_BOND_SEQ_1_ENABLE_REG > 4'b1111))) begin
      $display("Error: [Unisim %s-279] CHAN_BOND_SEQ_1_ENABLE attribute is set to %b.  Legal values for this attribute are 4'b0000 to 4'b1111. Instance: %m", MODULE_NAME, CHAN_BOND_SEQ_1_ENABLE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CHAN_BOND_SEQ_2_1_REG < 10'b0000000000) || (CHAN_BOND_SEQ_2_1_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-280] CHAN_BOND_SEQ_2_1 attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, CHAN_BOND_SEQ_2_1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CHAN_BOND_SEQ_2_2_REG < 10'b0000000000) || (CHAN_BOND_SEQ_2_2_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-281] CHAN_BOND_SEQ_2_2 attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, CHAN_BOND_SEQ_2_2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CHAN_BOND_SEQ_2_3_REG < 10'b0000000000) || (CHAN_BOND_SEQ_2_3_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-282] CHAN_BOND_SEQ_2_3 attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, CHAN_BOND_SEQ_2_3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CHAN_BOND_SEQ_2_4_REG < 10'b0000000000) || (CHAN_BOND_SEQ_2_4_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-283] CHAN_BOND_SEQ_2_4 attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, CHAN_BOND_SEQ_2_4_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CHAN_BOND_SEQ_2_ENABLE_REG < 4'b0000) || (CHAN_BOND_SEQ_2_ENABLE_REG > 4'b1111))) begin
      $display("Error: [Unisim %s-284] CHAN_BOND_SEQ_2_ENABLE attribute is set to %b.  Legal values for this attribute are 4'b0000 to 4'b1111. Instance: %m", MODULE_NAME, CHAN_BOND_SEQ_2_ENABLE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CHAN_BOND_SEQ_2_USE_REG != "FALSE") &&
         (CHAN_BOND_SEQ_2_USE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-285] CHAN_BOND_SEQ_2_USE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CHAN_BOND_SEQ_2_USE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CHAN_BOND_SEQ_LEN_REG != 2) &&
         (CHAN_BOND_SEQ_LEN_REG != 1) &&
         (CHAN_BOND_SEQ_LEN_REG != 3) &&
         (CHAN_BOND_SEQ_LEN_REG != 4))) begin
      $display("Error: [Unisim %s-286] CHAN_BOND_SEQ_LEN attribute is set to %d.  Legal values for this attribute are 2, 1, 3 or 4. Instance: %m", MODULE_NAME, CHAN_BOND_SEQ_LEN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CH_HSPMUX_REG < 16'h0000) || (CH_HSPMUX_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-287] CH_HSPMUX attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, CH_HSPMUX_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CKCAL1_CFG_0_REG < 16'b0000000000000000) || (CKCAL1_CFG_0_REG > 16'b1111111111111111))) begin
      $display("Error: [Unisim %s-288] CKCAL1_CFG_0 attribute is set to %b.  Legal values for this attribute are 16'b0000000000000000 to 16'b1111111111111111. Instance: %m", MODULE_NAME, CKCAL1_CFG_0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CKCAL1_CFG_1_REG < 16'b0000000000000000) || (CKCAL1_CFG_1_REG > 16'b1111111111111111))) begin
      $display("Error: [Unisim %s-289] CKCAL1_CFG_1 attribute is set to %b.  Legal values for this attribute are 16'b0000000000000000 to 16'b1111111111111111. Instance: %m", MODULE_NAME, CKCAL1_CFG_1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CKCAL1_CFG_2_REG < 16'b0000000000000000) || (CKCAL1_CFG_2_REG > 16'b1111111111111111))) begin
      $display("Error: [Unisim %s-290] CKCAL1_CFG_2 attribute is set to %b.  Legal values for this attribute are 16'b0000000000000000 to 16'b1111111111111111. Instance: %m", MODULE_NAME, CKCAL1_CFG_2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CKCAL1_CFG_3_REG < 16'b0000000000000000) || (CKCAL1_CFG_3_REG > 16'b1111111111111111))) begin
      $display("Error: [Unisim %s-291] CKCAL1_CFG_3 attribute is set to %b.  Legal values for this attribute are 16'b0000000000000000 to 16'b1111111111111111. Instance: %m", MODULE_NAME, CKCAL1_CFG_3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CKCAL2_CFG_0_REG < 16'b0000000000000000) || (CKCAL2_CFG_0_REG > 16'b1111111111111111))) begin
      $display("Error: [Unisim %s-292] CKCAL2_CFG_0 attribute is set to %b.  Legal values for this attribute are 16'b0000000000000000 to 16'b1111111111111111. Instance: %m", MODULE_NAME, CKCAL2_CFG_0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CKCAL2_CFG_1_REG < 16'b0000000000000000) || (CKCAL2_CFG_1_REG > 16'b1111111111111111))) begin
      $display("Error: [Unisim %s-293] CKCAL2_CFG_1 attribute is set to %b.  Legal values for this attribute are 16'b0000000000000000 to 16'b1111111111111111. Instance: %m", MODULE_NAME, CKCAL2_CFG_1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CKCAL2_CFG_2_REG < 16'b0000000000000000) || (CKCAL2_CFG_2_REG > 16'b1111111111111111))) begin
      $display("Error: [Unisim %s-294] CKCAL2_CFG_2 attribute is set to %b.  Legal values for this attribute are 16'b0000000000000000 to 16'b1111111111111111. Instance: %m", MODULE_NAME, CKCAL2_CFG_2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CKCAL2_CFG_3_REG < 16'b0000000000000000) || (CKCAL2_CFG_3_REG > 16'b1111111111111111))) begin
      $display("Error: [Unisim %s-295] CKCAL2_CFG_3 attribute is set to %b.  Legal values for this attribute are 16'b0000000000000000 to 16'b1111111111111111. Instance: %m", MODULE_NAME, CKCAL2_CFG_3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CKCAL2_CFG_4_REG < 16'b0000000000000000) || (CKCAL2_CFG_4_REG > 16'b1111111111111111))) begin
      $display("Error: [Unisim %s-296] CKCAL2_CFG_4 attribute is set to %b.  Legal values for this attribute are 16'b0000000000000000 to 16'b1111111111111111. Instance: %m", MODULE_NAME, CKCAL2_CFG_4_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CKCAL_RSVD0_REG < 16'h0000) || (CKCAL_RSVD0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-297] CKCAL_RSVD0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, CKCAL_RSVD0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CKCAL_RSVD1_REG < 16'h0000) || (CKCAL_RSVD1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-298] CKCAL_RSVD1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, CKCAL_RSVD1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLK_CORRECT_USE_REG != "TRUE") &&
         (CLK_CORRECT_USE_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-299] CLK_CORRECT_USE attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, CLK_CORRECT_USE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLK_COR_KEEP_IDLE_REG != "FALSE") &&
         (CLK_COR_KEEP_IDLE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-300] CLK_COR_KEEP_IDLE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CLK_COR_KEEP_IDLE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLK_COR_PRECEDENCE_REG != "TRUE") &&
         (CLK_COR_PRECEDENCE_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-303] CLK_COR_PRECEDENCE attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, CLK_COR_PRECEDENCE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLK_COR_SEQ_1_1_REG < 10'b0000000000) || (CLK_COR_SEQ_1_1_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-305] CLK_COR_SEQ_1_1 attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, CLK_COR_SEQ_1_1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLK_COR_SEQ_1_2_REG < 10'b0000000000) || (CLK_COR_SEQ_1_2_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-306] CLK_COR_SEQ_1_2 attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, CLK_COR_SEQ_1_2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLK_COR_SEQ_1_3_REG < 10'b0000000000) || (CLK_COR_SEQ_1_3_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-307] CLK_COR_SEQ_1_3 attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, CLK_COR_SEQ_1_3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLK_COR_SEQ_1_4_REG < 10'b0000000000) || (CLK_COR_SEQ_1_4_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-308] CLK_COR_SEQ_1_4 attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, CLK_COR_SEQ_1_4_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLK_COR_SEQ_1_ENABLE_REG < 4'b0000) || (CLK_COR_SEQ_1_ENABLE_REG > 4'b1111))) begin
      $display("Error: [Unisim %s-309] CLK_COR_SEQ_1_ENABLE attribute is set to %b.  Legal values for this attribute are 4'b0000 to 4'b1111. Instance: %m", MODULE_NAME, CLK_COR_SEQ_1_ENABLE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLK_COR_SEQ_2_1_REG < 10'b0000000000) || (CLK_COR_SEQ_2_1_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-310] CLK_COR_SEQ_2_1 attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, CLK_COR_SEQ_2_1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLK_COR_SEQ_2_2_REG < 10'b0000000000) || (CLK_COR_SEQ_2_2_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-311] CLK_COR_SEQ_2_2 attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, CLK_COR_SEQ_2_2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLK_COR_SEQ_2_3_REG < 10'b0000000000) || (CLK_COR_SEQ_2_3_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-312] CLK_COR_SEQ_2_3 attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, CLK_COR_SEQ_2_3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLK_COR_SEQ_2_4_REG < 10'b0000000000) || (CLK_COR_SEQ_2_4_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-313] CLK_COR_SEQ_2_4 attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, CLK_COR_SEQ_2_4_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLK_COR_SEQ_2_ENABLE_REG < 4'b0000) || (CLK_COR_SEQ_2_ENABLE_REG > 4'b1111))) begin
      $display("Error: [Unisim %s-314] CLK_COR_SEQ_2_ENABLE attribute is set to %b.  Legal values for this attribute are 4'b0000 to 4'b1111. Instance: %m", MODULE_NAME, CLK_COR_SEQ_2_ENABLE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLK_COR_SEQ_2_USE_REG != "FALSE") &&
         (CLK_COR_SEQ_2_USE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-315] CLK_COR_SEQ_2_USE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CLK_COR_SEQ_2_USE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLK_COR_SEQ_LEN_REG != 2) &&
         (CLK_COR_SEQ_LEN_REG != 1) &&
         (CLK_COR_SEQ_LEN_REG != 3) &&
         (CLK_COR_SEQ_LEN_REG != 4))) begin
      $display("Error: [Unisim %s-316] CLK_COR_SEQ_LEN attribute is set to %d.  Legal values for this attribute are 2, 1, 3 or 4. Instance: %m", MODULE_NAME, CLK_COR_SEQ_LEN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CPLL_CFG0_REG < 16'h0000) || (CPLL_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-317] CPLL_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, CPLL_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CPLL_CFG1_REG < 16'h0000) || (CPLL_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-318] CPLL_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, CPLL_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CPLL_CFG2_REG < 16'h0000) || (CPLL_CFG2_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-319] CPLL_CFG2 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, CPLL_CFG2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CPLL_CFG3_REG < 6'h00) || (CPLL_CFG3_REG > 6'h3F))) begin
      $display("Error: [Unisim %s-320] CPLL_CFG3 attribute is set to %h.  Legal values for this attribute are 6'h00 to 6'h3F. Instance: %m", MODULE_NAME, CPLL_CFG3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CPLL_FBDIV_45_REG != 4) &&
         (CPLL_FBDIV_45_REG != 5))) begin
      $display("Error: [Unisim %s-322] CPLL_FBDIV_45 attribute is set to %d.  Legal values for this attribute are 4 or 5. Instance: %m", MODULE_NAME, CPLL_FBDIV_45_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CPLL_FBDIV_REG != 4) &&
         (CPLL_FBDIV_REG != 1) &&
         (CPLL_FBDIV_REG != 2) &&
         (CPLL_FBDIV_REG != 3) &&
         (CPLL_FBDIV_REG != 5) &&
         (CPLL_FBDIV_REG != 6) &&
         (CPLL_FBDIV_REG != 8) &&
         (CPLL_FBDIV_REG != 10) &&
         (CPLL_FBDIV_REG != 12) &&
         (CPLL_FBDIV_REG != 16) &&
         (CPLL_FBDIV_REG != 20))) begin
      $display("Error: [Unisim %s-321] CPLL_FBDIV attribute is set to %d.  Legal values for this attribute are 4, 1, 2, 3, 5, 6, 8, 10, 12, 16 or 20. Instance: %m", MODULE_NAME, CPLL_FBDIV_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CPLL_INIT_CFG0_REG < 16'h0000) || (CPLL_INIT_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-323] CPLL_INIT_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, CPLL_INIT_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CPLL_INIT_CFG1_REG < 8'h00) || (CPLL_INIT_CFG1_REG > 8'hFF))) begin
      $display("Error: [Unisim %s-324] CPLL_INIT_CFG1 attribute is set to %h.  Legal values for this attribute are 8'h00 to 8'hFF. Instance: %m", MODULE_NAME, CPLL_INIT_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CPLL_LOCK_CFG_REG < 16'h0000) || (CPLL_LOCK_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-325] CPLL_LOCK_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, CPLL_LOCK_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CPLL_REFCLK_DIV_REG != 1) &&
         (CPLL_REFCLK_DIV_REG != 2) &&
         (CPLL_REFCLK_DIV_REG != 3) &&
         (CPLL_REFCLK_DIV_REG != 4) &&
         (CPLL_REFCLK_DIV_REG != 5) &&
         (CPLL_REFCLK_DIV_REG != 6) &&
         (CPLL_REFCLK_DIV_REG != 8) &&
         (CPLL_REFCLK_DIV_REG != 10) &&
         (CPLL_REFCLK_DIV_REG != 12) &&
         (CPLL_REFCLK_DIV_REG != 16) &&
         (CPLL_REFCLK_DIV_REG != 20))) begin
      $display("Error: [Unisim %s-326] CPLL_REFCLK_DIV attribute is set to %d.  Legal values for this attribute are 1, 2, 3, 4, 5, 6, 8, 10, 12, 16 or 20. Instance: %m", MODULE_NAME, CPLL_REFCLK_DIV_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CTLE3_OCAP_EXT_CTRL_REG < 3'b000) || (CTLE3_OCAP_EXT_CTRL_REG > 3'b111))) begin
      $display("Error: [Unisim %s-327] CTLE3_OCAP_EXT_CTRL attribute is set to %b.  Legal values for this attribute are 3'b000 to 3'b111. Instance: %m", MODULE_NAME, CTLE3_OCAP_EXT_CTRL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CTLE3_OCAP_EXT_EN_REG !== 1'b0) && (CTLE3_OCAP_EXT_EN_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-328] CTLE3_OCAP_EXT_EN attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, CTLE3_OCAP_EXT_EN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((DDI_CTRL_REG < 2'b00) || (DDI_CTRL_REG > 2'b11))) begin
      $display("Error: [Unisim %s-329] DDI_CTRL attribute is set to %b.  Legal values for this attribute are 2'b00 to 2'b11. Instance: %m", MODULE_NAME, DDI_CTRL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((DEC_MCOMMA_DETECT_REG != "TRUE") &&
         (DEC_MCOMMA_DETECT_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-331] DEC_MCOMMA_DETECT attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, DEC_MCOMMA_DETECT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((DEC_PCOMMA_DETECT_REG != "TRUE") &&
         (DEC_PCOMMA_DETECT_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-332] DEC_PCOMMA_DETECT attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, DEC_PCOMMA_DETECT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((DEC_VALID_COMMA_ONLY_REG != "TRUE") &&
         (DEC_VALID_COMMA_ONLY_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-333] DEC_VALID_COMMA_ONLY attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, DEC_VALID_COMMA_ONLY_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((DFE_D_X_REL_POS_REG !== 1'b0) && (DFE_D_X_REL_POS_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-334] DFE_D_X_REL_POS attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, DFE_D_X_REL_POS_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((DFE_VCM_COMP_EN_REG !== 1'b0) && (DFE_VCM_COMP_EN_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-335] DFE_VCM_COMP_EN attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, DFE_VCM_COMP_EN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((DMONITOR_CFG0_REG < 10'h000) || (DMONITOR_CFG0_REG > 10'h3FF))) begin
      $display("Error: [Unisim %s-336] DMONITOR_CFG0 attribute is set to %h.  Legal values for this attribute are 10'h000 to 10'h3FF. Instance: %m", MODULE_NAME, DMONITOR_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((DMONITOR_CFG1_REG < 8'h00) || (DMONITOR_CFG1_REG > 8'hFF))) begin
      $display("Error: [Unisim %s-337] DMONITOR_CFG1 attribute is set to %h.  Legal values for this attribute are 8'h00 to 8'hFF. Instance: %m", MODULE_NAME, DMONITOR_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_CLK_PHASE_SEL_REG !== 1'b0) && (ES_CLK_PHASE_SEL_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-338] ES_CLK_PHASE_SEL attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, ES_CLK_PHASE_SEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_CONTROL_REG < 6'b000000) || (ES_CONTROL_REG > 6'b111111))) begin
      $display("Error: [Unisim %s-339] ES_CONTROL attribute is set to %b.  Legal values for this attribute are 6'b000000 to 6'b111111. Instance: %m", MODULE_NAME, ES_CONTROL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_ERRDET_EN_REG != "FALSE") &&
         (ES_ERRDET_EN_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-340] ES_ERRDET_EN attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, ES_ERRDET_EN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_EYE_SCAN_EN_REG != "FALSE") &&
         (ES_EYE_SCAN_EN_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-341] ES_EYE_SCAN_EN attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, ES_EYE_SCAN_EN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_HORZ_OFFSET_REG < 12'h000) || (ES_HORZ_OFFSET_REG > 12'hFFF))) begin
      $display("Error: [Unisim %s-342] ES_HORZ_OFFSET attribute is set to %h.  Legal values for this attribute are 12'h000 to 12'hFFF. Instance: %m", MODULE_NAME, ES_HORZ_OFFSET_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_PMA_CFG_REG < 10'b0000000000) || (ES_PMA_CFG_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-343] ES_PMA_CFG attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, ES_PMA_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_PRESCALE_REG < 5'b00000) || (ES_PRESCALE_REG > 5'b11111))) begin
      $display("Error: [Unisim %s-344] ES_PRESCALE attribute is set to %b.  Legal values for this attribute are 5'b00000 to 5'b11111. Instance: %m", MODULE_NAME, ES_PRESCALE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_QUALIFIER0_REG < 16'h0000) || (ES_QUALIFIER0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-345] ES_QUALIFIER0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_QUALIFIER0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_QUALIFIER1_REG < 16'h0000) || (ES_QUALIFIER1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-346] ES_QUALIFIER1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_QUALIFIER1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_QUALIFIER2_REG < 16'h0000) || (ES_QUALIFIER2_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-347] ES_QUALIFIER2 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_QUALIFIER2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_QUALIFIER3_REG < 16'h0000) || (ES_QUALIFIER3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-348] ES_QUALIFIER3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_QUALIFIER3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_QUALIFIER4_REG < 16'h0000) || (ES_QUALIFIER4_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-349] ES_QUALIFIER4 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_QUALIFIER4_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_QUALIFIER5_REG < 16'h0000) || (ES_QUALIFIER5_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-350] ES_QUALIFIER5 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_QUALIFIER5_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_QUALIFIER6_REG < 16'h0000) || (ES_QUALIFIER6_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-351] ES_QUALIFIER6 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_QUALIFIER6_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_QUALIFIER7_REG < 16'h0000) || (ES_QUALIFIER7_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-352] ES_QUALIFIER7 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_QUALIFIER7_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_QUALIFIER8_REG < 16'h0000) || (ES_QUALIFIER8_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-353] ES_QUALIFIER8 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_QUALIFIER8_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_QUALIFIER9_REG < 16'h0000) || (ES_QUALIFIER9_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-354] ES_QUALIFIER9 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_QUALIFIER9_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_QUAL_MASK0_REG < 16'h0000) || (ES_QUAL_MASK0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-355] ES_QUAL_MASK0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_QUAL_MASK0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_QUAL_MASK1_REG < 16'h0000) || (ES_QUAL_MASK1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-356] ES_QUAL_MASK1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_QUAL_MASK1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_QUAL_MASK2_REG < 16'h0000) || (ES_QUAL_MASK2_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-357] ES_QUAL_MASK2 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_QUAL_MASK2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_QUAL_MASK3_REG < 16'h0000) || (ES_QUAL_MASK3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-358] ES_QUAL_MASK3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_QUAL_MASK3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_QUAL_MASK4_REG < 16'h0000) || (ES_QUAL_MASK4_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-359] ES_QUAL_MASK4 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_QUAL_MASK4_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_QUAL_MASK5_REG < 16'h0000) || (ES_QUAL_MASK5_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-360] ES_QUAL_MASK5 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_QUAL_MASK5_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_QUAL_MASK6_REG < 16'h0000) || (ES_QUAL_MASK6_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-361] ES_QUAL_MASK6 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_QUAL_MASK6_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_QUAL_MASK7_REG < 16'h0000) || (ES_QUAL_MASK7_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-362] ES_QUAL_MASK7 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_QUAL_MASK7_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_QUAL_MASK8_REG < 16'h0000) || (ES_QUAL_MASK8_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-363] ES_QUAL_MASK8 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_QUAL_MASK8_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_QUAL_MASK9_REG < 16'h0000) || (ES_QUAL_MASK9_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-364] ES_QUAL_MASK9 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_QUAL_MASK9_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_SDATA_MASK0_REG < 16'h0000) || (ES_SDATA_MASK0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-365] ES_SDATA_MASK0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_SDATA_MASK0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_SDATA_MASK1_REG < 16'h0000) || (ES_SDATA_MASK1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-366] ES_SDATA_MASK1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_SDATA_MASK1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_SDATA_MASK2_REG < 16'h0000) || (ES_SDATA_MASK2_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-367] ES_SDATA_MASK2 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_SDATA_MASK2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_SDATA_MASK3_REG < 16'h0000) || (ES_SDATA_MASK3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-368] ES_SDATA_MASK3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_SDATA_MASK3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_SDATA_MASK4_REG < 16'h0000) || (ES_SDATA_MASK4_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-369] ES_SDATA_MASK4 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_SDATA_MASK4_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_SDATA_MASK5_REG < 16'h0000) || (ES_SDATA_MASK5_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-370] ES_SDATA_MASK5 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_SDATA_MASK5_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_SDATA_MASK6_REG < 16'h0000) || (ES_SDATA_MASK6_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-371] ES_SDATA_MASK6 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_SDATA_MASK6_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_SDATA_MASK7_REG < 16'h0000) || (ES_SDATA_MASK7_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-372] ES_SDATA_MASK7 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_SDATA_MASK7_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_SDATA_MASK8_REG < 16'h0000) || (ES_SDATA_MASK8_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-373] ES_SDATA_MASK8 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_SDATA_MASK8_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ES_SDATA_MASK9_REG < 16'h0000) || (ES_SDATA_MASK9_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-374] ES_SDATA_MASK9 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, ES_SDATA_MASK9_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((EVODD_PHI_CFG_REG < 11'b00000000000) || (EVODD_PHI_CFG_REG > 11'b11111111111))) begin
      $display("Error: [Unisim %s-375] EVODD_PHI_CFG attribute is set to %b.  Legal values for this attribute are 11'b00000000000 to 11'b11111111111. Instance: %m", MODULE_NAME, EVODD_PHI_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((EYE_SCAN_SWAP_EN_REG !== 1'b0) && (EYE_SCAN_SWAP_EN_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-376] EYE_SCAN_SWAP_EN attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, EYE_SCAN_SWAP_EN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((FTS_DESKEW_SEQ_ENABLE_REG < 4'b0000) || (FTS_DESKEW_SEQ_ENABLE_REG > 4'b1111))) begin
      $display("Error: [Unisim %s-377] FTS_DESKEW_SEQ_ENABLE attribute is set to %b.  Legal values for this attribute are 4'b0000 to 4'b1111. Instance: %m", MODULE_NAME, FTS_DESKEW_SEQ_ENABLE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((FTS_LANE_DESKEW_CFG_REG < 4'b0000) || (FTS_LANE_DESKEW_CFG_REG > 4'b1111))) begin
      $display("Error: [Unisim %s-378] FTS_LANE_DESKEW_CFG attribute is set to %b.  Legal values for this attribute are 4'b0000 to 4'b1111. Instance: %m", MODULE_NAME, FTS_LANE_DESKEW_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((FTS_LANE_DESKEW_EN_REG != "FALSE") &&
         (FTS_LANE_DESKEW_EN_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-379] FTS_LANE_DESKEW_EN attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, FTS_LANE_DESKEW_EN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((GEARBOX_MODE_REG < 5'b00000) || (GEARBOX_MODE_REG > 5'b11111))) begin
      $display("Error: [Unisim %s-380] GEARBOX_MODE attribute is set to %b.  Legal values for this attribute are 5'b00000 to 5'b11111. Instance: %m", MODULE_NAME, GEARBOX_MODE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((GM_BIAS_SELECT_REG !== 1'b0) && (GM_BIAS_SELECT_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-383] GM_BIAS_SELECT attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, GM_BIAS_SELECT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ISCAN_CK_PH_SEL2_REG !== 1'b0) && (ISCAN_CK_PH_SEL2_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-385] ISCAN_CK_PH_SEL2 attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, ISCAN_CK_PH_SEL2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((LOCAL_MASTER_REG !== 1'b0) && (LOCAL_MASTER_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-386] LOCAL_MASTER attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, LOCAL_MASTER_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((LOOP0_CFG_REG < 16'h0000) || (LOOP0_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-387] LOOP0_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, LOOP0_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((LOOP10_CFG_REG < 16'h0000) || (LOOP10_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-388] LOOP10_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, LOOP10_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((LOOP11_CFG_REG < 16'h0000) || (LOOP11_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-389] LOOP11_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, LOOP11_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((LOOP12_CFG_REG < 16'h0000) || (LOOP12_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-390] LOOP12_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, LOOP12_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((LOOP13_CFG_REG < 16'h0000) || (LOOP13_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-391] LOOP13_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, LOOP13_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((LOOP1_CFG_REG < 16'h0000) || (LOOP1_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-392] LOOP1_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, LOOP1_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((LOOP2_CFG_REG < 16'h0000) || (LOOP2_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-393] LOOP2_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, LOOP2_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((LOOP3_CFG_REG < 16'h0000) || (LOOP3_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-394] LOOP3_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, LOOP3_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((LOOP4_CFG_REG < 16'h0000) || (LOOP4_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-395] LOOP4_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, LOOP4_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((LOOP5_CFG_REG < 16'h0000) || (LOOP5_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-396] LOOP5_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, LOOP5_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((LOOP6_CFG_REG < 16'h0000) || (LOOP6_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-397] LOOP6_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, LOOP6_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((LOOP7_CFG_REG < 16'h0000) || (LOOP7_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-398] LOOP7_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, LOOP7_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((LOOP8_CFG_REG < 16'h0000) || (LOOP8_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-399] LOOP8_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, LOOP8_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((LOOP9_CFG_REG < 16'h0000) || (LOOP9_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-400] LOOP9_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, LOOP9_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((LPBK_BIAS_CTRL_REG < 3'b000) || (LPBK_BIAS_CTRL_REG > 3'b111))) begin
      $display("Error: [Unisim %s-401] LPBK_BIAS_CTRL attribute is set to %b.  Legal values for this attribute are 3'b000 to 3'b111. Instance: %m", MODULE_NAME, LPBK_BIAS_CTRL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((LPBK_EN_RCAL_B_REG !== 1'b0) && (LPBK_EN_RCAL_B_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-402] LPBK_EN_RCAL_B attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, LPBK_EN_RCAL_B_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((LPBK_EXT_RCAL_REG < 4'b0000) || (LPBK_EXT_RCAL_REG > 4'b1111))) begin
      $display("Error: [Unisim %s-403] LPBK_EXT_RCAL attribute is set to %b.  Legal values for this attribute are 4'b0000 to 4'b1111. Instance: %m", MODULE_NAME, LPBK_EXT_RCAL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((LPBK_RG_CTRL_REG < 4'b0000) || (LPBK_RG_CTRL_REG > 4'b1111))) begin
      $display("Error: [Unisim %s-404] LPBK_RG_CTRL attribute is set to %b.  Legal values for this attribute are 4'b0000 to 4'b1111. Instance: %m", MODULE_NAME, LPBK_RG_CTRL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((OOBDIVCTL_REG < 2'b00) || (OOBDIVCTL_REG > 2'b11))) begin
      $display("Error: [Unisim %s-405] OOBDIVCTL attribute is set to %b.  Legal values for this attribute are 2'b00 to 2'b11. Instance: %m", MODULE_NAME, OOBDIVCTL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((OOB_PWRUP_REG !== 1'b0) && (OOB_PWRUP_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-406] OOB_PWRUP attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, OOB_PWRUP_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PCI3_AUTO_REALIGN_REG != "FRST_SMPL") &&
         (PCI3_AUTO_REALIGN_REG != "OVR_1K_BLK") &&
         (PCI3_AUTO_REALIGN_REG != "OVR_8_BLK") &&
         (PCI3_AUTO_REALIGN_REG != "OVR_64_BLK"))) begin
      $display("Error: [Unisim %s-407] PCI3_AUTO_REALIGN attribute is set to %s.  Legal values for this attribute are FRST_SMPL, OVR_1K_BLK, OVR_8_BLK or OVR_64_BLK. Instance: %m", MODULE_NAME, PCI3_AUTO_REALIGN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PCI3_PIPE_RX_ELECIDLE_REG !== 1'b0) && (PCI3_PIPE_RX_ELECIDLE_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-408] PCI3_PIPE_RX_ELECIDLE attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, PCI3_PIPE_RX_ELECIDLE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PCI3_RX_ASYNC_EBUF_BYPASS_REG < 2'b00) || (PCI3_RX_ASYNC_EBUF_BYPASS_REG > 2'b11))) begin
      $display("Error: [Unisim %s-409] PCI3_RX_ASYNC_EBUF_BYPASS attribute is set to %b.  Legal values for this attribute are 2'b00 to 2'b11. Instance: %m", MODULE_NAME, PCI3_RX_ASYNC_EBUF_BYPASS_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PCI3_RX_ELECIDLE_EI2_ENABLE_REG !== 1'b0) && (PCI3_RX_ELECIDLE_EI2_ENABLE_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-410] PCI3_RX_ELECIDLE_EI2_ENABLE attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, PCI3_RX_ELECIDLE_EI2_ENABLE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PCI3_RX_ELECIDLE_H2L_COUNT_REG < 6'b000000) || (PCI3_RX_ELECIDLE_H2L_COUNT_REG > 6'b111111))) begin
      $display("Error: [Unisim %s-411] PCI3_RX_ELECIDLE_H2L_COUNT attribute is set to %b.  Legal values for this attribute are 6'b000000 to 6'b111111. Instance: %m", MODULE_NAME, PCI3_RX_ELECIDLE_H2L_COUNT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PCI3_RX_ELECIDLE_H2L_DISABLE_REG < 3'b000) || (PCI3_RX_ELECIDLE_H2L_DISABLE_REG > 3'b111))) begin
      $display("Error: [Unisim %s-412] PCI3_RX_ELECIDLE_H2L_DISABLE attribute is set to %b.  Legal values for this attribute are 3'b000 to 3'b111. Instance: %m", MODULE_NAME, PCI3_RX_ELECIDLE_H2L_DISABLE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PCI3_RX_ELECIDLE_HI_COUNT_REG < 6'b000000) || (PCI3_RX_ELECIDLE_HI_COUNT_REG > 6'b111111))) begin
      $display("Error: [Unisim %s-413] PCI3_RX_ELECIDLE_HI_COUNT attribute is set to %b.  Legal values for this attribute are 6'b000000 to 6'b111111. Instance: %m", MODULE_NAME, PCI3_RX_ELECIDLE_HI_COUNT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PCI3_RX_ELECIDLE_LP4_DISABLE_REG !== 1'b0) && (PCI3_RX_ELECIDLE_LP4_DISABLE_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-414] PCI3_RX_ELECIDLE_LP4_DISABLE attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, PCI3_RX_ELECIDLE_LP4_DISABLE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PCI3_RX_FIFO_DISABLE_REG !== 1'b0) && (PCI3_RX_FIFO_DISABLE_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-415] PCI3_RX_FIFO_DISABLE attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, PCI3_RX_FIFO_DISABLE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PCIE_BUFG_DIV_CTRL_REG < 16'h0000) || (PCIE_BUFG_DIV_CTRL_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-416] PCIE_BUFG_DIV_CTRL attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, PCIE_BUFG_DIV_CTRL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PCIE_RXPCS_CFG_GEN3_REG < 16'h0000) || (PCIE_RXPCS_CFG_GEN3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-417] PCIE_RXPCS_CFG_GEN3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, PCIE_RXPCS_CFG_GEN3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PCIE_RXPMA_CFG_REG < 16'h0000) || (PCIE_RXPMA_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-418] PCIE_RXPMA_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, PCIE_RXPMA_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PCIE_TXPCS_CFG_GEN3_REG < 16'h0000) || (PCIE_TXPCS_CFG_GEN3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-419] PCIE_TXPCS_CFG_GEN3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, PCIE_TXPCS_CFG_GEN3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PCIE_TXPMA_CFG_REG < 16'h0000) || (PCIE_TXPMA_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-420] PCIE_TXPMA_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, PCIE_TXPMA_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PCS_PCIE_EN_REG != "FALSE") &&
         (PCS_PCIE_EN_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-421] PCS_PCIE_EN attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, PCS_PCIE_EN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PCS_RSVD0_REG < 16'b0000000000000000) || (PCS_RSVD0_REG > 16'b1111111111111111))) begin
      $display("Error: [Unisim %s-422] PCS_RSVD0 attribute is set to %b.  Legal values for this attribute are 16'b0000000000000000 to 16'b1111111111111111. Instance: %m", MODULE_NAME, PCS_RSVD0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PCS_RSVD1_REG < 3'b000) || (PCS_RSVD1_REG > 3'b111))) begin
      $display("Error: [Unisim %s-423] PCS_RSVD1 attribute is set to %b.  Legal values for this attribute are 3'b000 to 3'b111. Instance: %m", MODULE_NAME, PCS_RSVD1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PD_TRANS_TIME_FROM_P2_REG < 12'h000) || (PD_TRANS_TIME_FROM_P2_REG > 12'hFFF))) begin
      $display("Error: [Unisim %s-424] PD_TRANS_TIME_FROM_P2 attribute is set to %h.  Legal values for this attribute are 12'h000 to 12'hFFF. Instance: %m", MODULE_NAME, PD_TRANS_TIME_FROM_P2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PD_TRANS_TIME_NONE_P2_REG < 8'h00) || (PD_TRANS_TIME_NONE_P2_REG > 8'hFF))) begin
      $display("Error: [Unisim %s-425] PD_TRANS_TIME_NONE_P2 attribute is set to %h.  Legal values for this attribute are 8'h00 to 8'hFF. Instance: %m", MODULE_NAME, PD_TRANS_TIME_NONE_P2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PD_TRANS_TIME_TO_P2_REG < 8'h00) || (PD_TRANS_TIME_TO_P2_REG > 8'hFF))) begin
      $display("Error: [Unisim %s-426] PD_TRANS_TIME_TO_P2 attribute is set to %h.  Legal values for this attribute are 8'h00 to 8'hFF. Instance: %m", MODULE_NAME, PD_TRANS_TIME_TO_P2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PLL_SEL_MODE_GEN12_REG < 2'h0) || (PLL_SEL_MODE_GEN12_REG > 2'h3))) begin
      $display("Error: [Unisim %s-427] PLL_SEL_MODE_GEN12 attribute is set to %h.  Legal values for this attribute are 2'h0 to 2'h3. Instance: %m", MODULE_NAME, PLL_SEL_MODE_GEN12_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PLL_SEL_MODE_GEN3_REG < 2'h0) || (PLL_SEL_MODE_GEN3_REG > 2'h3))) begin
      $display("Error: [Unisim %s-428] PLL_SEL_MODE_GEN3 attribute is set to %h.  Legal values for this attribute are 2'h0 to 2'h3. Instance: %m", MODULE_NAME, PLL_SEL_MODE_GEN3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PMA_RSV0_REG < 16'h0000) || (PMA_RSV0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-429] PMA_RSV0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, PMA_RSV0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PMA_RSV1_REG < 16'h0000) || (PMA_RSV1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-430] PMA_RSV1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, PMA_RSV1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PREIQ_FREQ_BST_REG != 0) &&
         (PREIQ_FREQ_BST_REG != 1) &&
         (PREIQ_FREQ_BST_REG != 2) &&
         (PREIQ_FREQ_BST_REG != 3))) begin
      $display("Error: [Unisim %s-431] PREIQ_FREQ_BST attribute is set to %d.  Legal values for this attribute are 0, 1, 2 or 3. Instance: %m", MODULE_NAME, PREIQ_FREQ_BST_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PROCESS_PAR_REG < 3'b000) || (PROCESS_PAR_REG > 3'b111))) begin
      $display("Error: [Unisim %s-432] PROCESS_PAR attribute is set to %b.  Legal values for this attribute are 3'b000 to 3'b111. Instance: %m", MODULE_NAME, PROCESS_PAR_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RATE_SW_USE_DRP_REG !== 1'b0) && (RATE_SW_USE_DRP_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-433] RATE_SW_USE_DRP attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RATE_SW_USE_DRP_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RESET_POWERSAVE_DISABLE_REG !== 1'b0) && (RESET_POWERSAVE_DISABLE_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-434] RESET_POWERSAVE_DISABLE attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RESET_POWERSAVE_DISABLE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXBUFRESET_TIME_REG < 5'b00000) || (RXBUFRESET_TIME_REG > 5'b11111))) begin
      $display("Error: [Unisim %s-435] RXBUFRESET_TIME attribute is set to %b.  Legal values for this attribute are 5'b00000 to 5'b11111. Instance: %m", MODULE_NAME, RXBUFRESET_TIME_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXBUF_ADDR_MODE_REG != "FULL") &&
         (RXBUF_ADDR_MODE_REG != "FAST"))) begin
      $display("Error: [Unisim %s-436] RXBUF_ADDR_MODE attribute is set to %s.  Legal values for this attribute are FULL or FAST. Instance: %m", MODULE_NAME, RXBUF_ADDR_MODE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXBUF_EIDLE_HI_CNT_REG < 4'b0000) || (RXBUF_EIDLE_HI_CNT_REG > 4'b1111))) begin
      $display("Error: [Unisim %s-437] RXBUF_EIDLE_HI_CNT attribute is set to %b.  Legal values for this attribute are 4'b0000 to 4'b1111. Instance: %m", MODULE_NAME, RXBUF_EIDLE_HI_CNT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXBUF_EIDLE_LO_CNT_REG < 4'b0000) || (RXBUF_EIDLE_LO_CNT_REG > 4'b1111))) begin
      $display("Error: [Unisim %s-438] RXBUF_EIDLE_LO_CNT attribute is set to %b.  Legal values for this attribute are 4'b0000 to 4'b1111. Instance: %m", MODULE_NAME, RXBUF_EIDLE_LO_CNT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXBUF_EN_REG != "TRUE") &&
         (RXBUF_EN_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-439] RXBUF_EN attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, RXBUF_EN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXBUF_RESET_ON_CB_CHANGE_REG != "TRUE") &&
         (RXBUF_RESET_ON_CB_CHANGE_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-440] RXBUF_RESET_ON_CB_CHANGE attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, RXBUF_RESET_ON_CB_CHANGE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXBUF_RESET_ON_COMMAALIGN_REG != "FALSE") &&
         (RXBUF_RESET_ON_COMMAALIGN_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-441] RXBUF_RESET_ON_COMMAALIGN attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, RXBUF_RESET_ON_COMMAALIGN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXBUF_RESET_ON_EIDLE_REG != "FALSE") &&
         (RXBUF_RESET_ON_EIDLE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-442] RXBUF_RESET_ON_EIDLE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, RXBUF_RESET_ON_EIDLE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXBUF_RESET_ON_RATE_CHANGE_REG != "TRUE") &&
         (RXBUF_RESET_ON_RATE_CHANGE_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-443] RXBUF_RESET_ON_RATE_CHANGE attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, RXBUF_RESET_ON_RATE_CHANGE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXBUF_THRESH_OVRD_REG != "FALSE") &&
         (RXBUF_THRESH_OVRD_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-445] RXBUF_THRESH_OVRD attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, RXBUF_THRESH_OVRD_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCDRFREQRESET_TIME_REG < 5'b00000) || (RXCDRFREQRESET_TIME_REG > 5'b11111))) begin
      $display("Error: [Unisim %s-447] RXCDRFREQRESET_TIME attribute is set to %b.  Legal values for this attribute are 5'b00000 to 5'b11111. Instance: %m", MODULE_NAME, RXCDRFREQRESET_TIME_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCDRPHRESET_TIME_REG < 5'b00000) || (RXCDRPHRESET_TIME_REG > 5'b11111))) begin
      $display("Error: [Unisim %s-448] RXCDRPHRESET_TIME attribute is set to %b.  Legal values for this attribute are 5'b00000 to 5'b11111. Instance: %m", MODULE_NAME, RXCDRPHRESET_TIME_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCDR_CFG0_GEN3_REG < 16'h0000) || (RXCDR_CFG0_GEN3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-450] RXCDR_CFG0_GEN3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXCDR_CFG0_GEN3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCDR_CFG0_REG < 16'h0000) || (RXCDR_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-449] RXCDR_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXCDR_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCDR_CFG1_GEN3_REG < 16'h0000) || (RXCDR_CFG1_GEN3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-452] RXCDR_CFG1_GEN3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXCDR_CFG1_GEN3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCDR_CFG1_REG < 16'h0000) || (RXCDR_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-451] RXCDR_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXCDR_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCDR_CFG2_GEN3_REG < 16'h0000) || (RXCDR_CFG2_GEN3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-454] RXCDR_CFG2_GEN3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXCDR_CFG2_GEN3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCDR_CFG2_REG < 16'h0000) || (RXCDR_CFG2_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-453] RXCDR_CFG2 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXCDR_CFG2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCDR_CFG3_GEN3_REG < 16'h0000) || (RXCDR_CFG3_GEN3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-456] RXCDR_CFG3_GEN3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXCDR_CFG3_GEN3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCDR_CFG3_REG < 16'h0000) || (RXCDR_CFG3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-455] RXCDR_CFG3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXCDR_CFG3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCDR_CFG4_GEN3_REG < 16'h0000) || (RXCDR_CFG4_GEN3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-458] RXCDR_CFG4_GEN3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXCDR_CFG4_GEN3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCDR_CFG4_REG < 16'h0000) || (RXCDR_CFG4_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-457] RXCDR_CFG4 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXCDR_CFG4_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCDR_CFG5_GEN3_REG < 16'h0000) || (RXCDR_CFG5_GEN3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-460] RXCDR_CFG5_GEN3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXCDR_CFG5_GEN3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCDR_CFG5_REG < 16'h0000) || (RXCDR_CFG5_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-459] RXCDR_CFG5 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXCDR_CFG5_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCDR_FR_RESET_ON_EIDLE_REG !== 1'b0) && (RXCDR_FR_RESET_ON_EIDLE_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-461] RXCDR_FR_RESET_ON_EIDLE attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RXCDR_FR_RESET_ON_EIDLE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCDR_HOLD_DURING_EIDLE_REG !== 1'b0) && (RXCDR_HOLD_DURING_EIDLE_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-462] RXCDR_HOLD_DURING_EIDLE attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RXCDR_HOLD_DURING_EIDLE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCDR_LOCK_CFG0_REG < 16'h0000) || (RXCDR_LOCK_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-463] RXCDR_LOCK_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXCDR_LOCK_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCDR_LOCK_CFG1_REG < 16'h0000) || (RXCDR_LOCK_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-464] RXCDR_LOCK_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXCDR_LOCK_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCDR_LOCK_CFG2_REG < 16'h0000) || (RXCDR_LOCK_CFG2_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-465] RXCDR_LOCK_CFG2 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXCDR_LOCK_CFG2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCDR_LOCK_CFG3_REG < 16'h0000) || (RXCDR_LOCK_CFG3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-466] RXCDR_LOCK_CFG3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXCDR_LOCK_CFG3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCDR_PH_RESET_ON_EIDLE_REG !== 1'b0) && (RXCDR_PH_RESET_ON_EIDLE_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-467] RXCDR_PH_RESET_ON_EIDLE attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RXCDR_PH_RESET_ON_EIDLE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCFOKDONE_SRC_REG < 2'b00) || (RXCFOKDONE_SRC_REG > 2'b11))) begin
      $display("Error: [Unisim %s-468] RXCFOKDONE_SRC attribute is set to %b.  Legal values for this attribute are 2'b00 to 2'b11. Instance: %m", MODULE_NAME, RXCFOKDONE_SRC_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCFOK_CFG0_REG < 16'h0000) || (RXCFOK_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-469] RXCFOK_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXCFOK_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCFOK_CFG1_REG < 16'h0000) || (RXCFOK_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-470] RXCFOK_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXCFOK_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXCFOK_CFG2_REG < 16'h0000) || (RXCFOK_CFG2_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-471] RXCFOK_CFG2 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXCFOK_CFG2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFELPMRESET_TIME_REG < 7'b0000000) || (RXDFELPMRESET_TIME_REG > 7'b1111111))) begin
      $display("Error: [Unisim %s-472] RXDFELPMRESET_TIME attribute is set to %b.  Legal values for this attribute are 7'b0000000 to 7'b1111111. Instance: %m", MODULE_NAME, RXDFELPMRESET_TIME_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFELPM_KL_CFG0_REG < 16'h0000) || (RXDFELPM_KL_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-473] RXDFELPM_KL_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFELPM_KL_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFELPM_KL_CFG1_REG < 16'h0000) || (RXDFELPM_KL_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-474] RXDFELPM_KL_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFELPM_KL_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFELPM_KL_CFG2_REG < 16'h0000) || (RXDFELPM_KL_CFG2_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-475] RXDFELPM_KL_CFG2 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFELPM_KL_CFG2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_CFG0_REG < 16'h0000) || (RXDFE_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-476] RXDFE_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_CFG1_REG < 16'h0000) || (RXDFE_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-477] RXDFE_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_GC_CFG0_REG < 16'h0000) || (RXDFE_GC_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-478] RXDFE_GC_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_GC_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_GC_CFG1_REG < 16'h0000) || (RXDFE_GC_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-479] RXDFE_GC_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_GC_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_GC_CFG2_REG < 16'h0000) || (RXDFE_GC_CFG2_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-480] RXDFE_GC_CFG2 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_GC_CFG2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_H2_CFG0_REG < 16'h0000) || (RXDFE_H2_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-481] RXDFE_H2_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_H2_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_H2_CFG1_REG < 16'h0000) || (RXDFE_H2_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-482] RXDFE_H2_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_H2_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_H3_CFG0_REG < 16'h0000) || (RXDFE_H3_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-483] RXDFE_H3_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_H3_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_H3_CFG1_REG < 16'h0000) || (RXDFE_H3_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-484] RXDFE_H3_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_H3_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_H4_CFG0_REG < 16'h0000) || (RXDFE_H4_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-485] RXDFE_H4_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_H4_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_H4_CFG1_REG < 16'h0000) || (RXDFE_H4_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-486] RXDFE_H4_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_H4_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_H5_CFG0_REG < 16'h0000) || (RXDFE_H5_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-487] RXDFE_H5_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_H5_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_H5_CFG1_REG < 16'h0000) || (RXDFE_H5_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-488] RXDFE_H5_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_H5_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_H6_CFG0_REG < 16'h0000) || (RXDFE_H6_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-489] RXDFE_H6_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_H6_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_H6_CFG1_REG < 16'h0000) || (RXDFE_H6_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-490] RXDFE_H6_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_H6_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_H7_CFG0_REG < 16'h0000) || (RXDFE_H7_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-491] RXDFE_H7_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_H7_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_H7_CFG1_REG < 16'h0000) || (RXDFE_H7_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-492] RXDFE_H7_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_H7_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_H8_CFG0_REG < 16'h0000) || (RXDFE_H8_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-493] RXDFE_H8_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_H8_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_H8_CFG1_REG < 16'h0000) || (RXDFE_H8_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-494] RXDFE_H8_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_H8_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_H9_CFG0_REG < 16'h0000) || (RXDFE_H9_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-495] RXDFE_H9_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_H9_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_H9_CFG1_REG < 16'h0000) || (RXDFE_H9_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-496] RXDFE_H9_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_H9_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_HA_CFG0_REG < 16'h0000) || (RXDFE_HA_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-497] RXDFE_HA_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_HA_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_HA_CFG1_REG < 16'h0000) || (RXDFE_HA_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-498] RXDFE_HA_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_HA_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_HB_CFG0_REG < 16'h0000) || (RXDFE_HB_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-499] RXDFE_HB_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_HB_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_HB_CFG1_REG < 16'h0000) || (RXDFE_HB_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-500] RXDFE_HB_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_HB_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_HC_CFG0_REG < 16'h0000) || (RXDFE_HC_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-501] RXDFE_HC_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_HC_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_HC_CFG1_REG < 16'h0000) || (RXDFE_HC_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-502] RXDFE_HC_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_HC_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_HD_CFG0_REG < 16'h0000) || (RXDFE_HD_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-503] RXDFE_HD_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_HD_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_HD_CFG1_REG < 16'h0000) || (RXDFE_HD_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-504] RXDFE_HD_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_HD_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_HE_CFG0_REG < 16'h0000) || (RXDFE_HE_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-505] RXDFE_HE_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_HE_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_HE_CFG1_REG < 16'h0000) || (RXDFE_HE_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-506] RXDFE_HE_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_HE_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_HF_CFG0_REG < 16'h0000) || (RXDFE_HF_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-507] RXDFE_HF_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_HF_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_HF_CFG1_REG < 16'h0000) || (RXDFE_HF_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-508] RXDFE_HF_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_HF_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_OS_CFG0_REG < 16'h0000) || (RXDFE_OS_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-509] RXDFE_OS_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_OS_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_OS_CFG1_REG < 16'h0000) || (RXDFE_OS_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-510] RXDFE_OS_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_OS_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_PWR_SAVING_REG !== 1'b0) && (RXDFE_PWR_SAVING_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-511] RXDFE_PWR_SAVING attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RXDFE_PWR_SAVING_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_UT_CFG0_REG < 16'h0000) || (RXDFE_UT_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-512] RXDFE_UT_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_UT_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_UT_CFG1_REG < 16'h0000) || (RXDFE_UT_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-513] RXDFE_UT_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_UT_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_VP_CFG0_REG < 16'h0000) || (RXDFE_VP_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-514] RXDFE_VP_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_VP_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDFE_VP_CFG1_REG < 16'h0000) || (RXDFE_VP_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-515] RXDFE_VP_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDFE_VP_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDLY_CFG_REG < 16'h0000) || (RXDLY_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-516] RXDLY_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDLY_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXDLY_LCFG_REG < 16'h0000) || (RXDLY_LCFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-517] RXDLY_LCFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXDLY_LCFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXELECIDLE_CFG_REG != "SIGCFG_4") &&
         (RXELECIDLE_CFG_REG != "SIGCFG_1") &&
         (RXELECIDLE_CFG_REG != "SIGCFG_2") &&
         (RXELECIDLE_CFG_REG != "SIGCFG_3") &&
         (RXELECIDLE_CFG_REG != "SIGCFG_6") &&
         (RXELECIDLE_CFG_REG != "SIGCFG_8") &&
         (RXELECIDLE_CFG_REG != "SIGCFG_12") &&
         (RXELECIDLE_CFG_REG != "SIGCFG_16"))) begin
      $display("Error: [Unisim %s-518] RXELECIDLE_CFG attribute is set to %s.  Legal values for this attribute are SIGCFG_4, SIGCFG_1, SIGCFG_2, SIGCFG_3, SIGCFG_6, SIGCFG_8, SIGCFG_12 or SIGCFG_16. Instance: %m", MODULE_NAME, RXELECIDLE_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXGBOX_FIFO_INIT_RD_ADDR_REG != 4) &&
         (RXGBOX_FIFO_INIT_RD_ADDR_REG != 2) &&
         (RXGBOX_FIFO_INIT_RD_ADDR_REG != 3) &&
         (RXGBOX_FIFO_INIT_RD_ADDR_REG != 5))) begin
      $display("Error: [Unisim %s-519] RXGBOX_FIFO_INIT_RD_ADDR attribute is set to %d.  Legal values for this attribute are 4, 2, 3 or 5. Instance: %m", MODULE_NAME, RXGBOX_FIFO_INIT_RD_ADDR_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXGEARBOX_EN_REG != "FALSE") &&
         (RXGEARBOX_EN_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-520] RXGEARBOX_EN attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, RXGEARBOX_EN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXISCANRESET_TIME_REG < 5'b00000) || (RXISCANRESET_TIME_REG > 5'b11111))) begin
      $display("Error: [Unisim %s-521] RXISCANRESET_TIME attribute is set to %b.  Legal values for this attribute are 5'b00000 to 5'b11111. Instance: %m", MODULE_NAME, RXISCANRESET_TIME_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXLPM_CFG_REG < 16'h0000) || (RXLPM_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-522] RXLPM_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXLPM_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXLPM_GC_CFG_REG < 16'h0000) || (RXLPM_GC_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-523] RXLPM_GC_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXLPM_GC_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXLPM_KH_CFG0_REG < 16'h0000) || (RXLPM_KH_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-524] RXLPM_KH_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXLPM_KH_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXLPM_KH_CFG1_REG < 16'h0000) || (RXLPM_KH_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-525] RXLPM_KH_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXLPM_KH_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXLPM_OS_CFG0_REG < 16'h0000) || (RXLPM_OS_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-526] RXLPM_OS_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXLPM_OS_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXLPM_OS_CFG1_REG < 16'h0000) || (RXLPM_OS_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-527] RXLPM_OS_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXLPM_OS_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXOOB_CFG_REG < 9'b000000000) || (RXOOB_CFG_REG > 9'b111111111))) begin
      $display("Error: [Unisim %s-528] RXOOB_CFG attribute is set to %b.  Legal values for this attribute are 9'b000000000 to 9'b111111111. Instance: %m", MODULE_NAME, RXOOB_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXOOB_CLK_CFG_REG != "PMA") &&
         (RXOOB_CLK_CFG_REG != "FABRIC"))) begin
      $display("Error: [Unisim %s-529] RXOOB_CLK_CFG attribute is set to %s.  Legal values for this attribute are PMA or FABRIC. Instance: %m", MODULE_NAME, RXOOB_CLK_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXOSCALRESET_TIME_REG < 5'b00000) || (RXOSCALRESET_TIME_REG > 5'b11111))) begin
      $display("Error: [Unisim %s-530] RXOSCALRESET_TIME attribute is set to %b.  Legal values for this attribute are 5'b00000 to 5'b11111. Instance: %m", MODULE_NAME, RXOSCALRESET_TIME_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXOUT_DIV_REG != 4) &&
         (RXOUT_DIV_REG != 1) &&
         (RXOUT_DIV_REG != 2) &&
         (RXOUT_DIV_REG != 8) &&
         (RXOUT_DIV_REG != 16) &&
         (RXOUT_DIV_REG != 32))) begin
      $display("Error: [Unisim %s-531] RXOUT_DIV attribute is set to %d.  Legal values for this attribute are 4, 1, 2, 8, 16 or 32. Instance: %m", MODULE_NAME, RXOUT_DIV_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXPCSRESET_TIME_REG < 5'b00000) || (RXPCSRESET_TIME_REG > 5'b11111))) begin
      $display("Error: [Unisim %s-532] RXPCSRESET_TIME attribute is set to %b.  Legal values for this attribute are 5'b00000 to 5'b11111. Instance: %m", MODULE_NAME, RXPCSRESET_TIME_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXPHBEACON_CFG_REG < 16'h0000) || (RXPHBEACON_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-533] RXPHBEACON_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXPHBEACON_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXPHDLY_CFG_REG < 16'h0000) || (RXPHDLY_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-534] RXPHDLY_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXPHDLY_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXPHSAMP_CFG_REG < 16'h0000) || (RXPHSAMP_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-535] RXPHSAMP_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXPHSAMP_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXPHSLIP_CFG_REG < 16'h0000) || (RXPHSLIP_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-536] RXPHSLIP_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXPHSLIP_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXPH_MONITOR_SEL_REG < 5'b00000) || (RXPH_MONITOR_SEL_REG > 5'b11111))) begin
      $display("Error: [Unisim %s-537] RXPH_MONITOR_SEL attribute is set to %b.  Legal values for this attribute are 5'b00000 to 5'b11111. Instance: %m", MODULE_NAME, RXPH_MONITOR_SEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXPI_AUTO_BW_SEL_BYPASS_REG !== 1'b0) && (RXPI_AUTO_BW_SEL_BYPASS_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-538] RXPI_AUTO_BW_SEL_BYPASS attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RXPI_AUTO_BW_SEL_BYPASS_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXPI_CFG_REG < 16'h0000) || (RXPI_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-539] RXPI_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXPI_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXPI_LPM_REG !== 1'b0) && (RXPI_LPM_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-540] RXPI_LPM attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RXPI_LPM_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXPI_RSV0_REG < 16'h0000) || (RXPI_RSV0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-541] RXPI_RSV0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RXPI_RSV0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXPI_SEL_LC_REG < 2'b00) || (RXPI_SEL_LC_REG > 2'b11))) begin
      $display("Error: [Unisim %s-542] RXPI_SEL_LC attribute is set to %b.  Legal values for this attribute are 2'b00 to 2'b11. Instance: %m", MODULE_NAME, RXPI_SEL_LC_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXPI_STARTCODE_REG < 2'b00) || (RXPI_STARTCODE_REG > 2'b11))) begin
      $display("Error: [Unisim %s-543] RXPI_STARTCODE attribute is set to %b.  Legal values for this attribute are 2'b00 to 2'b11. Instance: %m", MODULE_NAME, RXPI_STARTCODE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXPI_VREFSEL_REG !== 1'b0) && (RXPI_VREFSEL_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-544] RXPI_VREFSEL attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RXPI_VREFSEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXPMACLK_SEL_REG != "DATA") &&
         (RXPMACLK_SEL_REG != "CROSSING") &&
         (RXPMACLK_SEL_REG != "EYESCAN"))) begin
      $display("Error: [Unisim %s-546] RXPMACLK_SEL attribute is set to %s.  Legal values for this attribute are DATA, CROSSING or EYESCAN. Instance: %m", MODULE_NAME, RXPMACLK_SEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXPMARESET_TIME_REG < 5'b00000) || (RXPMARESET_TIME_REG > 5'b11111))) begin
      $display("Error: [Unisim %s-547] RXPMARESET_TIME attribute is set to %b.  Legal values for this attribute are 5'b00000 to 5'b11111. Instance: %m", MODULE_NAME, RXPMARESET_TIME_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXPRBS_ERR_LOOPBACK_REG !== 1'b0) && (RXPRBS_ERR_LOOPBACK_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-548] RXPRBS_ERR_LOOPBACK attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RXPRBS_ERR_LOOPBACK_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXSLIDE_AUTO_WAIT_REG != 7) &&
         (RXSLIDE_AUTO_WAIT_REG != 1) &&
         (RXSLIDE_AUTO_WAIT_REG != 2) &&
         (RXSLIDE_AUTO_WAIT_REG != 3) &&
         (RXSLIDE_AUTO_WAIT_REG != 4) &&
         (RXSLIDE_AUTO_WAIT_REG != 5) &&
         (RXSLIDE_AUTO_WAIT_REG != 6) &&
         (RXSLIDE_AUTO_WAIT_REG != 8) &&
         (RXSLIDE_AUTO_WAIT_REG != 9) &&
         (RXSLIDE_AUTO_WAIT_REG != 10) &&
         (RXSLIDE_AUTO_WAIT_REG != 11) &&
         (RXSLIDE_AUTO_WAIT_REG != 12) &&
         (RXSLIDE_AUTO_WAIT_REG != 13) &&
         (RXSLIDE_AUTO_WAIT_REG != 14) &&
         (RXSLIDE_AUTO_WAIT_REG != 15))) begin
      $display("Error: [Unisim %s-550] RXSLIDE_AUTO_WAIT attribute is set to %d.  Legal values for this attribute are 7, 1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14 or 15. Instance: %m", MODULE_NAME, RXSLIDE_AUTO_WAIT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXSLIDE_MODE_REG != "OFF") &&
         (RXSLIDE_MODE_REG != "AUTO") &&
         (RXSLIDE_MODE_REG != "PCS") &&
         (RXSLIDE_MODE_REG != "PMA"))) begin
      $display("Error: [Unisim %s-551] RXSLIDE_MODE attribute is set to %s.  Legal values for this attribute are OFF, AUTO, PCS or PMA. Instance: %m", MODULE_NAME, RXSLIDE_MODE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXSYNC_MULTILANE_REG !== 1'b0) && (RXSYNC_MULTILANE_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-552] RXSYNC_MULTILANE attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RXSYNC_MULTILANE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXSYNC_OVRD_REG !== 1'b0) && (RXSYNC_OVRD_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-553] RXSYNC_OVRD attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RXSYNC_OVRD_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXSYNC_SKIP_DA_REG !== 1'b0) && (RXSYNC_SKIP_DA_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-554] RXSYNC_SKIP_DA attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RXSYNC_SKIP_DA_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_AFE_CM_EN_REG !== 1'b0) && (RX_AFE_CM_EN_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-555] RX_AFE_CM_EN attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RX_AFE_CM_EN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_BIAS_CFG0_REG < 16'h0000) || (RX_BIAS_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-556] RX_BIAS_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RX_BIAS_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_BUFFER_CFG_REG < 6'b000000) || (RX_BUFFER_CFG_REG > 6'b111111))) begin
      $display("Error: [Unisim %s-557] RX_BUFFER_CFG attribute is set to %b.  Legal values for this attribute are 6'b000000 to 6'b111111. Instance: %m", MODULE_NAME, RX_BUFFER_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_CAPFF_SARC_ENB_REG !== 1'b0) && (RX_CAPFF_SARC_ENB_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-558] RX_CAPFF_SARC_ENB attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RX_CAPFF_SARC_ENB_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_CLKMUX_EN_REG !== 1'b0) && (RX_CLKMUX_EN_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-560] RX_CLKMUX_EN attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RX_CLKMUX_EN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_CLK_SLIP_OVRD_REG < 5'b00000) || (RX_CLK_SLIP_OVRD_REG > 5'b11111))) begin
      $display("Error: [Unisim %s-561] RX_CLK_SLIP_OVRD attribute is set to %b.  Legal values for this attribute are 5'b00000 to 5'b11111. Instance: %m", MODULE_NAME, RX_CLK_SLIP_OVRD_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_CM_BUF_CFG_REG < 4'b0000) || (RX_CM_BUF_CFG_REG > 4'b1111))) begin
      $display("Error: [Unisim %s-562] RX_CM_BUF_CFG attribute is set to %b.  Legal values for this attribute are 4'b0000 to 4'b1111. Instance: %m", MODULE_NAME, RX_CM_BUF_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_CM_BUF_PD_REG !== 1'b0) && (RX_CM_BUF_PD_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-563] RX_CM_BUF_PD attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RX_CM_BUF_PD_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_CM_SEL_REG != 3) &&
         (RX_CM_SEL_REG != 0) &&
         (RX_CM_SEL_REG != 1) &&
         (RX_CM_SEL_REG != 2))) begin
      $display("Error: [Unisim %s-564] RX_CM_SEL attribute is set to %d.  Legal values for this attribute are 3, 0, 1 or 2. Instance: %m", MODULE_NAME, RX_CM_SEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_CM_TRIM_REG != 10) &&
         (RX_CM_TRIM_REG != 0) &&
         (RX_CM_TRIM_REG != 1) &&
         (RX_CM_TRIM_REG != 2) &&
         (RX_CM_TRIM_REG != 3) &&
         (RX_CM_TRIM_REG != 4) &&
         (RX_CM_TRIM_REG != 5) &&
         (RX_CM_TRIM_REG != 6) &&
         (RX_CM_TRIM_REG != 7) &&
         (RX_CM_TRIM_REG != 8) &&
         (RX_CM_TRIM_REG != 9) &&
         (RX_CM_TRIM_REG != 11) &&
         (RX_CM_TRIM_REG != 12) &&
         (RX_CM_TRIM_REG != 13) &&
         (RX_CM_TRIM_REG != 14) &&
         (RX_CM_TRIM_REG != 15))) begin
      $display("Error: [Unisim %s-565] RX_CM_TRIM attribute is set to %d.  Legal values for this attribute are 10, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14 or 15. Instance: %m", MODULE_NAME, RX_CM_TRIM_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_CTLE1_KHKL_REG !== 1'b0) && (RX_CTLE1_KHKL_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-566] RX_CTLE1_KHKL attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RX_CTLE1_KHKL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_CTLE2_KHKL_REG !== 1'b0) && (RX_CTLE2_KHKL_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-567] RX_CTLE2_KHKL attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RX_CTLE2_KHKL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_CTLE3_AGC_REG !== 1'b0) && (RX_CTLE3_AGC_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-568] RX_CTLE3_AGC attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RX_CTLE3_AGC_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_DATA_WIDTH_REG != 20) &&
         (RX_DATA_WIDTH_REG != 16) &&
         (RX_DATA_WIDTH_REG != 32) &&
         (RX_DATA_WIDTH_REG != 40) &&
         (RX_DATA_WIDTH_REG != 64) &&
         (RX_DATA_WIDTH_REG != 80) &&
         (RX_DATA_WIDTH_REG != 128) &&
         (RX_DATA_WIDTH_REG != 160))) begin
      $display("Error: [Unisim %s-569] RX_DATA_WIDTH attribute is set to %d.  Legal values for this attribute are 20, 16, 32, 40, 64, 80, 128 or 160. Instance: %m", MODULE_NAME, RX_DATA_WIDTH_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_DDI_SEL_REG < 6'b000000) || (RX_DDI_SEL_REG > 6'b111111))) begin
      $display("Error: [Unisim %s-570] RX_DDI_SEL attribute is set to %b.  Legal values for this attribute are 6'b000000 to 6'b111111. Instance: %m", MODULE_NAME, RX_DDI_SEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_DEFER_RESET_BUF_EN_REG != "TRUE") &&
         (RX_DEFER_RESET_BUF_EN_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-571] RX_DEFER_RESET_BUF_EN attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, RX_DEFER_RESET_BUF_EN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_DEGEN_CTRL_REG < 3'b000) || (RX_DEGEN_CTRL_REG > 3'b111))) begin
      $display("Error: [Unisim %s-572] RX_DEGEN_CTRL attribute is set to %b.  Legal values for this attribute are 3'b000 to 3'b111. Instance: %m", MODULE_NAME, RX_DEGEN_CTRL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_DFELPM_CFG0_REG != 6) &&
         (RX_DFELPM_CFG0_REG != 0) &&
         (RX_DFELPM_CFG0_REG != 1) &&
         (RX_DFELPM_CFG0_REG != 2) &&
         (RX_DFELPM_CFG0_REG != 3) &&
         (RX_DFELPM_CFG0_REG != 4) &&
         (RX_DFELPM_CFG0_REG != 5) &&
         (RX_DFELPM_CFG0_REG != 7))) begin
      $display("Error: [Unisim %s-573] RX_DFELPM_CFG0 attribute is set to %d.  Legal values for this attribute are 6, 0, 1, 2, 3, 4, 5 or 7. Instance: %m", MODULE_NAME, RX_DFELPM_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_DFELPM_CFG1_REG !== 1'b0) && (RX_DFELPM_CFG1_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-574] RX_DFELPM_CFG1 attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RX_DFELPM_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_DFELPM_KLKH_AGC_STUP_EN_REG !== 1'b0) && (RX_DFELPM_KLKH_AGC_STUP_EN_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-575] RX_DFELPM_KLKH_AGC_STUP_EN attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RX_DFELPM_KLKH_AGC_STUP_EN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_DFE_AGC_CFG0_REG < 2'b00) || (RX_DFE_AGC_CFG0_REG > 2'b11))) begin
      $display("Error: [Unisim %s-576] RX_DFE_AGC_CFG0 attribute is set to %b.  Legal values for this attribute are 2'b00 to 2'b11. Instance: %m", MODULE_NAME, RX_DFE_AGC_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_DFE_AGC_CFG1_REG != 4) &&
         (RX_DFE_AGC_CFG1_REG != 0) &&
         (RX_DFE_AGC_CFG1_REG != 1) &&
         (RX_DFE_AGC_CFG1_REG != 2) &&
         (RX_DFE_AGC_CFG1_REG != 3) &&
         (RX_DFE_AGC_CFG1_REG != 5) &&
         (RX_DFE_AGC_CFG1_REG != 6) &&
         (RX_DFE_AGC_CFG1_REG != 7))) begin
      $display("Error: [Unisim %s-577] RX_DFE_AGC_CFG1 attribute is set to %d.  Legal values for this attribute are 4, 0, 1, 2, 3, 5, 6 or 7. Instance: %m", MODULE_NAME, RX_DFE_AGC_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_DFE_KL_LPM_KH_CFG0_REG != 1) &&
         (RX_DFE_KL_LPM_KH_CFG0_REG != 0) &&
         (RX_DFE_KL_LPM_KH_CFG0_REG != 2) &&
         (RX_DFE_KL_LPM_KH_CFG0_REG != 3))) begin
      $display("Error: [Unisim %s-578] RX_DFE_KL_LPM_KH_CFG0 attribute is set to %d.  Legal values for this attribute are 1, 0, 2 or 3. Instance: %m", MODULE_NAME, RX_DFE_KL_LPM_KH_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_DFE_KL_LPM_KH_CFG1_REG != 2) &&
         (RX_DFE_KL_LPM_KH_CFG1_REG != 1) &&
         (RX_DFE_KL_LPM_KH_CFG1_REG != 3) &&
         (RX_DFE_KL_LPM_KH_CFG1_REG != 4) &&
         (RX_DFE_KL_LPM_KH_CFG1_REG != 5) &&
         (RX_DFE_KL_LPM_KH_CFG1_REG != 6) &&
         (RX_DFE_KL_LPM_KH_CFG1_REG != 7))) begin
      $display("Error: [Unisim %s-579] RX_DFE_KL_LPM_KH_CFG1 attribute is set to %d.  Legal values for this attribute are 2, 1, 3, 4, 5, 6 or 7. Instance: %m", MODULE_NAME, RX_DFE_KL_LPM_KH_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_DFE_KL_LPM_KL_CFG0_REG < 2'b00) || (RX_DFE_KL_LPM_KL_CFG0_REG > 2'b11))) begin
      $display("Error: [Unisim %s-580] RX_DFE_KL_LPM_KL_CFG0 attribute is set to %b.  Legal values for this attribute are 2'b00 to 2'b11. Instance: %m", MODULE_NAME, RX_DFE_KL_LPM_KL_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_DFE_KL_LPM_KL_CFG1_REG < 3'b000) || (RX_DFE_KL_LPM_KL_CFG1_REG > 3'b111))) begin
      $display("Error: [Unisim %s-581] RX_DFE_KL_LPM_KL_CFG1 attribute is set to %b.  Legal values for this attribute are 3'b000 to 3'b111. Instance: %m", MODULE_NAME, RX_DFE_KL_LPM_KL_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_DFE_LPM_HOLD_DURING_EIDLE_REG !== 1'b0) && (RX_DFE_LPM_HOLD_DURING_EIDLE_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-582] RX_DFE_LPM_HOLD_DURING_EIDLE attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RX_DFE_LPM_HOLD_DURING_EIDLE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_DISPERR_SEQ_MATCH_REG != "TRUE") &&
         (RX_DISPERR_SEQ_MATCH_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-583] RX_DISPERR_SEQ_MATCH attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, RX_DISPERR_SEQ_MATCH_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_DIV2_MODE_B_REG !== 1'b0) && (RX_DIV2_MODE_B_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-584] RX_DIV2_MODE_B attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RX_DIV2_MODE_B_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_DIVRESET_TIME_REG < 5'b00000) || (RX_DIVRESET_TIME_REG > 5'b11111))) begin
      $display("Error: [Unisim %s-585] RX_DIVRESET_TIME attribute is set to %b.  Legal values for this attribute are 5'b00000 to 5'b11111. Instance: %m", MODULE_NAME, RX_DIVRESET_TIME_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_EN_CTLE_RCAL_B_REG !== 1'b0) && (RX_EN_CTLE_RCAL_B_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-586] RX_EN_CTLE_RCAL_B attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RX_EN_CTLE_RCAL_B_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_EN_HI_LR_REG !== 1'b0) && (RX_EN_HI_LR_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-587] RX_EN_HI_LR attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RX_EN_HI_LR_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_EXT_RL_CTRL_REG < 9'b000000000) || (RX_EXT_RL_CTRL_REG > 9'b111111111))) begin
      $display("Error: [Unisim %s-588] RX_EXT_RL_CTRL attribute is set to %b.  Legal values for this attribute are 9'b000000000 to 9'b111111111. Instance: %m", MODULE_NAME, RX_EXT_RL_CTRL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_EYESCAN_VS_CODE_REG < 7'b0000000) || (RX_EYESCAN_VS_CODE_REG > 7'b1111111))) begin
      $display("Error: [Unisim %s-589] RX_EYESCAN_VS_CODE attribute is set to %b.  Legal values for this attribute are 7'b0000000 to 7'b1111111. Instance: %m", MODULE_NAME, RX_EYESCAN_VS_CODE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_EYESCAN_VS_NEG_DIR_REG !== 1'b0) && (RX_EYESCAN_VS_NEG_DIR_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-590] RX_EYESCAN_VS_NEG_DIR attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RX_EYESCAN_VS_NEG_DIR_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_EYESCAN_VS_RANGE_REG < 2'b00) || (RX_EYESCAN_VS_RANGE_REG > 2'b11))) begin
      $display("Error: [Unisim %s-591] RX_EYESCAN_VS_RANGE attribute is set to %b.  Legal values for this attribute are 2'b00 to 2'b11. Instance: %m", MODULE_NAME, RX_EYESCAN_VS_RANGE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_EYESCAN_VS_UT_SIGN_REG !== 1'b0) && (RX_EYESCAN_VS_UT_SIGN_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-592] RX_EYESCAN_VS_UT_SIGN attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RX_EYESCAN_VS_UT_SIGN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_FABINT_USRCLK_FLOP_REG !== 1'b0) && (RX_FABINT_USRCLK_FLOP_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-593] RX_FABINT_USRCLK_FLOP attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RX_FABINT_USRCLK_FLOP_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_INT_DATAWIDTH_REG != 1) &&
         (RX_INT_DATAWIDTH_REG != 0) &&
         (RX_INT_DATAWIDTH_REG != 2))) begin
      $display("Error: [Unisim %s-594] RX_INT_DATAWIDTH attribute is set to %d.  Legal values for this attribute are 1, 0 or 2. Instance: %m", MODULE_NAME, RX_INT_DATAWIDTH_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_PMA_POWER_SAVE_REG !== 1'b0) && (RX_PMA_POWER_SAVE_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-595] RX_PMA_POWER_SAVE attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RX_PMA_POWER_SAVE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_PROGDIV_RATE_REG < 16'h0000) || (RX_PROGDIV_RATE_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-597] RX_PROGDIV_RATE attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RX_PROGDIV_RATE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_RESLOAD_CTRL_REG < 4'b0000) || (RX_RESLOAD_CTRL_REG > 4'b1111))) begin
      $display("Error: [Unisim %s-598] RX_RESLOAD_CTRL attribute is set to %b.  Legal values for this attribute are 4'b0000 to 4'b1111. Instance: %m", MODULE_NAME, RX_RESLOAD_CTRL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_RESLOAD_OVRD_REG !== 1'b0) && (RX_RESLOAD_OVRD_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-599] RX_RESLOAD_OVRD attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RX_RESLOAD_OVRD_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_SAMPLE_PERIOD_REG < 3'b000) || (RX_SAMPLE_PERIOD_REG > 3'b111))) begin
      $display("Error: [Unisim %s-600] RX_SAMPLE_PERIOD attribute is set to %b.  Legal values for this attribute are 3'b000 to 3'b111. Instance: %m", MODULE_NAME, RX_SAMPLE_PERIOD_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_SUM_DFETAPREP_EN_REG !== 1'b0) && (RX_SUM_DFETAPREP_EN_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-602] RX_SUM_DFETAPREP_EN attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RX_SUM_DFETAPREP_EN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_SUM_IREF_TUNE_REG < 4'b0000) || (RX_SUM_IREF_TUNE_REG > 4'b1111))) begin
      $display("Error: [Unisim %s-603] RX_SUM_IREF_TUNE attribute is set to %b.  Legal values for this attribute are 4'b0000 to 4'b1111. Instance: %m", MODULE_NAME, RX_SUM_IREF_TUNE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_SUM_VCMTUNE_REG < 4'b0000) || (RX_SUM_VCMTUNE_REG > 4'b1111))) begin
      $display("Error: [Unisim %s-604] RX_SUM_VCMTUNE attribute is set to %b.  Legal values for this attribute are 4'b0000 to 4'b1111. Instance: %m", MODULE_NAME, RX_SUM_VCMTUNE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_SUM_VCM_OVWR_REG !== 1'b0) && (RX_SUM_VCM_OVWR_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-605] RX_SUM_VCM_OVWR attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RX_SUM_VCM_OVWR_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_SUM_VREF_TUNE_REG < 3'b000) || (RX_SUM_VREF_TUNE_REG > 3'b111))) begin
      $display("Error: [Unisim %s-606] RX_SUM_VREF_TUNE attribute is set to %b.  Legal values for this attribute are 3'b000 to 3'b111. Instance: %m", MODULE_NAME, RX_SUM_VREF_TUNE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_TUNE_AFE_OS_REG < 2'b00) || (RX_TUNE_AFE_OS_REG > 2'b11))) begin
      $display("Error: [Unisim %s-607] RX_TUNE_AFE_OS attribute is set to %b.  Legal values for this attribute are 2'b00 to 2'b11. Instance: %m", MODULE_NAME, RX_TUNE_AFE_OS_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_VREG_CTRL_REG < 3'b000) || (RX_VREG_CTRL_REG > 3'b111))) begin
      $display("Error: [Unisim %s-608] RX_VREG_CTRL attribute is set to %b.  Legal values for this attribute are 3'b000 to 3'b111. Instance: %m", MODULE_NAME, RX_VREG_CTRL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_VREG_PDB_REG !== 1'b0) && (RX_VREG_PDB_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-609] RX_VREG_PDB attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RX_VREG_PDB_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_WIDEMODE_CDR_REG < 2'b00) || (RX_WIDEMODE_CDR_REG > 2'b11))) begin
      $display("Error: [Unisim %s-610] RX_WIDEMODE_CDR attribute is set to %b.  Legal values for this attribute are 2'b00 to 2'b11. Instance: %m", MODULE_NAME, RX_WIDEMODE_CDR_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_XCLK_SEL_REG != "RXDES") &&
         (RX_XCLK_SEL_REG != "RXPMA") &&
         (RX_XCLK_SEL_REG != "RXUSR"))) begin
      $display("Error: [Unisim %s-611] RX_XCLK_SEL attribute is set to %s.  Legal values for this attribute are RXDES, RXPMA or RXUSR. Instance: %m", MODULE_NAME, RX_XCLK_SEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RX_XMODE_SEL_REG !== 1'b0) && (RX_XMODE_SEL_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-612] RX_XMODE_SEL attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, RX_XMODE_SEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SATA_BURST_SEQ_LEN_REG < 4'b0000) || (SATA_BURST_SEQ_LEN_REG > 4'b1111))) begin
      $display("Error: [Unisim %s-615] SATA_BURST_SEQ_LEN attribute is set to %b.  Legal values for this attribute are 4'b0000 to 4'b1111. Instance: %m", MODULE_NAME, SATA_BURST_SEQ_LEN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SATA_BURST_VAL_REG < 3'b000) || (SATA_BURST_VAL_REG > 3'b111))) begin
      $display("Error: [Unisim %s-616] SATA_BURST_VAL attribute is set to %b.  Legal values for this attribute are 3'b000 to 3'b111. Instance: %m", MODULE_NAME, SATA_BURST_VAL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SATA_CPLL_CFG_REG != "VCO_3000MHZ") &&
         (SATA_CPLL_CFG_REG != "VCO_750MHZ") &&
         (SATA_CPLL_CFG_REG != "VCO_1500MHZ"))) begin
      $display("Error: [Unisim %s-617] SATA_CPLL_CFG attribute is set to %s.  Legal values for this attribute are VCO_3000MHZ, VCO_750MHZ or VCO_1500MHZ. Instance: %m", MODULE_NAME, SATA_CPLL_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SATA_EIDLE_VAL_REG < 3'b000) || (SATA_EIDLE_VAL_REG > 3'b111))) begin
      $display("Error: [Unisim %s-618] SATA_EIDLE_VAL attribute is set to %b.  Legal values for this attribute are 3'b000 to 3'b111. Instance: %m", MODULE_NAME, SATA_EIDLE_VAL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SHOW_REALIGN_COMMA_REG != "TRUE") &&
         (SHOW_REALIGN_COMMA_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-625] SHOW_REALIGN_COMMA attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, SHOW_REALIGN_COMMA_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SIM_RECEIVER_DETECT_PASS_REG != "TRUE") &&
         (SIM_RECEIVER_DETECT_PASS_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-626] SIM_RECEIVER_DETECT_PASS attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, SIM_RECEIVER_DETECT_PASS_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SIM_RESET_SPEEDUP_REG != "TRUE") &&
         (SIM_RESET_SPEEDUP_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-627] SIM_RESET_SPEEDUP attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, SIM_RESET_SPEEDUP_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SIM_TX_EIDLE_DRIVE_LEVEL_REG !== 1'b0) && (SIM_TX_EIDLE_DRIVE_LEVEL_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-628] SIM_TX_EIDLE_DRIVE_LEVEL attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, SIM_TX_EIDLE_DRIVE_LEVEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TAPDLY_SET_TX_REG < 2'h0) || (TAPDLY_SET_TX_REG > 2'h3))) begin
      $display("Error: [Unisim %s-630] TAPDLY_SET_TX attribute is set to %h.  Legal values for this attribute are 2'h0 to 2'h3. Instance: %m", MODULE_NAME, TAPDLY_SET_TX_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TEMPERATURE_PAR_REG < 4'b0000) || (TEMPERATURE_PAR_REG > 4'b1111))) begin
      $display("Error: [Unisim %s-631] TEMPERATURE_PAR attribute is set to %b.  Legal values for this attribute are 4'b0000 to 4'b1111. Instance: %m", MODULE_NAME, TEMPERATURE_PAR_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TERM_RCAL_CFG_REG < 15'b000000000000000) || (TERM_RCAL_CFG_REG > 15'b111111111111111))) begin
      $display("Error: [Unisim %s-632] TERM_RCAL_CFG attribute is set to %b.  Legal values for this attribute are 15'b000000000000000 to 15'b111111111111111. Instance: %m", MODULE_NAME, TERM_RCAL_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TERM_RCAL_OVRD_REG < 3'b000) || (TERM_RCAL_OVRD_REG > 3'b111))) begin
      $display("Error: [Unisim %s-633] TERM_RCAL_OVRD attribute is set to %b.  Legal values for this attribute are 3'b000 to 3'b111. Instance: %m", MODULE_NAME, TERM_RCAL_OVRD_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TRANS_TIME_RATE_REG < 8'h00) || (TRANS_TIME_RATE_REG > 8'hFF))) begin
      $display("Error: [Unisim %s-634] TRANS_TIME_RATE attribute is set to %h.  Legal values for this attribute are 8'h00 to 8'hFF. Instance: %m", MODULE_NAME, TRANS_TIME_RATE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TST_RSV0_REG < 8'h00) || (TST_RSV0_REG > 8'hFF))) begin
      $display("Error: [Unisim %s-635] TST_RSV0 attribute is set to %h.  Legal values for this attribute are 8'h00 to 8'hFF. Instance: %m", MODULE_NAME, TST_RSV0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TST_RSV1_REG < 8'h00) || (TST_RSV1_REG > 8'hFF))) begin
      $display("Error: [Unisim %s-636] TST_RSV1 attribute is set to %h.  Legal values for this attribute are 8'h00 to 8'hFF. Instance: %m", MODULE_NAME, TST_RSV1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXBUF_EN_REG != "TRUE") &&
         (TXBUF_EN_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-637] TXBUF_EN attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, TXBUF_EN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXBUF_RESET_ON_RATE_CHANGE_REG != "FALSE") &&
         (TXBUF_RESET_ON_RATE_CHANGE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-638] TXBUF_RESET_ON_RATE_CHANGE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TXBUF_RESET_ON_RATE_CHANGE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXDLY_CFG_REG < 16'h0000) || (TXDLY_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-639] TXDLY_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, TXDLY_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXDLY_LCFG_REG < 16'h0000) || (TXDLY_LCFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-640] TXDLY_LCFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, TXDLY_LCFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXFIFO_ADDR_CFG_REG != "LOW") &&
         (TXFIFO_ADDR_CFG_REG != "HIGH"))) begin
      $display("Error: [Unisim %s-641] TXFIFO_ADDR_CFG attribute is set to %s.  Legal values for this attribute are LOW or HIGH. Instance: %m", MODULE_NAME, TXFIFO_ADDR_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXGBOX_FIFO_INIT_RD_ADDR_REG != 4) &&
         (TXGBOX_FIFO_INIT_RD_ADDR_REG != 2) &&
         (TXGBOX_FIFO_INIT_RD_ADDR_REG != 3) &&
         (TXGBOX_FIFO_INIT_RD_ADDR_REG != 5) &&
         (TXGBOX_FIFO_INIT_RD_ADDR_REG != 6))) begin
      $display("Error: [Unisim %s-642] TXGBOX_FIFO_INIT_RD_ADDR attribute is set to %d.  Legal values for this attribute are 4, 2, 3, 5 or 6. Instance: %m", MODULE_NAME, TXGBOX_FIFO_INIT_RD_ADDR_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXGEARBOX_EN_REG != "FALSE") &&
         (TXGEARBOX_EN_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-643] TXGEARBOX_EN attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TXGEARBOX_EN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXOUT_DIV_REG != 4) &&
         (TXOUT_DIV_REG != 1) &&
         (TXOUT_DIV_REG != 2) &&
         (TXOUT_DIV_REG != 8) &&
         (TXOUT_DIV_REG != 16) &&
         (TXOUT_DIV_REG != 32))) begin
      $display("Error: [Unisim %s-645] TXOUT_DIV attribute is set to %d.  Legal values for this attribute are 4, 1, 2, 8, 16 or 32. Instance: %m", MODULE_NAME, TXOUT_DIV_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXPCSRESET_TIME_REG < 5'b00000) || (TXPCSRESET_TIME_REG > 5'b11111))) begin
      $display("Error: [Unisim %s-646] TXPCSRESET_TIME attribute is set to %b.  Legal values for this attribute are 5'b00000 to 5'b11111. Instance: %m", MODULE_NAME, TXPCSRESET_TIME_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXPHDLY_CFG0_REG < 16'h0000) || (TXPHDLY_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-647] TXPHDLY_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, TXPHDLY_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXPHDLY_CFG1_REG < 16'h0000) || (TXPHDLY_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-648] TXPHDLY_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, TXPHDLY_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXPH_CFG2_REG < 16'h0000) || (TXPH_CFG2_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-650] TXPH_CFG2 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, TXPH_CFG2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXPH_CFG_REG < 16'h0000) || (TXPH_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-649] TXPH_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, TXPH_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXPH_MONITOR_SEL_REG < 5'b00000) || (TXPH_MONITOR_SEL_REG > 5'b11111))) begin
      $display("Error: [Unisim %s-651] TXPH_MONITOR_SEL attribute is set to %b.  Legal values for this attribute are 5'b00000 to 5'b11111. Instance: %m", MODULE_NAME, TXPH_MONITOR_SEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXPI_CFG0_REG < 2'b00) || (TXPI_CFG0_REG > 2'b11))) begin
      $display("Error: [Unisim %s-652] TXPI_CFG0 attribute is set to %b.  Legal values for this attribute are 2'b00 to 2'b11. Instance: %m", MODULE_NAME, TXPI_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXPI_CFG1_REG < 2'b00) || (TXPI_CFG1_REG > 2'b11))) begin
      $display("Error: [Unisim %s-653] TXPI_CFG1 attribute is set to %b.  Legal values for this attribute are 2'b00 to 2'b11. Instance: %m", MODULE_NAME, TXPI_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXPI_CFG2_REG < 2'b00) || (TXPI_CFG2_REG > 2'b11))) begin
      $display("Error: [Unisim %s-654] TXPI_CFG2 attribute is set to %b.  Legal values for this attribute are 2'b00 to 2'b11. Instance: %m", MODULE_NAME, TXPI_CFG2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXPI_CFG3_REG !== 1'b0) && (TXPI_CFG3_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-655] TXPI_CFG3 attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TXPI_CFG3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXPI_CFG4_REG !== 1'b0) && (TXPI_CFG4_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-656] TXPI_CFG4 attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TXPI_CFG4_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXPI_CFG5_REG < 3'b000) || (TXPI_CFG5_REG > 3'b111))) begin
      $display("Error: [Unisim %s-657] TXPI_CFG5 attribute is set to %b.  Legal values for this attribute are 3'b000 to 3'b111. Instance: %m", MODULE_NAME, TXPI_CFG5_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXPI_GRAY_SEL_REG !== 1'b0) && (TXPI_GRAY_SEL_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-658] TXPI_GRAY_SEL attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TXPI_GRAY_SEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXPI_INVSTROBE_SEL_REG !== 1'b0) && (TXPI_INVSTROBE_SEL_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-659] TXPI_INVSTROBE_SEL attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TXPI_INVSTROBE_SEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXPI_LPM_REG !== 1'b0) && (TXPI_LPM_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-660] TXPI_LPM attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TXPI_LPM_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXPI_PPMCLK_SEL_REG != "TXUSRCLK2") &&
         (TXPI_PPMCLK_SEL_REG != "TXUSRCLK"))) begin
      $display("Error: [Unisim %s-661] TXPI_PPMCLK_SEL attribute is set to %s.  Legal values for this attribute are TXUSRCLK2 or TXUSRCLK. Instance: %m", MODULE_NAME, TXPI_PPMCLK_SEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXPI_PPM_CFG_REG < 8'b00000000) || (TXPI_PPM_CFG_REG > 8'b11111111))) begin
      $display("Error: [Unisim %s-662] TXPI_PPM_CFG attribute is set to %b.  Legal values for this attribute are 8'b00000000 to 8'b11111111. Instance: %m", MODULE_NAME, TXPI_PPM_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXPI_RSV0_REG < 16'h0000) || (TXPI_RSV0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-663] TXPI_RSV0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, TXPI_RSV0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXPI_SYNFREQ_PPM_REG < 3'b000) || (TXPI_SYNFREQ_PPM_REG > 3'b111))) begin
      $display("Error: [Unisim %s-664] TXPI_SYNFREQ_PPM attribute is set to %b.  Legal values for this attribute are 3'b000 to 3'b111. Instance: %m", MODULE_NAME, TXPI_SYNFREQ_PPM_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXPI_VREFSEL_REG !== 1'b0) && (TXPI_VREFSEL_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-665] TXPI_VREFSEL attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TXPI_VREFSEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXPMARESET_TIME_REG < 5'b00000) || (TXPMARESET_TIME_REG > 5'b11111))) begin
      $display("Error: [Unisim %s-666] TXPMARESET_TIME attribute is set to %b.  Legal values for this attribute are 5'b00000 to 5'b11111. Instance: %m", MODULE_NAME, TXPMARESET_TIME_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXSYNC_MULTILANE_REG !== 1'b0) && (TXSYNC_MULTILANE_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-667] TXSYNC_MULTILANE attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TXSYNC_MULTILANE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXSYNC_OVRD_REG !== 1'b0) && (TXSYNC_OVRD_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-668] TXSYNC_OVRD attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TXSYNC_OVRD_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TXSYNC_SKIP_DA_REG !== 1'b0) && (TXSYNC_SKIP_DA_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-669] TXSYNC_SKIP_DA attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TXSYNC_SKIP_DA_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_CLKMUX_EN_REG !== 1'b0) && (TX_CLKMUX_EN_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-671] TX_CLKMUX_EN attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TX_CLKMUX_EN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_CLKREG_PDB_REG !== 1'b0) && (TX_CLKREG_PDB_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-672] TX_CLKREG_PDB attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TX_CLKREG_PDB_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_CLKREG_SET_REG < 3'b000) || (TX_CLKREG_SET_REG > 3'b111))) begin
      $display("Error: [Unisim %s-673] TX_CLKREG_SET attribute is set to %b.  Legal values for this attribute are 3'b000 to 3'b111. Instance: %m", MODULE_NAME, TX_CLKREG_SET_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_DATA_WIDTH_REG != 20) &&
         (TX_DATA_WIDTH_REG != 16) &&
         (TX_DATA_WIDTH_REG != 32) &&
         (TX_DATA_WIDTH_REG != 40) &&
         (TX_DATA_WIDTH_REG != 64) &&
         (TX_DATA_WIDTH_REG != 80) &&
         (TX_DATA_WIDTH_REG != 128) &&
         (TX_DATA_WIDTH_REG != 160))) begin
      $display("Error: [Unisim %s-674] TX_DATA_WIDTH attribute is set to %d.  Legal values for this attribute are 20, 16, 32, 40, 64, 80, 128 or 160. Instance: %m", MODULE_NAME, TX_DATA_WIDTH_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_DCD_CFG_REG < 6'b000000) || (TX_DCD_CFG_REG > 6'b111111))) begin
      $display("Error: [Unisim %s-675] TX_DCD_CFG attribute is set to %b.  Legal values for this attribute are 6'b000000 to 6'b111111. Instance: %m", MODULE_NAME, TX_DCD_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_DCD_EN_REG !== 1'b0) && (TX_DCD_EN_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-676] TX_DCD_EN attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TX_DCD_EN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_DEEMPH0_REG < 6'b000000) || (TX_DEEMPH0_REG > 6'b111111))) begin
      $display("Error: [Unisim %s-677] TX_DEEMPH0 attribute is set to %b.  Legal values for this attribute are 6'b000000 to 6'b111111. Instance: %m", MODULE_NAME, TX_DEEMPH0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_DEEMPH1_REG < 6'b000000) || (TX_DEEMPH1_REG > 6'b111111))) begin
      $display("Error: [Unisim %s-678] TX_DEEMPH1 attribute is set to %b.  Legal values for this attribute are 6'b000000 to 6'b111111. Instance: %m", MODULE_NAME, TX_DEEMPH1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_DIVRESET_TIME_REG < 5'b00000) || (TX_DIVRESET_TIME_REG > 5'b11111))) begin
      $display("Error: [Unisim %s-679] TX_DIVRESET_TIME attribute is set to %b.  Legal values for this attribute are 5'b00000 to 5'b11111. Instance: %m", MODULE_NAME, TX_DIVRESET_TIME_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_DRIVE_MODE_REG != "DIRECT") &&
         (TX_DRIVE_MODE_REG != "PIPE") &&
         (TX_DRIVE_MODE_REG != "PIPEGEN3"))) begin
      $display("Error: [Unisim %s-680] TX_DRIVE_MODE attribute is set to %s.  Legal values for this attribute are DIRECT, PIPE or PIPEGEN3. Instance: %m", MODULE_NAME, TX_DRIVE_MODE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_DRVMUX_CTRL_REG != 2) &&
         (TX_DRVMUX_CTRL_REG != 0) &&
         (TX_DRVMUX_CTRL_REG != 1) &&
         (TX_DRVMUX_CTRL_REG != 3))) begin
      $display("Error: [Unisim %s-681] TX_DRVMUX_CTRL attribute is set to %d.  Legal values for this attribute are 2, 0, 1 or 3. Instance: %m", MODULE_NAME, TX_DRVMUX_CTRL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_EIDLE_ASSERT_DELAY_REG < 3'b000) || (TX_EIDLE_ASSERT_DELAY_REG > 3'b111))) begin
      $display("Error: [Unisim %s-682] TX_EIDLE_ASSERT_DELAY attribute is set to %b.  Legal values for this attribute are 3'b000 to 3'b111. Instance: %m", MODULE_NAME, TX_EIDLE_ASSERT_DELAY_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_EIDLE_DEASSERT_DELAY_REG < 3'b000) || (TX_EIDLE_DEASSERT_DELAY_REG > 3'b111))) begin
      $display("Error: [Unisim %s-683] TX_EIDLE_DEASSERT_DELAY attribute is set to %b.  Legal values for this attribute are 3'b000 to 3'b111. Instance: %m", MODULE_NAME, TX_EIDLE_DEASSERT_DELAY_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_EML_PHI_TUNE_REG !== 1'b0) && (TX_EML_PHI_TUNE_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-684] TX_EML_PHI_TUNE attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TX_EML_PHI_TUNE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_FABINT_USRCLK_FLOP_REG !== 1'b0) && (TX_FABINT_USRCLK_FLOP_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-685] TX_FABINT_USRCLK_FLOP attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TX_FABINT_USRCLK_FLOP_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_FIFO_BYP_EN_REG !== 1'b0) && (TX_FIFO_BYP_EN_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-686] TX_FIFO_BYP_EN attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TX_FIFO_BYP_EN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_IDLE_DATA_ZERO_REG !== 1'b0) && (TX_IDLE_DATA_ZERO_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-687] TX_IDLE_DATA_ZERO attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TX_IDLE_DATA_ZERO_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_INT_DATAWIDTH_REG != 1) &&
         (TX_INT_DATAWIDTH_REG != 0) &&
         (TX_INT_DATAWIDTH_REG != 2))) begin
      $display("Error: [Unisim %s-688] TX_INT_DATAWIDTH attribute is set to %d.  Legal values for this attribute are 1, 0 or 2. Instance: %m", MODULE_NAME, TX_INT_DATAWIDTH_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_LOOPBACK_DRIVE_HIZ_REG != "FALSE") &&
         (TX_LOOPBACK_DRIVE_HIZ_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-689] TX_LOOPBACK_DRIVE_HIZ attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX_LOOPBACK_DRIVE_HIZ_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_MAINCURSOR_SEL_REG !== 1'b0) && (TX_MAINCURSOR_SEL_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-690] TX_MAINCURSOR_SEL attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TX_MAINCURSOR_SEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_MARGIN_FULL_0_REG < 7'b0000000) || (TX_MARGIN_FULL_0_REG > 7'b1111111))) begin
      $display("Error: [Unisim %s-691] TX_MARGIN_FULL_0 attribute is set to %b.  Legal values for this attribute are 7'b0000000 to 7'b1111111. Instance: %m", MODULE_NAME, TX_MARGIN_FULL_0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_MARGIN_FULL_1_REG < 7'b0000000) || (TX_MARGIN_FULL_1_REG > 7'b1111111))) begin
      $display("Error: [Unisim %s-692] TX_MARGIN_FULL_1 attribute is set to %b.  Legal values for this attribute are 7'b0000000 to 7'b1111111. Instance: %m", MODULE_NAME, TX_MARGIN_FULL_1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_MARGIN_FULL_2_REG < 7'b0000000) || (TX_MARGIN_FULL_2_REG > 7'b1111111))) begin
      $display("Error: [Unisim %s-693] TX_MARGIN_FULL_2 attribute is set to %b.  Legal values for this attribute are 7'b0000000 to 7'b1111111. Instance: %m", MODULE_NAME, TX_MARGIN_FULL_2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_MARGIN_FULL_3_REG < 7'b0000000) || (TX_MARGIN_FULL_3_REG > 7'b1111111))) begin
      $display("Error: [Unisim %s-694] TX_MARGIN_FULL_3 attribute is set to %b.  Legal values for this attribute are 7'b0000000 to 7'b1111111. Instance: %m", MODULE_NAME, TX_MARGIN_FULL_3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_MARGIN_FULL_4_REG < 7'b0000000) || (TX_MARGIN_FULL_4_REG > 7'b1111111))) begin
      $display("Error: [Unisim %s-695] TX_MARGIN_FULL_4 attribute is set to %b.  Legal values for this attribute are 7'b0000000 to 7'b1111111. Instance: %m", MODULE_NAME, TX_MARGIN_FULL_4_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_MARGIN_LOW_0_REG < 7'b0000000) || (TX_MARGIN_LOW_0_REG > 7'b1111111))) begin
      $display("Error: [Unisim %s-696] TX_MARGIN_LOW_0 attribute is set to %b.  Legal values for this attribute are 7'b0000000 to 7'b1111111. Instance: %m", MODULE_NAME, TX_MARGIN_LOW_0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_MARGIN_LOW_1_REG < 7'b0000000) || (TX_MARGIN_LOW_1_REG > 7'b1111111))) begin
      $display("Error: [Unisim %s-697] TX_MARGIN_LOW_1 attribute is set to %b.  Legal values for this attribute are 7'b0000000 to 7'b1111111. Instance: %m", MODULE_NAME, TX_MARGIN_LOW_1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_MARGIN_LOW_2_REG < 7'b0000000) || (TX_MARGIN_LOW_2_REG > 7'b1111111))) begin
      $display("Error: [Unisim %s-698] TX_MARGIN_LOW_2 attribute is set to %b.  Legal values for this attribute are 7'b0000000 to 7'b1111111. Instance: %m", MODULE_NAME, TX_MARGIN_LOW_2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_MARGIN_LOW_3_REG < 7'b0000000) || (TX_MARGIN_LOW_3_REG > 7'b1111111))) begin
      $display("Error: [Unisim %s-699] TX_MARGIN_LOW_3 attribute is set to %b.  Legal values for this attribute are 7'b0000000 to 7'b1111111. Instance: %m", MODULE_NAME, TX_MARGIN_LOW_3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_MARGIN_LOW_4_REG < 7'b0000000) || (TX_MARGIN_LOW_4_REG > 7'b1111111))) begin
      $display("Error: [Unisim %s-700] TX_MARGIN_LOW_4 attribute is set to %b.  Legal values for this attribute are 7'b0000000 to 7'b1111111. Instance: %m", MODULE_NAME, TX_MARGIN_LOW_4_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_MODE_SEL_REG < 3'b000) || (TX_MODE_SEL_REG > 3'b111))) begin
      $display("Error: [Unisim %s-701] TX_MODE_SEL attribute is set to %b.  Legal values for this attribute are 3'b000 to 3'b111. Instance: %m", MODULE_NAME, TX_MODE_SEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_PHICAL_CFG0_REG < 16'h0000) || (TX_PHICAL_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-702] TX_PHICAL_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, TX_PHICAL_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_PHICAL_CFG1_REG < 16'h0000) || (TX_PHICAL_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-703] TX_PHICAL_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, TX_PHICAL_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_PHICAL_CFG2_REG < 16'h0000) || (TX_PHICAL_CFG2_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-704] TX_PHICAL_CFG2 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, TX_PHICAL_CFG2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_PI_BIASSET_REG != 0) &&
         (TX_PI_BIASSET_REG != 1) &&
         (TX_PI_BIASSET_REG != 2) &&
         (TX_PI_BIASSET_REG != 3))) begin
      $display("Error: [Unisim %s-705] TX_PI_BIASSET attribute is set to %d.  Legal values for this attribute are 0, 1, 2 or 3. Instance: %m", MODULE_NAME, TX_PI_BIASSET_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_PI_CFG0_REG < 16'h0000) || (TX_PI_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-706] TX_PI_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, TX_PI_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_PI_CFG1_REG < 16'h0000) || (TX_PI_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-707] TX_PI_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, TX_PI_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_PI_DIV2_MODE_B_REG !== 1'b0) && (TX_PI_DIV2_MODE_B_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-708] TX_PI_DIV2_MODE_B attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TX_PI_DIV2_MODE_B_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_PI_SEL_QPLL0_REG !== 1'b0) && (TX_PI_SEL_QPLL0_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-709] TX_PI_SEL_QPLL0 attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TX_PI_SEL_QPLL0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_PI_SEL_QPLL1_REG !== 1'b0) && (TX_PI_SEL_QPLL1_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-710] TX_PI_SEL_QPLL1 attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TX_PI_SEL_QPLL1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_PMADATA_OPT_REG !== 1'b0) && (TX_PMADATA_OPT_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-711] TX_PMADATA_OPT attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TX_PMADATA_OPT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_PMA_POWER_SAVE_REG !== 1'b0) && (TX_PMA_POWER_SAVE_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-712] TX_PMA_POWER_SAVE attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TX_PMA_POWER_SAVE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_PREDRV_CTRL_REG != 2) &&
         (TX_PREDRV_CTRL_REG != 0) &&
         (TX_PREDRV_CTRL_REG != 1) &&
         (TX_PREDRV_CTRL_REG != 3))) begin
      $display("Error: [Unisim %s-713] TX_PREDRV_CTRL attribute is set to %d.  Legal values for this attribute are 2, 0, 1 or 3. Instance: %m", MODULE_NAME, TX_PREDRV_CTRL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_PROGCLK_SEL_REG != "POSTPI") &&
         (TX_PROGCLK_SEL_REG != "CPLL") &&
         (TX_PROGCLK_SEL_REG != "PREPI"))) begin
      $display("Error: [Unisim %s-714] TX_PROGCLK_SEL attribute is set to %s.  Legal values for this attribute are POSTPI, CPLL or PREPI. Instance: %m", MODULE_NAME, TX_PROGCLK_SEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_PROGDIV_RATE_REG < 16'h0000) || (TX_PROGDIV_RATE_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-716] TX_PROGDIV_RATE attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, TX_PROGDIV_RATE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_RXDETECT_CFG_REG < 14'h0000) || (TX_RXDETECT_CFG_REG > 14'h3FFF))) begin
      $display("Error: [Unisim %s-717] TX_RXDETECT_CFG attribute is set to %h.  Legal values for this attribute are 14'h0000 to 14'h3FFF. Instance: %m", MODULE_NAME, TX_RXDETECT_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_RXDETECT_REF_REG != 4) &&
         (TX_RXDETECT_REF_REG != 0) &&
         (TX_RXDETECT_REF_REG != 1) &&
         (TX_RXDETECT_REF_REG != 2) &&
         (TX_RXDETECT_REF_REG != 3) &&
         (TX_RXDETECT_REF_REG != 5) &&
         (TX_RXDETECT_REF_REG != 6) &&
         (TX_RXDETECT_REF_REG != 7))) begin
      $display("Error: [Unisim %s-718] TX_RXDETECT_REF attribute is set to %d.  Legal values for this attribute are 4, 0, 1, 2, 3, 5, 6 or 7. Instance: %m", MODULE_NAME, TX_RXDETECT_REF_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_SAMPLE_PERIOD_REG < 3'b000) || (TX_SAMPLE_PERIOD_REG > 3'b111))) begin
      $display("Error: [Unisim %s-719] TX_SAMPLE_PERIOD attribute is set to %b.  Legal values for this attribute are 3'b000 to 3'b111. Instance: %m", MODULE_NAME, TX_SAMPLE_PERIOD_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_SARC_LPBK_ENB_REG !== 1'b0) && (TX_SARC_LPBK_ENB_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-720] TX_SARC_LPBK_ENB attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, TX_SARC_LPBK_ENB_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((TX_XCLK_SEL_REG != "TXOUT") &&
         (TX_XCLK_SEL_REG != "TXUSR"))) begin
      $display("Error: [Unisim %s-729] TX_XCLK_SEL attribute is set to %s.  Legal values for this attribute are TXOUT or TXUSR. Instance: %m", MODULE_NAME, TX_XCLK_SEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((USE_PCS_CLK_PHASE_SEL_REG !== 1'b0) && (USE_PCS_CLK_PHASE_SEL_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-730] USE_PCS_CLK_PHASE_SEL attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, USE_PCS_CLK_PHASE_SEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
   ((RX_PROGDIV_CFG_REG != 0.0) &&
      (RX_PROGDIV_CFG_REG != 4.0) &&
      (RX_PROGDIV_CFG_REG != 5.0) &&
      (RX_PROGDIV_CFG_REG != 8.0) &&
      (RX_PROGDIV_CFG_REG != 10.0) &&
      (RX_PROGDIV_CFG_REG != 16.0) &&
      (RX_PROGDIV_CFG_REG != 16.5) &&
      (RX_PROGDIV_CFG_REG != 20.0) &&
      (RX_PROGDIV_CFG_REG != 32.0) &&
      (RX_PROGDIV_CFG_REG != 33.0) &&
      (RX_PROGDIV_CFG_REG != 40.0) &&
      (RX_PROGDIV_CFG_REG != 64.0) &&
      (RX_PROGDIV_CFG_REG != 66.0) &&
      (RX_PROGDIV_CFG_REG != 80.0) &&
      (RX_PROGDIV_CFG_REG != 100.0))) begin
    $display("Error: [Unisim %s-596] RX_PROGDIV_CFG attribute is set to %f.  Legal values for this attribute are 0.0, 4.0, 5.0, 8.0, 10.0, 16.0, 16.5, 20.0, 32.0, 33.0, 40.0, 64.0, 66.0, 80.0 or 100.0. Instance: %m", MODULE_NAME, RX_PROGDIV_CFG_REG);
    attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
   ((SIM_VERSION_REG != 1.0) &&
      (SIM_VERSION_REG != 2.0))) begin
    $display("Error: [Unisim %s-629] SIM_VERSION attribute is set to %f.  Legal values for this attribute are 1.0 or 2.0. Instance: %m", MODULE_NAME, SIM_VERSION_REG);
    attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
   ((TX_PROGDIV_CFG_REG != 0.0) &&
      (TX_PROGDIV_CFG_REG != 4.0) &&
      (TX_PROGDIV_CFG_REG != 5.0) &&
      (TX_PROGDIV_CFG_REG != 8.0) &&
      (TX_PROGDIV_CFG_REG != 10.0) &&
      (TX_PROGDIV_CFG_REG != 16.0) &&
      (TX_PROGDIV_CFG_REG != 16.5) &&
      (TX_PROGDIV_CFG_REG != 20.0) &&
      (TX_PROGDIV_CFG_REG != 32.0) &&
      (TX_PROGDIV_CFG_REG != 33.0) &&
      (TX_PROGDIV_CFG_REG != 40.0) &&
      (TX_PROGDIV_CFG_REG != 64.0) &&
      (TX_PROGDIV_CFG_REG != 66.0) &&
      (TX_PROGDIV_CFG_REG != 80.0) &&
      (TX_PROGDIV_CFG_REG != 100.0))) begin
    $display("Error: [Unisim %s-715] TX_PROGDIV_CFG attribute is set to %f.  Legal values for this attribute are 0.0, 4.0, 5.0, 8.0, 10.0, 16.0, 16.5, 20.0, 32.0, 33.0, 40.0, 64.0, 66.0, 80.0 or 100.0. Instance: %m", MODULE_NAME, TX_PROGDIV_CFG_REG);
    attr_err = 1'b1;
    end

    if (attr_err == 1'b1) $finish;
  end

assign PMASCANCLK0_in = 1'b1; // tie off
assign PMASCANCLK1_in = 1'b1; // tie off
assign PMASCANCLK2_in = 1'b1; // tie off
assign PMASCANCLK3_in = 1'b1; // tie off
assign PMASCANCLK4_in = 1'b1; // tie off
assign PMASCANCLK5_in = 1'b1; // tie off
assign SCANCLK_in = 1'b1; // tie off
assign TSTCLK0_in = 1'b1; // tie off
assign TSTCLK1_in = 1'b1; // tie off

assign PMASCANENB_in = 1'b1; // tie off
assign PMASCANIN_in = 12'b111111111111; // tie off
assign PMASCANMODEB_in = 1'b1; // tie off
assign PMASCANRSTEN_in = 1'b1; // tie off
assign SARCCLK_in = 1'b1; // tie off
assign SCANENB_in = 1'b1; // tie off
assign SCANIN_in = 19'b1111111111111111111; // tie off
assign SCANMODEB_in = 1'b1; // tie off
assign TSTPDOVRDB_in = 1'b1; // tie off
assign TSTPD_in = 5'b11111; // tie off

SIP_GTYE3_CHANNEL #(
   .SIM_RECEIVER_DETECT_PASS  (SIM_RECEIVER_DETECT_PASS),
   .SIM_RESET_SPEEDUP         (SIM_RESET_SPEEDUP),
   .SIM_TX_EIDLE_DRIVE_LEVEL  (SIM_TX_EIDLE_DRIVE_LEVEL),
   .SIM_VERSION               (SIM_VERSION)
) SIP_GTYE3_CHANNEL_INST (
  .ACJTAG_DEBUG_MODE (ACJTAG_DEBUG_MODE_REG),
  .ACJTAG_MODE (ACJTAG_MODE_REG),
  .ACJTAG_RESET (ACJTAG_RESET_REG),
  .ADAPT_CFG0 (ADAPT_CFG0_REG),
  .ADAPT_CFG1 (ADAPT_CFG1_REG),
  .ADAPT_CFG2 (ADAPT_CFG2_REG),
  .AEN_CDRSTEPSEL (AEN_CDRSTEPSEL_REG),
  .AEN_CPLL (AEN_CPLL_REG),
  .AEN_ELPCAL (AEN_ELPCAL_REG),
  .AEN_EYESCAN (AEN_EYESCAN_REG),
  .AEN_LOOPBACK (AEN_LOOPBACK_REG),
  .AEN_MASTER (AEN_MASTER_REG),
  .AEN_MUXDCD (AEN_MUXDCD_REG),
  .AEN_PD_AND_EIDLE (AEN_PD_AND_EIDLE_REG),
  .AEN_POLARITY (AEN_POLARITY_REG),
  .AEN_PRBS (AEN_PRBS_REG),
  .AEN_RESET (AEN_RESET_REG),
  .AEN_RXCDR (AEN_RXCDR_REG),
  .AEN_RXDFE (AEN_RXDFE_REG),
  .AEN_RXDFELPM (AEN_RXDFELPM_REG),
  .AEN_RXOUTCLK_SEL (AEN_RXOUTCLK_SEL_REG),
  .AEN_RXPHDLY (AEN_RXPHDLY_REG),
  .AEN_RXPLLCLK_SEL (AEN_RXPLLCLK_SEL_REG),
  .AEN_RXSYSCLK_SEL (AEN_RXSYSCLK_SEL_REG),
  .AEN_TXOUTCLK_SEL (AEN_TXOUTCLK_SEL_REG),
  .AEN_TXPHDLY (AEN_TXPHDLY_REG),
  .AEN_TXPI_PPM (AEN_TXPI_PPM_REG),
  .AEN_TXPLLCLK_SEL (AEN_TXPLLCLK_SEL_REG),
  .AEN_TXSYSCLK_SEL (AEN_TXSYSCLK_SEL_REG),
  .AEN_TX_DRIVE_MODE (AEN_TX_DRIVE_MODE_REG),
  .ALIGN_COMMA_DOUBLE (ALIGN_COMMA_DOUBLE_REG),
  .ALIGN_COMMA_ENABLE (ALIGN_COMMA_ENABLE_REG),
  .ALIGN_COMMA_WORD (ALIGN_COMMA_WORD_REG),
  .ALIGN_MCOMMA_DET (ALIGN_MCOMMA_DET_REG),
  .ALIGN_MCOMMA_VALUE (ALIGN_MCOMMA_VALUE_REG),
  .ALIGN_PCOMMA_DET (ALIGN_PCOMMA_DET_REG),
  .ALIGN_PCOMMA_VALUE (ALIGN_PCOMMA_VALUE_REG),
  .AMONITOR_CFG (AMONITOR_CFG_REG),
  .AUTO_BW_SEL_BYPASS (AUTO_BW_SEL_BYPASS_REG),
  .A_AFECFOKEN (A_AFECFOKEN_REG),
  .A_CPLLLOCKEN (A_CPLLLOCKEN_REG),
  .A_CPLLPD (A_CPLLPD_REG),
  .A_CPLLRESET (A_CPLLRESET_REG),
  .A_DFECFOKFCDAC (A_DFECFOKFCDAC_REG),
  .A_DFECFOKFCNUM (A_DFECFOKFCNUM_REG),
  .A_DFECFOKFPULSE (A_DFECFOKFPULSE_REG),
  .A_DFECFOKHOLD (A_DFECFOKHOLD_REG),
  .A_DFECFOKOVREN (A_DFECFOKOVREN_REG),
  .A_ELPCALDVORWREN (A_ELPCALDVORWREN_REG),
  .A_ELPCALPAORWREN (A_ELPCALPAORWREN_REG),
  .A_EYESCANMODE (A_EYESCANMODE_REG),
  .A_EYESCANRESET (A_EYESCANRESET_REG),
  .A_GTRESETSEL (A_GTRESETSEL_REG),
  .A_GTRXRESET (A_GTRXRESET_REG),
  .A_GTTXRESET (A_GTTXRESET_REG),
  .A_LOOPBACK (A_LOOPBACK_REG),
  .A_LPMGCHOLD (A_LPMGCHOLD_REG),
  .A_LPMGCOVREN (A_LPMGCOVREN_REG),
  .A_LPMOSHOLD (A_LPMOSHOLD_REG),
  .A_LPMOSOVREN (A_LPMOSOVREN_REG),
  .A_MUXDCDEXHOLD (A_MUXDCDEXHOLD_REG),
  .A_MUXDCDORWREN (A_MUXDCDORWREN_REG),
  .A_RXBUFRESET (A_RXBUFRESET_REG),
  .A_RXCDRFREQRESET (A_RXCDRFREQRESET_REG),
  .A_RXCDRHOLD (A_RXCDRHOLD_REG),
  .A_RXCDROVRDEN (A_RXCDROVRDEN_REG),
  .A_RXCDRRESET (A_RXCDRRESET_REG),
  .A_RXDFEAGCHOLD (A_RXDFEAGCHOLD_REG),
  .A_RXDFEAGCOVRDEN (A_RXDFEAGCOVRDEN_REG),
  .A_RXDFECFOKFEN (A_RXDFECFOKFEN_REG),
  .A_RXDFELFHOLD (A_RXDFELFHOLD_REG),
  .A_RXDFELFOVRDEN (A_RXDFELFOVRDEN_REG),
  .A_RXDFELPMRESET (A_RXDFELPMRESET_REG),
  .A_RXDFETAP10HOLD (A_RXDFETAP10HOLD_REG),
  .A_RXDFETAP10OVRDEN (A_RXDFETAP10OVRDEN_REG),
  .A_RXDFETAP11HOLD (A_RXDFETAP11HOLD_REG),
  .A_RXDFETAP11OVRDEN (A_RXDFETAP11OVRDEN_REG),
  .A_RXDFETAP12HOLD (A_RXDFETAP12HOLD_REG),
  .A_RXDFETAP12OVRDEN (A_RXDFETAP12OVRDEN_REG),
  .A_RXDFETAP13HOLD (A_RXDFETAP13HOLD_REG),
  .A_RXDFETAP13OVRDEN (A_RXDFETAP13OVRDEN_REG),
  .A_RXDFETAP14HOLD (A_RXDFETAP14HOLD_REG),
  .A_RXDFETAP14OVRDEN (A_RXDFETAP14OVRDEN_REG),
  .A_RXDFETAP15HOLD (A_RXDFETAP15HOLD_REG),
  .A_RXDFETAP15OVRDEN (A_RXDFETAP15OVRDEN_REG),
  .A_RXDFETAP2HOLD (A_RXDFETAP2HOLD_REG),
  .A_RXDFETAP2OVRDEN (A_RXDFETAP2OVRDEN_REG),
  .A_RXDFETAP3HOLD (A_RXDFETAP3HOLD_REG),
  .A_RXDFETAP3OVRDEN (A_RXDFETAP3OVRDEN_REG),
  .A_RXDFETAP4HOLD (A_RXDFETAP4HOLD_REG),
  .A_RXDFETAP4OVRDEN (A_RXDFETAP4OVRDEN_REG),
  .A_RXDFETAP5HOLD (A_RXDFETAP5HOLD_REG),
  .A_RXDFETAP5OVRDEN (A_RXDFETAP5OVRDEN_REG),
  .A_RXDFETAP6HOLD (A_RXDFETAP6HOLD_REG),
  .A_RXDFETAP6OVRDEN (A_RXDFETAP6OVRDEN_REG),
  .A_RXDFETAP7HOLD (A_RXDFETAP7HOLD_REG),
  .A_RXDFETAP7OVRDEN (A_RXDFETAP7OVRDEN_REG),
  .A_RXDFETAP8HOLD (A_RXDFETAP8HOLD_REG),
  .A_RXDFETAP8OVRDEN (A_RXDFETAP8OVRDEN_REG),
  .A_RXDFETAP9HOLD (A_RXDFETAP9HOLD_REG),
  .A_RXDFETAP9OVRDEN (A_RXDFETAP9OVRDEN_REG),
  .A_RXDFEUTHOLD (A_RXDFEUTHOLD_REG),
  .A_RXDFEUTOVRDEN (A_RXDFEUTOVRDEN_REG),
  .A_RXDFEVPHOLD (A_RXDFEVPHOLD_REG),
  .A_RXDFEVPOVRDEN (A_RXDFEVPOVRDEN_REG),
  .A_RXDFEVSEN (A_RXDFEVSEN_REG),
  .A_RXDFEXYDEN (A_RXDFEXYDEN_REG),
  .A_RXDLYBYPASS (A_RXDLYBYPASS_REG),
  .A_RXDLYEN (A_RXDLYEN_REG),
  .A_RXDLYOVRDEN (A_RXDLYOVRDEN_REG),
  .A_RXDLYSRESET (A_RXDLYSRESET_REG),
  .A_RXLPMEN (A_RXLPMEN_REG),
  .A_RXLPMHFHOLD (A_RXLPMHFHOLD_REG),
  .A_RXLPMHFOVRDEN (A_RXLPMHFOVRDEN_REG),
  .A_RXLPMLFHOLD (A_RXLPMLFHOLD_REG),
  .A_RXLPMLFKLOVRDEN (A_RXLPMLFKLOVRDEN_REG),
  .A_RXMONITORSEL (A_RXMONITORSEL_REG),
  .A_RXOOBRESET (A_RXOOBRESET_REG),
  .A_RXOSCALRESET (A_RXOSCALRESET_REG),
  .A_RXOSHOLD (A_RXOSHOLD_REG),
  .A_RXOSOVRDEN (A_RXOSOVRDEN_REG),
  .A_RXOUTCLKSEL (A_RXOUTCLKSEL_REG),
  .A_RXPCSRESET (A_RXPCSRESET_REG),
  .A_RXPD (A_RXPD_REG),
  .A_RXPHALIGN (A_RXPHALIGN_REG),
  .A_RXPHALIGNEN (A_RXPHALIGNEN_REG),
  .A_RXPHDLYPD (A_RXPHDLYPD_REG),
  .A_RXPHDLYRESET (A_RXPHDLYRESET_REG),
  .A_RXPHOVRDEN (A_RXPHOVRDEN_REG),
  .A_RXPLLCLKSEL (A_RXPLLCLKSEL_REG),
  .A_RXPMARESET (A_RXPMARESET_REG),
  .A_RXPOLARITY (A_RXPOLARITY_REG),
  .A_RXPRBSCNTRESET (A_RXPRBSCNTRESET_REG),
  .A_RXPRBSSEL (A_RXPRBSSEL_REG),
  .A_RXPROGDIVRESET (A_RXPROGDIVRESET_REG),
  .A_RXSYSCLKSEL (A_RXSYSCLKSEL_REG),
  .A_TXBUFDIFFCTRL (A_TXBUFDIFFCTRL_REG),
  .A_TXDEEMPH (A_TXDEEMPH_REG),
  .A_TXDIFFCTRL (A_TXDIFFCTRL_REG),
  .A_TXDLYBYPASS (A_TXDLYBYPASS_REG),
  .A_TXDLYEN (A_TXDLYEN_REG),
  .A_TXDLYOVRDEN (A_TXDLYOVRDEN_REG),
  .A_TXDLYSRESET (A_TXDLYSRESET_REG),
  .A_TXELECIDLE (A_TXELECIDLE_REG),
  .A_TXINHIBIT (A_TXINHIBIT_REG),
  .A_TXMAINCURSOR (A_TXMAINCURSOR_REG),
  .A_TXMARGIN (A_TXMARGIN_REG),
  .A_TXOUTCLKSEL (A_TXOUTCLKSEL_REG),
  .A_TXPCSRESET (A_TXPCSRESET_REG),
  .A_TXPD (A_TXPD_REG),
  .A_TXPHALIGN (A_TXPHALIGN_REG),
  .A_TXPHALIGNEN (A_TXPHALIGNEN_REG),
  .A_TXPHDLYPD (A_TXPHDLYPD_REG),
  .A_TXPHDLYRESET (A_TXPHDLYRESET_REG),
  .A_TXPHINIT (A_TXPHINIT_REG),
  .A_TXPHOVRDEN (A_TXPHOVRDEN_REG),
  .A_TXPIPPMOVRDEN (A_TXPIPPMOVRDEN_REG),
  .A_TXPIPPMPD (A_TXPIPPMPD_REG),
  .A_TXPIPPMSEL (A_TXPIPPMSEL_REG),
  .A_TXPLLCLKSEL (A_TXPLLCLKSEL_REG),
  .A_TXPMARESET (A_TXPMARESET_REG),
  .A_TXPOLARITY (A_TXPOLARITY_REG),
  .A_TXPOSTCURSOR (A_TXPOSTCURSOR_REG),
  .A_TXPRBSFORCEERR (A_TXPRBSFORCEERR_REG),
  .A_TXPRBSSEL (A_TXPRBSSEL_REG),
  .A_TXPRECURSOR (A_TXPRECURSOR_REG),
  .A_TXPROGDIVRESET (A_TXPROGDIVRESET_REG),
  .A_TXSWING (A_TXSWING_REG),
  .A_TXSYSCLKSEL (A_TXSYSCLKSEL_REG),
  .CAPBYPASS_FORCE (CAPBYPASS_FORCE_REG),
  .CBCC_DATA_SOURCE_SEL (CBCC_DATA_SOURCE_SEL_REG),
  .CDR_SWAP_MODE_EN (CDR_SWAP_MODE_EN_REG),
  .CHAN_BOND_KEEP_ALIGN (CHAN_BOND_KEEP_ALIGN_REG),
  .CHAN_BOND_MAX_SKEW (CHAN_BOND_MAX_SKEW_REG),
  .CHAN_BOND_SEQ_1_1 (CHAN_BOND_SEQ_1_1_REG),
  .CHAN_BOND_SEQ_1_2 (CHAN_BOND_SEQ_1_2_REG),
  .CHAN_BOND_SEQ_1_3 (CHAN_BOND_SEQ_1_3_REG),
  .CHAN_BOND_SEQ_1_4 (CHAN_BOND_SEQ_1_4_REG),
  .CHAN_BOND_SEQ_1_ENABLE (CHAN_BOND_SEQ_1_ENABLE_REG),
  .CHAN_BOND_SEQ_2_1 (CHAN_BOND_SEQ_2_1_REG),
  .CHAN_BOND_SEQ_2_2 (CHAN_BOND_SEQ_2_2_REG),
  .CHAN_BOND_SEQ_2_3 (CHAN_BOND_SEQ_2_3_REG),
  .CHAN_BOND_SEQ_2_4 (CHAN_BOND_SEQ_2_4_REG),
  .CHAN_BOND_SEQ_2_ENABLE (CHAN_BOND_SEQ_2_ENABLE_REG),
  .CHAN_BOND_SEQ_2_USE (CHAN_BOND_SEQ_2_USE_REG),
  .CHAN_BOND_SEQ_LEN (CHAN_BOND_SEQ_LEN_REG),
  .CH_HSPMUX (CH_HSPMUX_REG),
  .CKCAL1_CFG_0 (CKCAL1_CFG_0_REG),
  .CKCAL1_CFG_1 (CKCAL1_CFG_1_REG),
  .CKCAL1_CFG_2 (CKCAL1_CFG_2_REG),
  .CKCAL1_CFG_3 (CKCAL1_CFG_3_REG),
  .CKCAL2_CFG_0 (CKCAL2_CFG_0_REG),
  .CKCAL2_CFG_1 (CKCAL2_CFG_1_REG),
  .CKCAL2_CFG_2 (CKCAL2_CFG_2_REG),
  .CKCAL2_CFG_3 (CKCAL2_CFG_3_REG),
  .CKCAL2_CFG_4 (CKCAL2_CFG_4_REG),
  .CKCAL_RSVD0 (CKCAL_RSVD0_REG),
  .CKCAL_RSVD1 (CKCAL_RSVD1_REG),
  .CLK_CORRECT_USE (CLK_CORRECT_USE_REG),
  .CLK_COR_KEEP_IDLE (CLK_COR_KEEP_IDLE_REG),
  .CLK_COR_MAX_LAT (CLK_COR_MAX_LAT_REG),
  .CLK_COR_MIN_LAT (CLK_COR_MIN_LAT_REG),
  .CLK_COR_PRECEDENCE (CLK_COR_PRECEDENCE_REG),
  .CLK_COR_REPEAT_WAIT (CLK_COR_REPEAT_WAIT_REG),
  .CLK_COR_SEQ_1_1 (CLK_COR_SEQ_1_1_REG),
  .CLK_COR_SEQ_1_2 (CLK_COR_SEQ_1_2_REG),
  .CLK_COR_SEQ_1_3 (CLK_COR_SEQ_1_3_REG),
  .CLK_COR_SEQ_1_4 (CLK_COR_SEQ_1_4_REG),
  .CLK_COR_SEQ_1_ENABLE (CLK_COR_SEQ_1_ENABLE_REG),
  .CLK_COR_SEQ_2_1 (CLK_COR_SEQ_2_1_REG),
  .CLK_COR_SEQ_2_2 (CLK_COR_SEQ_2_2_REG),
  .CLK_COR_SEQ_2_3 (CLK_COR_SEQ_2_3_REG),
  .CLK_COR_SEQ_2_4 (CLK_COR_SEQ_2_4_REG),
  .CLK_COR_SEQ_2_ENABLE (CLK_COR_SEQ_2_ENABLE_REG),
  .CLK_COR_SEQ_2_USE (CLK_COR_SEQ_2_USE_REG),
  .CLK_COR_SEQ_LEN (CLK_COR_SEQ_LEN_REG),
  .CPLL_CFG0 (CPLL_CFG0_REG),
  .CPLL_CFG1 (CPLL_CFG1_REG),
  .CPLL_CFG2 (CPLL_CFG2_REG),
  .CPLL_CFG3 (CPLL_CFG3_REG),
  .CPLL_FBDIV (CPLL_FBDIV_REG),
  .CPLL_FBDIV_45 (CPLL_FBDIV_45_REG),
  .CPLL_INIT_CFG0 (CPLL_INIT_CFG0_REG),
  .CPLL_INIT_CFG1 (CPLL_INIT_CFG1_REG),
  .CPLL_LOCK_CFG (CPLL_LOCK_CFG_REG),
  .CPLL_REFCLK_DIV (CPLL_REFCLK_DIV_REG),
  .CTLE3_OCAP_EXT_CTRL (CTLE3_OCAP_EXT_CTRL_REG),
  .CTLE3_OCAP_EXT_EN (CTLE3_OCAP_EXT_EN_REG),
  .DDI_CTRL (DDI_CTRL_REG),
  .DDI_REALIGN_WAIT (DDI_REALIGN_WAIT_REG),
  .DEC_MCOMMA_DETECT (DEC_MCOMMA_DETECT_REG),
  .DEC_PCOMMA_DETECT (DEC_PCOMMA_DETECT_REG),
  .DEC_VALID_COMMA_ONLY (DEC_VALID_COMMA_ONLY_REG),
  .DFE_D_X_REL_POS (DFE_D_X_REL_POS_REG),
  .DFE_VCM_COMP_EN (DFE_VCM_COMP_EN_REG),
  .DMONITOR_CFG0 (DMONITOR_CFG0_REG),
  .DMONITOR_CFG1 (DMONITOR_CFG1_REG),
  .ES_CLK_PHASE_SEL (ES_CLK_PHASE_SEL_REG),
  .ES_CONTROL (ES_CONTROL_REG),
  .ES_ERRDET_EN (ES_ERRDET_EN_REG),
  .ES_EYE_SCAN_EN (ES_EYE_SCAN_EN_REG),
  .ES_HORZ_OFFSET (ES_HORZ_OFFSET_REG),
  .ES_PMA_CFG (ES_PMA_CFG_REG),
  .ES_PRESCALE (ES_PRESCALE_REG),
  .ES_QUALIFIER0 (ES_QUALIFIER0_REG),
  .ES_QUALIFIER1 (ES_QUALIFIER1_REG),
  .ES_QUALIFIER2 (ES_QUALIFIER2_REG),
  .ES_QUALIFIER3 (ES_QUALIFIER3_REG),
  .ES_QUALIFIER4 (ES_QUALIFIER4_REG),
  .ES_QUALIFIER5 (ES_QUALIFIER5_REG),
  .ES_QUALIFIER6 (ES_QUALIFIER6_REG),
  .ES_QUALIFIER7 (ES_QUALIFIER7_REG),
  .ES_QUALIFIER8 (ES_QUALIFIER8_REG),
  .ES_QUALIFIER9 (ES_QUALIFIER9_REG),
  .ES_QUAL_MASK0 (ES_QUAL_MASK0_REG),
  .ES_QUAL_MASK1 (ES_QUAL_MASK1_REG),
  .ES_QUAL_MASK2 (ES_QUAL_MASK2_REG),
  .ES_QUAL_MASK3 (ES_QUAL_MASK3_REG),
  .ES_QUAL_MASK4 (ES_QUAL_MASK4_REG),
  .ES_QUAL_MASK5 (ES_QUAL_MASK5_REG),
  .ES_QUAL_MASK6 (ES_QUAL_MASK6_REG),
  .ES_QUAL_MASK7 (ES_QUAL_MASK7_REG),
  .ES_QUAL_MASK8 (ES_QUAL_MASK8_REG),
  .ES_QUAL_MASK9 (ES_QUAL_MASK9_REG),
  .ES_SDATA_MASK0 (ES_SDATA_MASK0_REG),
  .ES_SDATA_MASK1 (ES_SDATA_MASK1_REG),
  .ES_SDATA_MASK2 (ES_SDATA_MASK2_REG),
  .ES_SDATA_MASK3 (ES_SDATA_MASK3_REG),
  .ES_SDATA_MASK4 (ES_SDATA_MASK4_REG),
  .ES_SDATA_MASK5 (ES_SDATA_MASK5_REG),
  .ES_SDATA_MASK6 (ES_SDATA_MASK6_REG),
  .ES_SDATA_MASK7 (ES_SDATA_MASK7_REG),
  .ES_SDATA_MASK8 (ES_SDATA_MASK8_REG),
  .ES_SDATA_MASK9 (ES_SDATA_MASK9_REG),
  .EVODD_PHI_CFG (EVODD_PHI_CFG_REG),
  .EYE_SCAN_SWAP_EN (EYE_SCAN_SWAP_EN_REG),
  .FTS_DESKEW_SEQ_ENABLE (FTS_DESKEW_SEQ_ENABLE_REG),
  .FTS_LANE_DESKEW_CFG (FTS_LANE_DESKEW_CFG_REG),
  .FTS_LANE_DESKEW_EN (FTS_LANE_DESKEW_EN_REG),
  .GEARBOX_MODE (GEARBOX_MODE_REG),
  .GEN_RXUSRCLK (GEN_RXUSRCLK_REG),
  .GEN_TXUSRCLK (GEN_TXUSRCLK_REG),
  .GM_BIAS_SELECT (GM_BIAS_SELECT_REG),
  .GT_INSTANTIATED (GT_INSTANTIATED_REG),
  .ISCAN_CK_PH_SEL2 (ISCAN_CK_PH_SEL2_REG),
  .LOCAL_MASTER (LOCAL_MASTER_REG),
  .LOOP0_CFG (LOOP0_CFG_REG),
  .LOOP10_CFG (LOOP10_CFG_REG),
  .LOOP11_CFG (LOOP11_CFG_REG),
  .LOOP12_CFG (LOOP12_CFG_REG),
  .LOOP13_CFG (LOOP13_CFG_REG),
  .LOOP1_CFG (LOOP1_CFG_REG),
  .LOOP2_CFG (LOOP2_CFG_REG),
  .LOOP3_CFG (LOOP3_CFG_REG),
  .LOOP4_CFG (LOOP4_CFG_REG),
  .LOOP5_CFG (LOOP5_CFG_REG),
  .LOOP6_CFG (LOOP6_CFG_REG),
  .LOOP7_CFG (LOOP7_CFG_REG),
  .LOOP8_CFG (LOOP8_CFG_REG),
  .LOOP9_CFG (LOOP9_CFG_REG),
  .LPBK_BIAS_CTRL (LPBK_BIAS_CTRL_REG),
  .LPBK_EN_RCAL_B (LPBK_EN_RCAL_B_REG),
  .LPBK_EXT_RCAL (LPBK_EXT_RCAL_REG),
  .LPBK_RG_CTRL (LPBK_RG_CTRL_REG),
  .OOBDIVCTL (OOBDIVCTL_REG),
  .OOB_PWRUP (OOB_PWRUP_REG),
  .PCI3_AUTO_REALIGN (PCI3_AUTO_REALIGN_REG),
  .PCI3_PIPE_RX_ELECIDLE (PCI3_PIPE_RX_ELECIDLE_REG),
  .PCI3_RX_ASYNC_EBUF_BYPASS (PCI3_RX_ASYNC_EBUF_BYPASS_REG),
  .PCI3_RX_ELECIDLE_EI2_ENABLE (PCI3_RX_ELECIDLE_EI2_ENABLE_REG),
  .PCI3_RX_ELECIDLE_H2L_COUNT (PCI3_RX_ELECIDLE_H2L_COUNT_REG),
  .PCI3_RX_ELECIDLE_H2L_DISABLE (PCI3_RX_ELECIDLE_H2L_DISABLE_REG),
  .PCI3_RX_ELECIDLE_HI_COUNT (PCI3_RX_ELECIDLE_HI_COUNT_REG),
  .PCI3_RX_ELECIDLE_LP4_DISABLE (PCI3_RX_ELECIDLE_LP4_DISABLE_REG),
  .PCI3_RX_FIFO_DISABLE (PCI3_RX_FIFO_DISABLE_REG),
  .PCIE_BUFG_DIV_CTRL (PCIE_BUFG_DIV_CTRL_REG),
  .PCIE_RXPCS_CFG_GEN3 (PCIE_RXPCS_CFG_GEN3_REG),
  .PCIE_RXPMA_CFG (PCIE_RXPMA_CFG_REG),
  .PCIE_TXPCS_CFG_GEN3 (PCIE_TXPCS_CFG_GEN3_REG),
  .PCIE_TXPMA_CFG (PCIE_TXPMA_CFG_REG),
  .PCS_PCIE_EN (PCS_PCIE_EN_REG),
  .PCS_RSVD0 (PCS_RSVD0_REG),
  .PCS_RSVD1 (PCS_RSVD1_REG),
  .PD_TRANS_TIME_FROM_P2 (PD_TRANS_TIME_FROM_P2_REG),
  .PD_TRANS_TIME_NONE_P2 (PD_TRANS_TIME_NONE_P2_REG),
  .PD_TRANS_TIME_TO_P2 (PD_TRANS_TIME_TO_P2_REG),
  .PLL_SEL_MODE_GEN12 (PLL_SEL_MODE_GEN12_REG),
  .PLL_SEL_MODE_GEN3 (PLL_SEL_MODE_GEN3_REG),
  .PMA_RSV0 (PMA_RSV0_REG),
  .PMA_RSV1 (PMA_RSV1_REG),
  .PREIQ_FREQ_BST (PREIQ_FREQ_BST_REG),
  .PROCESS_PAR (PROCESS_PAR_REG),
  .RATE_SW_USE_DRP (RATE_SW_USE_DRP_REG),
  .RESET_POWERSAVE_DISABLE (RESET_POWERSAVE_DISABLE_REG),
  .RXBUFRESET_TIME (RXBUFRESET_TIME_REG),
  .RXBUF_ADDR_MODE (RXBUF_ADDR_MODE_REG),
  .RXBUF_EIDLE_HI_CNT (RXBUF_EIDLE_HI_CNT_REG),
  .RXBUF_EIDLE_LO_CNT (RXBUF_EIDLE_LO_CNT_REG),
  .RXBUF_EN (RXBUF_EN_REG),
  .RXBUF_RESET_ON_CB_CHANGE (RXBUF_RESET_ON_CB_CHANGE_REG),
  .RXBUF_RESET_ON_COMMAALIGN (RXBUF_RESET_ON_COMMAALIGN_REG),
  .RXBUF_RESET_ON_EIDLE (RXBUF_RESET_ON_EIDLE_REG),
  .RXBUF_RESET_ON_RATE_CHANGE (RXBUF_RESET_ON_RATE_CHANGE_REG),
  .RXBUF_THRESH_OVFLW (RXBUF_THRESH_OVFLW_REG),
  .RXBUF_THRESH_OVRD (RXBUF_THRESH_OVRD_REG),
  .RXBUF_THRESH_UNDFLW (RXBUF_THRESH_UNDFLW_REG),
  .RXCDRFREQRESET_TIME (RXCDRFREQRESET_TIME_REG),
  .RXCDRPHRESET_TIME (RXCDRPHRESET_TIME_REG),
  .RXCDR_CFG0 (RXCDR_CFG0_REG),
  .RXCDR_CFG0_GEN3 (RXCDR_CFG0_GEN3_REG),
  .RXCDR_CFG1 (RXCDR_CFG1_REG),
  .RXCDR_CFG1_GEN3 (RXCDR_CFG1_GEN3_REG),
  .RXCDR_CFG2 (RXCDR_CFG2_REG),
  .RXCDR_CFG2_GEN3 (RXCDR_CFG2_GEN3_REG),
  .RXCDR_CFG3 (RXCDR_CFG3_REG),
  .RXCDR_CFG3_GEN3 (RXCDR_CFG3_GEN3_REG),
  .RXCDR_CFG4 (RXCDR_CFG4_REG),
  .RXCDR_CFG4_GEN3 (RXCDR_CFG4_GEN3_REG),
  .RXCDR_CFG5 (RXCDR_CFG5_REG),
  .RXCDR_CFG5_GEN3 (RXCDR_CFG5_GEN3_REG),
  .RXCDR_FR_RESET_ON_EIDLE (RXCDR_FR_RESET_ON_EIDLE_REG),
  .RXCDR_HOLD_DURING_EIDLE (RXCDR_HOLD_DURING_EIDLE_REG),
  .RXCDR_LOCK_CFG0 (RXCDR_LOCK_CFG0_REG),
  .RXCDR_LOCK_CFG1 (RXCDR_LOCK_CFG1_REG),
  .RXCDR_LOCK_CFG2 (RXCDR_LOCK_CFG2_REG),
  .RXCDR_LOCK_CFG3 (RXCDR_LOCK_CFG3_REG),
  .RXCDR_PH_RESET_ON_EIDLE (RXCDR_PH_RESET_ON_EIDLE_REG),
  .RXCFOKDONE_SRC (RXCFOKDONE_SRC_REG),
  .RXCFOK_CFG0 (RXCFOK_CFG0_REG),
  .RXCFOK_CFG1 (RXCFOK_CFG1_REG),
  .RXCFOK_CFG2 (RXCFOK_CFG2_REG),
  .RXDFELPMRESET_TIME (RXDFELPMRESET_TIME_REG),
  .RXDFELPM_KL_CFG0 (RXDFELPM_KL_CFG0_REG),
  .RXDFELPM_KL_CFG1 (RXDFELPM_KL_CFG1_REG),
  .RXDFELPM_KL_CFG2 (RXDFELPM_KL_CFG2_REG),
  .RXDFE_CFG0 (RXDFE_CFG0_REG),
  .RXDFE_CFG1 (RXDFE_CFG1_REG),
  .RXDFE_GC_CFG0 (RXDFE_GC_CFG0_REG),
  .RXDFE_GC_CFG1 (RXDFE_GC_CFG1_REG),
  .RXDFE_GC_CFG2 (RXDFE_GC_CFG2_REG),
  .RXDFE_H2_CFG0 (RXDFE_H2_CFG0_REG),
  .RXDFE_H2_CFG1 (RXDFE_H2_CFG1_REG),
  .RXDFE_H3_CFG0 (RXDFE_H3_CFG0_REG),
  .RXDFE_H3_CFG1 (RXDFE_H3_CFG1_REG),
  .RXDFE_H4_CFG0 (RXDFE_H4_CFG0_REG),
  .RXDFE_H4_CFG1 (RXDFE_H4_CFG1_REG),
  .RXDFE_H5_CFG0 (RXDFE_H5_CFG0_REG),
  .RXDFE_H5_CFG1 (RXDFE_H5_CFG1_REG),
  .RXDFE_H6_CFG0 (RXDFE_H6_CFG0_REG),
  .RXDFE_H6_CFG1 (RXDFE_H6_CFG1_REG),
  .RXDFE_H7_CFG0 (RXDFE_H7_CFG0_REG),
  .RXDFE_H7_CFG1 (RXDFE_H7_CFG1_REG),
  .RXDFE_H8_CFG0 (RXDFE_H8_CFG0_REG),
  .RXDFE_H8_CFG1 (RXDFE_H8_CFG1_REG),
  .RXDFE_H9_CFG0 (RXDFE_H9_CFG0_REG),
  .RXDFE_H9_CFG1 (RXDFE_H9_CFG1_REG),
  .RXDFE_HA_CFG0 (RXDFE_HA_CFG0_REG),
  .RXDFE_HA_CFG1 (RXDFE_HA_CFG1_REG),
  .RXDFE_HB_CFG0 (RXDFE_HB_CFG0_REG),
  .RXDFE_HB_CFG1 (RXDFE_HB_CFG1_REG),
  .RXDFE_HC_CFG0 (RXDFE_HC_CFG0_REG),
  .RXDFE_HC_CFG1 (RXDFE_HC_CFG1_REG),
  .RXDFE_HD_CFG0 (RXDFE_HD_CFG0_REG),
  .RXDFE_HD_CFG1 (RXDFE_HD_CFG1_REG),
  .RXDFE_HE_CFG0 (RXDFE_HE_CFG0_REG),
  .RXDFE_HE_CFG1 (RXDFE_HE_CFG1_REG),
  .RXDFE_HF_CFG0 (RXDFE_HF_CFG0_REG),
  .RXDFE_HF_CFG1 (RXDFE_HF_CFG1_REG),
  .RXDFE_OS_CFG0 (RXDFE_OS_CFG0_REG),
  .RXDFE_OS_CFG1 (RXDFE_OS_CFG1_REG),
  .RXDFE_PWR_SAVING (RXDFE_PWR_SAVING_REG),
  .RXDFE_UT_CFG0 (RXDFE_UT_CFG0_REG),
  .RXDFE_UT_CFG1 (RXDFE_UT_CFG1_REG),
  .RXDFE_VP_CFG0 (RXDFE_VP_CFG0_REG),
  .RXDFE_VP_CFG1 (RXDFE_VP_CFG1_REG),
  .RXDLY_CFG (RXDLY_CFG_REG),
  .RXDLY_LCFG (RXDLY_LCFG_REG),
  .RXELECIDLE_CFG (RXELECIDLE_CFG_REG),
  .RXGBOX_FIFO_INIT_RD_ADDR (RXGBOX_FIFO_INIT_RD_ADDR_REG),
  .RXGEARBOX_EN (RXGEARBOX_EN_REG),
  .RXISCANRESET_TIME (RXISCANRESET_TIME_REG),
  .RXLPM_CFG (RXLPM_CFG_REG),
  .RXLPM_GC_CFG (RXLPM_GC_CFG_REG),
  .RXLPM_KH_CFG0 (RXLPM_KH_CFG0_REG),
  .RXLPM_KH_CFG1 (RXLPM_KH_CFG1_REG),
  .RXLPM_OS_CFG0 (RXLPM_OS_CFG0_REG),
  .RXLPM_OS_CFG1 (RXLPM_OS_CFG1_REG),
  .RXOOB_CFG (RXOOB_CFG_REG),
  .RXOOB_CLK_CFG (RXOOB_CLK_CFG_REG),
  .RXOSCALRESET_TIME (RXOSCALRESET_TIME_REG),
  .RXOUT_DIV (RXOUT_DIV_REG),
  .RXPCSRESET_TIME (RXPCSRESET_TIME_REG),
  .RXPHBEACON_CFG (RXPHBEACON_CFG_REG),
  .RXPHDLY_CFG (RXPHDLY_CFG_REG),
  .RXPHSAMP_CFG (RXPHSAMP_CFG_REG),
  .RXPHSLIP_CFG (RXPHSLIP_CFG_REG),
  .RXPH_MONITOR_SEL (RXPH_MONITOR_SEL_REG),
  .RXPI_AUTO_BW_SEL_BYPASS (RXPI_AUTO_BW_SEL_BYPASS_REG),
  .RXPI_CFG (RXPI_CFG_REG),
  .RXPI_LPM (RXPI_LPM_REG),
  .RXPI_RSV0 (RXPI_RSV0_REG),
  .RXPI_SEL_LC (RXPI_SEL_LC_REG),
  .RXPI_STARTCODE (RXPI_STARTCODE_REG),
  .RXPI_VREFSEL (RXPI_VREFSEL_REG),
  .RXPLL_SEL (RXPLL_SEL_REG),
  .RXPMACLK_SEL (RXPMACLK_SEL_REG),
  .RXPMARESET_TIME (RXPMARESET_TIME_REG),
  .RXPRBS_ERR_LOOPBACK (RXPRBS_ERR_LOOPBACK_REG),
  .RXPRBS_LINKACQ_CNT (RXPRBS_LINKACQ_CNT_REG),
  .RXSLIDE_AUTO_WAIT (RXSLIDE_AUTO_WAIT_REG),
  .RXSLIDE_MODE (RXSLIDE_MODE_REG),
  .RXSYNC_MULTILANE (RXSYNC_MULTILANE_REG),
  .RXSYNC_OVRD (RXSYNC_OVRD_REG),
  .RXSYNC_SKIP_DA (RXSYNC_SKIP_DA_REG),
  .RX_AFE_CM_EN (RX_AFE_CM_EN_REG),
  .RX_BIAS_CFG0 (RX_BIAS_CFG0_REG),
  .RX_BUFFER_CFG (RX_BUFFER_CFG_REG),
  .RX_CAPFF_SARC_ENB (RX_CAPFF_SARC_ENB_REG),
  .RX_CLK25_DIV (RX_CLK25_DIV_REG),
  .RX_CLKMUX_EN (RX_CLKMUX_EN_REG),
  .RX_CLK_SLIP_OVRD (RX_CLK_SLIP_OVRD_REG),
  .RX_CM_BUF_CFG (RX_CM_BUF_CFG_REG),
  .RX_CM_BUF_PD (RX_CM_BUF_PD_REG),
  .RX_CM_SEL (RX_CM_SEL_REG),
  .RX_CM_TRIM (RX_CM_TRIM_REG),
  .RX_CTLE1_KHKL (RX_CTLE1_KHKL_REG),
  .RX_CTLE2_KHKL (RX_CTLE2_KHKL_REG),
  .RX_CTLE3_AGC (RX_CTLE3_AGC_REG),
  .RX_DATA_WIDTH (RX_DATA_WIDTH_REG),
  .RX_DDI_SEL (RX_DDI_SEL_REG),
  .RX_DEFER_RESET_BUF_EN (RX_DEFER_RESET_BUF_EN_REG),
  .RX_DEGEN_CTRL (RX_DEGEN_CTRL_REG),
  .RX_DFELPM_CFG0 (RX_DFELPM_CFG0_REG),
  .RX_DFELPM_CFG1 (RX_DFELPM_CFG1_REG),
  .RX_DFELPM_KLKH_AGC_STUP_EN (RX_DFELPM_KLKH_AGC_STUP_EN_REG),
  .RX_DFE_AGC_CFG0 (RX_DFE_AGC_CFG0_REG),
  .RX_DFE_AGC_CFG1 (RX_DFE_AGC_CFG1_REG),
  .RX_DFE_KL_LPM_KH_CFG0 (RX_DFE_KL_LPM_KH_CFG0_REG),
  .RX_DFE_KL_LPM_KH_CFG1 (RX_DFE_KL_LPM_KH_CFG1_REG),
  .RX_DFE_KL_LPM_KL_CFG0 (RX_DFE_KL_LPM_KL_CFG0_REG),
  .RX_DFE_KL_LPM_KL_CFG1 (RX_DFE_KL_LPM_KL_CFG1_REG),
  .RX_DFE_LPM_HOLD_DURING_EIDLE (RX_DFE_LPM_HOLD_DURING_EIDLE_REG),
  .RX_DISPERR_SEQ_MATCH (RX_DISPERR_SEQ_MATCH_REG),
  .RX_DIV2_MODE_B (RX_DIV2_MODE_B_REG),
  .RX_DIVRESET_TIME (RX_DIVRESET_TIME_REG),
  .RX_EN_CTLE_RCAL_B (RX_EN_CTLE_RCAL_B_REG),
  .RX_EN_HI_LR (RX_EN_HI_LR_REG),
  .RX_EXT_RL_CTRL (RX_EXT_RL_CTRL_REG),
  .RX_EYESCAN_VS_CODE (RX_EYESCAN_VS_CODE_REG),
  .RX_EYESCAN_VS_NEG_DIR (RX_EYESCAN_VS_NEG_DIR_REG),
  .RX_EYESCAN_VS_RANGE (RX_EYESCAN_VS_RANGE_REG),
  .RX_EYESCAN_VS_UT_SIGN (RX_EYESCAN_VS_UT_SIGN_REG),
  .RX_FABINT_USRCLK_FLOP (RX_FABINT_USRCLK_FLOP_REG),
  .RX_INT_DATAWIDTH (RX_INT_DATAWIDTH_REG),
  .RX_PMA_POWER_SAVE (RX_PMA_POWER_SAVE_REG),
  .RX_PROGDIV_CFG (RX_PROGDIV_CFG_BIN),
  .RX_PROGDIV_RATE (RX_PROGDIV_RATE_REG),
  .RX_RESLOAD_CTRL (RX_RESLOAD_CTRL_REG),
  .RX_RESLOAD_OVRD (RX_RESLOAD_OVRD_REG),
  .RX_SAMPLE_PERIOD (RX_SAMPLE_PERIOD_REG),
  .RX_SIG_VALID_DLY (RX_SIG_VALID_DLY_REG),
  .RX_SUM_DFETAPREP_EN (RX_SUM_DFETAPREP_EN_REG),
  .RX_SUM_IREF_TUNE (RX_SUM_IREF_TUNE_REG),
  .RX_SUM_VCMTUNE (RX_SUM_VCMTUNE_REG),
  .RX_SUM_VCM_OVWR (RX_SUM_VCM_OVWR_REG),
  .RX_SUM_VREF_TUNE (RX_SUM_VREF_TUNE_REG),
  .RX_TUNE_AFE_OS (RX_TUNE_AFE_OS_REG),
  .RX_VREG_CTRL (RX_VREG_CTRL_REG),
  .RX_VREG_PDB (RX_VREG_PDB_REG),
  .RX_WIDEMODE_CDR (RX_WIDEMODE_CDR_REG),
  .RX_XCLK_SEL (RX_XCLK_SEL_REG),
  .RX_XMODE_SEL (RX_XMODE_SEL_REG),
  .SAS_MAX_COM (SAS_MAX_COM_REG),
  .SAS_MIN_COM (SAS_MIN_COM_REG),
  .SATA_BURST_SEQ_LEN (SATA_BURST_SEQ_LEN_REG),
  .SATA_BURST_VAL (SATA_BURST_VAL_REG),
  .SATA_CPLL_CFG (SATA_CPLL_CFG_REG),
  .SATA_EIDLE_VAL (SATA_EIDLE_VAL_REG),
  .SATA_MAX_BURST (SATA_MAX_BURST_REG),
  .SATA_MAX_INIT (SATA_MAX_INIT_REG),
  .SATA_MAX_WAKE (SATA_MAX_WAKE_REG),
  .SATA_MIN_BURST (SATA_MIN_BURST_REG),
  .SATA_MIN_INIT (SATA_MIN_INIT_REG),
  .SATA_MIN_WAKE (SATA_MIN_WAKE_REG),
  .SHOW_REALIGN_COMMA (SHOW_REALIGN_COMMA_REG),
  .TAPDLY_SET_TX (TAPDLY_SET_TX_REG),
  .TEMPERATURE_PAR (TEMPERATURE_PAR_REG),
  .TERM_RCAL_CFG (TERM_RCAL_CFG_REG),
  .TERM_RCAL_OVRD (TERM_RCAL_OVRD_REG),
  .TRANS_TIME_RATE (TRANS_TIME_RATE_REG),
  .TST_RSV0 (TST_RSV0_REG),
  .TST_RSV1 (TST_RSV1_REG),
  .TXBUF_EN (TXBUF_EN_REG),
  .TXBUF_RESET_ON_RATE_CHANGE (TXBUF_RESET_ON_RATE_CHANGE_REG),
  .TXDLY_CFG (TXDLY_CFG_REG),
  .TXDLY_LCFG (TXDLY_LCFG_REG),
  .TXFIFO_ADDR_CFG (TXFIFO_ADDR_CFG_REG),
  .TXGBOX_FIFO_INIT_RD_ADDR (TXGBOX_FIFO_INIT_RD_ADDR_REG),
  .TXGEARBOX_EN (TXGEARBOX_EN_REG),
  .TXOUTCLKPCS_SEL (TXOUTCLKPCS_SEL_REG),
  .TXOUT_DIV (TXOUT_DIV_REG),
  .TXPCSRESET_TIME (TXPCSRESET_TIME_REG),
  .TXPHDLY_CFG0 (TXPHDLY_CFG0_REG),
  .TXPHDLY_CFG1 (TXPHDLY_CFG1_REG),
  .TXPH_CFG (TXPH_CFG_REG),
  .TXPH_CFG2 (TXPH_CFG2_REG),
  .TXPH_MONITOR_SEL (TXPH_MONITOR_SEL_REG),
  .TXPI_CFG0 (TXPI_CFG0_REG),
  .TXPI_CFG1 (TXPI_CFG1_REG),
  .TXPI_CFG2 (TXPI_CFG2_REG),
  .TXPI_CFG3 (TXPI_CFG3_REG),
  .TXPI_CFG4 (TXPI_CFG4_REG),
  .TXPI_CFG5 (TXPI_CFG5_REG),
  .TXPI_GRAY_SEL (TXPI_GRAY_SEL_REG),
  .TXPI_INVSTROBE_SEL (TXPI_INVSTROBE_SEL_REG),
  .TXPI_LPM (TXPI_LPM_REG),
  .TXPI_PPMCLK_SEL (TXPI_PPMCLK_SEL_REG),
  .TXPI_PPM_CFG (TXPI_PPM_CFG_REG),
  .TXPI_RSV0 (TXPI_RSV0_REG),
  .TXPI_SYNFREQ_PPM (TXPI_SYNFREQ_PPM_REG),
  .TXPI_VREFSEL (TXPI_VREFSEL_REG),
  .TXPMARESET_TIME (TXPMARESET_TIME_REG),
  .TXSYNC_MULTILANE (TXSYNC_MULTILANE_REG),
  .TXSYNC_OVRD (TXSYNC_OVRD_REG),
  .TXSYNC_SKIP_DA (TXSYNC_SKIP_DA_REG),
  .TX_CLK25_DIV (TX_CLK25_DIV_REG),
  .TX_CLKMUX_EN (TX_CLKMUX_EN_REG),
  .TX_CLKREG_PDB (TX_CLKREG_PDB_REG),
  .TX_CLKREG_SET (TX_CLKREG_SET_REG),
  .TX_DATA_WIDTH (TX_DATA_WIDTH_REG),
  .TX_DCD_CFG (TX_DCD_CFG_REG),
  .TX_DCD_EN (TX_DCD_EN_REG),
  .TX_DEEMPH0 (TX_DEEMPH0_REG),
  .TX_DEEMPH1 (TX_DEEMPH1_REG),
  .TX_DIVRESET_TIME (TX_DIVRESET_TIME_REG),
  .TX_DRIVE_MODE (TX_DRIVE_MODE_REG),
  .TX_DRVMUX_CTRL (TX_DRVMUX_CTRL_REG),
  .TX_EIDLE_ASSERT_DELAY (TX_EIDLE_ASSERT_DELAY_REG),
  .TX_EIDLE_DEASSERT_DELAY (TX_EIDLE_DEASSERT_DELAY_REG),
  .TX_EML_PHI_TUNE (TX_EML_PHI_TUNE_REG),
  .TX_FABINT_USRCLK_FLOP (TX_FABINT_USRCLK_FLOP_REG),
  .TX_FIFO_BYP_EN (TX_FIFO_BYP_EN_REG),
  .TX_IDLE_DATA_ZERO (TX_IDLE_DATA_ZERO_REG),
  .TX_INT_DATAWIDTH (TX_INT_DATAWIDTH_REG),
  .TX_LOOPBACK_DRIVE_HIZ (TX_LOOPBACK_DRIVE_HIZ_REG),
  .TX_MAINCURSOR_SEL (TX_MAINCURSOR_SEL_REG),
  .TX_MARGIN_FULL_0 (TX_MARGIN_FULL_0_REG),
  .TX_MARGIN_FULL_1 (TX_MARGIN_FULL_1_REG),
  .TX_MARGIN_FULL_2 (TX_MARGIN_FULL_2_REG),
  .TX_MARGIN_FULL_3 (TX_MARGIN_FULL_3_REG),
  .TX_MARGIN_FULL_4 (TX_MARGIN_FULL_4_REG),
  .TX_MARGIN_LOW_0 (TX_MARGIN_LOW_0_REG),
  .TX_MARGIN_LOW_1 (TX_MARGIN_LOW_1_REG),
  .TX_MARGIN_LOW_2 (TX_MARGIN_LOW_2_REG),
  .TX_MARGIN_LOW_3 (TX_MARGIN_LOW_3_REG),
  .TX_MARGIN_LOW_4 (TX_MARGIN_LOW_4_REG),
  .TX_MODE_SEL (TX_MODE_SEL_REG),
  .TX_PHICAL_CFG0 (TX_PHICAL_CFG0_REG),
  .TX_PHICAL_CFG1 (TX_PHICAL_CFG1_REG),
  .TX_PHICAL_CFG2 (TX_PHICAL_CFG2_REG),
  .TX_PI_BIASSET (TX_PI_BIASSET_REG),
  .TX_PI_CFG0 (TX_PI_CFG0_REG),
  .TX_PI_CFG1 (TX_PI_CFG1_REG),
  .TX_PI_DIV2_MODE_B (TX_PI_DIV2_MODE_B_REG),
  .TX_PI_SEL_QPLL0 (TX_PI_SEL_QPLL0_REG),
  .TX_PI_SEL_QPLL1 (TX_PI_SEL_QPLL1_REG),
  .TX_PMADATA_OPT (TX_PMADATA_OPT_REG),
  .TX_PMA_POWER_SAVE (TX_PMA_POWER_SAVE_REG),
  .TX_PREDRV_CTRL (TX_PREDRV_CTRL_REG),
  .TX_PROGCLK_SEL (TX_PROGCLK_SEL_REG),
  .TX_PROGDIV_CFG (TX_PROGDIV_CFG_BIN),
  .TX_PROGDIV_RATE (TX_PROGDIV_RATE_REG),
  .TX_RXDETECT_CFG (TX_RXDETECT_CFG_REG),
  .TX_RXDETECT_REF (TX_RXDETECT_REF_REG),
  .TX_SAMPLE_PERIOD (TX_SAMPLE_PERIOD_REG),
  .TX_SARC_LPBK_ENB (TX_SARC_LPBK_ENB_REG),
  .TX_USERPATTERN_DATA0 (TX_USERPATTERN_DATA0_REG),
  .TX_USERPATTERN_DATA1 (TX_USERPATTERN_DATA1_REG),
  .TX_USERPATTERN_DATA2 (TX_USERPATTERN_DATA2_REG),
  .TX_USERPATTERN_DATA3 (TX_USERPATTERN_DATA3_REG),
  .TX_USERPATTERN_DATA4 (TX_USERPATTERN_DATA4_REG),
  .TX_USERPATTERN_DATA5 (TX_USERPATTERN_DATA5_REG),
  .TX_USERPATTERN_DATA6 (TX_USERPATTERN_DATA6_REG),
  .TX_USERPATTERN_DATA7 (TX_USERPATTERN_DATA7_REG),
  .TX_XCLK_SEL (TX_XCLK_SEL_REG),
  .USE_PCS_CLK_PHASE_SEL (USE_PCS_CLK_PHASE_SEL_REG),
  .BUFGTCE (BUFGTCE_out),
  .BUFGTCEMASK (BUFGTCEMASK_out),
  .BUFGTDIV (BUFGTDIV_out),
  .BUFGTRESET (BUFGTRESET_out),
  .BUFGTRSTMASK (BUFGTRSTMASK_out),
  .CPLLFBCLKLOST (CPLLFBCLKLOST_out),
  .CPLLLOCK (CPLLLOCK_out),
  .CPLLREFCLKLOST (CPLLREFCLKLOST_out),
  .DMONITOROUT (DMONITOROUT_out),
  .DRPDO (DRPDO_out),
  .DRPRDY (DRPRDY_out),
  .EYESCANDATAERROR (EYESCANDATAERROR_out),
  .GTPOWERGOOD (GTPOWERGOOD_out),
  .GTREFCLKMONITOR (GTREFCLKMONITOR_out),
  .GTYTXN (GTYTXN_out),
  .GTYTXP (GTYTXP_out),
  .PCIERATEGEN3 (PCIERATEGEN3_out),
  .PCIERATEIDLE (PCIERATEIDLE_out),
  .PCIERATEQPLLPD (PCIERATEQPLLPD_out),
  .PCIERATEQPLLRESET (PCIERATEQPLLRESET_out),
  .PCIESYNCTXSYNCDONE (PCIESYNCTXSYNCDONE_out),
  .PCIEUSERGEN3RDY (PCIEUSERGEN3RDY_out),
  .PCIEUSERPHYSTATUSRST (PCIEUSERPHYSTATUSRST_out),
  .PCIEUSERRATESTART (PCIEUSERRATESTART_out),
  .PCSRSVDOUT (PCSRSVDOUT_out),
  .PHYSTATUS (PHYSTATUS_out),
  .PINRSRVDAS (PINRSRVDAS_out),
  .PMASCANOUT (PMASCANOUT_out),
  .RESETEXCEPTION (RESETEXCEPTION_out),
  .RXBUFSTATUS (RXBUFSTATUS_out),
  .RXBYTEISALIGNED (RXBYTEISALIGNED_out),
  .RXBYTEREALIGN (RXBYTEREALIGN_out),
  .RXCDRLOCK (RXCDRLOCK_out),
  .RXCDRPHDONE (RXCDRPHDONE_out),
  .RXCHANBONDSEQ (RXCHANBONDSEQ_out),
  .RXCHANISALIGNED (RXCHANISALIGNED_out),
  .RXCHANREALIGN (RXCHANREALIGN_out),
  .RXCHBONDO (RXCHBONDO_out),
  .RXCKCALDONE (RXCKCALDONE_out),
  .RXCLKCORCNT (RXCLKCORCNT_out),
  .RXCOMINITDET (RXCOMINITDET_out),
  .RXCOMMADET (RXCOMMADET_out),
  .RXCOMSASDET (RXCOMSASDET_out),
  .RXCOMWAKEDET (RXCOMWAKEDET_out),
  .RXCTRL0 (RXCTRL0_out),
  .RXCTRL1 (RXCTRL1_out),
  .RXCTRL2 (RXCTRL2_out),
  .RXCTRL3 (RXCTRL3_out),
  .RXDATA (RXDATA_out),
  .RXDATAEXTENDRSVD (RXDATAEXTENDRSVD_out),
  .RXDATAVALID (RXDATAVALID_out),
  .RXDLYSRESETDONE (RXDLYSRESETDONE_out),
  .RXELECIDLE (RXELECIDLE_out),
  .RXHEADER (RXHEADER_out),
  .RXHEADERVALID (RXHEADERVALID_out),
  .RXMONITOROUT (RXMONITOROUT_out),
  .RXOSINTDONE (RXOSINTDONE_out),
  .RXOSINTSTARTED (RXOSINTSTARTED_out),
  .RXOSINTSTROBEDONE (RXOSINTSTROBEDONE_out),
  .RXOSINTSTROBESTARTED (RXOSINTSTROBESTARTED_out),
  .RXOUTCLK (RXOUTCLK_out),
  .RXOUTCLKFABRIC (RXOUTCLKFABRIC_out),
  .RXOUTCLKPCS (RXOUTCLKPCS_out),
  .RXPHALIGNDONE (RXPHALIGNDONE_out),
  .RXPHALIGNERR (RXPHALIGNERR_out),
  .RXPMARESETDONE (RXPMARESETDONE_out),
  .RXPRBSERR (RXPRBSERR_out),
  .RXPRBSLOCKED (RXPRBSLOCKED_out),
  .RXPRGDIVRESETDONE (RXPRGDIVRESETDONE_out),
  .RXRATEDONE (RXRATEDONE_out),
  .RXRECCLKOUT (RXRECCLKOUT_out),
  .RXRESETDONE (RXRESETDONE_out),
  .RXSLIDERDY (RXSLIDERDY_out),
  .RXSLIPDONE (RXSLIPDONE_out),
  .RXSLIPOUTCLKRDY (RXSLIPOUTCLKRDY_out),
  .RXSLIPPMARDY (RXSLIPPMARDY_out),
  .RXSTARTOFSEQ (RXSTARTOFSEQ_out),
  .RXSTATUS (RXSTATUS_out),
  .RXSYNCDONE (RXSYNCDONE_out),
  .RXSYNCOUT (RXSYNCOUT_out),
  .RXVALID (RXVALID_out),
  .SCANOUT (SCANOUT_out),
  .TXBUFSTATUS (TXBUFSTATUS_out),
  .TXCOMFINISH (TXCOMFINISH_out),
  .TXDCCDONE (TXDCCDONE_out),
  .TXDLYSRESETDONE (TXDLYSRESETDONE_out),
  .TXOUTCLK (TXOUTCLK_out),
  .TXOUTCLKFABRIC (TXOUTCLKFABRIC_out),
  .TXOUTCLKPCS (TXOUTCLKPCS_out),
  .TXPHALIGNDONE (TXPHALIGNDONE_out),
  .TXPHINITDONE (TXPHINITDONE_out),
  .TXPMARESETDONE (TXPMARESETDONE_out),
  .TXPRGDIVRESETDONE (TXPRGDIVRESETDONE_out),
  .TXRATEDONE (TXRATEDONE_out),
  .TXRESETDONE (TXRESETDONE_out),
  .TXSYNCDONE (TXSYNCDONE_out),
  .TXSYNCOUT (TXSYNCOUT_out),
  .CDRSTEPDIR (CDRSTEPDIR_in),
  .CDRSTEPSQ (CDRSTEPSQ_in),
  .CDRSTEPSX (CDRSTEPSX_in),
  .CFGRESET (CFGRESET_in),
  .CLKRSVD0 (CLKRSVD0_in),
  .CLKRSVD1 (CLKRSVD1_in),
  .CPLLLOCKDETCLK (CPLLLOCKDETCLK_in),
  .CPLLLOCKEN (CPLLLOCKEN_in),
  .CPLLPD (CPLLPD_in),
  .CPLLREFCLKSEL (CPLLREFCLKSEL_in),
  .CPLLRESET (CPLLRESET_in),
  .DMONFIFORESET (DMONFIFORESET_in),
  .DMONITORCLK (DMONITORCLK_in),
  .DRPADDR (DRPADDR_in),
  .DRPCLK (DRPCLK_in),
  .DRPDI (DRPDI_in),
  .DRPEN (DRPEN_in),
  .DRPWE (DRPWE_in),
  .ELPCALDVORWREN (ELPCALDVORWREN_in),
  .ELPCALPAORWREN (ELPCALPAORWREN_in),
  .EVODDPHICALDONE (EVODDPHICALDONE_in),
  .EVODDPHICALSTART (EVODDPHICALSTART_in),
  .EVODDPHIDRDEN (EVODDPHIDRDEN_in),
  .EVODDPHIDWREN (EVODDPHIDWREN_in),
  .EVODDPHIXRDEN (EVODDPHIXRDEN_in),
  .EVODDPHIXWREN (EVODDPHIXWREN_in),
  .EYESCANMODE (EYESCANMODE_in),
  .EYESCANRESET (EYESCANRESET_in),
  .EYESCANTRIGGER (EYESCANTRIGGER_in),
  .GTGREFCLK (GTGREFCLK_in),
  .GTNORTHREFCLK0 (GTNORTHREFCLK0_in),
  .GTNORTHREFCLK1 (GTNORTHREFCLK1_in),
  .GTREFCLK0 (GTREFCLK0_in),
  .GTREFCLK1 (GTREFCLK1_in),
  .GTRESETSEL (GTRESETSEL_in),
  .GTRSVD (GTRSVD_in),
  .GTRXRESET (GTRXRESET_in),
  .GTSOUTHREFCLK0 (GTSOUTHREFCLK0_in),
  .GTSOUTHREFCLK1 (GTSOUTHREFCLK1_in),
  .GTTXRESET (GTTXRESET_in),
  .GTYRXN (GTYRXN_in),
  .GTYRXP (GTYRXP_in),
  .LOOPBACK (LOOPBACK_in),
  .LOOPRSVD (LOOPRSVD_in),
  .LPBKRXTXSEREN (LPBKRXTXSEREN_in),
  .LPBKTXRXSEREN (LPBKTXRXSEREN_in),
  .PCIEEQRXEQADAPTDONE (PCIEEQRXEQADAPTDONE_in),
  .PCIERSTIDLE (PCIERSTIDLE_in),
  .PCIERSTTXSYNCSTART (PCIERSTTXSYNCSTART_in),
  .PCIEUSERRATEDONE (PCIEUSERRATEDONE_in),
  .PCSRSVDIN (PCSRSVDIN_in),
  .PCSRSVDIN2 (PCSRSVDIN2_in),
  .PMARSVDIN (PMARSVDIN_in),
  .PMASCANCLK0 (PMASCANCLK0_in),
  .PMASCANCLK1 (PMASCANCLK1_in),
  .PMASCANCLK2 (PMASCANCLK2_in),
  .PMASCANCLK3 (PMASCANCLK3_in),
  .PMASCANCLK4 (PMASCANCLK4_in),
  .PMASCANCLK5 (PMASCANCLK5_in),
  .PMASCANENB (PMASCANENB_in),
  .PMASCANIN (PMASCANIN_in),
  .PMASCANMODEB (PMASCANMODEB_in),
  .PMASCANRSTEN (PMASCANRSTEN_in),
  .QPLL0CLK (QPLL0CLK_in),
  .QPLL0REFCLK (QPLL0REFCLK_in),
  .QPLL1CLK (QPLL1CLK_in),
  .QPLL1REFCLK (QPLL1REFCLK_in),
  .RESETOVRD (RESETOVRD_in),
  .RSTCLKENTX (RSTCLKENTX_in),
  .RX8B10BEN (RX8B10BEN_in),
  .RXBUFRESET (RXBUFRESET_in),
  .RXCDRFREQRESET (RXCDRFREQRESET_in),
  .RXCDRHOLD (RXCDRHOLD_in),
  .RXCDROVRDEN (RXCDROVRDEN_in),
  .RXCDRRESET (RXCDRRESET_in),
  .RXCDRRESETRSV (RXCDRRESETRSV_in),
  .RXCHBONDEN (RXCHBONDEN_in),
  .RXCHBONDI (RXCHBONDI_in),
  .RXCHBONDLEVEL (RXCHBONDLEVEL_in),
  .RXCHBONDMASTER (RXCHBONDMASTER_in),
  .RXCHBONDSLAVE (RXCHBONDSLAVE_in),
  .RXCKCALRESET (RXCKCALRESET_in),
  .RXCOMMADETEN (RXCOMMADETEN_in),
  .RXDCCFORCESTART (RXDCCFORCESTART_in),
  .RXDFEAGCHOLD (RXDFEAGCHOLD_in),
  .RXDFEAGCOVRDEN (RXDFEAGCOVRDEN_in),
  .RXDFELFHOLD (RXDFELFHOLD_in),
  .RXDFELFOVRDEN (RXDFELFOVRDEN_in),
  .RXDFELPMRESET (RXDFELPMRESET_in),
  .RXDFETAP10HOLD (RXDFETAP10HOLD_in),
  .RXDFETAP10OVRDEN (RXDFETAP10OVRDEN_in),
  .RXDFETAP11HOLD (RXDFETAP11HOLD_in),
  .RXDFETAP11OVRDEN (RXDFETAP11OVRDEN_in),
  .RXDFETAP12HOLD (RXDFETAP12HOLD_in),
  .RXDFETAP12OVRDEN (RXDFETAP12OVRDEN_in),
  .RXDFETAP13HOLD (RXDFETAP13HOLD_in),
  .RXDFETAP13OVRDEN (RXDFETAP13OVRDEN_in),
  .RXDFETAP14HOLD (RXDFETAP14HOLD_in),
  .RXDFETAP14OVRDEN (RXDFETAP14OVRDEN_in),
  .RXDFETAP15HOLD (RXDFETAP15HOLD_in),
  .RXDFETAP15OVRDEN (RXDFETAP15OVRDEN_in),
  .RXDFETAP2HOLD (RXDFETAP2HOLD_in),
  .RXDFETAP2OVRDEN (RXDFETAP2OVRDEN_in),
  .RXDFETAP3HOLD (RXDFETAP3HOLD_in),
  .RXDFETAP3OVRDEN (RXDFETAP3OVRDEN_in),
  .RXDFETAP4HOLD (RXDFETAP4HOLD_in),
  .RXDFETAP4OVRDEN (RXDFETAP4OVRDEN_in),
  .RXDFETAP5HOLD (RXDFETAP5HOLD_in),
  .RXDFETAP5OVRDEN (RXDFETAP5OVRDEN_in),
  .RXDFETAP6HOLD (RXDFETAP6HOLD_in),
  .RXDFETAP6OVRDEN (RXDFETAP6OVRDEN_in),
  .RXDFETAP7HOLD (RXDFETAP7HOLD_in),
  .RXDFETAP7OVRDEN (RXDFETAP7OVRDEN_in),
  .RXDFETAP8HOLD (RXDFETAP8HOLD_in),
  .RXDFETAP8OVRDEN (RXDFETAP8OVRDEN_in),
  .RXDFETAP9HOLD (RXDFETAP9HOLD_in),
  .RXDFETAP9OVRDEN (RXDFETAP9OVRDEN_in),
  .RXDFEUTHOLD (RXDFEUTHOLD_in),
  .RXDFEUTOVRDEN (RXDFEUTOVRDEN_in),
  .RXDFEVPHOLD (RXDFEVPHOLD_in),
  .RXDFEVPOVRDEN (RXDFEVPOVRDEN_in),
  .RXDFEVSEN (RXDFEVSEN_in),
  .RXDFEXYDEN (RXDFEXYDEN_in),
  .RXDLYBYPASS (RXDLYBYPASS_in),
  .RXDLYEN (RXDLYEN_in),
  .RXDLYOVRDEN (RXDLYOVRDEN_in),
  .RXDLYSRESET (RXDLYSRESET_in),
  .RXELECIDLEMODE (RXELECIDLEMODE_in),
  .RXGEARBOXSLIP (RXGEARBOXSLIP_in),
  .RXLATCLK (RXLATCLK_in),
  .RXLPMEN (RXLPMEN_in),
  .RXLPMGCHOLD (RXLPMGCHOLD_in),
  .RXLPMGCOVRDEN (RXLPMGCOVRDEN_in),
  .RXLPMHFHOLD (RXLPMHFHOLD_in),
  .RXLPMHFOVRDEN (RXLPMHFOVRDEN_in),
  .RXLPMLFHOLD (RXLPMLFHOLD_in),
  .RXLPMLFKLOVRDEN (RXLPMLFKLOVRDEN_in),
  .RXLPMOSHOLD (RXLPMOSHOLD_in),
  .RXLPMOSOVRDEN (RXLPMOSOVRDEN_in),
  .RXMCOMMAALIGNEN (RXMCOMMAALIGNEN_in),
  .RXMONITORSEL (RXMONITORSEL_in),
  .RXOOBRESET (RXOOBRESET_in),
  .RXOSCALRESET (RXOSCALRESET_in),
  .RXOSHOLD (RXOSHOLD_in),
  .RXOSINTCFG (RXOSINTCFG_in),
  .RXOSINTEN (RXOSINTEN_in),
  .RXOSINTHOLD (RXOSINTHOLD_in),
  .RXOSINTOVRDEN (RXOSINTOVRDEN_in),
  .RXOSINTSTROBE (RXOSINTSTROBE_in),
  .RXOSINTTESTOVRDEN (RXOSINTTESTOVRDEN_in),
  .RXOSOVRDEN (RXOSOVRDEN_in),
  .RXOUTCLKSEL (RXOUTCLKSEL_in),
  .RXPCOMMAALIGNEN (RXPCOMMAALIGNEN_in),
  .RXPCSRESET (RXPCSRESET_in),
  .RXPD (RXPD_in),
  .RXPHALIGN (RXPHALIGN_in),
  .RXPHALIGNEN (RXPHALIGNEN_in),
  .RXPHDLYPD (RXPHDLYPD_in),
  .RXPHDLYRESET (RXPHDLYRESET_in),
  .RXPHOVRDEN (RXPHOVRDEN_in),
  .RXPLLCLKSEL (RXPLLCLKSEL_in),
  .RXPMARESET (RXPMARESET_in),
  .RXPOLARITY (RXPOLARITY_in),
  .RXPRBSCNTRESET (RXPRBSCNTRESET_in),
  .RXPRBSSEL (RXPRBSSEL_in),
  .RXPROGDIVRESET (RXPROGDIVRESET_in),
  .RXRATE (RXRATE_in),
  .RXRATEMODE (RXRATEMODE_in),
  .RXSLIDE (RXSLIDE_in),
  .RXSLIPOUTCLK (RXSLIPOUTCLK_in),
  .RXSLIPPMA (RXSLIPPMA_in),
  .RXSYNCALLIN (RXSYNCALLIN_in),
  .RXSYNCIN (RXSYNCIN_in),
  .RXSYNCMODE (RXSYNCMODE_in),
  .RXSYSCLKSEL (RXSYSCLKSEL_in),
  .RXUSERRDY (RXUSERRDY_in),
  .RXUSRCLK (RXUSRCLK_in),
  .RXUSRCLK2 (RXUSRCLK2_in),
  .SARCCLK (SARCCLK_in),
  .SCANCLK (SCANCLK_in),
  .SCANENB (SCANENB_in),
  .SCANIN (SCANIN_in),
  .SCANMODEB (SCANMODEB_in),
  .SIGVALIDCLK (SIGVALIDCLK_in),
  .TSTCLK0 (TSTCLK0_in),
  .TSTCLK1 (TSTCLK1_in),
  .TSTIN (TSTIN_in),
  .TSTPD (TSTPD_in),
  .TSTPDOVRDB (TSTPDOVRDB_in),
  .TX8B10BBYPASS (TX8B10BBYPASS_in),
  .TX8B10BEN (TX8B10BEN_in),
  .TXBUFDIFFCTRL (TXBUFDIFFCTRL_in),
  .TXCOMINIT (TXCOMINIT_in),
  .TXCOMSAS (TXCOMSAS_in),
  .TXCOMWAKE (TXCOMWAKE_in),
  .TXCTRL0 (TXCTRL0_in),
  .TXCTRL1 (TXCTRL1_in),
  .TXCTRL2 (TXCTRL2_in),
  .TXDATA (TXDATA_in),
  .TXDATAEXTENDRSVD (TXDATAEXTENDRSVD_in),
  .TXDCCFORCESTART (TXDCCFORCESTART_in),
  .TXDCCRESET (TXDCCRESET_in),
  .TXDEEMPH (TXDEEMPH_in),
  .TXDETECTRX (TXDETECTRX_in),
  .TXDIFFCTRL (TXDIFFCTRL_in),
  .TXDIFFPD (TXDIFFPD_in),
  .TXDLYBYPASS (TXDLYBYPASS_in),
  .TXDLYEN (TXDLYEN_in),
  .TXDLYHOLD (TXDLYHOLD_in),
  .TXDLYOVRDEN (TXDLYOVRDEN_in),
  .TXDLYSRESET (TXDLYSRESET_in),
  .TXDLYUPDOWN (TXDLYUPDOWN_in),
  .TXELECIDLE (TXELECIDLE_in),
  .TXELFORCESTART (TXELFORCESTART_in),
  .TXHEADER (TXHEADER_in),
  .TXINHIBIT (TXINHIBIT_in),
  .TXLATCLK (TXLATCLK_in),
  .TXMAINCURSOR (TXMAINCURSOR_in),
  .TXMARGIN (TXMARGIN_in),
  .TXOUTCLKSEL (TXOUTCLKSEL_in),
  .TXPCSRESET (TXPCSRESET_in),
  .TXPD (TXPD_in),
  .TXPDELECIDLEMODE (TXPDELECIDLEMODE_in),
  .TXPHALIGN (TXPHALIGN_in),
  .TXPHALIGNEN (TXPHALIGNEN_in),
  .TXPHDLYPD (TXPHDLYPD_in),
  .TXPHDLYRESET (TXPHDLYRESET_in),
  .TXPHDLYTSTCLK (TXPHDLYTSTCLK_in),
  .TXPHINIT (TXPHINIT_in),
  .TXPHOVRDEN (TXPHOVRDEN_in),
  .TXPIPPMEN (TXPIPPMEN_in),
  .TXPIPPMOVRDEN (TXPIPPMOVRDEN_in),
  .TXPIPPMPD (TXPIPPMPD_in),
  .TXPIPPMSEL (TXPIPPMSEL_in),
  .TXPIPPMSTEPSIZE (TXPIPPMSTEPSIZE_in),
  .TXPISOPD (TXPISOPD_in),
  .TXPLLCLKSEL (TXPLLCLKSEL_in),
  .TXPMARESET (TXPMARESET_in),
  .TXPOLARITY (TXPOLARITY_in),
  .TXPOSTCURSOR (TXPOSTCURSOR_in),
  .TXPRBSFORCEERR (TXPRBSFORCEERR_in),
  .TXPRBSSEL (TXPRBSSEL_in),
  .TXPRECURSOR (TXPRECURSOR_in),
  .TXPROGDIVRESET (TXPROGDIVRESET_in),
  .TXRATE (TXRATE_in),
  .TXRATEMODE (TXRATEMODE_in),
  .TXSEQUENCE (TXSEQUENCE_in),
  .TXSWING (TXSWING_in),
  .TXSYNCALLIN (TXSYNCALLIN_in),
  .TXSYNCIN (TXSYNCIN_in),
  .TXSYNCMODE (TXSYNCMODE_in),
  .TXSYSCLKSEL (TXSYSCLKSEL_in),
  .TXUSERRDY (TXUSERRDY_in),
  .TXUSRCLK (TXUSRCLK_in),
  .TXUSRCLK2 (TXUSRCLK2_in),
  .GSR (glblGSR)
);

  specify
  (DMONITORCLK => DMONITOROUT[0]) = (0:0:0, 0:0:0);
  (DMONITORCLK => DMONITOROUT[10]) = (0:0:0, 0:0:0);
  (DMONITORCLK => DMONITOROUT[11]) = (0:0:0, 0:0:0);
  (DMONITORCLK => DMONITOROUT[12]) = (0:0:0, 0:0:0);
  (DMONITORCLK => DMONITOROUT[13]) = (0:0:0, 0:0:0);
  (DMONITORCLK => DMONITOROUT[14]) = (0:0:0, 0:0:0);
  (DMONITORCLK => DMONITOROUT[15]) = (0:0:0, 0:0:0);
  (DMONITORCLK => DMONITOROUT[1]) = (0:0:0, 0:0:0);
  (DMONITORCLK => DMONITOROUT[2]) = (0:0:0, 0:0:0);
  (DMONITORCLK => DMONITOROUT[3]) = (0:0:0, 0:0:0);
  (DMONITORCLK => DMONITOROUT[4]) = (0:0:0, 0:0:0);
  (DMONITORCLK => DMONITOROUT[5]) = (0:0:0, 0:0:0);
  (DMONITORCLK => DMONITOROUT[6]) = (0:0:0, 0:0:0);
  (DMONITORCLK => DMONITOROUT[7]) = (0:0:0, 0:0:0);
  (DMONITORCLK => DMONITOROUT[8]) = (0:0:0, 0:0:0);
  (DMONITORCLK => DMONITOROUT[9]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[0]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[10]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[11]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[12]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[13]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[14]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[15]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[1]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[2]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[3]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[4]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[5]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[6]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[7]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[8]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[9]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPRDY) = (0:0:0, 0:0:0);
  (GTGREFCLK => GTREFCLKMONITOR) = (0:0:0, 0:0:0);
  (GTGREFCLK => RXCDRPHDONE) = (0:0:0, 0:0:0);
  (GTGREFCLK => RXOUTCLK) = (0:0:0, 0:0:0);
  (GTGREFCLK => RXOUTCLKFABRIC) = (0:0:0, 0:0:0);
  (GTGREFCLK => RXOUTCLKPCS) = (0:0:0, 0:0:0);
  (GTGREFCLK => RXRESETDONE) = (0:0:0, 0:0:0);
  (GTGREFCLK => TXOUTCLKFABRIC) = (0:0:0, 0:0:0);
  (GTGREFCLK => TXOUTCLKPCS) = (0:0:0, 0:0:0);
  (GTGREFCLK => TXRESETDONE) = (0:0:0, 0:0:0);
  (GTNORTHREFCLK0 => GTREFCLKMONITOR) = (0:0:0, 0:0:0);
  (GTNORTHREFCLK0 => RXCDRPHDONE) = (0:0:0, 0:0:0);
  (GTNORTHREFCLK0 => RXOUTCLK) = (0:0:0, 0:0:0);
  (GTNORTHREFCLK0 => RXOUTCLKFABRIC) = (0:0:0, 0:0:0);
  (GTNORTHREFCLK0 => RXOUTCLKPCS) = (0:0:0, 0:0:0);
  (GTNORTHREFCLK0 => RXRESETDONE) = (0:0:0, 0:0:0);
  (GTNORTHREFCLK0 => TXOUTCLKFABRIC) = (0:0:0, 0:0:0);
  (GTNORTHREFCLK0 => TXOUTCLKPCS) = (0:0:0, 0:0:0);
  (GTNORTHREFCLK0 => TXRESETDONE) = (0:0:0, 0:0:0);
  (GTNORTHREFCLK1 => GTREFCLKMONITOR) = (0:0:0, 0:0:0);
  (GTNORTHREFCLK1 => RXCDRPHDONE) = (0:0:0, 0:0:0);
  (GTNORTHREFCLK1 => RXOUTCLK) = (0:0:0, 0:0:0);
  (GTNORTHREFCLK1 => RXOUTCLKFABRIC) = (0:0:0, 0:0:0);
  (GTNORTHREFCLK1 => RXOUTCLKPCS) = (0:0:0, 0:0:0);
  (GTNORTHREFCLK1 => RXRESETDONE) = (0:0:0, 0:0:0);
  (GTNORTHREFCLK1 => TXOUTCLKFABRIC) = (0:0:0, 0:0:0);
  (GTNORTHREFCLK1 => TXOUTCLKPCS) = (0:0:0, 0:0:0);
  (GTNORTHREFCLK1 => TXRESETDONE) = (0:0:0, 0:0:0);
  (GTREFCLK0 => GTREFCLKMONITOR) = (0:0:0, 0:0:0);
  (GTREFCLK0 => RXOUTCLKFABRIC) = (0:0:0, 0:0:0);
  (GTREFCLK0 => TXOUTCLKFABRIC) = (0:0:0, 0:0:0);
  (GTREFCLK0 => TXOUTCLKPCS) = (0:0:0, 0:0:0);
  (GTREFCLK1 => GTREFCLKMONITOR) = (0:0:0, 0:0:0);
  (GTREFCLK1 => RXOUTCLKFABRIC) = (0:0:0, 0:0:0);
  (GTREFCLK1 => TXOUTCLKFABRIC) = (0:0:0, 0:0:0);
  (GTREFCLK1 => TXOUTCLKPCS) = (0:0:0, 0:0:0);
  (GTSOUTHREFCLK0 => GTREFCLKMONITOR) = (0:0:0, 0:0:0);
  (GTSOUTHREFCLK0 => RXCDRPHDONE) = (0:0:0, 0:0:0);
  (GTSOUTHREFCLK0 => RXOUTCLK) = (0:0:0, 0:0:0);
  (GTSOUTHREFCLK0 => RXOUTCLKFABRIC) = (0:0:0, 0:0:0);
  (GTSOUTHREFCLK0 => RXOUTCLKPCS) = (0:0:0, 0:0:0);
  (GTSOUTHREFCLK0 => RXRESETDONE) = (0:0:0, 0:0:0);
  (GTSOUTHREFCLK0 => TXOUTCLKFABRIC) = (0:0:0, 0:0:0);
  (GTSOUTHREFCLK0 => TXOUTCLKPCS) = (0:0:0, 0:0:0);
  (GTSOUTHREFCLK0 => TXRESETDONE) = (0:0:0, 0:0:0);
  (GTSOUTHREFCLK1 => GTREFCLKMONITOR) = (0:0:0, 0:0:0);
  (GTSOUTHREFCLK1 => RXCDRPHDONE) = (0:0:0, 0:0:0);
  (GTSOUTHREFCLK1 => RXOUTCLK) = (0:0:0, 0:0:0);
  (GTSOUTHREFCLK1 => RXOUTCLKFABRIC) = (0:0:0, 0:0:0);
  (GTSOUTHREFCLK1 => RXOUTCLKPCS) = (0:0:0, 0:0:0);
  (GTSOUTHREFCLK1 => RXRESETDONE) = (0:0:0, 0:0:0);
  (GTSOUTHREFCLK1 => TXOUTCLKFABRIC) = (0:0:0, 0:0:0);
  (GTSOUTHREFCLK1 => TXOUTCLKPCS) = (0:0:0, 0:0:0);
  (GTSOUTHREFCLK1 => TXRESETDONE) = (0:0:0, 0:0:0);
  (RXUSRCLK => RXCDRPHDONE) = (0:0:0, 0:0:0);
  (RXUSRCLK => RXCHBONDO[0]) = (0:0:0, 0:0:0);
  (RXUSRCLK => RXCHBONDO[1]) = (0:0:0, 0:0:0);
  (RXUSRCLK => RXCHBONDO[2]) = (0:0:0, 0:0:0);
  (RXUSRCLK => RXCHBONDO[3]) = (0:0:0, 0:0:0);
  (RXUSRCLK => RXCHBONDO[4]) = (0:0:0, 0:0:0);
  (RXUSRCLK => RXRESETDONE) = (0:0:0, 0:0:0);
  (RXUSRCLK => TXRESETDONE) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => PHYSTATUS) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXBUFSTATUS[0]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXBUFSTATUS[1]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXBUFSTATUS[2]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXBYTEISALIGNED) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXBYTEREALIGN) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCDRPHDONE) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCHANBONDSEQ) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCHANISALIGNED) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCHANREALIGN) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCLKCORCNT[0]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCLKCORCNT[1]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCOMINITDET) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCOMMADET) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCOMSASDET) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCOMWAKEDET) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL0[0]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL0[10]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL0[11]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL0[12]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL0[13]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL0[14]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL0[15]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL0[1]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL0[2]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL0[3]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL0[4]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL0[5]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL0[6]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL0[7]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL0[8]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL0[9]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL1[0]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL1[10]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL1[11]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL1[12]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL1[13]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL1[14]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL1[15]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL1[1]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL1[2]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL1[3]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL1[4]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL1[5]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL1[6]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL1[7]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL1[8]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL1[9]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL2[0]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL2[1]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL2[2]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL2[3]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL2[4]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL2[5]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL2[6]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL2[7]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL3[0]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL3[1]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL3[2]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL3[3]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL3[4]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL3[5]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL3[6]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXCTRL3[7]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATAVALID[0]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATAVALID[1]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[0]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[100]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[101]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[102]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[103]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[104]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[105]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[106]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[107]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[108]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[109]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[10]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[110]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[111]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[112]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[113]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[114]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[115]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[116]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[117]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[118]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[119]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[11]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[120]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[121]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[122]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[123]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[124]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[125]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[126]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[127]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[12]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[13]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[14]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[15]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[16]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[17]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[18]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[19]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[1]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[20]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[21]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[22]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[23]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[24]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[25]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[26]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[27]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[28]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[29]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[2]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[30]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[31]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[32]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[33]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[34]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[35]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[36]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[37]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[38]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[39]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[3]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[40]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[41]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[42]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[43]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[44]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[45]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[46]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[47]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[48]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[49]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[4]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[50]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[51]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[52]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[53]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[54]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[55]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[56]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[57]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[58]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[59]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[5]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[60]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[61]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[62]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[63]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[64]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[65]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[66]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[67]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[68]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[69]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[6]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[70]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[71]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[72]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[73]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[74]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[75]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[76]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[77]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[78]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[79]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[7]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[80]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[81]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[82]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[83]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[84]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[85]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[86]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[87]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[88]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[89]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[8]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[90]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[91]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[92]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[93]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[94]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[95]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[96]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[97]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[98]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[99]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXDATA[9]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXHEADERVALID[0]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXHEADERVALID[1]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXHEADER[0]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXHEADER[1]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXHEADER[2]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXHEADER[3]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXHEADER[4]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXHEADER[5]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXPRBSERR) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXPRBSLOCKED) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXRATEDONE) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXRESETDONE) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXSLIDERDY) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXSLIPDONE) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXSLIPOUTCLKRDY) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXSLIPPMARDY) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXSTARTOFSEQ[0]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXSTARTOFSEQ[1]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXSTATUS[0]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXSTATUS[1]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXSTATUS[2]) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => RXVALID) = (0:0:0, 0:0:0);
  (RXUSRCLK2 => TXRESETDONE) = (0:0:0, 0:0:0);
  (TXUSRCLK => RXRESETDONE) = (0:0:0, 0:0:0);
  (TXUSRCLK => TXRESETDONE) = (0:0:0, 0:0:0);
  (TXUSRCLK2 => RXRESETDONE) = (0:0:0, 0:0:0);
  (TXUSRCLK2 => TXBUFSTATUS[0]) = (0:0:0, 0:0:0);
  (TXUSRCLK2 => TXBUFSTATUS[1]) = (0:0:0, 0:0:0);
  (TXUSRCLK2 => TXCOMFINISH) = (0:0:0, 0:0:0);
  (TXUSRCLK2 => TXRATEDONE) = (0:0:0, 0:0:0);
  (TXUSRCLK2 => TXRESETDONE) = (0:0:0, 0:0:0);
  (negedge RXCKCALRESET => (DMONITOROUT[0] +: 1)) = (0:0:0, 0:0:0);
  (negedge RXCKCALRESET => (DMONITOROUT[10] +: 1)) = (0:0:0, 0:0:0);
  (negedge RXCKCALRESET => (DMONITOROUT[11] +: 1)) = (0:0:0, 0:0:0);
  (negedge RXCKCALRESET => (DMONITOROUT[12] +: 1)) = (0:0:0, 0:0:0);
  (negedge RXCKCALRESET => (DMONITOROUT[13] +: 1)) = (0:0:0, 0:0:0);
  (negedge RXCKCALRESET => (DMONITOROUT[16] +: 1)) = (0:0:0, 0:0:0);
  (negedge RXCKCALRESET => (DMONITOROUT[1] +: 1)) = (0:0:0, 0:0:0);
  (negedge RXCKCALRESET => (DMONITOROUT[2] +: 1)) = (0:0:0, 0:0:0);
  (negedge RXCKCALRESET => (DMONITOROUT[3] +: 1)) = (0:0:0, 0:0:0);
  (negedge RXCKCALRESET => (DMONITOROUT[4] +: 1)) = (0:0:0, 0:0:0);
  (negedge RXCKCALRESET => (DMONITOROUT[5] +: 1)) = (0:0:0, 0:0:0);
  (negedge RXCKCALRESET => (DMONITOROUT[6] +: 1)) = (0:0:0, 0:0:0);
  (negedge RXCKCALRESET => (DMONITOROUT[7] +: 1)) = (0:0:0, 0:0:0);
  (negedge RXCKCALRESET => (DMONITOROUT[8] +: 1)) = (0:0:0, 0:0:0);
  (negedge RXCKCALRESET => (DMONITOROUT[9] +: 1)) = (0:0:0, 0:0:0);
  (negedge RXCKCALRESET => (RXCKCALDONE +: 1)) = (0:0:0, 0:0:0);
  (negedge TXDCCRESET => (DMONITOROUT[0] +: 1)) = (0:0:0, 0:0:0);
  (negedge TXDCCRESET => (DMONITOROUT[16] +: 1)) = (0:0:0, 0:0:0);
  (negedge TXDCCRESET => (DMONITOROUT[1] +: 1)) = (0:0:0, 0:0:0);
  (negedge TXDCCRESET => (DMONITOROUT[2] +: 1)) = (0:0:0, 0:0:0);
  (negedge TXDCCRESET => (DMONITOROUT[3] +: 1)) = (0:0:0, 0:0:0);
  (negedge TXDCCRESET => (DMONITOROUT[4] +: 1)) = (0:0:0, 0:0:0);
  (negedge TXDCCRESET => (DMONITOROUT[5] +: 1)) = (0:0:0, 0:0:0);
  (negedge TXDCCRESET => (DMONITOROUT[6] +: 1)) = (0:0:0, 0:0:0);
  (negedge TXDCCRESET => (TXDCCDONE +: 1)) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
  $setuphold (posedge DRPCLK, negedge DRPADDR[0], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[0]);
  $setuphold (posedge DRPCLK, negedge DRPADDR[1], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[1]);
  $setuphold (posedge DRPCLK, negedge DRPADDR[2], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[2]);
  $setuphold (posedge DRPCLK, negedge DRPADDR[3], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[3]);
  $setuphold (posedge DRPCLK, negedge DRPADDR[4], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[4]);
  $setuphold (posedge DRPCLK, negedge DRPADDR[5], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[5]);
  $setuphold (posedge DRPCLK, negedge DRPADDR[6], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[6]);
  $setuphold (posedge DRPCLK, negedge DRPADDR[7], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[7]);
  $setuphold (posedge DRPCLK, negedge DRPADDR[8], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[8]);
  $setuphold (posedge DRPCLK, negedge DRPADDR[9], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[9]);
  $setuphold (posedge DRPCLK, negedge DRPDI[0], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[0]);
  $setuphold (posedge DRPCLK, negedge DRPDI[10], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[10]);
  $setuphold (posedge DRPCLK, negedge DRPDI[11], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[11]);
  $setuphold (posedge DRPCLK, negedge DRPDI[12], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[12]);
  $setuphold (posedge DRPCLK, negedge DRPDI[13], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[13]);
  $setuphold (posedge DRPCLK, negedge DRPDI[14], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[14]);
  $setuphold (posedge DRPCLK, negedge DRPDI[15], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[15]);
  $setuphold (posedge DRPCLK, negedge DRPDI[1], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[1]);
  $setuphold (posedge DRPCLK, negedge DRPDI[2], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[2]);
  $setuphold (posedge DRPCLK, negedge DRPDI[3], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[3]);
  $setuphold (posedge DRPCLK, negedge DRPDI[4], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[4]);
  $setuphold (posedge DRPCLK, negedge DRPDI[5], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[5]);
  $setuphold (posedge DRPCLK, negedge DRPDI[6], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[6]);
  $setuphold (posedge DRPCLK, negedge DRPDI[7], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[7]);
  $setuphold (posedge DRPCLK, negedge DRPDI[8], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[8]);
  $setuphold (posedge DRPCLK, negedge DRPDI[9], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[9]);
  $setuphold (posedge DRPCLK, negedge DRPEN, 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPEN_delay);
  $setuphold (posedge DRPCLK, negedge DRPWE, 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPWE_delay);
  $setuphold (posedge DRPCLK, posedge DRPADDR[0], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[0]);
  $setuphold (posedge DRPCLK, posedge DRPADDR[1], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[1]);
  $setuphold (posedge DRPCLK, posedge DRPADDR[2], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[2]);
  $setuphold (posedge DRPCLK, posedge DRPADDR[3], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[3]);
  $setuphold (posedge DRPCLK, posedge DRPADDR[4], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[4]);
  $setuphold (posedge DRPCLK, posedge DRPADDR[5], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[5]);
  $setuphold (posedge DRPCLK, posedge DRPADDR[6], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[6]);
  $setuphold (posedge DRPCLK, posedge DRPADDR[7], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[7]);
  $setuphold (posedge DRPCLK, posedge DRPADDR[8], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[8]);
  $setuphold (posedge DRPCLK, posedge DRPADDR[9], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[9]);
  $setuphold (posedge DRPCLK, posedge DRPDI[0], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[0]);
  $setuphold (posedge DRPCLK, posedge DRPDI[10], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[10]);
  $setuphold (posedge DRPCLK, posedge DRPDI[11], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[11]);
  $setuphold (posedge DRPCLK, posedge DRPDI[12], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[12]);
  $setuphold (posedge DRPCLK, posedge DRPDI[13], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[13]);
  $setuphold (posedge DRPCLK, posedge DRPDI[14], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[14]);
  $setuphold (posedge DRPCLK, posedge DRPDI[15], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[15]);
  $setuphold (posedge DRPCLK, posedge DRPDI[1], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[1]);
  $setuphold (posedge DRPCLK, posedge DRPDI[2], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[2]);
  $setuphold (posedge DRPCLK, posedge DRPDI[3], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[3]);
  $setuphold (posedge DRPCLK, posedge DRPDI[4], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[4]);
  $setuphold (posedge DRPCLK, posedge DRPDI[5], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[5]);
  $setuphold (posedge DRPCLK, posedge DRPDI[6], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[6]);
  $setuphold (posedge DRPCLK, posedge DRPDI[7], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[7]);
  $setuphold (posedge DRPCLK, posedge DRPDI[8], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[8]);
  $setuphold (posedge DRPCLK, posedge DRPDI[9], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[9]);
  $setuphold (posedge DRPCLK, posedge DRPEN, 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPEN_delay);
  $setuphold (posedge DRPCLK, posedge DRPWE, 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPWE_delay);
  $setuphold (posedge RXUSRCLK, negedge RXCHBONDI[0], 0:0:0, 0:0:0, notifier,,, RXUSRCLK_delay, RXCHBONDI_delay[0]);
  $setuphold (posedge RXUSRCLK, negedge RXCHBONDI[1], 0:0:0, 0:0:0, notifier,,, RXUSRCLK_delay, RXCHBONDI_delay[1]);
  $setuphold (posedge RXUSRCLK, negedge RXCHBONDI[2], 0:0:0, 0:0:0, notifier,,, RXUSRCLK_delay, RXCHBONDI_delay[2]);
  $setuphold (posedge RXUSRCLK, negedge RXCHBONDI[3], 0:0:0, 0:0:0, notifier,,, RXUSRCLK_delay, RXCHBONDI_delay[3]);
  $setuphold (posedge RXUSRCLK, negedge RXCHBONDI[4], 0:0:0, 0:0:0, notifier,,, RXUSRCLK_delay, RXCHBONDI_delay[4]);
  $setuphold (posedge RXUSRCLK, posedge RXCHBONDI[0], 0:0:0, 0:0:0, notifier,,, RXUSRCLK_delay, RXCHBONDI_delay[0]);
  $setuphold (posedge RXUSRCLK, posedge RXCHBONDI[1], 0:0:0, 0:0:0, notifier,,, RXUSRCLK_delay, RXCHBONDI_delay[1]);
  $setuphold (posedge RXUSRCLK, posedge RXCHBONDI[2], 0:0:0, 0:0:0, notifier,,, RXUSRCLK_delay, RXCHBONDI_delay[2]);
  $setuphold (posedge RXUSRCLK, posedge RXCHBONDI[3], 0:0:0, 0:0:0, notifier,,, RXUSRCLK_delay, RXCHBONDI_delay[3]);
  $setuphold (posedge RXUSRCLK, posedge RXCHBONDI[4], 0:0:0, 0:0:0, notifier,,, RXUSRCLK_delay, RXCHBONDI_delay[4]);
  $setuphold (posedge RXUSRCLK2, negedge RX8B10BEN, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RX8B10BEN_delay);
  $setuphold (posedge RXUSRCLK2, negedge RXCHBONDEN, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXCHBONDEN_delay);
  $setuphold (posedge RXUSRCLK2, negedge RXCHBONDLEVEL[0], 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXCHBONDLEVEL_delay[0]);
  $setuphold (posedge RXUSRCLK2, negedge RXCHBONDLEVEL[1], 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXCHBONDLEVEL_delay[1]);
  $setuphold (posedge RXUSRCLK2, negedge RXCHBONDLEVEL[2], 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXCHBONDLEVEL_delay[2]);
  $setuphold (posedge RXUSRCLK2, negedge RXCHBONDMASTER, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXCHBONDMASTER_delay);
  $setuphold (posedge RXUSRCLK2, negedge RXCHBONDSLAVE, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXCHBONDSLAVE_delay);
  $setuphold (posedge RXUSRCLK2, negedge RXCOMMADETEN, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXCOMMADETEN_delay);
  $setuphold (posedge RXUSRCLK2, negedge RXGEARBOXSLIP, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXGEARBOXSLIP_delay);
  $setuphold (posedge RXUSRCLK2, negedge RXMCOMMAALIGNEN, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXMCOMMAALIGNEN_delay);
  $setuphold (posedge RXUSRCLK2, negedge RXPCOMMAALIGNEN, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXPCOMMAALIGNEN_delay);
  $setuphold (posedge RXUSRCLK2, negedge RXPOLARITY, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXPOLARITY_delay);
  $setuphold (posedge RXUSRCLK2, negedge RXPRBSSEL[0], 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXPRBSSEL_delay[0]);
  $setuphold (posedge RXUSRCLK2, negedge RXPRBSSEL[1], 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXPRBSSEL_delay[1]);
  $setuphold (posedge RXUSRCLK2, negedge RXPRBSSEL[2], 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXPRBSSEL_delay[2]);
  $setuphold (posedge RXUSRCLK2, negedge RXRATE[0], 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXRATE_delay[0]);
  $setuphold (posedge RXUSRCLK2, negedge RXRATE[1], 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXRATE_delay[1]);
  $setuphold (posedge RXUSRCLK2, negedge RXRATE[2], 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXRATE_delay[2]);
  $setuphold (posedge RXUSRCLK2, negedge RXSLIDE, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXSLIDE_delay);
  $setuphold (posedge RXUSRCLK2, negedge RXSLIPOUTCLK, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXSLIPOUTCLK_delay);
  $setuphold (posedge RXUSRCLK2, negedge RXSLIPPMA, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXSLIPPMA_delay);
  $setuphold (posedge RXUSRCLK2, posedge RX8B10BEN, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RX8B10BEN_delay);
  $setuphold (posedge RXUSRCLK2, posedge RXCHBONDEN, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXCHBONDEN_delay);
  $setuphold (posedge RXUSRCLK2, posedge RXCHBONDLEVEL[0], 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXCHBONDLEVEL_delay[0]);
  $setuphold (posedge RXUSRCLK2, posedge RXCHBONDLEVEL[1], 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXCHBONDLEVEL_delay[1]);
  $setuphold (posedge RXUSRCLK2, posedge RXCHBONDLEVEL[2], 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXCHBONDLEVEL_delay[2]);
  $setuphold (posedge RXUSRCLK2, posedge RXCHBONDMASTER, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXCHBONDMASTER_delay);
  $setuphold (posedge RXUSRCLK2, posedge RXCHBONDSLAVE, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXCHBONDSLAVE_delay);
  $setuphold (posedge RXUSRCLK2, posedge RXCOMMADETEN, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXCOMMADETEN_delay);
  $setuphold (posedge RXUSRCLK2, posedge RXGEARBOXSLIP, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXGEARBOXSLIP_delay);
  $setuphold (posedge RXUSRCLK2, posedge RXMCOMMAALIGNEN, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXMCOMMAALIGNEN_delay);
  $setuphold (posedge RXUSRCLK2, posedge RXPCOMMAALIGNEN, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXPCOMMAALIGNEN_delay);
  $setuphold (posedge RXUSRCLK2, posedge RXPOLARITY, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXPOLARITY_delay);
  $setuphold (posedge RXUSRCLK2, posedge RXPRBSSEL[0], 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXPRBSSEL_delay[0]);
  $setuphold (posedge RXUSRCLK2, posedge RXPRBSSEL[1], 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXPRBSSEL_delay[1]);
  $setuphold (posedge RXUSRCLK2, posedge RXPRBSSEL[2], 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXPRBSSEL_delay[2]);
  $setuphold (posedge RXUSRCLK2, posedge RXRATE[0], 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXRATE_delay[0]);
  $setuphold (posedge RXUSRCLK2, posedge RXRATE[1], 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXRATE_delay[1]);
  $setuphold (posedge RXUSRCLK2, posedge RXRATE[2], 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXRATE_delay[2]);
  $setuphold (posedge RXUSRCLK2, posedge RXSLIDE, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXSLIDE_delay);
  $setuphold (posedge RXUSRCLK2, posedge RXSLIPOUTCLK, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXSLIPOUTCLK_delay);
  $setuphold (posedge RXUSRCLK2, posedge RXSLIPPMA, 0:0:0, 0:0:0, notifier,,, RXUSRCLK2_delay, RXSLIPPMA_delay);
  $setuphold (posedge TXUSRCLK2, negedge TX8B10BBYPASS[0], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TX8B10BBYPASS_delay[0]);
  $setuphold (posedge TXUSRCLK2, negedge TX8B10BBYPASS[1], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TX8B10BBYPASS_delay[1]);
  $setuphold (posedge TXUSRCLK2, negedge TX8B10BBYPASS[2], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TX8B10BBYPASS_delay[2]);
  $setuphold (posedge TXUSRCLK2, negedge TX8B10BBYPASS[3], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TX8B10BBYPASS_delay[3]);
  $setuphold (posedge TXUSRCLK2, negedge TX8B10BBYPASS[4], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TX8B10BBYPASS_delay[4]);
  $setuphold (posedge TXUSRCLK2, negedge TX8B10BBYPASS[5], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TX8B10BBYPASS_delay[5]);
  $setuphold (posedge TXUSRCLK2, negedge TX8B10BBYPASS[6], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TX8B10BBYPASS_delay[6]);
  $setuphold (posedge TXUSRCLK2, negedge TX8B10BBYPASS[7], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TX8B10BBYPASS_delay[7]);
  $setuphold (posedge TXUSRCLK2, negedge TX8B10BEN, 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TX8B10BEN_delay);
  $setuphold (posedge TXUSRCLK2, negedge TXCOMINIT, 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCOMINIT_delay);
  $setuphold (posedge TXUSRCLK2, negedge TXCOMSAS, 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCOMSAS_delay);
  $setuphold (posedge TXUSRCLK2, negedge TXCOMWAKE, 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCOMWAKE_delay);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL0[0], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[0]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL0[10], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[10]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL0[11], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[11]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL0[12], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[12]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL0[13], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[13]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL0[14], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[14]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL0[15], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[15]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL0[1], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[1]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL0[2], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[2]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL0[3], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[3]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL0[4], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[4]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL0[5], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[5]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL0[6], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[6]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL0[7], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[7]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL0[8], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[8]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL0[9], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[9]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL1[0], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[0]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL1[10], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[10]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL1[11], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[11]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL1[12], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[12]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL1[13], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[13]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL1[14], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[14]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL1[15], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[15]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL1[1], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[1]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL1[2], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[2]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL1[3], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[3]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL1[4], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[4]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL1[5], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[5]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL1[6], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[6]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL1[7], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[7]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL1[8], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[8]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL1[9], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[9]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL2[0], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL2_delay[0]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL2[1], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL2_delay[1]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL2[2], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL2_delay[2]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL2[3], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL2_delay[3]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL2[4], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL2_delay[4]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL2[5], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL2_delay[5]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL2[6], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL2_delay[6]);
  $setuphold (posedge TXUSRCLK2, negedge TXCTRL2[7], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL2_delay[7]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[0], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[0]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[100], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[100]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[101], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[101]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[102], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[102]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[103], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[103]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[104], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[104]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[105], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[105]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[106], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[106]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[107], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[107]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[108], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[108]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[109], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[109]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[10], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[10]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[110], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[110]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[111], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[111]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[112], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[112]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[113], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[113]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[114], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[114]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[115], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[115]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[116], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[116]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[117], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[117]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[118], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[118]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[119], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[119]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[11], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[11]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[120], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[120]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[121], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[121]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[122], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[122]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[123], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[123]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[124], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[124]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[125], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[125]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[126], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[126]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[127], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[127]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[12], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[12]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[13], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[13]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[14], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[14]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[15], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[15]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[16], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[16]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[17], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[17]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[18], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[18]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[19], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[19]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[1], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[1]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[20], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[20]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[21], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[21]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[22], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[22]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[23], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[23]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[24], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[24]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[25], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[25]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[26], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[26]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[27], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[27]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[28], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[28]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[29], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[29]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[2], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[2]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[30], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[30]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[31], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[31]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[32], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[32]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[33], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[33]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[34], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[34]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[35], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[35]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[36], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[36]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[37], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[37]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[38], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[38]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[39], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[39]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[3], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[3]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[40], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[40]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[41], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[41]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[42], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[42]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[43], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[43]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[44], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[44]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[45], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[45]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[46], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[46]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[47], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[47]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[48], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[48]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[49], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[49]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[4], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[4]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[50], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[50]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[51], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[51]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[52], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[52]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[53], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[53]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[54], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[54]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[55], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[55]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[56], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[56]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[57], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[57]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[58], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[58]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[59], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[59]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[5], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[5]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[60], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[60]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[61], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[61]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[62], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[62]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[63], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[63]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[64], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[64]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[65], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[65]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[66], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[66]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[67], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[67]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[68], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[68]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[69], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[69]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[6], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[6]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[70], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[70]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[71], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[71]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[72], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[72]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[73], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[73]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[74], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[74]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[75], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[75]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[76], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[76]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[77], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[77]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[78], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[78]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[79], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[79]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[7], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[7]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[80], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[80]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[81], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[81]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[82], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[82]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[83], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[83]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[84], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[84]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[85], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[85]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[86], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[86]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[87], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[87]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[88], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[88]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[89], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[89]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[8], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[8]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[90], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[90]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[91], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[91]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[92], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[92]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[93], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[93]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[94], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[94]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[95], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[95]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[96], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[96]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[97], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[97]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[98], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[98]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[99], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[99]);
  $setuphold (posedge TXUSRCLK2, negedge TXDATA[9], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[9]);
  $setuphold (posedge TXUSRCLK2, negedge TXDETECTRX, 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDETECTRX_delay);
  $setuphold (posedge TXUSRCLK2, negedge TXELECIDLE, 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXELECIDLE_delay);
  $setuphold (posedge TXUSRCLK2, negedge TXHEADER[0], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXHEADER_delay[0]);
  $setuphold (posedge TXUSRCLK2, negedge TXHEADER[1], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXHEADER_delay[1]);
  $setuphold (posedge TXUSRCLK2, negedge TXHEADER[2], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXHEADER_delay[2]);
  $setuphold (posedge TXUSRCLK2, negedge TXHEADER[3], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXHEADER_delay[3]);
  $setuphold (posedge TXUSRCLK2, negedge TXHEADER[4], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXHEADER_delay[4]);
  $setuphold (posedge TXUSRCLK2, negedge TXHEADER[5], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXHEADER_delay[5]);
  $setuphold (posedge TXUSRCLK2, negedge TXINHIBIT, 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXINHIBIT_delay);
  $setuphold (posedge TXUSRCLK2, negedge TXPD[0], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXPD_delay[0]);
  $setuphold (posedge TXUSRCLK2, negedge TXPD[1], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXPD_delay[1]);
  $setuphold (posedge TXUSRCLK2, negedge TXPOLARITY, 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXPOLARITY_delay);
  $setuphold (posedge TXUSRCLK2, negedge TXPRBSFORCEERR, 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXPRBSFORCEERR_delay);
  $setuphold (posedge TXUSRCLK2, negedge TXPRBSSEL[0], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXPRBSSEL_delay[0]);
  $setuphold (posedge TXUSRCLK2, negedge TXPRBSSEL[1], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXPRBSSEL_delay[1]);
  $setuphold (posedge TXUSRCLK2, negedge TXPRBSSEL[2], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXPRBSSEL_delay[2]);
  $setuphold (posedge TXUSRCLK2, negedge TXPRBSSEL[3], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXPRBSSEL_delay[3]);
  $setuphold (posedge TXUSRCLK2, negedge TXRATE[0], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXRATE_delay[0]);
  $setuphold (posedge TXUSRCLK2, negedge TXRATE[1], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXRATE_delay[1]);
  $setuphold (posedge TXUSRCLK2, negedge TXRATE[2], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXRATE_delay[2]);
  $setuphold (posedge TXUSRCLK2, negedge TXSEQUENCE[0], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXSEQUENCE_delay[0]);
  $setuphold (posedge TXUSRCLK2, negedge TXSEQUENCE[1], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXSEQUENCE_delay[1]);
  $setuphold (posedge TXUSRCLK2, negedge TXSEQUENCE[2], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXSEQUENCE_delay[2]);
  $setuphold (posedge TXUSRCLK2, negedge TXSEQUENCE[3], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXSEQUENCE_delay[3]);
  $setuphold (posedge TXUSRCLK2, negedge TXSEQUENCE[4], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXSEQUENCE_delay[4]);
  $setuphold (posedge TXUSRCLK2, negedge TXSEQUENCE[5], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXSEQUENCE_delay[5]);
  $setuphold (posedge TXUSRCLK2, negedge TXSEQUENCE[6], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXSEQUENCE_delay[6]);
  $setuphold (posedge TXUSRCLK2, posedge TX8B10BBYPASS[0], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TX8B10BBYPASS_delay[0]);
  $setuphold (posedge TXUSRCLK2, posedge TX8B10BBYPASS[1], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TX8B10BBYPASS_delay[1]);
  $setuphold (posedge TXUSRCLK2, posedge TX8B10BBYPASS[2], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TX8B10BBYPASS_delay[2]);
  $setuphold (posedge TXUSRCLK2, posedge TX8B10BBYPASS[3], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TX8B10BBYPASS_delay[3]);
  $setuphold (posedge TXUSRCLK2, posedge TX8B10BBYPASS[4], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TX8B10BBYPASS_delay[4]);
  $setuphold (posedge TXUSRCLK2, posedge TX8B10BBYPASS[5], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TX8B10BBYPASS_delay[5]);
  $setuphold (posedge TXUSRCLK2, posedge TX8B10BBYPASS[6], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TX8B10BBYPASS_delay[6]);
  $setuphold (posedge TXUSRCLK2, posedge TX8B10BBYPASS[7], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TX8B10BBYPASS_delay[7]);
  $setuphold (posedge TXUSRCLK2, posedge TX8B10BEN, 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TX8B10BEN_delay);
  $setuphold (posedge TXUSRCLK2, posedge TXCOMINIT, 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCOMINIT_delay);
  $setuphold (posedge TXUSRCLK2, posedge TXCOMSAS, 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCOMSAS_delay);
  $setuphold (posedge TXUSRCLK2, posedge TXCOMWAKE, 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCOMWAKE_delay);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL0[0], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[0]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL0[10], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[10]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL0[11], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[11]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL0[12], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[12]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL0[13], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[13]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL0[14], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[14]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL0[15], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[15]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL0[1], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[1]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL0[2], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[2]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL0[3], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[3]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL0[4], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[4]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL0[5], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[5]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL0[6], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[6]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL0[7], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[7]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL0[8], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[8]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL0[9], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL0_delay[9]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL1[0], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[0]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL1[10], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[10]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL1[11], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[11]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL1[12], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[12]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL1[13], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[13]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL1[14], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[14]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL1[15], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[15]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL1[1], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[1]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL1[2], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[2]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL1[3], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[3]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL1[4], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[4]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL1[5], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[5]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL1[6], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[6]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL1[7], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[7]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL1[8], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[8]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL1[9], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL1_delay[9]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL2[0], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL2_delay[0]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL2[1], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL2_delay[1]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL2[2], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL2_delay[2]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL2[3], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL2_delay[3]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL2[4], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL2_delay[4]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL2[5], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL2_delay[5]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL2[6], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL2_delay[6]);
  $setuphold (posedge TXUSRCLK2, posedge TXCTRL2[7], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXCTRL2_delay[7]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[0], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[0]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[100], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[100]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[101], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[101]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[102], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[102]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[103], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[103]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[104], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[104]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[105], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[105]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[106], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[106]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[107], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[107]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[108], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[108]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[109], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[109]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[10], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[10]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[110], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[110]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[111], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[111]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[112], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[112]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[113], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[113]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[114], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[114]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[115], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[115]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[116], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[116]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[117], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[117]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[118], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[118]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[119], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[119]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[11], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[11]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[120], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[120]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[121], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[121]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[122], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[122]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[123], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[123]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[124], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[124]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[125], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[125]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[126], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[126]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[127], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[127]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[12], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[12]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[13], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[13]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[14], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[14]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[15], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[15]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[16], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[16]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[17], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[17]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[18], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[18]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[19], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[19]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[1], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[1]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[20], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[20]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[21], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[21]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[22], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[22]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[23], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[23]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[24], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[24]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[25], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[25]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[26], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[26]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[27], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[27]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[28], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[28]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[29], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[29]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[2], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[2]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[30], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[30]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[31], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[31]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[32], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[32]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[33], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[33]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[34], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[34]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[35], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[35]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[36], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[36]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[37], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[37]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[38], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[38]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[39], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[39]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[3], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[3]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[40], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[40]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[41], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[41]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[42], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[42]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[43], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[43]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[44], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[44]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[45], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[45]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[46], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[46]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[47], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[47]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[48], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[48]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[49], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[49]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[4], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[4]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[50], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[50]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[51], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[51]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[52], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[52]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[53], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[53]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[54], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[54]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[55], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[55]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[56], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[56]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[57], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[57]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[58], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[58]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[59], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[59]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[5], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[5]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[60], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[60]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[61], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[61]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[62], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[62]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[63], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[63]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[64], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[64]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[65], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[65]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[66], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[66]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[67], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[67]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[68], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[68]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[69], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[69]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[6], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[6]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[70], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[70]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[71], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[71]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[72], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[72]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[73], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[73]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[74], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[74]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[75], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[75]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[76], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[76]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[77], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[77]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[78], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[78]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[79], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[79]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[7], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[7]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[80], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[80]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[81], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[81]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[82], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[82]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[83], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[83]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[84], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[84]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[85], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[85]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[86], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[86]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[87], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[87]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[88], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[88]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[89], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[89]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[8], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[8]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[90], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[90]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[91], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[91]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[92], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[92]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[93], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[93]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[94], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[94]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[95], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[95]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[96], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[96]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[97], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[97]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[98], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[98]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[99], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[99]);
  $setuphold (posedge TXUSRCLK2, posedge TXDATA[9], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDATA_delay[9]);
  $setuphold (posedge TXUSRCLK2, posedge TXDETECTRX, 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXDETECTRX_delay);
  $setuphold (posedge TXUSRCLK2, posedge TXELECIDLE, 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXELECIDLE_delay);
  $setuphold (posedge TXUSRCLK2, posedge TXHEADER[0], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXHEADER_delay[0]);
  $setuphold (posedge TXUSRCLK2, posedge TXHEADER[1], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXHEADER_delay[1]);
  $setuphold (posedge TXUSRCLK2, posedge TXHEADER[2], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXHEADER_delay[2]);
  $setuphold (posedge TXUSRCLK2, posedge TXHEADER[3], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXHEADER_delay[3]);
  $setuphold (posedge TXUSRCLK2, posedge TXHEADER[4], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXHEADER_delay[4]);
  $setuphold (posedge TXUSRCLK2, posedge TXHEADER[5], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXHEADER_delay[5]);
  $setuphold (posedge TXUSRCLK2, posedge TXINHIBIT, 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXINHIBIT_delay);
  $setuphold (posedge TXUSRCLK2, posedge TXPD[0], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXPD_delay[0]);
  $setuphold (posedge TXUSRCLK2, posedge TXPD[1], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXPD_delay[1]);
  $setuphold (posedge TXUSRCLK2, posedge TXPOLARITY, 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXPOLARITY_delay);
  $setuphold (posedge TXUSRCLK2, posedge TXPRBSFORCEERR, 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXPRBSFORCEERR_delay);
  $setuphold (posedge TXUSRCLK2, posedge TXPRBSSEL[0], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXPRBSSEL_delay[0]);
  $setuphold (posedge TXUSRCLK2, posedge TXPRBSSEL[1], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXPRBSSEL_delay[1]);
  $setuphold (posedge TXUSRCLK2, posedge TXPRBSSEL[2], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXPRBSSEL_delay[2]);
  $setuphold (posedge TXUSRCLK2, posedge TXPRBSSEL[3], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXPRBSSEL_delay[3]);
  $setuphold (posedge TXUSRCLK2, posedge TXRATE[0], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXRATE_delay[0]);
  $setuphold (posedge TXUSRCLK2, posedge TXRATE[1], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXRATE_delay[1]);
  $setuphold (posedge TXUSRCLK2, posedge TXRATE[2], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXRATE_delay[2]);
  $setuphold (posedge TXUSRCLK2, posedge TXSEQUENCE[0], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXSEQUENCE_delay[0]);
  $setuphold (posedge TXUSRCLK2, posedge TXSEQUENCE[1], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXSEQUENCE_delay[1]);
  $setuphold (posedge TXUSRCLK2, posedge TXSEQUENCE[2], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXSEQUENCE_delay[2]);
  $setuphold (posedge TXUSRCLK2, posedge TXSEQUENCE[3], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXSEQUENCE_delay[3]);
  $setuphold (posedge TXUSRCLK2, posedge TXSEQUENCE[4], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXSEQUENCE_delay[4]);
  $setuphold (posedge TXUSRCLK2, posedge TXSEQUENCE[5], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXSEQUENCE_delay[5]);
  $setuphold (posedge TXUSRCLK2, posedge TXSEQUENCE[6], 0:0:0, 0:0:0, notifier,,, TXUSRCLK2_delay, TXSEQUENCE_delay[6]);
`endif
  specparam PATHPULSE$ = 0;
endspecify

endmodule

`endcelldefine
