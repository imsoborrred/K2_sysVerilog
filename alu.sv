`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 11:33:46 AM
// Design Name: 
// Module Name: alu
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


module alu(
      input logic s,
      input logic [3:0] a,  
      input logic [3:0] b, 
      output logic[3:0] out, 
      output logic carry_out
    );
  always@(*)    begin
  if(s)
  out = a-b ;
  else
  {carry_out,out} = (a+b) ;
  end   

endmodule
