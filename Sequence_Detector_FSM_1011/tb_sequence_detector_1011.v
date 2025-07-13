module tb_sequence_detector;

    reg clk, reset, in;
    wire out;

    sequence_detector_1011 uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $monitor("Time: %0d | in: %b | out: %b", $time, in, out);

        clk = 0; reset = 1; in = 0;
        #10 reset = 0;

        // Send input stream: 1 0 1 1 (should detect at end)
        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 1; #10;  // out should be 1 here
        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 1; #10;  // out should be 1 again

        $finish;
    end
endmodule
// This is a testbench for the sequence_detector_1011 module.
// It initializes the inputs, generates a clock signal, and applies a sequence of inputs to test the functionality of the sequence detector.
// The expected output is monitored and printed to the console.