`include "mult.v"

// A simple ALU for addition and multiplication. opsel = 1 means add, opsel = 0 means mult.
module alu
(
    input logic         clk,
    input logic         reset,

    input  logic [31:0] in0,
    input  logic [31:0] in1,
    input  logic        opsel,
    output logic [31:0] out
);

    logic [31:0] add_s0;
    assign add_s0 = in0 + in1;

    logic [31:0] add_s1;
    logic [31:0] add_s2;
    logic [31:0] add_s3;
    logic [31:0] add_result;

    always_ff @(posedge clk) begin
        if (reset) begin
            add_s1 <= 0;
            add_s2 <= 0;
            add_s3 <= 0;
            add_result <= 0;
        end else begin
            add_s1 <= in0 + in1;
            add_s2 <= add_s1;
            add_s3 <= add_s2;
            add_result <= add_s3;
        end
    end


    logic [31:0] mult_result;
    
    imul multiplier
    (
        .clk   (clk),
        .reset (reset),
        .in0   (in0),
        .in1   (in1),
        .out   (mult_result)
    );

    assign out = opsel ? add_result : mult_result;

endmodule