// $Id: $
// File name:   flex_pts_sr.sv
// Created:     9/11/2014
// Author:      Ikeme Osi-Ogbu
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: flexible parallel to serial shift register
module flex_pts_sr
#(parameter NUM_BITS = 4,
parameter SHIFT_MSB = 1)

(
input wire clk,
input wire n_rst,
input wire shift_enable,
input wire load_enable,
input wire [NUM_BITS-1:0] parallel_in,

output wire serial_out
);

 reg [NUM_BITS-1:0] q;
 reg [NUM_BITS-1:0] d;

 assign serial_out = (SHIFT_MSB == 1) ? q[NUM_BITS-1] : q[0];

//assign serial_out = q;
always @ (posedge clk,negedge n_rst) begin
    if (n_rst == 0) begin
        q <= '1;
    end else begin
          q <= d;
    end
end

always @ (shift_enable,load_enable,q)begin
if (load_enable == 1) begin
          d=parallel_in;
end else if (shift_enable == 1) begin
      if (SHIFT_MSB == 1) begin
      d = {q[NUM_BITS-2:0],1'b1};
     	end else begin
       d = {1'b1,q[NUM_BITS-1:1]};
     	end
end else begin
           d=q;
end
end
endmodule 
