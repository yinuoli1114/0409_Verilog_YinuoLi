// $Id: $
// File name:   rx_sr.sv
// Created:     10/8/2014
// Author:      Ikeme Osi-Ogbu
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: recieving shift register
module rx_sr
(
  input wire clk,
  input wire n_rst,
  input wire sda_in,
  input wire rising_edge_found,
  input wire rx_enable,
  output wire [7:0] rx_data,
  output wire [7:0] rx_w_data
);

flex_stp_sr 
	#(
		.NUM_BITS(8),
		.SHIFT_MSB(1)
		)
	COREc(
		.clk(clk),
		.n_rst(n_rst),
		.serial_in(sda_in),
		.shift_enable(rx_enable & rising_edge_found),
		.parallel_out(rx_data)
	);
assign rx_w_data = rx_data;

endmodule

