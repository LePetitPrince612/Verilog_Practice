//An adder-subtractor can be built from an adder by optionally negating one of
//the inputs, which is equivalent to inverting the input then adding 1.
//The net result is a circuit that can do two operations:
//(a + b + 0) and (a + ~b + 1)

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0]signedb;
    wire cout;
    wire [15:0]out1, out2;

    assign signedb = {32{sub}} ^ b;

    add16 inst_add1(
        .a(a[15:0]),
        .b(signedb[15:0]),
        .cin(sub),
        .cout(cout),
        .sum(out1)
        );

    add16 inst_add2(
        .a(a[31:16]),
        .b(signedb[31:16]),
        .cin(cout),
        .cout(),
        .sum(out2)
        );

    assign sum = {out2, out1};

endmodule
