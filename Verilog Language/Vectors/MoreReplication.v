module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    // The output is XNOR of two vectors created by
    // concatenating and replicating the five inputs.
    // assign out = ~{ ... } ^ { ... };
    wire [24:0] temp1;
    wire [24:0] temp2;

    assign temp1 = {{5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}}};
    assign temp2 = {5{a, b, c, d, e}};

    assign out = ~(temp1 ^ temp2);

endmodule
