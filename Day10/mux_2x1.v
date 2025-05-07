`timescale 1ns / 1ps

module mux_2x1(y, s, i);
    output y;
    input s;
    input [1:0] i;
	 
	 assign y= ( (~s)&i[0] |(s)&i[1]);


endmodule
