module top_module (
    input clk,
    input d,
    output q
);
    
    reg [1:0] status;
    
    always @(posedge clk) begin
        status[0] = d;
    end
    
    always @(negedge clk) begin
        status[1] = d;
    end
    
    assign q = clk ? status[0] : status[1];
    
endmodule