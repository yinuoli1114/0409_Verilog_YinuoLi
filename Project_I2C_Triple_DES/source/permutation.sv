// $Id: mg116$
// File name:   permutation.sv
// Created:     10/30/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: This sub block of DES permutes the input with a pre-determined lookup table, and xor with the left side of the data

module permutation
(
	input wire [31:0] data_in,
	input wire [31:0] data_left,
	input wire [31:0] data_right,
	output wire [63:0] data_out
);

reg [31:0] outdata;

always_comb begin
		outdata[0] = data_in[15]^data_left[0];
		outdata[1] = data_in[6]^data_left[1];
		outdata[2] = data_in[19]^data_left[2];
		outdata[3] = data_in[20]^data_left[3];
		outdata[4] = data_in[28]^data_left[4];
		outdata[5] = data_in[11]^data_left[5];
		outdata[6] = data_in[27]^data_left[6];
		outdata[7] = data_in[16]^data_left[7];
		outdata[8] = data_in[0]^data_left[8];
		outdata[9] = data_in[14]^data_left[9];
		outdata[10] = data_in[22]^data_left[10];
		outdata[11] = data_in[25]^data_left[11];
		outdata[12] = data_in[4]^data_left[12];
		outdata[13] = data_in[17]^data_left[13];
		outdata[14] = data_in[30]^data_left[14];
		outdata[15] = data_in[9]^data_left[15];
		outdata[16] = data_in[1]^data_left[16];
		outdata[17] = data_in[7]^data_left[17];
		outdata[18] = data_in[23]^data_left[18];
		outdata[19] = data_in[13]^data_left[19];
		outdata[20] = data_in[31]^data_left[20];
		outdata[21] = data_in[26]^data_left[21];
		outdata[22] = data_in[2]^data_left[22];
		outdata[23] = data_in[8]^data_left[23];
		outdata[24] = data_in[18]^data_left[24];
		outdata[25] = data_in[12]^data_left[25];
		outdata[26] = data_in[29]^data_left[26];
		outdata[27] = data_in[5]^data_left[27];
		outdata[28] = data_in[21]^data_left[28];
		outdata[29] = data_in[10]^data_left[29];
		outdata[30] = data_in[3]^data_left[30];
		outdata[31] = data_in[24]^data_left[31];
end

assign data_out = {data_right, outdata};

endmodule


