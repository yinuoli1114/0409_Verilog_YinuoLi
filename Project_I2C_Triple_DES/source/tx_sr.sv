// $Id: $
// File name:   tx_sr.sv
// Created:     10/8/2014
// Author:      Ikeme Osi-Ogbu
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: transmitting shift register
module tx_sr
(
  input wire clk,
  input wire n_rst,
  input wire load_data,
  input wire falling_edge_found,
  input wire tx_enable,
  input wire [63:0] tx_data,
  output wire tx_out
);


flex_pts_sr 
	#(
		.NUM_BITS(64),
		.SHIFT_MSB(1)
	)
	COREd(
		.clk(clk),
		.n_rst(n_rst),
		.parallel_in(tx_data),
		.shift_enable(falling_edge_found & tx_enable),
		.load_enable(load_data),
		.serial_out(tx_out)
	);

endmodule
