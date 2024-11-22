`timescale 1ns / 1ps
module processor(
    input logic clk,
    input logic reset,
    input logic [3:0] address,
    output logic [7:0] R0,
    // Add any additional inputs as required
    output logic [7:0] pc //output from instrutction

);

// Internal signals
//logic [7:0] pc; //output from instrutction
logic [3:0] outmux; //output from mux
logic outcarryalu;
logic [7:0]outalu;
logic j,c,d1,d0,sreg,S;
logic [2:0] imm;
logic flipflopOut;
logic [3:0]decoderOutput;
logic reg_aOutput;
logic reg_bOutput;
logic load;
logic en;

assign en =1;

// Instantiate Program Counter

program_counter prog_c(
    .clk(clk),
    .reset(reset),
//    .data(),
    .jump(load),
    .jump_imm(imm),
    .counter(pc)
);

// Instantiate Instruction Memory
rom #(4) instruction_memory(
  .address(pc),
  .data({j,c,d1,d0,sreg,imm})
);

// Instantiate Registers
register #(8) reg_a(
    .data(outmux),
    .clk(clk),
    .reset(reset),
    .en(decoderOutput[3]), // enable
    .q(reg_aOutput) // output
);

register #(8) reg_b(
.data(outmux),
 .clk(clk),
 .reset(reset),
 .en(decoderOutput[2]), // enable
  .q(reg_bOutput) // output
);

register #(8) reg_out(
    .data(reg_aOutput),
    .clk(clk),
    .reset(reset),
    .en(decoderOutput[1]), // enable
     .q(R0) // output
  
);

// Instantiate MUX
mux #(4) data_mux(
.a(outalu), //output from ALU
.b(imm), // output from instruction
.s(sreg),                  // Select signal
.y(outmux)
 
);

// Instantiate ALU
alu alu_unit(
     .clk(clk),
     .reset(reset),
     .s(imm[2]), //sub or add
      .a(reg_aOutput),  
       .b(reg_bOutput), 
      .out(outalu), 
      .carry_out(outcarryalu)
);

// Instantiate Decoder
decoder #(2) control_decoder(
    .reset(reset),
    .clk(clk),
    .address({d1,d0}),
//    .en,
    .result(decoderOutput)

);

// Instantiate Flip Flop for Carry
flip_flop carry_ff(
    .data(outcarryalu),
    .clk(clk),
    .reset(reset),
    .en(en), // enable
    .q(flipflopOut)  // output
 
);

assign load = (flipflopOut & c) | j;

endmodule
