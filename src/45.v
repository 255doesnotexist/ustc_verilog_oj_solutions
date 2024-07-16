module dff (
    input clk,
    input d,
    output reg q
);
    initial q = 1'b0;
    always @(posedge clk) begin
        q <= d;
    end
endmodule

module top_module (
    input clk,
    input x,
    output z
); 
    wire d1, d2, d3;
    wire q1, q2, q3;

    assign d1 = q1 ^ x;
    assign d2 = x & (~q2);
    assign d3 = x | (~q3);
    
    dff dff1 (
        .clk(clk),
        .d(d1),
        .q(q1)
    );

    dff dff2 (
        .clk(clk),
        .d(d2),
        .q(q2)
    );

    dff dff3 (
        .clk(clk),
        .d(d3),
        .q(q3)
    );

    assign z = ~(q1 | q2 | q3);
endmodule
