module sequence_detector_1011 (
    input clk,
    input reset,
    input in,
    output reg out
);

    // State Encoding
    typedef enum reg [2:0] {
        S0 = 3'b000,  // Start
        S1 = 3'b001,  // Saw 1
        S2 = 3'b010,  // Saw 10
        S3 = 3'b011,  // Saw 101
        S4 = 3'b100   // Saw 1011 (final state)
    } state_t;

    state_t current_state, next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            S0:  next_state = (in == 1) ? S1 : S0;
            S1:  next_state = (in == 1) ? S2 : S0;
            S2:  next_state = (in == 1) ? S2 : S3;
            S3:  next_state = (in == 1) ? S4 : S0;
            S4:  next_state = (in == 1) ? S2 : S0;
            default: next_state = S0;
        endcase
    end

    // Output logic (Moore)
    always @(*) begin
        if (current_state == S4)
            out = 1;
        else
            out = 0;
    end

endmodule
