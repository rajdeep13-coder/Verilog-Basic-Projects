//TEST BENCH
module test_traffic_light_fsm;

reg clk, reset;
wire [2:0] light;

traffic_light_fsm uut (
    .clk(clk),
    .reset(reset),
    .light(light)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 10-time unit clock period
end

// Test sequence
initial begin
    $display("Time | Reset | Light");
    $monitor("%4t |   %b   | %b", $time, reset, light);

    reset = 1; #10;
    reset = 0; #100;

    $finish;
end

endmodule
