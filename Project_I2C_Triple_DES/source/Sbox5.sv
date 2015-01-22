// $Id: mg116$
// File name:   Sbox5.sv
// Created:     11/9/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Substitute box 5

module Sbox5
(
	input wire [5:0] data_in,
	output wire [3:0] data_out
);

reg [3:0] dout;

assign data_out = dout;

always @ (data_in) begin
	case({data_in[5],data_in[0],data_in[4:1]})
		0: dout = 2;
		1: dout = 12;
		2: dout = 4;
		3: dout = 1;
		4: dout = 7;
		5: dout = 10;
		6: dout = 11;
		7: dout = 6;
		8: dout = 8;
		9: dout = 5;
		10: dout = 3;
		11: dout = 15;
		12: dout = 13;
		13: dout = 0;
		14: dout = 14;
		15: dout = 9;

		16: dout = 14;
		17: dout = 11;
		18: dout = 2;
		19: dout = 12;
		20: dout = 4;
		21: dout = 7;
		22: dout = 13;
		23: dout = 1;
		24: dout = 5;
		25: dout = 0;
		26: dout = 15;
		27: dout = 10;
		28: dout = 3;
		29: dout = 9;
		30: dout = 8;
		31: dout = 6;

		32: dout = 4;
		33: dout = 2;
		34: dout = 1;
		35: dout = 11;
		36: dout = 10;
		37: dout = 13;
		38: dout = 7;
		39: dout = 8;
		40: dout = 15;
		41: dout = 9;
		42: dout = 12;
		43: dout = 5;
		44: dout = 6;
		45: dout = 3;
		46: dout = 0;
		47: dout = 14;

		48: dout = 11;
		49: dout = 8;
		50: dout = 12;
		51: dout = 7;
		52: dout = 1;
		53: dout = 14;
		54: dout = 2;
		55: dout = 13;
		56: dout = 6;
		57: dout = 15;
		58: dout = 0;
		59: dout = 9;
		60: dout = 10;
		61: dout = 4;
		62: dout = 5;
		63: dout = 3;
	endcase
end

endmodule
