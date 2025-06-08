`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2025 22:02:45
// Design Name: 
// Module Name: spi_slave_tb
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


module spi_slave_tb;

reg sck;
reg mosi;
wire miso;
reg cs;
reg clk;
reg [7:0] data_out;
wire [7:0] data_in;

spi_slave dut(
    .sck(sck),
    .mosi(mosi),
    .miso(miso),
    .cs(cs),
    .clk(clk),
    .data_out(data_out),
    .data_in(data_in)
);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    sck = 0;
    mosi = 0;
    cs = 1;
    data_out = 8'h55; // Data to be transmitted by slave
    #100;
    cs = 0; // Select the slave

    // Send data to slave ( Master sends 0xA5 to slave)
    #20 mosi = 1; sck = 1; #20 sck = 0;
    #20 mosi = 0; sck = 1; #20 sck = 0;
    #20 mosi = 1; sck = 1; #20 sck = 0;
    #20 mosi = 0; sck = 1; #20 sck = 0;
    #20 mosi = 0; sck = 1; #20 sck = 0;
    #20 mosi = 1; sck = 1; #20 sck = 0;
    #20 mosi = 0; sck = 1; #20 sck = 0;
    #20 mosi = 1; sck = 1; #20 sck = 0;

    #100;
    cs = 1; // Deselect the slave

    #100 $finish;
end

initial begin
    $monitor("data_in = %h, miso = %b", data_in, miso);
end

endmodule