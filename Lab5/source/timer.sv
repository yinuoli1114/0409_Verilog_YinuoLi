// $Id: $
// File name:   timer.sv
// Created:     9/27/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: timer
module timer
  (
   input wire clk,
   input wire n_rst,
   input wire enable_timer,
   output wire shift_strobe,
   output wire packet_done
   );
   wire        c;
   
   //reg 	       shift_strobe_r;
   //reg 	       packet_done_r;
   //reg [3:0] count_out10;
   //reg [3:0] count_out9;
   //assign shift_strobe = shift_strobe_r;
   //assign packet_done = packet_done_r;
   
   

   flex_counter #(4) TEN
     (
      .clk(clk),
      .n_rst(n_rst),
      .clear(packet_done),
      .count_enable(enable_timer),
      .rollover_val(4'b1010),
      //.count_out(count_out10),
      .rollover_flag(shift_strobe)
      );
   flex_counter #(4) NINE
     (
      .clk(clk),
      .n_rst(n_rst),
      .clear(packet_done),
      .count_enable(shift_strobe),
      .rollover_val(4'b1001),
      //.count_out(count_out9),
      .rollover_flag(packet_done)
      );
endmodule // timer

      
  
