module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  
  
    parameter A=0, B=1; 
	reg state, next_state;
    always @(*) begin    //有限状态机第一段
        // State transition logic
        if (state == A) begin
            if (in) begin
                next_state = A;
            end else begin
                next_state = B;
            end
        end else if (state == B) begin
            if (in) begin
                next_state = B;
            end else begin
                next_state = A;
            end
        end
	end
	always @(posedge clk, posedge areset) begin    //有限状态机第二段
        // State flip-flops with asynchronous reset
        if (areset) begin
            state <= B;
        end else begin
            state <= next_state;
        end
    end
    //有限状态机第三段，信号输出逻辑
    // assign out = (state == ...);
    assign out = (state == B);
endmodule
