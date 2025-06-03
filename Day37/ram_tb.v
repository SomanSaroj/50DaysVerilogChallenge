`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2025 22:36:05
// Design Name: 
// Module Name: ram_tb
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


module ram_tb();
reg clk,we;
reg [7:0] data_in;
reg [3:0] addr;
wire [7:0] data_out;

ram dut(
    .data_out(data_out),
    .data_in(data_in),
    .addr(addr),
    .clk(clk),
    .we(we) );

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    we = 1; 
    addr = 4'd0; data_in = 8'h11;
    #10 we = 0; 
    $display("Data at addr 0: %h", data_out);
    addr = 4'd1; data_in = 8'h22;
    we = 1; 
    #10 we = 0;
    $display("Data at addr 1: %h", data_out);
    #100 $finish;
end
endmodule
