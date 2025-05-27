`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.05.2025 22:34:41
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


module sequence_detector_tb( );
reg clk;
reg reset;
reg data_in;
wire detected;

sequence_detector uut(
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .detected(detected)
);

initial begin
    clk = 0;
    reset = 1;
    data_in = 0;
    #10;
    reset = 0;
    forever #5 clk = ~clk;
end

initial begin
    #15 data_in = 1;
    #10 data_in = 1;
    #10 data_in = 0;
    #10 data_in = 1;
end

initial $monitor("Time=[%0d], clk=%b, reset=%b, data_in=%b, detected=%b", $time, clk, reset, data_in, detected);

initial #100 $finish;

endmodule
