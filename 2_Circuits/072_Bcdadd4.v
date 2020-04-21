module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire [15:0] cout_tmp;
    bcd_fadd fadd(.a(a[3:0]), .b(b[3:0]), .cin(cin), .cout(cout_tmp[0]), .sum(sum[3:0]));
    assign cout = cout_tmp[12];
    generate
        genvar i;
        for(i = 4; i < 16; i = i + 4) begin:adder
            bcd_fadd fadd(.a(a[i+3:i]), .b(b[i+3:i]), .cin(cout_tmp[i-4]), .cout(cout_tmp[i]), .sum(sum[i+3:i]));
        end
    endgenerate

endmodule
