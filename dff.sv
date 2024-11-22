module dff(
    input logic clk,
    input logic reset,
//    input logic en, // enable
    input logic data,
    output logic q  // output
);

  always @(posedge clk or negedge reset) begin
    if (!reset)
      q <= 0; // Reset 
//    else if (en)
    else
      q <= data; // Assign
  end

endmodule