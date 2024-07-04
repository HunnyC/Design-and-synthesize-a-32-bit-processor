`include "toplevel.v"
// Saket Jha 21CS30044
// Hunny Chandra 21CS30024

module testbench;
    reg clk;
    reg reset;
    wire [15:0] result;
    toplevel dut(clk,reset,result);

    initial begin
        clk=0;
    end
    always #5 clk= ~clk;

    initial begin
        reset =1;
        #20;
        reset=0;
        #20;
     
        //#40;   
        //$finish;
    end



endmodule