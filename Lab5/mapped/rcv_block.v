
module flex_stp_sr_NUM_BITS9_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n17, n19, n21,
         n23, n25, n27, n29;
  tri   clk;
  tri   n_rst;
  tri   shift_enable;

  DFFSR \temp_out_reg[8]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \temp_out_reg[7]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \temp_out_reg[6]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \temp_out_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \temp_out_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \temp_out_reg[3]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \temp_out_reg[2]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \temp_out_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \temp_out_reg[0]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  OAI21X1 U2 ( .A(n1), .B(n2), .C(n3), .Y(n13) );
  NAND2X1 U3 ( .A(parallel_out[0]), .B(n2), .Y(n3) );
  OAI22X1 U4 ( .A(n2), .B(n4), .C(shift_enable), .D(n1), .Y(n15) );
  INVX1 U5 ( .A(parallel_out[1]), .Y(n1) );
  OAI22X1 U6 ( .A(n2), .B(n5), .C(shift_enable), .D(n4), .Y(n17) );
  INVX1 U7 ( .A(parallel_out[2]), .Y(n4) );
  OAI22X1 U8 ( .A(n2), .B(n6), .C(shift_enable), .D(n5), .Y(n19) );
  INVX1 U9 ( .A(parallel_out[3]), .Y(n5) );
  OAI22X1 U10 ( .A(n2), .B(n7), .C(shift_enable), .D(n6), .Y(n21) );
  INVX1 U11 ( .A(parallel_out[4]), .Y(n6) );
  OAI22X1 U12 ( .A(n2), .B(n8), .C(shift_enable), .D(n7), .Y(n23) );
  INVX1 U13 ( .A(parallel_out[5]), .Y(n7) );
  OAI22X1 U14 ( .A(n2), .B(n9), .C(shift_enable), .D(n8), .Y(n25) );
  INVX1 U15 ( .A(parallel_out[6]), .Y(n8) );
  OAI22X1 U16 ( .A(n2), .B(n10), .C(shift_enable), .D(n9), .Y(n27) );
  INVX1 U17 ( .A(parallel_out[7]), .Y(n9) );
  OAI21X1 U19 ( .A(shift_enable), .B(n10), .C(n11), .Y(n29) );
  NAND2X1 U20 ( .A(serial_in), .B(shift_enable), .Y(n11) );
  INVX1 U21 ( .A(parallel_out[8]), .Y(n10) );
  INVX2 U18 ( .A(shift_enable), .Y(n2) );
endmodule


module sr_9bit ( clk, n_rst, shift_strobe, serial_in, packet_data, stop_bit );
  output [7:0] packet_data;
  input clk, n_rst, shift_strobe, serial_in;
  output stop_bit;

  tri   clk;
  tri   n_rst;
  tri   shift_strobe;

  flex_stp_sr_NUM_BITS9_SHIFT_MSB0 SHIFT_BIT ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out({
        stop_bit, packet_data}) );
endmodule


