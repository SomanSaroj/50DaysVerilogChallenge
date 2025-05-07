`timescale 1ns / 1ps


module mux_2x1_tb_v;
	reg s;
	reg [1:0] i;
	wire y;

	mux_2x1 uut (
		.y(y), 
		.s(s), 
		.i(i)
	);
	initial begin
		
		s = 0;
		i = 0;

	end
	always #2 s=~s;
	always #4 i=i+1;
	initial $monitor("[%0d] i=%b s=%b y=%b",$time,i,s,y);
	initial #15 $finish;
      
endmodule

