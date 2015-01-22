// $Id: mg116$
// File name:   round_counter.sv
// Created:     12/1/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Round counter

module round_counter (
	input wire clk,
	input wire n_rst,
	input wire round_inc,
	input wire round_input,
	output wire [3:0] round_number,
	output wire cycle_complete
);

reg [3:0] rc = 4'b0000;
reg [3:0] rn = 4'b0000;

assign round_number[3] = rc[3]^(rc[2]&rc[1]&rc[0]);
assign round_number[2] = rc[2]^(rc[1]&rc[0]);
assign round_number[1] = rc[1]^rc[0];
assign round_number[0] = rc[0]^1'b1;

assign cycle_complete = (rn == 4'b1111)? 1'b1 : 1'b0;

always_ff @ (posedge clk, negedge n_rst) begin
	if(!n_rst) begin
		rc = 4'b0000;
	end else begin
		if(round_inc) begin
			rc = round_input;
		end else begin
			rc = rc;
		end
	end
end

endmodule
