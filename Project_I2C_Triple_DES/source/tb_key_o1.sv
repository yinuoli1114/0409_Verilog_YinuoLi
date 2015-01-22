// $Id: mg116$
// File name:   tb_key_o1.sv
// Created:     12/4/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: test bench for key1

`timescale 1ns / 10ps

module tb_key_o1();

	// Define parameters
	parameter CLK_PERIOD = 5;
	
	reg clk;
	reg [63:0] tb_key_in;
	reg [63:0] tb_key_out;
	reg tb_enable;

	integer tb_error;

	key_o1 DUT
	(
		.key_in(tb_key_in),
		.enable(tb_enable),
		.key_out(tb_key_out)
	);

	always
	begin : CLK_GEN
		clk = 1'b0;
		#(CLK_PERIOD / 2);
		clk = 1'b1;
		#(CLK_PERIOD / 2);
	end

	initial
	begin
		tb_key_in = 64'h3b3898371520f75e;
		@(posedge clk);
		tb_enable = 1'b1;
		@(posedge clk);
		tb_enable = 1'b0;
		#(CLK_PERIOD*10);
		tb_key_in = 64'h1234567890abcdef;
		@(posedge clk);
		tb_enable = 1'b1;
		@(posedge clk);
		tb_enable = 1'b0;
		#(CLK_PERIOD*10);
	end
endmodule

