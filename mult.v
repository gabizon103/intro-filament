// An fixed-latency multiplier that produces its output on the 3rd cycle.
// cycle 0: in0 = 5, in1 = 6
// cycle 1: nothing
// cycle 2: nothing
// cycle 3: 30
module imul(
    input logic clk,
    input logic reset,

    input logic [31:0] in0,
    input logic [31:0] in1,

    output logic [31:0] out
);

    logic [31:0] mult_s1;
    logic [31:0] mult_s2;
    logic [31:0] mult_s3;
    logic [31:0] mult_s4;

    always_ff @(posedge clk) begin
        if (reset) begin
            mult_s1 <= 32'd0;
            mult_s2 <= 32'd0;
            mult_s3 <= 32'd0;
            mult_s4 <= 32'd0;
        end else begin
            mult_s1 <= in0 * in1;
            mult_s2 <= mult_s1;
            mult_s3 <= mult_s2;
            mult_s4 <= mult_s3;

        end
    end

    assign out = mult_s4;

endmodule