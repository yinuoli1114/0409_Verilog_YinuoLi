// $Id: mg116$
// File name:   tb_sda_out.sv
// Created:     10/7/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Test bench for timer block 

`timescale 1ns / 10ps

module tb_timer();

	// Define parameters
	parameter CLK_PERIOD = 10;
	
	reg tb_clk;
	reg tb_n_rst;
	reg tb_rising_edge_found;
	reg tb_falling_edge_found;
	reg tb_stop_found;
	reg tb_start_found;
	reg tb_byte_received;
	reg tb_ack_prep;
	reg tb_check_ack;
	reg tb_ack_done;

	integer tb_num;
	integer i;

	timer DUT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.rising_edge_found(tb_rising_edge_found),
		.falling_edge_found(tb_falling_edge_found),
		.stop_found(tb_stop_found),
		.start_found(tb_start_found),
		.byte_received(tb_byte_received),
		.ack_prep(tb_ack_prep),
		.check_ack(tb_check_ack),
		.ack_done(tb_ack_done)
	);

	always
	begin : CLK_GEN
		tb_clk = 1'b0;
		#(CLK_PERIOD / 2);
		tb_clk = 1'b1;
		#(CLK_PERIOD / 2);
	end

	initial
	begin: TEST_PROC
		// initialization
		tb_n_rst = 1'b1;
		tb_rising_edge_found = 1'b0;
		tb_falling_edge_found = 1'b0;
		tb_stop_found = 1'b0;
		tb_start_found = 1'b0;
		tb_num = 0;
		i = 0;
		// Test 1: asynchronize reset test
		tb_num = tb_num +1;
		#(CLK_PERIOD);
		tb_n_rst = 1'b0;
		if(tb_byte_received == 1'b0 && tb_ack_prep == 1'b0 && tb_check_ack == 1'b0 && tb_ack_done == 1'b0)
			$info("Test %d: Asynch test 1/3::PASSED",tb_num);
		else
			$error("Test %d: Asynch test 1/3::FAILED",tb_num);
		
		#(CLK_PERIOD);
		tb_n_rst = 1'b1;
		if(tb_byte_received == 1'b0 && tb_ack_prep == 1'b0 && tb_check_ack == 1'b0 && tb_ack_done == 1'b0)
			$info("Test %d: Asynch test 2/3::PASSED",tb_num);
		else
			$error("Test %d: Asynch test 2/3::FAILED", tb_num);
		
		// Test 2: simulate 7 bits received
		tb_num = tb_num +1;
		for(i = 0; i < 7; i= i+1) begin
			@(negedge tb_clk);
			#(0.5);
			tb_falling_edge_found = 1'b0;
			tb_rising_edge_found = 1'b1;
			#(CLK_PERIOD);
			#(0.5);
			tb_rising_edge_found = 1'b0;
			tb_falling_edge_found = 1'b1;
		end
		@(negedge tb_clk);
		tb_rising_edge_found = 1'b0;
		tb_falling_edge_found = 1'b0;
		if(tb_byte_received == 1'b0 && tb_ack_prep == 1'b0 && tb_check_ack == 1'b0 && tb_ack_done == 1'b0)
			$info("Test %d: Count 7bits test::PASSED", tb_num);
		else
			$error("Test %d: Count 7bits test::FAILED", tb_num);

		// Test 3: simulate 8th bit received
		tb_num = tb_num +1;
		@(negedge tb_clk);
		#(0.5);
		tb_falling_edge_found = 1'b0;
		tb_rising_edge_found = 1'b1;
		#(CLK_PERIOD);
		tb_falling_edge_found = 1'b1;
		tb_rising_edge_found = 1'b0;
		@(negedge tb_clk);
		tb_falling_edge_found = 1'b0;
		tb_rising_edge_found = 1'b0;
		if(tb_byte_received == 1'b1 && tb_ack_prep == 1'b1 && tb_check_ack == 1'b0 && tb_ack_done == 1'b0)
			$info("Test %d: Receive 8th bit test::PASSED", tb_num);
		else 
			$error("Test %d: Receive 8th bit test::FAILED", tb_num);
		tb_rising_edge_found = 1'b0;
		tb_falling_edge_found = 1'b0;
		// Test 4: ack edge received
		tb_num = tb_num + 1;
		@(negedge tb_clk);
		#(0.5);
		tb_falling_edge_found = 1'b0;
		tb_rising_edge_found = 1'b1;
		#(CLK_PERIOD);
		if(tb_byte_received == 1'b0 && tb_ack_prep == 1'b0 && tb_check_ack == 1'b1 && tb_ack_done == 1'b0)
			$info("Test %d: Ack bit test 1/2::PASSED", tb_num);
		else
			$error("Test %d: Ack bit test 1/2::FAILED", tb_num);
		tb_falling_edge_found = 1'b1;
		tb_rising_edge_found = 1'b0;
		@(negedge tb_clk);
		tb_falling_edge_found = 1'b0;
		tb_rising_edge_found = 1'b0;
		if(tb_byte_received == 1'b0 && tb_ack_prep == 1'b0 && tb_check_ack == 1'b0 && tb_ack_done == 1'b1)
			$info("Test %d: Ack bit test 2/2::PASSED", tb_num);
		else 
			$error("Test %d: Ack bit test 2/2::FAILED", tb_num);	
		tb_rising_edge_found = 1'b0;
		tb_falling_edge_found = 1'b0;		
		// Test 5: check successful rollover
		@(negedge tb_clk);
		#(0.5);
		tb_falling_edge_found = 1'b0;
		tb_rising_edge_found = 1'b1;
		#(CLK_PERIOD);
		tb_falling_edge_found = 1'b1;
		tb_rising_edge_found = 1'b0;
		@(negedge tb_clk);
		tb_falling_edge_found = 1'b0;
		tb_rising_edge_found = 1'b0;

			
		 
	end
endmodule
