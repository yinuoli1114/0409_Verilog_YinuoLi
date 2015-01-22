// $Id: mg116 $
// File name:   tb_input_byte.sv
// Created:     12/11/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: test bench for input byte
`timescale 1 ns / 10 ps
module tb_input_byte();
	parameter CLK_PERIOD = 7;
	reg clk;
	reg nrst;
	reg dir_sel;
	reg [7:0] from_sram;
	reg [7:0] from_i2c;
	reg read_enable;
	reg [63:0] output_data;
	reg data_ready;

	reg [63:0] i2c;
	reg [63:0] sram;
	integer i;

	input_byte DUT (
		.clk(clk),
		.nrst(nrst),
		.dir_sel(dir_sel),
		.from_sram(from_sram),
		.from_i2c(from_i2c),
		.read_enable(read_enable),
		.output_data(output_data),
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
		nrst = 1'b0;
		@(posedge clk);
		nrst = 1'b1;
		i2c = 64'h1234567890abcdef;
		sram = 64'h12347890abcd56ef;
		read_enable = 1'b0;
		dir_sel = 1'b0;
		
		for(i = 0; i < 8; i++) begin
			@(posedge clk);
			from_i2c = i2c[63:56];
			read_enable = 1'b1;
			@(posedge clk);
			i2c = i2c <<8;
			read_enable = 1'b0;
		end
		
		@(posedge clk);
		dir_sel = 1'b1;
		
		for(i = 0; i < 8; i++) begin
			@(posedge clk);
			from_sram= sram[63:56];
			read_enable = 1'b1;
			@(posedge clk);
			sram = sram << 8;
			read_enable = 1'b0;
		end
	end
endmodule
		
	
