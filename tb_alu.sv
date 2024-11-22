`timescale 1ns / 1ps

module alu_tb;

  // Parameters
  localparam width = 8;

  // Inputs
  logic clk;
  logic reset;
  logic s; // add or subtract
  logic [width-1:0] a;
  logic [width-1:0] b;

  // Outputs
  logic [width-1:0] out;
  logic carry_out;

  // Instantiate the ALU module
  alu #(width) uut (
    .clk(clk),
    .reset(reset),
    .s(s),
    .a(a),
    .b(b),
    .out(out),
    .carry_out(carry_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Clock with a period of 10 time units
  end

  // Test Procedure
  initial begin
    // Initialize Inputs
    reset = 1;
    s = 0;
    a = 8'h00;
    b = 8'h00;
    
    // Apply reset
    #10;
    reset = 0;
    #10;
    reset = 1;
    
    // Test addition without carry
    a = 8'h0F;
    b = 8'h01;
    s = 0; // Add operation
    #10;
    
    // Test addition with carry
    a = 8'hFF;
    b = 8'h01;
    s = 0; // Add operation (this should generate a carry)
    #10;
    reset = 0;
    #10
    reset = 1;
    
//      a = 8'hFF;
//    b = 8'hFF;
//    s = 0; // Add operation (this should generate a carry)
//    #10;
    
    // Test subtraction
    a = 8'h20;
    b = 8'h10;
    s = 1; // Subtract operation
    #10;
    
    // Apply reset during operation
    reset = 0;
    #10;
    reset = 1;
    
    // Test after reset
    a = 8'h50;
    b = 8'h25;
    s = 0; // Add operation
    #10;
    
    // Wait for some time to observe the behavior
    #50;
    
    // Finish simulation
    $stop;
  end

  // Monitor outputs for debugging purposes
  initial begin
    $monitor($time, " clk = %b, reset = %b, s = %b, a = %h, b = %h, out = %h, carry_out = %b", 
             clk, reset, s, a, b, out, carry_out);
  end

endmodule