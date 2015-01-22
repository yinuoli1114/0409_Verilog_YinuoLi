// $Id: $
// File name:   i2c_slave.sv
// Created:     10/8/2014
// Author:      Ikeme Osi-Ogbu
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: i2c slave  block

module i2c_slave
(
 input wire clk,
 input wire n_rst,
 input wire scl,
 input wire sda_in,
 input wire write_enable,
 input wire [7:0] write_data,//i2c out
 input wire [7:0] write_data,//i2c in 
 output wire sda_out,
 output wire fifo_empty,
 output wire fifo_full
output wire 
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
reg writeEnable;
reg byteReceived;
reg ackPrep;
reg checkAck;
reg ackDone;

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
   .rx_w_data(rxData),//addition
   .rx_data(rxData)
   
);

tx_sr CORE7(
   .clk(clk),
   .n_rst(n_rst),
   .tx_out(txOut),
   .falling_edge_found(fall_f),
   .tx_enable(txEnable),
   .tx_data(txData),
   .load_data(loadData)
);

tx_fifo CORE8(
   .clk(clk),
   .n_rst(n_rst),
   .read_enable(readEnable),
   .read_data(txData),
   .fifo_empty(fifo_empty),
   .fifo_full(fifo_full),
   .write_enable(writEnable),
   .write_data(write_data)
);

rx_fifo CORE11(
   .clk(clk),
   .n_rst(n_rst),
   .read_enable(readEnable),
   .read_data(rxData),// two write and read enables
   .fifo_empty(fifo_empty),
   .fifo_full(fifo_full),
   .write_enable(write_enable),
   .write_data(write_data)

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

controller CORE10(
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
   .write_enable(writeEnable),
   .sda_mode(sdaMode),
   .load_data(loadData)
);

endmodule
