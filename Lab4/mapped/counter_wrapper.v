
module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N5, N6, N7, N8, N9, N16, N17, N18, N27, n12, n13, n14, n15, n17, n19,
         n20, n21, n23, n25, n27, n29, n30, n31, n32, n33, n34, n36, n37, n38,
         n39, n41, n43, n48, n49, n50, n51, N31, N29, N28, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n16, n18, n22, n24, n26, n28, n35;

  DFFSR \current_reg[3]  ( .D(n51), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \current_reg[2]  ( .D(n50), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \current_reg[1]  ( .D(n49), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \current_reg[0]  ( .D(n48), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR rollover_flag_c_reg ( .D(n43), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI21X1 U3 ( .A(n24), .B(n12), .C(n13), .Y(n43) );
  OAI21X1 U4 ( .A(n14), .B(n15), .C(rollover_flag), .Y(n13) );
  NAND2X1 U5 ( .A(count_enable), .B(n22), .Y(n15) );
  OAI21X1 U8 ( .A(n18), .B(n19), .C(n20), .Y(n48) );
  NAND2X1 U9 ( .A(n8), .B(n21), .Y(n20) );
  OAI21X1 U10 ( .A(n16), .B(n19), .C(n23), .Y(n49) );
  NAND2X1 U11 ( .A(N16), .B(n21), .Y(n23) );
  OAI21X1 U12 ( .A(n10), .B(n19), .C(n25), .Y(n50) );
  NAND2X1 U13 ( .A(N17), .B(n21), .Y(n25) );
  OAI21X1 U14 ( .A(n7), .B(n19), .C(n27), .Y(n51) );
  NAND2X1 U15 ( .A(N18), .B(n21), .Y(n27) );
  NAND2X1 U17 ( .A(n24), .B(n22), .Y(n19) );
  NAND2X1 U21 ( .A(n9), .B(n17), .Y(N27) );
  NAND3X1 U22 ( .A(n29), .B(n30), .C(n31), .Y(n17) );
  NOR2X1 U23 ( .A(n32), .B(n33), .Y(n31) );
  XNOR2X1 U24 ( .A(n18), .B(N5), .Y(n33) );
  XNOR2X1 U25 ( .A(n16), .B(N6), .Y(n32) );
  XNOR2X1 U26 ( .A(count_out[3]), .B(N8), .Y(n30) );
  NOR2X1 U27 ( .A(N9), .B(n34), .Y(n29) );
  XNOR2X1 U28 ( .A(n10), .B(N7), .Y(n34) );
  OAI21X1 U30 ( .A(count_out[3]), .B(n26), .C(n36), .Y(n14) );
  OAI21X1 U31 ( .A(rollover_val[2]), .B(n10), .C(n37), .Y(n36) );
  AOI22X1 U32 ( .A(n38), .B(n39), .C(count_out[3]), .D(n26), .Y(n37) );
  NAND2X1 U33 ( .A(rollover_val[2]), .B(n10), .Y(n39) );
  AOI22X1 U34 ( .A(n11), .B(rollover_val[0]), .C(rollover_val[1]), .D(n16), 
        .Y(n38) );
  OAI21X1 U36 ( .A(n16), .B(rollover_val[1]), .C(n18), .Y(n41) );
  OR2X2 U7 ( .A(n17), .B(clear), .Y(n12) );
  AND2X2 U16 ( .A(n19), .B(n22), .Y(n21) );
  NAND2X1 U6 ( .A(count_out[2]), .B(N27), .Y(n1) );
  AND2X1 U18 ( .A(count_out[0]), .B(N27), .Y(N28) );
  AND2X1 U19 ( .A(count_out[1]), .B(N27), .Y(N29) );
  AND2X1 U20 ( .A(N27), .B(count_out[3]), .Y(N31) );
  NOR2X1 U29 ( .A(rollover_val[1]), .B(rollover_val[0]), .Y(n3) );
  AOI21X1 U35 ( .A(rollover_val[0]), .B(rollover_val[1]), .C(n3), .Y(n2) );
  NAND2X1 U37 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1 U38 ( .A(n3), .B(n6), .C(n4), .Y(N7) );
  NOR2X1 U39 ( .A(n4), .B(rollover_val[3]), .Y(N9) );
  AOI21X1 U40 ( .A(n4), .B(rollover_val[3]), .C(N9), .Y(n5) );
  INVX2 U46 ( .A(rollover_val[0]), .Y(N5) );
  INVX2 U47 ( .A(n2), .Y(N6) );
  INVX2 U48 ( .A(rollover_val[2]), .Y(n6) );
  INVX2 U49 ( .A(n5), .Y(N8) );
  INVX2 U50 ( .A(count_out[3]), .Y(n7) );
  INVX2 U51 ( .A(N28), .Y(n8) );
  INVX2 U52 ( .A(n14), .Y(n9) );
  INVX2 U53 ( .A(count_out[2]), .Y(n10) );
  INVX2 U54 ( .A(n41), .Y(n11) );
  INVX2 U55 ( .A(count_out[1]), .Y(n16) );
  INVX2 U56 ( .A(count_out[0]), .Y(n18) );
  INVX2 U57 ( .A(clear), .Y(n22) );
  INVX2 U58 ( .A(count_enable), .Y(n24) );
  INVX2 U59 ( .A(rollover_val[3]), .Y(n26) );
  XOR2X1 U60 ( .A(N31), .B(n28), .Y(N18) );
  NOR2X1 U61 ( .A(n35), .B(n1), .Y(n28) );
  XOR2X1 U62 ( .A(n1), .B(n35), .Y(N17) );
  NAND2X1 U63 ( .A(N29), .B(N28), .Y(n35) );
  XOR2X1 U64 ( .A(N29), .B(N28), .Y(N16) );
endmodule


module sync ( clk, n_rst, async_in, sync_out );
  input [3:0] async_in;
  output [3:0] sync_out;
  input clk, n_rst;

  wire   [3:0] q;

  DFFSR \q_reg[3]  ( .D(async_in[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(q[3])
         );
  DFFSR \q_reg[2]  ( .D(async_in[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(q[2])
         );
  DFFSR \q_reg[1]  ( .D(async_in[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(q[1])
         );
  DFFSR \q_reg[0]  ( .D(async_in[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(q[0])
         );
  DFFSR \sync_out_reg[3]  ( .D(q[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sync_out[3]) );
  DFFSR \sync_out_reg[2]  ( .D(q[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sync_out[2]) );
  DFFSR \sync_out_reg[1]  ( .D(q[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sync_out[1]) );
  DFFSR \sync_out_reg[0]  ( .D(q[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sync_out[0]) );
endmodule


module counter_wrapper ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;

  wire   [3:0] count;

  flex_counter FLEX_COUNTER ( .clk(clk), .n_rst(n_rst), .clear(clear), 
        .count_enable(count_enable), .rollover_val(rollover_val), .count_out(
        count), .rollover_flag(rollover_flag) );
  sync SYNC ( .clk(clk), .n_rst(n_rst), .async_in(count), .sync_out(count_out)
         );
endmodule

