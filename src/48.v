module reg4b (input reset, input [3:0] q, output reg [3:0] outq);
    initial begin
        outq = 4'b0101;
    end
    always @(*) begin
        if (reset) begin
            outq <= 0;
        end else begin
            outq <= q;
        end
    end
endmodule

module add4b (input clk, input reset, input [3:0] q, output reg [3:0] outq);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            outq <= 0;
        end else begin
            outq <= q + 1;
        end
    end
endmodule

module top_module (
    input clk,
    input reset,      // 异步复位，高电平有效，复位值为0
    output reg [3:0] q);
    
    wire [3:0] regq, outq;

    reg4b reg4b_inst(reset, outq, regq);
    add4b add4b_inst(clk, reset, regq, outq);

    always @(*) begin
        if (reset) begin
            q <= 0;
        end else begin
            q <= outq;
        end
    end

endmodule

// 不逃课版本