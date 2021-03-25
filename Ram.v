module ram
    #(
    parameter DATA_WIDTH = 8,
    parameter DATA_DEPTH = 128,
    parameter ADDR_WIDTH = $clog2(DATA_DEPTH)
    )(
    input clk,
    input [ADDR_WIDTH-1:0]rd_addr,
    input [ADDR_WIDTH-1:0]wr_addr,
    input wr_en,
    input [DATA_WIDTH-1:0]data_in,
    output [DATA_WIDTH-1:0]data_out
    );

    reg [DATA_WIDTH-1:0]ram[DATA_DEPTH-1] = 0;

    always@(posedge clk)begin
        if(wr_en)begin
            ram[wr_addr] <= data_in;
        end
    end

    assign data_out = ram[rd_addr];

endmodule
