// $Id: $
// File name:   counter_wrapper.sv
// Created:     12/1/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: wrapper for fex_counter and sync
module counter_wrapper(
	input wire clk,
	input wire n_rst,
	input wire clear,
	input wire count_enable,
	input wire [3:0] rollover_val,
	output wire [3:0] count_out,
	output wire rollover_flag
	);

	reg [3:0] count;

	flex_counter FLEX_COUNTER(
		.clk(clk),
		.n_rst(n_rst),
		.clear(clear),
		.count_enable(count_enable),
		.rollover_val(rollover_val),
		.count_out(count),
		.rollover_flag(rollover_flag)
		);
	sync SYNC(
		.clk(clk),
		.n_rst(n_rst),
		.async_in(count),
		.sync_out(count_out)
		);
	endmodule