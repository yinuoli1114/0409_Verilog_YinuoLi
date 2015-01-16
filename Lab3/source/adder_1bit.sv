// $Id: $
// File name:   adder_1bit.sv
// Created:     9/6/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: 1-bit full adder design

module adder_1bit
  (
  input wire a,
  input wire b,
  input wire carry_in,
  output reg sum,
  output reg carry_out
  );

  always @ (a)
    begin
       assert((a == 1'b1) || (a == 1'b0))
	 else $error("Input 'a' of component is not a digital logic value");
    end
  
  assign sum = carry_in ^ ( a ^ b);
  assign carry_out = ( (~carry_in) & a & b ) | ( carry_in & ( a | b) );
endmodule
