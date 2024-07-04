// Saket Jha 21CS30044
// Hunny Chandra 21CS30024
module Control_Signal_Module(
    input reset,
    input [4:0] Opcode,                 
    input [3:0] Funct,
    output reg reg_d,
    output reg MemRead,                         // Determines whether any data should be read from the data memory or not.
    output reg MemToReg,                        //Selects the appropriate line to write to the register file. Used to choose between the ALU result (for an R-type instruction), data from the data
    output reg MemToWrite,                      // Determines whether anything should be written to the data memory or not.
    output reg check_Branch_,                    //Determines whether an instruction is a branch instruction or not.
    output reg [3:0] Operation,                 //for choosing operation
    output reg AluSrc,                          //Controls the second input of the ALU. 
    output reg reg_Write,                       //Determines whether any data should be written to a register or not.
    output reg StackPop,                        //if pop operation performed on stack
    output reg StackPush                        //if push operation performed on stack
    );

    always@(*) begin

		if(reset) begin 
                
            reg_d = 0;
            
            MemRead = 0;
            MemToReg = 0;
            MemToWrite = 0;
            check_Branch_ = 0;
            Operation = 4'b0;
            AluSrc = 0;
            reg_Write = 0;
		end

        else begin
            case(Opcode)
            5'b00000: begin
                case(Funct)
                    4'b0000: begin              
                        
                        StackPop=0;
                        StackPush=0;
                        reg_d = 1;
                        MemRead = 0;
                        MemToReg = 0;
                        MemToWrite = 0;
                        check_Branch_ = 0;
                        Operation = 4'b0000; 
                        AluSrc = 0;
                        reg_Write = 1;
                    end
                    4'b0001: begin
                        reg_d = 1;
                        MemRead = 0;
                        MemToReg = 0;
                        MemToWrite = 0;
                        check_Branch_ = 0;
                        Operation = 4'b1010; 
                        AluSrc = 0;
                        reg_Write = 1;
                    end
                    4'b0010: begin
                        reg_d = 1;
                        MemRead = 0;
                        MemToReg = 0;
                        MemToWrite = 0;
                        check_Branch_ = 0;
                        Operation = 4'b0001; 
                        AluSrc = 0;
                        reg_Write = 1;
                    end
                    4'b0011: begin     
                        reg_d = 1;
                        MemRead = 0;
                        MemToReg = 0;
                        MemToWrite = 0;
                        check_Branch_ = 0;
                        Operation = 4'b1001; 
                        AluSrc = 0;
                        reg_Write = 1;
                    end
                    4'b0100: begin
                         reg_d = 1;
                        MemRead = 0;
                        MemToReg = 0;
                        MemToWrite = 0;
                        check_Branch_ = 0;
                        Operation = 4'b0010; 
                        AluSrc = 0;
                        reg_Write = 1;
                    end
                    4'b0101: begin
                     
                        reg_d = 1;
                        MemRead = 0;
                        MemToReg = 0;
                        MemToWrite = 0;
                        check_Branch_ = 0;
                        Operation = 4'b0011; 
                        AluSrc = 0;
                        reg_Write = 1;
                    end
                    4'b0110: begin          
                    reg_d = 1;
                    MemRead = 0;
                    MemToReg = 0;
                    MemToWrite = 0;
                    check_Branch_ = 0;
                    Operation = 4'b0100; 
                    AluSrc = 0;
                    reg_Write = 1;
                    end
                    4'b0111: begin      
                    reg_d = 1;
                    MemRead = 0;
                    MemToReg = 0;
                    MemToWrite = 0;
                    check_Branch_ = 0;
                    Operation = 4'b0110; 
                    AluSrc = 0;
                    reg_Write = 1;
                    end
                    4'b1000: begin         
                        reg_d = 1;
                        MemRead = 0;
                        MemToReg = 0;
                        MemToWrite = 0;
                        check_Branch_ = 0;
                        Operation = 4'b0101; 
                        AluSrc = 0;
                        reg_Write = 1;
                    end
                    default: begin
                        reg_d = 0;
                        MemRead = 0;
                        MemToReg = 0;
                        MemToWrite = 0;
                        check_Branch_ = 0;
                        Operation = 4'b0000;
                        AluSrc = 0;
                        reg_Write = 0;
                        
                    end


                endcase
            end
            5'b00001: begin                    
                    reg_d = 0;
                    StackPush=0;
                    StackPop=0;
                    MemRead = 0;
                    MemToReg = 0;
                    MemToWrite = 0;
                    check_Branch_ = 0;
                    Operation = 4'b0000; 
                    AluSrc = 1;
                    reg_Write = 1;
            end
            5'b00010: begin                     
                    reg_d = 0;
                    MemRead = 0;
                    MemToReg = 0;
                    MemToWrite = 0;
                    check_Branch_ = 0;
                    Operation = 4'b1010;
                    AluSrc = 1;
                    reg_Write = 1;
            end
            5'b00011: begin                 
                    reg_d = 0;
                    MemRead = 0;
                    MemToReg = 0;
                    MemToWrite = 0;
                    check_Branch_ = 0;
                    Operation = 4'b0001; 
                    AluSrc = 1;
                    reg_Write = 1;
            end
            5'b00100: begin                
                    reg_d = 0;
                    MemRead = 0;
                    MemToReg = 0;
                    MemToWrite = 0;
                    check_Branch_ = 0;
                    Operation = 4'b1001; 
                    AluSrc = 1;
                    reg_Write = 1;
            end
            5'b00101: begin           
                    reg_d = 0;
                    MemRead = 0;
                    MemToReg = 0;
                    MemToWrite = 0;
                    check_Branch_ = 0;
                    Operation = 4'b0010;
                    AluSrc = 1;
                    reg_Write = 1;

            end
            5'b00110: begin         
                    reg_d = 0;
                    MemRead = 0;
                    MemToReg = 0;
                    MemToWrite = 0;
                    check_Branch_ = 0;
                    Operation = 4'b1011; 
                    AluSrc = 1;
                    reg_Write = 1;
                
            end
            5'b00111: begin
                    reg_d = 0;
                    MemRead = 0;
                    MemToReg = 0;
                    MemToWrite = 0;
                    check_Branch_ = 0;
                    Operation = 4'b0100; 
                    AluSrc = 1;
                    reg_Write = 1;
            end
            5'b01000: begin
                    reg_d = 0;
                    MemRead = 0;
                    MemToReg = 0;
                    MemToWrite = 0;
                    check_Branch_ = 0;
                    Operation = 4'b0110; 
                    AluSrc = 1;
                    reg_Write = 1;   
            end
            5'b01001: begin
                    reg_d = 0;
                    MemRead = 0;
                    MemToReg = 0;
                    MemToWrite = 0;
                    check_Branch_ = 0;
                    Operation = 4'b0101; 
                    AluSrc = 1;
                    reg_Write = 1;     
            end
            5'b01010: begin                    
                    Operation = 4'b0000;
                    MemRead <= 1;
                    StackPop=0;
                    StackPush=0;
                    reg_d = 0;
                    MemToReg = 1;
                    MemToWrite = 0;
                    check_Branch_ = 0;
                    AluSrc = 1;
                    reg_Write = 1;
            end
            5'b01011: begin                    
                    reg_Write = 0;
                    StackPop=0;
                    StackPush=0;
                    reg_d = 1'bx;
                    MemRead = 0;
                    MemToReg = 1'bx;
                    MemToWrite <= 1;
                    AluSrc = 1;
                    check_Branch_ = 0;
                    Operation = 4'b0000;
            end
            5'b01100: begin             
                    Operation = 4'b0000;
                    MemRead <= 1;
                    reg_d = 0;
                    MemToReg = 1;
                    MemToWrite = 0;
                    check_Branch_ = 0;
                    AluSrc = 1;
                    reg_Write = 1;
            end
            5'b01101: begin                     
                    reg_d = 1'bx;
                    MemRead = 0;
                    MemToReg = 1'bx;
                    MemToWrite <= 1;
                    AluSrc = 1;
                    check_Branch_ = 0;
                    Operation = 4'b0000;
                    reg_Write = 0;
            end
            5'b01110: begin
                reg_d = 1'bx;
                    MemRead = 0;
                    MemToReg = 1'bx;
                    MemToWrite = 0;
                    check_Branch_ = 1;
                    Operation = 4'b0111; 
                    AluSrc = 0;
                    reg_Write = 0;
            end
            5'b01111: begin
                reg_d = 1'bx;
                StackPop=0;
                StackPush=0;
                    MemRead = 0;
                    MemToReg = 1'bx;
                    MemToWrite = 0;
                    check_Branch_ = 1;
                    Operation = 4'b0111; 
                    AluSrc = 0;
                    reg_Write = 0;
            end
            5'b10000: begin
                reg_d = 1'bx;
                    MemRead = 0;
                    MemToReg = 1'bx;
                    MemToWrite = 0;
                    check_Branch_ = 1;
                    Operation = 4'b0111; 
                    AluSrc = 0;
                    reg_Write = 0;
            end
            5'b10001: begin
                reg_d = 1'bx;
                    MemRead = 0;
                    MemToReg = 1'bx;
                    MemToWrite = 0;
                    check_Branch_ = 1;
                    Operation = 4'b0111; 
                    AluSrc = 0;
                    reg_Write = 0;
            end
            5'b10010: begin
                    reg_d = 1'bx;
                    MemRead = 0;
                    MemToReg = 1'bx;
                    MemToWrite = 0;
                    AluSrc = 0;
                    check_Branch_ = 0;
                    Operation = 4'b0000;
                    reg_Write = 0;
                    StackPush <= 1;
                    StackPop <= 0;
            end
            5'b10011: begin
                    reg_d = 1'bx;
                    MemRead = 0;
                    MemToReg = 1'bx;
                    MemToWrite = 0;
                    AluSrc = 0;
                    check_Branch_ = 0;
                    Operation = 4'b0000;
                    reg_Write = 0;
                    StackPush <= 0;
                    StackPop <= 1;
            end
            5'b10100: begin

            end
            5'b10101: begin

            end
            5'b10110: begin           
                    StackPop=0;
                    StackPush=0;
                    reg_d = 0;
                    MemRead = 0;
                    MemToReg = 0;
                    MemToWrite = 0;
                    check_Branch_ = 0;
                    Operation = 4'b0000;
                    AluSrc = 1;
                    reg_Write = 1;
            end
            5'b10111: begin

            end
            default: begin
               
            end

            

            endcase
        end

    end

endmodule