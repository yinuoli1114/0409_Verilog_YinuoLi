// $Id: mg116$
// File name:   tb_expansion.sv
// Created:     11/19/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Testbench for DES expansion block


`timescale 1ns / 10ps

module tb_expansion();

	// Define parameters
	parameter CLK_PERIOD = 5;
	
	reg [31:0] tb_data_in;
	reg [47:0] tb_data_out;

	integer tb_error;

	expansion DUT
	(
		.data_in(tb_data_in),
		.data_out(tb_data_out)
	);

	initial
	begin: TEST_EXPANSION
		tb_error = 0;
		// Test 1: random input
		tb_data_in = 32'h00000000;
		if(tb_data_out != 48'h00000000)
			tb_error += 1;
		
		// Test 2: random input
		tb_data_in = 32'h12341234;
		if(tb_data_out != 48'h0a41a80a41a8)
			tb_error += 1;
		
		// Test 3: random input
		tb_data_in = 32'h10caf283;
		if(tb_data_out != 48'h8a16557a5406)
			tb_error += 1;
		
		// Test 4: random input
		tb_data_in = 32'h1010fefe;
		if(tb_data_out != 48'ha00a17fd7fc)
			tb_error += 1;
		
		// Test 5: random input
		tb_data_in = 32'h11221122;
		if(tb_data_out != 48'ha29040a2904)
			tb_error += 1;

		// Test 6: random input
		tb_data_in = 32'habcd1234;
		if(tb_data_out != 48'h557e5a8a41a9)
			tb_error += 1;

		// Test 7: random input
		tb_data_in = 32'h0000aaaa;
		if(tb_data_out != 48'h1555554)
			tb_error += 1;
		
		// Test 8: random input
		tb_data_in = 32'habab123f;
		if(tb_data_out != 48'hd57d568a41ff)
			tb_error += 1;

		// Test 9: random input
		tb_data_in = 32'h32ab90df;
		if(tb_data_out != 48'h9a5557ca16fe)
			tb_error += 1;

		// Test 10: random input
		tb_data_in = 32'h88ff9911;
		if(tb_data_out != 48'hc517ffcf28a3)
			tb_error += 1;

		// Test 11: word
		tb_data_in = 32'h776f7264;
		if(tb_data_out != 48'h3aeb5eba4308)
			tb_error += 1;

		// Test 12: date
		tb_data_in = 32'h64617465;
		if(tb_data_out != 48'h08302ba830a)
			tb_error += 1;

		// Test 13: TiMe
		tb_data_in = 32'h54694d65;
		if(tb_data_out != 48'haa8352a5ab0a)
			tb_error += 1;

		// Test 14: I am
		tb_data_in = 32'h4920616d;
		if(tb_data_out != 48'ha52900302b5a)
			tb_error += 1;

		// Test 15: ME!!
		tb_data_in = 32'h4d452121;
		if(tb_data_out != 48'ha5aa0a902902)
			tb_error += 1;

		if(tb_error == 0)
			$info("Expansion Testing :: PASSED");
		else
			$error("Expansion Testing:: FAILED with %d errors", tb_error);
	end
endmodule
