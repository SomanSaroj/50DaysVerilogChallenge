`timescale 1ns / 1ps



module b2g_tb(

    );
    reg [3:0] bin;
    wire [3:0] grey;
    
    b2g dut (.grey(grey), .bin(bin) );
    
    initial bin=4'b0000;
    
    always #2 bin=bin+1'b1;
    
    initial $monitor("time=[%0d] bin = %b grey = %b",$time,bin,grey);
    
    initial #31 $finish;
       
        
        
    
endmodule
