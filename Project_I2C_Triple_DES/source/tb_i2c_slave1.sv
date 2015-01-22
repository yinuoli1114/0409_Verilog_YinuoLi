// $Id: $
// File name:   tb_i2c_slave.sv
// Created:     10/22/2014
// Author:      Ikeme Osi-Ogbu
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: i2c slave tb

`timescale 1ns/1ns
module tb_i2c_slave();  
   parameter CLKGEN = 10;   
   reg tb_clk;
   reg tb_rst;
   reg tb_m_scl_out;
   reg tb_m_scl_in;
   reg tb_m_sda_in;
   reg tb_m_sda_out;   
   reg tb_s_scl_out;
   reg tb_s_scl_in;
   reg tb_s_sda_in;
   reg tb_s_sda_out;      
   reg tb_write_enable;
   reg [7:0] tb_write_data;  
   reg tb_fifo_empty;
   reg tb_fifo_full;  

 `define NUM_TEST_CASES 9
	
	reg [3:0] test_number;
   
   i2c_bus Mbus_map
   (
      .scl_write({tb_s_scl_out,tb_m_scl_out}), 
      .sda_write({tb_s_sda_out,tb_m_sda_out}),     
      .scl_read({tb_s_scl_in,tb_m_scl_in}),
      .sda_read({tb_s_sda_in,tb_m_sda_in})
   );
   
   i2c_slave DUT
   (
      .clk(tb_clk),
      .n_rst(tb_rst),
      .scl(tb_s_scl_in),
      .sda_in(tb_s_sda_in),
      .write_enable(tb_write_enable),
      .write_data(tb_write_data),   
      .sda_out(tb_s_sda_out),
      .fifo_empty(tb_fifo_empty),
      .fifo_full(tb_fifo_full)
   );

   always begin
      tb_clk = 0;
      #(CLKGEN * 0.5);
      tb_clk = 1'b1;
      #(CLKGEN * 0.5);
   end     
   
   always begin
      tb_m_scl_out = 1'b0;
      #200;      
      tb_m_scl_out = 1'b1;
      #100;
   end
   
   initial
   begin      
      tb_m_sda_out = 1'b1;
      tb_write_data = 8'h00;
      tb_write_enable = 0;
      tb_rst = 1'b1;
      #5;
	   tb_rst = 0;
      #5;
	   tb_rst = 1'b1;  
      $display("reset"); 
      
      #250;
      tb_write_data = 8'h0F;
      tb_m_sda_out = 0;
       tb_write_enable = 1;
      #30;
      tb_write_enable = 0; 

   for(test_number = 0; test_number < `NUM_TEST_CASES; test_number = test_number + 1)
		begin
    if(test_number == 4 | test_number == 5 | test_number == 6 )begin
			tb_m_sda_out = 0;
			end else begin
      tb_m_sda_out = 1;
      end
    #300;
   end
   tb_m_sda_out = 0;
   
   #4000;
    tb_write_enable = 1;
    tb_write_data = 8'h4F;
     #20;
    tb_write_enable = 0; 

   end
endmodule
