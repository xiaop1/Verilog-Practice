module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    
    reg [31:0] old, result, tmp;
    initial tmp = 0;
    always @(posedge clk) begin
        if(reset) begin
            old = in;
            result = 0;
            out = 0;
        end
        else begin
            tmp = (in ^ old) & old;
            result = result | tmp;
            out = result;
            old = in;
        end
    end

endmodule
