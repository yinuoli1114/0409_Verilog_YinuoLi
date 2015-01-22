// $Id: mg116 $
// File name:   tb_main_sram.sv
// Created:     12/10/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: testbench for main controlling successfully controlling the signals going out and sram enables/address

`timescale 1 ns / 10 ps

module tb_main_sram ();
	parameter CLK_PERIOD = 7;
	reg clk;
	reg n_rst;
	reg i2c_stop;
	reg i2c_rw;
	reg data_ready;
	reg next_data;
	reg des_ready;
	reg key1_act;
	reg key2_act;
	reg dir_sel;
	reg output_load_enable;
	reg write_enable;
	reg read_enable;
	reg [15:0] address;

	main_sram DUT (
		.clk(clk),
		.n_rst(n_rst),
		.i2c_stop(i2c_stop),
		.i2c_rw(i2c_rw),
		.data_ready(data_ready),
		.next_data(next_data),
		.des_ready(des_ready),
		.key1_act(key1_act),
		.key2_act(key2_act),
		.dir_sel(dir_sel),
		.output_load_enable(output_load_enable),
		.write_enable(write_enable),
		.read_enable(read_enable),
		.address(address)
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
		n_rst = 1'b0;
		i2c_rw = 1'b0;
		data_ready = 1'b0;
		next_data = 1'b0;
		i2c_stop = 1'b0;
		@(posedge clk);
		n_rst = 1'b1;
		// key 1
		@(posedge clk);
		data_ready = 1'b1;
		@(posedge clk);
		data_ready = 1'b0;
		#(CLK_PERIOD);
		// key 2
		@(posedge clk);
		data_ready = 1'b1;
		@(posedge clk);
		data_ready = 1'b0;
		#(CLK_PERIOD);
		// take data
		@(posedge clk);
		data_ready = 1'b1;
		@(posedge clk);
		data_ready = 1'b0;
		#(CLK_PERIOD);
		// encrypt
		@(posedge clk);
		next_data = 1'b1;
		@(posedge clk);
		next_data = 1'b0;
		i2c_stop = 1'b1;
		// write
		#(CLK_PERIOD*3);
		// idle
		i2c_stop = 1'b0;
		i2c_rw = 1'b1;	
		// key 1
		@(posedge clk);
		data_ready = 1'b1;
		@(posedge clk);
		data_ready = 1'b0;
		#(CLK_PERIOD);
		// key 2
		@(posedge clk);
		data_ready = 1'b1;
		@(posedge clk);
		data_ready = 1'b0;
		#(CLK_PERIOD);
		// take data
		@(posedge clk);
		data_ready = 1'b1;
		@(posedge clk);
		data_ready = 1'b0;
		#(CLK_PERIOD);
		// encrypt
		@(posedge clk);
		next_data = 1'b1;
		@(posedge clk);
		next_data = 1'b0;
		i2c_stop = 1'b1;
	end
endmodule
