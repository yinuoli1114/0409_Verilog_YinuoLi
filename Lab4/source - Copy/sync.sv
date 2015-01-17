// $Id: $
// File name:   sync.sv
// Created:     9/6/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: flip-flop synchronizer

module sync
  (
  input wire clk,
  input wire n_rst,
  input wire [3:0] async_in,
  output reg [3:0] sync_out
  );
  
  reg [3:0] q;
  
  always_ff @ (posedge clk, negedge n_rst)
  begin 
    if(n_rst == 1'b0)
      begin
        sync_out <= 0;
        q <= 0;
      end
      else 
   
	     begin
               q <= async_in;
		sync_out <= q;
		
	   
	  // sync_out = q;
	   
        end
      end
    
    
   /* always_ff @ (posedge clk, negedge n_rst)
      begin 
       if(n_rst == 1'b0)
         begin
           sync_out <= 0;
           q <= 0;
         end
       else 
         begin
           sync_out <= q;
         end
       end*/
  
  endmodule
