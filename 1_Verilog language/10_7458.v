module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    wire abc1, def1, ab2, cd2;
    assign abc1 = p1c & p1b & p1a;
    assign def1 = p1f & p1e & p1d;
    assign p1y = abc1 | def1;
    
    assign ab2 = p2a & p2b;
    assign cd2 = p2c & p2d;
    assign p2y = ab2 | cd2;
    
endmodule
