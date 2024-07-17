module tb();
    reg a, b;
    wire q;

    // 对ab信号进行初始化，以匹配示例波形
    initial begin
        a = 1'b0;
        b = 1'b0;

        #3 begin
            a = 1'b0;
            b = 1'b1;
        end

        #2 begin
            a = 1'b1;
            b = 1'b0;
        end

        #2 begin
            a = 1'b1;
            b = 1'b1;
        end

        #2 begin
            a = 1'b0;
            b = 1'b0;
        end

        #2 begin
            a = 1'b0;
            b = 1'b1;
        end

        #2 begin
            a = 1'b1;
            b = 1'b0;
        end

        #2 begin
            a = 1'b1;
            b = 1'b1;
        end

        #2 begin
            a = 1'b0;
            b = 1'b0;
        end

        #1 $finish;
    end

    // 例化 mymodule 模块
    mymodule mymodule_inst (
        .a(a),
        .b(b),
        .q(q)
    );
endmodule

module mymodule(
    input a, b,
    output q
);

    assign q = a & b;

endmodule
