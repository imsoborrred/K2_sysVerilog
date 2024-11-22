`timescale 1ns / 1ps
module mux #(parameter width = 8) // Parameter for width
  (
    input logic clk,
    input logic reset,
    input [width-1:0] a, b, // Inputs with parameterized width
    input s,                  // Select signal
    output reg [width-1:0] y  // Output with parameterized width
  );

  always @(posedge clk, negedge reset) begin
    if (s) 
      y = b;
    else 
      y = a;
  end

endmodule