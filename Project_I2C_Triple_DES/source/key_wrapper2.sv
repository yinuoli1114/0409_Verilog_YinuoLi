// $Id: $
// File name:   key_wrapper2.sv
// Created:     11/30/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: second key wrapper file
module key_wrapper2(
	input wire [4:0] round_number,
	output wire [47:0] kout
);
	
reg [63:0] k_o;
reg [55:0] k_p1toshift;
reg [55:0] k_shifttop2;
//wire [4:0] count_out;
//wire [47:0] k_p2toxor;


key_original2 KEY_ORIGINAL(
	.k_o(k_o)
);
key_permutation1 KEY_PREMUTATION1(
	.k_o(k_o),
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
