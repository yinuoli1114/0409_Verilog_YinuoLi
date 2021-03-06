// $Id: $
// File name:   controller.sv
// Created:     10/21/2014
// Author:      Niveah Tefillah Abraham
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: Controller

module main_controller
(
	input wire clk, 
	input wire n_rst, 
	input wire i2c_stop,  
	input wire i2c_rw, 
	input wire data_ready, 
	input wire next_data,
	output wire des_ready,
	output wire output_load_enable,
	output wire dir_io_sel, 
	output wire ag_enable,
	output wire key_activate_key1,
	output wire key_activate_key2,
	output wire output_ready
 
);
  
typedef enum bit[3:0] {IDLE, KEY1, WAIT_KEY2, KEY2, DECRYPT, READ_DATA, READ_MODE, DEC, ENC_DONE, DEC_DONE, ENC_DATA, ENCRYPT, ENC, WRITE_MODE} StateType;
StateType next_state, present_state; 
reg ready;  
reg io_sel;
reg ag;
reg activate_key1;
reg activate_key2;
reg output_load;
reg out_ready;


   
always_ff @ (posedge clk, negedge n_rst)
begin
	if (!n_rst) begin
		present_state <= IDLE;
	end else begin
		present_state <= next_state;
	end
end

assign des_ready = ready;
assign dir_io_sel = io_sel;
assign key_activate_key1 = activate_key1;
assign key_activate_key2 = activate_key2;
assign ag_enable = ag;
assign output_load_enable = output_load;
assign output_ready = out_ready;

always_comb begin
	case(present_state)
		IDLE: //idle state
		begin
			ready = 1'b0; 
			ag = 1'b0;
			output_load = 1'b0;
			io_sel = 1'b0;
			activate_key1 = 1'b0;
			activate_key2 = 1'b0;
			out_ready = 1'b0;

			if(data_ready == 1'b1) begin
				next_state = KEY1;
			end else begin
				next_state = IDLE;
			end
		end 

		KEY1: // getting the key into key1 block
		begin
			ready = 1'b0; 
			ag = 1'b0;
			output_load = 1'b0;
			io_sel = 1'b0;
			activate_key1 = 1'b1;
			activate_key2 = 1'b0;
			out_ready = 1'b0;
			next_state = WAIT_KEY2;
		end

		WAIT_KEY2: // waiting for key1 data ready
		begin
			ready = 1'b0; 
			ag = 1'b0;
			output_load = 1'b0;
			io_sel = 1'b0;
			activate_key1 = 1'b0;
			activate_key2 = 1'b0;
			out_ready = 1'b0;
			if(data_ready == 1) begin
				next_state = KEY2;
			end else begin
				next_state = WAIT_KEY2;
			end
		end

		KEY2: 
		begin
			ready = 1'b0; 
			ag = 1'b0;
			output_load = 1'b0;
			io_sel = 1'b0;
			activate_key1 = 1'b0;
			activate_key2 = 1'b1;
			out_ready = 1'b0;
			if(i2c_rw == 1'b1) begin
				next_state = READ_DATA;
			end else begin
				next_state = ENC_DATA;
			end
		end
		
		READ_DATA:
		begin
			ready =1'b0;
			ag = 1'b1;
			output_load = 1'b0;
			io_sel = 1'b1;
			activate_key1 = 1'b0;
			activate_key2 = 1'b0;
			out_ready = 1'b0;
			next_state = READ_MODE;
		end

		READ_MODE:
		begin
			ready = 1'b0; 
			ag = 1'b0;
			output_load = 1'b0;
			io_sel = 1'b1;
			activate_key1 = 1'b0;
			activate_key2 = 1'b0;
			out_ready = 1'b0;
			if(data_ready == 1) begin
				next_state = DECRYPT;
			end else begin
				next_state = READ_MODE;
			end
		end

		DECRYPT:
		begin
			ready = 1'b1; 
			ag = 1'b0;
			output_load = 1'b0;
			io_sel = 1'b1;
			activate_key1 = 1'b0;
			activate_key2 = 1'b0;
			out_ready = 1'b0;
			next_state = DEC;   
		end

		DEC:
		begin
			ready = 1'b0;  
			ag = 1'b0;
			output_load = 1'b0;
			io_sel = 1'b1;
			activate_key1 = 1'b0;
			activate_key2 = 1'b0;
			out_ready = 1'b0;
			if(next_data == 1) begin
				next_state = DEC_DONE;
			end else begin
				next_state = DEC;
			end
		end

		ENC_DATA:
		begin
			ready = 1'b0;
			ag = 1'b0;
			output_load = 1'b0;
			io_sel = 1'b0;
			activate_key1 = 1'b0;
			activate_key2 = 1'b0;
			out_ready = 1'b0;
			if(data_ready == 1) begin
				next_state = ENCRYPT;
			end else begin
				next_state = ENC_DATA;
			end
		end

		ENCRYPT:
		begin
			ready = 1'b1;
			ag = 1'b0;
			output_load = 1'b0;
			io_sel = 1'b0;
			activate_key1 = 1'b0;
			activate_key2 = 1'b0;
			out_ready = 1'b0;
			next_state = ENC;
		end

		ENC:
		begin
			ready = 1'b0; 
			ag = 1'b0;
			output_load = 1'b0;
			io_sel = 1'b0;
			activate_key1 = 1'b0;
			activate_key2 = 1'b0;
			out_ready = 1'b0;
			if(next_data == 1'b1) begin
				next_state = WRITE_MODE;
			end else begin
				next_state = ENC;
			end
		end
		
		WRITE_MODE:
		begin	
			ready = 1'b0;
			ag = 1'b1;
			output_load = 1'b0;
			io_sel = 1'b0;
			output_load = 1'b1;
			activate_key1 = 1'b0;
			activate_key2 = 1'b0;
			out_ready = 1'b0;
			next_state = ENC_DONE;
		end

		ENC_DONE:
		begin
			ready = 1'b0;  
			ag = 1'b0; 
			output_load = 1'b1;
			io_sel = 1'b0;
			activate_key1 = 1'b0;
			activate_key2 = 1'b0;	
			out_ready = 1'b0;
			if(i2c_stop == 1'b1 ) begin
				next_state = IDLE;
			end else begin
				next_state = ENC_DATA;
			end
		end

		DEC_DONE:
		begin
			ready = 1'b0;  
			ag = 1'b0; 
			output_load = 1'b1;
			io_sel = 1'b0;
			activate_key1 = 1'b0;
			activate_key2 = 1'b0;	
			out_ready = 1'b1;
			if(i2c_stop == 1'b1 ) begin
				next_state = IDLE;
			end else begin
				next_state = READ_MODE;
			end
		end
		
		default:
		begin
			ready = 1'b0;  
			ag = 1'b0;
			output_load = 1'b0;
			io_sel = 1'b0;
			activate_key1 = 1'b0;
			activate_key2 = 1'b0;
			out_ready = 1'b0;
			next_state = IDLE; 
		end
	endcase
end

endmodule


