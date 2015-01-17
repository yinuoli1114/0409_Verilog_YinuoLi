// $Id: $
// File name:   mealy.sv
// Created:     9/20/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: mealy 1101
module mealy
  (
   input wire clk,
   input wire n_rst,
   input wire i,
   output reg o
   );

   typedef enum bit [1:0] {s0,s1,s2,s3} stateType;
   stateType state;
   stateType nstate;

   always_ff @ (posedge clk, negedge n_rst)
     begin:StateReg
	if(n_rst == 0)
	  begin
	     state <= s0;
	  end
	else begin
	   state <= nstate;
	end
     end

   always_comb
     begin:N_Logic
	nstate = state;
	case(state)
	  s0:begin
	     if(i == 1)begin
		nstate = s1;
		o = 0;
	     end else begin
		nstate = s0;
		o = 0;
	     end
	     end
	  s1:begin
	     if(i == 1)begin
		nstate = s2;
		o = 0;
	     end else begin
		nstate = s0;
		o = 0;
	     end
	     end
	   s2:begin
	     if(i == 0)begin
		nstate = s3;
		o = 0;
	     end else begin
		nstate = s2;
		o = 0;
	     end
	     end
	   s3:begin
	     if(i == 1)begin
		nstate = s1;
		o = 1;
	     end else begin
		nstate = s0;
		o = 0;
	     end
	     end
	   endcase // case (state)
     end // block: N_Logic
endmodule // moore

	     
