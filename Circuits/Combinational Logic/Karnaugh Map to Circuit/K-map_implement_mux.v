module top_module (
    input c,
    input d,
    output [3:0] mux_in
);
    wire w1, w2;
    //mux_in[0] = c+d
    assign w1 = c? 1:0;
    assign mux_in[0] = d? 1:w1;
    //mux_in[1] = 0
    assign mux_in[1] = 0;
    //mux_in[2] = ~d;
    assign mux_in[2] = d? 0:1;
    //mux_in[3] = cd
    assign w2 = d? 1:0;
    assign mux_in[3] = c? w2:0;

endmodule
