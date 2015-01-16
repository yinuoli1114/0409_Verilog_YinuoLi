// $Id: mg116$
// File name:   substitution.sv
// Created:     11/9/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Top level block of substitution step, wrapping 8 sub blocks

module substitution
(
	input wire [0:47] data_in,
	input wire [0:31] data_out
);

reg [0:3] dout1,dout2,dout3,dout4,dout5,dout6,dout7,dout8;

Sbox1 SB1
(
	.data_in(data_in[0:5]),
	.data_out(dout1)
);

Sbox2 SB2
(
	.data_in(data_in[6:11]),
	.data_out(dout2)
);

Sbox3 SB3
(
	.data_in(data_in[12:17]),
	.data_out(dout3)
);

Sbox4 SB4
(
	.data_in(data_in[18:23]),
	.data_out(dout4)
);

Sbox5 SB5
(
	.data_in(data_in[24:29]),
	.data_out(dout5)
);

Sbox6 SB6
(
	.data_in(data_in[30:35]),
	.data_out(dout6)
);

Sbox7 SB7
(
	.data_in(data_in[36:41]),
	.data_out(dout7)
);

Sbox8 SB8
(
	.data_in(data_in[42:47]),
	.data_out(dout8)
);

assign data_out = {dout1,dout2,dout3,dout4,dout5,dout6,dout7,dout8};

endmodule
