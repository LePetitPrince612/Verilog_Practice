module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
    wire [8:0]temp;
    // assign s = ...
    // assign overflow = ...
    always@*begin
        temp = a + b;
    end

    assign s = temp[7:0];
    assign overflow = ((temp[7]==1)&&(a[7]==0)&&(b[7]==0))|((temp[7]==0)&&(a[7]==1)&&(b[7]==1))? 1: 0;
endmodule
