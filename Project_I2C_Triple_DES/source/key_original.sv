// $Id: $
// File name:   key_original.sv
// Created:     11/9/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: store the original 64 bits key

module key_original
  (
   output wire [63:0] k_o
   );
   assign k_o = 64'h3b3898371520f75e;
 endmodule
 
 
