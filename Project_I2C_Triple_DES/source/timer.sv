// $Id: $
// File name:   timer.sv
// Created:     10/9/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: timer

module timer
  (
   input wire clk,
   input wire n_rst,
   input wire rising_edge_found,
   input wire falling_edge_found,
   input wire stop_found,
   input wire start_found,
   output wire byte_received,
   output wire ack_prep,
   output wire check_ack,
   output wire ack_done
   );

   reg [3:0]   count_out;
   flex_counter #(4) EIGHT

     (
      .clk(clk),
      .n_rst(n_rst),
      .clear(stop_found|start_found|ack_done),
      .count_enable(rising_edge_found),
      .rollover_val(4'b1001),
      .count_out(count_out),
      .rollover_flag(rollover_flag)
      );
   
assign byte_received=(count_out==8);
assign ack_prep=((count_out==8)&falling_edge_found);
assign check_ack=(count_out==9);
assign ack_done=((count_out==9)&falling_edge_found);
endmodule; // timer

	     
		
		
		
	  
	  
