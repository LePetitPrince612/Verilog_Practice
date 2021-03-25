module top_module (input x, input y, output z);

    wire w1,w2,w3,w4,w5,w6;

    mod_a a1(x,y,w1);
    mod_b b1(x,y,w2);
    mod_a a2(x,y,w3);
    mod_b b2(x,y,w4);

    assign w5 = w1 | w2;
    assign w6 = w3 & w4;
    assign z = w5 ^ w6;

endmodule

module mod_a (input x, input y, output z);
    assign z = (x^y) & x;
endmodule

module mod_b (input x, input y, output z);
    assign z = ~(x ^ y);
endmodule
