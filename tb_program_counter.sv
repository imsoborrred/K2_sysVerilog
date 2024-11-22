`timescale 1ns / 1ps

module tb_program_counter;

    localparam n = 8;
    localparam intructions = 9;
    localparam instructions_bits = $clog2(intructions);

    reg clk;
    reg reset;
    reg [n-1:0] data;
    reg [instructions_bits-1:0] counter;
    reg jump;
    reg [2:0] jump_imm;
    
    // Instantiate the register module
    program_counter uut (
        .clk(clk),
        .reset(reset),
        .data(data),
        .jump(jump),
        .jump_imm(jump_imm),
        .counter(counter)
    );

    // Initial block to apply stimulus
    initial begin
        // Monitor signals
        $monitor("Time=%0t | clk=%b | reset=%b | data=%b | counter=%b | jump=%b | jump_imm=%b", $time, clk, reset, data, counter, jump, jump_imm);

        // Initial values
        clk = 0; reset = 0; data[n-1:0] = 0;
        
        // Test sequence
        #10 data = 1; clk = 1; reset=1;  // Data=1, Clock High, q1 should follow data
        #10 data = 0; clk = 1;         // Data=0, Clock High, q1 should follow data
         clk = 0;
        #10 clk = 1; jump = 0; jump_imm = 3'b000; // Clock Low, q1 should hold its value
        #10 clk = 0;
        #10 data = 0; clk = 1;        
        #10 clk = 0;
        #10 clk = 1;
        #10 clk = 0;
        #10 clk = 1;
        #10 clk = 0;
        #10 clk = 1;
        #10 clk = 0;
        #10 clk = 1;
        #10 clk = 0;
        #10 clk = 1;
        #10 clk = 0;
        #10 clk = 1;        
        #10 clk = 0;
        #10 clk = 1; jump = 1; jump_imm = 3'b101;
        #10 clk = 0;
        #10 clk = 1; jump = 1; jump_imm = 3'b111;
        #10 clk = 0;
        #10 clk = 1; jump = 0; jump_imm = 3'b100;       
        #10 clk = 0;
        #10 clk = 1; jump = 1; jump_imm = 3'b100;
        #10 clk = 0;
        #10 clk = 1; jump = 1; jump_imm = 3'b011;
        #10 clk = 0;
        #10 clk = 1; jump = 0;
        #10 clk = 0;
        #10 clk = 1;
        #10 clk = 0;
        #10 clk = 1;        
        #10 clk = 0;
        #10 clk = 1;
        #10 clk = 0;
        #10 clk = 1;
        #10 clk = 0;
        #10 clk = 1;
                                
        #10 $finish;            // End simulation
    end

endmodule