`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2025 21:13:39
// Design Name: 
// Module Name: i2c_sniffer_tb
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


module i2c_sniffer_tb;

    reg clk, rst;
    reg scl, sda;
    wire start_detected, stop_detected, ack_received, nack_detected, data_valid;
    wire [7:0] data_byte;

    // Instantiate the i2c_sniffer
    i2c_sniffer uut (
        .start_detected(start_detected),
        .stop_detected(stop_detected),
        .ack_received(ack_received),
        .nack_detected(nack_detected),
        .data_valid(data_valid),
        .data_byte(data_byte),
        .clk(clk),
        .rst(rst),
        .scl(scl),
        .sda(sda)
    );

    // Clock generation
    always #5 clk = ~clk; // 100MHz system clock

    // Helper task to send a byte on I2C
    task send_byte(input [7:0] data);
        integer i;
        begin
            for (i = 7; i >= 0; i = i - 1) begin
                @(negedge clk);
                sda <= data[i];
                @(negedge clk);
                scl <= 1;
                @(negedge clk);
                scl <= 0;
            end
        end
    endtask

    initial begin
        // Initial values
        clk = 0;
        rst = 1;
        scl = 1;
        sda = 1;

        #20;
        rst = 0;

        // Simulate I2C START
        @(negedge clk); sda <= 0; scl <= 1; // START
        @(negedge clk); scl <= 0;

        // Send 0xA5 = 10100101
        send_byte(8'hA5);

        // Simulate ACK
        @(negedge clk);
        sda <= 0; // ACK bit
        @(negedge clk);
        scl <= 1;
        @(negedge clk);
        scl <= 0;
        sda <= 1; // Release SDA

        // Simulate STOP
        @(negedge clk); sda <= 0; scl <= 1;
        @(negedge clk); sda <= 1; // STOP

        #50;
        $finish;
    end

endmodule
