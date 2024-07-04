`include "ALU_Unit.v"
`include "BRANCH_LOGIC_.v"
`include "control_unit.v"
`include "Data_Memory.v"
`include "INSTRUCTION_DECODER.v"
`include "MUX21_5_bit.v"
`include "MUX21_32_bit.v"
`include "INSTRUCTION_Memory.v"
`include "Program_Counter.v"
`include "Stack.v"
`include "Register_File.v"

module toplevel (
    input clk,
    input reset,
	output signed [15:0] result
    );
	 
	reg [31:0] Output_of_program;
	
	wire [9:0] pc_;    //handles 2^10 = 1024 instructions
	wire [9:0] NPC;  
    wire [31:0] Instr_;
	wire signed [31:0] output_data_from_stack;

    // Parts of instructions obtained from the Instr_ array
	wire [4:0] Opcode;
    wire [3:0] Funct;
    wire [4:0] regs,rt,rd; 
    wire signed [31:0] _immediate_;
    wire signed [25:0] _immediate_1;
	wire StackPush;
	wire StackPop;
	
    // Control Signals output from the Control_Signal_Module
	wire [3:0] alu_operation;
	wire reg_d, MemRead, MemToReg, MemToWrite, check_Branch_, reg_Write, AluSrc;

	// Data to be written to the register file
	wire signed [31:0] reg_write_data;

	// Address to be written to
	wire [4:0] reg_write_addr;

	// Data read from the register file
	wire signed [31:0] reg_read_data_1, reg_read_data_2;
	
    // Flags from the ALU_Unit
	wire zeroFlag, carryFlag, signFlag;
	wire signed [31:0] alu_result;

	// Output from the Data memory block
	wire signed [31:0] mem_data_out;
    reg [3:0] step;
	
    //Sets NPC to pc_+1; if reset then sets NPC to 0;
	Program_Counter pc (
      .clk(clk), 
		.reset(reset),
		.NPC(NPC),
		.pc_(pc_)
    );	

    //Given pc_ gives us the Instr_ at index pc_ in the Instr_ memory array													
	INSTRUCTION_Memory IF (
      .clk(clk), 
		.reset(reset),
		.pc(pc_), 
	   ._Instr(Instr_)
    );
	
	INSTRUCTION_DECODER ID (
        .Instr_(Instr_),
        .Opcode(Opcode),
		.Funct(Funct),
		.regs(regs),
		.rt(rt),
        .rd(rd),
		._immediate_(_immediate_),
        ._immediate_1(_immediate_1)
    );

	Stack stackop (
		.Data_s(reg_read_data_1),
		.StackPush(StackPush),
		.StackPop(StackPop),
		.reset_stack(reset),
		.data_out_s(output_data_from_stack)
	);
	
	Control_Signal_Module CU (
		.reset(reset),
		.Opcode(Opcode),
		.Funct(Funct),
		.reg_d(reg_d),
		.MemRead(MemRead),
        .MemToReg(MemToReg),
		.MemToWrite(MemToWrite),
		.check_Branch_(check_Branch_),
		.Operation(alu_operation),
		.AluSrc(AluSrc),
		.reg_Write(reg_Write),
		.StackPop(StackPop),
		.StackPush(StackPush)
    );

	Data_Memory_module DM (
        .clk(clk), 
		.reset(reset), 
		.memWr(MemToWrite), 
		.memRd(MemRead), 
		.Address_(alu_result[9:0]),
		.Data_input(reg_read_data_2), 
		.Data_output(mem_data_out)
    );
	 
	MUX21_32_bit2 write_to_reg_mux (
		.Inp2_(mem_data_out),
		.Inp1_(alu_result),
		.Sel_(MemToReg),
		.Out_(reg_write_data)
	);

	MUX21_5_bit reg_dst_mux (
		.Inp2_(rd),
		.Inp1_(rt),
		.Sel_(reg_d),
		.Out_(reg_write_addr)
	);
	
	Register_File RB (
        .clk(clk),
		.reset(reset),
		.reg_Write(reg_Write),
		.Write_Address(reg_write_addr), 
		.Write_data(reg_write_data),
		.Read_ra(regs),
		.Read_rb(rt),
		.Read_data_ra(reg_read_data_1),
		.Read_data_rb(reg_read_data_2),
		.Write_From_Stack(output_data_from_stack)
    );
					  
	wire [31:0] alu_input_2;
	MUX21_32_bit alu_input_mux (
		.Inp1_(reg_read_data_2),
		.Inp2_(_immediate_),
		.Sel_(AluSrc),
		.Out_(alu_input_2)
	);		 			  

	ALU_Unit ALU_Unit (
        .inp1(reg_read_data_1),
		.inp2(alu_input_2),
		.operation(alu_operation),
		.clk(clk),
		.reset(reset),
		.out(alu_result),
		.carryFlag(carryFlag),
		.zeroFlag(zeroFlag), 
		.signFlag(signFlag)
	
    );
	
	BRANCH_LOGIC_ BL (
		 .check_Branch_(check_Branch_),
	    .Opcode(Opcode),
	    
	    
        // .address(reg_read_data_1),
        ._immediate_(_immediate_),
		.regs(reg_read_data_1),
		
    
    

    

    
    
        .pc_(NPC),
        .NPC(pc_)
    );
	 
	 assign result = reg_read_data_2;
     always @(posedge clk)begin
        // $display(
        //     "the result is is sis iisiisi %d \n",result
        // );

        // $display("Load Write Data_s = %d Write Address_ = %d",reg_write_data,reg_write_addr);
		// $display("Store Write Data_s = %d Write Address_ = %d ",reg_read_data_2,alu_result[9:0]);
        // $display("ALU_Unit result is = %d",alu_result);
		// $display("Reg read Data_s 2 = %d",reg_read_data_2);
     end

endmodule