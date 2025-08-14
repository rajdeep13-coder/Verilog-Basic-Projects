`timescale 1ns/1ps
module priority_encoder_tb;

reg [3:0] in;
wire [1:0] out;
wire valid;

// Instantiate DUT
priority_encoder dut (
    .in(in),
    .out(out),
    .valid(valid)
);

initial begin
    $dumpfile("priority_encoder_tb.vcd");
    $dumpvars(0, priority_encoder_tb);

    // Test cases
    in = 4'b0000; #10; // No input active
    in = 4'b0001; #10; // Only bit 0
    in = 4'b0010; #10; // Only bit 1
    in = 4'b0100; #10; // Only bit 2
    in = 4'b1000; #10; // Only bit 3
    in = 4'b1100; #10; // Multiple bits, priority to bit 3
    in = 4'b0110; #10; // Multiple bits, priority to bit 2

    $finish;
end

endmodule
