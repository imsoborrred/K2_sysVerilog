`timescale 1ns / 1ps


localparam intructions = 9;
//localparam instructions_bits = $clog2(intructions);


module program_counter#(parameter n = 8)(
    input logic clk,
    input logic reset,
//    input logic [n-1:0] data,
    input logic jump,
    input logic [2:0] jump_imm,
    output logic [n-1:0] counter
    );
    

    always_ff @ (posedge clk, negedge reset) begin
        if (~reset) begin
            counter = 0;
        end
        else if (jump != 0) begin
            counter = jump_imm;
        end
        //else if (data != 0) begin
          //  counter = data;
        //end
        else begin
            counter = counter + 1;
            if (counter == intructions) begin //check later 
                counter = 0;                   //checl later 
            end
        end
    end
    
endmodule