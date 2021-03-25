module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0]w1, w2;
    wire cout1;
    wire cout2;

    add16 add1(.a(a[15:0]), .b(b[15:0]), .cin(0), .cout(cout1), .sum(w1));
    add16 add2(.a(a[31:16]), .b(b[31:16]), .cin(cout1) ,.cout(cout2), .sum(w2));

    assign sum = {w2, w1};

endmodule
