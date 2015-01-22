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
	input wire sda_in,			
	input wire scl,
	output wire w_en,			// write_enable
	output wire r_en,			// read_enable
	output wire [15:0] addr,		// address to write/read in sram
	input wire [7:0] sram_input,		// data read from sram
	output wire [7:0] sram_output,		// data write to sram
	output wire sda_out
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
	reg i2c_stop;			// signal from i2c that master stops the transmission
	reg i2c_rw;			// signal from i2c of read/write mode
	reg [7:0] i2c_input;		// data from i2c
	reg read_enable;		// read enable from i2c to input accumulator	
	reg [63:0] i2c_output;			// output to i2c
	reg output_ready;		// output byte data is ready for i2c
	reg start;
	reg en_load;

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
		.key_activate_key2(key2_en),
		.output_ready(output_ready)
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
		.to_i2c(i2c_output)
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
	i2c I2C (
		.clk(clk),
		.n_rst(n_rst),
		.scl(scl),
		.sda_in(sda_in),
		.i2c_out(i2c_input),
		.stop(i2c_stop),
		.write_data(i2c_output),
		.sda_out(sda_out),
		.en_write_r(read_enable),
		.i2c_rw(i2c_rw),
		.start(start),
		.en_load(en_load),
		.data_ready(input_ready),
		.output_ready(output_ready)
	);

endmodule
