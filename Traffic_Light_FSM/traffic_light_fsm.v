//VERILOG CODE

module traffic_light_fsm(
    input clk,
    input reset,
    output reg [2:0] light  // [Red, Yellow, Green]
);

// State Encoding
typedef enum reg [1:0] {
    S_RED = 2'b00,
    S_GREEN = 2'b01,
    S_YELLOW = 2'b10
} state_t;

state_t current_state, next_state;

// Output logic (Moore Machine)
always @(posedge clk or posedge reset) begin
    if (reset)
        current_state <= S_RED;
    else
        current_state <= next_state;
end

// Next state logic
always @(*) begin
    case (current_state)
        S_RED:    next_state = S_GREEN;
        S_GREEN:  next_state = S_YELLOW;
        S_YELLOW: next_state = S_RED;
        default:  next_state = S_RED;
    endcase
end

// Output light control
always @(*) begin
    case (current_state)
        S_RED:    light = 3'b100;  // Red ON
        S_GREEN:  light = 3'b001;  // Green ON
        S_YELLOW: light = 3'b010;  // Yellow ON
        default:  light = 3'b000;  // All OFF
    endcase
end

endmodule




