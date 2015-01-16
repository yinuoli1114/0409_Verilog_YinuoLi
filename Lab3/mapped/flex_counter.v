
module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n46, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101;

  DFFSR \current_reg[0]  ( .D(n54), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \current_reg[1]  ( .D(n53), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \current_reg[2]  ( .D(n52), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \current_reg[3]  ( .D(n51), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR rollover_flag_c_reg ( .D(n46), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI22X1 U49 ( .A(n55), .B(n56), .C(n57), .D(n58), .Y(n54) );
  OAI21X1 U50 ( .A(n59), .B(n60), .C(n61), .Y(n53) );
  NAND3X1 U51 ( .A(n62), .B(n63), .C(n57), .Y(n61) );
  OAI21X1 U52 ( .A(n59), .B(n64), .C(n65), .Y(n52) );
  NAND3X1 U53 ( .A(n62), .B(n64), .C(n66), .Y(n65) );
  INVX1 U54 ( .A(n58), .Y(n62) );
  INVX1 U55 ( .A(n67), .Y(n59) );
  OAI21X1 U56 ( .A(n58), .B(n68), .C(n56), .Y(n67) );
  NAND2X1 U57 ( .A(n63), .B(n69), .Y(n68) );
  OAI22X1 U58 ( .A(n70), .B(n56), .C(n71), .D(n58), .Y(n51) );
  NAND2X1 U59 ( .A(n72), .B(n56), .Y(n58) );
  AOI22X1 U60 ( .A(count_out[3]), .B(n69), .C(n66), .D(count_out[2]), .Y(n71)
         );
  INVX1 U61 ( .A(n63), .Y(n66) );
  NAND2X1 U62 ( .A(n57), .B(count_out[1]), .Y(n63) );
  NOR2X1 U63 ( .A(n55), .B(n73), .Y(n57) );
  NAND2X1 U64 ( .A(n74), .B(n72), .Y(n56) );
  OAI21X1 U65 ( .A(n75), .B(n76), .C(n77), .Y(n46) );
  OAI21X1 U66 ( .A(n74), .B(n78), .C(rollover_flag), .Y(n77) );
  NAND2X1 U67 ( .A(n73), .B(n72), .Y(n78) );
  INVX1 U68 ( .A(n69), .Y(n73) );
  OAI22X1 U69 ( .A(n79), .B(n80), .C(count_out[3]), .D(n81), .Y(n69) );
  INVX1 U70 ( .A(rollover_val[3]), .Y(n81) );
  OAI21X1 U71 ( .A(n82), .B(n64), .C(n83), .Y(n80) );
  OAI21X1 U72 ( .A(n84), .B(count_out[2]), .C(n85), .Y(n83) );
  INVX1 U73 ( .A(n82), .Y(n84) );
  INVX1 U74 ( .A(count_out[2]), .Y(n64) );
  OAI21X1 U75 ( .A(count_out[1]), .B(n86), .C(n87), .Y(n82) );
  NAND3X1 U76 ( .A(n88), .B(n55), .C(rollover_val[0]), .Y(n87) );
  NOR2X1 U77 ( .A(rollover_val[3]), .B(n70), .Y(n79) );
  INVX1 U78 ( .A(count_enable), .Y(n74) );
  NAND3X1 U79 ( .A(n89), .B(count_enable), .C(n90), .Y(n76) );
  MUX2X1 U80 ( .B(n55), .A(n91), .S(rollover_val[0]), .Y(n90) );
  OAI21X1 U81 ( .A(count_out[1]), .B(n86), .C(n55), .Y(n91) );
  INVX1 U82 ( .A(count_out[0]), .Y(n55) );
  MUX2X1 U83 ( .B(n92), .A(n93), .S(n94), .Y(n89) );
  OR2X1 U84 ( .A(n95), .B(n96), .Y(n93) );
  OAI21X1 U85 ( .A(rollover_val[0]), .B(n60), .C(n88), .Y(n96) );
  NAND2X1 U86 ( .A(count_out[1]), .B(n86), .Y(n88) );
  INVX1 U87 ( .A(rollover_val[1]), .Y(n86) );
  XNOR2X1 U88 ( .A(n85), .B(count_out[2]), .Y(n95) );
  INVX1 U89 ( .A(rollover_val[2]), .Y(n85) );
  NOR2X1 U90 ( .A(rollover_val[3]), .B(rollover_val[2]), .Y(n92) );
  NAND3X1 U91 ( .A(n97), .B(n72), .C(n98), .Y(n75) );
  OAI21X1 U92 ( .A(n99), .B(n60), .C(n100), .Y(n98) );
  INVX1 U93 ( .A(count_out[1]), .Y(n60) );
  XNOR2X1 U94 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n99) );
  INVX1 U95 ( .A(clear), .Y(n72) );
  XNOR2X1 U96 ( .A(n101), .B(n70), .Y(n97) );
  INVX1 U97 ( .A(count_out[3]), .Y(n70) );
  OAI21X1 U98 ( .A(rollover_val[2]), .B(n94), .C(rollover_val[3]), .Y(n101) );
  INVX1 U99 ( .A(n100), .Y(n94) );
  NOR2X1 U100 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n100) );
endmodule

