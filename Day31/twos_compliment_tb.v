`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2025 22:26:24
// Design Name: 
// Module Name: twos_compliment_tb
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


module twos_compliment_tb();
reg [3:0] binary_in;
wire [3:0] out;

twos_compliment dut(
    .binary_in(binary_in),
    .out(out)
);

initial begin
    binary_in = 4'b1010;
    #10 binary_in = 4'b1011;
    #10 binary_in = 4'b1100;
    #10 binary_in = 4'b1101;
    #10 binary_in = 4'b1110;
    
end
initial $monitor("Number =%b 2's Complement: %b",binary_in, out);
initial #50 $finish;

endmodule
