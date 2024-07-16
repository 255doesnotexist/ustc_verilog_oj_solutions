module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   
); 
// 请用户在下方编辑代码
  wire and_1, and_2;
  assign and_1 = a & b;
  assign and_2 = c & d;
  
  wire or_out;
  assign or_out = and_1 | and_2;
  
  assign out_n = !or_out;
  assign out = or_out;
  
//用户编辑到此为止
endmodule
