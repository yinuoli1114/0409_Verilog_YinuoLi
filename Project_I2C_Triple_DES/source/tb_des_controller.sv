// $Id: mg116$
// File name:   tb_des_controller.sv
// Created:     11/19/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Testbench for DES controller

`timescale 1ns / 10ps

module tb_des_controller();

	// Define parameters
	parameter CLK_PERIOD = 5;
	
	reg clk;
	reg n_rst;
	reg [63:0] data_in;
	reg data_ready;
	reg [1:0] io_select;
	reg clear_data;
	reg round_done;
	reg [31:0] data_right;
	reg [31:0] data_left;
	reg next_data;
	reg round_start;
	reg [4:0] round;

	des_controller DUT
	(
		.clk(clk),
		.n_rst(n_rst),
		.data_in(data_in),
		.data_ready(data_ready),
		.io_select(io_select),
		.clear_data(clear_data),
		.round_complete(round_done),
		.data_right(data_right),
		.data_left(data_left),
		.next_data(next_data),
		.round_start(round_start),
		.round(round)
	);

	always
	begin : CLK_GEN
		clk = 1'b0;
		#(CLK_PERIOD / 2);
		clk = 1'b1;
		#(CLK_PERIOD / 2);
	end
	
	initial begin
		n_rst = 1'b0;
		@(posedge clk);
		n_rst = 1'b1;
		data_in = 64'h1234567890abcdef;
		data_ready = 1'b1;
		#(CLK_PERIOD*20);
	end
endmodule
		
