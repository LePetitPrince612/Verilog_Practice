module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] out1, out2;
    wire cout;

    add16 inst_add16_1(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(0),
        .cout(cout),
        .sum(out1)
        );
    add16 inst_add16_2(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(cout),
        .cout(),
        .sum(out2)
        );

    assign sum = {out2, out1};

endmodule

module add1(
    input a,
    input b,
    input cin,
    output cout,
    output sum
    );

    assign cout = (a & cin) | (b & cin) | (a & b);
    assign sum = (~a & ~b & cin) | (~a & b & ~cin) | (a & b & cin) | (a & ~b & ~cin);

endmodule
