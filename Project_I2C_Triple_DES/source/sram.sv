// $Id: $
// File name:   sram.sv
// Created:     12/11/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: sram
module sram
(
	input wire clk,
	input wire n_rst,
	input wire read_enable,
	input wire write_enable,
	input wire [15:0] address,
	input wire [7:0] write_data,
	output wire [7:0] read_data
	);

	reg [63:0] sram = 64'h0000000000000000;
	reg [7:0] read_data_r;
	reg [7:0] write_data_r;
	assign read_data = read_data_r;

	always_comb
	begin
		if(address == 16'h0001 && write_enable == 1'b1) begin
		sram[63:0] = {sram[63:8],write_data};
		end else if (address == 16'h0002 && write_enable == 1'b1)begin
		sram[63:0] = {sram[63:16],write_data,sram[7:0]};
		end else if (address == 16'h003 && write_enable == 1'b1)begin
		sram[63:0] = {sram[63:24],write_data,sram[15:0]};
		end else if (address == 16'h004 && write_enable == 1'b1)begin
		sram[63:0] = {sram[63:32],write_data,sram[23:0]};
		end else if (address == 16'h005 && write_enable == 1'b1)begin
		sram[63:0] = {sram[63:40],write_data,sram[31:0]};
		end else if (address == 16'h006 && write_enable == 1'b1)begin
		sram[63:0] = {sram[63:48],write_data,sram[39:0]};
		end else if (address == 16'h007 && write_enable == 1'b1)begin
		sram[63:0] = {sram[63:56],write_data,sram[47:0]};
		end else if (address == 16'h008 && write_enable == 1'b1)begin
		sram[63:0] = {write_data,sram[55:0]};
		end else if(address == 16'h001 && read_enable == 1'b1)begin
		read_data_r = sram[7:0];
		end else if(address == 16'h002 && read_enable == 1'b1)begin
		read_data_r = sram[15:8];
		end else if(address == 16'h003 && read_enable == 1'b1) begin
		read_data_r = sram[23:16];
		end else if(address == 16'h004 && read_enable == 1'b1) begin
		read_data_r = sram[31:24];
		end else if(address == 16'h005 && read_enable == 1'b1) begin
		read_data_r = sram[39:32];
		end else if(address == 16'h006 && read_enable == 1'b1) begin
		read_data_r = sram[47:40];
		end else if(address == 16'h007 && read_enable == 1'b1) begin
		read_data_r = sram[55:48];
		end else if(address == 16'h008 && read_enable == 1'b1) begin
		read_data_r = sram[63:56];
		end
	end


endmodule


