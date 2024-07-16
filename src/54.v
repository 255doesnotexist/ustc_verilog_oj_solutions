module top_module(
	input	[2:0] addr,
	output	[3:0]	q
);
reg [3:0] rom [7:0];

integer i;
initial begin
    for (i = 0; i < 8; i = i + 1) begin
        rom[i] = i;
    end
end

assign q = rom[addr];
endmodule
