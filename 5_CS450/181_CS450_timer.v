module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);
    reg [9:0] counter;
    
    always@(posedge clk) begin
        if (load==1'b1) counter <= data;
        else counter <= (counter==10'b0)?counter:counter-1;
    end
    
    assign tc = (counter == 10'b0)?1'b1:1'b0;

endmodule
