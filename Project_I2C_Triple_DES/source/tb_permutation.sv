// $Id: mg116$
// File name:   tb_permutation.sv
// Created:     11/19/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Testbench for DES permutation block
`timescale 1ns / 10ps

module tb_permutation();

	// Define parameters
	parameter CLK_PERIOD = 5;
	
	reg tb_clk;
	reg [31:0] tb_data_in;
	reg [31:0] tb_data_left;
	reg tb_perm_en;
	reg [31:0] tb_data_out;
	reg tb_data_done;
	reg [63:0] tb_input;

	permutation DUT
	(
		.clk(tb_clk),
		.data_in(tb_data_in),
		.data_left(tb_data_left),
		.perm_en(tb_perm_en),
		.data_out(tb_data_out),
		.round_done(tb_data_done)
	);

	always
	begin : CLK_GEN
		tb_clk = 1'b0;
		#(CLK_PERIOD / 2);
		tb_clk = 1'b1;
		#(CLK_PERIOD / 2);
	end
	
	initial
	begin: TEST_PERMUTATION
		tb_perm_en = 1'b0;
		tb_data_in = 64'h0;
		tb_data_left = 64'h0;
		// Test 1: done signal
		@(posedge tb_clk);
		tb_perm_en = 1'b1;
		#(CLK_PERIOD);
		tb_perm_en = 1'b0;
		if(tb_data_done == 1'b1)
			$info("Done Signal Test 1/4 :: PASSED");
		else 
			$error("Done Signal Test 1/4 :: FAILED");
		@(posedge tb_clk);
		tb_perm_en = 1'b0;
		#(CLK_PERIOD);
		tb_perm_en = 1'b0;
		if(tb_data_done == 1'b0)
			$info("Done Signal Test 2/4 :: PASSED");
		else
			$error("Done Signal Test 2/4 :: FAILED");
		@(posedge tb_clk);
		tb_perm_en = 1'b1;
		#(CLK_PERIOD);
		tb_perm_en = 1'b0;
		if(tb_data_done == 1'b1)
			$info("Done Signal test 3/4 :: PASSED");
		else
			$error("Done Signal Test 3/4 :: FAILED");
		#(CLK_PERIOD);
		#(CLK_PERIOD);
		if(tb_data_done == 1'b0)
			$info("Done Signal Test 4/4 :: PASSED");
		else
			$error("Done Signal Test 4/4 :: FAILED");

		// Test 2: random input
		@(posedge tb_clk);
		tb_input = 64'hf0f0f0f0f0f0f0f0;
		tb_data_in = tb_input[31:0];
		tb_data_left = tb_input[63:32];	
		tb_perm_en = 1'b1;
		#(CLK_PERIOD);
		tb_perm_en = 1'b0;
		if(tb_data_out == 32'hd7657777 && tb_data_done == 1'b1)
			$info("Test 2 :: PASSED");
		else
			$error("Test 2 :: FAILED");

		// Test 3: jasonlin
		@(posedge tb_clk);
		tb_input = 64'h6a61736f6e6c696e;
		tb_data_in = tb_input[31:0];
		tb_data_left = tb_input[63:32];	
		tb_perm_en = 1'b1;
		#(CLK_PERIOD);
		tb_perm_en = 1'b0;
		if(tb_data_out == 32'h327ec59b && tb_data_done == 1'b1)
			$info("Test 3 :: PASSED");
		else
			$error("Test 3 :: FAILED");
		
		// Test 4: balances
		@(posedge tb_clk);
		tb_input = 64'h62616c616e636573;
		tb_data_in = tb_input[31:0];
		tb_data_left = tb_input[63:32];	
		tb_perm_en = 1'b1;
		#(CLK_PERIOD);
		tb_perm_en = 1'b0;
		if(tb_data_out == 32'ha03ec2fd && tb_data_done == 1'b1)
			$info("Test 4 :: PASSED");
		else
			$error("Test 4 :: FAILED");

		// Test 5: Attacks.
		@(posedge tb_clk);
		tb_input = 64'h41747461636b732e;
		tb_data_in = tb_input[31:0];
		tb_data_left = tb_input[63:32];	
		tb_perm_en = 1'b1;
		#(CLK_PERIOD);
		tb_perm_en = 1'b0;
		if(tb_data_out == 32'ha9139285 && tb_data_done == 1'b1)
			$info("Test 5 :: PASSED");
		else
			$error("Test 5 :: FAILED");
	end
endmodule
