module top_module (
    input [8:0] a, b, c, d,
    output reg [8:0] min
);

always @(*) begin
    min = a;
    if (b < min) begin
        min = b;
    end
    if (c < min) begin
        min = c;
    end
    if (d < min) begin
        min = d;
    end
end

endmodule
