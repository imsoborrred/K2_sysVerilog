`timescale 1ns / 1ps
module alu#(parameter n = 8)(
      input logic clk,
      input logic reset,
      input logic s, //add subtract
      input logic [n-1:0] a,  
      input logic [n-1:0] b, 
      output logic[n-1:0] out, 
      output logic carry_out
    );
  always@(posedge clk, negedge reset)    begin
  if(s)
  out = a-b ;
  else
  {carry_out,out} = (a+b) ;
  end   

endmodule
