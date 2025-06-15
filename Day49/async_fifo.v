`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2025 20:07:18
// Design Name: 
// Module Name: async_fifo
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


module async_fifo #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4
)(
    input wire wr_clk,             // Write clock
    input wire wr_rst,             // Write reset
    input wire wr_en,              // Write enable
    input wire [DATA_WIDTH-1:0] wr_data, // Write data
    output wire full,              // FIFO full

    input wire rd_clk,             // Read clock
    input wire rd_rst,             // Read reset
    input wire rd_en,              // Read enable
    output wire [DATA_WIDTH-1:0] rd_data, // Read data
    output wire empty              // FIFO empty
);

    localparam DEPTH = 1 << ADDR_WIDTH;

    // Internal memory
    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

    // Write pointer and sync
    reg [ADDR_WIDTH:0] wr_ptr_bin = 0, wr_ptr_gray = 0;
    reg [ADDR_WIDTH:0] wr_ptr_gray_next;
    reg [ADDR_WIDTH:0] rd_ptr_gray_sync1 = 0, rd_ptr_gray_sync2 = 0;

    // Read pointer and sync
    reg [ADDR_WIDTH:0] rd_ptr_bin = 0, rd_ptr_gray = 0;
    reg [ADDR_WIDTH:0] wr_ptr_gray_sync1 = 0, wr_ptr_gray_sync2 = 0;

    // Full/Empty
    assign full = (wr_ptr_gray_next == {~rd_ptr_gray_sync2[ADDR_WIDTH:ADDR_WIDTH-1], rd_ptr_gray_sync2[ADDR_WIDTH-2:0]});
    assign empty = (rd_ptr_gray == wr_ptr_gray_sync2);

    // Write logic
    always @(posedge wr_clk or posedge wr_rst) begin
        if (wr_rst) begin
            wr_ptr_bin <= 0;
            wr_ptr_gray <= 0;
        end else if (wr_en && !full) begin
            mem[wr_ptr_bin[ADDR_WIDTH-1:0]] <= wr_data;
            wr_ptr_bin <= wr_ptr_bin + 1;
            wr_ptr_gray <= (wr_ptr_bin + 1) ^ ((wr_ptr_bin + 1) >> 1);
        end
    end

    // Next Gray code for write pointer (for full check)
    always @(*) begin
        wr_ptr_gray_next = (wr_ptr_bin + 1) ^ ((wr_ptr_bin + 1) >> 1);
    end

    // Synchronize read pointer into write clock domain
    always @(posedge wr_clk or posedge wr_rst) begin
        if (wr_rst) begin
            rd_ptr_gray_sync1 <= 0;
            rd_ptr_gray_sync2 <= 0;
        end else begin
            rd_ptr_gray_sync1 <= rd_ptr_gray;
            rd_ptr_gray_sync2 <= rd_ptr_gray_sync1;
        end
    end

    // Read logic
    reg [DATA_WIDTH-1:0] rd_data_reg = 0;
    assign rd_data = rd_data_reg;

    always @(posedge rd_clk or posedge rd_rst) begin
        if (rd_rst) begin
            rd_ptr_bin <= 0;
            rd_ptr_gray <= 0;
        end else if (rd_en && !empty) begin
            rd_data_reg <= mem[rd_ptr_bin[ADDR_WIDTH-1:0]];
            rd_ptr_bin <= rd_ptr_bin + 1;
            rd_ptr_gray <= (rd_ptr_bin + 1) ^ ((rd_ptr_bin + 1) >> 1);
        end
    end

    // Synchronize write pointer into read clock domain
    always @(posedge rd_clk or posedge rd_rst) begin
        if (rd_rst) begin
            wr_ptr_gray_sync1 <= 0;
            wr_ptr_gray_sync2 <= 0;
        end else begin
            wr_ptr_gray_sync1 <= wr_ptr_gray;
            wr_ptr_gray_sync2 <= wr_ptr_gray_sync1;
        end
    end

endmodule

