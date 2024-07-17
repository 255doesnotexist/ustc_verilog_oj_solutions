module ram_one_port(
	input 	clk,
	input	[1:0] addr,
	input	wr_en,
	input	[7:0] wr_data,
	output	[7:0] rd_data
);
	reg		[7:0] mem[3:0];
	initial
	begin
      mem[0] = 8'b0;
      mem[1] = 8'b0;
      mem[2] = 8'b0;
      mem[3] = 8'b0;
	end
	assign rd_data = mem[addr];
	always@(posedge clk)
	begin
		if(wr_en)
			mem[addr] <= wr_data;
	end
endmodule


module tb(
);
	//信号定义
	reg				clk,wr_en;
	reg		[1:0] 	addr;
	reg		[7:0] 	wr_data;
	wire	[7:0] 	rd_data;
	//信号生成
    initial begin
        clk = 0;
        forever #5 clk = ~clk; //生成周期为10的一个时钟信号，forever为verilog的关键字
    end
    initial begin
        addr = 2'b0;
        repeat(4) begin 		//repeat为verilog关键字，表示重复操作
            @(posedge clk);		//等待clk信号的上升沿到来
            #1 addr = addr + 1;	//clk上升沿1个时间单位后，addr加一
        end
    end
    initial begin
        wr_en = 0;
        #501;			//延时一段时间，
        @(posedge clk);
        #1 wr_en = 1;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);	//等待4个clk上升沿
        #1 wr_en = 0;
    end
    initial begin
        wr_data = 8'h0;
        repeat(4) begin
            wait(wr_en==1'b1);
        #1 wr_data = $random%256;
            @(posedge clk);
        end
        wr_data = 8'h0;
    end
	//例化被测模块
    ram_one_port ram_one_port_inst(
        .clk(clk),
        .addr(addr),
        .wr_en(wr_en),
        .wr_data(wr_data),
        .rd_data(rd_data)
    );
endmodule
