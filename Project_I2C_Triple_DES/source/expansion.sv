// $Id: mg116$
// File name:   expansion.sv
// Created:     10/30/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: This sub block of DES expands the 32 bit data to 48 bits.

module expansion
(
	input wire [31:0] data_in,
	output wire [47:0] data_out
);

assign data_out = {
			data_in[0],  data_in[31:28], data_in[27],
			data_in[28], data_in[27:24], data_in[23],
			data_in[24], data_in[23:20], data_in[19],
			data_in[20], data_in[19:16], data_in[15],
			data_in[16], data_in[15:12], data_in[11],
			data_in[12], data_in[11:8],  data_in[7],
			data_in[8],  data_in[7:4],   data_in[3],
			data_in[4],  data_in[3:0],   data_in[31]
		  };	
 
endmodule
