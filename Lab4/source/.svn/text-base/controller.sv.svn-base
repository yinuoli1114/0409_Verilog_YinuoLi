// $Id: $
// File name:   controller.sv
// Created:     9/21/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: controller
module controller
  (
   input wire clk,
   input wire n_reset,
   input wire dr,
   input wire overflow,
   output reg cnt_up,
   output wire modwait,
   output reg [1:0] op,
   output reg [3:0] src1,
   output reg [3:0] src2,
   output reg [3:0] dest,
   output reg err
   );
   typedef enum bit [3:0] {idle,store,sort1,sort2,sort3,sort4,add1,add2,add3,eidle} stateType;
   stateType state;
   stateType nstate;
   reg 		w;
   assign modwait = w;
   
/*
   assign cnt_up = (state == sort1) ? 1:0;
   assign mod_wait = (state == idle || state == eidle ) ? 0:1;
   assign op = (state == idle||state == eidle) ? 2'b00: 
               ((state == store) ? 2'b10: 
               ((state == sort1||state == sort2||state == sort3||state == sort4) ? 2'b01:2'b11));
   assign modwait = (state == idle||state == eidle) ? 0:1;
   assign err = (state == eidle) ? 1:0;*/
  //  assign modwait = (state == idle||state == eidle) ? 0:1;
    always_ff @ (posedge clk, negedge n_reset)
     begin:StateReg
	if(n_reset == 0)
	  begin
	     state <= idle;
	  end
	else begin
	  state <= nstate;
     end
     end
   always_comb
     begin:N_Logic
	nstate = idle;
	src1 = 4'hx;
	src2 = 4'hx;
	dest = 4'h5;
	w = 1'b0;
	cnt_up = 1'b0;
	op = 2'b00;
	err = 1'b0;
	
	
	case(state)
	  idle:begin
	     src1 = 4'hx;
	     src2 = 4'hx;
	     dest = 4'hx;
	     	w = 1'b0;
	cnt_up = 1'b0;
	op = 2'b00;
	err = 1'b0;
	     if(dr == 1)begin
		nstate = store;
	     end else begin
		nstate = idle;
	     end
	  end
	  store:begin
	     src1 = 4'hx;
	     src2 = 4'hx;
	     dest = 4'h5;
	     	w = 1'b1;
	cnt_up = 1'b0;
	op = 2'b10;
	err = 1'b0;
	      if(dr == 1)begin
		nstate = sort1;
	     end else begin
		nstate = eidle;
	     end
	    // nstate = sort1;
	  end
	  sort1:begin
	     src1 = 4'h2;
	     src2 = 4'hx;
	     dest = 4'h1;
	     	w = 1'b1;
	cnt_up = 1'b1;
	op = 2'b01;
	err = 1'b0;
	     
	     nstate = sort2;
	  end
	  sort2:begin
	     src1 = 4'h3;
	     src2 = 4'hx;
	     dest = 4'h2;
	     	w = 1'b1;
	cnt_up = 1'b0;
	op = 2'b01;
	err = 1'b0;
	     
	     nstate = sort3;
	  end
	  sort3:begin
	     src1 = 4'h4;
	     src2 = 4'hx;
	     dest = 4'h3;
	     	w = 1'b1;
	cnt_up = 1'b0;
	op = 2'b01;
	err = 1'b0;
	     
	     nstate = sort4;
	  end
	  sort4:begin
	     src1 = 4'h5;
	     src2 = 4'hx;
	     dest = 4'h4;
	     	w = 1'b1;
	cnt_up = 1'b0;
	op = 2'b01;
	err = 1'b0;
	     
	     nstate = add1;
	  end
	  add1:begin
	     src1 = 4'h1;
	     src2 = 4'h2;
	     dest = 4'h6;
	    	w = 1'b1;
	cnt_up = 1'b0;
	op = 2'b11;
	err = 1'b0;
	     
	     if(overflow == 0)begin
		nstate = add2;
	     end else begin
		nstate = eidle;
	     end
	  end
	  add2:begin
	     src1 = 4'h3;
	     src2 = 4'h4;
	     dest = 4'h7;
	     	w = 1'b1;
	cnt_up = 1'b0;
	op = 2'b11;
	err = 1'b0;
	     
	     if(overflow == 0)begin
		nstate = add3;
	     end else begin
		nstate = eidle;
	     end
	  end
	  add3:begin
	     src1 = 4'h6;
	     src2 = 4'h7;
	     dest = 4'h0;
	     	w = 1'b1;
	cnt_up = 1'b0;
	op = 2'b11;
	err = 1'b0;
	 
	     if(overflow == 0)begin
		nstate = idle;
	     end else begin
		nstate = eidle;
	     end
	  end // case: add3
	  eidle:begin
	      src1 = 4'hx;
	     src2 = 4'hx;
	     dest = 4'hx;
	     	w = 1'b0;
	cnt_up = 1'b0;
	op = 2'b00;
	err = 1'b1;
	     if(dr == 1)begin
		nstate = store;
	     end else begin
		nstate = eidle;
	     end
	  end
	     
	endcase // case (state)
     end // block: N_Logic
endmodule // controller

	     
		
	    
	

   
