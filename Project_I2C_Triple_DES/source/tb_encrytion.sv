// $Id: $
// File name:   tb_encrytion.sv
// Created:     12/11/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: test bench for encryption,sv
// $Id: $
// File name:   tb_maindes.sv
// Created:     12/9/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: testbench for main des controller

`timescale 1 ns / 10 ps

module tb_encrytion ();
	parameter CLK_PERIOD = 7;

	reg tb_clk;
	reg tb_n_rst;
	reg tb_i2c_stop;
	reg tb_i2c_rw;
	reg [7:0] tb_i2c_input;
	reg [63:0] tb_i2c_output;
	reg [63:0] tb_key1;
	reg [63:0] tb_key2;
	reg [63:0] tb_des_in;
	reg tb_read_enable;
	reg tb_output_ready;

	integer i;

	encrytion DUT (
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.i2c_stop(tb_i2c_stop),
		.i2c_rw(tb_i2c_rw),
		.i2c_input(tb_i2c_input),
		.i2c_output(tb_i2c_output),
		.read_enable(tb_read_enable),
		.output_ready(tb_output_ready)
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
		// initialization in encryption mode
		tb_n_rst = 1'b0;
		tb_read_enable = 1'b0;
		@(posedge tb_clk);
		tb_n_rst = 1'b1;
		tb_i2c_stop = 1'b0;
		tb_i2c_rw = 1'b0;
		tb_key1 = 64'h3b3898371520f75e;
		tb_key2 = 64'h8c1f609efca32a78;
		tb_des_in = 64'h1234567890abcdef;
		// key1
		for(i = 0; i < 8; i++) begin
			@(posedge tb_clk);
			tb_i2c_input = tb_key1[63:56];
			tb_read_enable = 1'b1;
			@(posedge tb_clk);
			tb_key1 = tb_key1<<8;
			tb_read_enable = 1'b0;
			#(CLK_PERIOD*7);
		end
		#(CLK_PERIOD);
		// key2
		for(i = 0; i < 8; i++) begin
			@(posedge tb_clk);
			tb_i2c_input = tb_key2[63:56];
			tb_read_enable = 1'b1;
			@(posedge tb_clk);
			tb_key2 = tb_key2<<8;
			tb_read_enable = 1'b0;
			#(CLK_PERIOD*7);
		end
		tb_i2c_stop = 1'b1;
		#(CLK_PERIOD);
		// data transfer
		for(i = 0; i < 8; i++) begin
			@(posedge tb_clk);
			tb_i2c_input = tb_des_in[63:56];
			tb_read_enable = 1'b1;
			@(posedge tb_clk);
			tb_des_in = tb_des_in<<8;
			tb_read_enable = 1'b0;
			#(CLK_PERIOD*7);
		end
        /*
		#(CLK_PERIOD*130);
		@(posedge tb_clk);
		tb_i2c_stop = 1'b0;
		//tb_read_enable = 1'b1;
		tb_i2c_rw = 1'b1;
		tb_key1 = 64'h3b3898371520f75e;
		tb_key2 = 64'h8c1f609efca32a78;
		//tb_des_in = 64'h1234567890abcdef;
		// key1
		for(i = 0; i < 8; i++) begin
			@(posedge tb_clk);
			tb_i2c_input = tb_key1[63:56];
			
			tb_read_enable = 1'b1;
			@(posedge tb_clk);
			tb_key1 = tb_key1<<8;
			tb_read_enable = 1'b0;
			#(CLK_PERIOD*7);
		end
		#(CLK_PERIOD);
		// key2
		for(i = 0; i < 8; i++) begin
			@(posedge tb_clk);
			tb_i2c_input = tb_key2[63:56];
			tb_read_enable = 1'b1;
			@(posedge tb_clk);
			tb_key2 = tb_key2<<8;
			tb_read_enable = 1'b0;
			#(CLK_PERIOD*7);
		end
		//#(CLK_PERIOD*7);
		@(posedge tb_clk);
		//tb_read_enable = 1'b1;
		@(posedge tb_clk);*/
		
	end

endmodule
		

