// $Id: $
// File name:   key_o2.sv
// Created:     12/4/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: key original 2 block

module key_o2 (
	input wire [63:0] key_in,
	input wire enable,
	output wire [63:0] key_out
);

reg [63:0] key;

always_comb begin
	if(enable == 1'b1) begin
		key = key_in;
	end else begin
		if(key_in[0] == 1'b1 || key_in[0] == 1'b0) begin
			key = key;
		end else begin
			key = 64'h00000000;
		end
	end
	/*
	default:begin
	key = '0;
	end*/

end

assign key_out = key;

endmodule
