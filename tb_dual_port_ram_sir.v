`timescale 1ns / 1ps
module tb_dual_port_ram_sir #(
                       parameter DATA_WIDTH = 8,
                       parameter MEMORY_DEPTH = 32,
                       parameter ADDR_SIZE = 5
                       )();
                      
                       reg clk;
                       reg wr_rd_p0;
                       reg wr_rd_p1;
                       reg cs_p0;
                       reg cs_p1;
                       reg out_en_p0;
                       reg out_en_p1;
                       reg [ADDR_SIZE-1:0] address_p0;
                       reg [ADDR_SIZE-1:0] address_p1;
                       reg [DATA_WIDTH-1:0] data_in_p0;
                       reg [DATA_WIDTH-1:0] data_in_p1;
                       wire [DATA_WIDTH-1:0] data_out_p0;
                       wire [DATA_WIDTH-1:0] data_out_p1;
                       
         dual_port_ram ram(.clk(clk), .wr_rd_p0(wr_rd_p0), .wr_rd_p1(wr_rd_p1), .cs_p0(cs_p0), 
                        .cs_p1(cs_p1), .out_en_p0(out_en_p0), .out_en_p1(out_en_p1),.address_p0(address_p0),
                        .address_p1(address_p1), .data_in_p0(data_in_p0), .data_in_p1(data_in_p1),
                        .data_out_p0(data_out_p0), .data_out_p1(data_out_p1));
                        
                        
        always #5 clk= clk;
        
        initial
        begin
            clk=0;
            wr_rd_p0=1;#10
            
            
        
        
        end                
                       
endmodule
