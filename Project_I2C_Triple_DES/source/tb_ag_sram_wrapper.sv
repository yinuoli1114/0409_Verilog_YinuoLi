// $Id: $
// File name:   tb_ag_sram_wrapper.sv
// Created:     12/10/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: tb for ag and sram wrapper

`timescale 1ns / 10ps

module tb_ag_sram_wrapper();

	// Define parameters
	parameter CLK_PERIOD = 7;

	reg clk;
	reg n_rst;
	reg enable;
	reg rw_mode;
	reg [7:0] write_data;
	reg [7:0] read_data;

	
	ag_sram_wrapper AG_SRAM_WRAPPER(
		.clk(clk),
		.n_rst(n_rst),
		.enable(enable),
		.rw_mode(rw_mode),
		.write_data(write_data),
		.read_data(read_data)
		);
	always
	begin : CLK_GEN
		clk = 1'b0;
		#(CLK_PERIOD / 2);
		clk = 1'b1;
		#(CLK_PERIOD / 2);
	end
	
	initial
	begin
		@(negedge clk);
		n_rst = 1'b0;
		@(negedge clk);
		n_rst = 1'b1;

		@(posedge clk);
		rw_mode = 1'b0;
		enable = 1'b0;

		@(posedge clk);
		enable = 1'b1;

		@(posedge clk);
		rw_mode = 1'b0;
		enable = 1'b0;
		@(posedge clk);
		rw_mode = 1'b0;
		//enable = 1'b1;
		write_data = 8'h90;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b0;
		write_data = 8'h1a;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b0;
		write_data = 8'hed;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b0;
		write_data = 8'hf1;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b0;
		write_data = 8'h81;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b0;
		write_data = 8'hf8;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b0;

		write_data = 8'h68;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b0;
		write_data = 8'hb4;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b0;

		@(posedge clk);
		enable = 1'b0;
		#(CLK_PERIOD*5);

//#####################################

		@(posedge clk);
		enable = 1'b1;

		@(posedge clk);
		rw_mode = 1'b0;
		enable = 1'b0;
		@(posedge clk);
		rw_mode = 1'b0;
		//enable = 1'b1;
		write_data = 8'h12;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b0;
		write_data = 8'h34;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b0;
		write_data = 8'h56;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b0;
		write_data = 8'h78;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b0;
		write_data = 8'h9a;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b0;
		write_data = 8'hbc;
		@(posedge clk);
		//enable = 1'b1;

		write_data = 8'hed;
		@(posedge clk);
		enable = 1'b1;
		rw_mode = 1'b0;
		write_data = 8'hf0;
		@(posedge clk);
		enable = 1'b1;
		rw_mode = 1'b0;

		@(posedge clk);
		enable = 1'b0;
		//###############################################
		
		#(CLK_PERIOD*10);
		//write_data = 8'h12;
		@(posedge clk);
		enable = 1'b1;
		rw_mode = 1'b1;
		@(posedge clk);
		enable = 1'b0;
		rw_mode = 1'b1;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b1;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b1;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b1;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b1;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b1;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b1;
		#(CLK_PERIOD*6);
		//#############################################
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		enable = 1'b1;
		rw_mode = 1'b1;
		@(posedge clk);
		enable = 1'b0;
		rw_mode = 1'b1;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b1;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b1;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b1;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b1;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b1;
		@(posedge clk);
		//enable = 1'b1;
		rw_mode = 1'b1;
	
		end
endmodule


