// $Id: mg116$
// File name:   encryptor.sv
// Created:     12/8/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Top-level for the encryptor

module encryptor (
	input wire clk,				// general clock signal
	input wire n_rst,			// asynchronous reset
	input wire i2c_stop,			// stop signal from i2c controller	
	input wire i2c_rw,			// rw_mode signal from i2c controller
	input wire [7:0] i2c_input,		// data from i2c
	input wire read_enable,			// read enable from i2c to input accumulator
	output wire [63:0] i2c_output,		// output to i2c
	output wire output_ready		// output byte data is ready for i2c
);
	
	reg input_ready;		// input byte ready signal
	reg matotri_ready;		// main controller to triple des ready signal
	reg tritoma_next;		// triple des to main controller done signal
	reg ag;				// address generator enable
	reg io_sel;			// direction of input/output select signal
	reg key1_en, key2_en;		// key enable
	reg [63:0] key_o1, key_o2;	// registers to hold key
	reg out_en;			// output byte load enable
	reg [63:0] input_to_des;	// input byte to des data
	reg [63:0] des_to_output;	// des to output byte data
	reg [15:0] addr;		// address register from ag_gen to sram
	reg w_en, r_en;			// read and write enable from ag_gen to sram
	reg [7:0] sram_input;		// input from sram to input byte accumulator
	reg [7:0] sram_output;		// output from output byte distrubutor to sram

	main_controller MAIN_CONTROLLER(
		.clk(clk),
		.n_rst(n_rst),
		.i2c_stop(i2c_stop),
		.i2c_rw(i2c_rw),
		.data_ready(input_ready),
		.next_data(tritoma_next),
		.des_ready(matotri_ready),
		.dir_io_sel(io_sel),
		.ag_enable(ag),
		.output_load_enable(out_en),
		.key_activate_key1(key1_en),
		.key_activate_key2(key2_en)
	);
	triple_des TRIPLE_DES(
		.clk(clk),
		.n_rst(n_rst),
		.key1(key_o1),
		.key2(key_o2),
		.input_triple(input_to_des),
		.output_triple(des_to_output),
		.ed_sel(io_sel),
		.ready(matotri_ready),
		.next(tritoma_next)
	);
	key_o1 K1 (
		.key_in(input_to_des),
		.enable(key1_en),
		.key_out(key_o1)
	);
	key_o2 K2 (
		.key_in(input_to_des),
		.enable(key2_en),
		.key_out(key_o2)
	);
	input_byte ACCUMULATOR (
		.clk(clk),
		.nrst(n_rst),
		.dir_sel(io_sel),
		.from_sram(sram_input),
		.from_i2c(i2c_input),
		.read_enable(read_enable || r_en),
		.output_data(input_to_des),
		.data_ready(input_ready)
	);
	output_byte DISTRIBUTOR (
		.clk(clk),
		.n_rst(n_rst),
		.des_out(des_to_output),
		.load_enable(out_en),
		.rw(io_sel),
		.to_sram(sram_output),
		.to_i2c(i2c_output),
		.data_ready(output_ready)
	);
	addr_gen ADDR_GENERATOR (
		.clk(clk),
		.n_rst(n_rst),
		.enable(ag),
		.rw_mode(io_sel),
		.address(addr),
		.write_en(w_en),
		.read_en(r_en)
	);
	on_chip_sram_wrapper SRAM (
		.read_enable(r_en),
		.write_enable(w_en),
		.address(addr),
		.read_data(sram_input),
		.write_data(sram_output)
	);

endmodule
