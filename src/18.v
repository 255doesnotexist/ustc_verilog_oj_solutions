module top_module (
    input a, b, c, d, e,
    output [24:0] out );//
    // The output is XNOR of two vectors created by 
    // concatenating and replicating the five inputs.
    // assign out = ~{ ... } ^ { ... };
    wire [4:0] concat_replicate = {a, b, c, d, e};
	
    // GPT 告诉我还有个叫生成块的东西 真好！ 
    generate
        genvar i;
        for (i = 0; i < 5; i = i + 1) begin : gen_xnor
            assign out[i*5 +: 5] = ~(concat_replicate ^ {5{concat_replicate[i]}});
        end
    endgenerate
endmodule