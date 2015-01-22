// $Id: $
// File name:   tb_maindes.sv
// Created:     12/9/2014
// Author:      Jason Lin
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: testbench for main des controller

`timescale 1 ns / 10 ps

module tb_encryptor ();
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
	// SRAM ports
	reg tb_mem_clr;
	reg tb_mem_init;
	reg tb_mem_dump;
	reg tb_verbose;
	reg tb_init_file_number;
	reg tb_dump_file_number;
	reg tb_start_address;
	reg tb_last_address;
	
	integer i;

	encryptor DUT (
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
	
	on_chip_sram_wrapper SRAM
	(
		// Test bench control signals
		.mem_clr(tb_mem_clr),
		.mem_init(tb_mem_init),
		.mem_dump(tb_mem_dump),
		.verbose(tb_verbose),
		.init_file_number(tb_init_file_number),
		.dump_file_number(tb_dump_file_number),
		.start_address(tb_start_address),
		.last_address(tb_last_address),
		// Memory interface signals
		.read_enable(tb_r_en),
		.write_enable(tb_w_en),
		.address(tb_addr),
		.read_data(tb_sram_input),
		.write_data(tb_sram_output)
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
		// initialize the SRAM ports
		tb_mem_clr	<= 0;
		tb_mem_init	<= 0;
		tb_mem_dump	<= 0;
		tb_verbose	<= 0;
		tb_init_file_number	<= 0;
		tb_dump_file_number	<= 0;
		tb_start_address<= 0;
		tb_last_address	<= 0;
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

		 //Master sends stop condition
		m_sda_out = 1'b0;
		@(posedge tb_scl_out);
		#50;
		m_sda_out = 1'b1;
		#300;



		// Send start byte
		@(posedge tb_scl_out);
		#50;
		m_sda_out = 1'b0;
		#100;
		m_sda_out = 1'b1;
		#50;
		$info("Master starting the communication.");
		// sending address
		byte_in = 8'b11110001;
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			m_sda_out = byte_in[8 - i];
			@(negedge tb_scl_out);				
		end
		$info("Address sent for decryption mode.");
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
		m_sda_out = 1'b1;
		//#400;

                m_sda_out  = 1'b0;
		// transmitting to sda_out
		// byte 1
		for(i = 1; i <= BIT_COUNT +1; i++)
		begin
			@(posedge m_scl_out); //8
		end
		@(negedge m_scl_out);
		m_sda_out = 1'b0;
		@(posedge m_scl_out);
		@(negedge m_scl_out);
		m_sda_out = 1'b1;
		$info("Master act byte 1");
		// byte 2
		for(i = 1; i <= BIT_COUNT+1; i++)
		begin
			@(posedge m_scl_out); //8
		end
		@(negedge m_scl_out);
		m_sda_out = 1'b0;
		@(posedge m_scl_out);
		@(negedge m_scl_out);
		m_sda_out = 1'b1;
		$info("Master act byte 2");
		// byte 3
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			@(posedge m_scl_out); //8
		end
                m_sda_out = 1'b0;
		@(negedge m_scl_out);
		m_sda_out = 1'b0;
		@(posedge m_scl_out);
		@(negedge m_scl_out);
		m_sda_out = 1'b1;
		$info("Master act byte 3");
		// byte 4
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			@(posedge m_scl_out); //8
		end
		@(negedge m_scl_out);
		m_sda_out = 1'b0;
		@(posedge m_scl_out);
		@(negedge m_scl_out);
		m_sda_out = 1'b1;
		$info("Master act byte 4");
		// byte 5
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			@(posedge m_scl_out); //8
		end
		@(negedge m_scl_out);
		m_sda_out = 1'b0;
		@(posedge m_scl_out);
		@(negedge m_scl_out);
		m_sda_out = 1'b1;
		$info("Master act byte 5");
		// byte 6
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			@(posedge m_scl_out); //8
		end
		@(negedge m_scl_out);
		m_sda_out = 1'b0;
		@(posedge m_scl_out);
		@(negedge m_scl_out);
		m_sda_out = 1'b1;
		$info("Master act byte 6");
		// byte 7
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			@(posedge m_scl_out); //8
		end
		@(negedge m_scl_out);
		m_sda_out = 1'b0;
		@(posedge m_scl_out);
		@(negedge m_scl_out);
		m_sda_out = 1'b1;
		$info("Master act byte 7");
		// byte 8
		for(i = 1; i <= BIT_COUNT; i++)
		begin
			@(posedge m_scl_out); //8
		end
		@(negedge m_scl_out);
		m_sda_out = 1'b0;
		@(posedge m_scl_out);
		@(negedge m_scl_out);
		m_sda_out = 1'b1;
		$info("Master act byte 8");

	end

endmodule
		

