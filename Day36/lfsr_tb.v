`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2025 22:36:08
// Design Name: 
// Module Name: lfsr_tb
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


module lfsr_tb( );
reg clock;
reg reset;
wire [7:0] lfsr_out;

lfsr dut(
    .lfsr_out(lfsr_out),
    .clock(clock),
    .reset(reset) );

initial begin
    clock = 0;
    reset = 1;
    #10 reset = 0;
    forever #5 clock = ~clock;
end

initial begin
    $monitor("Time: [%0d], LFSR Output: %h", $time, lfsr_out);
    #100 $finish;
end

endmodule
