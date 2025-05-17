`timescale 1ns / 1ps



module b2g(
    output [3:0] grey,
    input [3:0] bin
    );
    
    assign grey[3]=bin[3];
    assign grey[2]=bin[3]^bin[2];
    assign grey[1]=bin[2]^bin[1];
    assign grey[0]=bin[1]^bin[0];
    
endmodule
