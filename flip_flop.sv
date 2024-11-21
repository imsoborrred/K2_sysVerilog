module flip_flop(
    input logic data,
    input logic clk,
    input logic reset,
    input logic en, // enable
    output logic q  // output
);

  always @(posedge clk or negedge reset) begin
    if (!reset)
      q <= 0; // Reset 
    else if (en)
      q <= data; // Assign
  end

endmodule
