module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
    
    integer i;
    
    always @(*) begin
        for(i = 0; i < 99; i ++) begin
            out_both[i] = in[i] & in[i+1];
            out_any[i+1] = in[i] | in[i+1];
            out_different[i] = (in[i] != in[i+1]) ? 1:0;
        end
        out_different[99] = (in[0] != in[99]) ? 1:0;
    end

endmodule
