`timescale 1ns / 1ps

module tb_alu;
    // Parameters
    parameter WIDTH = 4;

    // Testbench signals
    reg s;
    reg [WIDTH-1:0] a;
    reg [WIDTH-1:0] b;
    wire [WIDTH-1:0] out;
    wire carry_out;

    // Instantiate the ALU module
    alu uut (
        .s(s),
        .a(a),
        .b(b),
        .out(out),
        .carry_out(carry_out)
    );

    // Test procedure
    initial begin
        $display("Starting ALU Testbench...");

        // Test case 1: Addition (s = 0)
        s = 0;
        a = 4'b0011; // 3
        b = 4'b0101; // 5
        #10;
        $display("s = %b, a = %b, b = %b, out = %b, carry_out = %b", s, a, b, out, carry_out);

        // Test case 2: Subtraction (s = 1)
        s = 1;
        a = 4'b1010; // 10
        b = 4'b0011; // 3
        #10;
        $display("s = %b, a = %b, b = %b, out = %b, carry_out = %b", s, a, b, out, carry_out);

        // Test case 3: Addition with carry (s = 0)
        s = 0;
        a = 4'b1111; // 15
        b = 4'b0001; // 1
        #10;
        $display("s = %b, a = %b, b = %b, out = %b, carry_out = %b", s, a, b, out, carry_out);

        // Test case 4: Subtraction with negative result (s = 1)
        s = 1;
        a = 4'b0010; // 2
        b = 4'b0100; // 4
        #10;
        $display("s = %b, a = %b, b = %b, out = %b, carry_out = %b", s, a, b, out, carry_out);

        // End of test
        $display("ALU Testbench completed.");
        $finish;
    end
endmodule
