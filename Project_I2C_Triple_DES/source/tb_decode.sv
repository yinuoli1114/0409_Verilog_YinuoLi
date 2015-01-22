// $Id: $
// File name:   tb_decode.sv
// Created:     10/8/2014
// Author:      Ikeme Osi-Ogbu
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: test bench for decode block
`timescale 1 ns/1 ns
module tb_decode
();

  wire test_rst;
  wire test_clk;
  wire test_sda_in;
  wire test_scl;
  wire [7:0] test_starting_byte;
  wire test_rw_mode;
  wire test_address_match;
  wire test_stop_found;
  wire test_start_found;


	`define NUM_TEST_CASES 40
	
	reg [5:0] test_number;
	reg tmp_sda_in;
  reg tmp_scl;
  reg [7:0] tmp_starting;
  reg tmp_rst;
  reg tmp_clk;
 
 

	decode DUT(.clk(test_clk), .n_rst(test_rst), .scl(test_scl), .sda_in(test_sda_in), .starting_byte(test_starting_byte), .rw_mode   (test_rw_mode), .address_match(test_address_match), .stop_found(test_stop_found), .start_found(test_start_found));
	
	assign test_sda_in = tmp_sda_in;
  assign test_clk = tmp_clk;
  assign test_rst = tmp_rst;
  assign test_scl = tmp_scl;
  assign test_starting_byte = tmp_starting;
 

always begin
 	tmp_clk <= 0;
 	#5ns;
 	tmp_clk <= 1;
  #5ns;
  end
  


initial
	begin
	  #0.5ns
		for(test_number = 0; test_number < `NUM_TEST_CASES; test_number = test_number + 1)
		begin
			if(test_number == 0 | test_number == 20)begin
			tmp_rst = 0;
			end else begin
      tmp_rst = 1;
      end
      
      if(test_number == 3 | test_number == 15 | test_number == 20 | test_number == 25 | test_number == 34 )begin
			tmp_scl = 0;
			end else begin
      tmp_scl = 1;
      end

       if(test_number == 0 | test_number == 6 | test_number == 12 | test_number == 17 | test_number == 21 | test_number ==27 | test_number == 30 | test_number == 33 | test_number == 36 | test_number == 39 )begin
			tmp_sda_in = 0;
			end else begin
      tmp_sda_in = 1;
      end
     
      if(test_number == 0) begin
      tmp_starting = 8'b00000000;
      end else if(test_number == 1) begin
      tmp_starting = 8'b00000001;
      end else if(test_number == 4) begin
      tmp_starting = 8'b00000010;
      end else if(test_number == 6) begin
      tmp_starting = 8'b00000100;
       end else if(test_number == 8) begin
      tmp_starting = 8'b00001000;
       end else if(test_number == 11) begin
      tmp_starting = 8'b00010000;
       end else if(test_number == 14) begin
      tmp_starting = 8'b00100000;
       end else if(test_number == 19) begin
      tmp_starting = 8'b01000000;
       end else if(test_number == 22) begin
      tmp_starting = 8'b10000000;
        end else if(test_number == 26) begin
      tmp_starting = 8'b11110011;
       end else begin
      tmp_starting = 8'b11110000;
      end
       
			// wait to allow design to process input
			#10ns;
			 
		end
	end
endmodule
