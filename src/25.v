module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire[15:0] hi16, lo16;
    wire hic, loc;
    
    add16 add_lo(
        .a(a[15:0]), .b(b[15:0]), .cin(0),
        .sum(lo16), .cout(loc));
    
    add16 add_hi(
        .a(a[31:16]), .b(b[31:16]), .cin(loc),
        .sum(hi16), .cout(hic));
    
    assign sum = {hi16, lo16};
endmodule


module add1 ( input a, input b, input cin,   output sum, output cout );
// Full adder module here
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
