module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); // Module body starts after module declaration

    assign outv = vec;
    assign o0 = outv[0];
    assign o1 = outv[1];
    assign o2 = outv[2];
    
endmodule
