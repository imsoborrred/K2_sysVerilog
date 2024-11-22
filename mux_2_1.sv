`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 08:54:41 AM
// Design Name: 
// Module Name: mux_2_1
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


module mux_2_1
    #(parameter width = 8)
    (
    input logic clk,
    input logic reset,
    input [width-1:0]  a,
    input [width-1:0]  b,
    input  sreg,
    output logic [width-1:0] f
    );
    
//    always @ (posedge clk, negedge reset) begin    
    always @ (*) begin  
        if (sreg)
            f = b;
        else
            f = a;
    end
    
endmodule
