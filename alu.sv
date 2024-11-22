`timescale 1ns / 1ps

module alu
      #(parameter width = 8)
      (
      input logic clk,
      input logic reset,
      input logic s,
      input logic [width-1:0] a,  
      input logic [width-1:0] b, 
      output logic[width-1:0] out, 
      output logic carry_out
    );
    logic [width:0] sum ;
  
  always@(posedge clk, negedge reset)    begin
      if (~reset) begin
        out = 0;
        carry_out =0;
      end
      else if(s) begin
          sum = a-b ;
          out = sum[width-1:0];
      end
      else
      begin
        sum = (a+b) ;
        out = sum[width-1:0];
        carry_out = sum[width] ;
      end   
      end
endmodule