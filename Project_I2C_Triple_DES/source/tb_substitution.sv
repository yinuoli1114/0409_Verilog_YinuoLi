// $Id: $
// File name:   tb_substitution.sv
// Created:     11/28/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: test bench for substiturion.sv
`timescale 1ns / 10ps
module tb_substitution ();
   //basic parameters
   localparam CLK_PERIOD = 2.5;
   localparam CHECK_DELAY = 1;

   reg [47:0] data_in = 64'h96451a9d8fad;
   reg [31:0] tb_data_out;

   substitution SUBSTITUTION(
   	.data_in(data_in),
   	.dout(tb_data_out)
   	);

   endmodule
