// $Id: $
// File name:   counter.sv
// Created:     9/18/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: jjjjj
module flex_counter
  #(
  parameter NUM_CNT_BITS = 4
  )
  (
  input wire clk,
  input wire n_rst,
  input wire clear,
  input wire count_enable,
  input reg [NUM_CNT_BITS-1:0]rollover_val,
  output reg [NUM_CNT_BITS-1:0]count_out,
  output reg rollover_flag
  );
  
   reg rollover_flag_n;
  //assign count_out = 0;
  //assign rollover_flag = 0;
  
  always_ff @ (posedge clk, negedge n_rst)
  begin
    if(n_rst == 0)
      begin
        //rollover_val <= 0;
        count_out <= 4'b0000;
	 rollover_flag <= 0;
      end
    else if(clear == 1)
      begin
        count_out <= 4'b0000;
      end
    else if(count_enable == 1)
      begin
        if(rollover_flag == 1)
          begin
            //rollover_flag <= 0;
            count_out <= 4'b0001;
          end
         // count_out = count_out + 1'b1;
       
         else// if(rollover_flag == 0)
            begin
               count_out <= count_out + 1'b1;
	      
	          end // else: !if(rollover_flag == 1)
	          end
	          
    else
      begin
      count_out = count_out;
	 end
	 
 
  end // always_ff @



   always_comb 
     begin
	if(count_out == rollover_val)
	  begin
	     
	     rollover_flag_n = 1;
	  end
	else 
	  begin
	     rollover_flag_n = 0;

	  end
	 
     end // always_comb @
   
	
    endmodule
    
