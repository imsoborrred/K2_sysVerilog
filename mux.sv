`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 09:08:30 AM
// Design Name: 
// Module Name: mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module mux#(parameter width = 8) // Parameter for width
  (
    input [width-1:0] a, b, // Inputs with parameterized width
    input s,                  // Select signal
    output reg [width-1:0] y  // Output with parameterized width
  );

  always @(*) begin
    if (s) 
      y = b;
    else 
      y = a;
  end

endmodule