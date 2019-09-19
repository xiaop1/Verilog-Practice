module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    
    reg tmp;
    //not use <=
    always @(posedge clk) begin
        tmp = E ? w : Q;
        Q = L ? R : tmp;
    end

endmodule
