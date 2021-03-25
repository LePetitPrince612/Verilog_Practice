module fifo_mem
    #(
    parameter DATA_WIDTH = 8,
    parameter FIFO_DEPTH = 16
    )(
    input clk,
    input rst_n,
    input wr,
    input rd,
    input [DATA_WIDTH-1:0]data_in,
    output [DATA_WIDTH-1:0]data_out,
    output fifo_empty,
    output fifo_full,
    output underflow,
    output overflow
    );

    localparam ADDR_WIDTH = $clog2(FIFO_DEPTH) + 1;

    reg [ADDR_WIDTH-1:0] rd_addr = 0;
    reg [ADDR_WIDTH-1:0] wr_addr = 0;

    reg [DATA_WIDTH-1:0] mem [FIFO_DEPTH-1:0] = 0;

    always@(posedge clk)begin
        if(rst_n)begin
            rd_addr <= 0;
            wr_addr <= 0;
        else begin
            if(wr)begin
                if(!fifo_full)begin
                    wr_addr <= wr_addr + 1;
                    mem[wr_addr] <= data_in;
                end
            end
            if(rd)begin
                if(!fifo_empty)begin
                    rd_addr <= rd_addr + 1;
                end
            end
        end
    end

    assign data_out = mem[rd_addr];

    assign fifo_empty = (rd_addr == wr_addr)? 1 : 0;
    assign fifo_full = (rd_addr[ADDR_WIDTH-1] == ~wr_addr[ADDR_WIDTH-1] && rd_addr[ADDR_WIDTH-2:0] == wr_addr[ADDR_WIDTH-2]:0)? 1 : 0;

    always@(posedge clk)begin
        if(rst_n)begin
            overflow <= 0;
            underflow <= 0;
        end
        else begin
            if(fifo_full && wr)begin
                overflow <= 1;
            end
            else begin
                overflow <= 0;
            end
            if(fifo_empty && rd)begin
                underflow <= 1;
            end
            else begin
                underflow <= 0;
            end
        end
    end

endmodule
