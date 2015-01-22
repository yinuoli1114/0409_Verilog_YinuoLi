// $Id: mg116 $
// File name:   main_sram.sv
// Created:     12/10/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: wrapping main controller, address generator to demonstrate the communications between blocks and sram

module main_sram (
	input wire clk,
	input wire n_rst,
	input wire i2c_stop,
	input wire i2c_rw,
	input wire data_ready,
	input wire next_data,
	output wire des_ready,
	output wire key1_act,
	output wire key2_act,
	output wire dir_sel,
	output wire output_load_enable,
	output wire write_enable,
	output wire read_enable,
	output wire [15:0] address
);

reg ag;

main_controller MAIN (
	.clk(clk),
	.n_rst(n_rst),
	.i2c_stop(i2c_stop),
	.i2c_rw(i2c_rw),
	.data_ready(data_ready),
	.next_data(next_data),
	.des_ready(des_ready),
	.key_activate_key2(key2_act),
	.key_activate_key1(key1_act),
	.dir_io_sel(dir_sel),
	.output_load_enable(output_load_enable),
	.ag_enable(ag)
);

addr_gen ADDR (
	.clk(clk),
	.n_rst(n_rst),
	.enable(ag),
	.rw_mode(dir_sel),
	.address(address),
	.write_en(write_enable),
	.read_en(read_enable)
);

endmodule
