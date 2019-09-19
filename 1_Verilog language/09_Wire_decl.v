`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    
    wire wire1, wire2, wire3;
    assign wire1 = a & b;
    assign wire2 = c & d;
    assign wire3 = wire1 | wire2;
    assign out = wire3;
    assign out_n = ~wire3;
    
endmodule
