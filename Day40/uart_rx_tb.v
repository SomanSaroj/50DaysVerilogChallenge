`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2025 22:13:10
// Design Name: 
// Module Name: uart_rx_tb
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


module uart_rx_tb;

reg clk;
reg rst;
reg rx;
wire [7:0] rx_data;
wire rx_valid;

uart_rx dut(
    .rx_data(rx_data),
    .rx_valid(rx_valid),
    .rx(rx),
    .clk(clk),
    .rst(rst)
);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    rst = 1;
    rx = 1;
    #10 rst = 0;
    // simulate a byte transmission
    #10 rx = 0; // start bit
    #10 rx = 1; // bit 0
    #10 rx = 0; // bit 1
    #10 rx = 1; // bit 2
    #10 rx = 0; // bit 3
    #10 rx = 1; // bit 4
    #10 rx = 0; // bit 5
    #10 rx = 1; // bit 6
    #10 rx = 0; // bit 7
    #10 rx = 1; // stop bit
    #200 $finish;
end

endmodule
