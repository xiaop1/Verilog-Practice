module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire cout1, cout2;
    wire [15:0] sum1, sum2;
    wire [31:0] b_xor;
    
    always @(*) begin
        if(sub)
            b_xor = ~b;
        else
            b_xor = b;
    end
    
    add16 instance1(.a(a[15:0]), .b(b_xor[15:0]), .cin(sub), .cout(cout1), .sum(sum1));
    add16 instance2(.a(a[31:16]), .b(b_xor[31:16]), .cin(cout1), .cout(cout2), .sum(sum2));
    
    assign sum = {sum2, sum1};
    
endmodule
