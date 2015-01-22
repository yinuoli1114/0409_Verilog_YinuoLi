// $Id: $
// File name:   key_wrapper.sv
// Created:     11/20/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: wrapper file for key_original, key_permutation1, key_shift, key_permutation2, round_counter

module key_wrapper(
	input wire [63:0] key_in,
	input wire [4:0] round_number,
	output wire [47:0] kout
);
	
reg [55:0] k_p1toshift;
reg [55:0] k_shifttop2;
//wire [4:0] count_out;
//wire [47:0] k_p2toxor;

key_permutation1 KEY_PREMUTATION1(
	.k_o(key_in),
	.kout(k_p1toshift)
);
key_shift KEY_SHIFT(
	.kin(k_p1toshift),
	.k_out(k_shifttop2),
	.roundSel(round_number)
);
key_permutation2 KEY_PERMUTATION2(
	.kin(k_shifttop2),
	.kout(kout)
);

endmodule
