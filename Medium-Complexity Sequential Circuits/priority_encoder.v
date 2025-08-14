// 4-bit Priority Encoder (Don't care/ Case method)
module priority_encoder (
    input  [3:0] in,       // 4-bit input
    output reg [1:0] out,  // Encoded output
    output reg valid       // Valid flag
);

always @(*) begin
    valid = 1'b1; 
    casez (in) //don't-care logic
        4'b1???: out = 2'b11; // Highest priority: in[3]
        4'b01??: out = 2'b10; // Next: in[2]
        4'b001?: out = 2'b01; // Next: in[1]
        4'b0001: out = 2'b00; // Lowest priority: in[0]
        default: begin
            out = 2'b00;
            valid = 1'b0; // No inputs active
        end
    endcase
end

endmodule





// 4-bit Priority Encoder (2nd method)
module priority_encoder (
    input  [3:0] in,       // 4-bit input
    output reg [1:0] out,  // Encoded output
    output reg valid       // Valid flag
);

always @(*) begin
    if (in[3]) begin
        out = 2'b11; valid = 1;
    end
    else if (in[2]) begin
        out = 2'b10; valid = 1;
    end
    else if (in[1]) begin
        out = 2'b01; valid = 1;
    end
    else if (in[0]) begin
        out = 2'b00; valid = 1;
    end
    else begin
        out = 2'b00; valid = 0; // No input active
    end
end

endmodule
