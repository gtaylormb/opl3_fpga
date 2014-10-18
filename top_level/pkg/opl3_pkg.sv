/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: opl3_pkg.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 13 Oct 2014
#
#   DESCRIPTION:
#   Generates a clk enable pulse based on the frequency specified by
#   OUTPUT_CLK_EN_FREQ.
#
#   CHANGE HISTORY:
#   13 Oct 2014        Greg Taylor
#       Initial version
#
#   SVN Identification
#   $Id$
#******************************************************************************/

package opl3_pkg;
    parameter SAMPLE_FREQ = 49.7e3;
    parameter DAC_OVERSAMPLE = 256;
    parameter CLK_FREQ = SAMPLE_FREQ*DAC_OVERSAMPLE;
    
    parameter REG_MULT_WIDTH = 4;
    parameter REG_FNUM_WIDTH = 10;
    parameter REG_BLOCK_WIDTH = 3;
    
    parameter SAMPLE_WIDTH = 16;

endpackage
