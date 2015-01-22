
module scl_edge ( clk, n_rst, scl, rising_edge_found, falling_edge_found );
  input clk, n_rst, scl;
  output rising_edge_found, falling_edge_found;
  wire   scl_pre, scl_c, N0, N1, n3, n4, n5, n6;
  assign rising_edge_found = N0;
  assign falling_edge_found = N1;

  DFFSR scl_c_reg ( .D(scl), .CLK(clk), .R(1'b1), .S(n_rst), .Q(scl_c) );
  DFFSR scl_pre_reg ( .D(n3), .CLK(clk), .R(1'b1), .S(n_rst), .Q(scl_pre) );
  INVX1 U5 ( .A(n6), .Y(n3) );
  AND2X2 U6 ( .A(n6), .B(scl_pre), .Y(N1) );
  INVX2 U7 ( .A(scl_c), .Y(n6) );
  INVX1 U8 ( .A(n5), .Y(n4) );
  INVX1 U9 ( .A(scl_pre), .Y(n5) );
  NOR2X1 U10 ( .A(n4), .B(n6), .Y(N0) );
endmodule


module sda_sel ( tx_out, sda_mode, sda_out );
  input [1:0] sda_mode;
  input tx_out;
  output sda_out;
  wire   n1;

  NAND2X1 U3 ( .A(sda_mode[0]), .B(n1), .Y(sda_out) );
  NAND2X1 U4 ( .A(tx_out), .B(sda_mode[1]), .Y(n1) );
endmodule


module flex_pts_sr_NUM_BITS8_SHIFT_MSB1 ( clk, n_rst, shift_enable, 
        load_enable, parallel_in, serial_out );
  input [7:0] parallel_in;
  input clk, n_rst, shift_enable, load_enable;
  output serial_out;
  wire   n29, n30, n31, n32, n33, n34, n35, n36, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48;
  wire   [6:0] in;

  DFFSR \in_reg[0]  ( .D(n36), .CLK(clk), .R(1'b1), .S(n_rst), .Q(in[0]) );
  DFFSR \in_reg[1]  ( .D(n35), .CLK(clk), .R(1'b1), .S(n_rst), .Q(in[1]) );
  DFFSR \in_reg[2]  ( .D(n34), .CLK(clk), .R(1'b1), .S(n_rst), .Q(in[2]) );
  DFFSR \in_reg[3]  ( .D(n33), .CLK(clk), .R(1'b1), .S(n_rst), .Q(in[3]) );
  DFFSR \in_reg[4]  ( .D(n32), .CLK(clk), .R(1'b1), .S(n_rst), .Q(in[4]) );
  DFFSR \in_reg[5]  ( .D(n31), .CLK(clk), .R(1'b1), .S(n_rst), .Q(in[5]) );
  DFFSR \in_reg[6]  ( .D(n30), .CLK(clk), .R(1'b1), .S(n_rst), .Q(in[6]) );
  DFFSR \in_reg[7]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(serial_out)
         );
  INVX2 U11 ( .A(n16), .Y(n44) );
  INVX2 U12 ( .A(load_enable), .Y(n12) );
  INVX1 U13 ( .A(load_enable), .Y(n9) );
  INVX2 U14 ( .A(n9), .Y(n10) );
  NAND2X1 U15 ( .A(n17), .B(n12), .Y(n11) );
  INVX1 U16 ( .A(n15), .Y(n36) );
  NAND2X1 U17 ( .A(shift_enable), .B(n12), .Y(n17) );
  NAND2X1 U18 ( .A(n17), .B(n12), .Y(n16) );
  INVX2 U19 ( .A(in[0]), .Y(n13) );
  OAI21X1 U20 ( .A(n11), .B(n13), .C(n17), .Y(n14) );
  AOI21X1 U21 ( .A(parallel_in[0]), .B(n10), .C(n14), .Y(n15) );
  NAND2X1 U22 ( .A(in[1]), .B(n44), .Y(n20) );
  INVX2 U23 ( .A(n17), .Y(n45) );
  NAND2X1 U24 ( .A(in[0]), .B(n45), .Y(n19) );
  NAND2X1 U25 ( .A(parallel_in[1]), .B(n10), .Y(n18) );
  NAND3X1 U26 ( .A(n20), .B(n19), .C(n18), .Y(n35) );
  NAND2X1 U27 ( .A(in[2]), .B(n44), .Y(n23) );
  NAND2X1 U28 ( .A(in[1]), .B(n45), .Y(n22) );
  NAND2X1 U29 ( .A(parallel_in[2]), .B(n10), .Y(n21) );
  NAND3X1 U30 ( .A(n23), .B(n22), .C(n21), .Y(n34) );
  NAND2X1 U31 ( .A(in[3]), .B(n44), .Y(n26) );
  NAND2X1 U32 ( .A(in[2]), .B(n45), .Y(n25) );
  NAND2X1 U33 ( .A(parallel_in[3]), .B(n10), .Y(n24) );
  NAND3X1 U34 ( .A(n26), .B(n25), .C(n24), .Y(n33) );
  NAND2X1 U35 ( .A(in[4]), .B(n44), .Y(n37) );
  NAND2X1 U36 ( .A(in[3]), .B(n45), .Y(n28) );
  NAND2X1 U37 ( .A(parallel_in[4]), .B(n10), .Y(n27) );
  NAND3X1 U38 ( .A(n37), .B(n28), .C(n27), .Y(n32) );
  NAND2X1 U39 ( .A(in[5]), .B(n44), .Y(n40) );
  NAND2X1 U40 ( .A(in[4]), .B(n45), .Y(n39) );
  NAND2X1 U41 ( .A(parallel_in[5]), .B(n10), .Y(n38) );
  NAND3X1 U42 ( .A(n40), .B(n39), .C(n38), .Y(n31) );
  NAND2X1 U43 ( .A(in[6]), .B(n44), .Y(n43) );
  NAND2X1 U44 ( .A(in[5]), .B(n45), .Y(n42) );
  NAND2X1 U45 ( .A(parallel_in[6]), .B(n10), .Y(n41) );
  NAND3X1 U46 ( .A(n43), .B(n42), .C(n41), .Y(n30) );
  NAND2X1 U47 ( .A(serial_out), .B(n44), .Y(n48) );
  NAND2X1 U48 ( .A(in[6]), .B(n45), .Y(n47) );
  NAND2X1 U49 ( .A(parallel_in[7]), .B(n10), .Y(n46) );
  NAND3X1 U50 ( .A(n48), .B(n47), .C(n46), .Y(n29) );
endmodule


module tx_sr ( clk, n_rst, tx_out, falling_edge_found, tx_enable, tx_data, 
        load_data );
  input [7:0] tx_data;
  input clk, n_rst, falling_edge_found, tx_enable, load_data;
  output tx_out;
  wire   _0_net_;

  flex_pts_sr_NUM_BITS8_SHIFT_MSB1 PTS_SHIFT ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(_0_net_), .load_enable(load_data), .parallel_in(tx_data), 
        .serial_out(tx_out) );
  AND2X1 U1 ( .A(tx_enable), .B(falling_edge_found), .Y(_0_net_) );
endmodule


module fiforam ( wclk, wenable, waddr, raddr, wdata, rdata );
  input [2:0] waddr;
  input [2:0] raddr;
  input [7:0] wdata;
  output [7:0] rdata;
  input wclk, wenable;
  wire   \fiforeg[0][7] , \fiforeg[0][6] , \fiforeg[0][5] , \fiforeg[0][4] ,
         \fiforeg[0][3] , \fiforeg[0][2] , \fiforeg[0][1] , \fiforeg[0][0] ,
         \fiforeg[1][7] , \fiforeg[1][6] , \fiforeg[1][5] , \fiforeg[1][4] ,
         \fiforeg[1][3] , \fiforeg[1][2] , \fiforeg[1][1] , \fiforeg[1][0] ,
         \fiforeg[2][7] , \fiforeg[2][6] , \fiforeg[2][5] , \fiforeg[2][4] ,
         \fiforeg[2][3] , \fiforeg[2][2] , \fiforeg[2][1] , \fiforeg[2][0] ,
         \fiforeg[3][7] , \fiforeg[3][6] , \fiforeg[3][5] , \fiforeg[3][4] ,
         \fiforeg[3][3] , \fiforeg[3][2] , \fiforeg[3][1] , \fiforeg[3][0] ,
         \fiforeg[4][7] , \fiforeg[4][6] , \fiforeg[4][5] , \fiforeg[4][4] ,
         \fiforeg[4][3] , \fiforeg[4][2] , \fiforeg[4][1] , \fiforeg[4][0] ,
         \fiforeg[5][7] , \fiforeg[5][6] , \fiforeg[5][5] , \fiforeg[5][4] ,
         \fiforeg[5][3] , \fiforeg[5][2] , \fiforeg[5][1] , \fiforeg[5][0] ,
         \fiforeg[6][7] , \fiforeg[6][6] , \fiforeg[6][5] , \fiforeg[6][4] ,
         \fiforeg[6][3] , \fiforeg[6][2] , \fiforeg[6][1] , \fiforeg[6][0] ,
         \fiforeg[7][7] , \fiforeg[7][6] , \fiforeg[7][5] , \fiforeg[7][4] ,
         \fiforeg[7][3] , \fiforeg[7][2] , \fiforeg[7][1] , \fiforeg[7][0] ,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301;

  DFFPOSX1 \fiforeg_reg[7][7]  ( .D(n212), .CLK(wclk), .Q(\fiforeg[7][7] ) );
  DFFPOSX1 \fiforeg_reg[6][7]  ( .D(n213), .CLK(wclk), .Q(\fiforeg[6][7] ) );
  DFFPOSX1 \fiforeg_reg[5][7]  ( .D(n214), .CLK(wclk), .Q(\fiforeg[5][7] ) );
  DFFPOSX1 \fiforeg_reg[4][7]  ( .D(n215), .CLK(wclk), .Q(\fiforeg[4][7] ) );
  DFFPOSX1 \fiforeg_reg[3][7]  ( .D(n216), .CLK(wclk), .Q(\fiforeg[3][7] ) );
  DFFPOSX1 \fiforeg_reg[2][7]  ( .D(n217), .CLK(wclk), .Q(\fiforeg[2][7] ) );
  DFFPOSX1 \fiforeg_reg[1][7]  ( .D(n218), .CLK(wclk), .Q(\fiforeg[1][7] ) );
  DFFPOSX1 \fiforeg_reg[0][7]  ( .D(n219), .CLK(wclk), .Q(\fiforeg[0][7] ) );
  DFFPOSX1 \fiforeg_reg[7][6]  ( .D(n220), .CLK(wclk), .Q(\fiforeg[7][6] ) );
  DFFPOSX1 \fiforeg_reg[6][6]  ( .D(n221), .CLK(wclk), .Q(\fiforeg[6][6] ) );
  DFFPOSX1 \fiforeg_reg[5][6]  ( .D(n222), .CLK(wclk), .Q(\fiforeg[5][6] ) );
  DFFPOSX1 \fiforeg_reg[4][6]  ( .D(n223), .CLK(wclk), .Q(\fiforeg[4][6] ) );
  DFFPOSX1 \fiforeg_reg[3][6]  ( .D(n224), .CLK(wclk), .Q(\fiforeg[3][6] ) );
  DFFPOSX1 \fiforeg_reg[2][6]  ( .D(n225), .CLK(wclk), .Q(\fiforeg[2][6] ) );
  DFFPOSX1 \fiforeg_reg[1][6]  ( .D(n226), .CLK(wclk), .Q(\fiforeg[1][6] ) );
  DFFPOSX1 \fiforeg_reg[0][6]  ( .D(n227), .CLK(wclk), .Q(\fiforeg[0][6] ) );
  DFFPOSX1 \fiforeg_reg[7][5]  ( .D(n228), .CLK(wclk), .Q(\fiforeg[7][5] ) );
  DFFPOSX1 \fiforeg_reg[6][5]  ( .D(n229), .CLK(wclk), .Q(\fiforeg[6][5] ) );
  DFFPOSX1 \fiforeg_reg[5][5]  ( .D(n230), .CLK(wclk), .Q(\fiforeg[5][5] ) );
  DFFPOSX1 \fiforeg_reg[4][5]  ( .D(n231), .CLK(wclk), .Q(\fiforeg[4][5] ) );
  DFFPOSX1 \fiforeg_reg[3][5]  ( .D(n232), .CLK(wclk), .Q(\fiforeg[3][5] ) );
  DFFPOSX1 \fiforeg_reg[2][5]  ( .D(n233), .CLK(wclk), .Q(\fiforeg[2][5] ) );
  DFFPOSX1 \fiforeg_reg[1][5]  ( .D(n234), .CLK(wclk), .Q(\fiforeg[1][5] ) );
  DFFPOSX1 \fiforeg_reg[0][5]  ( .D(n235), .CLK(wclk), .Q(\fiforeg[0][5] ) );
  DFFPOSX1 \fiforeg_reg[7][4]  ( .D(n236), .CLK(wclk), .Q(\fiforeg[7][4] ) );
  DFFPOSX1 \fiforeg_reg[6][4]  ( .D(n237), .CLK(wclk), .Q(\fiforeg[6][4] ) );
  DFFPOSX1 \fiforeg_reg[5][4]  ( .D(n238), .CLK(wclk), .Q(\fiforeg[5][4] ) );
  DFFPOSX1 \fiforeg_reg[4][4]  ( .D(n239), .CLK(wclk), .Q(\fiforeg[4][4] ) );
  DFFPOSX1 \fiforeg_reg[3][4]  ( .D(n240), .CLK(wclk), .Q(\fiforeg[3][4] ) );
  DFFPOSX1 \fiforeg_reg[2][4]  ( .D(n241), .CLK(wclk), .Q(\fiforeg[2][4] ) );
  DFFPOSX1 \fiforeg_reg[1][4]  ( .D(n242), .CLK(wclk), .Q(\fiforeg[1][4] ) );
  DFFPOSX1 \fiforeg_reg[0][4]  ( .D(n243), .CLK(wclk), .Q(\fiforeg[0][4] ) );
  DFFPOSX1 \fiforeg_reg[7][3]  ( .D(n244), .CLK(wclk), .Q(\fiforeg[7][3] ) );
  DFFPOSX1 \fiforeg_reg[6][3]  ( .D(n245), .CLK(wclk), .Q(\fiforeg[6][3] ) );
  DFFPOSX1 \fiforeg_reg[5][3]  ( .D(n246), .CLK(wclk), .Q(\fiforeg[5][3] ) );
  DFFPOSX1 \fiforeg_reg[4][3]  ( .D(n247), .CLK(wclk), .Q(\fiforeg[4][3] ) );
  DFFPOSX1 \fiforeg_reg[3][3]  ( .D(n248), .CLK(wclk), .Q(\fiforeg[3][3] ) );
  DFFPOSX1 \fiforeg_reg[2][3]  ( .D(n249), .CLK(wclk), .Q(\fiforeg[2][3] ) );
  DFFPOSX1 \fiforeg_reg[1][3]  ( .D(n250), .CLK(wclk), .Q(\fiforeg[1][3] ) );
  DFFPOSX1 \fiforeg_reg[0][3]  ( .D(n251), .CLK(wclk), .Q(\fiforeg[0][3] ) );
  DFFPOSX1 \fiforeg_reg[7][2]  ( .D(n252), .CLK(wclk), .Q(\fiforeg[7][2] ) );
  DFFPOSX1 \fiforeg_reg[6][2]  ( .D(n253), .CLK(wclk), .Q(\fiforeg[6][2] ) );
  DFFPOSX1 \fiforeg_reg[5][2]  ( .D(n254), .CLK(wclk), .Q(\fiforeg[5][2] ) );
  DFFPOSX1 \fiforeg_reg[4][2]  ( .D(n255), .CLK(wclk), .Q(\fiforeg[4][2] ) );
  DFFPOSX1 \fiforeg_reg[3][2]  ( .D(n256), .CLK(wclk), .Q(\fiforeg[3][2] ) );
  DFFPOSX1 \fiforeg_reg[2][2]  ( .D(n257), .CLK(wclk), .Q(\fiforeg[2][2] ) );
  DFFPOSX1 \fiforeg_reg[1][2]  ( .D(n258), .CLK(wclk), .Q(\fiforeg[1][2] ) );
  DFFPOSX1 \fiforeg_reg[0][2]  ( .D(n259), .CLK(wclk), .Q(\fiforeg[0][2] ) );
  DFFPOSX1 \fiforeg_reg[7][1]  ( .D(n260), .CLK(wclk), .Q(\fiforeg[7][1] ) );
  DFFPOSX1 \fiforeg_reg[6][1]  ( .D(n261), .CLK(wclk), .Q(\fiforeg[6][1] ) );
  DFFPOSX1 \fiforeg_reg[5][1]  ( .D(n262), .CLK(wclk), .Q(\fiforeg[5][1] ) );
  DFFPOSX1 \fiforeg_reg[4][1]  ( .D(n263), .CLK(wclk), .Q(\fiforeg[4][1] ) );
  DFFPOSX1 \fiforeg_reg[3][1]  ( .D(n264), .CLK(wclk), .Q(\fiforeg[3][1] ) );
  DFFPOSX1 \fiforeg_reg[2][1]  ( .D(n265), .CLK(wclk), .Q(\fiforeg[2][1] ) );
  DFFPOSX1 \fiforeg_reg[1][1]  ( .D(n266), .CLK(wclk), .Q(\fiforeg[1][1] ) );
  DFFPOSX1 \fiforeg_reg[0][1]  ( .D(n267), .CLK(wclk), .Q(\fiforeg[0][1] ) );
  DFFPOSX1 \fiforeg_reg[7][0]  ( .D(n275), .CLK(wclk), .Q(\fiforeg[7][0] ) );
  DFFPOSX1 \fiforeg_reg[6][0]  ( .D(n268), .CLK(wclk), .Q(\fiforeg[6][0] ) );
  DFFPOSX1 \fiforeg_reg[5][0]  ( .D(n269), .CLK(wclk), .Q(\fiforeg[5][0] ) );
  DFFPOSX1 \fiforeg_reg[4][0]  ( .D(n270), .CLK(wclk), .Q(\fiforeg[4][0] ) );
  DFFPOSX1 \fiforeg_reg[3][0]  ( .D(n271), .CLK(wclk), .Q(\fiforeg[3][0] ) );
  DFFPOSX1 \fiforeg_reg[2][0]  ( .D(n272), .CLK(wclk), .Q(\fiforeg[2][0] ) );
  DFFPOSX1 \fiforeg_reg[1][0]  ( .D(n273), .CLK(wclk), .Q(\fiforeg[1][0] ) );
  DFFPOSX1 \fiforeg_reg[0][0]  ( .D(n274), .CLK(wclk), .Q(\fiforeg[0][0] ) );
  NAND3X1 U93 ( .A(n92), .B(n93), .C(n94), .Y(rdata[7]) );
  NOR2X1 U94 ( .A(n95), .B(n96), .Y(n94) );
  NAND3X1 U99 ( .A(n101), .B(n102), .C(n103), .Y(rdata[6]) );
  NOR2X1 U100 ( .A(n104), .B(n105), .Y(n103) );
  NAND3X1 U105 ( .A(n106), .B(n107), .C(n108), .Y(rdata[5]) );
  NOR2X1 U106 ( .A(n109), .B(n110), .Y(n108) );
  NAND3X1 U111 ( .A(n111), .B(n112), .C(n113), .Y(rdata[4]) );
  NOR2X1 U112 ( .A(n114), .B(n115), .Y(n113) );
  NAND3X1 U117 ( .A(n116), .B(n117), .C(n118), .Y(rdata[3]) );
  NOR2X1 U118 ( .A(n119), .B(n120), .Y(n118) );
  NAND3X1 U123 ( .A(n121), .B(n122), .C(n123), .Y(rdata[2]) );
  NOR2X1 U124 ( .A(n124), .B(n125), .Y(n123) );
  NAND3X1 U129 ( .A(n126), .B(n127), .C(n128), .Y(rdata[1]) );
  NOR2X1 U130 ( .A(n129), .B(n130), .Y(n128) );
  NAND3X1 U135 ( .A(n131), .B(n132), .C(n133), .Y(rdata[0]) );
  NOR2X1 U136 ( .A(n134), .B(n135), .Y(n133) );
  NAND3X1 U138 ( .A(raddr[0]), .B(n300), .C(raddr[2]), .Y(n98) );
  NAND3X1 U139 ( .A(n301), .B(n300), .C(raddr[2]), .Y(n97) );
  NAND3X1 U141 ( .A(raddr[1]), .B(raddr[0]), .C(raddr[2]), .Y(n100) );
  NAND3X1 U142 ( .A(raddr[1]), .B(n301), .C(raddr[2]), .Y(n99) );
  NAND3X1 U144 ( .A(n301), .B(n299), .C(raddr[1]), .Y(n136) );
  NAND3X1 U145 ( .A(raddr[0]), .B(n299), .C(raddr[1]), .Y(n137) );
  NAND3X1 U147 ( .A(n300), .B(n299), .C(n301), .Y(n138) );
  NAND3X1 U148 ( .A(n300), .B(n299), .C(raddr[0]), .Y(n139) );
  BUFX2 U2 ( .A(n290), .Y(n1) );
  INVX2 U3 ( .A(n36), .Y(n2) );
  INVX2 U4 ( .A(n36), .Y(n17) );
  INVX2 U5 ( .A(n290), .Y(n36) );
  NAND3X1 U6 ( .A(n38), .B(n13), .C(n28), .Y(n3) );
  INVX2 U7 ( .A(n3), .Y(n30) );
  MUX2X1 U8 ( .B(n23), .A(n75), .S(n15), .Y(n266) );
  INVX4 U9 ( .A(n15), .Y(n285) );
  INVX2 U10 ( .A(n14), .Y(n15) );
  BUFX2 U11 ( .A(waddr[1]), .Y(n4) );
  INVX4 U12 ( .A(n51), .Y(n16) );
  INVX1 U13 ( .A(n208), .Y(n5) );
  INVX2 U14 ( .A(n208), .Y(n26) );
  INVX4 U15 ( .A(n207), .Y(n27) );
  INVX4 U16 ( .A(n31), .Y(n40) );
  INVX2 U17 ( .A(waddr[2]), .Y(n29) );
  INVX2 U18 ( .A(waddr[1]), .Y(n28) );
  BUFX4 U19 ( .A(n77), .Y(n6) );
  MUX2X1 U20 ( .B(n6), .A(n73), .S(n35), .Y(n265) );
  BUFX4 U21 ( .A(n200), .Y(n7) );
  BUFX4 U22 ( .A(n185), .Y(n8) );
  BUFX4 U23 ( .A(n170), .Y(n9) );
  BUFX4 U24 ( .A(n155), .Y(n10) );
  BUFX4 U25 ( .A(n140), .Y(n11) );
  INVX1 U26 ( .A(n44), .Y(n12) );
  INVX2 U27 ( .A(n205), .Y(n44) );
  INVX4 U28 ( .A(n44), .Y(n45) );
  BUFX2 U29 ( .A(n200), .Y(n18) );
  BUFX2 U30 ( .A(n185), .Y(n19) );
  BUFX2 U31 ( .A(n170), .Y(n20) );
  BUFX2 U32 ( .A(n155), .Y(n21) );
  BUFX2 U33 ( .A(n140), .Y(n22) );
  BUFX2 U34 ( .A(n77), .Y(n23) );
  INVX2 U35 ( .A(n5), .Y(n34) );
  INVX1 U36 ( .A(waddr[0]), .Y(n13) );
  INVX1 U37 ( .A(n12), .Y(n14) );
  AND2X2 U38 ( .A(waddr[2]), .B(waddr[1]), .Y(n41) );
  BUFX4 U39 ( .A(n62), .Y(n24) );
  BUFX4 U40 ( .A(n62), .Y(n25) );
  INVX4 U41 ( .A(n26), .Y(n46) );
  NAND2X1 U42 ( .A(n41), .B(n16), .Y(n31) );
  INVX4 U43 ( .A(n27), .Y(n47) );
  INVX1 U44 ( .A(n50), .Y(n32) );
  INVX4 U45 ( .A(n27), .Y(n35) );
  INVX1 U46 ( .A(n26), .Y(n33) );
  INVX1 U47 ( .A(n206), .Y(n287) );
  INVX4 U48 ( .A(n206), .Y(n42) );
  INVX4 U49 ( .A(waddr[0]), .Y(n51) );
  BUFX2 U50 ( .A(n289), .Y(n37) );
  INVX2 U51 ( .A(n29), .Y(n38) );
  BUFX2 U52 ( .A(n40), .Y(n39) );
  INVX4 U53 ( .A(n48), .Y(n289) );
  INVX4 U54 ( .A(n49), .Y(n279) );
  INVX4 U55 ( .A(n50), .Y(n280) );
  INVX8 U56 ( .A(n42), .Y(n43) );
  INVX2 U57 ( .A(\fiforeg[7][0] ), .Y(n63) );
  NAND2X1 U58 ( .A(n41), .B(n13), .Y(n48) );
  AOI22X1 U59 ( .A(\fiforeg[6][0] ), .B(n289), .C(\fiforeg[7][0] ), .D(n40), 
        .Y(n56) );
  NAND3X1 U60 ( .A(n38), .B(n13), .C(n28), .Y(n49) );
  NAND3X1 U61 ( .A(n16), .B(n38), .C(n28), .Y(n50) );
  AOI22X1 U62 ( .A(n279), .B(\fiforeg[4][0] ), .C(\fiforeg[5][0] ), .D(n280), 
        .Y(n55) );
  NAND3X1 U63 ( .A(n28), .B(n29), .C(n51), .Y(n206) );
  INVX2 U64 ( .A(\fiforeg[0][0] ), .Y(n61) );
  NAND3X1 U65 ( .A(n29), .B(n28), .C(n16), .Y(n205) );
  INVX2 U66 ( .A(\fiforeg[1][0] ), .Y(n60) );
  OAI22X1 U67 ( .A(n61), .B(n43), .C(n12), .D(n60), .Y(n53) );
  NAND3X1 U68 ( .A(n29), .B(waddr[0]), .C(n4), .Y(n208) );
  INVX2 U69 ( .A(\fiforeg[3][0] ), .Y(n59) );
  NAND3X1 U70 ( .A(n29), .B(n4), .C(n51), .Y(n207) );
  INVX2 U71 ( .A(\fiforeg[2][0] ), .Y(n58) );
  OAI22X1 U72 ( .A(n59), .B(n34), .C(n58), .D(n35), .Y(n52) );
  NOR2X1 U73 ( .A(n52), .B(n53), .Y(n54) );
  NAND3X1 U74 ( .A(n56), .B(n55), .C(n54), .Y(n57) );
  MUX2X1 U75 ( .B(n57), .A(wdata[0]), .S(wenable), .Y(n62) );
  MUX2X1 U76 ( .B(n63), .A(n24), .S(n39), .Y(n275) );
  INVX2 U77 ( .A(\fiforeg[4][0] ), .Y(n66) );
  MUX2X1 U78 ( .B(n66), .A(n24), .S(n279), .Y(n270) );
  INVX2 U79 ( .A(\fiforeg[5][0] ), .Y(n65) );
  MUX2X1 U80 ( .B(n65), .A(n24), .S(n32), .Y(n269) );
  INVX2 U81 ( .A(n35), .Y(n281) );
  MUX2X1 U82 ( .B(n58), .A(n25), .S(n281), .Y(n272) );
  INVX2 U83 ( .A(n34), .Y(n283) );
  MUX2X1 U84 ( .B(n59), .A(n25), .S(n283), .Y(n271) );
  MUX2X1 U85 ( .B(n60), .A(n25), .S(n285), .Y(n273) );
  MUX2X1 U86 ( .B(n61), .A(n24), .S(n287), .Y(n274) );
  INVX2 U87 ( .A(\fiforeg[6][0] ), .Y(n64) );
  MUX2X1 U88 ( .B(n64), .A(n25), .S(n37), .Y(n268) );
  OAI22X1 U89 ( .A(n99), .B(n64), .C(n100), .D(n63), .Y(n134) );
  OAI22X1 U90 ( .A(n97), .B(n66), .C(n98), .D(n65), .Y(n135) );
  AOI22X1 U91 ( .A(\fiforeg[0][0] ), .B(n296), .C(\fiforeg[1][0] ), .D(n295), 
        .Y(n131) );
  AOI22X1 U92 ( .A(\fiforeg[2][0] ), .B(n298), .C(\fiforeg[3][0] ), .D(n297), 
        .Y(n132) );
  INVX2 U95 ( .A(\fiforeg[7][1] ), .Y(n78) );
  AOI22X1 U96 ( .A(\fiforeg[6][1] ), .B(n289), .C(\fiforeg[7][1] ), .D(n40), 
        .Y(n71) );
  AOI22X1 U97 ( .A(\fiforeg[4][1] ), .B(n279), .C(\fiforeg[5][1] ), .D(n280), 
        .Y(n70) );
  INVX2 U98 ( .A(\fiforeg[0][1] ), .Y(n76) );
  INVX2 U101 ( .A(\fiforeg[1][1] ), .Y(n75) );
  OAI22X1 U102 ( .A(n76), .B(n43), .C(n45), .D(n75), .Y(n68) );
  INVX2 U103 ( .A(\fiforeg[3][1] ), .Y(n74) );
  INVX2 U104 ( .A(\fiforeg[2][1] ), .Y(n73) );
  OAI22X1 U107 ( .A(n46), .B(n74), .C(n47), .D(n73), .Y(n67) );
  NOR2X1 U108 ( .A(n67), .B(n68), .Y(n69) );
  NAND3X1 U109 ( .A(n71), .B(n70), .C(n69), .Y(n72) );
  MUX2X1 U110 ( .B(n72), .A(wdata[1]), .S(wenable), .Y(n77) );
  MUX2X1 U113 ( .B(n78), .A(n6), .S(n40), .Y(n260) );
  INVX2 U114 ( .A(\fiforeg[4][1] ), .Y(n81) );
  MUX2X1 U115 ( .B(n81), .A(n6), .S(n279), .Y(n263) );
  INVX2 U116 ( .A(\fiforeg[5][1] ), .Y(n80) );
  MUX2X1 U119 ( .B(n80), .A(n6), .S(n280), .Y(n262) );
  MUX2X1 U120 ( .B(n74), .A(n6), .S(n283), .Y(n264) );
  MUX2X1 U121 ( .B(n76), .A(n23), .S(n287), .Y(n267) );
  INVX2 U122 ( .A(\fiforeg[6][1] ), .Y(n79) );
  MUX2X1 U125 ( .B(n79), .A(n23), .S(n37), .Y(n261) );
  OAI22X1 U126 ( .A(n99), .B(n79), .C(n100), .D(n78), .Y(n129) );
  OAI22X1 U127 ( .A(n97), .B(n81), .C(n98), .D(n80), .Y(n130) );
  AOI22X1 U128 ( .A(\fiforeg[0][1] ), .B(n296), .C(\fiforeg[1][1] ), .D(n295), 
        .Y(n126) );
  AOI22X1 U131 ( .A(\fiforeg[2][1] ), .B(n298), .C(\fiforeg[3][1] ), .D(n297), 
        .Y(n127) );
  INVX2 U132 ( .A(\fiforeg[7][2] ), .Y(n141) );
  AOI22X1 U133 ( .A(\fiforeg[6][2] ), .B(n289), .C(\fiforeg[7][2] ), .D(n40), 
        .Y(n86) );
  AOI22X1 U134 ( .A(\fiforeg[4][2] ), .B(n279), .C(\fiforeg[5][2] ), .D(n280), 
        .Y(n85) );
  INVX2 U137 ( .A(\fiforeg[0][2] ), .Y(n91) );
  INVX2 U140 ( .A(\fiforeg[1][2] ), .Y(n90) );
  OAI22X1 U143 ( .A(n91), .B(n43), .C(n45), .D(n90), .Y(n83) );
  INVX2 U146 ( .A(\fiforeg[3][2] ), .Y(n89) );
  INVX2 U149 ( .A(\fiforeg[2][2] ), .Y(n88) );
  OAI22X1 U150 ( .A(n46), .B(n89), .C(n47), .D(n88), .Y(n82) );
  NOR2X1 U151 ( .A(n82), .B(n83), .Y(n84) );
  NAND3X1 U152 ( .A(n86), .B(n85), .C(n84), .Y(n87) );
  MUX2X1 U153 ( .B(n87), .A(wdata[2]), .S(wenable), .Y(n140) );
  MUX2X1 U154 ( .B(n141), .A(n11), .S(n40), .Y(n252) );
  INVX2 U155 ( .A(\fiforeg[4][2] ), .Y(n144) );
  MUX2X1 U156 ( .B(n144), .A(n11), .S(n30), .Y(n255) );
  INVX2 U157 ( .A(\fiforeg[5][2] ), .Y(n143) );
  MUX2X1 U158 ( .B(n143), .A(n11), .S(n32), .Y(n254) );
  MUX2X1 U159 ( .B(n88), .A(n11), .S(n281), .Y(n257) );
  MUX2X1 U160 ( .B(n89), .A(n11), .S(n283), .Y(n256) );
  MUX2X1 U161 ( .B(n90), .A(n22), .S(n285), .Y(n258) );
  MUX2X1 U162 ( .B(n91), .A(n22), .S(n287), .Y(n259) );
  INVX2 U163 ( .A(\fiforeg[6][2] ), .Y(n142) );
  MUX2X1 U164 ( .B(n142), .A(n22), .S(n37), .Y(n253) );
  OAI22X1 U165 ( .A(n99), .B(n142), .C(n100), .D(n141), .Y(n124) );
  OAI22X1 U166 ( .A(n97), .B(n144), .C(n98), .D(n143), .Y(n125) );
  AOI22X1 U167 ( .A(\fiforeg[0][2] ), .B(n296), .C(\fiforeg[1][2] ), .D(n295), 
        .Y(n121) );
  AOI22X1 U168 ( .A(\fiforeg[2][2] ), .B(n298), .C(\fiforeg[3][2] ), .D(n297), 
        .Y(n122) );
  INVX2 U169 ( .A(\fiforeg[7][3] ), .Y(n156) );
  AOI22X1 U170 ( .A(\fiforeg[6][3] ), .B(n289), .C(\fiforeg[7][3] ), .D(n40), 
        .Y(n149) );
  AOI22X1 U171 ( .A(\fiforeg[4][3] ), .B(n279), .C(\fiforeg[5][3] ), .D(n280), 
        .Y(n148) );
  INVX2 U172 ( .A(\fiforeg[0][3] ), .Y(n154) );
  INVX2 U173 ( .A(\fiforeg[1][3] ), .Y(n153) );
  OAI22X1 U174 ( .A(n154), .B(n43), .C(n45), .D(n153), .Y(n146) );
  INVX2 U175 ( .A(\fiforeg[3][3] ), .Y(n152) );
  INVX2 U176 ( .A(\fiforeg[2][3] ), .Y(n151) );
  OAI22X1 U177 ( .A(n46), .B(n152), .C(n47), .D(n151), .Y(n145) );
  NOR2X1 U178 ( .A(n145), .B(n146), .Y(n147) );
  NAND3X1 U179 ( .A(n149), .B(n148), .C(n147), .Y(n150) );
  MUX2X1 U180 ( .B(n150), .A(wdata[3]), .S(wenable), .Y(n155) );
  MUX2X1 U181 ( .B(n156), .A(n10), .S(n40), .Y(n244) );
  INVX2 U182 ( .A(\fiforeg[4][3] ), .Y(n159) );
  MUX2X1 U183 ( .B(n159), .A(n10), .S(n30), .Y(n247) );
  INVX2 U184 ( .A(\fiforeg[5][3] ), .Y(n158) );
  MUX2X1 U185 ( .B(n158), .A(n10), .S(n32), .Y(n246) );
  MUX2X1 U186 ( .B(n151), .A(n10), .S(n281), .Y(n249) );
  MUX2X1 U187 ( .B(n152), .A(n10), .S(n283), .Y(n248) );
  MUX2X1 U188 ( .B(n153), .A(n21), .S(n285), .Y(n250) );
  MUX2X1 U189 ( .B(n154), .A(n21), .S(n287), .Y(n251) );
  INVX2 U190 ( .A(\fiforeg[6][3] ), .Y(n157) );
  MUX2X1 U191 ( .B(n157), .A(n21), .S(n37), .Y(n245) );
  OAI22X1 U192 ( .A(n99), .B(n157), .C(n100), .D(n156), .Y(n119) );
  OAI22X1 U193 ( .A(n97), .B(n159), .C(n98), .D(n158), .Y(n120) );
  AOI22X1 U194 ( .A(\fiforeg[0][3] ), .B(n296), .C(\fiforeg[1][3] ), .D(n295), 
        .Y(n116) );
  AOI22X1 U195 ( .A(\fiforeg[2][3] ), .B(n298), .C(\fiforeg[3][3] ), .D(n297), 
        .Y(n117) );
  INVX2 U196 ( .A(\fiforeg[7][4] ), .Y(n171) );
  AOI22X1 U197 ( .A(\fiforeg[6][4] ), .B(n289), .C(\fiforeg[7][4] ), .D(n40), 
        .Y(n164) );
  AOI22X1 U198 ( .A(\fiforeg[4][4] ), .B(n279), .C(\fiforeg[5][4] ), .D(n280), 
        .Y(n163) );
  INVX2 U199 ( .A(\fiforeg[0][4] ), .Y(n169) );
  INVX2 U200 ( .A(\fiforeg[1][4] ), .Y(n168) );
  OAI22X1 U201 ( .A(n169), .B(n43), .C(n45), .D(n168), .Y(n161) );
  INVX2 U202 ( .A(\fiforeg[3][4] ), .Y(n167) );
  INVX2 U203 ( .A(\fiforeg[2][4] ), .Y(n166) );
  OAI22X1 U204 ( .A(n46), .B(n167), .C(n47), .D(n166), .Y(n160) );
  NOR2X1 U205 ( .A(n160), .B(n161), .Y(n162) );
  NAND3X1 U206 ( .A(n164), .B(n163), .C(n162), .Y(n165) );
  MUX2X1 U207 ( .B(n165), .A(wdata[4]), .S(wenable), .Y(n170) );
  MUX2X1 U208 ( .B(n171), .A(n9), .S(n40), .Y(n236) );
  INVX2 U209 ( .A(\fiforeg[4][4] ), .Y(n174) );
  MUX2X1 U210 ( .B(n174), .A(n9), .S(n30), .Y(n239) );
  INVX2 U211 ( .A(\fiforeg[5][4] ), .Y(n173) );
  MUX2X1 U212 ( .B(n173), .A(n9), .S(n32), .Y(n238) );
  MUX2X1 U213 ( .B(n166), .A(n9), .S(n281), .Y(n241) );
  MUX2X1 U214 ( .B(n167), .A(n9), .S(n283), .Y(n240) );
  MUX2X1 U215 ( .B(n168), .A(n20), .S(n285), .Y(n242) );
  MUX2X1 U216 ( .B(n169), .A(n20), .S(n287), .Y(n243) );
  INVX2 U217 ( .A(\fiforeg[6][4] ), .Y(n172) );
  MUX2X1 U218 ( .B(n172), .A(n20), .S(n37), .Y(n237) );
  OAI22X1 U219 ( .A(n99), .B(n172), .C(n100), .D(n171), .Y(n114) );
  OAI22X1 U220 ( .A(n97), .B(n174), .C(n98), .D(n173), .Y(n115) );
  AOI22X1 U221 ( .A(\fiforeg[0][4] ), .B(n296), .C(\fiforeg[1][4] ), .D(n295), 
        .Y(n111) );
  AOI22X1 U222 ( .A(\fiforeg[2][4] ), .B(n298), .C(\fiforeg[3][4] ), .D(n297), 
        .Y(n112) );
  INVX2 U223 ( .A(\fiforeg[7][5] ), .Y(n186) );
  AOI22X1 U224 ( .A(\fiforeg[6][5] ), .B(n289), .C(\fiforeg[7][5] ), .D(n40), 
        .Y(n179) );
  AOI22X1 U225 ( .A(\fiforeg[4][5] ), .B(n279), .C(\fiforeg[5][5] ), .D(n280), 
        .Y(n178) );
  INVX2 U226 ( .A(\fiforeg[0][5] ), .Y(n184) );
  INVX2 U227 ( .A(\fiforeg[1][5] ), .Y(n183) );
  OAI22X1 U228 ( .A(n184), .B(n43), .C(n45), .D(n183), .Y(n176) );
  INVX2 U229 ( .A(\fiforeg[3][5] ), .Y(n182) );
  INVX2 U230 ( .A(\fiforeg[2][5] ), .Y(n181) );
  OAI22X1 U231 ( .A(n46), .B(n182), .C(n47), .D(n181), .Y(n175) );
  NOR2X1 U232 ( .A(n175), .B(n176), .Y(n177) );
  NAND3X1 U233 ( .A(n179), .B(n178), .C(n177), .Y(n180) );
  MUX2X1 U234 ( .B(n180), .A(wdata[5]), .S(wenable), .Y(n185) );
  MUX2X1 U235 ( .B(n186), .A(n8), .S(n40), .Y(n228) );
  INVX2 U236 ( .A(\fiforeg[4][5] ), .Y(n189) );
  MUX2X1 U237 ( .B(n189), .A(n8), .S(n30), .Y(n231) );
  INVX2 U238 ( .A(\fiforeg[5][5] ), .Y(n188) );
  MUX2X1 U239 ( .B(n188), .A(n8), .S(n32), .Y(n230) );
  MUX2X1 U240 ( .B(n181), .A(n8), .S(n281), .Y(n233) );
  MUX2X1 U241 ( .B(n182), .A(n8), .S(n283), .Y(n232) );
  MUX2X1 U242 ( .B(n183), .A(n19), .S(n285), .Y(n234) );
  MUX2X1 U243 ( .B(n184), .A(n19), .S(n287), .Y(n235) );
  INVX2 U244 ( .A(\fiforeg[6][5] ), .Y(n187) );
  MUX2X1 U245 ( .B(n187), .A(n19), .S(n37), .Y(n229) );
  OAI22X1 U246 ( .A(n99), .B(n187), .C(n100), .D(n186), .Y(n109) );
  OAI22X1 U247 ( .A(n97), .B(n189), .C(n98), .D(n188), .Y(n110) );
  AOI22X1 U248 ( .A(\fiforeg[0][5] ), .B(n296), .C(\fiforeg[1][5] ), .D(n295), 
        .Y(n106) );
  AOI22X1 U249 ( .A(\fiforeg[2][5] ), .B(n298), .C(\fiforeg[3][5] ), .D(n297), 
        .Y(n107) );
  INVX2 U250 ( .A(\fiforeg[7][6] ), .Y(n201) );
  AOI22X1 U251 ( .A(\fiforeg[6][6] ), .B(n289), .C(\fiforeg[7][6] ), .D(n40), 
        .Y(n194) );
  AOI22X1 U252 ( .A(\fiforeg[4][6] ), .B(n279), .C(\fiforeg[5][6] ), .D(n280), 
        .Y(n193) );
  INVX2 U253 ( .A(\fiforeg[0][6] ), .Y(n199) );
  INVX2 U254 ( .A(\fiforeg[1][6] ), .Y(n198) );
  OAI22X1 U255 ( .A(n199), .B(n43), .C(n45), .D(n198), .Y(n191) );
  INVX2 U256 ( .A(\fiforeg[3][6] ), .Y(n197) );
  INVX2 U257 ( .A(\fiforeg[2][6] ), .Y(n196) );
  OAI22X1 U258 ( .A(n46), .B(n197), .C(n47), .D(n196), .Y(n190) );
  NOR2X1 U259 ( .A(n190), .B(n191), .Y(n192) );
  NAND3X1 U260 ( .A(n194), .B(n193), .C(n192), .Y(n195) );
  MUX2X1 U261 ( .B(n195), .A(wdata[6]), .S(wenable), .Y(n200) );
  MUX2X1 U262 ( .B(n201), .A(n7), .S(n40), .Y(n220) );
  INVX2 U263 ( .A(\fiforeg[4][6] ), .Y(n204) );
  MUX2X1 U264 ( .B(n204), .A(n7), .S(n30), .Y(n223) );
  INVX2 U265 ( .A(\fiforeg[5][6] ), .Y(n203) );
  MUX2X1 U266 ( .B(n203), .A(n7), .S(n32), .Y(n222) );
  MUX2X1 U267 ( .B(n196), .A(n7), .S(n281), .Y(n225) );
  MUX2X1 U268 ( .B(n197), .A(n7), .S(n283), .Y(n224) );
  MUX2X1 U269 ( .B(n198), .A(n18), .S(n285), .Y(n226) );
  MUX2X1 U270 ( .B(n199), .A(n18), .S(n287), .Y(n227) );
  INVX2 U271 ( .A(\fiforeg[6][6] ), .Y(n202) );
  MUX2X1 U272 ( .B(n202), .A(n18), .S(n37), .Y(n221) );
  OAI22X1 U273 ( .A(n99), .B(n202), .C(n100), .D(n201), .Y(n104) );
  OAI22X1 U274 ( .A(n97), .B(n204), .C(n98), .D(n203), .Y(n105) );
  AOI22X1 U275 ( .A(\fiforeg[0][6] ), .B(n296), .C(\fiforeg[1][6] ), .D(n295), 
        .Y(n101) );
  AOI22X1 U276 ( .A(\fiforeg[2][6] ), .B(n298), .C(\fiforeg[3][6] ), .D(n297), 
        .Y(n102) );
  INVX2 U277 ( .A(\fiforeg[7][7] ), .Y(n291) );
  AOI22X1 U278 ( .A(n289), .B(\fiforeg[6][7] ), .C(n40), .D(\fiforeg[7][7] ), 
        .Y(n277) );
  AOI22X1 U279 ( .A(n279), .B(\fiforeg[4][7] ), .C(n280), .D(\fiforeg[5][7] ), 
        .Y(n276) );
  INVX2 U280 ( .A(\fiforeg[0][7] ), .Y(n288) );
  INVX2 U281 ( .A(\fiforeg[1][7] ), .Y(n286) );
  OAI22X1 U282 ( .A(n288), .B(n43), .C(n45), .D(n286), .Y(n210) );
  INVX2 U283 ( .A(\fiforeg[3][7] ), .Y(n284) );
  INVX2 U284 ( .A(\fiforeg[2][7] ), .Y(n282) );
  OAI22X1 U285 ( .A(n284), .B(n33), .C(n282), .D(n35), .Y(n209) );
  NOR2X1 U286 ( .A(n209), .B(n210), .Y(n211) );
  NAND3X1 U287 ( .A(n277), .B(n276), .C(n211), .Y(n278) );
  MUX2X1 U288 ( .B(n278), .A(wdata[7]), .S(wenable), .Y(n290) );
  MUX2X1 U289 ( .B(n291), .A(n17), .S(n39), .Y(n212) );
  INVX2 U290 ( .A(\fiforeg[4][7] ), .Y(n294) );
  MUX2X1 U291 ( .B(n294), .A(n1), .S(n30), .Y(n215) );
  INVX2 U292 ( .A(\fiforeg[5][7] ), .Y(n293) );
  MUX2X1 U293 ( .B(n293), .A(n17), .S(n32), .Y(n214) );
  MUX2X1 U294 ( .B(n282), .A(n1), .S(n281), .Y(n217) );
  MUX2X1 U295 ( .B(n284), .A(n2), .S(n283), .Y(n216) );
  MUX2X1 U296 ( .B(n286), .A(n2), .S(n285), .Y(n218) );
  MUX2X1 U297 ( .B(n288), .A(n17), .S(n287), .Y(n219) );
  INVX2 U298 ( .A(\fiforeg[6][7] ), .Y(n292) );
  MUX2X1 U299 ( .B(n292), .A(n2), .S(n37), .Y(n213) );
  OAI22X1 U300 ( .A(n99), .B(n292), .C(n100), .D(n291), .Y(n95) );
  OAI22X1 U301 ( .A(n97), .B(n294), .C(n98), .D(n293), .Y(n96) );
  AOI22X1 U302 ( .A(\fiforeg[0][7] ), .B(n296), .C(\fiforeg[1][7] ), .D(n295), 
        .Y(n92) );
  AOI22X1 U303 ( .A(\fiforeg[2][7] ), .B(n298), .C(\fiforeg[3][7] ), .D(n297), 
        .Y(n93) );
  INVX2 U304 ( .A(n139), .Y(n295) );
  INVX2 U305 ( .A(n138), .Y(n296) );
  INVX2 U306 ( .A(n137), .Y(n297) );
  INVX2 U307 ( .A(n136), .Y(n298) );
  INVX2 U308 ( .A(raddr[2]), .Y(n299) );
  INVX2 U309 ( .A(raddr[1]), .Y(n300) );
  INVX2 U310 ( .A(raddr[0]), .Y(n301) );
endmodule


module write_ptr ( wclk, rst_n, wenable, wptr, wptr_nxt );
  output [3:0] wptr;
  output [3:0] wptr_nxt;
  input wclk, rst_n, wenable;
  wire   n9, n10, n11, n14, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31;
  wire   [2:0] binary_nxt;
  wire   [3:0] binary_r;

  DFFSR \binary_r_reg[0]  ( .D(n14), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        binary_r[0]) );
  DFFSR \binary_r_reg[1]  ( .D(binary_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[1]) );
  DFFSR \binary_r_reg[2]  ( .D(binary_nxt[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[2]) );
  DFFSR \binary_r_reg[3]  ( .D(n10), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        binary_r[3]) );
  DFFSR \gray_r_reg[3]  ( .D(n10), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(wptr[3]) );
  DFFSR \gray_r_reg[2]  ( .D(wptr_nxt[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[2]) );
  DFFSR \gray_r_reg[1]  ( .D(wptr_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[1]) );
  DFFSR \gray_r_reg[0]  ( .D(wptr_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[0]) );
  XNOR2X1 U11 ( .A(n22), .B(binary_r[3]), .Y(wptr_nxt[3]) );
  INVX1 U12 ( .A(wptr_nxt[3]), .Y(n9) );
  INVX1 U13 ( .A(n9), .Y(n10) );
  INVX1 U14 ( .A(binary_r[1]), .Y(n27) );
  INVX1 U15 ( .A(wenable), .Y(n24) );
  INVX2 U16 ( .A(n26), .Y(n16) );
  AND2X2 U17 ( .A(wenable), .B(n16), .Y(n11) );
  XNOR2X1 U18 ( .A(n19), .B(n14), .Y(wptr_nxt[0]) );
  XNOR2X1 U19 ( .A(n21), .B(binary_nxt[1]), .Y(wptr_nxt[1]) );
  XNOR2X1 U20 ( .A(wenable), .B(n17), .Y(n14) );
  INVX2 U21 ( .A(binary_r[0]), .Y(n17) );
  NAND2X1 U22 ( .A(binary_r[1]), .B(binary_r[0]), .Y(n26) );
  NAND2X1 U23 ( .A(wenable), .B(n16), .Y(n20) );
  AOI21X1 U24 ( .A(n17), .B(n27), .C(n11), .Y(n18) );
  OAI21X1 U25 ( .A(binary_r[1]), .B(wenable), .C(n18), .Y(n19) );
  INVX2 U26 ( .A(n19), .Y(binary_nxt[1]) );
  XOR2X1 U27 ( .A(n20), .B(binary_r[2]), .Y(n21) );
  INVX2 U28 ( .A(n21), .Y(binary_nxt[2]) );
  NAND2X1 U29 ( .A(binary_r[2]), .B(n11), .Y(n22) );
  INVX2 U30 ( .A(binary_r[2]), .Y(n23) );
  NAND3X1 U31 ( .A(binary_r[3]), .B(n24), .C(n23), .Y(n31) );
  XOR2X1 U32 ( .A(binary_r[3]), .B(binary_r[2]), .Y(n25) );
  OAI21X1 U33 ( .A(binary_r[2]), .B(n26), .C(n25), .Y(n30) );
  NOR2X1 U34 ( .A(binary_r[3]), .B(n27), .Y(n28) );
  NAND3X1 U35 ( .A(wenable), .B(binary_r[0]), .C(n28), .Y(n29) );
  NAND3X1 U36 ( .A(n31), .B(n30), .C(n29), .Y(wptr_nxt[2]) );
endmodule


module write_fifo_ctrl ( wclk, rst_n, wenable, rptr, wenable_fifo, wptr, waddr, 
        full_flag );
  input [3:0] rptr;
  output [3:0] wptr;
  output [2:0] waddr;
  input wclk, rst_n, wenable;
  output wenable_fifo, full_flag;
  wire   n26, \gray_wptr[2] , N5, n2, n3, n4, n17, n18, n20, n21, n22, n23,
         n24, n25;
  wire   [3:0] wptr_nxt;
  wire   [3:0] wrptr_r2;
  wire   [3:0] wrptr_r1;

  DFFSR \wrptr_r1_reg[3]  ( .D(rptr[3]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[3]) );
  DFFSR \wrptr_r1_reg[2]  ( .D(rptr[2]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[2]) );
  DFFSR \wrptr_r1_reg[1]  ( .D(rptr[1]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[1]) );
  DFFSR \wrptr_r1_reg[0]  ( .D(rptr[0]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[0]) );
  DFFSR \wrptr_r2_reg[3]  ( .D(wrptr_r1[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[3]) );
  DFFSR \wrptr_r2_reg[2]  ( .D(wrptr_r1[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[2]) );
  DFFSR \wrptr_r2_reg[1]  ( .D(wrptr_r1[1]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[1]) );
  DFFSR \wrptr_r2_reg[0]  ( .D(wrptr_r1[0]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[0]) );
  DFFSR full_flag_r_reg ( .D(N5), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        full_flag) );
  DFFSR \waddr_reg[2]  ( .D(\gray_wptr[2] ), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(waddr[2]) );
  DFFSR \waddr_reg[1]  ( .D(wptr_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        waddr[1]) );
  DFFSR \waddr_reg[0]  ( .D(wptr_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        n26) );
  write_ptr WPU1 ( .wclk(wclk), .rst_n(rst_n), .wenable(n18), .wptr(wptr), 
        .wptr_nxt(wptr_nxt) );
  BUFX2 U15 ( .A(n18), .Y(wenable_fifo) );
  INVX4 U16 ( .A(n17), .Y(n18) );
  BUFX2 U17 ( .A(wptr_nxt[3]), .Y(n2) );
  INVX2 U18 ( .A(n3), .Y(n17) );
  NOR2X1 U19 ( .A(n4), .B(full_flag), .Y(n3) );
  INVX8 U20 ( .A(wenable), .Y(n4) );
  BUFX4 U21 ( .A(n26), .Y(waddr[0]) );
  XOR2X1 U22 ( .A(\gray_wptr[2] ), .B(n20), .Y(n22) );
  XNOR2X1 U23 ( .A(wrptr_r2[3]), .B(wrptr_r2[2]), .Y(n20) );
  XOR2X1 U24 ( .A(wptr_nxt[1]), .B(wrptr_r2[1]), .Y(n25) );
  XOR2X1 U25 ( .A(n2), .B(wrptr_r2[3]), .Y(n23) );
  XNOR2X1 U26 ( .A(wptr_nxt[0]), .B(wrptr_r2[0]), .Y(n21) );
  NAND3X1 U27 ( .A(n23), .B(n21), .C(n22), .Y(n24) );
  NOR2X1 U28 ( .A(n25), .B(n24), .Y(N5) );
  XOR2X1 U29 ( .A(wptr_nxt[3]), .B(wptr_nxt[2]), .Y(\gray_wptr[2] ) );
endmodule


module read_ptr ( rclk, rst_n, renable, rptr, rptr_nxt );
  output [3:0] rptr;
  output [3:0] rptr_nxt;
  input rclk, rst_n, renable;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47;
  wire   [2:0] binary_nxt;
  wire   [3:0] binary_r;

  DFFSR \binary_r_reg[0]  ( .D(binary_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[0]) );
  DFFSR \binary_r_reg[1]  ( .D(binary_nxt[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[1]) );
  DFFSR \binary_r_reg[2]  ( .D(binary_nxt[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[2]) );
  DFFSR \binary_r_reg[3]  ( .D(n17), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        binary_r[3]) );
  DFFSR \gray_r_reg[3]  ( .D(n17), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(rptr[3]) );
  DFFSR \gray_r_reg[1]  ( .D(n10), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(rptr[1]) );
  DFFSR \gray_r_reg[0]  ( .D(rptr_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[0]) );
  DFFSR \gray_r_reg[2]  ( .D(rptr_nxt[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[2]) );
  INVX1 U5 ( .A(n30), .Y(n14) );
  INVX1 U11 ( .A(binary_r[3]), .Y(n39) );
  INVX2 U12 ( .A(binary_r[0]), .Y(n30) );
  INVX1 U14 ( .A(rptr_nxt[1]), .Y(n9) );
  INVX1 U15 ( .A(n9), .Y(n10) );
  INVX1 U16 ( .A(n18), .Y(n11) );
  INVX2 U17 ( .A(renable), .Y(n43) );
  INVX2 U18 ( .A(n15), .Y(n12) );
  AND2X1 U19 ( .A(n47), .B(n46), .Y(n13) );
  INVX2 U20 ( .A(renable), .Y(n15) );
  INVX2 U21 ( .A(n15), .Y(n16) );
  NAND2X1 U22 ( .A(n45), .B(n13), .Y(rptr_nxt[2]) );
  BUFX2 U23 ( .A(rptr_nxt[3]), .Y(n17) );
  INVX1 U24 ( .A(renable), .Y(n18) );
  BUFX2 U25 ( .A(n18), .Y(n19) );
  XOR2X1 U26 ( .A(n11), .B(n14), .Y(binary_nxt[0]) );
  INVX2 U27 ( .A(binary_r[1]), .Y(n25) );
  NAND2X1 U28 ( .A(binary_r[1]), .B(binary_r[0]), .Y(n42) );
  NAND2X1 U29 ( .A(n30), .B(n25), .Y(n27) );
  OAI21X1 U30 ( .A(n42), .B(n19), .C(n27), .Y(n20) );
  AOI21X1 U31 ( .A(n19), .B(n25), .C(n20), .Y(binary_nxt[1]) );
  OAI21X1 U32 ( .A(n30), .B(n25), .C(n27), .Y(n23) );
  INVX2 U33 ( .A(n27), .Y(n21) );
  OAI21X1 U34 ( .A(n14), .B(n21), .C(n42), .Y(n22) );
  AOI22X1 U35 ( .A(n23), .B(n18), .C(n22), .D(n16), .Y(rptr_nxt[0]) );
  INVX2 U36 ( .A(binary_r[2]), .Y(n44) );
  INVX2 U37 ( .A(n42), .Y(n40) );
  NAND2X1 U38 ( .A(binary_r[2]), .B(n40), .Y(n35) );
  NAND2X1 U39 ( .A(n42), .B(n44), .Y(n26) );
  OAI21X1 U40 ( .A(n19), .B(n35), .C(n26), .Y(n24) );
  AOI21X1 U41 ( .A(n19), .B(n44), .C(n24), .Y(binary_nxt[2]) );
  OAI22X1 U42 ( .A(n25), .B(n44), .C(binary_r[2]), .D(binary_r[1]), .Y(n29) );
  NOR2X1 U43 ( .A(n27), .B(n26), .Y(n28) );
  AOI21X1 U44 ( .A(n43), .B(n29), .C(n28), .Y(n33) );
  NAND2X1 U45 ( .A(n30), .B(n25), .Y(n31) );
  NAND3X1 U46 ( .A(binary_r[2]), .B(n31), .C(n12), .Y(n32) );
  AND2X2 U47 ( .A(n33), .B(n32), .Y(rptr_nxt[1]) );
  NAND2X1 U48 ( .A(n40), .B(binary_r[2]), .Y(n34) );
  NOR2X1 U49 ( .A(n39), .B(n34), .Y(n38) );
  NAND2X1 U50 ( .A(n35), .B(n39), .Y(n36) );
  OAI21X1 U51 ( .A(renable), .B(binary_r[3]), .C(n36), .Y(n37) );
  AOI21X1 U52 ( .A(n38), .B(n16), .C(n37), .Y(rptr_nxt[3]) );
  NAND3X1 U53 ( .A(n40), .B(renable), .C(n39), .Y(n47) );
  XOR2X1 U54 ( .A(binary_r[3]), .B(binary_r[2]), .Y(n41) );
  OAI21X1 U55 ( .A(binary_r[2]), .B(n42), .C(n41), .Y(n46) );
  NAND3X1 U56 ( .A(n43), .B(binary_r[3]), .C(n44), .Y(n45) );
endmodule


module read_fifo_ctrl ( rclk, rst_n, renable, wptr, rptr, raddr, empty_flag );
  input [3:0] wptr;
  output [3:0] rptr;
  output [2:0] raddr;
  input rclk, rst_n, renable;
  output empty_flag;
  wire   renable_p2, \gray_rptr[2] , N3, n1, n2, n3, n4, n17, n18, n19, n20,
         n21, n22, n23, n24;
  wire   [3:0] rptr_nxt;
  wire   [3:0] rwptr_r2;
  wire   [3:0] rwptr_r1;

  DFFSR \rwptr_r1_reg[3]  ( .D(wptr[3]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[3]) );
  DFFSR \rwptr_r1_reg[2]  ( .D(wptr[2]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[2]) );
  DFFSR \rwptr_r1_reg[1]  ( .D(wptr[1]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[1]) );
  DFFSR \rwptr_r1_reg[0]  ( .D(wptr[0]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[0]) );
  DFFSR \rwptr_r2_reg[3]  ( .D(rwptr_r1[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[3]) );
  DFFSR \rwptr_r2_reg[2]  ( .D(rwptr_r1[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[2]) );
  DFFSR \rwptr_r2_reg[1]  ( .D(rwptr_r1[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[1]) );
  DFFSR \rwptr_r2_reg[0]  ( .D(rwptr_r1[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[0]) );
  DFFSR empty_flag_r_reg ( .D(N3), .CLK(rclk), .R(1'b1), .S(rst_n), .Q(
        empty_flag) );
  DFFSR \raddr_reg[2]  ( .D(\gray_rptr[2] ), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(raddr[2]) );
  DFFSR \raddr_reg[1]  ( .D(n2), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(raddr[1])
         );
  DFFSR \raddr_reg[0]  ( .D(rptr_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        raddr[0]) );
  read_ptr RPU1 ( .rclk(rclk), .rst_n(rst_n), .renable(renable_p2), .rptr(rptr), .rptr_nxt(rptr_nxt) );
  INVX4 U15 ( .A(n17), .Y(renable_p2) );
  INVX1 U16 ( .A(rptr_nxt[3]), .Y(n3) );
  INVX1 U17 ( .A(rptr_nxt[1]), .Y(n1) );
  INVX1 U18 ( .A(n1), .Y(n2) );
  XOR2X1 U19 ( .A(n3), .B(n4), .Y(\gray_rptr[2] ) );
  INVX2 U20 ( .A(rptr_nxt[2]), .Y(n4) );
  NAND2X1 U21 ( .A(n24), .B(renable), .Y(n17) );
  XNOR2X1 U22 ( .A(rptr_nxt[2]), .B(rwptr_r2[2]), .Y(n19) );
  XNOR2X1 U23 ( .A(rptr_nxt[3]), .B(rwptr_r2[3]), .Y(n18) );
  NAND2X1 U24 ( .A(n18), .B(n19), .Y(n23) );
  XNOR2X1 U25 ( .A(rptr_nxt[1]), .B(rwptr_r2[1]), .Y(n21) );
  XNOR2X1 U26 ( .A(rptr_nxt[0]), .B(rwptr_r2[0]), .Y(n20) );
  NAND2X1 U27 ( .A(n20), .B(n21), .Y(n22) );
  NOR2X1 U28 ( .A(n22), .B(n23), .Y(N3) );
  INVX2 U29 ( .A(empty_flag), .Y(n24) );
endmodule


module fifo ( r_clk, w_clk, n_rst, r_enable, w_enable, w_data, r_data, empty, 
        full );
  input [7:0] w_data;
  output [7:0] r_data;
  input r_clk, w_clk, n_rst, r_enable, w_enable;
  output empty, full;
  wire   wenable_fifo;
  wire   [2:0] waddr;
  wire   [2:0] raddr;
  wire   [3:0] rptr;
  wire   [3:0] wptr;

  fiforam UFIFORAM ( .wclk(w_clk), .wenable(wenable_fifo), .waddr(waddr), 
        .raddr(raddr), .wdata(w_data), .rdata(r_data) );
  write_fifo_ctrl UWFC ( .wclk(w_clk), .rst_n(n_rst), .wenable(w_enable), 
        .rptr(rptr), .wenable_fifo(wenable_fifo), .wptr(wptr), .waddr(waddr), 
        .full_flag(full) );
  read_fifo_ctrl URFC ( .rclk(r_clk), .rst_n(n_rst), .renable(r_enable), 
        .wptr(wptr), .rptr(rptr), .raddr(raddr), .empty_flag(empty) );
endmodule


module tx_fifo ( clk, n_rst, read_enable, read_data, fifo_empty, fifo_full, 
        write_enable, write_data );
  output [7:0] read_data;
  input [7:0] write_data;
  input clk, n_rst, read_enable, write_enable;
  output fifo_empty, fifo_full;


  fifo FIFO ( .r_clk(clk), .w_clk(clk), .n_rst(n_rst), .r_enable(read_enable), 
        .w_enable(write_enable), .w_data(write_data), .r_data(read_data), 
        .empty(fifo_empty), .full(fifo_full) );
endmodule


module decode ( clk, n_rst, scl, sda_in, starting_byte, rw_mode, address_match, 
        stop_found, start_found );
  input [7:0] starting_byte;
  input clk, n_rst, scl, sda_in;
  output rw_mode, address_match, stop_found, start_found;
  wire   scl_pre, scl_c, scl_new, sda_pre, sda_new, sda_c, N0, N1, n10, n11,
         n12, n7, n8, n9, n13, n14, n15;
  assign rw_mode = starting_byte[0];
  assign start_found = N0;
  assign stop_found = N1;

  DFFSR scl_new_reg ( .D(scl), .CLK(clk), .R(1'b1), .S(n_rst), .Q(scl_new) );
  DFFSR scl_c_reg ( .D(scl_new), .CLK(clk), .R(1'b1), .S(n_rst), .Q(scl_c) );
  DFFSR scl_pre_reg ( .D(scl_c), .CLK(clk), .R(1'b1), .S(n_rst), .Q(scl_pre)
         );
  DFFSR sda_new_reg ( .D(sda_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(sda_new)
         );
  DFFSR sda_c_reg ( .D(sda_new), .CLK(clk), .R(1'b1), .S(n_rst), .Q(sda_c) );
  DFFSR sda_pre_reg ( .D(sda_c), .CLK(clk), .R(1'b1), .S(n_rst), .Q(sda_pre)
         );
  NOR2X1 U12 ( .A(n10), .B(n11), .Y(address_match) );
  NAND3X1 U13 ( .A(starting_byte[6]), .B(starting_byte[5]), .C(
        starting_byte[7]), .Y(n11) );
  NAND3X1 U14 ( .A(starting_byte[4]), .B(n15), .C(n12), .Y(n10) );
  NOR2X1 U15 ( .A(starting_byte[3]), .B(starting_byte[2]), .Y(n12) );
  NAND2X1 U9 ( .A(scl_pre), .B(scl_c), .Y(n13) );
  INVX2 U10 ( .A(sda_c), .Y(n7) );
  NAND2X1 U11 ( .A(sda_pre), .B(n7), .Y(n8) );
  NOR2X1 U16 ( .A(n13), .B(n8), .Y(N0) );
  INVX2 U17 ( .A(sda_pre), .Y(n9) );
  NAND2X1 U18 ( .A(sda_c), .B(n9), .Y(n14) );
  NOR2X1 U19 ( .A(n14), .B(n13), .Y(N1) );
  INVX2 U20 ( .A(starting_byte[1]), .Y(n15) );
endmodule


module flex_stp_sr_NUM_BITS8_SHIFT_MSB1 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [7:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n10, n12, n14, n16, n18, n20, n22, n24, n26, n1, n2, n3, n4, n5, n6,
         n7, n8;

  DFFSR \out_reg[0]  ( .D(n26), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  DFFSR \out_reg[1]  ( .D(n24), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \out_reg[2]  ( .D(n22), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \out_reg[3]  ( .D(n20), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \out_reg[4]  ( .D(n18), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \out_reg[5]  ( .D(n16), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \out_reg[6]  ( .D(n14), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \out_reg[7]  ( .D(n12), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  NAND2X1 U18 ( .A(serial_in), .B(shift_enable), .Y(n10) );
  INVX2 U2 ( .A(parallel_out[0]), .Y(n1) );
  OAI21X1 U3 ( .A(shift_enable), .B(n1), .C(n10), .Y(n26) );
  INVX2 U4 ( .A(parallel_out[1]), .Y(n2) );
  MUX2X1 U5 ( .B(n2), .A(n1), .S(shift_enable), .Y(n24) );
  INVX2 U6 ( .A(parallel_out[2]), .Y(n3) );
  MUX2X1 U7 ( .B(n3), .A(n2), .S(shift_enable), .Y(n22) );
  INVX2 U8 ( .A(parallel_out[3]), .Y(n4) );
  MUX2X1 U9 ( .B(n4), .A(n3), .S(shift_enable), .Y(n20) );
  INVX2 U10 ( .A(parallel_out[4]), .Y(n5) );
  MUX2X1 U11 ( .B(n5), .A(n4), .S(shift_enable), .Y(n18) );
  INVX2 U12 ( .A(parallel_out[5]), .Y(n6) );
  MUX2X1 U13 ( .B(n6), .A(n5), .S(shift_enable), .Y(n16) );
  INVX2 U14 ( .A(parallel_out[6]), .Y(n7) );
  MUX2X1 U15 ( .B(n7), .A(n6), .S(shift_enable), .Y(n14) );
  INVX2 U16 ( .A(parallel_out[7]), .Y(n8) );
  MUX2X1 U17 ( .B(n8), .A(n7), .S(shift_enable), .Y(n12) );
endmodule


module rx_sr ( clk, n_rst, sda_in, rising_edge_found, rx_enable, rx_data );
  output [7:0] rx_data;
  input clk, n_rst, sda_in, rising_edge_found, rx_enable;
  wire   _0_net_;

  flex_stp_sr_NUM_BITS8_SHIFT_MSB1 EIGHT_SHIFT ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(_0_net_), .serial_in(sda_in), .parallel_out(rx_data) );
  AND2X2 U1 ( .A(rx_enable), .B(rising_edge_found), .Y(_0_net_) );
endmodule


module flex_counter_NUM_CNT_BITS4 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n43, n48, n49, n50, n51, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77;

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
  AND2X2 U3 ( .A(rollover_val[1]), .B(rollover_val[0]), .Y(n1) );
  OAI21X1 U4 ( .A(rollover_val[3]), .B(n53), .C(n27), .Y(n2) );
  OAI21X1 U5 ( .A(n17), .B(n29), .C(n2), .Y(n3) );
  INVX2 U6 ( .A(n55), .Y(n4) );
  BUFX2 U7 ( .A(count_out[0]), .Y(n19) );
  BUFX2 U8 ( .A(n30), .Y(n5) );
  INVX1 U9 ( .A(n36), .Y(n6) );
  NOR2X1 U10 ( .A(n32), .B(n30), .Y(n7) );
  INVX4 U11 ( .A(n15), .Y(n62) );
  NAND2X1 U12 ( .A(n54), .B(n16), .Y(n8) );
  INVX1 U13 ( .A(clear), .Y(n9) );
  INVX2 U14 ( .A(n9), .Y(n10) );
  OR2X2 U15 ( .A(clear), .B(count_enable), .Y(n54) );
  INVX1 U16 ( .A(clear), .Y(n31) );
  NAND2X1 U17 ( .A(n11), .B(n12), .Y(n13) );
  NAND2X1 U18 ( .A(n41), .B(n13), .Y(n50) );
  INVX2 U19 ( .A(n62), .Y(n11) );
  INVX1 U20 ( .A(n54), .Y(n12) );
  OAI21X1 U21 ( .A(n17), .B(n29), .C(n2), .Y(n14) );
  BUFX2 U22 ( .A(count_out[2]), .Y(n15) );
  INVX1 U23 ( .A(n14), .Y(n74) );
  AND2X2 U24 ( .A(n15), .B(n14), .Y(n18) );
  AND2X1 U25 ( .A(n23), .B(n58), .Y(n24) );
  BUFX2 U26 ( .A(n31), .Y(n16) );
  INVX1 U27 ( .A(count_out[3]), .Y(n20) );
  INVX2 U28 ( .A(n20), .Y(n17) );
  INVX1 U29 ( .A(n32), .Y(n57) );
  INVX1 U30 ( .A(n30), .Y(n37) );
  INVX1 U31 ( .A(n7), .Y(n38) );
  INVX1 U32 ( .A(count_out[1]), .Y(n36) );
  INVX1 U33 ( .A(n19), .Y(n55) );
  INVX1 U34 ( .A(n17), .Y(n53) );
  INVX2 U35 ( .A(rollover_val[3]), .Y(n29) );
  NAND2X1 U36 ( .A(rollover_val[2]), .B(n62), .Y(n26) );
  INVX2 U37 ( .A(rollover_val[1]), .Y(n21) );
  OAI21X1 U38 ( .A(count_out[1]), .B(n21), .C(n19), .Y(n23) );
  INVX2 U39 ( .A(rollover_val[0]), .Y(n22) );
  NAND2X1 U40 ( .A(n22), .B(n21), .Y(n58) );
  OAI21X1 U46 ( .A(n1), .B(n36), .C(n24), .Y(n25) );
  INVX2 U47 ( .A(rollover_val[2]), .Y(n60) );
  AOI22X1 U48 ( .A(n25), .B(n26), .C(n11), .D(n60), .Y(n27) );
  OAI21X1 U49 ( .A(rollover_val[3]), .B(n53), .C(n27), .Y(n28) );
  OAI21X1 U50 ( .A(n17), .B(n29), .C(n28), .Y(n73) );
  NAND2X1 U51 ( .A(n6), .B(n73), .Y(n30) );
  NOR2X1 U52 ( .A(n10), .B(n5), .Y(n34) );
  NAND2X1 U53 ( .A(n54), .B(n16), .Y(n56) );
  NOR2X1 U54 ( .A(n37), .B(n56), .Y(n33) );
  NAND2X1 U55 ( .A(n4), .B(n3), .Y(n32) );
  MUX2X1 U56 ( .B(n34), .A(n33), .S(n57), .Y(n35) );
  OAI21X1 U57 ( .A(n36), .B(n54), .C(n35), .Y(n49) );
  NOR2X1 U58 ( .A(n56), .B(n38), .Y(n40) );
  NOR2X1 U59 ( .A(n7), .B(n10), .Y(n39) );
  MUX2X1 U60 ( .B(n40), .A(n39), .S(n18), .Y(n41) );
  AOI22X1 U61 ( .A(n17), .B(n14), .C(n7), .D(n18), .Y(n52) );
  OAI22X1 U62 ( .A(n53), .B(n54), .C(n8), .D(n52), .Y(n51) );
  OAI22X1 U63 ( .A(n57), .B(n8), .C(n55), .D(n54), .Y(n48) );
  INVX2 U64 ( .A(n58), .Y(n65) );
  NAND2X1 U65 ( .A(n65), .B(n60), .Y(n63) );
  XOR2X1 U66 ( .A(n4), .B(rollover_val[0]), .Y(n59) );
  OAI21X1 U67 ( .A(rollover_val[3]), .B(n63), .C(n59), .Y(n71) );
  OAI21X1 U68 ( .A(n65), .B(n60), .C(n63), .Y(n61) );
  XOR2X1 U69 ( .A(n62), .B(n61), .Y(n69) );
  NAND2X1 U70 ( .A(rollover_val[3]), .B(n63), .Y(n64) );
  XOR2X1 U71 ( .A(n64), .B(n17), .Y(n68) );
  NOR2X1 U72 ( .A(n65), .B(n1), .Y(n66) );
  XOR2X1 U73 ( .A(n6), .B(n66), .Y(n67) );
  NAND3X1 U74 ( .A(n69), .B(n68), .C(n67), .Y(n70) );
  NOR2X1 U75 ( .A(n71), .B(n70), .Y(n72) );
  NAND2X1 U76 ( .A(count_enable), .B(n72), .Y(n77) );
  NAND2X1 U77 ( .A(n74), .B(count_enable), .Y(n75) );
  OAI21X1 U78 ( .A(n10), .B(n75), .C(rollover_flag), .Y(n76) );
  OAI21X1 U79 ( .A(n10), .B(n77), .C(n76), .Y(n43) );
endmodule


module timer ( clk, n_rst, rising_edge_found, falling_edge_found, stop_found, 
        start_found, byte_received, ack_prep, check_ack, ack_done );
  input clk, n_rst, rising_edge_found, falling_edge_found, stop_found,
         start_found;
  output byte_received, ack_prep, check_ack, ack_done;
  wire   _0_net_, n1, n2, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16;
  wire   [3:0] count_out;

  flex_counter_NUM_CNT_BITS4 EIGHT ( .clk(clk), .n_rst(n_rst), .clear(_0_net_), 
        .count_enable(rising_edge_found), .rollover_val({1'b1, 1'b0, 1'b0, 
        1'b1}), .count_out(count_out) );
  INVX1 U3 ( .A(count_out[3]), .Y(n1) );
  INVX1 U4 ( .A(n1), .Y(n2) );
  AND2X2 U5 ( .A(count_out[0]), .B(count_out[3]), .Y(n5) );
  INVX2 U6 ( .A(n9), .Y(ack_done) );
  INVX1 U7 ( .A(ack_done), .Y(n4) );
  INVX1 U8 ( .A(count_out[2]), .Y(n10) );
  INVX1 U9 ( .A(falling_edge_found), .Y(n15) );
  INVX1 U10 ( .A(count_out[1]), .Y(n11) );
  INVX1 U11 ( .A(count_out[0]), .Y(n13) );
  INVX2 U12 ( .A(stop_found), .Y(n8) );
  NOR2X1 U13 ( .A(count_out[2]), .B(count_out[1]), .Y(n6) );
  NAND3X1 U14 ( .A(n6), .B(n5), .C(falling_edge_found), .Y(n9) );
  INVX2 U15 ( .A(start_found), .Y(n7) );
  NAND3X1 U16 ( .A(n8), .B(n4), .C(n7), .Y(_0_net_) );
  NAND3X1 U17 ( .A(n2), .B(n11), .C(n10), .Y(n12) );
  NOR2X1 U18 ( .A(n12), .B(n13), .Y(check_ack) );
  INVX2 U19 ( .A(n12), .Y(n14) );
  NAND2X1 U20 ( .A(n14), .B(n13), .Y(n16) );
  NOR2X1 U21 ( .A(n16), .B(n15), .Y(ack_prep) );
  INVX2 U22 ( .A(n16), .Y(byte_received) );
endmodule


module controller ( clk, n_rst, stop_found, start_found, byte_received, 
        ack_prep, check_ack, ack_done, rw_mode, address_match, sda_in, 
        rx_enable, tx_enable, read_enable, sda_mode, load_data );
  output [1:0] sda_mode;
  input clk, n_rst, stop_found, start_found, byte_received, ack_prep,
         check_ack, ack_done, rw_mode, address_match, sda_in;
  output rx_enable, tx_enable, read_enable, load_data;
  wire   N65, N68, n1, n2, n3, n4, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79;
  wire   [3:0] state;
  wire   [3:0] nstate;

  DFFSR \state_reg[1]  ( .D(nstate[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[0]  ( .D(nstate[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[2]  ( .D(n79), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2])
         );
  DFFSR \state_reg[3]  ( .D(nstate[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[3]) );
  AND2X2 U33 ( .A(check_ack), .B(sda_in), .Y(N68) );
  AND2X2 U34 ( .A(rw_mode), .B(address_match), .Y(N65) );
  INVX4 U3 ( .A(n78), .Y(n16) );
  MUX2X1 U4 ( .B(n48), .A(n1), .S(n53), .Y(n49) );
  INVX1 U5 ( .A(n64), .Y(n32) );
  INVX2 U6 ( .A(sda_mode[1]), .Y(n1) );
  INVX1 U7 ( .A(state[3]), .Y(n40) );
  INVX1 U8 ( .A(n13), .Y(n4) );
  OR2X1 U9 ( .A(n57), .B(n56), .Y(nstate[3]) );
  AND2X1 U10 ( .A(ack_done), .B(n18), .Y(read_enable) );
  INVX2 U11 ( .A(n14), .Y(n2) );
  INVX1 U12 ( .A(n14), .Y(n15) );
  INVX1 U13 ( .A(n75), .Y(n3) );
  BUFX4 U14 ( .A(state[3]), .Y(n13) );
  BUFX2 U15 ( .A(state[0]), .Y(n19) );
  INVX2 U16 ( .A(state[0]), .Y(n77) );
  BUFX2 U17 ( .A(tx_enable), .Y(sda_mode[1]) );
  INVX1 U18 ( .A(n78), .Y(n6) );
  NAND2X1 U19 ( .A(state[0]), .B(state[1]), .Y(n7) );
  NAND2X1 U20 ( .A(n43), .B(n8), .Y(n72) );
  INVX2 U21 ( .A(n7), .Y(n8) );
  INVX4 U22 ( .A(n2), .Y(n78) );
  INVX2 U23 ( .A(n71), .Y(load_data) );
  BUFX2 U24 ( .A(state[1]), .Y(n20) );
  INVX1 U25 ( .A(n18), .Y(n9) );
  INVX1 U26 ( .A(state[1]), .Y(n75) );
  INVX2 U31 ( .A(n74), .Y(n18) );
  AND2X2 U32 ( .A(n78), .B(n40), .Y(n11) );
  BUFX2 U35 ( .A(ack_done), .Y(n10) );
  AND2X2 U36 ( .A(n40), .B(n77), .Y(n12) );
  INVX2 U37 ( .A(state[2]), .Y(n14) );
  INVX1 U38 ( .A(n9), .Y(n41) );
  BUFX2 U39 ( .A(n10), .Y(n17) );
  INVX1 U40 ( .A(n10), .Y(n73) );
  NAND2X1 U41 ( .A(start_found), .B(n11), .Y(n22) );
  NAND2X1 U42 ( .A(n6), .B(n73), .Y(n21) );
  MUX2X1 U43 ( .B(n22), .A(n21), .S(n19), .Y(n31) );
  NAND2X1 U44 ( .A(n11), .B(n19), .Y(n62) );
  NAND3X1 U45 ( .A(n13), .B(n78), .C(n77), .Y(n27) );
  INVX2 U46 ( .A(n27), .Y(n42) );
  INVX2 U47 ( .A(sda_in), .Y(n28) );
  NAND3X1 U48 ( .A(check_ack), .B(n42), .C(n28), .Y(n29) );
  OAI21X1 U49 ( .A(byte_received), .B(n62), .C(n29), .Y(n30) );
  OR2X2 U50 ( .A(n31), .B(n30), .Y(n33) );
  INVX2 U51 ( .A(ack_prep), .Y(n53) );
  OAI21X1 U52 ( .A(n13), .B(n53), .C(n19), .Y(n64) );
  MUX2X1 U53 ( .B(n33), .A(n32), .S(n20), .Y(n38) );
  NAND3X1 U54 ( .A(n16), .B(n20), .C(n12), .Y(n71) );
  AOI22X1 U55 ( .A(check_ack), .B(n16), .C(N65), .D(n20), .Y(n34) );
  NOR2X1 U56 ( .A(n13), .B(n34), .Y(n36) );
  AOI21X1 U57 ( .A(n10), .B(n78), .C(n4), .Y(n35) );
  MUX2X1 U58 ( .B(n36), .A(n35), .S(n19), .Y(n37) );
  NAND3X1 U59 ( .A(n37), .B(n71), .C(n38), .Y(nstate[0]) );
  NOR2X1 U60 ( .A(state[1]), .B(n15), .Y(n39) );
  NAND3X1 U61 ( .A(state[3]), .B(state[0]), .C(n39), .Y(n74) );
  NAND3X1 U62 ( .A(n16), .B(n75), .C(n4), .Y(n44) );
  INVX2 U63 ( .A(n44), .Y(n58) );
  AOI21X1 U64 ( .A(n17), .B(n41), .C(n58), .Y(n52) );
  NAND2X1 U65 ( .A(n42), .B(n20), .Y(n55) );
  AND2X2 U66 ( .A(n55), .B(n9), .Y(n46) );
  NOR2X1 U67 ( .A(n13), .B(n78), .Y(n43) );
  NAND2X1 U68 ( .A(n44), .B(n72), .Y(sda_mode[0]) );
  NOR2X1 U69 ( .A(sda_mode[0]), .B(n11), .Y(n45) );
  NAND3X1 U70 ( .A(n71), .B(n46), .C(n45), .Y(n54) );
  INVX2 U71 ( .A(n54), .Y(n50) );
  INVX2 U72 ( .A(n62), .Y(n47) );
  NAND2X1 U73 ( .A(n47), .B(n3), .Y(n48) );
  AOI21X1 U74 ( .A(n50), .B(n6), .C(n49), .Y(n51) );
  NAND3X1 U75 ( .A(n52), .B(n71), .C(n51), .Y(n79) );
  OAI22X1 U76 ( .A(n53), .B(n1), .C(n17), .D(n9), .Y(n57) );
  OAI21X1 U77 ( .A(stop_found), .B(n55), .C(n54), .Y(n56) );
  NAND3X1 U78 ( .A(n17), .B(n19), .C(n58), .Y(n70) );
  NAND2X1 U79 ( .A(N68), .B(n75), .Y(n59) );
  MUX2X1 U80 ( .B(n59), .A(n73), .S(n19), .Y(n60) );
  NAND3X1 U81 ( .A(n13), .B(n60), .C(n78), .Y(n69) );
  INVX2 U82 ( .A(byte_received), .Y(n61) );
  NOR2X1 U83 ( .A(n62), .B(n61), .Y(n67) );
  NAND2X1 U84 ( .A(stop_found), .B(n13), .Y(n63) );
  OAI21X1 U85 ( .A(n16), .B(n63), .C(n77), .Y(n65) );
  NAND2X1 U86 ( .A(n65), .B(n64), .Y(n66) );
  MUX2X1 U87 ( .B(n67), .A(n66), .S(n20), .Y(n68) );
  NAND3X1 U88 ( .A(n70), .B(n69), .C(n68), .Y(nstate[1]) );
  INVX2 U89 ( .A(n72), .Y(tx_enable) );
  OAI21X1 U90 ( .A(n12), .B(n11), .C(n75), .Y(n76) );
  AOI21X1 U91 ( .A(n78), .B(n77), .C(n76), .Y(rx_enable) );
endmodule


module i2c_slave ( clk, n_rst, scl, sda_in, sda_out, write_enable, write_data, 
        fifo_empty, fifo_full );
  input [7:0] write_data;
  input clk, n_rst, scl, sda_in, write_enable;
  output sda_out, fifo_empty, fifo_full;
  wire   rising_edge_found, falling_edge_found, tx_out, tx_enable, load_data,
         read_enable, rw_mode, address_match, stop_found, start_found,
         rx_enable, byte_received, ack_prep, check_ack, ack_done, n1, n2;
  wire   [1:0] sda_mode;
  wire   [7:0] read_data;
  wire   [7:0] rx_data;

  scl_edge SCL_EDGE ( .clk(clk), .n_rst(n_rst), .scl(scl), .rising_edge_found(
        rising_edge_found), .falling_edge_found(falling_edge_found) );
  sda_sel SDA_SEL ( .tx_out(tx_out), .sda_mode(sda_mode), .sda_out(sda_out) );
  tx_sr TX_SR ( .clk(clk), .n_rst(n_rst), .tx_out(tx_out), 
        .falling_edge_found(n2), .tx_enable(tx_enable), .tx_data(read_data), 
        .load_data(load_data) );
  tx_fifo TX_FIFO ( .clk(clk), .n_rst(n_rst), .read_enable(read_enable), 
        .read_data(read_data), .fifo_empty(fifo_empty), .fifo_full(fifo_full), 
        .write_enable(write_enable), .write_data(write_data) );
  decode DECODE ( .clk(clk), .n_rst(n_rst), .scl(scl), .sda_in(sda_in), 
        .starting_byte(rx_data), .rw_mode(rw_mode), .address_match(
        address_match), .stop_found(stop_found), .start_found(start_found) );
  rx_sr RX_SR ( .clk(clk), .n_rst(n_rst), .sda_in(sda_in), .rising_edge_found(
        rising_edge_found), .rx_enable(rx_enable), .rx_data(rx_data) );
  timer TIMER ( .clk(clk), .n_rst(n_rst), .rising_edge_found(rising_edge_found), .falling_edge_found(falling_edge_found), .stop_found(stop_found), 
        .start_found(start_found), .byte_received(byte_received), .ack_prep(
        ack_prep), .check_ack(check_ack), .ack_done(ack_done) );
  controller CONTROLLER ( .clk(clk), .n_rst(n_rst), .stop_found(stop_found), 
        .start_found(start_found), .byte_received(byte_received), .ack_prep(
        ack_prep), .check_ack(check_ack), .ack_done(ack_done), .rw_mode(
        rw_mode), .address_match(address_match), .sda_in(sda_in), .rx_enable(
        rx_enable), .tx_enable(tx_enable), .read_enable(read_enable), 
        .sda_mode(sda_mode), .load_data(load_data) );
  INVX1 U1 ( .A(falling_edge_found), .Y(n1) );
  INVX1 U2 ( .A(n1), .Y(n2) );
endmodule

