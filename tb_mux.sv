`timescale 1ns / 1ps

module tb_mux;
    // Parameters
    parameter width = 8;

    // Testbench signals
    reg [width-1:0] a;
    reg [width-1:0] b;
    reg s;
    wire [width-1:0] y;

    // Instantiate the MUX module
    mux #(.width(width)) uut (
        .a(a),
        .b(b),
        .s(s),
        .y(y)
    );

    // Test procedure
    initial begin
        $display("Starting MUX Testbench...");

        // Test case 1: s = 0, select b
        a = 8'b10101010;
        b = 8'b01010101;
        s = 0;
        #10;
        $display("s = %b, a = %b, b = %b, y = %b", s, a, b, y);

        // Test case 2: s = 1, select a
        s = 1;
        #10;
        $display("s = %b, a = %b, b = %b, y = %b", s, a, b, y);

        // Test case 3: Change inputs, s = 0
        a = 8'b11110000;
        b = 8'b00001111;
        s = 0;
        #10;
        $display("s = %b, a = %b, b = %b, y = %b", s, a, b, y);

        // Test case 4: Change inputs, s = 1
        s = 1;
        #10;
        $display("s = %b, a = %b, b = %b, y = %b", s, a, b, y);

        $display("MUX Testbench completed.");
        $finish;
    end
endmodule

