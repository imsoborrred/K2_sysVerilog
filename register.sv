`timescale 1ns / 1ps

module register#(
    parameter width = 8
  )(
    input logic [width-1:0] data,
    input logic clk,
    input logic reset,
    input logic en, // enable
    output logic [width-1:0] q // output
  );

//    always @ (posedge clk, negedge reset) begin    
    always @ (*) begin  
        if (~reset) begin
          q <= {width{1'b0}}; // Reset the output to 0 on negative edge when reset is 0
        end
        else if (en) begin
          q <= data; // Assign data to output q when enabled
        end
    end

endmodule