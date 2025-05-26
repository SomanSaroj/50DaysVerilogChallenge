`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2025 21:53:07
// Design Name: 
// Module Name: sequence_detector
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
module sequence_generator(
    output reg seq_out,
    input clk,reset);
    reg [1:0] state;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= 2'b00; seq_out <= 1'b1; 
        end else begin
            case (state)
                2'b00: begin seq_out <= 1'b1; state <= 2'b01; end
                2'b01: begin
                    seq_out <= 1'b0;state <= 2'b10; end
                2'b10: begin
                    seq_out <= 1'b1; state <= 2'b11; end
                2'b11: begin
                    seq_out <= 1'b0; state <= 2'b00; end     
            endcase
        end
    end
endmodule
