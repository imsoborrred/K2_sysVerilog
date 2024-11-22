//`timescale 1ns / 1ps

//module register#(
//    parameter WIDTH = 8
//  )(
//    input logic [WIDTH-1:0] data,
//    input logic clk,
//    input logic reset,
//    input logic en, // enable
//    output logic [WIDTH-1:0] q // output
//  );

//  always @(posedge clk or negedge reset) begin
//    if (!reset)
//      q <= {WIDTH{1'b0}}; // Reset the output to 0 on negative edge when reset is 0
//    else if (en)
//      q <= data; // Assign data to output q when enabled
//  end

//endmodule
`timescale 1ns / 1ps

module register #(
    parameter WIDTH = 8         
)(
    input logic clk,             
    input logic reset,             
    input logic en,             
    input logic [WIDTH-1:0] data,   
    output logic [WIDTH-1:0] q   
);

    always @(posedge clk or negedge reset) begin
        if (! reset)
            q <= {WIDTH{1'b0}};  
        else if (en)
            q <= data;             
    end

endmodule
