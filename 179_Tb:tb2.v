module top_module();
    reg clk, in;
    reg [2:0] s;
    reg out;
    initial begin
        clk = 0;
        s = 2;
        in = 0;
        #10 s = 6;
        #10 begin
            s = 2;
            in = 1;
        end
        #10 begin
            s = 7;
            in = 0;
        end
        #10 begin
            s = 0;
            in = 1;
        end
        #30 in = 0;
    end
    always begin
        #5 clk = ~clk;
    end
    
    q7 q7_test(clk, in, s, out);
    
endmodule
