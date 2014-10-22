/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: ssm2603_init.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 18 Oct 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   18 Oct 2014    Greg Taylor
#       Initial version
#
#   SVN Identification
#   $Id$
#******************************************************************************/
`timescale 1ns / 1ps
`default_nettype none  // disable implicit net type declarations

import opl3_pkg::*;

module ssm2603_init #(
	parameter I2C_FREQ = 50e3, // in hz
    parameter DEV_ADDR = 8'b0011010,
    parameter CAP_CHARGE_DELAY = 71.4e-3 // in seconds, based on datasheet p.11
)(
	input wire clk,
	input wire reset,
    inout wire i2c_scl,
    inout wire i2c_sda,
    output logic ac_mute_n
);
    localparam [15:0] I2C_PRESCALE_REG = CLK_FREQ/(5*I2C_FREQ) - 1;
    localparam int DELAY_COUNT = CAP_CHARGE_DELAY*CLK_FREQ;
    
    logic start = 0;
    logic stop = 0;
    logic read = 0;
    logic write = 0;
    wire begin_write;
    logic ack_in = 0;
    logic [7:0] din = 0;
    wire cmd_ack;
    wire ack_out;
    wire [7:0] dout;
    wire i2c_busy;
    wire i2c_al;
    logic scl_i;
    wire scl_o;
    wire scl_oen;
    logic sda_i;
    wire sda_o;
    wire sda_oen;
    logic [$clog2(DELAY_COUNT)-1:0] delay_count = 0;
    
    typedef enum  {
        IDLE,
        BEGIN,
        FIRST_WR_DEV_ADDR,
        FIRST_WR_SUB_ADDR,
        FIRST_WR_DATA,
        SECOND_WR_DEV_ADDR,
        SECOND_WR_SUB_ADDR,
        SECOND_WR_DATA,
        THIRD_WR_DEV_ADDR,
        THIRD_WR_SUB_ADDR,
        THIRD_WR_DATA,       
        FOURTH_WR_DEV_ADDR,
        FOURTH_WR_SUB_ADDR,
        FOURTH_WR_DATA,      
        FIFTH_WR_DEV_ADDR,
        FIFTH_WR_SUB_ADDR,
        FIFTH_WR_DATA,
        DELAY_FOR_CAP_CHARGE,           
        SIXTH_WR_DEV_ADDR,
        SIXTH_WR_SUB_ADDR,
        SIXTH_WR_DATA,
        SEVENTH_WR_DEV_ADDR,
        SEVENTH_WR_SUB_ADDR,
        SEVENTH_WR_DATA 
    } state_t;
    
    state_t state;
    state_t next_state;
    
    always_ff @(posedge clk)
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
        
    always_comb
        unique case (state)
        BEGIN:                  next_state = FIRST_WR_DEV_ADDR;
        FIRST_WR_DEV_ADDR:      next_state = !write && !ack_out ? FIRST_WR_SUB_ADDR : FIRST_WR_DEV_ADDR;
        FIRST_WR_SUB_ADDR:      next_state = !write && !ack_out ? FIRST_WR_DATA : FIRST_WR_SUB_ADDR;
        FIRST_WR_DATA:          next_state = !write && !ack_out ? SECOND_WR_DEV_ADDR : FIRST_WR_DATA;
        SECOND_WR_DEV_ADDR:     next_state = !write && !ack_out ? SECOND_WR_SUB_ADDR : SECOND_WR_DEV_ADDR;
        SECOND_WR_SUB_ADDR:     next_state = !write && !ack_out ? SECOND_WR_DATA : SECOND_WR_SUB_ADDR;
        SECOND_WR_DATA:         next_state = !write && !ack_out ? THIRD_WR_DEV_ADDR : SECOND_WR_DATA;
        THIRD_WR_DEV_ADDR:      next_state = !write && !ack_out ? THIRD_WR_SUB_ADDR : THIRD_WR_DEV_ADDR;
        THIRD_WR_SUB_ADDR:      next_state = !write && !ack_out ? THIRD_WR_DATA : THIRD_WR_SUB_ADDR;
        THIRD_WR_DATA:          next_state = !write && !ack_out ? FOURTH_WR_DEV_ADDR : THIRD_WR_DATA;                 
        FOURTH_WR_DEV_ADDR:     next_state = !write && !ack_out ? FOURTH_WR_SUB_ADDR : FOURTH_WR_DEV_ADDR;
        FOURTH_WR_SUB_ADDR:     next_state = !write && !ack_out ? FOURTH_WR_DATA : FOURTH_WR_SUB_ADDR;
        FOURTH_WR_DATA:         next_state = !write && !ack_out ? FIFTH_WR_DEV_ADDR : FOURTH_WR_DATA;    
        FIFTH_WR_DEV_ADDR:      next_state = !write && !ack_out ? FIFTH_WR_SUB_ADDR : FIFTH_WR_DEV_ADDR;
        FIFTH_WR_SUB_ADDR:      next_state = !write && !ack_out ? FIFTH_WR_DATA : FIFTH_WR_SUB_ADDR;
        FIFTH_WR_DATA:          next_state = !write && !ack_out ? DELAY_FOR_CAP_CHARGE : FIFTH_WR_DATA; 
        DELAY_FOR_CAP_CHARGE:   next_state = delay_count == DELAY_COUNT - 1 ? SIXTH_WR_DEV_ADDR : DELAY_FOR_CAP_CHARGE;            
        SIXTH_WR_DEV_ADDR:      next_state = !write && !ack_out ? SIXTH_WR_SUB_ADDR : SIXTH_WR_DEV_ADDR;
        SIXTH_WR_SUB_ADDR:      next_state = !write && !ack_out ? SIXTH_WR_DATA : SIXTH_WR_SUB_ADDR;
        SIXTH_WR_DATA:          next_state = !write && !ack_out ? SEVENTH_WR_DEV_ADDR : SIXTH_WR_DATA;
        SEVENTH_WR_DEV_ADDR:    next_state = !write && !ack_out ? SEVENTH_WR_SUB_ADDR : SEVENTH_WR_DEV_ADDR;
        SEVENTH_WR_SUB_ADDR:    next_state = !write && !ack_out ? SEVENTH_WR_DATA : SEVENTH_WR_SUB_ADDR;
        SEVENTH_WR_DATA:        next_state = !write && !ack_out ? IDLE : SEVENTH_WR_DATA;                   
        default:                next_state = IDLE;
        endcase
            
    always_ff @(posedge clk)
        if (cmd_ack)
            start <= 0;      
        else if (next_state == FIRST_WR_DEV_ADDR ||
         next_state == SECOND_WR_DEV_ADDR ||
         next_state == THIRD_WR_DEV_ADDR ||
         next_state == FOURTH_WR_DEV_ADDR ||
         next_state == FIFTH_WR_DEV_ADDR ||
         next_state == SIXTH_WR_DEV_ADDR ||
         next_state == SEVENTH_WR_DEV_ADDR)
            start <= 1;
    
    always_ff @(posedge clk)   
        if (cmd_ack)
            stop <= 0;         
        else if (next_state == FIRST_WR_DATA ||
         next_state == SECOND_WR_DATA ||
         next_state == THIRD_WR_DATA ||
         next_state == FOURTH_WR_DATA ||
         next_state == FIFTH_WR_DATA ||
         next_state == SIXTH_WR_DATA ||
         next_state == SEVENTH_WR_DATA)
            stop <= 1;
        
    always_ff @(posedge clk)
        if (cmd_ack)
            write <= 0;        
        else if (next_state != IDLE && next_state != DELAY_FOR_CAP_CHARGE && next_state != BEGIN)
            write <= 1;
        
    always_ff @(posedge clk)
        unique case (state)
        FIRST_WR_DEV_ADDR:   din <= DEV_ADDR << 1;
        FIRST_WR_SUB_ADDR:   din <= 8'h06;        // power management addr
        FIRST_WR_DATA:       din <= 8'b01110111;  // power on needed functions (except output)
        SECOND_WR_DEV_ADDR:  din <= DEV_ADDR << 1;
        SECOND_WR_SUB_ADDR:  din <= 8'h04;              // analog audio addr
        SECOND_WR_DATA:      din <= 8'b00010010;        // select DAC, disable bypass
        THIRD_WR_DEV_ADDR:   din <= DEV_ADDR << 1;
        THIRD_WR_SUB_ADDR:   din <= 8'h05;              // digital audio addr
        THIRD_WR_DATA:       din <= 8'b0;         // unmute DAC
        FOURTH_WR_DEV_ADDR:  din <= DEV_ADDR << 1;
        FOURTH_WR_SUB_ADDR:  din <= 8'h7;        // digital audio i/f addr
        FOURTH_WR_DATA:      din <= 8'b10;        // change i2s to 16 bit 
        FIFTH_WR_DEV_ADDR:   din <= DEV_ADDR << 1;
        FIFTH_WR_SUB_ADDR:   din <= 8'h8;        // sampling rate addr
        FIFTH_WR_DATA:       din <= 8'b0;        // set to 48KHz (assuming 12.288MHz mclk, ours is a bit faster)             
        SIXTH_WR_DEV_ADDR:   din <= DEV_ADDR << 1;
        SIXTH_WR_SUB_ADDR:   din <= 8'h9;        // digital core addr
        SIXTH_WR_DATA:       din <= 8'b1;        // activate digital core
        SEVENTH_WR_DEV_ADDR: din <= DEV_ADDR << 1;
        SEVENTH_WR_SUB_ADDR: din <= 8'h06;        // power management addr
        SEVENTH_WR_DATA:     din <= 8'b01100111;  // power on output        
        default:             din <= 0;
        endcase
            
    always_ff @(posedge clk)
        if (reset)
            delay_count <= 0;
        else if (state == DELAY_FOR_CAP_CHARGE)
            delay_count <= delay_count + 1;
    
    i2c_master_byte_ctrl i2c_controller_inst (
        .rst      (reset),
        .nReset   (1'b1),
        .ena      (1'b1),
        .clk_cnt  (I2C_PRESCALE_REG),
        .*
    );
    
    always_comb scl_i = i2c_scl;
    always_comb sda_i = i2c_sda;
    assign i2c_scl = scl_oen ? 1'bZ : scl_o;
    assign i2c_sda = sda_oen ? 1'bZ : sda_o; 
    
    always_comb ac_mute_n = state == IDLE;
endmodule
`default_nettype wire  // re-enable implicit net type declarations