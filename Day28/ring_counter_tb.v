`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2025 21:30:27
// Design Name: 
// Module Name: ring_counter_tb
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
module ring_counter_tb( );
    reg clk;
    reg reset;
    wire [3:0] count;
    
    ring_counter uut(
        .clk(clk),
        .reset(reset),
        .count(count)
    );
    initial begin
        clk = 0;
        reset = 1;
        #10;
        reset = 0;
        forever #5 clk = ~clk;
    end
    initial $monitor("Time=[%0d], clk=%b, reset=%b, count=%b", $time, clk, reset, count);
    initial #100 $finish;
endmodule
