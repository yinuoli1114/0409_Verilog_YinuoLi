// $Id: $
// File name:   controller.sv
// Created:     10/8/2014
// Author:      Ikeme Osi-Ogbu
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: controller block 

module i2c_controller
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
  input wire data_ready,
  output reg rx_enable,
  output reg tx_enable,
 output reg read_enable,
 output reg write_enable,
  output reg [1:0] sda_mode,
  output reg load_data,
output reg i2c_rw
);


typedef enum bit[4:0]
{IDLE, START_BYTE, BYTE_REC, ACK_SLAVE1, ACK_SLAVE2, ACK_SLAVE3, LOAD_DATA, SEND_DATA, DATA_LOAD_NXT, MASTER_ACK, MASTER_DONE, NACK_SLAVE1, NACK_SLAVE2, NACK_SLAVE3, DATA_RECEIVE, ENABLE, LOAD_IN, WAIT_RX, SLAVE_ACK_RX, ACK_SLAVE_RX1, ACK_SLAVE_RX2, ACK_SLAVE_RX3, KEY_1, KEY_2, WAIT_RX_2, SLAVE_ACK_RX2} state_type;

state_type state;
state_type nextstate;
reg key = 0;
reg rw = 0;
assign i2c_rw = rw;

always @ (posedge clk,negedge n_rst) begin
    if (n_rst == 0) begin
         state <= IDLE;
    end else begin
          state <= nextstate;
    end
end

always_comb begin
write_enable = 0;
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
     
     if ((address_match & rw_mode ) == 1) begin
	rw = 1;
        nextstate = ACK_SLAVE1;
     end 
     else if (((address_match ==1) & (rw_mode==0)) == 1) begin
	rw = 0;
    	 nextstate = ACK_SLAVE_RX1;
     end else  begin
	rw = rw;
        nextstate = NACK_SLAVE1;
     //end else begin
      //  nextstate = BYTE_REC;
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
     
     if (ack_done == 1 )begin
     	nextstate = KEY_1;
     end else begin 
     	nextstate = ACK_SLAVE3;
     end 
end

ACK_SLAVE_RX1:begin
     rx_enable = 1'b0;
     tx_enable = 1'b0;
     read_enable = 1'b0;
     sda_mode = 2'b00;
     load_data = 1'b0;
     
     if(ack_prep == 1)begin
     nextstate = ACK_SLAVE_RX2;
     end else begin 
     nextstate = ACK_SLAVE_RX1;
     end 
     end

ACK_SLAVE_RX2:begin
     rx_enable = 1'b0;
     tx_enable = 1'b0;
     read_enable = 1'b0;
     sda_mode = 2'b01;
     load_data = 1'b0;
     
     if (check_ack == 1)begin
     nextstate = ACK_SLAVE_RX3;
     end else begin 
     nextstate = ACK_SLAVE_RX2;
     end 
     end

ACK_SLAVE_RX3:begin
     rx_enable = 1'b0;
     tx_enable = 1'b0;
    read_enable = 1'b0;
     sda_mode = 2'b01;
     load_data = 1'b0;
     
     if (ack_done == 1 )begin
     nextstate = DATA_RECEIVE;
     end else begin 
     nextstate = ACK_SLAVE_RX3;
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
        nextstate = SEND_DATA;
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
DATA_RECEIVE: begin
     rx_enable = 1'b1;// also from outside from controller. 
     tx_enable = 1'b0;
     read_enable = 0;
     sda_mode = 2'b00;
     load_data = 1'b0;
     
     if (byte_received == 1) begin
     nextstate = ENABLE;
     end 
     else if (start_found == 1) begin
     nextstate = START_BYTE;
     end 
     else if (stop_found == 1) begin
     nextstate = IDLE;
     end 
     else begin 
     nextstate = DATA_RECEIVE;
     end 
     end 
ENABLE: begin
     rx_enable = 1'b0;// also from outside from controller. 
     tx_enable = 1'b0;
     read_enable = 0;
     sda_mode = 2'b00;
     load_data = 1'b0;
     write_enable = 1;
     
	nextstate = LOAD_IN;
     end 
	
LOAD_IN: begin
     rx_enable = 1'b0;// also from outside from controller. 
     tx_enable = 1'b0;
     read_enable = 0;
     sda_mode = 2'b00;
     load_data = 1'b0;
     write_enable = 0;
     
	if(data_ready == 1 && rw == 1 && key == 0) begin
		nextstate = WAIT_RX_2;
		key = 1;
	end else if(data_ready == 1 && rw == 1 && key == 1) begin
		nextstate = LOAD_DATA;
		key = 0;
	end else if (ack_prep == 1) begin
		nextstate = WAIT_RX;
	end else begin 
		nextstate = LOAD_IN;
	end 
end 

     
WAIT_RX: begin
     rx_enable = 1'b0;// also from outside from controller. 
     tx_enable = 1'b0;
     read_enable = 0;
     sda_mode = 2'b00;
     load_data = 1'b0;
     
     if (check_ack == 1) begin
     nextstate = SLAVE_ACK_RX;
     end
     else begin
     nextstate = WAIT_RX;
     end 
     end 

SLAVE_ACK_RX: begin
	rx_enable = 1'b0;// also from outside from controller. 
	tx_enable = 1'b0;
	read_enable = 0;
	sda_mode = 2'b00;
	load_data = 1'b0;
	
	if (ack_done == 1) begin
		nextstate = DATA_RECEIVE;
	end else if (stop_found == 1)begin
		nextstate = IDLE;
	end 
	else begin
		nextstate = SLAVE_ACK_RX;
	end 
end 

KEY_1: begin
	rx_enable = 1'b0;// also from outside from controller. 
	tx_enable = 1'b0;
	read_enable = 0;
	sda_mode = 2'b00;
	load_data = 1'b0;
	
	nextstate = DATA_RECEIVE;
end
KEY_2: begin
	rx_enable = 1'b0;// also from outside from controller. 
	tx_enable = 1'b0;
	read_enable = 0;
	sda_mode = 2'b00;
	load_data = 1'b0;
	
	nextstate = DATA_RECEIVE;
end
WAIT_RX_2: begin
     rx_enable = 1'b0;// also from outside from controller. 
     tx_enable = 1'b0;
     read_enable = 0;
     sda_mode = 2'b00;
     load_data = 1'b0;
     
     if (check_ack == 1) begin
     nextstate = SLAVE_ACK_RX2;
     end
     else begin
     nextstate = WAIT_RX_2;
	end 
end
SLAVE_ACK_RX2: begin
	rx_enable = 1'b0;// also from outside from controller. 
	tx_enable = 1'b0;
	read_enable = 0;
	sda_mode = 2'b00;
	load_data = 1'b0;
	
	if (ack_done == 1) begin
		nextstate = DATA_RECEIVE;
	end else if (stop_found == 1)begin
		nextstate = IDLE;
	end 
	else begin
		nextstate = SLAVE_ACK_RX2;
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
 
  

