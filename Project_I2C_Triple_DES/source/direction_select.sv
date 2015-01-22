// $Id: $
// File name:   mux_64.sv
// Created:     11/6/2014
// Author:      Ikeme Osi-Ogbu
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: direction select block
module direction_select
(
   input wire [63:0] from_inputbyte,
   input wire [63:0] from_des,
   input wire dir_sel, 
   output wire [63:0] data_in,
   output wire [63:0] output_data
);


  assign output_data = (dir_sel == 1'b0)? data_out : input_data;  
  assign data_in = (dir_sel == 1'b1)? data_out : input_data; 

endmodule
