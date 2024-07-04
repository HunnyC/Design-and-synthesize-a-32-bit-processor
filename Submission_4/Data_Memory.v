// Saket Jha 21CS30044
// Hunny Chandra 21CS30024
module Data_Memory_module(
    input clk,                   // Clock input
    input reset,                 // Reset signal
    input memWr,                // Memory write enable signal
    input memRd,                // Memory read enable signal
    input [9:0] Address_,       // Address input, 10 bits wide
    input signed [31:0] Data_input, // Data input, signed and 32 bits wide
    output reg signed [31:0] Data_output // Data output, signed and 32 bits wide
);
    reg signed [31:0] Data_Memory[1023:0]; // Declaration of a 32-bit signed array with 2068 elements (indexed from 0 to 2067)

    always@(reset or memWr or memRd) begin // Combinational logic for memory operations

        if (reset && !memWr && !memRd) begin // Check if reset is active and no write or read operation is requested
              
            Data_Memory[0] = 0; // Initialize the memory location at address 0 to 0
            Data_Memory[1] = 1; // Initialize the memory location at address 1 to 1
            Data_Memory[2] = 2; // Initialize the memory location at address 2 to 2
            Data_Memory[3] = 3; // Initialize the memory location at address 3 to 3
            Data_Memory[4] = 10; // Initialize the memory location at address 4 to 10
            Data_Memory[5] = 5;  // Initialize the memory location at address 5 to 5
            Data_Memory[11] = 15; // Initialize the memory location at address 11 to 15
        end
        else if (memWr) begin // Check if a memory write operation is requested
              
            $display("Data to write = %d at address = %d", Data_input, Address_); // Display a message with the data and address being written
              
            Data_Memory[Address_] = Data_input; // Write Data_input to the memory location specified by Address_
        end
        else if (memRd) begin // Check if a memory read operation is requested
             
            Data_output = Data_Memory[Address_]; // Read data from the memory location specified by Address_
            $display("Address to read from = %d Value read = %d", Address_, Data_output); // Display a message with the address and data read
        end
    end
endmodule
