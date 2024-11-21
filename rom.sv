`timescale 1ns / 1ps
module rom(
    //input logic clk,
    input logic [3:0] address,
    output logic [7:0] data  
    );
always @(*)
    begin
    case (address)
        0 : data = 8'b00001000; //first instruction
        1 : data = 8'b00011001; // bla bla 
        2 : data = 8'b00100000;
        3 : data = 8'b00010000;
        4 : data = 8'b01110000;
        5 : data = 8'b00000000;
        6 : data = 8'b00010100;
        7 : data = 8'b00000100;
        8 : data = 8'b10110010;
      
        default : data = 8'b00; // Default value for addresses outside 0-9
    endcase      
    end
endmodule

