module top_module (
    input clk,
    input in, 
    output reg out);

    wire tin;
    assign tin = out ^ in;

    always @(posedge clk) begin
        out <= tin;
    end

endmodule
