module top_module (
    input clk,
    input a,
    output [3:0] q 
);
    
    always @ (posedge clk) begin
        if(a == 1) begin
            q = 4;
        end
        else begin
            q = (q < 6) ? (q + 1) : 0;
        end
    end

endmodule
