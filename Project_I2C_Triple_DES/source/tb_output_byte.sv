// $Id: mg116$
// File name:   tb_output_byte.sv
// Created:     12/11/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: test bench for output byte

`timescale 1 ns / 10 ps
module tb_output_byte();
	parameter CLK_PERIOD = 7;

	reg clk;
	reg n_rst;
	reg load_enable;
	reg rw;
	reg [63:0] des_out;
	reg [7:0] to_sram;
	reg [63:0] to_i2c;
	reg data_ready;
	
	
	integer i;

	output_byte DUT (
		.clk(clk),
		.n_rst(n_rst),
		.rw(rw),
		.des_out(des_out),
		.to_sram(to_sram),
		.to_i2c(to_i2c),
		.load_enable(load_enable),
		.data_ready(data_ready)
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
		des_out = 64'h1234567890abcdef;
		n_rst = 1'b0;
		@(posedge clk);
		n_rst = 1'b1;

		rw = 1'b0;
		load_enable = 1'b1;
		@(posedge clk);
		load_enable = 1'b0;
		#(CLK_PERIOD*10);
		@(posedge clk);
		rw = 1'b1;
		load_enable = 1'b1;
		@(posedge clk);
		load_enable = 1'b0;
	end
endmodule
		
	
