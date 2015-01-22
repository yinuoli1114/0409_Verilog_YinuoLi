// $Id: $
// File name:   tb_flex_counter.sv
// Created:     9/17/2014
// Author:      Ikeme Osi-Ogbu
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: flexible counter tb


`timescale 1 ns/1 ns
module tb_flex_counter
();

  wire test_reset;
  wire test_clk;
  wire test_enable;
  wire test_flag;
	wire [3:0] test_input;
wire [3:0] test_count_out;
wire test_clear;


	`define NUM_TEST_CASES 32
	
	reg [4:0] test_number;
	reg [3:0] tmp_input;
    //    reg [3:0] tmp_count_out;
  reg tmp_rst;
  reg tmp_enable;
  reg tmp_clk;
reg temp_clear;
 
 

	flex_counter DUT(.clk(test_clk), .n_rst(test_reset),.clear(test_clear),.count_enable(test_enable), .rollover_val(test_input), .rollover_flag(test_flag),.count_out(test_count_out));
	
	assign test_input = tmp_input;
	assign test_enable = tmp_enable;
  assign test_clk = tmp_clk;
  assign test_reset = tmp_rst;
  assign test_clear = temp_clear;
always begin
 	tmp_clk <= 0;
 	#1.25ns;
 	tmp_clk <= 1;
  #1.25ns;
  end





initial
	begin
tmp_rst = 0;
tmp_input = 4'b1001;
tmp_enable = 0;
temp_clear = 1;
#10;
temp_clear = 0;
		for(test_number = 0; test_number < `NUM_TEST_CASES; test_number = test_number + 1)
		begin
			if(test_number == 0 | test_number == 17)begin
			tmp_rst = 0;
                          //if(test_number == 0 | test_number = 5)begin
                          // temp_clear = 1;
                            //  end else begin
                           //temp_clear = 0;
                         //        end
			end else begin
      tmp_rst = 1;
//temp_clear = 1;
      end
  
//temp_clear = 0;

      if(test_number == 5) begin
			tmp_enable = 0;
			end else begin
      tmp_enable = 1;
      end
      
      tmp_input = 4'b1111;
			// wait to allow design to process input
			#2.5ns;
  //   #15ns;
//temp_clear = 1;
//#2.5
//temp_clear = 0;
  // tmp_input = 4'b1000;
//#2.5ns;
		end
	end
endmodule
