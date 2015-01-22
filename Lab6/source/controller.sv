// $Id: $
// File name:   controller.sv
// Created:     10/19/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: controller for i2c

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
   output wire rx_enable,
   output wire tx_enable,
   output wire read_enable,
   output wire [1:0] sda_mode,
   output wire load_data
   );
   typedef enum bit [3:0] {idle,start_byte_tsf,start_byte_rec,slave_ack1,slave_ack2,slave_ack3,data_load,data_send,master_ack,next_data_load,master_done,slave_nack1,slave_nack2,slave_nack3} stateType;
   stateType state;
   stateType nstate;
   
   reg rx_enable_r;
   reg tx_enable_r;
   reg read_enable_r;
   reg [1:0] sda_mode_r;
   reg 	     load_data_r;
   

   assign rx_enable = rx_enable_r;
   assign tx_enable = tx_enable_r;
   assign read_enable = read_enable_r;
   assign sda_mode = sda_mode_r;
   assign load_data = load_data_r;
   
   


   always_ff @ (posedge clk, negedge n_rst)
     begin:stateREg
	if(n_rst == 0)
	  begin
	     state <= idle;
	  end else begin
	     state <= nstate;
	  end
     end
   always_comb
     begin:N_logic
	rx_enable_r = 0;
	tx_enable_r = 0;
	read_enable_r = 0;
	sda_mode_r = 2'b00;
	load_data_r = 0;
	nstate = state;
	
	case(state)
	  idle:begin
	     rx_enable_r = 0;
	     tx_enable_r = 0;
	     read_enable_r = 0;
	     sda_mode_r = 2'b00;
	     load_data_r = 0;
	     if(start_found == 1)begin
		nstate = start_byte_tsf;
	     end else begin
		nstate = idle;
	     end
	  end // case: idle
	  start_byte_tsf:begin
	     rx_enable_r = 1;
	     tx_enable_r = 0;
	     read_enable_r = 0;
	     sda_mode_r = 2'b00;
	     load_data_r = 0;
	     if(byte_received == 1)begin
		nstate = start_byte_rec;
	     end else begin
		nstate = start_byte_tsf;
	     end
	     end
	   start_byte_rec:begin
	     rx_enable_r = 0;
	     tx_enable_r = 0;
	     read_enable_r = 0;
	     sda_mode_r = 2'b00;
	     load_data_r = 0;
	     if(address_match ==1 & rw_mode == 1)begin
		nstate = slave_ack1;
	     end else begin
		nstate = start_byte_rec;
	     end
	     end
	   slave_ack1:begin
	     rx_enable_r = 0;
	     tx_enable_r = 0;
	     read_enable_r = 0;
	     sda_mode_r = 2'b00;
	     load_data_r = 0;
	     if(ack_prep == 1)begin
		nstate = slave_ack2;
	     end else begin
		nstate = slave_ack1;
	     end
	     end
	   slave_ack2:begin
	     rx_enable_r = 1;
	     tx_enable_r = 0;
	     read_enable_r = 0;
	     sda_mode_r = 2'b01;
	     load_data_r = 0;
	     if(check_ack == 1)begin
		nstate = slave_ack3;
	     end else begin
		nstate = slave_ack2;
	     end
	     end
	   slave_ack3:begin
	     rx_enable_r = 0;
	     tx_enable_r = 0;
	     read_enable_r = 0;
	     sda_mode_r = 2'b01;
	     load_data_r = 0;
	     if(ack_done == 1)begin
		nstate = data_load;
	     end else begin
		nstate = slave_ack3;
	     end
	     end
	   data_load:begin
	     rx_enable_r = 0;
	     tx_enable_r = 0;
	     read_enable_r = 0;
	     sda_mode_r = 2'b00;
	     load_data_r = 1;
	    
		nstate = data_send;
	   
	     end
	   data_send:begin
	     rx_enable_r = 0;
	     tx_enable_r = 1;
	     read_enable_r = 0;
	     sda_mode_r = 2'b11;
	     load_data_r = 0;
	     if(ack_prep == 1)begin
		nstate = master_ack;
	     end else begin
		nstate = data_send;
	     end
	     end
	   master_ack:begin
	     rx_enable_r = 0;
	     tx_enable_r = 0;
	     read_enable_r = 0;
	     sda_mode_r = 2'b00;
	     load_data_r = 0;
	     if(sda_in==1 & check_ack==1)begin
		nstate = master_done;
	     end else if(sda_in==0 & check_ack==1)begin
		nstate = next_data_load;
	     end else begin
		nstate = master_ack;
	     end
	   end // case: master_ack
	    next_data_load:begin
	     rx_enable_r = 0;
	     tx_enable_r = 0;
	     read_enable_r = ack_done;
	     sda_mode_r = 2'b00;
	     load_data_r = 0;
	     if(ack_done == 1)begin
		nstate = data_load;
	     end else begin
		nstate = next_data_load;
	     end
	     end
	   master_done:begin
	     rx_enable_r = 0;
	     tx_enable_r = 0;
	     read_enable_r = 0;
	     sda_mode_r = 2'b00;
	     load_data_r = 0;
	     if(stop_found == 1)begin
		nstate = idle;
	     end else begin
		nstate = master_done;
	     end
	     end
	     
        
	endcase // case (state)
     end // block: N_logic
endmodule // controller

	  
	  
	     
	     
	  
	     
	     
	   
	     
