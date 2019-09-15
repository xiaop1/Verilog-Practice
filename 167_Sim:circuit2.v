module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    reg [2:0] sum;
    assign sum = a + b + c + d;
    assign q = (sum == 1 || sum == 3) ? 0 : 1; // Fix me

endmodule
