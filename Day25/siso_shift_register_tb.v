`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2025 22:42:15
// Design Name: 
// Module Name: siso_shift_register_tb
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


module siso_shift_register_tb();
reg clk;
reg reset;
reg ser_in;
wire ser_out;

siso_shift_register uut(
    .clk(clk),
    .reset(reset),
    .ser_in(ser_in),
    .ser_out(ser_out));
    initial begin
        clk = 0; reset = 1; ser_in = 0; 
         #10 reset = 0;
         forever #5 clk = ~clk;
    end 
    always #10 ser_in = ~ser_in; 
    initial $monitor("Time = [%0d], clk = %b, reset = %b, ser_in = %b, ser_out = %b", $time, clk, reset, ser_in, ser_out);
    initial #100 $finish;
    
endmodule
