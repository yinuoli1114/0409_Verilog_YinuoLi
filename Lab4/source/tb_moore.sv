// $Id: $
// File name:   tb_moore.sv
// Created:     9/20/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: tb1101
`timescale 1ns / 10ps
module tb_moore ();

   //basic parameters
   localparam CLK_PERIOD = 2.5;
   localparam D = 1;
   
   reg tb_clk;
   reg tb_n_rst;
   reg tb_i;
   reg tb_o;
   reg tb_expected_o;
   
   integer tb_test_num;
   

   // DUT portmaps
   moore DECTECTOR
     (
      .clk(tb_clk),
      .n_rst(tb_n_rst),
      .i(tb_i),
      .o(tb_o)
      );
    // Clock generation block
   always
     begin
	    tb_clk = 1'b0;
	   #(CLK_PERIOD/2.0);
	   tb_clk = 1'b1;
	   #(CLK_PERIOD/2.0);
     end
    // Default configuration test bench main process
   initial
     begin
       	// Power-on reset of the DUT
       	#(0.1);
       	tb_n_rst	= 1'b0; 	// Need to actually toggle this in order for it to actually run dependent always blocks
       	#(CLK_PERIOD * 2.25);	// Release the reset away from a clock edge
       	tb_n_rst	= 1'b1; 	// Deactivate the chip reset
	//check for one 1101
	tb_n_rst = 1;
	tb_test_num = 1;
	@(posedge tb_clk)
	  tb_i = 1;
       	@(posedge tb_clk)
	  tb_i = 1;
	@(posedge tb_clk)
	  tb_i = 0;
       	@(posedge tb_clk)
	  tb_i = 1;
	@(posedge tb_clk)
	  tb_expected_o = 1;
	  #(D)
       	if (tb_expected_o == tb_o)
        $info("Default Test flag Case %0d:: PASSED", tb_test_num);
        else//fail
        $error("Default Test flag Case %0d:: FAILED", tb_test_num);

	//check for reset
       	@(posedge tb_clk)
	  tb_i = 1;
       	@(posedge tb_clk)
	  tb_i = 1;
	tb_n_rst = 0;
       	@(posedge tb_clk)
	  tb_i = 0;
       	@(posedge tb_clk)
	  tb_i = 1;
	@(posedge tb_clk)
	  tb_expected_o = 0;
        #(D)
       	if (tb_expected_o == tb_o)
        $info("Default Test flag Case %0d:: PASSED", tb_test_num);
        else//fail
        $error("Default Test flag Case %0d:: FAILED", tb_test_num);

	//check for 11011011
	tb_n_rst = 1;
	#(D)
	//@(negedge tb_clk)
	@(posedge tb_clk)
	  tb_i = 1;
       	@(posedge tb_clk)
	  tb_i = 1;
       	@(posedge tb_clk)
	  tb_i = 0;
       	@(posedge tb_clk)
	  tb_i = 1;
	@(posedge tb_clk)
	  tb_i = 1;
       	@(posedge tb_clk)
	  tb_i = 0;

       	@(posedge tb_clk)
	  tb_i = 1;
       	@(posedge tb_clk)
	  tb_i = 1;
	//@(posedge tb_clk)
	  tb_expected_o = 1;
        #(D)
       	if (tb_expected_o == tb_o)
	$info("Default Test flag Case %0d:: PASSED", tb_test_num);
        else//fail
        $error("Default Test flag Case %0d:: FAILED", tb_test_num);
	
     end // initial begin
   endmodule
      
   
