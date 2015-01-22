// $Id: $
// File name:   des.sv
// Created:     11/29/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: wrapper file for des
module des(
	input wire clk,
	input wire n_rst,
	input wire [63:0] data_in,
	input wire [63:0] key_in,
	input wire ready,
	input wire rw_mode,
	output wire [63:0] data_out,
	output wire next_data
);

reg [1:0] io;
reg [63:0] internal_data;
reg [31:0] data_right;
reg [31:0] data_left;
reg [4:0] r_num;
reg [47:0] exp_to_key;
reg [47:0] rkey;
reg [47:0] key_to_sub;
reg [31:0] sub_to_perm;

des_io_select IOSELECT
(
	.clk(clk),
	.io_sel(io),
	.ext_in(data_in),
	.int_in(internal_data),
	.data_out_right(data_right),
	.data_out_left(data_left),
	.ext_out(data_out)
);

des_controller DESCONTROLLER
(
	.clk(clk),
	.n_rst(n_rst),
	.data_ready(ready),
	.rw_mode(rw_mode),
	.io_select(io),
	.next_data(next_data),
	.round_number(r_num)
);

expansion EXP
(
	.data_in(data_right),
	.data_out(exp_to_key)
);

key_wrapper KEY
(
	.key_in(key_in),
	.round_number(r_num),
	.kout(rkey)
);

key_xor KXOR
(
	.data(exp_to_key),
	.key(rkey),
	.out(key_to_sub)
);

substitution SUB
(
	.data_in(key_to_sub),
	.dout(sub_to_perm)
);

permutation PERM
(
	.data_in(sub_to_perm),
	.data_left(data_left),
	.data_right(data_right),
	.data_out(internal_data)
);


endmodule









