`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2025 21:02:10
// Design Name: 
// Module Name: jk_flipflop
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


module jk_flipflop(Qn,Q,clk,J,K); 
    output reg Qn,Q;
    input clk,J,K;
    initial begin
        Q=1'b0;Qn=1'b1;
    end
        always @(posedge clk) begin
            case ({J, K})
                2'b00: begin  // No change
                    Q <= Q; Qn <= Qn;      end         
                2'b01: begin  // Reset
                    Q <= 1'b0; Qn <= 1'b1; end
                2'b10: begin  // Set
                    Q <= 1'b1; Qn <= 1'b0; end
                2'b11: begin  // Toggle
                    Q <= ~Q; Qn <= ~Qn;    end
            endcase
        end
        
endmodule
