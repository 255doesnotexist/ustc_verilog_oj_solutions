module top_module(
  input clk,
  input resetn,
  input [1:0] byteena, // 00: upper byte, 01: lower byte, 10: both bytes, 11: all bytes
  input [15:0] d,
  output reg [15:0] q

);
  // Write your code here
    always @(posedge clk) begin
        if (!resetn) begin
            q <= 16'h0000;
        end else begin
        if (byteena == 2'b00) begin
            // nothing
        end else if (byteena == 2'b01) begin
            q[7:0] <= d[7:0];
        end else if (byteena == 2'b10) begin
            q[15:8] <= d[15:8];
        end else begin
            q <= d;
        end
        end
    end
endmodule