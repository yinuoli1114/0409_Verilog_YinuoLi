// $Id: $
// File name:   sda_sel.sv
// Created:     10/4/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: sda_sel

module sda_sel
  (
   input wire tx_out,
   input wire [1:0] sda_mode,
   output wire sda_out
   );
   reg out;
   assign sda_out = out;

   always_comb
     begin
	case(sda_mode)
	  2'b00:
	    out = 1;
	  2'b01:
	    out = 0;
	  2'b10:
	    out = 1;
	  2'b11:
	    out = tx_out;
	  default: out = 1;
	endcase // case (sda_mode)
     end // always_comb
endmodule // sda_sel
