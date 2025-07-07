module half_adder(
    input a,       // 1-bit input
    input b,       // 1-bit input
    output sum,    // sum = a XOR b
    output carry   // carry = a AND b
);

assign sum = a ^ b;
assign carry = a & b;

endmodule