module start_bit_det ( clk, n_rst, serial_in, start_bit_detected );
  input clk, n_rst, serial_in;
  output start_bit_detected;
  wire   old_sample, new_sample, sync_phase, n4;
  tri   clk;
  tri   n_rst;

  DFFSR sync_phase_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_phase) );
  DFFSR new_sample_reg ( .D(sync_phase), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  INVX2 U6 ( .A(old_sample), .Y(n4) );
  NOR2X1 U7 ( .A(new_sample), .B(n4), .Y(start_bit_detected) );
endmodule


module rcu ( clk, n_rst, start_bit_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, start_bit_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   N14, N30, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;
  wire   [2:0] state;
  wire   [2:0] nextstate;
  tri   clk;
  tri   n_rst;
  tri   packet_done;
  tri   enable_timer;

  DFFSR \state_reg[0]  ( .D(nextstate[0]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        state[0]) );
  DFFSR \state_reg[1]  ( .D(nextstate[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[2]  ( .D(nextstate[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[2]) );
  LATCH load_buffer_reg ( .CLK(N30), .D(n13), .Q(load_buffer) );
  LATCH enable_timer_reg ( .CLK(N30), .D(nextstate[1]), .Q(enable_timer) );
  LATCH sbc_clear_reg ( .CLK(N30), .D(N14), .Q(sbc_clear) );
  LATCH sbc_enable_reg ( .CLK(N30), .D(n4), .Q(sbc_enable) );
  OR2X2 U6 ( .A(framing_error), .B(n9), .Y(n7) );
  INVX2 U7 ( .A(n8), .Y(n4) );
  INVX2 U8 ( .A(state[2]), .Y(n5) );
  INVX2 U9 ( .A(state[1]), .Y(n6) );
  OAI21X1 U10 ( .A(n5), .B(n7), .C(n8), .Y(nextstate[2]) );
  NOR2X1 U11 ( .A(state[2]), .B(state[0]), .Y(nextstate[1]) );
  OAI21X1 U12 ( .A(start_bit_detected), .B(n10), .C(n11), .Y(nextstate[0]) );
  AOI21X1 U13 ( .A(n12), .B(packet_done), .C(state[2]), .Y(n11) );
  NOR2X1 U14 ( .A(state[0]), .B(n6), .Y(n12) );
  NOR2X1 U15 ( .A(n5), .B(n10), .Y(n13) );
  NAND3X1 U16 ( .A(state[1]), .B(n5), .C(state[0]), .Y(n8) );
  NAND2X1 U17 ( .A(state[2]), .B(state[1]), .Y(N30) );
  NOR2X1 U18 ( .A(state[2]), .B(n9), .Y(N14) );
  NAND2X1 U19 ( .A(n10), .B(n6), .Y(n9) );
  NAND2X1 U20 ( .A(state[0]), .B(n6), .Y(n10) );
endmodule


module timer ( clk, n_rst, enable_timer, shift_strobe, packet_done );
  input clk, n_rst, enable_timer;
  output shift_strobe, packet_done;

  tri   \*Logic1* ;
  tri   \*Logic0* ;
  tri   clk;
  tri   n_rst;
  tri   enable_timer;
  tri   shift_strobe;
  tri   packet_done;

  flex_counter interval_count ( .clk(clk), .n_rst(n_rst), .clear(packet_done), 
        .count_enable(enable_timer), .rollover_val({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b1, 1'b0, 1'b1, 1'b0}), .rollover_flag(shift_strobe) );
  flex_counter bit_count ( .clk(clk), .n_rst(n_rst), .clear(packet_done), 
        .count_enable(shift_strobe), .rollover_val({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b1, 1'b0, 1'b0, 1'b1}), .rollover_flag(packet_done) );
endmodule


module stop_bit_chk ( clk, n_rst, sbc_clear, sbc_enable, stop_bit, 
        framing_error );
  input clk, n_rst, sbc_clear, sbc_enable, stop_bit;
  output framing_error;
  wire   n2, n3, n4, n5;
  tri   clk;
  tri   n_rst;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  INVX2 U3 ( .A(sbc_enable), .Y(n2) );
  INVX2 U4 ( .A(stop_bit), .Y(n3) );
  NOR2X1 U5 ( .A(sbc_clear), .B(n4), .Y(n5) );
  AOI22X1 U6 ( .A(framing_error), .B(n2), .C(sbc_enable), .D(n3), .Y(n4) );
endmodule


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n15, n17, n19, n21, n23,
         n25, n27, n29, n30, n31;
  tri   clk;
  tri   n_rst;

  DFFSR \rx_data_reg[7]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        overrun_error) );
  INVX1 U3 ( .A(n1), .Y(n29) );
  AOI22X1 U4 ( .A(rx_data[7]), .B(n2), .C(packet_data[7]), .D(load_buffer), 
        .Y(n1) );
  NOR2X1 U5 ( .A(data_read), .B(n3), .Y(n30) );
  AOI21X1 U6 ( .A(data_ready), .B(load_buffer), .C(overrun_error), .Y(n3) );
  OAI21X1 U7 ( .A(data_read), .B(n4), .C(n2), .Y(n31) );
  INVX1 U8 ( .A(data_ready), .Y(n4) );
  INVX1 U9 ( .A(n5), .Y(n15) );
  AOI22X1 U10 ( .A(rx_data[0]), .B(n2), .C(packet_data[0]), .D(load_buffer), 
        .Y(n5) );
  INVX1 U11 ( .A(n6), .Y(n17) );
  AOI22X1 U12 ( .A(rx_data[1]), .B(n2), .C(packet_data[1]), .D(load_buffer), 
        .Y(n6) );
  INVX1 U13 ( .A(n7), .Y(n19) );
  AOI22X1 U14 ( .A(rx_data[2]), .B(n2), .C(packet_data[2]), .D(load_buffer), 
        .Y(n7) );
  INVX1 U15 ( .A(n8), .Y(n21) );
  AOI22X1 U16 ( .A(rx_data[3]), .B(n2), .C(packet_data[3]), .D(load_buffer), 
        .Y(n8) );
  INVX1 U17 ( .A(n9), .Y(n23) );
  AOI22X1 U18 ( .A(rx_data[4]), .B(n2), .C(packet_data[4]), .D(load_buffer), 
        .Y(n9) );
  INVX1 U19 ( .A(n10), .Y(n25) );
  AOI22X1 U20 ( .A(rx_data[5]), .B(n2), .C(packet_data[5]), .D(load_buffer), 
        .Y(n10) );
  INVX1 U21 ( .A(n11), .Y(n27) );
  AOI22X1 U22 ( .A(rx_data[6]), .B(n2), .C(packet_data[6]), .D(load_buffer), 
        .Y(n11) );
  INVX2 U23 ( .A(load_buffer), .Y(n2) );
endmodule


module rcv_block ( clk, n_rst, serial_in, data_read, rx_data, data_ready, 
        overrun_error, framing_error );
  output [7:0] rx_data;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   stop_bit, start_bit_detected, sbc_clear, sbc_enable, load_buffer;
  wire   [7:0] packet_data;
  tri   clk;
  tri   n_rst;
  tri   shift_strobe;
  tri   packet_done;
  tri   enable_timer;

  sr_9bit SHIFT ( .clk(clk), .n_rst(n_rst), .shift_strobe(shift_strobe), 
        .serial_in(serial_in), .packet_data(packet_data), .stop_bit(stop_bit)
         );
  start_bit_det START ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .start_bit_detected(start_bit_detected) );
  rcu RCU ( .clk(clk), .n_rst(n_rst), .start_bit_detected(start_bit_detected), 
        .packet_done(packet_done), .framing_error(framing_error), .sbc_clear(
        sbc_clear), .sbc_enable(sbc_enable), .load_buffer(load_buffer), 
        .enable_timer(enable_timer) );
  timer TIME ( .clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), 
        .shift_strobe(shift_strobe), .packet_done(packet_done) );
  stop_bit_chk STOP ( .clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clear), 
        .sbc_enable(sbc_enable), .stop_bit(stop_bit), .framing_error(
        framing_error) );
  rx_data_buff RX ( .clk(clk), .n_rst(n_rst), .load_buffer(load_buffer), 
        .packet_data(packet_data), .data_read(data_read), .rx_data(rx_data), 
        .data_ready(data_ready), .overrun_error(overrun_error) );
endmodule

