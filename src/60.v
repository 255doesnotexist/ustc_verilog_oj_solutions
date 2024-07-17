module tb();
    reg clk; // 定义时钟信号
    wire [2:0] out; // 定义必要输出信号
  
    // 时钟信号生成
    initial begin
        clk = 0; // 初始化时钟信号为0
        forever #5 clk = ~clk; // 每5ns翻转一次时钟信号
    end

    // 模块例化
    dut dut_inst (
        .clk(clk),
        .out(out)
    );
endmodule

module dut(input clk, output reg [2:0]out);
  //测试模块
  always @(posedge clk)
    out <= out + 1'b1;  
endmodule