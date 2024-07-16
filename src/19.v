module top_module(
  input 	a,
  input 	b,
  output 	out
);
  
// 请用户在下方编辑代码

    mod_a inst_name1(
        .in1 (a),
        .in2 (b),
        .out (out));

//用户编辑到此为止
endmodule


module mod_a ( 
  input 	in1, 
  input 	in2, 
  output 	out 
);
assign out = in1 & in2;
endmodule
