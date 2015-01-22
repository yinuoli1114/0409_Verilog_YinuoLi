// $Id: mg116$
// File name:   tb_round_counter.sv
// Created:     12/1/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: testbench for round counter
`timescale 1ns / 10ps

module tb_round_counter ();
	
	parameter CLK_PERIOD = 5;	
	
	reg clk;
	reg round_inc;
	reg round_input;
	reg [3:0] round_number;
	reg cycle_complete;

	round_counter DUT 
	(
		.clk(clk),
		.n_rst(1'b1),
		.round_inc(round_inc),
		.round_input(round_number),
		.round_number(round_number),
		.cycle_complete(cycle_complete)
	);

	always
	begin : CLK_GEN
		clk = 1'b0;
		round_inc = 1'b0;
		#(CLK_PERIOD / 2);
		clk = 1'b1;
		round_inc = 1'b1;
		#(CLK_PERIOD / 2);
	end

	initial begin
		if(cycle_complete == 1'b1) begin
			$info("cycle complete");
		end
	end
endmodule
