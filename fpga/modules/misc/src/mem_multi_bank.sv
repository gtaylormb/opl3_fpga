`timescale 1ns / 1ps
`default_nettype none

module mem_multi_bank #(
    parameter type type_t = logic,
    parameter DEPTH = 0,
    parameter OUTPUT_DELAY = 0, // 0, 1, or 2
    parameter DEFAULT_VALUE = 0,
    parameter NUM_BANKS = 0,
    parameter BANK_WIDTH = $clog2(NUM_BANKS)
) (
    input wire clk,
    input wire wea,
    input wire reb, // only used if OUTPUT_DELAY >0
    input wire [BANK_WIDTH-1:0] banka,
    input wire [$clog2(DEPTH)-1:0] addra,
    input wire [BANK_WIDTH-1:0] bankb,
    input wire [$clog2(DEPTH)-1:0] addrb,
    input var type_t dia,
    output type_t dob
);
    localparam PIPELINE_DELAY = 2;

    logic [NUM_BANKS-1:0] wea_array;
    logic [NUM_BANKS-1:0] reb_array;
    type_t dob_array [NUM_BANKS];
    logic [PIPELINE_DELAY:0] [BANK_WIDTH-1:0] bankb_p;

    pipeline_sr #(
        .type_t(logic [BANK_WIDTH-1:0]),
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) bankb_sr (
        .clk,
        .in(bankb),
        .out(bankb_p)
    );

    for (genvar i = 0; i < NUM_BANKS; ++i) begin
        always_comb begin
            wea_array[i] = wea && banka == i;
            reb_array[i] = reb && bankb == i;
        end

        mem_simple_dual_port_auto #(
            .type_t(type_t),
            .DEPTH(DEPTH),
            .OUTPUT_DELAY(OUTPUT_DELAY),
            .DEFAULT_VALUE(DEFAULT_VALUE)
        ) mem_bank (
            .clka(clk),
            .clkb(clk),
            .wea(wea_array[i]),
            .reb(reb_array[i]),
            .addra,
            .addrb,
            .dia,
            .dob(dob_array[i])
        );
    end

    always_comb dob = dob_array[bankb_p[OUTPUT_DELAY]];
endmodule
`default_nettype wire