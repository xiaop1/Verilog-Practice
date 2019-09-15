module top_module (
    input clk,
    input a,
    output q );
    
    always @ (posedge clk) begin
        q <= ~a;
    end

endmodule
