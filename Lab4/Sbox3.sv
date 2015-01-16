// $Id: mg116$
// File name:   Sbox3.sv
// Created:     11/9/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Substitution box 3

module Sbox3
(
	input wire [5:0] data_in,
	output wire [3:0] data_out
);

reg [3:0] dout;

assign data_out = dout;

always @ (data_in) begin
	case({data_in[5],data_in[0],data_in[4:1]})
		0: dout = 10;
		1: dout = 0;
		2: dout = 9;
		3: dout = 14;
		4: dout = 6;
		5: dout = 3;
		6: dout = 15;
		7: dout = 5;
		8: dout = 1;
		9: dout = 13;
		10: dout = 12;
		11: dout = 7;
		12: dout = 11;
		13: dout = 4;
		14: dout = 2;
		15: dout = 8;

		16: dout = 13;
		17: dout = 7;
		18: dout = 0;
		19: dout = 9;
		20: dout = 3;
		21: dout = 4;
		22: dout = 6;
		23: dout = 10;
		24: dout = 2;
		25: dout = 8;
		26: dout = 5;
		27: dout = 14;
		28: dout = 12;
		29: dout = 11;
		30: dout = 15;
		31: dout = 1;

		32: dout = 13;
		33: dout = 6;
		34: dout = 4;
		35: dout = 9;
		36: dout = 8;
		37: dout = 15;
		38: dout = 3;
		39: dout = 0;
		40: dout = 11;
		41: dout = 1;
		42: dout = 2;
		43: dout = 12;
		44: dout = 5;
		45: dout = 10;
		46: dout = 14;
		47: dout = 7;

		48: dout = 1;
		49: dout = 10;
		50: dout = 13;
		51: dout = 0;
		52: dout = 6;
		53: dout = 9;
		54: dout = 8;
		55: dout = 7;
		56: dout = 4;
		57: dout = 15;
		58: dout = 14;
		59: dout = 3;
		60: dout = 11;
		61: dout = 5;
		62: dout = 2;
		63: dout = 12;
	endcase
end

endmodule
