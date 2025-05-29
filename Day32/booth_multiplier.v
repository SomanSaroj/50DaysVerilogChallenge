`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2025 22:55:14
// Design Name: 
// Module Name: booth_multiplier
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


module booth_multiplier(
    output reg signed [7:0] product,
    input signed[3:0] multiplicand,
    input signed [3:0] multiplier
    );
    reg [7:0] A, Q, M;
        reg Q_1;
        reg [3:0] count;
    
        always @ (multiplicand or multiplier) begin
            A = 8'd0;
            M = {multiplicand, 4'd0};
            Q = {4'd0, multiplier};
            Q_1 = 1'b0;
            count = 4'd4;
    
            while (count > 0) begin
                case ({Q[0], Q_1})
                    2'b01: A = A + M;
                    2'b10: A = A - M;
                endcase
    
                Q_1 = Q[0];
                Q = {A[0], Q[7:1]};
                A = {A[7], A[7:1]};
                count = count - 1;
            end
    
            product = {A[7:0]};
        end
endmodule
