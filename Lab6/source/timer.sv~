// $Id: $
// File name:   timer.sv
// Created:     10/9/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: timer

module timer
  (
   input wire clk,
   input wire n_rst,
   input wire rising_edge_found,
   input wire falling_edge_found,
   input wire stop_found,
   input wire start_found,
   output wire byte_received,
   output wire ack_prep,
   output wire check_ack,
   output wire ack_done
   );
  /* reg [3:0]   count_out;
   reg 	       rollover_flag;
   reg byte_received_r;
   reg ack_prep_r;
   reg check_ack_r;
   reg ack_done_r;
   assign byte_received = byte_received_r;
   assign ack_prep = ack_prep_r;
   assign check_ack = check_ack_r;
   assign ack_done = ack_done_r;
   */
   reg [3:0]   count_out;
   flex_counter #(4) EIGHT
     (
      .clk(clk),
      .n_rst(n_rst),
      .clear(stop_found|start_found|ack_done),
      .count_enable(rising_edge_found),
      .rollover_val(4'b1001),
      .count_out(count_out),
      .rollover_flag(rollover_flag)
      );
   

assign byte_received=(count_out==8);
assign ack_prep=((count_out==8)&falling_edge_found);
assign check_ack=(count_out==9);
assign ack_done=((count_out==9)&falling_edge_found);

    /* 
   typedef enum bit [2:0] {idle,count_s,byte_received_s,ack_prep_s,check_ack_s,ack_done_s}stateType;
   stateType state;
   stateType nstate;

   always_ff @ (posedge clk, negedge n_rst)
     begin:StateReg
	if(n_rst==0)
	  begin
	     state <= idle;
	  end else begin
	     state <= nstate;
	  end
     end
   always_comb
     begin:N_logic
	byte_received_r = 0;
	ack_prep_r = 0;
	check_ack_r = 0;
	ack_done_r = 0;
	nstate = state;
	
	case(state)
	  idle:begin
	     if(start_found == 1)begin
		nstate = count_s;
	     end else begin
		nstate = idle;
	     end
	  end
	  count_s:begin
	     if(count_out == 4'b1000)begin
		nstate = byte_received_s;
		//byte_received_r = 1;
	     end else begin
		nstate = count_s;
	     end // else: !if(count_out == 8)
	  end // case: count_s
	  byte_received_s:begin
	     byte_received_r = 1;
	     if(falling_edge_found == 1)begin
		nstate = ack_prep_s;
	        //ack_prep_r = 1;
	     end else begin
	        nstate = byte_received_s;
		end
		end
		
		
	     
	  ack_prep_s:begin
		ack_prep_r = 1;
	     if(rising_edge_found == 1)begin
	      	nstate = check_ack_s;
	        //check_ack_r = 1;
	     end else begin
		nstate = ack_prep_s;
	     end // else: !if(rising_edge_found == 1)
	  end // case: ack_prep_s
	  check_ack_s:begin
	     check_ack_r = 1;
	     if(falling_edge_found == 1)begin
		nstate = ack_done_s;
	        //ack_done_r = 1;
	     end else begin
		nstate = check_ack_s;
	     end
	  end
	  ack_done_s:begin
	     ack_done_r = 1;
	     if(rising_edge_found==1)begin
	     nstate = count_s;
	     end else begin
	     nstate = ack_done_s;
	     end
	  end
	
	endcase // case (state)
     end // block: N_logic
*/
endmodule; // timer

	     
		
		
		
	  
	  
