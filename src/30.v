module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always); 
    
    assign out_assign = sel_b1 ? b : a;
    
// 请用户在下方编辑代码
    always @(*)
        begin
            if (sel_b1 == 1'b0) begin out_always = a; end
            else begin out_always = b; end
        end
//用户编辑到此为止
endmodule