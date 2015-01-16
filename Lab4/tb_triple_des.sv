// $Id: mg116$
// File name:   tb_triple_des.sv
// Created:     11/30/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: test bench for triple des wrapper

`timescale 1ns / 10ps

module tb_triple_des();

	parameter CLK_PERIOD = 5;
	reg tb_clk;
	reg tb_n_rst;
	reg [63:0] tb_inputData;
	reg [63:0] tb_outputData;
	reg tb_ed_sel;
	reg tb_ready1;
	reg tb_ready2;
	reg tb_ready3;
	reg tb_next1;
	reg tb_next2;
	reg tb_next3;
	
	triple_des DUT (
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.input_triple(tb_inputData),
		.output_triple(tb_outputData),
		.ed_sel(tb_ed_sel),
		.ready1(tb_ready1),
		.ready2(tb_ready2),
		.ready3(tb_ready3),
		.next1(tb_next1),
		.next2(tb_next2),
		.next3(tb_next3)
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
		tb_ready1 = 1'b0;
		tb_ready2 = 1'b0;
		tb_ready3 = 1'b0;

		tb_inputData = 64'h1234567890abcdef;
		@(posedge tb_clk);
		tb_ed_sel = 1'b0;
		//tb_inputData = 64'h1234567890abcdef;
		tb_ready1 = 1'b1;
		while(tb_next1 != 1) begin
			#(CLK_PERIOD);
		end
		tb_ready2 = 1'b1;
		tb_ready1 = 1'b0;
		while(tb_next2 != 1) begin
			#(CLK_PERIOD);
		end
		tb_ready3 = 1'b1;
		tb_ready2 = 1'b0;
		while(tb_next3 != 1) begin
			#(CLK_PERIOD);
		end
		tb_ready3 = 1'b0;
		assign tb_inputData = tb_outputData;
		#(CLK_PERIOD);
		tb_ed_sel = 1'b1;
		tb_ready1 = 1'b1;
		while(tb_next1 != 1) begin
			#(CLK_PERIOD);
		end
		tb_ready1 = 1'b0;
		tb_ready2 = 1'b1;
		while(tb_next2 != 1) begin
			#(CLK_PERIOD);
		end
		tb_ready2 = 1'b0;
		tb_ready3 = 1'b1;
		while(tb_next3 != 1) begin
			#(CLK_PERIOD);
		end
		tb_ready3 = 1'b0;
	end
endmodule
