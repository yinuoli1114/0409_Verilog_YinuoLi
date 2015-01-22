// $Id: mg116$
// File name:   Sbox8.sv
// Created:     11/9/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Substitute box 8

module Sbox8
(
	input wire [5:0] data_in,
	output wire [3:0] data_out
);

reg [3:0] dout;

assign data_out = dout;

always @ (data_in) begin
	case({data_in[5],data_in[0],data_in[4:1]})
		0: dout = 13;
		1: dout = 2;
		2: dout = 8;
		3: dout = 4;
		4: dout = 6;
		5: dout = 15;
		6: dout = 11;
		7: dout = 1;
		8: dout = 10;
		9: dout = 9;
		10: dout = 3;
		11: dout = 14;
		12: dout = 5;
		13: dout = 0;
		14: dout = 12;
		15: dout = 7;

		16: dout = 1;
		17: dout = 15;
		18: dout = 13;
		19: dout = 8;
		20: dout = 10;
		21: dout = 3;
		22: dout = 7;
		23: dout = 4;
		24: dout = 12;
		25: dout = 5;
		26: dout = 6;
		27: dout = 11;
		28: dout = 0;
		29: dout = 14;
		30: dout = 9;
		31: dout = 2;

		32: dout = 7;
		33: dout = 11;
		34: dout = 4;
		35: dout = 1;
		36: dout = 9;
		37: dout = 12;
		38: dout = 14;
		39: dout = 2;
		40: dout = 0;
		41: dout = 6;
		42: dout = 10;
		43: dout = 13;
		44: dout = 15;
		45: dout = 3;
		46: dout = 5;
		47: dout = 8;

		48: dout = 2;
		49: dout = 1;
		50: dout = 14;
		51: dout = 7;
		52: dout = 4;
		53: dout = 10;
		54: dout = 8;
		55: dout = 13;
		56: dout = 15;
		57: dout = 12;
		58: dout = 9;
		59: dout = 0;
		60: dout = 3;
		61: dout = 5;
		62: dout = 6;
		63: dout = 11;
	endcase
end

endmodule
