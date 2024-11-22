`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 01:07:35 PM
// Design Name: 
// Module Name: K2
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

localparam m = 8;
localparam num_instructions = 9;
localparam num_instructions_bits = $clog2(num_instructions);


module K2(
    input logic clk,
    input logic reset,
    output reg [m-1:0] RO
    );
    
    // Declare
    logic [num_instructions_bits-1:0] counter;
    logic [m-1:0] instructions;
    logic load;
    logic [2:0] jump_imm;
    logic [3:0] register_en;
    logic [7:0] mux_out;
    logic [7:0] alu_out;
    reg [m-1:0] RA, RB;
    logic carry_out;
//    logic dff_en;
    logic dff_out;
    logic [m-1:0] imm;
    logic sreg;
    
    // assign
    assign imm = {5'b0, instructions[2:0]};
    assign jump_imm = instructions[2:0];
    assign sreg = instructions[3];  
    
    
    // PC: PC > instruction_number
//    program_counter #(.width(8)) PC(.clk(clk), .reset(reset), .data(instructions), .jump(load), .jump_imm(instructions[2:0]), .counter(counter));
    program_counter #(.width(8)) PC(.clk(clk), .reset(reset), .jump(load), .jump_imm(instructions[2:0]), .counter(counter));
    
    // ROM: counter > ROM > instruction
    instruction_memory ROM(.clk(clk), .reset(reset), .address(counter), .data(instructions));
    
    // decoder: instruction[5:4] > decoder enabled register
    decoder de1(.clk(clk), .reset(reset), .address(instructions[5:4]), .en(register_en));
    
    // mux: instruction[3] > mux > output to registers RA and RB
//    mux_2_1 #(.width(8)) MUX1(.clk(clk), .reset(reset), .a({5'b0,instructions[2:0]}), .b(alu_out), .s(instructions[3]), .f(mux_out));
    mux_2_1 #(.width(8)) MUX1(.clk(clk), .reset(reset), .a(alu_out), .b(imm), .sreg(instructions[3]), .f(mux_out));
    
    // Registers: RA, RB, RO
    register #(.width(8)) RA0(.clk(clk), .reset(reset), .en(register_en[3]), .data(mux_out), .q(RA));
    register #(.width(8)) RB0(.clk(clk), .reset(reset), .en(register_en[2]), .data(mux_out), .q(RB));
    // RO: RA > RO 
    register #(.width(8)) RO0(.clk(clk), .reset(reset), .en(register_en[1]), .data(RA), .q(RO));
    
    // ALU: (RA and RB) + instruction[2] > ALU > alu_out > mux
    alu #(.width(8)) ALU(.clk(clk), .reset(reset), .s(instructions[2]), .a(RA), .b(RB), .out(alu_out), .carry_out(carry_out));
    // DFF: ALU > carry_out > DFF > carry (C)
//    dff dff1(.clk(clk), .reset(reset), .en(dff_en), .data(carry_out), .q(dff_out));
    dff dff1(.clk(clk), .reset(reset), .data(carry_out), .q(dff_out));
    
    // Load/jump (PC): ((DFF AND C) OR J) > PC
    always @ (posedge clk, negedge reset) begin    
//    always @ (*) begin    
        if ((dff_out & instructions[6]) | instructions[7]) begin
            load <= 1;
        end
        else
            load <= 0;
    end  
    
endmodule
