module top_module (
    input clk,
    input in,
    output reg out
);
reg downed; 
initial begin
    downed = 1'b1;
    out = 1'b0;
end
always @(posedge clk) begin
    out <= in & downed;
    if (in == 0) downed <= 1'b1; // 只有降落过一次才能再次触发
    else downed <= 1'b0;
end
endmodule