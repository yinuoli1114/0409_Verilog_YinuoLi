// $Id: $
// File name:   ag_sram_wrapper.sv
// Created:     12/10/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: wrapper for ag and sram
// 
module ag_sram_wrapper(
	input wire clk,
	input wire n_rst,
	input wire enable,
	input wire rw_mode,
	input wire [7:0] write_data,
	output wire [7:0] read_data
	);
	
	reg [15:0] address;
	reg write_en;
	reg read_en;

	addr_gen ADDR_GRN(
		.clk(clk),
		.n_rst(n_rst),
		.enable(enable),
		.rw_mode(rw_mode),
		.address(address),
		.write_en(write_en),
		.read_en(read_en)
		);
	on_chip_sram_wrapper ON_CHIP_SRAM(
		.read_enable(read_en),
		.write_enable(write_en),
		.address(address),
		.read_data(read_data),
		.write_data(write_data)
		);
	endmodule
