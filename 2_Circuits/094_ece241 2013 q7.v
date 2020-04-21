module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    
    always @(posedge clk) begin
        if(!j) begin
            Q <= k ? j : Q;
        end
        else begin
            Q <= k ? ~Q : j;
        end
    end

endmodule
