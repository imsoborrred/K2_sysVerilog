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


module TB_mux_2_1;

logic a, b, s, f;

mux_2_1 uut (
    .a(a),
    .b(b),
    .s(s),
    .f(f)
);

    // Initial block to apply stimulus
    initial begin
        // Monitor signals
        $monitor("Time=%0t | a=%b | b=%b | s=%b | f=%b", $time, a, b, s, f);

        // Initial values
        a = 0; b = 0; s = 0;
        
        // Test sequence
        #10 a = 0; b = 0; s = 1;
        #10 a = 0; b = 1; s = 0;
        #10 a = 0; b = 1; s = 1;
        #10 a = 1; b = 0; s = 0;
        #10 a = 1; b = 0; s = 1;
        #10 a = 1; b = 1; s = 0;
        #10 a = 1; b = 1; s = 1;

  
     
                
        #10 $finish;            // End simulation    
    end 

endmodule
