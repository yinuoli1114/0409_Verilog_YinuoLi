// $Id: $
// File name:   sda_sel.sv
// Created:     10/8/2014
// Author:      Ikeme Osi-Ogbu
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: sda out select block
module sda_sel
(
   input wire tx_out,
   input wire [1:0] sda_mode,
   output wire sda_out
);


  assign sda_out = (sda_mode == 2'b00)? 1 : ((sda_mode == 2'b01)? 0 :(sda_mode == 2'b10)? 1:tx_out);  

endmodule
