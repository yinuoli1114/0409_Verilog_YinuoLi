// $Id: $
// File name:   tb_decode.sv
// Created:     10/6/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: tb_decode
`timescale 1ns/10ps

module tb_decode ();
  
   localparam CLK_PERIOD = 10;
   localparam D = 1;
  
   reg tb_clk,tb_n_rst,tb_scl,tb_sda_in;
   reg [7:0] tb_starting_byte;
   reg tb_rw_mode,tb_address_match,tb_stop_found,tb_start_found;
  
  
  
  decode DUT(
      .clk(tb_clk), 
      .n_rst(tb_n_rst),
      .scl(tb_scl),
      .sda_in(tb_sda_in),
      .starting_byte(tb_starting_byte),
      .rw_mode(tb_rw_mode),
      .address_match(tb_address_match),
      .stop_found(tb_stop_found),
      .start_found(tb_start_found)
  );
   always 
   begin
     tb_clk = 1'b0;
     #(CLK_PERIOD/2);
     tb_clk = 1'b1;
     #(CLK_PERIOD/2);
   end

   initial
     begin
	#0.1;
	tb_n_rst = 1;
	tb_scl = 1;
	tb_sda_in = 1;
	//tb_starting_byte = 8'b00000000;
	#(D)
	@(negedge tb_clk);
	
	tb_n_rst = 0;
	@(negedge tb_clk);
	tb_n_rst = 1;
	@(posedge tb_clk);
       	assert (tb_start_found==0 && tb_stop_found==0) $info("reset 1 passed!");
	else $error ("reset 1 failed!");

	
	#(CLK_PERIOD*10);

	//test 1
	#(CLK_PERIOD*2);
	tb_n_rst = 1;
	tb_starting_byte = 8'b00000000;
	#(D);
	
	@(negedge tb_clk);
	assert (tb_address_match==0 && tb_rw_mode==0 && tb_start_found==0 && tb_stop_found==0) $info("test 1 passed!");
	else $error ("test 1 failed!");
	 #(CLK_PERIOD*2);
	tb_sda_in = 0;
	#(D);
	@(negedge tb_clk);
       	assert (tb_address_match==0 && tb_rw_mode==0 && tb_start_found==1 && tb_stop_found==0) $info("test 1 passed!");
	else $error ("test 1 failed!");
	 #(CLK_PERIOD*5);
	
       	//test 2
	#(CLK_PERIOD*2);
	tb_n_rst = 1;
	tb_starting_byte = 8'b11000001;
	@(negedge tb_clk);
	assert (tb_address_match==0 && tb_rw_mode==1 && tb_start_found==0 && tb_stop_found==0) $info("test 2 passed!");
	else $error ("test 2 failed!");
	 #(CLK_PERIOD*2);
	tb_sda_in = 1;
	#(D);
	@(negedge tb_clk);
       	assert (tb_address_match==0 && tb_rw_mode==1 && tb_start_found==0 && tb_stop_found==1) $info("test 2 passed!");
	else $error ("test 2 failed!");
	 #(CLK_PERIOD*15);

		
       	//test 3
	#(CLK_PERIOD*2);
	tb_n_rst = 1;
	tb_starting_byte = 8'b11110001;
	#(D)
	@(negedge tb_clk);
	assert (tb_address_match==1 && tb_rw_mode==1 && tb_start_found==0 && tb_stop_found==0) $info("test 3 passed!");
	else $error ("test 3 failed!");
	 #(CLK_PERIOD*5);
	tb_sda_in = 0;
	@(posedge tb_clk);
	#(D)
       	assert (tb_address_match==1 && tb_rw_mode==1 && tb_start_found==1 && tb_stop_found==0) $info("test 3 passed!");
	else $error ("test 3 failed!");
	 #(CLK_PERIOD*5);

		
       	//test 4
	#(CLK_PERIOD*2);
	tb_n_rst = 1;
	tb_starting_byte = 8'b01010101;
	#(D)
	@(negedge tb_clk);
	assert (tb_address_match==0 && tb_rw_mode==1 && tb_start_found==0 && tb_stop_found==0) $info("test 4 passed!");
	else $error ("test 4 failed!");
	 #(CLK_PERIOD*5);
	@(negedge tb_clk);
	tb_sda_in = 1;
	@(negedge tb_clk);
	#(D)
       	assert (tb_address_match==0 && tb_rw_mode==1 && tb_start_found==0 && tb_stop_found==1) $info("test 4 passed!");
	else $error ("test 4 failed!");
	 #(CLK_PERIOD*5);

       	//test 5
	#(CLK_PERIOD*2);
	tb_n_rst = 1;
	tb_starting_byte = 8'b11111111;
	#(D)
	@(negedge tb_clk);
	assert (tb_address_match==0 && tb_rw_mode==1 && tb_start_found==0 && tb_stop_found==0) $info("test 5 passed!");
	else $error ("test 5 failed!");
	 #(CLK_PERIOD*5);
	@(negedge tb_clk);
	tb_sda_in = 0;
	@(negedge tb_clk);
	#(D)
       	assert (tb_address_match==0 && tb_rw_mode==1 && tb_start_found==1 && tb_stop_found==0) $info("test 5 passed!");
	else $error ("test 5 failed!");
	 #(CLK_PERIOD*5);
       	//test 6
	#(CLK_PERIOD*2);
	tb_n_rst = 1;
	tb_starting_byte = 8'b00001110;
	#(D)
	@(negedge tb_clk);
	assert (tb_address_match==0 && tb_rw_mode==0 && tb_start_found==0 && tb_stop_found==0) $info("test 6 passed!");
	else $error ("test 6 failed!");
	 #(CLK_PERIOD*5);
	@(negedge tb_clk);
	tb_sda_in = 1;
	@(negedge tb_clk);
	#(D)
       	assert (tb_address_match==0 && tb_rw_mode==0 && tb_start_found==0 && tb_stop_found==1) $info("test 6 passed!");
	else $error ("test 6 failed!");
	 #(CLK_PERIOD*5);


     end // initial begin
endmodule // tb_decode


	
           
