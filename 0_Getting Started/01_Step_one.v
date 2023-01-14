module top_module( output one );

// Insert your code here
    assign one = 1'b1; 
    // 1: 32-bit width, i.e. 32'b00000000_00000000_00000000_00000001
    // 1'b1: 1-bit width
    // see discussion in stackoverflow: https://stackoverflow.com/questions/59099852/difference-between-1-and-1b1-in-verilog
    
    
endmodule
