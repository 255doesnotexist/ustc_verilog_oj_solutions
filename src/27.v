module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
	assign {cout,sum} = a + b + cin;
endmodule
module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire[15:0] hi16, lo16;
    wire hic, loc;
    
    wire[31:0] tb = sub ? ~b : b;
    
    add16 add_lo(
        .a(a[15:0]), .b(tb[15:0]), .cin(sub),
        .sum(lo16), .cout(loc));
    
    add16 add_hi(
        .a(a[31:16]), .b(tb[31:16]), .cin(loc),
        .sum(hi16), .cout(hic));
    
    assign sum = {hi16, lo16};
endmodule