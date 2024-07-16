module top_module(
    input 			clk		,  //4Hz
    input 			reset	,
	output reg	[7:0]	ss
); 
	// Write your code here
    reg [1:0] cnt;
    initial begin
        cnt = 2'b00;
    end
    always @(posedge clk) begin
        if (reset) begin
            ss <= 8'h00;
        end else if(cnt == 3 && ss[3:0] < 4'd10) begin
            ss <= ss + 8'd1;
            cnt = 2'b00;
        end else if(cnt == 3 && ss[3:0] == 4'd10) begin
            ss <= ss + 8'd6; // BCD 码进位补足
            cnt = 2'b00;
        end else begin
            cnt <= cnt + 1;
        end
    end
endmodule
