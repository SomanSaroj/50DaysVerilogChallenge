module baugh_wooley_4bit_tb(

    );
      reg [3:0]a,b;
    wire [7:0]y;
    
    baugh_wooley_4bit dut(.y(y),.a(a),.b(b));
    
    initial begin
      #0 a=0;b=0;
      #5 a=4;b=-3;
      #5 a=4;b=2;
    end
    
    initial $monitor("time=[%0d] A=%b B=%b S=%b",$time,a,b,y);
    initial #15 $finish;
endmodule
