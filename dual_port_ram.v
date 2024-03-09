`timescale 1ns/1ps

module dual_port_sir #(
                       parameter DATA_WIDTH = 8,
                       parameter MEMORY_DEPTH = 32,
                       parameter ADDR_SIZE = 5
                       )
                      (
                       input clk,
                       input wr_rd_p0,
                       input wr_rd_p1,
                       input cs_p0,
                       input cs_p1,
                       input out_en_p0,
                       input out_en_p1,
                       input [ADDR_SIZE-1:0] address_p0,
                       input [ADDR_SIZE-1:0] address_p1,
                       input [DATA_WIDTH-1:0] data_in_p0,
                       input [DATA_WIDTH-1:0] data_in_p1,
                       output [DATA_WIDTH-1:0] data_out_p0,
                       output [DATA_WIDTH-1:0] data_out_p1
                       );

reg [DATA_WIDTH-1:0] memory [0:MEMORY_DEPTH-1];
reg [DATA_WIDTH-1:0] temp_data_out_p0;
reg [DATA_WIDTH-1:0] temp_data_out_p1;

// Port 0

//memory write (wr_rd = 1)
always@(posedge clk) begin
    if( wr_rd_p0 && cs_p0 )
        memory[address_p0] <= data_in_p0;
end

//memory read (wr_rd = 0)
always@(posedge clk) begin
    if( cs_p0 && !wr_rd_p0 )
        temp_data_out_p0 <= memory[address_p0];
end

assign data_out_p0 = (cs_p0 && !wr_rd_p0 && out_en_p0)? temp_data_out_p0:'hz;


// Port 1

//memory write (wr_rd = 1)
always@(posedge clk) begin
    if( wr_rd_p1 && cs_p1 )
        memory[address_p1] <= data_in_p1;
end

//memory read (wr_rd = 0)
always@(posedge clk) begin
    if( cs_p1 && !wr_rd_p1 )
        temp_data_out_p1 <= memory[address_p1];
end

assign data_out_p1 = (cs_p1 && !wr_rd_p1 && out_en_p1)? temp_data_out_p1:'hz;
   
endmodule