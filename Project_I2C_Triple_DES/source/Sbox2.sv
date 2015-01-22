// $Id: mg116$
// File name:   Sbox2.sv
// Created:     11/9/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Substitute box 2

module Sbox2
(
	input wire [5:0] data_in,
	output wire [3:0] data_out
);

reg [3:0] dout;

assign data_out = dout;

always @ (data_in) begin
	case({data_in[5],data_in[0],data_in[4:1]})
		0: dout = 15;
		1: dout = 1;
		2: dout = 8;
		3: dout = 14;
		4: dout = 6;
		5: dout = 11;
		6: dout = 3;
		7: dout = 4;
		8: dout = 9;
		9: dout = 7;
		10: dout = 2;
		11: dout = 13;
		12: dout = 12;
		13: dout = 0;
		14: dout = 5;
		15: dout = 10;

		16: dout = 3;
		17: dout = 13;
		18: dout = 4;
		19: dout = 7;
		20: dout = 15;
		21: dout = 2;
		22: dout = 8;
		23: dout = 14;
		24: dout = 12;
		25: dout = 0;
		26: dout = 1;
		27: dout = 10;
		28: dout = 6;
		29: dout = 9;
		30: dout = 11;
		31: dout = 5;

		32: dout = 0;
		33: dout = 14;
		34: dout = 7;
		35: dout = 11;
		36: dout = 10;
		37: dout = 4;
		38: dout = 13;
		39: dout = 1;
		40: dout = 5;
		41: dout = 8;
		42: dout = 12;
		43: dout = 6;
		44: dout = 9;
		45: dout = 3;
		46: dout = 2;
		47: dout = 15;

		48: dout = 13;
		49: dout = 8;
		50: dout = 10;
		51: dout = 1;
		52: dout = 3;
		53: dout = 15;
		54: dout = 4;
		55: dout = 2;
		56: dout = 11;
		57: dout = 6;
		58: dout = 7;
		59: dout = 12;
		60: dout = 0;
		61: dout = 5;
		62: dout = 14;
		63: dout = 9;
	endcase
end

endmodule
