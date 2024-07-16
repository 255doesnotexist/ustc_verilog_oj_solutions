module my_dff(input clk,input d,output reg q);
	always@(posedge clk)
    	q <= d;
endmodule

module top_module ( input clk, input d, output q );
 // Write your code here
    wire q1, q2, q3;
    
    my_dff df1 (
        .clk(clk),
        .d(d),
        .q(q1)
    );
    
    my_dff df2 (
        .clk(clk),
        .d(q1),
        .q(q2)
    );
    
    my_dff df3 (
        .clk(clk),
        .d(q2),
        .q(q3)
    );
    
    assign q = q3;
endmodule
