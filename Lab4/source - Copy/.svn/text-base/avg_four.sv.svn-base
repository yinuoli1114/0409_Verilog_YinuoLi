// $Id: $
// File name:   avg_four.sv
// Created:     9/22/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: average four
module avg_four
  (
   input wire clk,
   input wire n_reset,
   input wire [15:0] sample_data,
   input wire data_ready,
   output wire one_k_samples,
   output wire modwait,
   output wire [15:0] avg_out,
   output wire err
   );
   reg dr;
   reg [1:0] op;
   reg [3:0] src1;
   reg [3:0] src2;
   reg [3:0] dest;
   reg  overflow;
   reg 	cnt_up;
   reg [15:0] outreg_data;
   
   sync S
     (
      .clk(clk),
      .n_rst(n_reset),
      .async_in(data_ready),
      .sync_out(dr)
      );
   
   controller C
     (
      .clk(clk),
      .n_reset(n_reset),
      .dr(dr),
      .overflow(overflow),
      .cnt_up(cnt_up),
      .modwait(modwait),
      .op(op),
      .src1(src1),
      .src2(src2),
      .dest(dest),
      .err(err)
      );
   datapath D
     (
      .clk(clk),
      .n_reset(n_reset),
      .op(op),
      .src1(src1),
      .src2(src2),
      .dest(dest),
      .ext_data(sample_data),
      .outreg_data(outreg_data),
      .overflow(overflow)
      );
   counter CN
     (
      .clk(clk),
      .n_reset(n_reset),
      .cnt_up(cnt_up),
      .one_k_samples(one_k_samples)
      );
   

   assign avg_out = {2'b00,outreg_data[15:2]};
endmodule // avg_four

   
