module clkdff (
    input clk,
    input d,
    input enable,
    output reg q
);
    always @(posedge clk) begin
        if (enable) begin
            q <= d;
        end
    end
endmodule

module mux8to1 (
    input [7:0] data,
    input [2:0] sel,
    output reg out
);
    always @(*) begin
        case(sel)
            3'b000: out = data[0];
            3'b001: out = data[1];
            3'b010: out = data[2];
            3'b011: out = data[3];
            3'b100: out = data[4];
            3'b101: out = data[5];
            3'b110: out = data[6];
            3'b111: out = data[7];
            default: out = 1'b0;
        endcase
    end
endmodule

module top_module (
    input clk,
    input enable,
    input S,
    input A,
    input B,
    input C,
    output Z
);

    wire [7:0] shift_reg;
    wire [2:0] sel;
    wire mux_out;

    assign sel = {A, B, C};

    clkdff dff0 (.clk(clk), .d(S), .enable(enable), .q(shift_reg[0]));
    clkdff dff1 (.clk(clk), .d(shift_reg[0]), .enable(enable), .q(shift_reg[1]));
    clkdff dff2 (.clk(clk), .d(shift_reg[1]), .enable(enable), .q(shift_reg[2]));
    clkdff dff3 (.clk(clk), .d(shift_reg[2]), .enable(enable), .q(shift_reg[3]));
    clkdff dff4 (.clk(clk), .d(shift_reg[3]), .enable(enable), .q(shift_reg[4]));
    clkdff dff5 (.clk(clk), .d(shift_reg[4]), .enable(enable), .q(shift_reg[5]));
    clkdff dff6 (.clk(clk), .d(shift_reg[5]), .enable(enable), .q(shift_reg[6]));
    clkdff dff7 (.clk(clk), .d(shift_reg[6]), .enable(enable), .q(shift_reg[7]));

    mux8to1 mux (.data(shift_reg), .sel(sel), .out(mux_out));
    
    assign Z = mux_out;
    
endmodule