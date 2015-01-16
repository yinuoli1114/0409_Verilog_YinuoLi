// $Id: $
// File name:   des_io_select.sv
// Created:     11/9/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: io select inside of DES

module des_io_select
(
	input wire clk,
	input wire [2:0] io_sel,
	input wire [63:0] ext_in,
	input wire [31:0] data_out_left,
	input wire [31:0] data_out_right,
	output wire [63:0] data_to_controller,
	output wire [63:0] ext_out
);

reg [31:0] data_left_curr, data_left_next, data_right_curr, data_right_next;
reg [31:0] data_left_r;

always_ff @ (posedge clk) begin
	data_left_curr <= data_left_next;
	data_right_curr <= data_right_next;
	data_left_r <= data_left_curr;
end
 
assign data_to_controller = {data_left_curr,data_right_curr};
//assign ext_out = (io_sel == 2'b10)? {data_right_curr,data_left_curr} : {data_left_curr,data_right_curr};
assign ext_out = (io_sel == 3'b010)? {data_right_curr,data_left_curr} : (io_sel == 3'b100)?{data_right_curr,data_left_r}:0;

always_comb
begin
//data_left_r = data_left_curr;
	case(io_sel)
		3'b000: begin // get input from external 
			data_left_next = ext_in[63:32];
			data_right_next = ext_in[31:0];
		end
		3'b001: begin // repeat the round, switching the inputs
			data_left_next = data_out_right;
			data_right_next = data_out_left;
		end
		3'b010: begin // output to external 
			data_left_next = data_out_left;
			data_right_next = data_out_right;
		end
		3'b011: begin // idle
			data_left_next = data_left_curr;
			data_right_next = data_right_curr;
		end
	endcase // case (io_sel)	
end
	
endmodule // des_io_select

	    
	  
   
