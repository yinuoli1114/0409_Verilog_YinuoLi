// $Id: $
// File name:   maindes_wrapper.sv
// Created:     12/9/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: wrapper file for main controller and triple des
module maindes_wrapper(
	input wire clk,
	input wire n_rst,
	input wire i2c_stop,
	input wire i2c_rw,
	input wire data_ready,
	input wire [63:0] key1,
	input wire [63:0] key2,
	output wire [15:0] address,
	output wire read_en,
	output wire write_en,
	output wire [63:0] des_out,
	input wire [63:0] des_in
	);
	
	reg matotri_ready;
	reg tritoma_next;
	reg ag;
	reg io_sel;
	reg key1_en, key2_en;
	reg [63:0] key_o1, key_o2;

	main_controller MAIN_CONTROLLER(
		.clk(clk),
		.n_rst(n_rst),
		.i2c_stop(i2c_stop),
		.i2c_rw(i2c_rw),
		.data_ready(data_ready),
		.next_data(tritoma_next),
		.des_ready(matotri_ready),
		.dir_io_sel(io_sel),
		.ag_enable(ag),
		.key_activate_key1(key1_en),
		.key_activate_key2(key2_en)
	);
	triple_des TRIPLE_DES(
		.clk(clk),
		.n_rst(n_rst),
		.key1(key_o1),
		.key2(key_o2),
		.input_triple(des_in),
		.output_triple(des_out),
		.ed_sel(io_sel),
		.ready(matotri_ready),
		.next(tritoma_next)
	);
	addr_gen ADDR_GEN(
		.clk(clk),
		.n_rst(n_rst),
		.enable(ag),
		.rw_mode(io_sel),
		.address(address),
		.write_en(write_en),
		.read_en(read_en)
	);
	key_o1 K1 (
		.key_in(key1),
		.enable(key1_en),
		.key_out(key_o1)
	);
	key_o2 K2 (
		.key_in(key2),
		.enable(key2_en),
		.key_out(key_o2)
	);
	endmodule
	




