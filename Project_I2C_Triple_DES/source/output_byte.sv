// $Id: $
// File name:   output_byte.sv
// Created:     11/30/2014
// Author:      Ikeme Osi-Ogbu
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: output byte block
module output_byte 
(
	input wire clk,
	input wire n_rst,
	input wire load_enable,
	input wire rw,
	input wire [63:0] des_out,
	output wire [7:0] to_sram,
	output wire [63:0] to_i2c
);
             
reg [63:0] curr;
reg [63:0] next;

assign to_i2c = (rw ==1)? des_out: des_out;
assign to_sram = (rw ==0)? curr[63:56]: '1;

always @ (posedge clk,negedge n_rst) begin
    if (n_rst == 0) begin
        curr <= '1;
    end else begin
    	curr <= next;
    end
end

always_comb begin
	if (load_enable) begin 
		next = des_out;
	end else  begin
		next = {curr[55:0],8'b11111111};     	     	
	end
end
endmodule 
