// $Id: $
// File name:   tb_key_wrapper.sv
// Created:     11/20/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: test bench for key_wrapper
`timescale 1ns / 10ps
module tb_key_wrapper ();
   //basic parameters
   localparam CLK_PERIOD = 2.5;
   localparam CHECK_DELAY = 1;

   reg clk;
   reg n_rst;
   reg clear;
   reg done;
   reg ed_sel;
   reg [47:0] kout;
   reg rollover_flag;
   reg [4:0] count_out;
   integer i;

   key_wrapper KEY_WRAPPER(
   	.clk(clk),
   	.n_rst(n_rst),
   	.clear(clear),
   	.done(done),
   	.ed_sel(ed_sel),
   	.kout(kout),
   	.count_out(count_out),
   	.rollover_flag(rollover_flag)
   	);

   // Clock generation block
   always
     begin
       clk = 1'b0;
      #(CLK_PERIOD/2.0);
      clk = 1'b1;
      #(CLK_PERIOD/2.0);
     end

   //test bench main process
   initial
   begin

   n_rst = 1'b1;
   clear = 1'b1;
   done = 1'b0;
   ed_sel = 1'b0;

   @(negedge clk);
   n_rst = 1'b0;
   #(CLK_PERIOD * 2);
   n_rst = 1'b1;
   done = 1'b0;
   clear = 1'b0;
   for(i = 0; i < 60; i = i+1)
   begin
      //for(i = 0; i < 8; i = i+1)
      //begin
         @(posedge clk)
         done = 1'b1;
         @(posedge clk)
         done = 1'b0;
         #(CLK_PERIOD * 8);
   end
   @(posedge clk);
   ed_sel = 1'b0;
   for(i = 0; i < 60; i = i+1)
   begin
      //for(i = 0; i < 8; i = i+1)
      //begin
         @(posedge clk)
         done = 1'b1;
         @(posedge clk)
         done = 1'b0;
         #(CLK_PERIOD * 8);
   end

   end

endmodule




 

