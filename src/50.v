module top_module(
    input clk,
    input reset,
    input en,
  	output reg [3:0]q);
always @(posedge clk) begin
    if (reset) begin
        q <= 5;
    end else if (en) begin
        q <= q - 1;
    end else begin
        q <= q;
    end
end
always @(*) begin    
    if (q == 4) begin
        q = 15;
    end
end
endmodule
// 疯狂逃课