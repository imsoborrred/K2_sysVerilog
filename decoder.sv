`timescale 1ns / 1ps

module decoder
    #(parameter width = 2)
    (
    input logic reset,
    input logic clk,
    input [width-1:0] address,
    //input en,
    output reg [0:3] result
    );
    
    always @ (posedge clk , negedge reset)
    case(address)
        2'b00 : result = 4'b1000;
        2'b01 : result = 4'b0100;
        2'b10 : result = 4'b0010;
        2'b11 : result = 4'b0001;
        default : result = 4'b0000;
    endcase
    
endmodule

