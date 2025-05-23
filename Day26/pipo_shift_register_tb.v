`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.05.2025 22:27:39
// Design Name: 
// Module Name: pipo_shift_register_tb
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
module pipo_shift_register_tb();
reg clk;
reg load;
reg [7:0] parallel_in;
wire [7:0] parallel_out;
pipo_shift_register uut(
    .clk(clk), .load(load), .parallel_in(parallel_in),.parallel_out(parallel_out)  
);
initial begin
    clk = 0;load = 0;parallel_in = 8'b0;
    #10 load = 1;parallel_in = 8'b11001100;
end
always #5 clk = ~clk;
always @(posedge clk) begin
    if (load) begin
        #10 load = 0;   
    end
end
initial $monitor("Time=[%0d],clk=%b,load=%b,parallel_in=%b,parallel_out=%b",$time,clk,load,parallel_in,parallel_out);
initial #50 $finish;
endmodule
