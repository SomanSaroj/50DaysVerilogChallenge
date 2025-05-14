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
        
        downcounter_4bit dut (.y(y),.clk(clk), .rst(rst) );
        initial begin
                clk = 0;
                forever #2 clk = ~clk; 
            end
            initial begin
                rst = 1;
                #5;          
                rst = 0;
            end
        
        initial $monitor("Time = [%0d], Count = %d", $time, y);
        
        initial #200 $finish;
endmodule
