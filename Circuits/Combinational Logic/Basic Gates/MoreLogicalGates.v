module top_module(
    input a, b,
    output out_and,
    output out_or,
    output out_xor,
    output out_nand,
    output out_nor,
    output out_xnor,
    output out_anotb
);

    and AND1(out_and, a, b);
    or OR(out_or, a, b);
    xor XOR(out_xor, a, b);
    nand NAND(out_nand, a, b);
    nor NOR(out_nor, a, b);
    xnor XNOR(out_xnor, a, b);
    and AND2(out_anotb, a, ~b);

endmodule
