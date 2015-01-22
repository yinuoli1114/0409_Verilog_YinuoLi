// $Id: $
// File name:   scl_edge.sv
// Created:     10/8/2014
// Author:      Ikeme Osi-Ogbu
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: scl edge detector
module scl_edge
(
	input  wire clk,
	input  wire n_rst,
	input  wire scl,
	output wire rising_edge_found,
        output wire falling_edge_found
);

	reg old_sample;
	reg new_sample;
	
	always @ (negedge n_rst, posedge clk)
	begin : REG_LOGIC
		if(1'b0 == n_rst)
		begin
			old_sample	<= 1'b1; // Reset value to idle line value
			new_sample	<= 1'b1; // Reset value to idle line value
		end
		else
		begin
			old_sample	<= new_sample;
			new_sample	<= scl;
		end
	end
	
	// Output logic
	assign falling_edge_found = old_sample & (~new_sample); 
  assign rising_edge_found = new_sample & (~old_sample);

	
endmodule
