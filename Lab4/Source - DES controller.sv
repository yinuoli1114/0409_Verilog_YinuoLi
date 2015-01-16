// $Id: mg116$
// File name:   des_controller.sv
// Created:     10/30/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: The controller for each DES block, this controller willl keep track of the current round of encryption/decryption, and produce signals base on the round. As well as controlling the direction of input/output.

module des_controller
(
	input wire clk,
	input wire n_rst,
	input wire [63:0] data_in,
	input wire round_cnt,
	input wire data_ready,
	output wire [1:0] io_select,
	output wire clear_data,
	output wire expansion_enable,
	output wire key_xor_enable,
	output wire substitution_enable,
	output wire permutation_enable,
	output wire [31:0] data_right,
	output wire [31:0] data_left
);

typedef enum bit [3:0] {idle, in_data, expand_step, xor_step, sub_step, perm_step, round_done, clear_round, out_data, repeat_round} state_type;
state_type state, nstate;
reg io_sel, clear, expand_en, xor_en, sub_en,perm_en;

assign data_right = data_in[31:0];
assign data_left = data_in[63:32];
assign io_select = io_sel;
assign clear_data = clear;
assign expansion_enable = expand_en;
assign key_xor_enable = xor_en;
assign substitution_enable = sub_en;
assign permutation_enable = perm_en;

always_ff @ (posedge clk, negedge n_rst) begin: state_reg
	if(!n_rst) begin
		state <= idle;
	end else begin
		state <= nstate;
	end
end

always_comb begin: nstate_logic
	case(state)
		idle: begin
			io_sel = 2'b11;
			clear = 1'b0;
			expand_en = 1'b0;
			xor_en = 1'b0;
			sub_en = 1'b0;
			perm_en = 1'b0;
			if(data_ready) begin
				nstate = in_data;
			end else begin
				nstate = idle;
			end
		end // end of the idle
		in_data: begin
			io_sel = 2'b00;
			clear = 1'b0;
			expand_en = 1'b0;
			xor_en = 1'b0;
			sub_en = 1'b0;
			perm_en = 1'b0;
			nstate = expand_step;
		end // end of the input
		expand_step: begin
			io_sel = 2'b11;
			clear = 1'b0;
			expand_en = 1'b1;
			xor_en = 1'b0;
			sub_en = 1'b0;
			perm_en = 1'b0;
			nstate = xor_step;
		end // end of the expand
		xor_step: begin
			io_sel = 2'b11;
			clear = 1'b0;
			expand_en = 1'b0;
			xor_en = 1'b1;
			sub_en = 1'b0;
			perm_en = 1'b0;
			nstate = sub_step;
		end // end of the xor
		sub_step: begin
			io_sel = 2'b11;
			clear = 1'b0;
			expand_en = 1'b0;
			xor_en = 1'b0;
			sub_en = 1'b1;
			perm_en = 1'b0;
			nstate = perm_step;
		end // end of the sub
		perm_step: begin
			io_sel = 2'b11;
			clear = 1'b0;
			expand_en = 1'b0;
			xor_en = 1'b0;
			sub_en = 1'b0;
			perm_en = 1'b1;
			nstate = round_done;
		end // end of the perm
		round_done: begin
			io_sel = 2'b11;
			clear = 1'b0;
			expand_en = 1'b0;
			xor_en = 1'b0;
			sub_en = 1'b0;
			perm_en = 1'b0;
			if(round_cnt) begin
				nstate = clear_round;
			end else begin
				nstate = repeat_round;
			end
		end // end of the round
		clear_round: begin
			io_sel = 2'b11;
			clear = 1'b1;
			expand_en = 1'b0;
			xor_en = 1'b0;
			sub_en = 1'b0;
			perm_en = 1'b0;
			nstate = out_data;
		end // end of the clear
		out_data: begin
			io_sel = 2'b10;
			clear = 1'b0;
			expand_en = 1'b0;
			xor_en = 1'b0;
			sub_en = 1'b0;
			perm_en = 1'b0;
			nstate = idle;
		end // end of the out
		repeat_round: begin
			io_sel = 2'b01;
			clear = 1'b0;
			expand_en = 1'b0;
			xor_en = 1'b0;
			sub_en = 1'b0;
			perm_en = 1'b0;
			if(data_ready) begin
				nstate = expand_step;
			end else begin
				nstate = repeat_round;
			end
		end // end of the repeat
		default: begin
			io_sel = 1'b0;
			clear = 1'b0;
			expand_en = 1'b0;
			xor_en = 1'b0;
			sub_en = 1'b0;
			perm_en = 1'b0;
		end // end of the default
	endcase // end of case
end // end of the logic block

endmodule
	
