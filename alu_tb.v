`include "alu.v"

module tb;

    logic reset = 1;

    logic clk = 1;
    always #5 clk = ~clk;

    logic        opsel;
    logic [31:0] in0;
    logic [31:0] in1;

    logic [31:0] out;

    alu my_alu
    (
        .*
    );

    initial begin
        $dumpfile("alu_tb.vcd");
        $dumpvars;

        #11;
        reset = 0;
        in0 = 2;
        in1 = 4;
        opsel = 1;
        #10;
        $display("cycle 0: in0 = %x, in1 = %x, opsel = %x", in0, in1, opsel);
        $display("cycle 0: out = %x", out);

        #10;
        $display("cycle 1: in0 = %x, in1 = %x, opsel = %x", in0, in1, opsel);
        $display("cycle 1: out = %x", out);

        #10;
        $display("cycle 2: in0 = %x, in1 = %x, opsel = %x", in0, in1, opsel);
        $display("cycle 2: out = %x", out);

        #10;
        $display("cycle 3: in0 = %x, in1 = %x, opsel = %x", in0, in1, opsel);
        $display("cycle 3: out = %x", out);

        reset = 1;
        #10;

        $display("cycle 4: reset = %x", reset);

        reset = 0;
        in0 = 2;
        in1 = 4;
        opsel = 0;
        #10;
        $display("cycle 5: in0 = %x, in1 = %x, opsel = %x", in0, in1, opsel);
        $display("cycle 5: out = %x", out);

        in0 = 'x;
        in1 = 'x;
        opsel = 0;
        #10;
        $display("cycle 6: in0 = %x, in1 = %x, opsel = %x", in0, in1, opsel);
        $display("cycle 6: out = %x", out);
        #10;
        $display("cycle 7: in0 = %x, in1 = %x, opsel = %x", in0, in1, opsel);
        $display("cycle 7: out = %x", out);
        #10;
        $display("cycle 8: in0 = %x, in1 = %x, opsel = %x", in0, in1, opsel);
        $display("cycle 8: out = %x", out);

        $finish;
    end



endmodule