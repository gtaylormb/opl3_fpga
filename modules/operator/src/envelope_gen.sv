/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: envelope_gen.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 30 Oct 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   30 Oct 2014    Greg Taylor
#       Initial version
#
#   SVN Identification
#   $Id$
#******************************************************************************/
`timescale 1ns / 1ps
`default_nettype none // disable implicit net type declarations

import opl3_pkg::*;

module envelope_gen (
	input wire clk,
	input wire en,
    input wire [REG_ENV_WIDTH-1:0] ar, // attack rate
    input wire [REG_ENV_WIDTH-1:0] dr, // decay rate
    input wire [REG_ENV_WIDTH-1:0] sl, // sustain level
    input wire [REG_ENV_WIDTH-1:0] rr, // release rate
    input wire [REG_TL_WIDTH-1:0] tl,  // total level
    input wire ksr,                    // key scale rate
    input wire [REG_KSL_WIDTH-1:0] ksl, // key scale level
    input wire egt,                     // envelope type
    input wire am,                      // amplitude modulation (tremolo)
    input wire [REG_FNUM_WIDTH-1:0] fnum,
    input wire [REG_MULT_WIDTH-1:0] mult,
    input wire [REG_BLOCK_WIDTH-1:0] block,
    input wire key_on_pulse,
    input wire key_off_pulse,
    output logic [ENV_WIDTH-1:0] env
);
    localparam KSL_ADD_WIDTH = 8;
    localparam COUNTER_WIDTH = 16;
    
    wire [KSL_ADD_WIDTH-1:0] ksl_add;
    logic [COUNTER_WIDTH-1:0] counter = 0;
    
    calc_ksl_add calc_ksl_add (
        .*
    );
    
    always_ff @(posedge clk)
        if (en)
            counter <= counter + 1;
    
    
    
    
endmodule
`default_nettype wire  // re-enable implicit net type declarations
	