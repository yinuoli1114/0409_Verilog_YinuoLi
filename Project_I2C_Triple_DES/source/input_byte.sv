// $Id: $
// File name:   input_byte.sv
// Created:     11/12/2014
// Author:      Ikeme Osi-Ogbu
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: input byte block
module input_byte
(
  input wire clk,
  input wire nrst,
  input wire dir_sel,
  input wire [7:0] from_sram,
  input wire [7:0] from_i2c,
  input wire read_enable,
  output wire [63:0] output_data,
  output wire data_ready
);

reg [3:0] cnt_c;
reg [3:0] cnt_n;
reg [63:0] curr;
reg [63:0] next;
reg [7:0] i2c;

assign output_data = curr;
assign data_ready = (cnt_c == 4'b1000)? 1:0;

always @ (posedge clk,negedge nrst) begin
	if (nrst == 0) begin
		curr <= '0;
		cnt_c <= '0;
	end else begin
		curr <= next;
		cnt_c <= cnt_n;
	end
end

always_comb begin
	if(read_enable) begin
		if(dir_sel) begin
			i2c = from_sram;
		end else begin
			i2c = from_i2c;
		end
		if(cnt_c == 4'b1000) begin
			cnt_n = '0;
			next = '0;
		end else begin
			cnt_n = cnt_c+1;
			next = {curr[56:0],i2c};
		end
	end else begin
		if(cnt_c == 4'b1000) begin
			cnt_n = '0;
			next = curr;
			i2c = i2c;
		end else begin
			i2c = i2c;
			cnt_n = cnt_c;
			next = curr;
		end
	end
end

endmodule


