`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.05.2025 14:27:50
// Design Name: 
// Module Name: downcounter_4bit_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module downcounter_4bit_tb(

    );
    reg clk,rst;
        wire [3:0] y;
        
        upcounter_4bit dut (.y(y),.clk(clk), .rst(rst) );
        initial begin 
            #1clk = 0;
            rst = 1;
            
            #1 rst = 0;
        end
        
        always #2 clk = ~clk;
        
        initial $monitor("Time = [%0d], Count = %d", $time, y);
        
        initial #200 $finish;
endmodule
