module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );
    // assign { ... } = { ... };
    wire [31:0] output_signal = {a, b, c, d, e, f, 2'b11};
    assign w[7:0] = output_signal[31:24];
    assign x[7:0] = output_signal[23:16];
    assign y[7:0] = output_signal[15:8];
    assign z[7:0] = output_signal[7:0];
endmodule
