module tb();
reg a,b;
    initial begin
        a = 1'b1;
        b = 1'b0;

        #10 begin
            a = 1'b1;
            b = 1'b1;
        end

        #10 begin
            a = 1'b0;
            b = 1'b1;
        end

        #10 begin
            a = 1'b0;
            b = 1'b0;
        end

        #10 begin
            a = 1'b1;
            b = 1'b0;
        end

        #10 begin
            a = 1'b1;
            b = 1'b0;
        end

        #10 $finish;
    end
endmodule