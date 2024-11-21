`timescale 1ns / 1ps

module tb_rom;
    // Testbench signals
    logic [3:0] address;
    logic [7:0] data;

    // Instantiate the ROM module
    rom uut (
        .address(address),
        .data(data)
    );

    // Test procedure
    initial begin
        // Test different address values
        $display("Starting ROM Testbench...");

        address = 4'b0000; #10;
        $display("Address: %b, Data: %b", address, data);

        address = 4'b0001; #10;
        $display("Address: %b, Data: %b", address, data);

        address = 4'b0010; #10;
        $display("Address: %b, Data: %b", address, data);

        address = 4'b0011; #10;
        $display("Address: %b, Data: %b", address, data);

        address = 4'b0100; #10;
        $display("Address: %b, Data: %b", address, data);

        address = 4'b0101; #10;
        $display("Address: %b, Data: %b", address, data);

        address = 4'b0110; #10;
        $display("Address: %b, Data: %b", address, data);

        address = 4'b0111; #10;
        $display("Address: %b, Data: %b", address, data);

        address = 4'b1000; #10;
        $display("Address: %b, Data: %b", address, data);

        address = 4'b1001; #10;
        $display("Address: %b, Data: %b", address, data);

        // Test an out-of-bounds address
        address = 4'b1010; #10;
        $display("Address: %b, Data: %b (out of bounds)", address, data);

        $display("ROM Testbench completed.");
        $finish;
    end
endmodule
