// $Id: $
// File name:   scl_edge.sv
// Created:     10/4/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: scl edge detector

module scl_edge
  (
   input wire clk,
   input wire n_rst,
   input wire scl,
   output wire rising_edge_found,
   output wire falling_edge_found
   );

   reg 	       rising_c;
   reg 	       rising_n;
   reg 	       falling_n;
   reg 	       falling_c;
   reg 	       scl_pre;
   reg 	       scl_c;
   
   assign rising_edge_found = scl_pre==0 && scl_c==1 ? 1:0;
   assign falling_edge_found = scl_pre==1 && scl_c==0 ? 1:0;

   always_ff @ (posedge clk, negedge n_rst)
     begin
	if(n_rst == 0)
	  begin
	     //rising_c <= 0;
	     //falling_c <= 0;
	     scl_c <= 1;
	     scl_pre <= 1;
	     
	     
	  end else begin
	     //rising_c <= rising_n;
	     //falling_c <= falling_n;
	     scl_pre <= scl_c;
	     scl_c <= scl;
	  end
     end // always_ff @
   /*always_comb
     begin
	
	if (scl_c == 0 && scl == 1 && n_rst == 1)
	  begin
	     rising_n = 1;
	  end else begin
	     rising_n = 0;
	  end
     end
   always_comb
     begin
	if (scl_c == 1 && scl == 0 && n_rst == 1)
	  begin
	     falling_n = 1;
	  end else begin
	     falling_n = 0;
	  end
     end*/
endmodule // scl_edge


	     
   
	     
   
