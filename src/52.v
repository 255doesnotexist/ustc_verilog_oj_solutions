module top_module(
    input clk,
    input areset,  //异步、高有效、复位值为0
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 
//Write your code here
always @(posedge clk or posedge areset) begin
    if (areset) begin
        q <= 4'b0000;
    end else if (load) begin
        q <= data;
    end else if (ena) begin
        q <= {1'b0, q[3:1]};
    end
end
endmodule
