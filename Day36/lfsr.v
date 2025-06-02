`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2025 22:33:38
// Design Name: 
// Module Name: lfsr
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


module lfsr(
    output  [7:0] lfsr_out,
    input clock,
    input reset
    );
    reg [7:0] lfsr_reg;
    
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            lfsr_reg = 8'hff; // initial value
        end else begin
            lfsr_reg = {lfsr_reg[6:0], lfsr_reg[7] ^ lfsr_reg[3] ^ lfsr_reg[2] ^ lfsr_reg[1]};
        end
    end
    
    assign lfsr_out = lfsr_reg;
endmodule
