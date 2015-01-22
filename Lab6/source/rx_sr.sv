// $Id: $
// File name:   rx_sr.sv
// Created:     10/19/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: receiving shift register

module rx_sr
  (
   input wire clk,
   input wire n_rst,
   input wire sda_in,
   input wire rising_edge_found,
   input wire rx_enable,
   output wire [7:0] rx_data
   );

   flex_stp_sr #(.NUM_BITS(8), .SHIFT_MSB(1)) EIGHT_SHIFT
     (
      .clk(clk),
      .n_rst(n_rst),
      .shift_enable(rising_edge_found & rx_enable),
      .serial_in(sda_in),
      .parallel_out(rx_data)
      );

endmodule // rx_sr
