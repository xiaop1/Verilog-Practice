module top_module (input x, input y, output z);
    wire [3:0] z_tmp;
    
    task A;
        input x,y;
        output z;
        begin
            z = (x ^ y) & x;
        end
    endtask
    
    task B;
        input x,y;
        output z;
        begin
            if(x == y)
                z = 1;
            else
                z = 0;
        end
    endtask
    
    always @(*) begin
        A(x,y,z_tmp[0]);
        B(x,y,z_tmp[1]);
        A(x,y,z_tmp[2]);
        B(x,y,z_tmp[3]);
    end
    
    assign z = (z_tmp[0] | z_tmp[1]) ^ (z_tmp[2] & z_tmp[3]);
    
endmodule
