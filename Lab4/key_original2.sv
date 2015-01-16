// $Id: $
// File name:   key_original2.sv
// Created:     11/30/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: hard coded second key
module key_original2
  (
   output wire [63:0] k_o
   );
   //reg [63:0] key = 64'h8c1f609efca32a78;
   assign k_o = 64'h8c1f609efca32a78;
 endmodule