module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    integer i;
    wire [3:0] cout;
    assign sum[0] = x[0] ^ y[0];
    assign cout[0] = x[0] & y[0];
    always @(*) begin
        for(i = 1; i < 4; i=i+1) begin
            sum[i] = x[i] ^ y[i] ^ cout[i-1];
            cout[i] = x[i] & y[i] | x[i] & cout[i-1] | y[i] & cout[i-1];
        end
        sum[4] = cout[3];
    end

endmodule
