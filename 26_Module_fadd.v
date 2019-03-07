/****************************

module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire cin1, cout1, cout2;
    wire [15:0] sum1, sum2;
    assign cin1 = 0;
    add16 instance1(.a(a[15:0]), .b(b[15:0]), .cin(cin1), .cout(cout1), .sum(sum1));
    add16 instance2(.a(a[31:16]), .b(b[31:16]), .cin(cout1), .cout(cout2), .sum(sum2));
    
    assign sum = {sum2, sum1};

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
    always @(*) begin
        if(!cin) begin
            if(a == 0 && b == 0) begin
                sum = 0;
                cout = 0;
            end
            else if((a == 0 && b == 1) || (a == 1 && b == 0)) begin
                sum = 1;
                cout = 0;
            end
            else begin
                sum = 0;
                cout = 1;
            end
        end
        else begin
            if(a == 0 && b == 0) begin
                sum = 1;
                cout = 0;
            end
            else if((a == 0 && b == 1) || (a == 1 && b == 0)) begin
                sum = 0;
                cout = 1;
            end
            else begin
                sum = 1;
                cout = 1;
            end
        end
    end

endmodule

***********************************/

module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//

    wire [31:0] sum_wire;
	wire cout_wire0, cout_wire1, cout_wire2, cout_wire3, cout_wire4, cout_wire5, cout_wire6, cout_wire7;
	wire cout_wire8, cout_wire9, cout_wire10, cout_wire11, cout_wire12, cout_wire13, cout_wire14, cout_wire15;

add1 Inst0_add1 
(
	.a(a[0]),
	.b(b[0]),
	.cin(1'b0),
    .sum(sum_wire[15]),
	.cout(cout_wire0)
);

add1 Inst1_add1
(
	.a(a[1]),
	.b(b[1]),
	.cin(cout_wire0),
    .sum(sum_wire[14]),
	.cout(cout_wire1)
);

add1 Inst2_add1
(
	.a(a[2]),
	.b(b[2]),
	.cin(cout_wire1),
    .sum(sum_wire[13]),
	.cout(cout_wire2)
);

add1 Inst3_add1
(
	.a(a[3]),
	.b(b[3]),
	.cin(cout_wire2),
    .sum(sum_wire[12]),
	.cout(cout_wire3)
);

add1 Inst4_add1
(
	.a(a[4]),
	.b(b[4]),
	.cin(cout_wire3),
    .sum(sum_wire[11]),
	.cout(cout_wire4)
);

add1 Inst5_add1
(
	.a(a[5]),
	.b(b[5]),
	.cin(cout_wire4),
    .sum(sum_wire[10]),
	.cout(cout_wire5)
);

add1 Inst6_add1
(
	.a(a[6]),
	.b(b[6]),
	.cin(cout_wire5),
    .sum(sum_wire[9]),
	.cout(cout_wire6)
);

add1 Inst7_add1
(
	.a(a[7]),
	.b(b[7]),
	.cin(cout_wire6),
    .sum(sum_wire[8]),
	.cout(cout_wire7)
);

add1 Inst8_add1
(
	.a(a[8]),
	.b(b[8]),
	.cin(cout_wire7),
    .sum(sum_wire[7]),
	.cout(cout_wire8)
);

add1 Inst9_add1
(
	.a(a[9]),
	.b(b[9]),
	.cin(cout_wire8),
    .sum(sum_wire[6]),
	.cout(cout_wire9)
);

add1 Inst10_add1
(
	.a(a[10]),
	.b(b[10]),
	.cin(cout_wire9),
    .sum(sum_wire[5]),
	.cout(cout_wire10)
);

add1 Inst11_add1
(
	.a(a[11]),
	.b(b[11]),
	.cin(cout_wire10),
    .sum(sum_wire[4]),
	.cout(cout_wire11)
);

add1 Inst12_add1
(
	.a(a[12]),
	.b(b[12]),
	.cin(cout_wire11),
    .sum(sum_wire[3]),
	.cout(cout_wire12)
);

add1 Inst13_add1
(
	.a(a[13]),
	.b(b[13]),
	.cin(cout_wire12),
    .sum(sum_wire[2]),
	.cout(cout_wire13)
);

add1 Inst14_add1
(
	.a(a[14]),
	.b(b[14]),
	.cin(cout_wire13),
    .sum(sum_wire[1]),
	.cout(cout_wire14)
);

add1 Inst15_add1
(
	.a(a[15]),
	.b(b[15]),
	.cin(cout_wire14),
    .sum(sum_wire[0]),
	.cout(cout_wire15)
);

add16 Inst1_add16
(
	.a(a[31:16]),
	.b(b[31:16]),
	.cin(cout_wire15),
	.cout(),
	.sum(sum_wire[31:16])
);

	assign sum = sum_wire;
    
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
	assign sum = a ^ b ^ cin;
	assign cout = a&b | a&cin |b&cin;
    
endmodule

