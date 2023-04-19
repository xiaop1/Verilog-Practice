module top_module( 
    input a, b,
    output cout, sum );
    
    assign {cout, sum} = a + b;

endmodule
