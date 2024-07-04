// Saket Jha 21CS30044
// Hunny Chandra 21CS30024
module Register_File(
	input reset,
	input clk,
    input reg_Write,			// control line for register writing
    input [4:0] Write_Address,		// Address to write in 
    input signed [31:0]  Write_data,    // Write Data
    input [4:0] Read_ra,    //Read Address 1
    output reg signed [31:0] Read_data_ra,  // Read Data 1
    input [4:0] Read_rb,    //Read Address 2
    output reg signed [31:0] Read_data_rb, // Read Data 2
	input signed [31:0] Write_From_Stack
  	);

	reg signed [31:0] Register_File[31:0]; 
    integer j;
				
   always @(*)
		begin

			if(Read_rb>=32) 
				Read_data_rb=32'hxxxxxxxx;       //Not possible, kept just to prevent latch
			else
				Read_data_rb=Register_File[Read_rb];          //Read Data
				
			if(Read_ra>=32) 
				Read_data_ra=32'hxxxxxxxx;
			else
				Read_data_ra=Register_File[Read_ra];          //Read Data
			
		end
		
   always @(posedge clk or posedge reset)            //Write Operation
		begin
			Register_File[31]=Write_From_Stack;
		  if (reset) begin
			   for(j=0;j<32;j=j+1) begin	
					Register_File[j] = 32'b0;
				end
                // Register_File[0]=32'd1;
				Register_File[1]=32'd14;
                Register_File[2]=32'd2;
                Register_File[3]=32'd3;
				Register_File[5]=32'd5;
                Register_File[7]=32'd7;
				Register_File[16]=32'd16;


		  end
        else if (reg_Write)  begin
             
				Register_File[Write_Address] <= Write_data;
				$monitor("Register Value %d is %d",Write_Address,Write_data);
		end
		end
		
endmodule