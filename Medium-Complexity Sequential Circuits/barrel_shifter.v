// Barrel Shifter - 4-bit
module barrel_shifter (
    input  [3:0] data_in, 
    input  [1:0] shift,   
    input  [1:0] mode,     
    output reg [3:0] data_out 
);

always @(*) begin
    case (mode)
        2'b00: data_out = data_in << shift; // Logical left shift
        2'b01: data_out = data_in >> shift; // Logical right shift
        2'b10: data_out = (data_in << shift) | (data_in >> (4 - shift)); // Rotate left
        2'b11: data_out = (data_in >> shift) | (data_in << (4 - shift)); // Rotate right
        default: data_out = data_in;
    endcase
end

endmodule
