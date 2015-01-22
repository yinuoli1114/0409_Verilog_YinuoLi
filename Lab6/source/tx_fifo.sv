// $Id: $
// File name:   tx_fifo.sv
// Created:     10/6/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: fifo

module tx_fifo
  (
   input wire clk,
   input wire n_rst,
   input wire read_enable,
   output wire [7:0] read_data,
   output wire fifo_empty,
   output wire fifo_full,
   input wire write_enable,
   input wire [7:0] write_data
   );

   fifo FIFO
     (
      .r_clk(clk),
      .w_clk(clk),
      .n_rst(n_rst),
      .r_enable(read_enable),
      .w_enable(write_enable),
      .w_data(write_data),
      .r_data(read_data),
      .empty(fifo_empty),
      .full(fifo_full)
      );
endmodule // tx_fifo


   
