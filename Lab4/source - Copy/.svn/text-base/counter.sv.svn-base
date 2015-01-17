// $Id: $
// File name:   counter.sv
// Created:     9/22/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: counter wrapper
module counter
  (
   input wire clk,
   input wire n_reset,
   input wire cnt_up,
   output wire one_k_samples
   );

  //reg [15:0] k = 16'b0000001111101000;
  //  reg [15:0] k = 16'b0000000000001011;
   //reg [15:0] count_out;
   wire      c;
   
   
   
flex_counter #(16) IX 
(
    .clk(clk), 
    .n_rst(n_reset), 
    .clear(c),
    .count_enable(cnt_up),
    .rollover_val(16'b0000001111101000),
    //.count_out(count_out),
    .rollover_flag(one_k_samples)
 );
endmodule // counter

  
   
