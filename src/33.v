module top_module(
  input [3:0] in,
  output reg [1:0] pos
);
  // Write your code here
    always @(*) begin
        if (in[0]) pos = 2'd0; 
        else if (in[1]) pos = 2'd1;
        else if (in[2]) pos = 2'd2;
        else if (in[3]) pos = 2'd3; // 低位优先？
        else pos = 2'd0;
    end
endmodule