module top_module (
    input clk,
    input in,
    output reg out
);
reg previous_in; 
// initial begin
//     previous_in = 1'b0;
//     out = 1'b0;
// end
// 别给初始值 OJ 判题默认是不按有初始值来的 
always @(posedge clk) begin
    out <= in ^ previous_in; // 和前一次不一样的时候输出1
    previous_in <= in;
end
endmodule