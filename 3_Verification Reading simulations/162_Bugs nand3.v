module top_module (input a, input b, input c, output out);//
    
    wire out_tmp;
    assign out = ~out_tmp;
    andgate inst1 ( out_tmp, a, b, c, 1, 1 );

endmodule
