// $Id: $
// File name:   flex_stp_sr
// Created:     9/11/2014
// Author:      Ikeme Osi-Ogbu
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: serial to parralel shift register
module flex_stp_sr
#(parameter NUM_BITS = 4,
parameter SHIFT_MSB = 1)
(
input wire clk,
input wire n_rst,
input wire shift_enable,
input wire serial_in,

output wire [NUM_BITS-1:0] parallel_out



);

 reg [NUM_BITS-1:0] q;
 reg [NUM_BITS-1:0] d;
           
 assign parallel_out = q;


always @ (posedge clk,negedge n_rst) begin
    if (n_rst == 0)
        q <= '1;
    else 
          q <= d;
    end

always @ (shift_enable,serial_in,q)begin
  if (shift_enable == 1) begin
  	if (SHIFT_MSB == 1) begin
      d = {q[NUM_BITS-2:0],serial_in};
  	end else begin
       d = {serial_in,q[NUM_BITS-1:1]};
  	end
  end else begin
          d=q;
	end
end
endmodule 
