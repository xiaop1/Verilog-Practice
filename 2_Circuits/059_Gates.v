module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );
    
    integer i;
    
    always @(*) begin
        for(i = 0; i < 3; i ++) begin
            out_both[i] = in[i] & in[i+1];
            out_any[i+1] = in[i] | in[i+1];
            out_different[i] = (in[i] != in[i+1]) ? 1:0;
        end
        out_different[3] = (in[0] != in[3]) ? 1:0;
    end

endmodule
