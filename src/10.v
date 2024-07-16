module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0);
// Module body starts after module declaration
// 请用户在下方编辑代码
    assign outv = vec[2:0];
    assign o2 = vec[2];
    assign o1 = vec[1];
    assign o0 = vec[0];
// 用户编辑到此为止
endmodule