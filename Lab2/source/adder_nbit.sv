// $Id: $
// File name:   adder_nbit.sv
// Created:     9/6/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: n bit adder.

module adder_nbit
  #(
  BIT_WIDTH = 4
  )
  (
  input wire [BIT_WIDTH - 1:0]a,
  input wire [BIT_WIDTH - 1:0]b,
  input wire carry_in,
  output reg [BIT_WIDTH - 1:0]sum,
  output reg overflow
  );
  wire [BIT_WIDTH:0] carrys;
  
  genvar i;
  
  assign carrys[0] = carry_in;
  generate
    for(i = 0; i <= BIT_WIDTH - 1; i = i + 1)
    begin
      adder_1bit IX(.a(a[i]), .b(b[i]), .carry_in(carrys[i]), .sum(sum[i]), .carry_out(carrys[i+1]));
    end
  endgenerate
  assign overflow = carrys[BIT_WIDTH];
endmodule
