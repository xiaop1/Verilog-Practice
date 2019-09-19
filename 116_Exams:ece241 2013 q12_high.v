module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    
    reg [7:0] Q = 0;
    
    always @(posedge clk) begin
        if(enable) begin
            Q <= {Q[6:0], S};
        end
    end
    
    assign Z = Q[{A, B, C}];

endmodule
