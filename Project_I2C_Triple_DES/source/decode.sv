// $Id: $
// File name:   decode.sv
// Created:     10/4/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: decode

module decode
  (
   input wire clk,
   input wire n_rst,
   input wire scl,
   input wire sda_in,
   input wire [7:0] starting_byte,
   output wire rw_mode,
   output wire address_match,
   output wire stop_found,
   output wire start_found
   );

   reg 	       scl_c;
   reg 	       scl_pre;
   reg 	       sda_c;
   reg 	       sda_pre;
   reg 	       sda_new;
   reg 	       scl_new;

   //reg stop;
  // reg stop_n;
   
   //reg start;
  // reg start_n;
   
   reg address;
   
   //assign stop_found = stop;
   //assign start_found = start;
   assign rw_mode = starting_byte[0];
   assign address_match = address;
   
   
   always_ff @ (posedge clk, negedge n_rst)
     begin
	if(n_rst == 0)
	  begin
	     scl_pre <= 1;
	     scl_c <= 1;
	     //start <= 0;
	     //stop <= 0;
	     scl_new<=1;
	     sda_pre <= 1;
	     sda_new<=1;
	     sda_c <= 1;
	  end else begin
	     scl_pre <= scl_c;
	     scl_c <= scl_new;
	     scl_new<=scl;

	     sda_pre <= sda_c;
	     sda_c <= sda_new;
	     sda_new<=sda_in;
	    // start <= start_n;
	     //stop <= stop_n;
	     
	  end
     end // always_ff @
   assign start_found = (scl_pre==1 && scl_c==1 && sda_pre==1 && sda_c==0) ? 1:0;
   assign stop_found = (scl_pre==1 && scl_c==1 && sda_pre==0 && sda_c==1) ? 1:0;
   
  /* always_comb
   
     begin
       start_n = 0;
       stop_n = 0;
	if (scl_c == 1 && scl == 1 && sda_c == 1 && sda_in == 0)
	  begin
	     start_n = 1;
	  end
	else if (scl_c == 1 && scl == 1 && sda_c == 0 && sda_in == 1)
	  begin
	     stop_n = 1;
	  end
     end // always_comb*/

   always_comb
     begin
	if (starting_byte[7:1] == 7'b1111000)
	  begin
	     address = 1;
	  end else begin
	     address = 0;
	  end
     end
   
	     
endmodule // decode

   
	     
	     
	     
	     
	     
    
