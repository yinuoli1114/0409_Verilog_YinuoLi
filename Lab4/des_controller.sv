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
	output wire [2:0] io_select,
	output wire clear_data,
	output wire permutation_enable,
	output wire [31:0] data_right,
	output wire [31:0] data_left,
	output wire next_data,
	output wire round_start
);

typedef enum bit [2:0] {idle, in_data, perm_step, round_done, out_data, repeat_round,finish} state_type;
state_type state, nstate;
reg [2:0] io_sel;
reg clear, perm_en, ndata, start;

assign data_right = data_in[31:0];
assign data_left = data_in[63:32];
assign io_select = io_sel;
assign clear_data = clear;
assign permutation_enable = perm_en;
assign next_data = ndata;
assign round_start = start;

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
			io_sel = 3'b011;
			clear = 1'b1;
			perm_en = 1'b0;
			ndata = 1'b0;
			start = 1'b0;
			if(data_ready) begin
				nstate = in_data;
			end else begin
				nstate = idle;
			end
		end // end of the idle
		in_data: begin
			io_sel = 3'b000;
			clear = 1'b0;
			perm_en = 1'b0;
			start = 1'b1;
			ndata = 1'b0;
			nstate = perm_step;
		end // end of the input
		perm_step: begin
			io_sel = 3'b011;
			clear = 1'b0;
			perm_en = 1'b1;
			start = 1'b0;
			ndata = 1'b0;
			nstate = round_done;
		end // end of the perm
		round_done: begin
			io_sel = 3'b001;
			clear = 1'b0;
			perm_en = 1'b0;
			start = 1'b0;
			ndata = 1'b0;
			if(round_cnt) begin
				nstate = out_data;
			end else begin
				nstate = repeat_round;
			end
		end // end of the round
		out_data: begin
			io_sel = 3'b010;
			clear = 1'b1;
			perm_en = 1'b0;
			start = 1'b0;
			ndata = 1'b1;
			nstate = finish;
		end // end of the out
		finish: begin
			io_sel = 3'b100;
			clear = 1'b1;
			perm_en = 1'b0;
			start = 1'b0;
			ndata = 1'b0;
			nstate = finish;
		end // end of the out
		repeat_round: begin
			io_sel = 3'b011;
			clear = 1'b0;
			perm_en = 1'b0;
			start = 1'b0;
			ndata = 1'b0;
			if(data_ready) begin
				nstate = perm_step;
			end else begin
				nstate = repeat_round;
			end
		end // end of the repeat
		default: begin
			io_sel = 3'b000;
			clear = 1'b0;
			perm_en = 1'b0;
			start = 1'b0;
			nstate = idle;
		end // end of the default
	endcase // end of case
end // end of the logic block

endmodule
	