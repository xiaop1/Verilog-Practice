module top_module ( output reg A, output reg B );//
    
    // generate input patterns here
    initial begin
        A = 0;
        B = 0;
        #10 A = 1;
        #5  B = 1;
        #5  A = 0;
        #20 B = 0;
    end

endmodule
