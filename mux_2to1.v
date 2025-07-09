module mux_2to1(
    input a, b,
    input sel,
    output y
);
assign y = (sel) ? b : a;
endmodule
