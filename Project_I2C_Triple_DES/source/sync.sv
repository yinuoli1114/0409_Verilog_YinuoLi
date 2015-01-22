// $Id: $
// File name:   sync.sv
// Created:     9/9/2014
// Author:      Ikeme Osi-Ogbu
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Synchronizer
module sync (
input wire clk,
input wire n_rst,
input wire async_in,

output wire sync_out

);

//reg [1:0] q; 

reg tmp_x;
reg tmp_y;
//wire temp_io;

assign sync_out = tmp_y;
//assign temp_io = tmp_x;
always @(posedge clk, negedge n_rst)
begin
if(n_rst ==0) begin
tmp_y <= 0;
tmp_x <= 0; end
else begin
tmp_x <= async_in;
tmp_y <= tmp_x;
end
end


endmodule
