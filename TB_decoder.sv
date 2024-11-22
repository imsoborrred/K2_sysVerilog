`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 08:55:08 AM
// Design Name: 
// Module Name: TB_mux_2_1
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


module TB_decoder;

localparam width = 2;

logic [width-1:0] address;
logic [0:3] en;
logic clk, reset;
decoder uut (
    .clk(clk),
    .reset(reset),
    .address(address),
    .en(en)
);

    // Initial block to apply stimulus
    initial begin
        // Monitor signals
        $monitor("Time=%0t | clk=%b | reset=%b | address=%b | en=%b", $time, clk, reset, address, en);

        // Initial values
        reset = 1; clk = 1;
        address = 2'b00;
        
        // Test sequence
        #10 clk=0;
        #10 clk=1; address = 2'b00;
        #10 clk=0;
        #10 clk=1; address = 2'b01;
        #10 clk=0;
        #10 clk=1; address = 2'b10;
        #10 clk=0;
        #10 clk=1; address = 2'b11;
                
        #10 $finish;            // End simulation    
    end 

endmodule