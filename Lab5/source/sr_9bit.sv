// $Id: $
// File name:   sr_9bit.sv
// Created:     9/27/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: 9bitshift

module sr_9bit
  (
   input wire clk,
   input wire n_rst,
   input wire shift_strobe,
   input wire serial_in,
   output wire [7:0] packet_data,
   output wire stop_bit
   );

   flex_stp_sr #(.NUM_BITS(8), .SHIFT_MSB(1)) NINE_SHIFT
     (
      .clk(clk),
      .n_rst(n_rst),
      .shift_enable(shift_strobe),
      .serial_in(serial_in),
      .parallel_out({stop_bit,packet_data})
      );
endmodule // sr_9bit
