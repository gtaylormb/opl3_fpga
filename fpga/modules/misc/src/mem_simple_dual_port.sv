`timescale 1ns / 1ps
`default_nettype none

module mem_simple_dual_port #(
    parameter type type_t = logic,
    parameter DATA_WIDTH = $bits(type_t),
    parameter DEPTH = 0,
    parameter OUTPUT_DELAY = 0, // 0, 1, or 2
    parameter DEFAULT_VALUE = 0
) (
    input wire clka,
    input wire clkb,
    input wire wea,
    input wire reb, // only used if OUTPUT_DELAY >0
    input wire [$clog2(DEPTH)-1:0] addra,
    input wire [$clog2(DEPTH)-1:0] addrb,
    input var type_t dia,
    output type_t dob
);
    type_t dob_p0;
    type_t dob_p1 = DEFAULT_VALUE;
    type_t dob_p2 = DEFAULT_VALUE;

    type_t ram [DEPTH-1:0] = '{default: DEFAULT_VALUE};

    always_ff @(posedge clka)
        if (wea)
            ram[addra] <= dia;

    always_comb dob_p0 = ram[addrb];

    always_ff @(posedge clkb) begin
        if (reb)
            dob_p1 <= dob_p0;

        dob_p2 <= dob_p1;
    end

    if (OUTPUT_DELAY == 0)
        always_comb dob = dob_p0;
    else if (OUTPUT_DELAY == 1)
        always_comb dob = dob_p1;
    else if (OUTPUT_DELAY == 2)
        always_comb dob = dob_p2;
    else
        $fatal("OUTPUT_DELAY must be 0, 1, or 2");
endmodule
`default_nettype wire