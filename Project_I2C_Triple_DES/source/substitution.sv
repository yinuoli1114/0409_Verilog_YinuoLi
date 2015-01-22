// $Id: mg116$
// File name:   substitution.sv
// Created:     11/9/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Top level block of substitution step, wrapping 8 sub blocks

module substitution
(
	input wire [47:0] data_in,
	output wire [31:0] dout
);

reg [3:0] dout1,dout2,dout3,dout4,dout5,dout6,dout7,dout8;

Sbox1 SB1
(
	.data_in(data_in[47:42]),
	.data_out(dout1)
);

Sbox2 SB2
(
	.data_in(data_in[41:36]),
	.data_out(dout2)
);

Sbox3 SB3
(
	.data_in(data_in[35:30]),
	.data_out(dout3)
);

Sbox4 SB4
(
	.data_in(data_in[29:24]),
	.data_out(dout4)
);

Sbox5 SB5
(
	.data_in(data_in[23:18]),
	.data_out(dout5)
);

Sbox6 SB6
(
	.data_in(data_in[17:12]),
	.data_out(dout6)
);

Sbox7 SB7
(
	.data_in(data_in[11:6]),
	.data_out(dout7)
);

Sbox8 SB8
(
	.data_in(data_in[5:0]),
	.data_out(dout8)
);

assign dout = {dout1,dout2,dout3,dout4,dout5,dout6,dout7,dout8};

endmodule
