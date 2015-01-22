// $Id: $
// File name:   tb_tx_fifo.sv
// Created:     10/8/2014
// Author:      Ikeme Osi-Ogbu
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: tx fifo test bench 
`timescale 1 ns/1 ns
module tb_tx_fifo
();

  wire test_rst;
  wire test_clk;
  wire test_renable;
  wire test_wenable;
  wire [7:0] test_write;
  wire [7:0] test_read;
  wire test_full;
  wire test_empty;

	`define NUM_TEST_CASES 40
	
	reg [5:0] test_number;
	reg tmp_renable;
  reg tmp_wenable;
  reg [7:0] tmp_write;
  reg tmp_rst;
  reg tmp_clk;
 
 

	tx_fifo DUT(.clk(test_clk), .n_rst(test_rst), .read_enable(test_renable), .read_data(test_read), .fifo_empty(test_empty), .fifo_full(test_full), .write_enable(test_wenable), .write_data(test_write));
	
	assign test_renable = tmp_renable;
  assign test_clk = tmp_clk;
  assign test_rst = tmp_rst;
  assign test_wenable = tmp_wenable;
  assign test_write = tmp_write;
 

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
      
      if(test_number == 0 | test_number == 3 | test_number == 7  | test_number == 10 | test_number == 21 | test_number == 25 | test_number == 30 | test_number == 34 | test_number == 39)begin
			tmp_renable = 1;
			end else begin
      tmp_renable = 0;
      end

      if(test_number == 1 | test_number == 4 | test_number == 8  | test_number == 12  | test_number == 13  | test_number == 14  | test_number == 15  | test_number ==  16  | test_number == 17 | test_number == 18 | test_number == 19 | test_number == 23 )begin
			tmp_wenable = 1;
			end else begin
      tmp_wenable = 0;
      end
     
      if(test_number == 1) begin
      tmp_write = 8'b00000000;
      end else if(test_number == 3) begin
      tmp_write = 8'b00000001;
      end else if(test_number == 4) begin
      tmp_write = 8'b00000010;
      end else if(test_number == 8) begin
      tmp_write = 8'b00000100;
       end else if(test_number == 12) begin
      tmp_write = 8'b00001000;
       end else if(test_number == 16) begin
      tmp_write = 8'b00010000;
       end else if(test_number == 20) begin
      tmp_write = 8'b00100000;
       end else if(test_number == 24) begin
      tmp_write = 8'b01000000;
       end else if(test_number == 26) begin
      tmp_write = 8'b10000000;
        end else if(test_number == 29) begin
      tmp_write = 8'b11110011;
       end else begin
      tmp_write = 8'b11110000;
      end
       
			// wait to allow design to process input
			#10ns;
			
		end
	end
endmodule
