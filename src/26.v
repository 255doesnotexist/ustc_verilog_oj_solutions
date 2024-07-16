module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
       assign {cout,sum} = a + b + cin;
endmodule

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire[15:0] hi16c0, hi16c1, lo16;
    wire hic0, hic1, loc;
    
    add16 add_lo(
        .a(a[15:0]), .b(b[15:0]), .cin(1'b0),
        .sum(lo16), .cout(loc));
    
    add16 add_hic0(
        .a(a[31:16]), .b(b[31:16]), .cin(1'b0),
        .sum(hi16c0), .cout(hic0));
    
    add16 add_hic1(
        .a(a[31:16]), .b(b[31:16]), .cin(1'b1),
        .sum(hi16c1), .cout(hic1));
    
    assign sum = loc ? {hi16c1, lo16} : {hi16c0, lo16};
endmodule