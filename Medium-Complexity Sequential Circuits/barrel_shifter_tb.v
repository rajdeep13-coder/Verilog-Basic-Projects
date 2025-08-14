`timescale 1ns/1ps
module barrel_shifter_tb;

reg [3:0] data_in;
reg [1:0] shift;
reg [1:0] mode;
wire [3:0] data_out;

// Instantiate the design under test (DUT)
barrel_shifter dut (
    .data_in(data_in),
    .shift(shift),
    .mode(mode),
    .data_out(data_out)
);

initial begin
    $dumpfile("barrel_shifter_tb.vcd");
    $dumpvars(0, barrel_shifter_tb);

    // Test logical left shift
    data_in = 4'b1010; shift = 2'b01; mode = 2'b00; #10;
    data_in = 4'b1010; shift = 2'b10; mode = 2'b00; #10;

    // Test logical right shift
    data_in = 4'b1010; shift = 2'b01; mode = 2'b01; #10;
    data_in = 4'b1010; shift = 2'b10; mode = 2'b01; #10;

    // Test rotate left
    data_in = 4'b1010; shift = 2'b01; mode = 2'b10; #10;
    data_in = 4'b1010; shift = 2'b11; mode = 2'b10; #10;

    // Test rotate right
    data_in = 4'b1010; shift = 2'b01; mode = 2'b11; #10;
    data_in = 4'b1010; shift = 2'b11; mode = 2'b11; #10;

    $finish;
end

endmodule
