// Saket Jha 21CS30044
// Hunny Chandra 21CS30024
module BRANCH_LOGIC_(
    input check_Branch_,
    input signed [31:0] _immediate_,
    
    input [9:0] pc_,
    input [4:0] Opcode,

    input signed [31:0] regs,
    output reg [9:0] NPC
);

always @(*) begin

    if(check_Branch_) begin
        if(Opcode == 5'b10001) begin 
            if(regs==0)begin
                NPC = pc_+_immediate_;
            end 
            else begin
                NPC=pc_ +1;
            end        
        end
       

        else if(Opcode==5'b01110) begin       
            
                NPC = pc_+_immediate_;         // bcy L
        
            
        end

        else if(Opcode==5'b01111) begin        // bncy L
            if(regs<0) begin
                NPC = pc_+_immediate_;
            end
            else begin 
                NPC = pc_+1;
            end
        end

        

        else if(Opcode==5'b10000) begin       // bltz regs, L
            if(regs>0) begin
                NPC = pc_+_immediate_;
            end
            else begin 
                NPC = pc_+1;
            end
        end
        
       
        
        else begin                                                 
            NPC = pc_+1;                // Normal Flow
        end  
    end
   else begin

        // if(pc_!=13) begin         //set the value of parameter in if statement to the number of instructions in the instruction array
        // NPC = pc_+1;
        // end
        // if(pc_==14) begin
        //     $finish;
        // end                      //for GCD

        
        
        if(pc_!=59) begin         //set the value of parameter in if statement to the number of instructions in the instruction array
        NPC = pc_+1;
        end
        if(pc_==59) begin
            $finish;
        end                      //for sorting

    end
end
endmodule 

