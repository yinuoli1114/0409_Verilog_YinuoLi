// $Id: mg116$
// File name:   addr_gen.sv
// Created:     12/9/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: address generator

module addr_gen
(
	input wire clk,
	input wire n_rst,
	input wire enable,
	input wire rw_mode,
	output wire [15:0] address,
	output wire write_en,
	output wire read_en
);

typedef enum bit [3:0] {idle, inc, dec, fin} state_type;
state_type state, nstate;
reg [2:0] cnt_c;
reg [2:0] cnt_n;
reg [15:0] addr_n;
reg [15:0] addr_c;
reg r_en_n;
reg r_en_c;
reg w_en_n;
reg w_en_c;

assign address = addr_c;
assign read_en = r_en_c;
assign write_en = w_en_c;

always_ff @ (posedge clk, negedge n_rst) begin
	if(!n_rst) begin
		state <= idle;
		cnt_c <= 3'b000;
		addr_c <= 16'h0000;
		r_en_c <= 1'b0;
		w_en_c <= 1'b0;
	end else begin
		state <= nstate;
		cnt_c <= cnt_n;
		addr_c <= addr_n;
		r_en_c <= r_en_n;
		w_en_c <= w_en_n;
	end
end

always_comb begin
	case(state)
		idle: begin
			cnt_n = cnt_c;
			addr_n = addr_c;
			r_en_n = r_en_c;
			w_en_n = w_en_c;
			if(enable & !rw_mode) begin
				nstate = inc;
			end else if(enable & rw_mode) begin
				nstate = dec;
			end else begin
				nstate = idle;
			end
		end
		
		inc: begin
			cnt_n = cnt_c + 1;
			addr_n = addr_c + 1;
			r_en_n = 1'b0;
			w_en_n = 1'b1;
			if(cnt_c != 3'b111) begin
				nstate = inc;
			end else begin
				nstate = fin;
			end
		end
		
		dec: begin
			cnt_n = cnt_c + 1;
			addr_n = addr_c - 1;
			r_en_n = 1'b1;
			w_en_n = 1'b0;
			if(cnt_c != 3'b111) begin
				nstate = dec;
			end else begin
				nstate = fin;
			end
		end
		
		fin: begin
			cnt_n = 1'b0;
			addr_n = addr_n;
			r_en_n = 1'b0;
			w_en_n = 1'b0;
			nstate = idle;
		end

		default: begin
			cnt_n = 1'b0;
			addr_n = 16'h0000;
			r_en_n = 1'b0;
			w_en_n = 1'b0;
			nstate = idle;
		end
	endcase
end

endmodule
