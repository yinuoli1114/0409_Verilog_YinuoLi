// $Id: $
// File name:   tb_sda_sel.sv
// Created:     10/6/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: tb_sda_sel
`timescale 1ns/10ps

module tb_sda_sel ();

   localparam D = 1;
   
   reg tb_tx_out;
   reg tb_sda_out;
   reg [1:0] tb_sda_mode;
  
   sda_sel DUT 
    (
     .tx_out(tb_tx_out),
     .sda_mode(tb_sda_mode),
     .sda_out(tb_sda_out)
     );
   initial
     begin
	#10 ;
	tb_sda_mode = 2'b00;
	#(D);
	assert (tb_sda_out==1) $info("idle value passed!");
	else $error("idle value failed!");  
	#10 ;
	tb_sda_mode = 2'b01;
	#(D);
	assert (tb_sda_out==0) $info("ACK value passed!");
	else $error("ACK value failed!");  
	#10 ;
	tb_sda_mode = 2'b10;
	#(D);
	assert (tb_sda_out==1) $info("NACK value passed!");
        else $error("NACK value failed!");   
	#10 ;
	tb_sda_mode = 2'b11;
	tb_tx_out = 0;
	
	#(D);
	assert (tb_sda_out==0) $info("1 tx_out value passed!");
        else $error("1 tx_out value failed!");
       	#10 ;
	tb_sda_mode = 2'b11;
	tb_tx_out = 1;
	
	#(D);
	assert (tb_sda_out==1) $info("2 tx_out value passed!");
        else $error("2 tx_out value failed!"); 
     end // initial begin
endmodule // tb_sda_sel

 
 
