`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2025 21:28:13
// Design Name: 
// Module Name: sr_flipflop
// Project Name: 


module sr_flipflop(
    output reg Qn,
    output reg Q,
    input clk,
    input S,
    input R
    );
    initial begin
        Q = 1'b0; Qn = 1'b1;    
    end    
    always @(posedge clk) begin
        case ({S, R})
            2'b00: begin              
                Q <= Q; Qn <= Qn;        end
            2'b01: begin  // Reset Condition
                Q <= 1'b0; Qn <= 1'b1;   end
            2'b10: begin        
                Q <= 1'b1; Qn <= 1'b0;   end
            2'b11: begin  // Invalid state
                Q <= Q; Qn <= Qn;        end      
        endcase
    end 
endmodule
