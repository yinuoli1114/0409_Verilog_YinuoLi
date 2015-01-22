// $Id: $
// File name:   triple_des.sv
// Created:     11/30/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: wrapper file for triple des
module triple_des(
	input wire clk,
	input wire n_rst,
	input wire [63:0] key1,
	input wire [63:0] key2,
	input wire [63:0] input_triple,
	output reg [63:0] output_triple,
	input wire ed_sel,
	input wire ready,
	output wire next
);

	wire ready1to2;
	wire ready2to3;
	reg [63:0] d1tod2_data;
	reg [63:0] d2tod3_data;
	reg [63:0] d3out_data;

	assign output_triple = d3out_data;

	des DES1(
		.clk(clk),
		.n_rst(n_rst),
		.data_in(input_triple),
		.key_in(key1),
		.ready(ready),
		.rw_mode(ed_sel),
		.data_out(d1tod2_data),
		.next_data(ready1to2)
	);
	des DES2(
		.clk(clk),
		.n_rst(n_rst),
		.data_in(d1tod2_data),
		.key_in(key2),
		.ready(ready1to2),
		.rw_mode(!ed_sel),
		.data_out(d2tod3_data),
		.next_data(ready2to3)
	);
	des DES3(
		.clk(clk),
		.n_rst(n_rst),
		.data_in(d2tod3_data),
		.key_in(key1),
		.ready(ready2to3),
		.rw_mode(ed_sel),
		.data_out(d3out_data),
		.next_data(next)
	);
endmodule


