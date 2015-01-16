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

 /* always @ (a,b,carry_in)
    begin
      assert((a < 2**BIT_WIDTH)&&(a >= 0))
      else $error("Input a is incorrect");
      assert((a < 2**BIT_WIDTH)&&(a >= 0))
      else $error("Input a is incorrect");
      assert((carry_in == 1'b1)||(carry_in == 1'b0))
      else $error("Ipunt carry_in is not a digital logic value");

    end*/
	     
  genvar i;
  
  assign carrys[0] = carry_in;
  generate
    for(i = 0; i <= BIT_WIDTH - 1; i = i + 1)
    begin
      adder_1bit IX(.a(a[i]), .b(b[i]), .carry_in(carrys[i]), .sum(sum[i]), .carry_out(carrys[i+1]));
     /* always @ (a[i],b[i],carrys[i])
	begin
	     assert(((a[i]+b[i]+carrys[i])%2) == sum[i])
	     else $error("Output 's' of %d bit adder is not correct",i);
	end*/
    end
  endgenerate
  assign overflow = carrys[BIT_WIDTH];
endmodule
