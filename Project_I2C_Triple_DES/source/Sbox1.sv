// $Id: mg116$
// File name:   Sbox1.sv
// Created:     11/6/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Substitute box 1

module Sbox1
(
	input wire [5:0] data_in,
	output wire [3:0] data_out
);

reg [3:0] dout;

assign data_out = dout;

always @ (data_in) begin
	case({data_in[5],data_in[0],data_in[4:1]})
		0: dout = 14;
		1: dout = 4;
		2: dout = 13;
		3: dout = 1;
		4: dout = 2;
		5: dout = 15;
		6: dout = 11;
		7: dout = 8;
		8: dout = 3;
		9: dout = 10;
		10: dout = 6;
		11: dout = 12;
		12: dout = 5;
		13: dout = 9;
		14: dout = 0;
		15: dout = 7;

		16: dout = 0;
		17: dout = 15;
		18: dout = 7;
		19: dout = 4;
		20: dout = 14;
		21: dout = 2;
		22: dout = 13;
		23: dout = 1;
		24: dout = 10;
		25: dout = 6;
		26: dout = 12;
		27: dout = 11;
		28: dout = 9;
		29: dout = 5;
		30: dout = 3;
		31: dout = 8;

		32: dout = 4;
		33: dout = 1;
		34: dout = 14;
		35: dout = 8;
		36: dout = 13;
		37: dout = 6;
		38: dout = 2;
		39: dout = 11;
		40: dout = 15;
		41: dout = 12;
		42: dout = 9;
		43: dout = 7;
		44: dout = 3;
		45: dout = 10;
		46: dout = 5;
		47: dout = 0;

		48: dout = 15;
		49: dout = 12;
		50: dout = 8;
		51: dout = 2;
		52: dout = 4;
		53: dout = 9;
		54: dout = 1;
		55: dout = 7;
		56: dout = 5;
		57: dout = 11;
		58: dout = 3;
		59: dout = 14;
		60: dout = 10;
		61: dout = 0;
		62: dout = 6;
		63: dout = 13;
	endcase
end

endmodule
