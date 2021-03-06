// $Id: mg116$
// File name:   tb_triple_des.sv
// Created:     11/30/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: test bench for triple des wrapper

`timescale 1ns / 10ps

module tb_triple_des();

	parameter CLK_PERIOD = 6;
	parameter CHECK_DELAY = 1;
	reg tb_clk;
	reg tb_n_rst;
	reg [63:0] tb_inputData;
	reg [63:0] tb_outputData;
	reg [63:0] tb_key1;
	reg [63:0] tb_key2;
	reg tb_ed_sel;
	reg tb_ready;
	//reg tb_ready2;
	//reg tb_ready3;
	reg tb_next;
	//reg tb_next2;
	//reg tb_next3;
	
	triple_des DUT (
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.key1(tb_key1),
		.key2(tb_key2),
		.input_triple(tb_inputData),
		.output_triple(tb_outputData),
		.ed_sel(tb_ed_sel),
		.ready(tb_ready),
		.next(tb_next)
	);
	
	always
	begin : CLK_GEN
		tb_clk = 1'b0;
		#(CLK_PERIOD / 2);
		tb_clk = 1'b1;
		#(CLK_PERIOD / 2);
	end

	initial 
	begin
		tb_n_rst = 1'b0;
		@(negedge tb_clk);
		tb_n_rst = 1'b1;
		tb_ready = 1'b0;
		tb_inputData = 64'h1234567890abcdef;
		tb_key1 = 64'h3b3898371520f75e;
		tb_key2 = 64'h8c1f609efca32a78;
		// first trial encryption
		@(posedge tb_clk);
		tb_ed_sel = 1'b0;
		tb_ready = 1'b1;
		@(posedge tb_clk);
		tb_ready = 1'b0;
		while(tb_next != 1) begin
			#(CLK_PERIOD);
			tb_ed_sel = 1'b0;
		end
		// first trial decryption
		#(CLK_PERIOD);
		tb_ed_sel = 1'b1;
		tb_inputData = tb_outputData;
		tb_ready = 1'b1;
		@(posedge tb_clk);
		tb_ready = 1'b0;
		while(tb_next != 1) begin
			#(CLK_PERIOD);
			tb_ed_sel = 1'b1;
		end
		#(CLK_PERIOD*10);
		// second trial
		tb_inputData = 64'h1234567890abcdef;
		tb_ed_sel = 1'b0;
		@(posedge tb_clk);
		tb_ready = 1'b1;
		@(posedge tb_clk);
		tb_ready = 1'b0;
		while(tb_next != 1) begin
			#(CLK_PERIOD);
			tb_ed_sel = 1'b0;
		end
		tb_ed_sel = 1'b1;
		tb_inputData = tb_outputData;
		tb_key2 = 64'h9c1f609efca32a78;
		tb_ready = 1'b1;
		@(posedge tb_clk);
		tb_ready = 1'b0;
		while(tb_next != 1) begin
			#(CLK_PERIOD);
			tb_ed_sel = 1'b1;
		end		
		
	end
endmodule
