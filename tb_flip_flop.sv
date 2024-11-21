`timescale 1ns / 1ps

module tb_flip_flop;
    // Testbench signals
    reg data;
    reg clk;
    reg reset;
    reg en;
    wire q;

    // Instantiate the Flip Flop module
    flip_flop uut (
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
        $display("Starting Flip Flop Testbench...");

        // Apply reset
        reset = 0;
        en = 0;
        data = 1'b0;
        #10;

        // Release reset
        reset = 1;
        #10;

        // Test case 1: Enable is low, data should not be latched
        en = 0;
        data = 1'b1;
        #10;
        $display("Time: %0t | reset: %b | en: %b | data: %b | q: %b", $time, reset, en, data, q);

        // Test case 2: Enable is high, data should be latched
        en = 1;
        data = 1'b0;
        #10;
        $display("Time: %0t | reset: %b | en: %b | data: %b | q: %b", $time, reset, en, data, q);

        // Test case 3: Change data while enabled
        data = 1'b1;
        #10;
        $display("Time: %0t | reset: %b | en: %b | data: %b | q: %b", $time, reset, en, data, q);

        // Test case 4: Disable enable, data should not change
        en = 0;
        data = 1'b0;
        #10;
        $display("Time: %0t | reset: %b | en: %b | data: %b | q: %b", $time, reset, en, data, q);

        // Apply reset again
        reset = 0;
        #10;
        $display("Time: %0t | reset: %b | en: %b | data: %b | q: %b (after reset)", $time, reset, en, data, q);

        // End of test
        $display("Flip Flop Testbench completed.");
        $finish;
    end
endmodule
