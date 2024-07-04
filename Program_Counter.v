// Saket Jha 21CS30044
// Hunny Chandra 21CS30024
module Program_Counter(
    input clk,                  // Clock input
    input reset,                // Reset signal
    input [9:0] pc_,           // Current program counter input, 10 bits wide
    output reg [9:0] NPC        // Next program counter output, 10 bits wide
);

always @(posedge clk) begin   // Sequential logic triggered on the rising edge of the clock

    if (reset) begin          // If reset signal is active
        NPC <= 10'b0000000000; // Initialize the next program counter (NPC) to 0
    end
    else begin
        NPC <= pc_;            // Set the next program counter (NPC) to the current program counter (pc_)
    end
end

endmodule
