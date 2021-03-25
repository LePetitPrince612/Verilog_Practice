module top_module(
    input [2:0] in,
    output [1:0] out );

    reg [1:0]tem;

    always@*begin
        tem = 0;
        for(int i = 0; i < 3; i++)begin
            tem = tem + in[i];
        end
    end

    assign out = tem;

endmodule
