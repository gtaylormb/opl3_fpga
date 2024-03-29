`timescale 1ns / 1ps
`default_nettype none

module pipeline_sr #(
    parameter type type_t = logic,
    parameter STARTING_CYCLE = 0,
    parameter ENDING_CYCLE = 0,
    parameter POR_VALUE = 0 // power on reset value of pipeline registers
) (
    input wire clk,
    input var type_t in,
    output type_t [ENDING_CYCLE:STARTING_CYCLE] out = '{default: POR_VALUE}
);
    always_comb out[STARTING_CYCLE] = in;

    for (genvar i = STARTING_CYCLE + 1; i <= ENDING_CYCLE; ++i)
        always_ff @(posedge clk)
            out[i] <= out[i - 1];
endmodule
`default_nettype wire