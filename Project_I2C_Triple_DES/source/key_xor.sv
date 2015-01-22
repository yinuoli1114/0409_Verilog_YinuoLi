// $Id: $
// File name:   key_xor.sv
// Created:     11/11/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: 48 bit data from expansion permutation xor with 48 bit round key

module key_xor
  (
   input wire [47:0] data,
   input wire [47:0] key,
   output wire [47:0] out
   );

   assign out = data^key;

   
   //out_r = data ^ key;
endmodule // key_xor

   

   
