`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2025 22:00:11
// Design Name: 
// Module Name: sequence_detector_tb
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
module sequence_generator_tb( );

reg clk;
reg reset;
wire seq_out;

sequence_generator dut(
    .clk(clk),
    .reset(reset),
    .seq_out(seq_out) );
    
initial begin
    clk = 0; reset = 1;
    #10 reset = 0;
    forever #5 clk = ~clk;
end

initial $monitor("Time=[%0d], clk=%b, reset=%b, seq_out=%b", $time, clk, reset, seq_out);
initial #100 $finish;

endmodule
