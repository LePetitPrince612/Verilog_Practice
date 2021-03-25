module top_module ( input [1:0] A, input [1:0] B, output z );

    wire [1:0]d;
	assign d = A ^ B;

    assign z = (d == 2'b00)? 1 : 0;
    //assign z = (A == B)? 1 : 0;
endmodule
