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
	input wire data_ready,
	input wire rw_mode,	//rw_mode = 1: decryption, 0: encryption
	output wire [1:0] io_select,
	output wire next_data,
	output wire [4:0] round_number
);

typedef enum bit [4:0] {idle, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, in_data, out_data} state_type;
state_type state, nstate;
reg [1:0] io_sel;
reg ndata;
reg [4:0] r;

assign io_select = io_sel;
assign next_data = ndata;
assign round_number = r;

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
			ndata = 1'b0;
			r = 5'b00000;
			if(data_ready == 1'b1) begin
				nstate = in_data;
			end else begin
				nstate = idle;
			end
		end // end of the idle
		r1: begin
			
			ndata = 1'b0;
			r = 5'b00001;
			io_sel = 2'b10;
			if(rw_mode == 1'b0) begin
				nstate = r2;
			end else begin
				nstate = out_data;
			end
		end
		r2: begin
			io_sel = 2'b10;
			ndata = 1'b0;
			r = 5'b00010;
			if(rw_mode == 1'b0) begin
				nstate = r3;
			end else begin
				nstate = r1;
			end
		end
		r3: begin
			io_sel = 2'b10;
			ndata = 1'b0;
			r = 5'b00011;
			if(rw_mode == 1'b0) begin
				nstate = r4;
			end else begin
				nstate = r2;
			end
		end
		r4: begin
			io_sel = 2'b10;
			ndata = 1'b0;
			r = 5'b00100;
			if(rw_mode == 1'b0) begin
				nstate = r5;
			end else begin
				nstate = r3;
			end
		end
		r5: begin
			io_sel = 2'b10;
			ndata = 1'b0;
			r = 5'b00101;
			if(rw_mode == 1'b0) begin
				nstate = r6;
			end else begin
				nstate = r4;
			end
		end
		r6: begin
			io_sel = 2'b10;
			ndata = 1'b0;
			r = 5'b00110;
			if(rw_mode == 1'b0) begin
				nstate = r7;
			end else begin
				nstate = r5;
			end
		end
		r7: begin
			io_sel = 2'b10;
			ndata = 1'b0;
			r = 5'b00111;
			if(rw_mode == 1'b0) begin
				nstate = r8;
			end else begin
				nstate = r6;
			end				
		end
		r8: begin
			io_sel = 2'b10;
			ndata = 1'b0;
			r = 5'b01000;
			if(rw_mode == 1'b0) begin
				nstate = r9;
			end else begin
				nstate = r7;
			end
		end
		r9: begin
			io_sel = 2'b10;
			ndata = 1'b0;
			r = 5'b01001;
			if(rw_mode == 1'b0) begin
				nstate = r10;
			end else begin
				nstate = r8;
			end
		end
		r10: begin
			io_sel = 2'b10;
			ndata = 1'b0;
			r = 5'b01010;
			if(rw_mode == 1'b0) begin
				nstate = r11;
			end else begin
				nstate = r9;
			end
		end
		r11: begin
			io_sel = 2'b10;
			ndata = 1'b0;
			r = 5'b01011;
			if(rw_mode == 1'b0) begin
				nstate = r12;
			end else begin
				nstate = r10;
			end
		end
		r12: begin
			io_sel = 2'b10;
			ndata = 1'b0;
			r = 5'b01100;
			if(rw_mode == 1'b0) begin
				nstate = r13;
			end else begin
				nstate = r11;
			end
		end
		r13: begin
			io_sel = 2'b10;
			ndata = 1'b0;
			r = 5'b01101;
			if(rw_mode == 1'b0) begin
				nstate = r14;
			end else begin
				nstate = r12;
			end
		end
		r14: begin
			io_sel = 2'b10;
			ndata = 1'b0;
			r = 5'b01110;
			if(rw_mode == 1'b0) begin
				nstate = r15;
			end else begin
				nstate = r13;
			end
		end
		r15: begin
			io_sel = 2'b10;
			ndata = 1'b0;
			r = 5'b01111;
			if(rw_mode == 1'b0) begin
				nstate = r16;
			end else begin
				nstate = r14;
			end
		end
		r16: begin
			ndata = 1'b0;
			r = 5'b10000;
			io_sel = 2'b10;
			if(rw_mode == 1'b0) begin
				nstate = out_data;
			end else begin
				nstate = r15;
			end
		end
		in_data: begin
			io_sel = 2'b01;
			ndata = 1'b0;
			r = 5'b00000;
			if(rw_mode == 1'b0) begin
				nstate = r1;
			end else begin
				nstate = r16;
			end
		end
		out_data: begin
			io_sel = 2'b11;
			ndata = 1'b1;
			r = 5'b00000;
			nstate = idle;
		end // end of the out
		default: begin
			io_sel = 2'b00;
			ndata = 1'b0;
			r = 5'b00000;
			nstate = idle;
		end // end of the default
	endcase // end of case
end // end of the logic block

endmodule
	
