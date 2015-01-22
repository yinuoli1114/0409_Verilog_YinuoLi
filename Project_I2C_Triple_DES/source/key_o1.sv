// $Id: mg116$
// File name:   key_o1.sv
// Created:     12/4/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Key original 1 block

module key_o1 (
	input wire [63:0] key_in,
	input wire enable,
	output wire [63:0] key_out
);

reg [63:0] key;

always_comb begin
	if(enable == 1'b1) begin
		key = key_in;
	end else begin
		key = key;
	end
	/*
	default:begin
	key = '0;
	end*/
end

assign key_out = key;

endmodule
