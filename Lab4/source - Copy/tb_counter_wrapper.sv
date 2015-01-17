// $Id: $
// File name:   tb_counter_wrapper.sv
// Created:     12/1/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: wrapper for counter
`timescale 1ns / 10ps
module tb_counter_wrapper ();

   //basic parameters
   localparam CLK_PERIOD = 2.5;
   localparam CHECK_DELAY = 1;
   
   reg tb_clk;
   reg tb_default_n_reset;
   reg tb_default_clear ;
   reg tb_default_count_en;
   reg [3:0] tb_default_rollover_val;
   reg [3:0] tb_default_count_out;
   reg tb_default_rollover_flag;
   reg [3:0] tb_expected_default_count_out;
   reg tb_expected_default_rollover_flag;
   integer tb_default_test_num;
   integer i;
   
   

   // DUT portmaps
   counter_wrapper COUNTER_WAPPER
     (
      .clk(tb_clk),
      .n_rst(tb_default_n_reset),
      .clear(tb_default_clear),
      .count_enable(tb_default_count_en),
      .rollover_val(tb_default_rollover_val),
      .count_out(tb_default_count_out),
      .rollover_flag(tb_default_rollover_flag)
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

	//Initial all of the test inputs
	tb_default_n_reset = 1'b1;
	//Initailize parallel in to be idle values
        tb_default_clear = 1'b0;
	tb_default_count_en = 1'b0;
	tb_default_rollover_val = 4'b1111;
	tb_expected_default_rollover_flag = 1;

	tb_default_test_num = 0;
	

	//test 1:check for reset
      @(negedge tb_clk);
	tb_default_test_num = tb_default_test_num + 1;
	tb_default_n_reset = 1'b0; //set to be active low
        tb_expected_default_count_out = 0;
	
	#(CHECK_DELAY);
	if (tb_expected_default_count_out == tb_default_count_out)
	  	$info("Default Test Case %0d:: PASSED", tb_default_test_num);
	else//fail
	  	$error("Default Test Case %0d:: FAILED", tb_default_test_num);
      // initial begin


        //test 2:check for reset when in posedge	  
	
       @(posedge tb_clk);
	tb_default_n_reset = 0;
	tb_default_count_en = 1;
	#(CHECK_DELAY);
	tb_expected_default_count_out = 0;
	if (tb_expected_default_count_out == tb_default_count_out)
	  $info("Default Test Case %0d:: PASSED", tb_default_test_num);
	  else//fail
	    $error("Default Test Case %0d:: FAILED", tb_default_test_num);
	
        //test 3:check for clear
   tb_default_n_reset = 1;
   tb_default_count_en = 1;
   
   
        #(CLK_PERIOD * 10)
   tb_default_clear = 1;
   #(CHECK_DELAY);
	@(posedge tb_clk)
   tb_expected_default_count_out = 0;
	#(CHECK_DELAY)
   	if (tb_expected_default_count_out == tb_default_count_out)
	  $info("Default Test Case %0d:: PASSED", tb_default_test_num);
	  else//fail
	    $error("Default Test Case %0d:: FAILED", tb_default_test_num);
        tb_default_clear = 0;
	//test 4:check for count_out
	tb_default_rollover_val = 4'b1111;
	//tb_default_count_out = 4'b0000;
	#(CHECK_DELAY)
	for(i = 0; i < 16; i = i+1)
	  begin
	     
	     @(posedge tb_clk)
	     tb_expected_default_count_out = tb_expected_default_count_out + 1;
	     #(CHECK_DELAY)
	     if( tb_expected_default_count_out == tb_default_rollover_val)
	       begin
		  tb_expected_default_rollover_flag = 1;
		  #(CHECK_DELAY)            
	       	if (tb_expected_default_rollover_flag == tb_default_rollover_flag)
	         $info("Default Test flag Case %0d:: PASSED", tb_default_test_num);
	         else//fail
	         $error("Default Test flag Case %0d:: FAILED", tb_default_test_num);
	         end
	         
	     else
	       begin
                  tb_expected_default_rollover_flag = 0;
		  #(CHECK_DELAY)        
	       	if (tb_expected_default_count_out == tb_default_count_out)
	         $info("Default Test Case %0d:: PASSED", tb_default_test_num);
	         else//fail
	         $error("Default Test Case %0d:: FAILED", tb_default_test_num);
	       end // else: !if(tb_expected_default_rollover_flag == tb_default_rollover_flag)
	  end // for (i = 0; i < 16; i = i+1)
     	//test 5: check for rollover value
	   
              tb_default_clear = 1;
            #(CHECK_DELAY);
         	@(posedge tb_clk)
		   tb_default_clear = 0;
	  	tb_default_rollover_val = 4'b0110;
        	#(CHECK_DELAY)
	for(i = 0; i < 6; i = i+1)
	  begin
	     
	     @(posedge tb_clk)
	     tb_expected_default_count_out = tb_expected_default_count_out + 1;
	     #(CHECK_DELAY)
	     if( tb_expected_default_count_out == tb_default_rollover_val)
	       begin
		  tb_expected_default_rollover_flag = 1;
		  #(CHECK_DELAY)            
	       	if (tb_expected_default_rollover_flag == tb_default_rollover_flag)
	         $info("Default Test flag Case %0d:: PASSED", tb_default_test_num);
	         else//fail
	         $error("Default Test flag Case %0d:: FAILED", tb_default_test_num);
	         end
	         
	     else
	       begin
                  tb_expected_default_rollover_flag = 0;
		  #(CHECK_DELAY)        
	       	if (tb_expected_default_count_out == tb_default_count_out)
	         $info("Default Test Case %0d:: PASSED", tb_default_test_num);
	         else//fail
	         $error("Default Test Case %0d:: FAILED", tb_default_test_num);
	       end // else: !if(tb_expected_default_rollover_flag == tb_default_rollover_flag)
	  end // for (i = 0; i < 16; i = i+1)
	  
	//test 5: check for rollover value
		@(posedge tb_clk);
	    tb_default_rollover_val = 4'b0110;
	   #(CHECK_DELAY)
	      tb_default_clear = 0;
	    // @(posedge tb_clk)
	       #(CLK_PERIOD * 4)
	   	@(posedge tb_clk);
          	tb_expected_default_count_out = 4'b0110;
          	 #(CHECK_DELAY)
         	if (tb_expected_default_count_out == tb_default_count_out)
	        $info("Default Test Case %0d:: PASSED", tb_default_test_num);
         	  else//fail
	         $error("Default Test Case %0d:: FAILED", tb_default_test_num);

	
	     
	         
	       
	         
	   
	
	       
	
   










     end // initial begin
   
 
	endmodule
	