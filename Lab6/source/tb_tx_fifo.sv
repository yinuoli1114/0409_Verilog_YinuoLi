// $Id: $
// File name:   tb_tx_fifo.sv
// Created:     10/7/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: tb for tx_fifo
// ,
`timescale 1ns/1ps

module tb_tx_fifo ();
  
   localparam CLOCK_PERIOD = 10;
   localparam D = 1;
   
  
   reg tb_clk;
   reg tb_n_rst;
   reg tb_read_enable;
   reg [7:0] tb_read_data;
   reg tb_fifo_empty;
   reg tb_fifo_full;
   reg tb_write_enable;
   reg [7:0] tb_write_data;
  
   tx_fifo TX_FIFO
   (
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .read_enable(tb_read_enable),
    .read_data(tb_read_data),
    .fifo_empty(tb_fifo_empty),
    .fifo_full(tb_fifo_full),
    .write_enable(tb_write_enable),
    .write_data(tb_write_data)
    );
  
    always 
      begin
        tb_clk = 1'b0;
        #(CLOCK_PERIOD/2);
        tb_clk = 1'b1;
        #(CLOCK_PERIOD/2);
      end
   initial
     begin
	#0.1;
	tb_n_rst = 1;
	tb_read_enable =0;
	tb_write_enable = 0;
	#(D);
	@(negedge tb_clk);
	tb_n_rst = 0;
	@(negedge tb_clk);
	tb_n_rst = 1;
	tb_read_enable = 0;
       
	
	 #(CLOCK_PERIOD*3);
	@(negedge tb_clk);
	//tb_write_data = 8'b11110000;
	//tb_read_enable = 1;
	tb_write_enable = 0;
	@(negedge tb_clk);
	@(negedge tb_clk);

	
	
	@(negedge tb_clk);
	tb_write_data = 8'b00000000;
	@(posedge tb_clk);
	
	tb_write_enable = 1;
	
	@(posedge tb_clk);
	tb_write_data = 8'b00000001;
	tb_write_enable = 0;
	
        
	@(posedge tb_clk);
	tb_write_enable = 1;
      
       	@(posedge tb_clk);
	tb_write_data = 8'b10000000;
	tb_write_enable = 0;
	

	@(posedge tb_clk);
	tb_write_enable = 1;
      
       	@(posedge tb_clk);
	tb_write_data = 8'b11110000;
	tb_write_enable = 0;
	

	@(posedge tb_clk);
	tb_write_enable = 1;
     
       	@(posedge tb_clk);
	tb_write_data = 8'b10101010;
	tb_write_enable = 0;
	
      
       	assert(tb_fifo_full==0) $info("1 full check passed!");
	else $error("1 full check failed!");
       	assert(tb_fifo_full==0) $info("1 empty check passed!");
	else $error("1 empty check failed!");
       	@(posedge tb_clk);
	tb_write_enable = 1;
      
       	@(posedge tb_clk);
	tb_write_data = 8'b11111111;
	tb_write_enable = 0;
	

	@(posedge tb_clk);
	tb_write_enable = 1;
     
       	@(posedge tb_clk);
	tb_write_data = 8'b01010101;
	tb_write_enable = 0;
	
       	@(posedge tb_clk);
	tb_write_enable = 1;
      
       	@(posedge tb_clk);
	tb_write_data = 8'b00110011;
	tb_write_enable = 0;
	

	@(posedge tb_clk);
	tb_write_enable = 1;
     
       	@(posedge tb_clk);
	tb_write_data = 8'b10000111;
	tb_write_enable = 0;

	@(posedge tb_clk);
	tb_write_enable = 1;
     
       	@(posedge tb_clk);
	tb_write_data = 8'b11001000;
	tb_write_enable = 0;
	
	@(posedge tb_clk);
	//tb_write_enable = 1;
       	@(posedge tb_clk);
	


	assert(tb_fifo_full==1) $info("2 full check passed!");
	else $error("2 full check failed!");
       	assert(tb_fifo_empty==0) $info("2 empty check passed!");
	else $error("2 empty check failed!");
	
	#(CLOCK_PERIOD*5);
	@(posedge tb_clk);
	tb_read_enable = 1;
	@(posedge tb_clk);
	tb_read_enable = 0;
	#(D)
       	assert(tb_read_data==8'b00000001) $info("1 data check passed!");
	else $error("1 data check failed!");
       	@(posedge tb_clk);
	tb_read_enable = 1;
	@(posedge tb_clk);
	tb_read_enable = 0;
	#(D)
       	assert(tb_read_data==8'b10000000) $info("2 data check passed!");
	else $error("2 data check failed!");
       	@(posedge tb_clk);
	tb_read_enable = 1;
       	@(posedge tb_clk);
	tb_read_enable = 0;
	#(D)
       	assert(tb_read_data==8'b11110000) $info("3 data check passed!");
	else $error("3 data check failed!");
	@(posedge tb_clk);
	tb_read_enable = 1;
	@(posedge tb_clk);
       	tb_read_enable = 0;
	#(D)
       	assert(tb_read_data==8'b10101010) $info("4 data check passed!");
	else $error("4 data check failed!");
       	@(posedge tb_clk);
	tb_read_enable = 1;
       	@(posedge tb_clk);
	tb_read_enable = 0;
       	@(posedge tb_clk);
	tb_read_enable = 1;
       	@(posedge tb_clk);
	tb_read_enable = 0;
       	@(posedge tb_clk);
	tb_read_enable = 1;
       	@(posedge tb_clk);
	tb_read_enable = 0;
       	@(posedge tb_clk);
	tb_read_enable = 1;
       	@(posedge tb_clk);
	tb_read_enable = 0;
       	@(posedge tb_clk);
	tb_read_enable = 1;
       	@(posedge tb_clk);
	tb_read_enable = 0;
       	@(posedge tb_clk);
	tb_read_enable = 1;
       	@(posedge tb_clk);
	tb_read_enable = 0;
	
	#(D)
       	//assert(tb_read_data==8'b10101010) $info("First data check passed!");
	//else $error("First data check failed!");
	
	
	
	#(CLOCK_PERIOD*5);
     end // initial begin
endmodule // tb_tx_fifo

	
  
  
