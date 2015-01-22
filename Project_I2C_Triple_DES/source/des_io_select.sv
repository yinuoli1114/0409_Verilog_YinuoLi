// $Id: $
// File name:   des_io_select.sv
// Created:     11/9/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: io select inside of DES, 00: idle; 01 : getting data from external data; 10: update the internal data; 11: output to the external

module des_io_select
(
	input wire clk,
	input wire [1:0] io_sel,
	input wire [63:0] ext_in,
	input wire [63:0] int_in,
	output wire [31:0] data_out_right,
	output wire [31:0] data_out_left,
	output wire [63:0] ext_out
);

reg [31:0] left_curr, left_next, right_curr, right_next;

always_ff @ (posedge clk) begin
	left_curr <= left_next;
	right_curr <= right_next;
end

assign data_out_right = right_curr;
assign data_out_left = left_curr;
assign ext_out = {right_curr,left_curr};
always_comb
begin
	case(io_sel)
		2'b00: begin // idle
			left_next = 0;
			right_next = 0;
		end
		2'b01: begin // external data
			left_next = ext_in[63:32];
			right_next = ext_in[31:0];
		end
		2'b10: begin // internal data
			left_next = int_in[63:32];
			right_next = int_in[31:0];
		end
		2'b11: begin // output
			left_next = left_curr;
			right_next = right_curr;
		end
		default: begin
		left_next = '0;
		right_next = '0;
		end
	endcase // case (io_sel)	
end
	
endmodule // des_io_select

	    
	  
   
