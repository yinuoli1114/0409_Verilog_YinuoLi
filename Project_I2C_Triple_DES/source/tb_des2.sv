// $Id: mg 116$
// File name:   tb_des.sv
// Created:     11/29/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: test bench of top level des

`timescale 1ns / 10ps

module tb_des2();

	// Define parameters
	parameter CLK_PERIOD = 5;
	
	reg tb_clk;
	reg tb_n_rst;
	reg [63:0] tb_data_in = 64'h2e0618e5790a7b59;
	reg tb_ready;
	reg [63:0] tb_data_out;
	reg tb_ed_sel;
	reg tb_next_data;

	des2 DUT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.data_in(tb_data_in),
		.ready(tb_ready),
		.ed_sel(tb_ed_sel),
		.data_out(tb_data_out),
		.next_data(tb_next_data)
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
		@(posedge tb_clk);
		tb_n_rst = 1'b1;
		
		tb_ed_sel = 1'b1;
		tb_ready = 1'b1;
		while(tb_next_data != 1)
		begin
        #(CLK_PERIOD);
        end
        $info("out of while loop");
        @(posedge tb_clk);
        tb_data_in = tb_data_out;
        tb_ready = 1'b0;
        @(posedge tb_clk);
        tb_ready = 1'b1;
        tb_ed_sel = 1'b0;


		
	end
endmodule
