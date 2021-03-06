// $Id: $
// File name:   tb_scl_edge.sv
// Created:     10/4/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: tb_scl_edge
`timescale 1ns / 10ps
module tb_scl_edge ();
   localparam CLK_PERIOD = 2.5;
   localparam D = 1;

   reg tb_clk;
   reg tb_n_rst;
   reg tb_scl;
   reg tb_rf;
   reg tb_ff;

   scl_edge SCL
     (
      .clk(tb_clk),
      .n_rst(tb_n_rst),
      .scl(tb_scl),
      .rising_edge_found(tb_rf),
      .falling_edge_found(tb_ff)
      );
    always
     begin
	    tb_clk = 1'b0;
	   #(CLK_PERIOD/2.0);
	   tb_clk = 1'b1;
	   #(CLK_PERIOD/2.0);
     end
   initial
     begin
	#0.1;
	
	tb_n_rst = 1;
	tb_scl = 0;
	#0.1


	
	 #(CLK_PERIOD * 3)
	tb_scl = 1;
        tb_n_rst = 0;
	@(negedge tb_clk)
	  #(CLK_PERIOD * 2) 
	  
        assert( tb_rf == 1'b0 && tb_ff == 1'b0) $info(" Reset PASSED!");
        else $error(" Error on reset!");
	
	tb_n_rst = 1;
        #(CLK_PERIOD * 3)
	  tb_scl = 0;
	#(CLK_PERIOD*5);
	
       
	  tb_scl = 1;
	#(CLK_PERIOD*2);
	
       

	  tb_scl = 0;
	#(CLK_PERIOD*3);
	  tb_n_rst = 0;
	@(negedge tb_clk)
	  #(CLK_PERIOD * 2) 
	  
        assert( tb_rf == 1'b0 && tb_ff == 1'b0) $info(" Reset PASSED!");
        else $error(" Error on reset!");
	
	tb_n_rst = 1;
	
     end // initial begin
endmodule // tb_scl_edge


	
   
