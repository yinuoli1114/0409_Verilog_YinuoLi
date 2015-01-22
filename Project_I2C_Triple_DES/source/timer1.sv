// $Id: $
// File name:   timer.sv
// Created:     10/8/2014
// Author:      Ikeme Osi-Ogbu
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: timer block code
module timer
(
  input wire clk,
  input wire n_rst,
  input wire rising_edge_found,
  input wire falling_edge_found,
  input wire stop_found,
  input wire start_found,
  output reg byte_received,
  output reg ack_prep,
  output reg check_ack,
  output reg ack_done
);

reg temp_byte;
reg enable_byte;

typedef enum bit[2:0]
{idle, state1, state2, state3, state4, state5, state6} state_type;

state_type state;
state_type nextstate;


flex_counter
	#(
		.NUM_CNT_BITS(4)
		)
	COREb(
		.clk(clk),
		.n_rst(n_rst),
		.count_enable((rising_edge_found & enable_byte)),
    .rollover_val(4'b1000),
   .clear(byte_received),
		.rollover_flag(temp_byte)
	);


always @ (posedge clk,negedge n_rst) begin
    if (n_rst == 0) begin
         state <= idle;
    end else begin
          state <= nextstate;
    end
end

always @ (rising_edge_found,falling_edge_found,temp_byte,stop_found,start_found,state)begin
 case (state)
   idle: begin
     byte_received = 1'b0;
     ack_prep = 1'b0;
     check_ack = 1'b0;
     ack_done = 1'b0;
     enable_byte = 1'b0;
     if (start_found == 1) begin
        nextstate = state1;
     end else begin
        nextstate = idle;
     end
     end
  state1: begin
     byte_received = 1'b0;
     ack_prep = 1'b0;
     check_ack = 1'b0;
     ack_done = 1'b0;
     enable_byte = 1'b1;
     if (start_found == 1) begin
        nextstate = state1;
     end else begin
        nextstate = state1;
     end
     if (stop_found == 1) begin
        nextstate = idle;
     end else begin
        nextstate = state1;
     end
     if (temp_byte == 1) begin
        nextstate = state2;
     end else begin
        nextstate = state1;
     end
     end
  state2: begin
     byte_received = 1'b0;
     ack_prep = 1'b0;
     check_ack = 1'b0;
     ack_done = 1'b0;
     enable_byte = 1'b0;
     if (falling_edge_found == 1) begin
        nextstate = state3;
     end else begin
        nextstate = state2;
     end
     end
  state3: begin
     byte_received = 1'b1;
     ack_prep = 1'b1;
     check_ack = 1'b0;
     ack_done = 1'b0;
     enable_byte = 1'b0;
     if (rising_edge_found == 1) begin
        nextstate = state4;
     end else begin
        nextstate = state3;
     end
     end
  state4: begin
     byte_received = 1'b0;
     ack_prep = 1'b0;
     check_ack = 1'b1;
     ack_done = 1'b0;
     enable_byte = 1'b0;
     if (falling_edge_found == 1) begin
        nextstate = state5;
     end else begin
        nextstate = state4;
     end
     end
  state5: begin
     byte_received = 1'b0;
     ack_prep = 1'b0;
     check_ack = 1'b0;
     ack_done = 1'b1;
     enable_byte = 1'b0;
     if (stop_found == 1) begin
        nextstate = idle;
     end else begin
        nextstate = state6;
     end
     end
 state6: begin
     byte_received = 1'b0;
     ack_prep = 1'b0;
     check_ack = 1'b0;
     ack_done = 1'b1;
     enable_byte = 1'b0;
     if (stop_found == 1) begin
        nextstate = idle;
     end else begin
        nextstate = state1;
     end
     end
  default:begin
        byte_received = 1'b0;
        ack_prep = 1'b0;
        check_ack = 1'b0;
        ack_done = 1'b0;
        enable_byte = 1'b0;
        nextstate = idle; 
     end
  endcase
end
endmodule
