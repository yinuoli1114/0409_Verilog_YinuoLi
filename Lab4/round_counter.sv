// $Id: $
// File name:   round_counter.sv
// Created:     11/9/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: round counter for rollover value of 16

module round_counter
  #(
  parameter NUM_CNT_BITS = 5
  )
  (
  input wire clk,
  input wire n_rst,
  input wire clear,

  input wire count_enable,
  //input reg [NUM_CNT_BITS-1:0]rollover_val,
  output wire [NUM_CNT_BITS-1:0]count_out,
  output wire rollover_flag,
  input wire ed_sel
  );
  
   reg rollover_flag_n;
   reg rollover_flag_c;
   reg [NUM_CNT_BITS-1:0] current;
   reg [NUM_CNT_BITS-1:0] next;
   wire [NUM_CNT_BITS-1:0] rollover_val;
   
   assign count_out = current;
   assign rollover_flag = rollover_flag_c;
   assign rollover_val = (ed_sel == 0) ? 16:1;
   //assign count_enable = (done||start) ? 1:0;
   



    always_comb
     begin
	//next = current;
	//next = 0;
	//current = count_out;
	rollover_flag_n = rollover_flag_c;
	next = current;
	if(clear == 1 && ed_sel == 0)
	  begin
	     next = 0;
	  end
	else if(clear == 1 && ed_sel == 1)
	  begin
	     next = 17;
	  end
	
	else if(count_enable == 1 && ed_sel == 0)
	  begin
	     next = current + 1'b1;
	     if(current == rollover_val - 1)
	       begin
		  rollover_flag_n = 1;
	       end
	     else if(current >= rollover_val)
	       begin
		  next = 1;
		  rollover_flag_n = 0;
	       end
	  end // if (count_enable == 1)
	else if(count_enable == 1 && ed_sel == 1)
	  begin
	     next = current - 1'b1;
	     if(current == rollover_val + 1)
	       begin
		  rollover_flag_n = 1;
	       end
	     else if(current <= rollover_val)
	       begin
		  next = 16;
		  rollover_flag_n = 0;
	       end
	  end // if (count_enable == 1)
	//current = count_out;
     end // always_comb
   
    
  always_ff @ (posedge clk, negedge n_rst)
  begin
    if(n_rst == 0)
      begin
        //rollover_val <= 0;
	 if(ed_sel == 0)
	   begin
	       current <= 0;
	   end
	 else begin
	    current <= 17;
	 end
	 
	 rollover_flag_c <= 0;
	 
	    //rollover_flag = 0;
      end
    else
      begin
	 current <= next;
         rollover_flag_c <= rollover_flag_n;
       end
     
  end // always_ff @

  
endmodule // flex_counter


   