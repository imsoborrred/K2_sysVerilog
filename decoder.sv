`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 09:22:22 AM
// Design Name: 
// Module Name: decoder
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


module decoder
    #(parameter width = 2)
    (
    input logic clk,
    input logic reset,
    input [width-1:0] address,
    output logic [3:0] en
    );
    
    always @ (posedge clk, negedge reset) begin    
//    always @ (*) begin   
        case(address)
            2'b00 : en = 4'b1000;
            2'b01 : en = 4'b0100;
            2'b10 : en = 4'b0010;
            2'b11 : en = 4'b0001;
            default : en = 4'b0000;
        endcase
    end
endmodule
