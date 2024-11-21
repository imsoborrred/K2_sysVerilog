`timescale 1ns / 1ps

module tb_register;
    // Parameters
    parameter WIDTH = 4;

    // Testbench signals
    reg [WIDTH-1:0] data;
    reg clk;
    reg reset;
    reg en;
    wire [WIDTH-1:0] q;

    // Instantiate the register module
    register #(.WIDTH(WIDTH)) uut (
        .data(data),
        .clk(clk),
        .reset(reset),
        .en(en),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Generate a clock with a period of 10 time units
    end

    // Test procedure
    initial begin
        $display("Starting Register Testbench...");

        // Apply reset
        reset = 0;
        en = 0;
        data = 4'b0000;
        #10;

        // Release reset
        reset = 1;
        #10;

        // Test case 1: Enable is low, data should not be latched
        en = 0;
        data = 4'b1010;
        #10;
        $display("Time: %0t | reset: %b | en: %b | data: %b | q: %b", $time, reset, en, data, q);

        // Test case 2: Enable is high, data should be latched
        en = 1;
        data = 4'b1100;
        #10;
        $display("Time: %0t | reset: %b | en: %b | data: %b | q: %b", $time, reset, en, data, q);

        // Test case 3: Change data while enabled
        data = 4'b0110;
        #10;
        $display("Time: %0t | reset: %b | en: %b | data: %b | q: %b", $time, reset, en, data, q);

        // Test case 4: Disable enable, data should not change
        en = 0;
        data = 4'b1111;
        #10;
        $display("Time: %0t | reset: %b | en: %b | data: %b | q: %b", $time, reset, en, data, q);

        // Apply reset again
        reset = 0;
        #10;
        $display("Time: %0t | reset: %b | en: %b | data: %b | q: %b (after reset)", $time, reset, en, data, q);

        // End of test
        $display("Register Testbench completed.");
        $finish;
    end
endmodule
