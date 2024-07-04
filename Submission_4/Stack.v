// Saket Jha 21CS30044
// Hunny Chandra 21CS30024
module Stack(
    input signed [31:0] Data_s,      // Data input, signed and 32 bits wide
    input StackPush,              // Stack push control signal
    input StackPop,               // Stack pop control signal
    input reset_stack,            // Reset signal for the Stack
    output reg signed [31:0] data_out_s // Data output, signed and 32 bits wide
);

    reg signed [31:0] Stack_Memory[1023:0]; // Declaration of a 32-bit signed Stack memory array with 1024 elements (indexed from 0 to 1023)
    integer coutn; // Integer counter for Stack operations

    always @(*) begin

        if (reset_stack) begin
            coutn = 0; // Reset the counter to 0 when the reset_stack signal is active
        end

        if (StackPush) begin // If StackPush signal is active (high)
            Stack_Memory[coutn] = Data_s; // Push the Data_s onto the Stack
            coutn = coutn + 1; // Increment the counter to point to the next Stack location
        end
        else if (StackPop) begin // If StackPop signal is active (high)
            data_out_s = Stack_Memory[coutn - 1]; // Pop Data_s from the Stack and assign it to the data_out_s
            coutn = coutn - 1; // Decrement the counter to access the previous Stack location
        end
    end
endmodule
