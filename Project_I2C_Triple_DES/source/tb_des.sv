// $Id: mg 116$
// File name:   tb_des.sv
// Created:     11/29/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: test bench of top level des

`timescale 1ns / 10ps

module tb_des();

	// Define parameters
	parameter CLK_PERIOD = 7;
	
	reg tb_clk;
	reg tb_n_rst;
	reg [63:0] tb_data_in = 64'h1234567890abcdef;
	reg tb_ready;
	reg [63:0] tb_data_out;
	reg [63:0] tb_key_in = 64'h3b3898371520f75e;
	reg tb_ed_sel;
	reg tb_next_data;

	des DUT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.data_in(tb_data_in),
		.ready(tb_ready),
		.rw_mode(tb_ed_sel),
		.key_in(tb_key_in),
		.data_out(tb_data_out),
		.next_data(tb_next_data)
	);

	always
	begin : CLK_GEN
		tb_clk = 1'b0;
		#(CLK_PERIOD / 2);
		tb_clk = 1'b1;
		#(CLK_PERIOD / 2);
	end
	
	initial
	begin
		@(negedge tb_clk);
		tb_n_rst = 1'b0;
		@(negedge tb_clk);
		tb_n_rst = 1'b1;

		tb_ed_sel = 1'b0;
		tb_ready = 1'b1;
		while(tb_next_data != 1'b1) begin
			#(CLK_PERIOD);
		end
		tb_ready = 1'b0;
		tb_data_in = tb_data_out;
		tb_ed_sel = 1'b1;
		@(posedge tb_clk);
		tb_ready = 1'b1;
		while(tb_next_data != 1'b1) begin
			#(CLK_PERIOD);
		end
	end
		
endmodule
