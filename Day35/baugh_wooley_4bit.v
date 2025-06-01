module baugh_wooley_4bit(
    output [7:0] y,
    input [3:0] a,
    input [3:0] b
    );
      
  wire [15:0]p;
    wire [5:0] HS,HC;
    wire [8:0] FS,FC;
    
    and L11(p[0],a[0],b[0]);
    and L12(p[1],a[0],b[1]);
    and L13(p[2],a[0],b[2]);
    nand L14(p[3],a[0],b[3]);
    // 1st Line pp complete 
    
    and L21(p[4],a[1],b[0]);
    and L22(p[5],a[1],b[1]);
    and L23(p[6],a[1],b[2]);
    nand L24(p[7],a[1],b[3]);
    // 2nd Line pp complete
    
    and L31(p[8],a[2],b[0]);
    and L32(p[9],a[2],b[1]);
    and L33(p[10],a[2],b[2]);
    nand L34(p[11],a[2],b[3]);
    // 3rd Line pp complete
    
    nand L41(p[12],a[3],b[0]);
    nand L42(p[13],a[3],b[1]);
    nand L43(p[14],a[3],b[2]);
    and L44(p[15],a[3],b[3]);
    // 4th Line pp complete
    
    
    half_adder h1(HS[0],HC[0],p[1],p[4]);
    full_adder f1(FS[0],FC[0],p[2],p[5],p[8]);
    full_adder f2(FS[1],FC[1],p[3],p[6],p[9]);
    full_adder f3(FS[2],FC[2],1'b1,p[7],p[10]);
    half_adder h2(HS[1],HC[1],p[11],p[14]);
    // Stage 1 complete 
    
    half_adder h3(HS[2],HC[2],HC[0],FS[0]);
    full_adder f4(FS[3],FC[3],FC[0],FS[1],p[12]);
    full_adder f5(FS[4],FC[4],FC[1],FS[2],p[13]);
    half_adder h4(HS[3],HC[3],FC[2],HS[1]);
    half_adder h5(HS[4],HC[4],HC[1],p[15]);
    // Stage 2 complete
  
    half_adder h6(HS[5],HC[5],HC[2],FS[3]);
    full_adder f6(FS[5],FC[5],FC[3],FS[4],HC[5]);
    full_adder f7(FS[6],FC[6],FC[4],HS[3],FC[5]);
    full_adder f8(FS[7],FC[7],HC[3],HS[4],FC[6]);
    full_adder f9(FS[8],FC[8],HC[4],1'b1,FC[7]);
    
    
    
    assign y[7:0]={FS[8],FS[7],FS[6],FS[5],HS[5],HS[2],HS[0],p[0]};
endmodule
