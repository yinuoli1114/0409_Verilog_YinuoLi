// $Id: mg 116$
// File name:   tb_encryptor_sram.sv
// Created:     12/11/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: testbench for top level without the SRAM

`timescale 1 ns / 10 ps

module tb_encryptor_sram ();
	parameter CLK_PERIOD = 6;
	parameter SCL_PERIOD = 300;
	localparam BIT_COUNT = 8;

	// System ports
	reg tb_clk;
	reg tb_n_rst;
	// test case var
	reg [63:0] tb_key1;
	reg [63:0] tb_key2;
	reg [63:0] tb_input;
	reg [7:0] byte_in;
	// I2C ports
	reg tb_sda_in;
	reg tb_scl_out;
	reg tb_sda_out;
	// System to SRAM ports
	reg tb_w_en;			// write_enable
	reg tb_r_en;			// read_enable
	reg [15:0] tb_addr;		// address to write/read in sram
	reg [7:0] tb_sram_input;		// data read from sram
	reg [7:0] tb_sram_output;		// data write to sram

	// master ports
	reg m_sda_in;
	reg m_scl_out;
	reg m_sda_out;
	reg m_scl_in;
	
	integer i;

	encryptor_sram DUT (
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.sda_in(tb_sda_in),			
		.scl(tb_scl_out),
		.sda_out(tb_sda_out),
		.w_en(tb_w_en),
		.r_en(tb_r_en),
		.addr(tb_addr),
		.sram_input(tb_sram_input),
		.sram_output(tb_sram_output)
	);

	i2c_bus DUT1 (
		.sda_write({tb_sda_out,m_sda_out}),
		.sda_read({tb_sda_in,m_sda_in}),
		.scl_read({tb_scl_out,m_scl_in}),
		.scl_write({1'bz,m_scl_out})
	);

	always
	begin : CLK_GEN
		tb_clk = 1'b0;
		#(CLK_PERIOD / 2);
		tb_clk = 1'b1;
		#(CLK_PERIOD / 2);
	end

	always
	begin : SCL_GEN
		m_scl_out = 1'b0;
		#(SCL_PERIOD * 2 / 3);
		m_scl_out = 1'b1;
		#(SCL_PERIOD / 3);
	end

	initial
	begin
		// initialization
		tb_n_rst = 1'b0;
		@(posedge tb_clk);
		tb_n_rst = 1'b1;
		tb_key1 = 64'h3b3898371520f75e;
		tb_key2 = 64'h8c1f609efca32a78;
		tb_input = 64'h1234567890abcdef;
                // Send start byte
		@(posedge tb_scl_out);
		#50;
		m_sda_out = 1'b0;
		#100;
		m_sda_out = 1'b1;
		#50;
		$info("Starting the I2C communication");
		// sending address
		byte_in = 8'b11110000;
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		$info("Address sent for encryption mode");
		// sending key 1
		#400;
		byte_in = tb_key1[63:56];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		#400;
		byte_in = tb_key1[55:48];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		#400;
		byte_in = tb_key1[47:40];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		#400;
		byte_in = tb_key1[39:32];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		#400;
		byte_in = tb_key1[31:24];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		#400;
		byte_in = tb_key1[23:16];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		#400;
		byte_in = tb_key1[15:8];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		#400;
		byte_in = tb_key1[7:0];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		$info("Key 1 sent.");
		// sending key 2
		#400;
		byte_in = tb_key2[63:56];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		#400;
		byte_in = tb_key2[55:48];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		#400;
		byte_in = tb_key2[47:40];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		#400;
		byte_in = tb_key2[39:32];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		#400;
		byte_in = tb_key2[31:24];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		#400;
		byte_in = tb_key2[23:16];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		#400;
		byte_in = tb_key2[15:8];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		#400;
		byte_in = tb_key2[7:0];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		$info("Key 2 sent.");
		// sending data
		#400;
		byte_in = tb_input[63:56];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		#400;
		byte_in = tb_input[55:48];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		#400;
		byte_in = tb_input[47:40];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		#400;
		byte_in = tb_input[39:32];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		#400;
		byte_in = tb_input[31:24];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		#400;
		byte_in = tb_input[23:16];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		#400;
		byte_in = tb_input[15:8];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		#400;
		byte_in = tb_input[7:0];
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		$info("Data: 0x1234567890abcdef sent.");
	end
endmodule
