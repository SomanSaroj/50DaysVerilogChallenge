`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2025 23:34:10
// Design Name: 
// Module Name: barrel_shifter_tb
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


module barrel_shifter_tb( );
reg [7:0] in;
reg [2:0] shift;
reg direction;
wire [7:0] out;

barrel_shifter dut(
    .out(out),
    .in(in),
    .shift(shift),
    .direction(direction)
);

initial begin
    in = 8'h12;
    shift = 3'd2;
    direction = 0; // left shift
    #10;
    $display("Left shift by 2: %h", out);
    direction = 1; // right shift
    #10;
    $display("Right shift by 2: %h", out);
    #100 $finish;
end
endmodule
