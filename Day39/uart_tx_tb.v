`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 23:19:44
// Design Name: 
// Module Name: uart_tx_tb
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


module uart_tx_tb;

    reg clk;
    reg rst;
    reg tx_start;
    reg [7:0] tx_data;
    wire tx;
    wire tx_busy;

    // Instantiate the UART transmitter
    uart_tx #(
        .CLK_FREQ(50000000),  // 50 MHz
        .BAUD_RATE(9600)
    ) uut (
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx(tx),
        .tx_busy(tx_busy)
    );

    // Clock generation: 50MHz => 20ns period
    always #10 clk = ~clk;

    // Monitor key signals (will print every time any changes)
    initial begin
        $monitor("Time=%0t | tx_start=%b | tx_data=0x%02h (%c) | tx=%b | tx_busy=%b", 
                  $time, tx_start, tx_data, tx_data, tx, tx_busy);
    end

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        tx_start = 0;
        tx_data = 8'b0;

        // Wait a few cycles, then deassert reset
        #100;
        rst = 0;

        // Wait a few cycles
        #100;

        // Send a byte (e.g., 0xA5 = 10100101)
        tx_data = 8'hA5;
        tx_start = 1;
        #20; // One clock cycle
        tx_start = 0;

        // Wait for transmission to complete
        wait (!tx_busy);
        $display("Byte Sent: 0x%02h (%c)", tx_data, tx_data);

        // Send another byte (e.g., 0x3C = 00111100)
        #100000;  // Wait some time
        tx_data = 8'h3C;
        tx_start = 1;
        #20;
        tx_start = 0;

        // Wait again
        wait (!tx_busy);
        $display("Byte Sent: 0x%02h (%c)", tx_data, tx_data);

        #100000;

        $finish;
    end

endmodule