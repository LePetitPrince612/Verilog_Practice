module top_module(
    input [254:0] in,
    output [7:0] out );

    genvar i;
    generate
        for(i = 0; i < 255; i++)begin:add
            assign out = out + in[i];
        end
    endgenerate
endmodule
