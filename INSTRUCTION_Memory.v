// Saket Jha 21CS30044
// Hunny Chandra 21CS30024
module INSTRUCTION_Memory(
    input clk,
    input reset,
    input [9:0] pc,
    output reg [31:0] _Instr            // Output for the instruction, 32 bits wide
   
    );
   
    reg [31:0]Instruction_Memory [99:0];
   
   
   
    always @(posedge clk)begin


        if(reset) begin
            // Instruction_Memory[0]= 32'b00000000100001100100000000000000;            
            // Instruction_Memory[1]= 32'b00001001110001000000000000010000;       //R2 = R7 + 16; R7=7;          
            // Instruction_Memory[1]=32'b00010001110001000000000000001000;        //R2 = R7 - 8; R7=7;
            // Instruction_Memory[1]=32'b00011001110001000000000000000100;        // R2 = R7 & 4; R7=7;
            // Instruction_Memory[1]=32'b00100001110001000000000000000100;        // R2 = R7 | 4; R7=7;
            // Instruction_Memory[1]=32'b00101001110001000000000000000100;        // R2 = R7 ^ 4; R7=7;
            // Instruction_Memory[1]=32'b00110001110001000000000000000100;        // R2 = ~4;
            // Instruction_Memory[1]=32'b10110001010101000000000000000000;        // MOVE R10,R5; R10 = R5;  R5=5;
            // Instruction_Memory[1]=32'b00111001110001000000000000000001;        //     R2 = R7<<<1; R7=7;
            // Instruction_Memory[1]=32'b01000001110001000000000000000001;        //      R2 = R7>>>1; R7=7;
            // Instruction_Memory[1]=32'b01001001110001000000000000000001;        //      R2 = R7>>1; R7=7;
            // Instruction_Memory[1]=32'b01100001111000000000000000000100;        //      LDSP 4(R7); SP = MEM[R7+4]; R7=7
            // Instruction_Memory[1]=   32'b01101001111000000000000000001000;        //      STSP 8(R7); MEM[R7+8] = SP;R7=7;


            // Instruction_Memory[1]=   32'b10010001110000000000000000000000;            //PUSH R7 in stack
            // Instruction_Memory[2]= 32'b00001100001000000000000000000001;            //Increase stack pointer

            // Instruction_Memory[3]=   32'b10011001110000000000000000000000;            //POP stack
            // Instruction_Memory[4]=   32'b10110111110011100000000000000000;            //move the value to destination register
            // Instruction_Memory[5]=   32'b00001100001000011111111111111111;            //Decrease the stack pointer by 1

            // Instruction_Memory[1]= 32'b00001001110001000000000000010000;       //R2 = R7 + 16; R7=7;    
            // Instruction_Memory[2]= 32'b01110001110000000000000000000100;       //Branch=> PC = Pc+4;
            // Instruction_Memory[5]=  32'b00010001110001000000000000001000;
            // Instruction_Memory[6]=  32'b01010001110000100000000000000100;        // R1 = MEM[R7+4];
            // Instruction_Memory[7]=  32'b00110001110001000000000000000100;


                // Instruction_Memory[1]=32'b01010001110001000000000000000100;        //      LD R2,4(R7); R2 = MEM[R7+4]; R7=7              R2=15;
                // Instruction_Memory[2]=32'b01011001110001000000000000010000;        //      ST R2,16(R7); MEM[R7+16] = R2; R7=7;               MEM[23]=15;
                // Instruction_Memory[3]=32'b01010001110001100000000000010000;        //      LD R3,16(R7)           R3=15;






            // //calculate GCD of numbers stored in R1 and R2 (in instructions 1 and 2)
            // Instruction_Memory[0] = 32'b00000000000000000000000000000000;
            // Instruction_Memory[1] = 32'b00001000000000100000000000001100; //ADDI R1, R0, #6
            // Instruction_Memory[2] = 32'b00001000000001000000000000001111; //ADDI R2, R0, #9
            // Instruction_Memory[3] = 32'b00000000010001000011000000000001; //SUB R3, R1, R2
            // Instruction_Memory[4] = 32'b10000000110000000000000000000011; //BPL R3, #3
            // Instruction_Memory[5] = 32'b01111000110000000000000000000101; //BMI R3, #5
            // Instruction_Memory[6] = 32'b10001000110000000000000000000111; //BZ R3, #7
            // Instruction_Memory[7] = 32'b10110000010010100000000000000000; //MOVE R5, R1
            // Instruction_Memory[8] = 32'b00000001010001000001000000000001; //SUB R1, R5, R2
            // Instruction_Memory[9] = 32'b01110000110000001111111111111010; //BR #-6
            // Instruction_Memory[10] = 32'b10110000100010100000000000000000; //MOVE R5, R2
            // Instruction_Memory[11] = 32'b00000001010000100010000000000001; //SUB R2, R5, R1
            // Instruction_Memory[12] = 32'b01110000110000001111111111110111; //BR #-9
            // Instruction_Memory[13] = 32'b00000000000000100100000000000000; //ADD R4, R0, R1






          //  Sorting 10 numbers
            
            Instruction_Memory[0] = 32'b00000000000000000000000000000000; //ADD R0, R0, R0
        
            Instruction_Memory[1] = 32'b00001000000000100000000000000101; //ADDI R1, R0, 5
            Instruction_Memory[2] = 32'b01011000000000100000000000000001; //ST R1, 1(R0)

            Instruction_Memory[3] = 32'b00001000000000100000000000000011; //ADDI R1, R0, 3
            Instruction_Memory[4] = 32'b01011000000000100000000000000010; //ST R1, 2(R0)

            Instruction_Memory[5] = 32'b00001000000000100000000000000111; //ADDI R1, R0, 7
            Instruction_Memory[6] = 32'b01011000000000100000000000000011; //ST R1, 3(R0)

            Instruction_Memory[7] = 32'b00001000000000100000000000001001; //ADDI R1, R0, 9
            Instruction_Memory[8] = 32'b01011000000000100000000000000100; //ST R1, 4(R0)

            Instruction_Memory[9] = 32'b00001000000000100000000000000010; //ADDI R1, R0, 2
            Instruction_Memory[10] = 32'b01011000000000100000000000000101; //ST R1, 5(R0)

            Instruction_Memory[11] = 32'b00001000000000100000000000001000; //ADDI R1, R0, 8
            Instruction_Memory[12] = 32'b01011000000000100000000000000110; //ST R1, 6(R0)

            Instruction_Memory[13] = 32'b00001000000000100000000000000100; //ADDI R1, R0, 4
            Instruction_Memory[14] = 32'b01011000000000100000000000000111; //ST R1, 7(R0)

            Instruction_Memory[15] = 32'b00001000000000100000000000001010; //ADDI R1, R0, 10
            Instruction_Memory[16] = 32'b01011000000000100000000000001000; //ST R1, 8(R0)

            Instruction_Memory[17] = 32'b00001000000000100000000000000001; //ADDI R1, R0, 1
            Instruction_Memory[18] = 32'b01011000000000100000000000001001; //ST R1, 9(R0)

            Instruction_Memory[19] = 32'b00001000000000100000000000001101; //ADDI R1, R0, 13
            Instruction_Memory[20] = 32'b01011000000000100000000000001010; //ST R1, 10(R0)

            Instruction_Memory[21] = 32'b00001000000000100000000000001010; //ADDI R1, R0, 10

            Instruction_Memory[22] = 32'b10110000010001000000000000000000; //MOVE R2, R1  <-- OUTER LOOP STARTS
            Instruction_Memory[23] = 32'b00010000100000100000000000000001; //SUBI R1, R2, 1
            Instruction_Memory[24] = 32'b01111000010000000000000000010000; //BMI R1, #16  ***  <-- condition checking for outer loop

            Instruction_Memory[25] = 32'b00001000000001100000000000000000; //ADDI R3, R0, 0

            Instruction_Memory[26] = 32'b10110000110010000000000000000000; //MOVE R4, R3 <-- INNER LOOP STARTS
            Instruction_Memory[27] = 32'b00001001000001100000000000000001; //ADDI R3, R4, 1
            Instruction_Memory[28] = 32'b00000000010001100101000000000001; //SUB R5, R1, R3
            Instruction_Memory[29] = 32'b01111001010000001111111111111001; //BMI R5, #-7  *** <-- condition checking for inner loop

            Instruction_Memory[30] = 32'b01010000110011000000000000000000; //LD R6, 0(R3)
            Instruction_Memory[31] = 32'b00000000000000000000000000000000; //void
            Instruction_Memory[32] = 32'b01010000110011100000000000000001; //LD R7, 1(R3)

            Instruction_Memory[33] = 32'b00000001100011101000000000000001; //SUB R8, R6, R7
            Instruction_Memory[34] = 32'b10000010000000000000000000000010; //BPL R8, #2  ***
            Instruction_Memory[35] = 32'b01110000000000001111111111110111; //BR #-9  ***

            Instruction_Memory[36] = 32'b01011000110011100000000000000000; //ST R7, 0(R3)
            Instruction_Memory[37] = 32'b00000000000000000000000000000000; //void
            Instruction_Memory[38] = 32'b01011000110011000000000000000001; //ST R6, 1(R3)
            Instruction_Memory[39] = 32'b01110000000000001111111111110011; //BR #-13  ***

            Instruction_Memory[40] = 32'b01010000000101000000000000000001; //LD R10, 1(R0)
            Instruction_Memory[41] = 32'b00000000000000000000000000000000; //void
            Instruction_Memory[42] = 32'b01010000000101000000000000000010; //LD R10, 2(R0)
            Instruction_Memory[43] = 32'b00000000000000000000000000000000; //void
            Instruction_Memory[44] = 32'b01010000000101000000000000000011; //LD R10, 3(R0)
            Instruction_Memory[45] = 32'b00000000000000000000000000000000; //void
            Instruction_Memory[46] = 32'b01010000000101000000000000000100; //LD R10, 4(R0)
            Instruction_Memory[47] = 32'b00000000000000000000000000000000; //void
            Instruction_Memory[48] = 32'b01010000000101000000000000000101; //LD R10, 5(R0)
            Instruction_Memory[49] = 32'b00000000000000000000000000000000; //void
            Instruction_Memory[50] = 32'b01010000000101000000000000000110; //LD R10, 6(R0)
            Instruction_Memory[51] = 32'b00000000000000000000000000000000; //void
            Instruction_Memory[52] = 32'b01010000000101000000000000000111; //LD R10, 7(R0)
            Instruction_Memory[53] = 32'b00000000000000000000000000000000; //void
            Instruction_Memory[54] = 32'b01010000000101000000000000001000; //LD R10, 8(R0)
            Instruction_Memory[55] = 32'b00000000000000000000000000000000; //void
            Instruction_Memory[56] = 32'b01010000000101000000000000001001; //LD R10, 9(R0)
            Instruction_Memory[57] = 32'b00000000000000000000000000000000; //void
            Instruction_Memory[58] = 32'b01010000000101000000000000001010; //LD R10, 10(R0)
        end
        else begin
           
           if(1)begin
              
                $display("pc_ = %d \n",pc);
                _Instr= Instruction_Memory[pc];
            end
        end
    end
   
   
   
   
endmodule