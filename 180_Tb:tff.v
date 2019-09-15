module top_module ();
    reg clk, reset, t;
    reg q;
    initial begin
        clk = 0;
        reset = 0;
        t = 0;
        #15 reset = 1;
        #10 reset = 0;
        #10 t = 1;
    end
    always begin
        #5 clk = ~clk;
    end
    tff tff1(clk, reset, t, q);
endmodule
