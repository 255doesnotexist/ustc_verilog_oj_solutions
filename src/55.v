module ram_one_port(
input 		  clk,
input		  wr_en,
input 	[2:0]  wr_addr,
input	[15:0] wr_data,
input	[2:0]  rd_addr,
output	[15:0] rd_data);

reg	[15:0] mem[7:0];
initial
begin
$readmemh("memfile.dat",mem);
end
assign rd_data = mem[rd_addr];
// assign mem[wr_addr] = wr_en ? wr_data : mem[wr_addr];
always@(posedge clk)
begin
    if(wr_en)
	mem[wr_addr] <= wr_data;
end
endmodule