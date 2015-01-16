// $Id: $
// File name:   des2.sv
// Created:     11/30/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: second des wrapper file
module des2(
	input wire clk,
	input wire n_rst,
	input wire [63:0] data_in,
	input wire ready,
	input wire ed_sel,
	output wire [63:0] data_out,
	output wire next_data
	);

 	reg [2:0] io_sel;
 	reg [31:0] pertoio_data_out_left;
 	reg [31:0] descontoio_data_out_right;
 	reg [63:0] iotodescon_data;
 	reg rctodescon_round;
 	reg clear;
 	reg perm_en;
 	reg [31:0] descontoper_data_xor_left;
 	reg [47:0] extoxor_data;
 	reg [47:0] round_key;
 	reg [47:0] xortosub_data;
 	reg pertorc_done;
 	reg descontorc_start;
 	reg [4:0] count_out;
 	reg [31:0] subtoper_data;


	des_io_select DES_IO_SELECT(
		.clk(clk),
		.io_sel(io_sel),
		.ext_in(data_in),
		.data_out_left(pertoio_data_out_left),
		.data_out_right(descontoio_data_out_right),
		.data_to_controller(iotodescon_data),
		.ext_out(data_out)
		);
	des_controller DES_CONTROLLER(
		.clk(clk),
		.n_rst(n_rst),
		.data_in(iotodescon_data),
		.round_cnt(rctodescon_round),
		.data_ready(ready),
		.io_select(io_sel),
		.clear_data(clear),
		.permutation_enable(perm_en),
		.data_right(descontoio_data_out_right),
		.data_left(descontoper_data_xor_left),
		.next_data(next_data),
		.round_start(descontorc_start)
		);
	expansion EXPANSION(
		.data_in(descontoio_data_out_right),
		.data_out(extoxor_data)
		);
	key_xor KEY_XOR(
		.data(extoxor_data),
		.key(round_key),
		.out(xortosub_data)
		);
	key_wrapper2 KEY_WRAPPER2(
		.clk(clk),
		.n_rst(n_rst),
		.clear(clear),
		.done(pertorc_done),
		.start(descontorc_start),
		.ed_sel(ed_sel),
		.kout(round_key),
		.count_out(count_out),
		.rollover_flag(rctodescon_round)
		);
	substitution SUBSTITUTION(
		.data_in(xortosub_data),
		.dout(subtoper_data)
		);
	permutation PERMUTATION(
		.clk(clk),
		.data_in(subtoper_data),
		.data_left(descontoper_data_xor_left),
		.perm_en(perm_en),
		.data_out(pertoio_data_out_left),
		.round_done(pertorc_done)
		);
	endmodule
