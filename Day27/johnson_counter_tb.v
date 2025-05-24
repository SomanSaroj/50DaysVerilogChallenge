`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2025 20:35:47
// Design Name: 
// Module Name: johnson_counter_tb
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


module johnson_counter_tb( );
    reg clk,reset;
    wire [3:0] count;
    
    johnson_counter dut (.count(count), .clk(clk), .reset(reset) );
    
    initial begin
        $monitor("time=[%0d],clk=%b,reset=%b,count=%b",$time,clk,reset,count);
        clk = 0;reset = 1;
        #10 reset = 0;
        forever #5 clk = ~clk;
    end
    
    initial #102 $finish;
    
endmodule
