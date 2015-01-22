// $Id: $
// File name:   tb_i2c_slave.sv
// Created:     10/18/2014
// Author:      Fangda Li
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: tb_i2c_slave

`timescale 1ns / 10ps

module tb_i2c_slave
();

  //Slave ports
  reg clk;
  reg n_rst;
  reg scl;
  reg sda_in;
  reg write_enable;
  reg [7:0] write_data;
  wire sda_out;
  wire fifo_empty;
  wire fifo_full;
  
  //Master ports
  reg tb_scl_in;
  reg tb_sda_in;
  reg tb_scl_out;
  reg tb_sda_out;


	// Define parameters
	parameter CLK_PERIOD				= 10;
  parameter SCL_PERIOD    = 300;
	localparam NUM_TEST_CASES = 4;
	
	localparam NUM_FIFO_DATA = 10;
	reg [7:0] fifo_in = 8'b01100110;
	integer fifo_data;
	
	localparam BIT_COUNT = 8;
	reg [7:0] byte_in;
	integer bit_data;
	
	//Clock generations
	always
	begin : CLK_GEN
		clk = 1'b0;
		#(CLK_PERIOD / 2);
		clk = 1'b1;
		#(CLK_PERIOD / 2);
	end 
	
	always
	begin : SCL_GEN
		tb_scl_out = 1'b0;
		#(SCL_PERIOD * 2 / 3);
		tb_scl_out = 1'b1;
		#(SCL_PERIOD / 3);
	end 

i2c_slave DUT (
          .clk(clk),
          .n_rst(n_rst),
          .scl(scl),
          .sda_in(sda_in),
          .write_enable(write_enable),
          .write_data(write_data),
          .sda_out(sda_out),
          .fifo_empty(fifo_empty),
          .fifo_full(fifo_full)
          );
 
i2c_bus DUT1 (
          .sda_write({sda_out,tb_sda_out}),
          .sda_read({sda_in,tb_sda_in}),
          .scl_read({scl,tb_scl_in}),
          .scl_write({1'bz,tb_scl_out})
          );

	// Actual test bench process
	initial
	begin : TEST_PROC
		// Initilize all inputs
		n_rst				= 1'b1; // Initially inactive
		tb_sda_out	= 1'b1; // Initially high
		write_enable	= 1'b0; // Initially inactive
		
		// Get away from Time = 0
		#0.1; 
		
		// n_rst all first
		n_rst = 1'b0;
		#1;
		n_rst = 1'b1;
		
		// Push data into FIFO
    for(fifo_data = 1; fifo_data <= NUM_FIFO_DATA; fifo_data++)
		begin		
		@(negedge clk);
		write_data = fifo_in;
		write_enable = 1'b1;
		@(negedge clk);
		write_enable = 1'b0;
		fifo_in = fifo_in + 8'b00000001;
		end
		#CLK_PERIOD;
		
		// Send start byte
		@(posedge tb_scl_out);
		#50;
		tb_sda_out = 1'b0;
		#100;
		tb_sda_out = 1'b1;
		#50;
		byte_in = 8'b11110001;
    for(bit_data = 1; bit_data <= BIT_COUNT; bit_data++)
		begin
		tb_sda_out = byte_in[8 - bit_data];
		@(negedge tb_scl_out);
		#100;					
		end
		tb_sda_out = 1'b1;
		
		// Wait for one byte data out from slave
		for(bit_data = 1; bit_data <= BIT_COUNT + 1; bit_data++)
		begin
		@(posedge tb_scl_out); //8
		end
		
		// Master ACK
		@(negedge tb_scl_out);
		tb_sda_out = 1'b0;
		@(posedge tb_scl_out);
		@(negedge tb_scl_out);
		tb_sda_out = 1'b1;
		
		// Wait for one byte data out from slave
		for(bit_data = 1; bit_data <= BIT_COUNT + 1; bit_data++)
		begin
		@(posedge tb_scl_out); //8
		end
	
		
		// Master NACK
		@(negedge tb_scl_out);
		tb_sda_out = 1'b1;
		@(posedge tb_scl_out);
		@(negedge tb_scl_out);
		// Master sends stop condition
		tb_sda_out = 1'b0;
		@(posedge tb_scl_out);
		#50;
		tb_sda_out = 1'b1;
		
	end	
          
endmodule