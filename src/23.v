module my_dff8(
  input clk,
  input [7:0] d,
  output reg [7:0] q
);
	always@(posedge clk)
    	q <= d;
endmodule


module top_module(
  input clk,
  input [7:0] d,
  input [1:0] sel,
  output reg [7:0] q
);
  // Write your code here
    wire [7:0] q1, q2, q3;
    
    my_dff8 df1 (
        .clk(clk),
        .d(d),
        .q(q1)
    );
    
    my_dff8 df2 (
        .clk(clk),
        .d(q1),
        .q(q2)
    );
    
    my_dff8 df3 (
        .clk(clk),
        .d(q2),
        .q(q3)
    );
    
    always @(*) begin
        case (sel)
            2'b00: q = d;
            2'b01: q = q1;
            2'b10: q = q2;
            2'b11: q = q3;
        endcase
    end
endmodule