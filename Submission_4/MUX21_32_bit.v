// Saket Jha 21CS30044
// Hunny Chandra 21CS30024
module MUX21_32_bit(
    input [31:0] Inp1_,      // Input signal 1, 32 bits wide
    input [31:0] Inp2_,      // Input signal 2, 32 bits wide
    input Sel_,             // Select signal
    output reg [31:0] Out_  // Output signal, 32 bits wide
);

always @(*) begin

    if (Sel_) // If the select signal is true (non-zero)
    begin
        Out_ = Inp2_; // Set the output to the value of Inp2
    end 
    else 
    begin
        Out_ = Inp1_; // Otherwise, set the output to the value of Inp1
    end
end
endmodule

module MUX21_32_bit2(
    input [31:0] Inp1_,      // Input signal 1, 32 bits wide
    input [31:0] Inp2_,      // Input signal 2, 32 bits wide
    input Sel_,             // Select signal
    output reg [31:0] Out_  // Output signal, 32 bits wide
);

always @(*) begin

    if (Sel_) // If the select signal is true (non-zero)
    begin
        Out_ = Inp2_; // Set the output to the value of Inp2
    end 
    else 
    begin
        Out_ = Inp1_; // Otherwise, set the output to the value of Inp1
    end
end
endmodule
