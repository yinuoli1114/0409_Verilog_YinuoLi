// $Id: $
// File name:   flex_stp_sr.sv
// Created:     9/16/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: dddddd

module flex_stp_sr
#(
   parameter NUM_BITS = 4,
   parameter SHIFT_MSB =1
)
(	
    input wire clk,
    input wire n_rst,
    input wire shift_enable,
    input wire serial_in,
    output wire [NUM_BITS-1:0] parallel_out
);
   
  reg [NUM_BITS-1:0] out = 0;
   
  assign parallel_out[NUM_BITS-1:0] = out[NUM_BITS-1:0];
  integer i;


always @(posedge clk, negedge n_rst)
begin
  if (n_rst == 0)
   begin
    for (i = 0; i < NUM_BITS; i++)
    begin
      out[i] <= 1;
    end
   end
   
 else if ((shift_enable == 1) && (SHIFT_MSB == 1))
  begin
    out[NUM_BITS-1:0] <= {out[NUM_BITS-2:0],serial_in};
  end
   
 else if ((shift_enable == 1) && (SHIFT_MSB == 0))
   begin
   out[NUM_BITS-1:0] <= {serial_in,out[NUM_BITS-1:1]};
   end
end
endmodule
