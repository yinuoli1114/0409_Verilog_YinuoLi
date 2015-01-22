// $Id: $
// File name:   controller.sv
// Created:     10/8/2014
// Author:      Ikeme Osi-Ogbu
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: controller block 

module controller
(
  input wire clk,
  input wire n_rst,
  input wire stop_found,
  input wire start_found,
  input wire byte_received,
  input wire ack_prep,
  input wire check_ack,
  input wire ack_done,
  input wire rw_mode,
  input wire address_match,
  input wire sda_in,
  output reg rx_enable,
  output reg tx_enable,
  output reg read_enable,
  output reg write_enable
  output reg [1:0] sda_mode,
  output reg load_data
);


typedef enum bit[3:0]
{IDLE, START_BYTE, BYTE_REC, ACK_SLAVE1, ACK_SLAVE2, ACK_SLAVE3, LOAD_DATA, SEND_DATA, DATA_LOAD_NXT, MASTER_ACK, MASTER_DONE, NACK_SLAVE1, NACK_SLAVE2, NACK_SLAVE3} state_type;

state_type state;
state_type nextstate;

always @ (posedge clk,negedge n_rst) begin
    if (n_rst == 0) begin
         state <= IDLE;
    end else begin
          state <= nextstate;
    end
end

always_comb begin
rx_enable = 1'b0;
     tx_enable = 1'b0;
     read_enable = 1'b0;
     sda_mode = 2'b00;
     load_data = 1'b0;
 nextstate = state;
 case (state)
   IDLE: begin
     rx_enable = 1'b0;
     tx_enable = 1'b0;
     read_enable = 1'b0;
     sda_mode = 2'b00;
     load_data = 1'b0;
     if (start_found == 1) begin
        nextstate = START_BYTE;
     end else begin
        nextstate = IDLE;
     end
     end
  START_BYTE: begin
     rx_enable = 1'b1;
     tx_enable = 1'b0;
     read_enable = 1'b0;
     sda_mode = 2'b00;
     load_data = 1'b0;
     if (byte_received == 1) begin
           nextstate = BYTE_REC;
        end else begin
           nextstate = START_BYTE;
        end
   end
 BYTE_REC: begin
     rx_enable = 1'b0;
     tx_enable = 1'b0;
    read_enable = 1'b0;
     sda_mode = 2'b00;
     load_data = 1'b0;
     if ((address_match & rw_mode) == 1) begin
        nextstate = ACK_SLAVE1;
     end else if ((address_match | rw_mode) == 1) begin
        nextstate = NACK_SLAVE1;
     end else begin
        nextstate = BYTE_REC;
     end
     end
  ACK_SLAVE1:begin
     rx_enable = 1'b0;
     tx_enable = 1'b0;
     read_enable = 1'b0;
     sda_mode = 2'b00;
     load_data = 1'b0;
     if(ack_prep == 1)begin
     nextstate = ACK_SLAVE2;
     end else begin 
     nextstate = ACK_SLAVE1;
     end 
     end

ACK_SLAVE2:begin
     rx_enable = 1'b1;
     tx_enable = 1'b0;
     read_enable = 1'b0;
     sda_mode = 2'b01;
     load_data = 1'b0;
     if (check_ack == 1)begin
     nextstate = ACK_SLAVE3;
     end else begin 
     nextstate = ACK_SLAVE2;
     end 
     end

ACK_SLAVE3:begin
     rx_enable = 1'b0;
     tx_enable = 1'b0;
    read_enable = 1'b0;
     sda_mode = 2'b01;
     load_data = 1'b0;
     if(ack_done == 1)begin
     nextstate = LOAD_DATA;
     end else begin 
     nextstate = ACK_SLAVE3;
     end 
     end

  MASTER_DONE: begin
     rx_enable = 1'b0;
     tx_enable = 1'b0;
    read_enable = 1'b0;
     sda_mode = 2'b00;
     load_data = 1'b0;
     if (start_found == 1) begin
        nextstate = START_BYTE;
     end else if (stop_found == 1) begin
        nextstate = IDLE;
     end else begin
        nextstate = MASTER_DONE;
     end
     end
  LOAD_DATA: begin
     rx_enable = 1'b0;
     tx_enable = 1'b0;
    read_enable = 1'b0;
     sda_mode = 2'b00;
     load_data = 1'b1;
     nextstate = SEND_DATA;
     end
  //LOAD_DATA2: begin
   //  rx_enable = 1'b0;
    // tx_enable = 1'b0;
    // read_enable = 1'b0;
    // sda_mode = 2'b00;
    // load_data = 1'b1;
   //  nextstate = ENABLE_DATA;
   //  end
  SEND_DATA: begin
     rx_enable = 1'b0;
     tx_enable = 1'b1;
     read_enable = 1'b0;
     sda_mode = 2'b11;
     load_data = 1'b0;
     if (ack_prep == 1) begin
        nextstate = MASTER_ACK;
     end else begin
        nextstate = SEND_DATA;
     end
     end
  MASTER_ACK: begin
     rx_enable = 1'b0;
     tx_enable = 1'b0;
    read_enable = 1'b0;
     sda_mode = 2'b00;
     load_data = 1'b0;
     if ((check_ack == 1)&(sda_in==0)) begin
        nextstate = DATA_LOAD_NXT;
     end else if ((check_ack == 1)&(sda_in==1)) begin
        nextstate = MASTER_DONE;
     end
     end
  DATA_LOAD_NXT: begin
     rx_enable = 1'b0;
     tx_enable = 1'b0;
     read_enable = ack_done;
     sda_mode = 2'b00;
     load_data = 1'b0;
     if (ack_done == 1) begin
        nextstate = LOAD_DATA;
     end else begin
        nextstate = DATA_LOAD_NXT;
     end
     end

  NACK_SLAVE1: begin
     rx_enable = 1'b0;
     tx_enable = 1'b0;
     read_enable = 0;
     sda_mode = 2'b00;
     load_data = 1'b0;
     if (ack_prep == 1) begin
        nextstate = NACK_SLAVE2;
     end else begin
        nextstate = NACK_SLAVE1;
     end
     end

NACK_SLAVE2: begin
     rx_enable = 1'b1;
     tx_enable = 1'b0;
     read_enable = 0;
     sda_mode = 2'b01;
     load_data = 1'b0;
     if (check_ack == 1) begin
        nextstate = NACK_SLAVE3;
     end else begin
        nextstate = NACK_SLAVE2;
     end
     end

NACK_SLAVE3: begin
     rx_enable = 1'b0;
     tx_enable = 1'b0;
     read_enable = 0;
     sda_mode = 2'b10;
     load_data = 1'b0;
     if (ack_done == 1) begin
        nextstate = MASTER_DONE;
     end else begin
        nextstate = NACK_SLAVE3;
     end
     end
  
   default: begin
           nextstate = IDLE;
           rx_enable = 1'b0;
           tx_enable = 1'b0;
           read_enable = 1'b0;
           sda_mode = 2'b00;
           load_data = 1'b0;
      end
  endcase
end
endmodule
 
  

