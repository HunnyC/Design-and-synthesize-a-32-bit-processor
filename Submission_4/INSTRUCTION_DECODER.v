// Saket Jha 21CS30044
// Hunny Chandra 21CS30024
module INSTRUCTION_DECODER(
    input [31:0] Instr_,          // Input instruction, 32 bits wide
    output reg[4:0] Opcode,       // Output for opcode, 5 bits wide
    output reg[3:0] Funct,        // Output for function code, 4 bits wide
    output reg[4:0] regs, rt, rd, // Outputs for register fields (regs, rt, rd), each 5 bits wide
    output reg signed [31:0] _immediate_,  // Output for immediate value, signed and 32 bits wide
    output reg signed [25:0] _immediate_1 // Output for another immediate value, signed and 26 bits wide
);
    always@(*) begin // Combinational logic for decoding the instruction

        _immediate_[31:16] = 16'd0; // Set the upper 16 bits of _immediate_ to zero
        _immediate_[15:0] = Instr_[15:0]; // Set the lower 16 bits of _immediate_ from the input instruction

        if (_immediate_[15] == 1'b1) begin // Check if the most significant bit of _immediate_ is 1
            _immediate_[31:16] = 16'b1111111111111111; // Set the upper 16 bits of _immediate_ to all ones if the MSB is 1
        end

        _immediate_1 <= Instr_[25:0]; // Set _immediate_1 from bits 25 to 0 of the input instruction
        regs <= Instr_[26:22]; // Set the regs field from bits 26 to 22 of the input instruction
        rt <= Instr_[21:17]; // Set the rt field from bits 21 to 17 of the input instruction
        rd <= Instr_[16:12]; // Set the rd field from bits 16 to 12 of the input instruction
        Funct <= Instr_[3:0]; // Set the Funct field from bits 3 to 0 of the input instruction
        Opcode <= Instr_[31:27]; // Set the Opcode field from bits 31 to 27 of the input instruction
    end
endmodule
