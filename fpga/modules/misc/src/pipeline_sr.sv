`timescale 1ns / 1ps
`default_nettype none

module pipeline_sr #(
    parameter type type_t = logic,
    parameter STARTING_CYCLE = 1,
    parameter ENDING_CYCLE = 1,
    parameter POR_VALUE = 0 // power on reset value of pipeline registers
) (
    input wire clk,
    input var type_t in,
    output type_t [ENDING_CYCLE:STARTING_CYCLE] out = '{default: POR_VALUE}
);
    always_ff @(posedge clk) begin
        out <= out << $bits(type_t);
        out[STARTING_CYCLE] <= in;
    end
endmodule
`default_nettype wire