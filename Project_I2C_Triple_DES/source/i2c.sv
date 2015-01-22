// $Id: $
// File name:   i2c_slave.sv
// Created:     10/8/2014
// Author:      Ikeme Osi-Ogbu
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: i2c slave  block

module i2c
(
	input wire clk,
	input wire n_rst,
	input wire scl,
	input wire sda_in,
	input wire data_ready,
	input wire output_ready,
	output wire [7:0] i2c_out,
	output wire start,
	output wire stop,
	input wire [63:0] write_data,
	output wire sda_out,
	output wire en_write_r,
	output wire i2c_rw,
	output wire en_load
);

reg scl_sync;
reg sda_sync;
reg rise_f;
reg fall_f;
reg [1:0] sdaMode;
reg [7:0] rxData;
reg readMode;
reg addMatch;
reg stopping;
reg starting;
reg rxEnable;
reg txOut;
reg txEnable;
reg [7:0] txData;
reg loadData;
reg readEnable;
reg byteReceived;
reg ackPrep;
reg checkAck;
reg ackDone;

assign en_load = readEnable;
assign stop = stopping;
assign start = starting;

sync CORE1(
   .clk(clk),
   .n_rst(n_rst),
   .async_in(scl),
   .sync_out(scl_sync)
);

sync CORE2(
   .clk(clk),
   .n_rst(n_rst),
   .async_in(sda_in),
   .sync_out(sda_sync)
);


scl_edge CORE3(
   .clk(clk),
   .n_rst(n_rst),
   .scl(scl_sync),
   .rising_edge_found(rise_f),
   .falling_edge_found(fall_f)
); 

sda_sel CORE4(
   .tx_out(txOut),
   .sda_mode(sdaMode),
   .sda_out(sda_out)
);

decode CORE5(
   .clk(clk),
   .n_rst(n_rst),
   .scl(scl_sync),
   .sda_in(sda_sync),
   .starting_byte(rxData),
   .rw_mode(readMode),
   .address_match(addMatch),
   .stop_found(stopping),
   .start_found(starting)
);

rx_sr CORE6(
   .clk(clk),
   .n_rst(n_rst),
   .sda_in(sda_sync),
   .rising_edge_found(rise_f),
   .rx_enable(rxEnable),
   .rx_w_data(i2c_out),//addition
   .rx_data(rxData)
   
);

tx_sr CORE7(
   .clk(clk),
   .n_rst(n_rst),
   .tx_out(txOut),
   .falling_edge_found(fall_f),
   .tx_enable(txEnable),
   .tx_data(write_data),
   .load_data(output_ready)
);

timer CORE9(
   .clk(clk),
   .n_rst(n_rst),
   .rising_edge_found(rise_f),
   .falling_edge_found(fall_f),
   .stop_found(stopping),
   .start_found(starting),
   .byte_received(byteReceived),
   .ack_prep(ackPrep),
   .check_ack(checkAck),
   .ack_done(ackDone)
);

i2c_controller CORE10(
   .clk(clk),  
   .n_rst(n_rst),
   .stop_found(stopping),
   .start_found(starting),
   .byte_received(byteReceived),
   .ack_prep(ackPrep),
   .check_ack(checkAck),
   .ack_done(ackDone),
   .rw_mode(readMode),
   .address_match(addMatch),
   .sda_in(sda_sync),
   .rx_enable(rxEnable),
   .tx_enable(txEnable),
   .read_enable(readEnable),
   .write_enable(en_write_r),
   .sda_mode(sdaMode),
   .i2c_rw(i2c_rw),
   .load_data(loadData),
   .data_ready(data_ready)
);

endmodule
