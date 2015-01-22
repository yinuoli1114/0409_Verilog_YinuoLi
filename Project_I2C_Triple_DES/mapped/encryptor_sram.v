
module main_controller ( clk, n_rst, i2c_stop, i2c_rw, data_ready, next_data, 
        des_ready, output_load_enable, dir_io_sel, ag_enable, 
        key_activate_key1, key_activate_key2, output_ready );
  input clk, n_rst, i2c_stop, i2c_rw, data_ready, next_data;
  output des_ready, output_load_enable, dir_io_sel, ag_enable,
         key_activate_key1, key_activate_key2, output_ready;
  wire   n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45;
  wire   [3:0] present_state;
  wire   [3:0] next_state;

  DFFSR \present_state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(present_state[0]) );
  DFFSR \present_state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(present_state[1]) );
  DFFSR \present_state_reg[3]  ( .D(next_state[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(present_state[3]) );
  DFFSR \present_state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(present_state[2]) );
  AND2X2 U7 ( .A(present_state[0]), .B(n27), .Y(n5) );
  INVX2 U8 ( .A(present_state[3]), .Y(n45) );
  NAND3X1 U9 ( .A(present_state[1]), .B(present_state[2]), .C(n45), .Y(n6) );
  INVX2 U10 ( .A(n6), .Y(n8) );
  INVX2 U11 ( .A(present_state[0]), .Y(n31) );
  NAND2X1 U12 ( .A(n8), .B(n31), .Y(n39) );
  INVX2 U13 ( .A(present_state[2]), .Y(n27) );
  NAND3X1 U14 ( .A(present_state[1]), .B(n27), .C(n31), .Y(n22) );
  OAI21X1 U15 ( .A(data_ready), .B(n39), .C(n22), .Y(n16) );
  INVX2 U16 ( .A(present_state[1]), .Y(n14) );
  NAND2X1 U17 ( .A(present_state[3]), .B(n14), .Y(n42) );
  INVX2 U18 ( .A(n42), .Y(n7) );
  NAND2X1 U19 ( .A(n7), .B(n5), .Y(n36) );
  NAND2X1 U20 ( .A(n8), .B(present_state[0]), .Y(n40) );
  INVX2 U21 ( .A(n40), .Y(n23) );
  INVX2 U22 ( .A(next_data), .Y(n29) );
  NAND2X1 U23 ( .A(present_state[2]), .B(n14), .Y(n30) );
  INVX2 U24 ( .A(n30), .Y(n38) );
  NAND2X1 U25 ( .A(n38), .B(n45), .Y(n43) );
  INVX2 U26 ( .A(n43), .Y(n33) );
  AOI21X1 U27 ( .A(n23), .B(n29), .C(n33), .Y(n9) );
  OAI21X1 U28 ( .A(i2c_stop), .B(n36), .C(n9), .Y(n10) );
  INVX2 U29 ( .A(n10), .Y(n19) );
  NAND3X1 U30 ( .A(n5), .B(present_state[1]), .C(n45), .Y(n17) );
  INVX2 U31 ( .A(i2c_rw), .Y(n13) );
  NOR2X1 U32 ( .A(i2c_stop), .B(present_state[2]), .Y(n12) );
  NAND2X1 U33 ( .A(present_state[3]), .B(n31), .Y(n18) );
  INVX2 U34 ( .A(n18), .Y(n11) );
  AOI22X1 U35 ( .A(key_activate_key2), .B(n13), .C(n12), .D(n11), .Y(n26) );
  NAND3X1 U36 ( .A(n5), .B(n14), .C(n45), .Y(n37) );
  NAND3X1 U37 ( .A(n19), .B(n26), .C(n37), .Y(n15) );
  OR2X2 U38 ( .A(n16), .B(n15), .Y(next_state[1]) );
  INVX2 U39 ( .A(n17), .Y(key_activate_key2) );
  NAND2X1 U40 ( .A(i2c_rw), .B(key_activate_key2), .Y(n34) );
  OAI21X1 U41 ( .A(n30), .B(n18), .C(n34), .Y(n21) );
  NAND3X1 U42 ( .A(present_state[1]), .B(present_state[3]), .C(n5), .Y(n44) );
  NAND3X1 U43 ( .A(n19), .B(n39), .C(n44), .Y(n20) );
  OR2X2 U44 ( .A(n21), .B(n20), .Y(next_state[2]) );
  NAND2X1 U45 ( .A(n22), .B(n30), .Y(n24) );
  AOI22X1 U46 ( .A(present_state[3]), .B(n24), .C(n23), .D(next_data), .Y(n25)
         );
  NAND3X1 U47 ( .A(n26), .B(n44), .C(n25), .Y(next_state[3]) );
  NAND3X1 U48 ( .A(data_ready), .B(n42), .C(n27), .Y(n28) );
  OAI21X1 U49 ( .A(n30), .B(n29), .C(n28), .Y(n32) );
  OAI21X1 U50 ( .A(n33), .B(n32), .C(n31), .Y(n35) );
  NAND3X1 U51 ( .A(n35), .B(n34), .C(n40), .Y(next_state[0]) );
  INVX2 U52 ( .A(n36), .Y(output_ready) );
  INVX2 U53 ( .A(n37), .Y(key_activate_key1) );
  NAND2X1 U54 ( .A(n38), .B(present_state[0]), .Y(n41) );
  INVX2 U55 ( .A(n41), .Y(ag_enable) );
  NAND3X1 U56 ( .A(n40), .B(n43), .C(n39), .Y(dir_io_sel) );
  OAI22X1 U57 ( .A(present_state[2]), .B(n42), .C(n45), .D(n41), .Y(
        output_load_enable) );
  AOI22X1 U58 ( .A(present_state[0]), .B(n45), .C(n44), .D(n43), .Y(des_ready)
         );
endmodule


module des_io_select_2 ( clk, io_sel, ext_in, int_in, data_out_right, 
        data_out_left, ext_out );
  input [1:0] io_sel;
  input [63:0] ext_in;
  input [63:0] int_in;
  output [31:0] data_out_right;
  output [31:0] data_out_left;
  output [63:0] ext_out;
  input clk;
  wire   n132, n135, n136, n137, n138, n139, n140, n142, n143, n144, n148,
         n150, n152, n153, n154, n156, n157, n160, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n133, n134, n141, n145, n146,
         n147, n149, n151, n155, n158, n159, n161, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254;
  assign ext_out[63] = data_out_right[31];
  assign ext_out[62] = data_out_right[30];
  assign ext_out[61] = data_out_right[29];
  assign ext_out[60] = data_out_right[28];
  assign ext_out[59] = data_out_right[27];
  assign ext_out[58] = data_out_right[26];
  assign ext_out[57] = data_out_right[25];
  assign ext_out[56] = data_out_right[24];
  assign ext_out[55] = data_out_right[23];
  assign ext_out[54] = data_out_right[22];
  assign ext_out[53] = data_out_right[21];
  assign ext_out[52] = data_out_right[20];
  assign ext_out[51] = data_out_right[19];
  assign ext_out[50] = data_out_right[18];
  assign ext_out[49] = data_out_right[17];
  assign ext_out[48] = data_out_right[16];
  assign ext_out[47] = data_out_right[15];
  assign ext_out[46] = data_out_right[14];
  assign ext_out[45] = data_out_right[13];
  assign ext_out[44] = data_out_right[12];
  assign ext_out[43] = data_out_right[11];
  assign ext_out[42] = data_out_right[10];
  assign ext_out[41] = data_out_right[9];
  assign ext_out[40] = data_out_right[8];
  assign ext_out[39] = data_out_right[7];
  assign ext_out[38] = data_out_right[6];
  assign ext_out[37] = data_out_right[5];
  assign ext_out[36] = data_out_right[4];
  assign ext_out[35] = data_out_right[3];
  assign ext_out[34] = data_out_right[2];
  assign ext_out[33] = data_out_right[1];
  assign ext_out[32] = data_out_right[0];
  assign ext_out[31] = data_out_left[31];
  assign ext_out[30] = data_out_left[30];
  assign ext_out[29] = data_out_left[29];
  assign ext_out[28] = data_out_left[28];
  assign ext_out[27] = data_out_left[27];
  assign ext_out[26] = data_out_left[26];
  assign ext_out[25] = data_out_left[25];
  assign ext_out[24] = data_out_left[24];
  assign ext_out[23] = data_out_left[23];
  assign ext_out[22] = data_out_left[22];
  assign ext_out[21] = data_out_left[21];
  assign ext_out[20] = data_out_left[20];
  assign ext_out[19] = data_out_left[19];
  assign ext_out[18] = data_out_left[18];
  assign ext_out[17] = data_out_left[17];
  assign ext_out[16] = data_out_left[16];
  assign ext_out[15] = data_out_left[15];
  assign ext_out[14] = data_out_left[14];
  assign ext_out[13] = data_out_left[13];
  assign ext_out[12] = data_out_left[12];
  assign ext_out[11] = data_out_left[11];
  assign ext_out[10] = data_out_left[10];
  assign ext_out[9] = data_out_left[9];
  assign ext_out[8] = data_out_left[8];
  assign ext_out[7] = data_out_left[7];
  assign ext_out[6] = data_out_left[6];
  assign ext_out[5] = data_out_left[5];
  assign ext_out[4] = data_out_left[4];
  assign ext_out[3] = data_out_left[3];
  assign ext_out[2] = data_out_left[2];
  assign ext_out[1] = data_out_left[1];
  assign ext_out[0] = data_out_left[0];

  DFFPOSX1 \left_curr_reg[31]  ( .D(n195), .CLK(clk), .Q(data_out_left[31]) );
  DFFPOSX1 \left_curr_reg[30]  ( .D(n194), .CLK(clk), .Q(data_out_left[30]) );
  DFFPOSX1 \left_curr_reg[29]  ( .D(n193), .CLK(clk), .Q(data_out_left[29]) );
  DFFPOSX1 \left_curr_reg[28]  ( .D(n192), .CLK(clk), .Q(data_out_left[28]) );
  DFFPOSX1 \left_curr_reg[27]  ( .D(n191), .CLK(clk), .Q(data_out_left[27]) );
  DFFPOSX1 \left_curr_reg[26]  ( .D(n190), .CLK(clk), .Q(data_out_left[26]) );
  DFFPOSX1 \left_curr_reg[25]  ( .D(n189), .CLK(clk), .Q(data_out_left[25]) );
  DFFPOSX1 \left_curr_reg[24]  ( .D(n188), .CLK(clk), .Q(data_out_left[24]) );
  DFFPOSX1 \left_curr_reg[23]  ( .D(n187), .CLK(clk), .Q(data_out_left[23]) );
  DFFPOSX1 \left_curr_reg[22]  ( .D(n186), .CLK(clk), .Q(data_out_left[22]) );
  DFFPOSX1 \left_curr_reg[21]  ( .D(n185), .CLK(clk), .Q(data_out_left[21]) );
  DFFPOSX1 \left_curr_reg[20]  ( .D(n184), .CLK(clk), .Q(data_out_left[20]) );
  DFFPOSX1 \left_curr_reg[19]  ( .D(n183), .CLK(clk), .Q(data_out_left[19]) );
  DFFPOSX1 \left_curr_reg[18]  ( .D(n182), .CLK(clk), .Q(data_out_left[18]) );
  DFFPOSX1 \left_curr_reg[17]  ( .D(n181), .CLK(clk), .Q(data_out_left[17]) );
  DFFPOSX1 \left_curr_reg[16]  ( .D(n180), .CLK(clk), .Q(data_out_left[16]) );
  DFFPOSX1 \left_curr_reg[15]  ( .D(n179), .CLK(clk), .Q(data_out_left[15]) );
  DFFPOSX1 \left_curr_reg[14]  ( .D(n178), .CLK(clk), .Q(data_out_left[14]) );
  DFFPOSX1 \left_curr_reg[13]  ( .D(n177), .CLK(clk), .Q(data_out_left[13]) );
  DFFPOSX1 \left_curr_reg[12]  ( .D(n176), .CLK(clk), .Q(data_out_left[12]) );
  DFFPOSX1 \left_curr_reg[11]  ( .D(n175), .CLK(clk), .Q(data_out_left[11]) );
  DFFPOSX1 \left_curr_reg[10]  ( .D(n174), .CLK(clk), .Q(data_out_left[10]) );
  DFFPOSX1 \left_curr_reg[9]  ( .D(n173), .CLK(clk), .Q(data_out_left[9]) );
  DFFPOSX1 \left_curr_reg[8]  ( .D(n172), .CLK(clk), .Q(data_out_left[8]) );
  DFFPOSX1 \left_curr_reg[7]  ( .D(n171), .CLK(clk), .Q(data_out_left[7]) );
  DFFPOSX1 \left_curr_reg[6]  ( .D(n170), .CLK(clk), .Q(data_out_left[6]) );
  DFFPOSX1 \left_curr_reg[5]  ( .D(n169), .CLK(clk), .Q(data_out_left[5]) );
  DFFPOSX1 \left_curr_reg[4]  ( .D(n168), .CLK(clk), .Q(data_out_left[4]) );
  DFFPOSX1 \left_curr_reg[3]  ( .D(n167), .CLK(clk), .Q(data_out_left[3]) );
  DFFPOSX1 \left_curr_reg[2]  ( .D(n166), .CLK(clk), .Q(data_out_left[2]) );
  DFFPOSX1 \left_curr_reg[1]  ( .D(n165), .CLK(clk), .Q(data_out_left[1]) );
  DFFPOSX1 \left_curr_reg[0]  ( .D(n164), .CLK(clk), .Q(data_out_left[0]) );
  DFFPOSX1 \right_curr_reg[31]  ( .D(n163), .CLK(clk), .Q(data_out_right[31])
         );
  DFFPOSX1 \right_curr_reg[30]  ( .D(n162), .CLK(clk), .Q(data_out_right[30])
         );
  DFFPOSX1 \right_curr_reg[29]  ( .D(n252), .CLK(clk), .Q(data_out_right[29])
         );
  DFFPOSX1 \right_curr_reg[28]  ( .D(n160), .CLK(clk), .Q(data_out_right[28])
         );
  DFFPOSX1 \right_curr_reg[27]  ( .D(n245), .CLK(clk), .Q(data_out_right[27])
         );
  DFFPOSX1 \right_curr_reg[26]  ( .D(n244), .CLK(clk), .Q(data_out_right[26])
         );
  DFFPOSX1 \right_curr_reg[25]  ( .D(n157), .CLK(clk), .Q(data_out_right[25])
         );
  DFFPOSX1 \right_curr_reg[24]  ( .D(n156), .CLK(clk), .Q(data_out_right[24])
         );
  DFFPOSX1 \right_curr_reg[23]  ( .D(n251), .CLK(clk), .Q(data_out_right[23])
         );
  DFFPOSX1 \right_curr_reg[22]  ( .D(n154), .CLK(clk), .Q(data_out_right[22])
         );
  DFFPOSX1 \right_curr_reg[21]  ( .D(n153), .CLK(clk), .Q(data_out_right[21])
         );
  DFFPOSX1 \right_curr_reg[20]  ( .D(n152), .CLK(clk), .Q(data_out_right[20])
         );
  DFFPOSX1 \right_curr_reg[19]  ( .D(n246), .CLK(clk), .Q(data_out_right[19])
         );
  DFFPOSX1 \right_curr_reg[18]  ( .D(n150), .CLK(clk), .Q(data_out_right[18])
         );
  DFFPOSX1 \right_curr_reg[17]  ( .D(n248), .CLK(clk), .Q(data_out_right[17])
         );
  DFFPOSX1 \right_curr_reg[16]  ( .D(n148), .CLK(clk), .Q(data_out_right[16])
         );
  DFFPOSX1 \right_curr_reg[15]  ( .D(n254), .CLK(clk), .Q(data_out_right[15])
         );
  DFFPOSX1 \right_curr_reg[14]  ( .D(n243), .CLK(clk), .Q(data_out_right[14])
         );
  DFFPOSX1 \right_curr_reg[13]  ( .D(n250), .CLK(clk), .Q(data_out_right[13])
         );
  DFFPOSX1 \right_curr_reg[12]  ( .D(n144), .CLK(clk), .Q(data_out_right[12])
         );
  DFFPOSX1 \right_curr_reg[11]  ( .D(n143), .CLK(clk), .Q(data_out_right[11])
         );
  DFFPOSX1 \right_curr_reg[10]  ( .D(n142), .CLK(clk), .Q(data_out_right[10])
         );
  DFFPOSX1 \right_curr_reg[9]  ( .D(n253), .CLK(clk), .Q(data_out_right[9]) );
  DFFPOSX1 \right_curr_reg[8]  ( .D(n140), .CLK(clk), .Q(data_out_right[8]) );
  DFFPOSX1 \right_curr_reg[7]  ( .D(n139), .CLK(clk), .Q(data_out_right[7]) );
  DFFPOSX1 \right_curr_reg[6]  ( .D(n138), .CLK(clk), .Q(data_out_right[6]) );
  DFFPOSX1 \right_curr_reg[5]  ( .D(n137), .CLK(clk), .Q(data_out_right[5]) );
  DFFPOSX1 \right_curr_reg[4]  ( .D(n136), .CLK(clk), .Q(data_out_right[4]) );
  DFFPOSX1 \right_curr_reg[3]  ( .D(n135), .CLK(clk), .Q(data_out_right[3]) );
  DFFPOSX1 \right_curr_reg[2]  ( .D(n249), .CLK(clk), .Q(data_out_right[2]) );
  DFFPOSX1 \right_curr_reg[1]  ( .D(n247), .CLK(clk), .Q(data_out_right[1]) );
  DFFPOSX1 \right_curr_reg[0]  ( .D(n132), .CLK(clk), .Q(data_out_right[0]) );
  INVX2 U2 ( .A(n151), .Y(n243) );
  BUFX2 U3 ( .A(n5), .Y(n1) );
  BUFX4 U4 ( .A(n5), .Y(n2) );
  BUFX4 U5 ( .A(n5), .Y(n35) );
  INVX1 U6 ( .A(n161), .Y(n254) );
  INVX2 U7 ( .A(n237), .Y(n252) );
  INVX1 U8 ( .A(n225), .Y(n244) );
  INVX1 U9 ( .A(n229), .Y(n245) );
  INVX1 U10 ( .A(n125), .Y(n253) );
  INVX1 U11 ( .A(n201), .Y(n248) );
  INVX4 U12 ( .A(n23), .Y(n16) );
  INVX4 U13 ( .A(n21), .Y(n18) );
  INVX4 U14 ( .A(n22), .Y(n17) );
  BUFX4 U15 ( .A(n26), .Y(n20) );
  BUFX2 U16 ( .A(n236), .Y(n30) );
  INVX2 U17 ( .A(n20), .Y(n19) );
  BUFX2 U18 ( .A(n25), .Y(n23) );
  BUFX2 U19 ( .A(n26), .Y(n21) );
  BUFX2 U20 ( .A(n26), .Y(n22) );
  BUFX2 U21 ( .A(n25), .Y(n24) );
  BUFX2 U22 ( .A(n5), .Y(n31) );
  BUFX2 U23 ( .A(n5), .Y(n32) );
  BUFX2 U24 ( .A(n5), .Y(n33) );
  BUFX2 U25 ( .A(n5), .Y(n34) );
  INVX2 U26 ( .A(n234), .Y(n26) );
  AND2X2 U27 ( .A(io_sel[1]), .B(n19), .Y(n3) );
  AND2X2 U28 ( .A(io_sel[1]), .B(n19), .Y(n4) );
  INVX1 U29 ( .A(n234), .Y(n25) );
  AND2X2 U30 ( .A(io_sel[0]), .B(n19), .Y(n5) );
  INVX1 U31 ( .A(n109), .Y(n249) );
  INVX1 U32 ( .A(n217), .Y(n251) );
  INVX1 U33 ( .A(n145), .Y(n250) );
  INVX1 U34 ( .A(n3), .Y(n6) );
  INVX1 U35 ( .A(n3), .Y(n7) );
  INVX1 U36 ( .A(n3), .Y(n8) );
  INVX1 U37 ( .A(n3), .Y(n9) );
  INVX1 U38 ( .A(n4), .Y(n10) );
  INVX1 U39 ( .A(n4), .Y(n11) );
  INVX1 U40 ( .A(n4), .Y(n12) );
  INVX1 U41 ( .A(n3), .Y(n13) );
  INVX1 U42 ( .A(n4), .Y(n14) );
  INVX1 U43 ( .A(n3), .Y(n15) );
  BUFX4 U44 ( .A(n236), .Y(n27) );
  BUFX4 U45 ( .A(n236), .Y(n28) );
  BUFX4 U46 ( .A(n236), .Y(n29) );
  NAND2X1 U47 ( .A(io_sel[0]), .B(io_sel[1]), .Y(n234) );
  INVX2 U48 ( .A(data_out_left[0]), .Y(n37) );
  NAND2X1 U49 ( .A(io_sel[1]), .B(n19), .Y(n242) );
  INVX2 U50 ( .A(n242), .Y(n236) );
  AOI22X1 U51 ( .A(int_in[32]), .B(n28), .C(ext_in[32]), .D(n31), .Y(n36) );
  OAI21X1 U52 ( .A(n19), .B(n37), .C(n36), .Y(n164) );
  INVX2 U53 ( .A(data_out_left[1]), .Y(n39) );
  AOI22X1 U54 ( .A(int_in[33]), .B(n29), .C(ext_in[33]), .D(n32), .Y(n38) );
  OAI21X1 U55 ( .A(n19), .B(n39), .C(n38), .Y(n165) );
  INVX2 U56 ( .A(data_out_left[2]), .Y(n41) );
  AOI22X1 U57 ( .A(int_in[34]), .B(n29), .C(ext_in[34]), .D(n2), .Y(n40) );
  OAI21X1 U58 ( .A(n19), .B(n41), .C(n40), .Y(n166) );
  INVX2 U59 ( .A(data_out_left[3]), .Y(n43) );
  AOI22X1 U60 ( .A(int_in[35]), .B(n29), .C(ext_in[35]), .D(n34), .Y(n42) );
  OAI21X1 U61 ( .A(n19), .B(n43), .C(n42), .Y(n167) );
  INVX2 U62 ( .A(data_out_left[4]), .Y(n45) );
  AOI22X1 U63 ( .A(int_in[36]), .B(n29), .C(ext_in[36]), .D(n33), .Y(n44) );
  OAI21X1 U64 ( .A(n19), .B(n45), .C(n44), .Y(n168) );
  INVX2 U65 ( .A(data_out_left[5]), .Y(n47) );
  AOI22X1 U66 ( .A(int_in[37]), .B(n29), .C(ext_in[37]), .D(n32), .Y(n46) );
  OAI21X1 U67 ( .A(n18), .B(n47), .C(n46), .Y(n169) );
  INVX2 U68 ( .A(data_out_left[6]), .Y(n49) );
  AOI22X1 U69 ( .A(int_in[38]), .B(n29), .C(ext_in[38]), .D(n33), .Y(n48) );
  OAI21X1 U70 ( .A(n18), .B(n49), .C(n48), .Y(n170) );
  INVX2 U71 ( .A(data_out_left[7]), .Y(n51) );
  AOI22X1 U72 ( .A(int_in[39]), .B(n28), .C(ext_in[39]), .D(n34), .Y(n50) );
  OAI21X1 U73 ( .A(n18), .B(n51), .C(n50), .Y(n171) );
  INVX2 U74 ( .A(data_out_left[8]), .Y(n53) );
  AOI22X1 U75 ( .A(int_in[40]), .B(n28), .C(ext_in[40]), .D(n2), .Y(n52) );
  OAI21X1 U76 ( .A(n18), .B(n53), .C(n52), .Y(n172) );
  INVX2 U77 ( .A(data_out_left[9]), .Y(n55) );
  AOI22X1 U78 ( .A(int_in[41]), .B(n28), .C(ext_in[41]), .D(n1), .Y(n54) );
  OAI21X1 U79 ( .A(n18), .B(n55), .C(n54), .Y(n173) );
  INVX2 U80 ( .A(data_out_left[10]), .Y(n57) );
  AOI22X1 U81 ( .A(int_in[42]), .B(n28), .C(ext_in[42]), .D(n31), .Y(n56) );
  OAI21X1 U82 ( .A(n18), .B(n57), .C(n56), .Y(n174) );
  INVX2 U83 ( .A(data_out_left[11]), .Y(n59) );
  AOI22X1 U84 ( .A(int_in[43]), .B(n28), .C(ext_in[43]), .D(n32), .Y(n58) );
  OAI21X1 U85 ( .A(n18), .B(n59), .C(n58), .Y(n175) );
  INVX2 U86 ( .A(data_out_left[12]), .Y(n61) );
  AOI22X1 U87 ( .A(int_in[44]), .B(n28), .C(ext_in[44]), .D(n2), .Y(n60) );
  OAI21X1 U88 ( .A(n18), .B(n61), .C(n60), .Y(n176) );
  INVX2 U89 ( .A(data_out_left[13]), .Y(n63) );
  AOI22X1 U90 ( .A(int_in[45]), .B(n28), .C(ext_in[45]), .D(n2), .Y(n62) );
  OAI21X1 U91 ( .A(n18), .B(n63), .C(n62), .Y(n177) );
  INVX2 U92 ( .A(data_out_left[14]), .Y(n65) );
  AOI22X1 U93 ( .A(int_in[46]), .B(n28), .C(ext_in[46]), .D(n1), .Y(n64) );
  OAI21X1 U94 ( .A(n18), .B(n65), .C(n64), .Y(n178) );
  INVX2 U95 ( .A(data_out_left[15]), .Y(n67) );
  AOI22X1 U96 ( .A(int_in[47]), .B(n28), .C(ext_in[47]), .D(n1), .Y(n66) );
  OAI21X1 U97 ( .A(n18), .B(n67), .C(n66), .Y(n179) );
  INVX2 U98 ( .A(data_out_left[16]), .Y(n69) );
  AOI22X1 U99 ( .A(int_in[48]), .B(n28), .C(ext_in[48]), .D(n34), .Y(n68) );
  OAI21X1 U100 ( .A(n18), .B(n69), .C(n68), .Y(n180) );
  INVX2 U101 ( .A(data_out_left[17]), .Y(n71) );
  AOI22X1 U102 ( .A(int_in[49]), .B(n28), .C(ext_in[49]), .D(n34), .Y(n70) );
  OAI21X1 U103 ( .A(n18), .B(n71), .C(n70), .Y(n181) );
  INVX2 U104 ( .A(data_out_left[18]), .Y(n73) );
  AOI22X1 U105 ( .A(int_in[50]), .B(n28), .C(ext_in[50]), .D(n31), .Y(n72) );
  OAI21X1 U106 ( .A(n17), .B(n73), .C(n72), .Y(n182) );
  INVX2 U107 ( .A(data_out_left[19]), .Y(n75) );
  AOI22X1 U108 ( .A(int_in[51]), .B(n27), .C(ext_in[51]), .D(n1), .Y(n74) );
  OAI21X1 U109 ( .A(n17), .B(n75), .C(n74), .Y(n183) );
  INVX2 U110 ( .A(data_out_left[20]), .Y(n77) );
  AOI22X1 U111 ( .A(int_in[52]), .B(n27), .C(ext_in[52]), .D(n31), .Y(n76) );
  OAI21X1 U112 ( .A(n17), .B(n77), .C(n76), .Y(n184) );
  INVX2 U113 ( .A(data_out_left[21]), .Y(n79) );
  AOI22X1 U114 ( .A(int_in[53]), .B(n27), .C(ext_in[53]), .D(n2), .Y(n78) );
  OAI21X1 U115 ( .A(n17), .B(n79), .C(n78), .Y(n185) );
  INVX2 U116 ( .A(data_out_left[22]), .Y(n81) );
  AOI22X1 U117 ( .A(int_in[54]), .B(n27), .C(ext_in[54]), .D(n2), .Y(n80) );
  OAI21X1 U118 ( .A(n17), .B(n81), .C(n80), .Y(n186) );
  INVX2 U119 ( .A(data_out_left[23]), .Y(n83) );
  AOI22X1 U120 ( .A(int_in[55]), .B(n27), .C(ext_in[55]), .D(n32), .Y(n82) );
  OAI21X1 U121 ( .A(n17), .B(n83), .C(n82), .Y(n187) );
  INVX2 U122 ( .A(data_out_left[24]), .Y(n85) );
  AOI22X1 U123 ( .A(int_in[56]), .B(n27), .C(ext_in[56]), .D(n34), .Y(n84) );
  OAI21X1 U124 ( .A(n17), .B(n85), .C(n84), .Y(n188) );
  INVX2 U125 ( .A(data_out_left[25]), .Y(n87) );
  AOI22X1 U126 ( .A(int_in[57]), .B(n27), .C(ext_in[57]), .D(n1), .Y(n86) );
  OAI21X1 U127 ( .A(n17), .B(n87), .C(n86), .Y(n189) );
  INVX2 U128 ( .A(data_out_left[26]), .Y(n89) );
  AOI22X1 U129 ( .A(int_in[58]), .B(n27), .C(ext_in[58]), .D(n32), .Y(n88) );
  OAI21X1 U130 ( .A(n17), .B(n89), .C(n88), .Y(n190) );
  INVX2 U131 ( .A(data_out_left[27]), .Y(n91) );
  AOI22X1 U132 ( .A(int_in[59]), .B(n27), .C(ext_in[59]), .D(n33), .Y(n90) );
  OAI21X1 U133 ( .A(n17), .B(n91), .C(n90), .Y(n191) );
  INVX2 U134 ( .A(data_out_left[28]), .Y(n93) );
  AOI22X1 U135 ( .A(int_in[60]), .B(n27), .C(ext_in[60]), .D(n31), .Y(n92) );
  OAI21X1 U136 ( .A(n17), .B(n93), .C(n92), .Y(n192) );
  INVX2 U137 ( .A(data_out_left[29]), .Y(n95) );
  AOI22X1 U138 ( .A(int_in[61]), .B(n27), .C(ext_in[61]), .D(n33), .Y(n94) );
  OAI21X1 U139 ( .A(n17), .B(n95), .C(n94), .Y(n193) );
  INVX2 U140 ( .A(data_out_left[30]), .Y(n97) );
  AOI22X1 U141 ( .A(int_in[62]), .B(n27), .C(ext_in[62]), .D(n34), .Y(n96) );
  OAI21X1 U142 ( .A(n17), .B(n97), .C(n96), .Y(n194) );
  INVX2 U143 ( .A(data_out_left[31]), .Y(n99) );
  AOI22X1 U144 ( .A(int_in[63]), .B(n27), .C(ext_in[63]), .D(n33), .Y(n98) );
  OAI21X1 U145 ( .A(n16), .B(n99), .C(n98), .Y(n195) );
  INVX2 U146 ( .A(int_in[0]), .Y(n101) );
  AOI22X1 U147 ( .A(ext_in[0]), .B(n1), .C(data_out_right[0]), .D(n20), .Y(
        n100) );
  OAI21X1 U148 ( .A(n10), .B(n101), .C(n100), .Y(n132) );
  INVX2 U149 ( .A(data_out_right[1]), .Y(n103) );
  NAND2X1 U150 ( .A(ext_in[1]), .B(n35), .Y(n102) );
  OAI21X1 U151 ( .A(n16), .B(n103), .C(n102), .Y(n104) );
  OAI22X1 U152 ( .A(n29), .B(n104), .C(int_in[1]), .D(n104), .Y(n105) );
  INVX2 U153 ( .A(n105), .Y(n247) );
  INVX2 U154 ( .A(data_out_right[2]), .Y(n107) );
  NAND2X1 U155 ( .A(ext_in[2]), .B(n35), .Y(n106) );
  OAI21X1 U156 ( .A(n16), .B(n107), .C(n106), .Y(n108) );
  OAI22X1 U157 ( .A(n30), .B(n108), .C(int_in[2]), .D(n108), .Y(n109) );
  INVX2 U158 ( .A(int_in[3]), .Y(n111) );
  AOI22X1 U159 ( .A(ext_in[3]), .B(n33), .C(data_out_right[3]), .D(n23), .Y(
        n110) );
  OAI21X1 U160 ( .A(n11), .B(n111), .C(n110), .Y(n135) );
  INVX2 U161 ( .A(int_in[4]), .Y(n113) );
  AOI22X1 U162 ( .A(ext_in[4]), .B(n33), .C(data_out_right[4]), .D(n24), .Y(
        n112) );
  OAI21X1 U163 ( .A(n13), .B(n113), .C(n112), .Y(n136) );
  INVX2 U164 ( .A(int_in[5]), .Y(n115) );
  AOI22X1 U165 ( .A(ext_in[5]), .B(n32), .C(data_out_right[5]), .D(n24), .Y(
        n114) );
  OAI21X1 U166 ( .A(n14), .B(n115), .C(n114), .Y(n137) );
  INVX2 U167 ( .A(int_in[6]), .Y(n117) );
  AOI22X1 U168 ( .A(ext_in[6]), .B(n31), .C(data_out_right[6]), .D(n24), .Y(
        n116) );
  OAI21X1 U169 ( .A(n12), .B(n117), .C(n116), .Y(n138) );
  INVX2 U170 ( .A(int_in[7]), .Y(n119) );
  AOI22X1 U171 ( .A(data_out_right[7]), .B(n24), .C(ext_in[7]), .D(n33), .Y(
        n118) );
  OAI21X1 U172 ( .A(n13), .B(n119), .C(n118), .Y(n139) );
  INVX2 U173 ( .A(int_in[8]), .Y(n121) );
  AOI22X1 U174 ( .A(ext_in[8]), .B(n1), .C(data_out_right[8]), .D(n24), .Y(
        n120) );
  OAI21X1 U175 ( .A(n14), .B(n121), .C(n120), .Y(n140) );
  INVX2 U176 ( .A(data_out_right[9]), .Y(n123) );
  NAND2X1 U177 ( .A(ext_in[9]), .B(n35), .Y(n122) );
  OAI21X1 U178 ( .A(n16), .B(n123), .C(n122), .Y(n124) );
  OAI22X1 U179 ( .A(n29), .B(n124), .C(int_in[9]), .D(n124), .Y(n125) );
  INVX2 U180 ( .A(int_in[10]), .Y(n127) );
  AOI22X1 U181 ( .A(ext_in[10]), .B(n1), .C(data_out_right[10]), .D(n24), .Y(
        n126) );
  OAI21X1 U182 ( .A(n15), .B(n127), .C(n126), .Y(n142) );
  INVX2 U183 ( .A(int_in[11]), .Y(n129) );
  AOI22X1 U184 ( .A(data_out_right[11]), .B(n24), .C(ext_in[11]), .D(n32), .Y(
        n128) );
  OAI21X1 U185 ( .A(n6), .B(n129), .C(n128), .Y(n143) );
  INVX2 U186 ( .A(int_in[12]), .Y(n131) );
  AOI22X1 U187 ( .A(data_out_right[12]), .B(n24), .C(ext_in[12]), .D(n31), .Y(
        n130) );
  OAI21X1 U188 ( .A(n7), .B(n131), .C(n130), .Y(n144) );
  INVX2 U189 ( .A(data_out_right[13]), .Y(n134) );
  NAND2X1 U190 ( .A(ext_in[13]), .B(n35), .Y(n133) );
  OAI21X1 U191 ( .A(n16), .B(n134), .C(n133), .Y(n141) );
  OAI22X1 U192 ( .A(n30), .B(n141), .C(int_in[13]), .D(n141), .Y(n145) );
  INVX2 U193 ( .A(data_out_right[14]), .Y(n147) );
  NAND2X1 U194 ( .A(ext_in[14]), .B(n35), .Y(n146) );
  OAI21X1 U195 ( .A(n16), .B(n147), .C(n146), .Y(n149) );
  OAI22X1 U196 ( .A(int_in[14]), .B(n149), .C(n29), .D(n149), .Y(n151) );
  INVX2 U197 ( .A(data_out_right[15]), .Y(n158) );
  NAND2X1 U198 ( .A(ext_in[15]), .B(n35), .Y(n155) );
  OAI21X1 U199 ( .A(n16), .B(n158), .C(n155), .Y(n159) );
  OAI22X1 U200 ( .A(n30), .B(n159), .C(int_in[15]), .D(n159), .Y(n161) );
  INVX2 U201 ( .A(int_in[16]), .Y(n197) );
  AOI22X1 U202 ( .A(ext_in[16]), .B(n31), .C(data_out_right[16]), .D(n23), .Y(
        n196) );
  OAI21X1 U203 ( .A(n8), .B(n197), .C(n196), .Y(n148) );
  INVX2 U204 ( .A(data_out_right[17]), .Y(n199) );
  NAND2X1 U205 ( .A(ext_in[17]), .B(n35), .Y(n198) );
  OAI21X1 U206 ( .A(n16), .B(n199), .C(n198), .Y(n200) );
  OAI22X1 U207 ( .A(n30), .B(n200), .C(int_in[17]), .D(n200), .Y(n201) );
  INVX2 U208 ( .A(int_in[18]), .Y(n203) );
  AOI22X1 U209 ( .A(ext_in[18]), .B(n34), .C(data_out_right[18]), .D(n22), .Y(
        n202) );
  OAI21X1 U210 ( .A(n9), .B(n203), .C(n202), .Y(n150) );
  INVX2 U211 ( .A(data_out_right[19]), .Y(n205) );
  NAND2X1 U212 ( .A(ext_in[19]), .B(n35), .Y(n204) );
  OAI21X1 U213 ( .A(n16), .B(n205), .C(n204), .Y(n206) );
  OAI22X1 U214 ( .A(int_in[19]), .B(n206), .C(n29), .D(n206), .Y(n207) );
  INVX2 U215 ( .A(n207), .Y(n246) );
  INVX2 U216 ( .A(int_in[20]), .Y(n209) );
  AOI22X1 U217 ( .A(ext_in[20]), .B(n2), .C(data_out_right[20]), .D(n22), .Y(
        n208) );
  OAI21X1 U218 ( .A(n6), .B(n209), .C(n208), .Y(n152) );
  INVX2 U219 ( .A(int_in[21]), .Y(n211) );
  AOI22X1 U220 ( .A(ext_in[21]), .B(n1), .C(data_out_right[21]), .D(n22), .Y(
        n210) );
  OAI21X1 U221 ( .A(n7), .B(n211), .C(n210), .Y(n153) );
  INVX2 U222 ( .A(int_in[22]), .Y(n213) );
  AOI22X1 U223 ( .A(ext_in[22]), .B(n32), .C(data_out_right[22]), .D(n21), .Y(
        n212) );
  OAI21X1 U224 ( .A(n8), .B(n213), .C(n212), .Y(n154) );
  INVX2 U225 ( .A(data_out_right[23]), .Y(n215) );
  NAND2X1 U226 ( .A(ext_in[23]), .B(n35), .Y(n214) );
  OAI21X1 U227 ( .A(n16), .B(n215), .C(n214), .Y(n216) );
  OAI22X1 U228 ( .A(int_in[23]), .B(n216), .C(n29), .D(n216), .Y(n217) );
  INVX2 U229 ( .A(int_in[24]), .Y(n219) );
  AOI22X1 U230 ( .A(ext_in[24]), .B(n32), .C(data_out_right[24]), .D(n21), .Y(
        n218) );
  OAI21X1 U231 ( .A(n9), .B(n219), .C(n218), .Y(n156) );
  INVX2 U232 ( .A(int_in[25]), .Y(n221) );
  AOI22X1 U233 ( .A(ext_in[25]), .B(n31), .C(data_out_right[25]), .D(n21), .Y(
        n220) );
  OAI21X1 U234 ( .A(n10), .B(n221), .C(n220), .Y(n157) );
  INVX2 U235 ( .A(data_out_right[26]), .Y(n223) );
  NAND2X1 U236 ( .A(ext_in[26]), .B(n35), .Y(n222) );
  OAI21X1 U237 ( .A(n16), .B(n223), .C(n222), .Y(n224) );
  OAI22X1 U238 ( .A(int_in[26]), .B(n224), .C(n29), .D(n224), .Y(n225) );
  INVX2 U239 ( .A(data_out_right[27]), .Y(n227) );
  NAND2X1 U240 ( .A(ext_in[27]), .B(n35), .Y(n226) );
  OAI21X1 U241 ( .A(n16), .B(n227), .C(n226), .Y(n228) );
  OAI22X1 U242 ( .A(int_in[27]), .B(n228), .C(n29), .D(n228), .Y(n229) );
  INVX2 U243 ( .A(int_in[28]), .Y(n231) );
  AOI22X1 U244 ( .A(ext_in[28]), .B(n34), .C(data_out_right[28]), .D(n20), .Y(
        n230) );
  OAI21X1 U245 ( .A(n11), .B(n231), .C(n230), .Y(n160) );
  INVX2 U246 ( .A(data_out_right[29]), .Y(n233) );
  NAND2X1 U247 ( .A(ext_in[29]), .B(n35), .Y(n232) );
  OAI21X1 U248 ( .A(n16), .B(n233), .C(n232), .Y(n235) );
  OAI22X1 U249 ( .A(n30), .B(n235), .C(int_in[29]), .D(n235), .Y(n237) );
  INVX2 U250 ( .A(int_in[30]), .Y(n239) );
  AOI22X1 U251 ( .A(ext_in[30]), .B(n2), .C(data_out_right[30]), .D(n20), .Y(
        n238) );
  OAI21X1 U252 ( .A(n15), .B(n239), .C(n238), .Y(n162) );
  INVX2 U253 ( .A(int_in[31]), .Y(n241) );
  AOI22X1 U254 ( .A(ext_in[31]), .B(n33), .C(data_out_right[31]), .D(n23), .Y(
        n240) );
  OAI21X1 U255 ( .A(n12), .B(n241), .C(n240), .Y(n163) );
endmodule


module des_controller_2 ( clk, n_rst, data_ready, rw_mode, io_select, 
        next_data, round_number );
  output [1:0] io_select;
  output [4:0] round_number;
  input clk, n_rst, data_ready, rw_mode;
  output next_data;
  wire   n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115;
  wire   [4:0] state;
  wire   [4:0] nstate;

  DFFSR \state_reg[0]  ( .D(nstate[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[4]  ( .D(nstate[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[4]) );
  DFFSR \state_reg[1]  ( .D(nstate[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        n115) );
  DFFSR \state_reg[3]  ( .D(nstate[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[3]) );
  DFFSR \state_reg[2]  ( .D(nstate[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[2]) );
  NAND2X1 U8 ( .A(n12), .B(n88), .Y(n6) );
  INVX4 U9 ( .A(n46), .Y(round_number[3]) );
  INVX4 U10 ( .A(n9), .Y(n10) );
  INVX2 U11 ( .A(n11), .Y(n19) );
  INVX2 U12 ( .A(state[3]), .Y(n100) );
  INVX2 U13 ( .A(n33), .Y(n9) );
  INVX2 U14 ( .A(n17), .Y(n20) );
  BUFX2 U15 ( .A(n29), .Y(n7) );
  BUFX4 U16 ( .A(n29), .Y(n8) );
  INVX1 U17 ( .A(n110), .Y(n108) );
  INVX2 U18 ( .A(n31), .Y(n88) );
  INVX2 U19 ( .A(n31), .Y(n11) );
  INVX1 U20 ( .A(n32), .Y(n33) );
  BUFX2 U21 ( .A(state[3]), .Y(n12) );
  BUFX2 U22 ( .A(n30), .Y(n13) );
  INVX2 U23 ( .A(state[2]), .Y(n30) );
  INVX2 U24 ( .A(state[0]), .Y(n32) );
  BUFX2 U25 ( .A(state[4]), .Y(n14) );
  INVX1 U26 ( .A(n100), .Y(n21) );
  INVX1 U27 ( .A(n30), .Y(n23) );
  INVX2 U28 ( .A(n6), .Y(n114) );
  BUFX2 U29 ( .A(n9), .Y(n15) );
  INVX1 U30 ( .A(n115), .Y(n16) );
  INVX2 U31 ( .A(n115), .Y(n28) );
  INVX2 U32 ( .A(n19), .Y(n17) );
  BUFX2 U33 ( .A(n100), .Y(n18) );
  INVX1 U34 ( .A(n28), .Y(n29) );
  BUFX2 U35 ( .A(n6), .Y(n24) );
  AND2X2 U36 ( .A(n9), .B(n19), .Y(n27) );
  XOR2X1 U37 ( .A(n25), .B(n23), .Y(n71) );
  XOR2X1 U38 ( .A(n18), .B(n8), .Y(n25) );
  INVX2 U39 ( .A(rw_mode), .Y(n34) );
  AND2X2 U40 ( .A(n49), .B(n81), .Y(n26) );
  BUFX4 U41 ( .A(state[4]), .Y(n31) );
  NAND2X1 U42 ( .A(n11), .B(n100), .Y(n111) );
  NAND3X1 U43 ( .A(n16), .B(n13), .C(n10), .Y(n102) );
  NAND2X1 U44 ( .A(n13), .B(n7), .Y(n65) );
  NAND3X1 U45 ( .A(n11), .B(n32), .C(n100), .Y(n104) );
  NAND2X1 U46 ( .A(n12), .B(n88), .Y(n46) );
  NAND2X1 U47 ( .A(n10), .B(n16), .Y(n36) );
  NAND3X1 U48 ( .A(n8), .B(n15), .C(n114), .Y(n35) );
  OAI21X1 U49 ( .A(n24), .B(n36), .C(n35), .Y(n84) );
  NAND2X1 U50 ( .A(n23), .B(n8), .Y(n68) );
  OAI22X1 U51 ( .A(n104), .B(n68), .C(n111), .D(n36), .Y(n37) );
  NOR2X1 U52 ( .A(n84), .B(n37), .Y(n38) );
  OAI21X1 U53 ( .A(n65), .B(n104), .C(n38), .Y(n52) );
  NAND3X1 U54 ( .A(n10), .B(n13), .C(n8), .Y(n40) );
  NOR2X1 U55 ( .A(n23), .B(n16), .Y(n39) );
  NAND3X1 U56 ( .A(n39), .B(n10), .C(n114), .Y(n79) );
  OAI21X1 U57 ( .A(n111), .B(n40), .C(n79), .Y(n44) );
  NAND2X1 U58 ( .A(n23), .B(n16), .Y(n66) );
  NOR2X1 U59 ( .A(n10), .B(n18), .Y(n42) );
  NOR2X1 U60 ( .A(n8), .B(n19), .Y(n41) );
  NAND3X1 U61 ( .A(n42), .B(n23), .C(n41), .Y(n80) );
  OAI21X1 U62 ( .A(n104), .B(n66), .C(n80), .Y(n43) );
  OR2X2 U63 ( .A(n44), .B(n43), .Y(n59) );
  INVX2 U64 ( .A(n59), .Y(n50) );
  NAND3X1 U65 ( .A(n16), .B(n13), .C(n15), .Y(n47) );
  NAND3X1 U66 ( .A(n18), .B(n17), .C(n10), .Y(n45) );
  OAI22X1 U67 ( .A(n47), .B(n24), .C(n45), .D(n68), .Y(n83) );
  INVX2 U68 ( .A(n83), .Y(n49) );
  NOR2X1 U69 ( .A(n16), .B(n15), .Y(n48) );
  NAND3X1 U70 ( .A(n48), .B(n23), .C(n114), .Y(n81) );
  NAND2X1 U71 ( .A(n50), .B(n26), .Y(n51) );
  MUX2X1 U72 ( .B(n52), .A(n51), .S(rw_mode), .Y(n54) );
  NOR2X1 U73 ( .A(n23), .B(n21), .Y(n53) );
  NAND3X1 U74 ( .A(n27), .B(n16), .C(n53), .Y(n112) );
  AND2X2 U75 ( .A(n54), .B(n112), .Y(n55) );
  OAI21X1 U76 ( .A(n111), .B(n102), .C(n55), .Y(nstate[1]) );
  NOR2X1 U77 ( .A(n8), .B(n20), .Y(n56) );
  NAND3X1 U78 ( .A(n23), .B(n10), .C(n56), .Y(n62) );
  INVX2 U79 ( .A(n68), .Y(n57) );
  NAND3X1 U80 ( .A(n17), .B(n15), .C(n57), .Y(n61) );
  NAND2X1 U81 ( .A(n26), .B(n112), .Y(n58) );
  MUX2X1 U82 ( .B(n59), .A(n58), .S(rw_mode), .Y(n60) );
  NAND3X1 U83 ( .A(n62), .B(n61), .C(n60), .Y(nstate[2]) );
  INVX2 U84 ( .A(data_ready), .Y(n63) );
  NOR2X1 U85 ( .A(n20), .B(n63), .Y(n64) );
  MUX2X1 U86 ( .B(n64), .A(rw_mode), .S(n10), .Y(n78) );
  INVX2 U87 ( .A(n65), .Y(n101) );
  INVX2 U88 ( .A(n66), .Y(n67) );
  OAI21X1 U89 ( .A(n101), .B(n67), .C(n21), .Y(n69) );
  NAND2X1 U90 ( .A(n69), .B(n68), .Y(n70) );
  INVX2 U91 ( .A(n70), .Y(n92) );
  NAND2X1 U92 ( .A(n92), .B(n71), .Y(n89) );
  INVX2 U93 ( .A(n71), .Y(n90) );
  NAND2X1 U94 ( .A(n90), .B(n17), .Y(n75) );
  NAND2X1 U95 ( .A(n10), .B(n70), .Y(n74) );
  NOR2X1 U96 ( .A(n10), .B(n21), .Y(n73) );
  NOR2X1 U97 ( .A(n23), .B(n17), .Y(n72) );
  NAND3X1 U98 ( .A(n73), .B(n72), .C(n71), .Y(n97) );
  OAI21X1 U99 ( .A(n75), .B(n74), .C(n97), .Y(n76) );
  NAND2X1 U100 ( .A(n76), .B(n34), .Y(n77) );
  OAI21X1 U101 ( .A(n78), .B(n89), .C(n77), .Y(nstate[4]) );
  AND2X2 U102 ( .A(n80), .B(n79), .Y(n87) );
  NAND2X1 U103 ( .A(n81), .B(n112), .Y(n82) );
  MUX2X1 U104 ( .B(n83), .A(n82), .S(rw_mode), .Y(n86) );
  INVX2 U105 ( .A(n84), .Y(n85) );
  NAND3X1 U106 ( .A(n87), .B(n86), .C(n85), .Y(nstate[3]) );
  OAI21X1 U107 ( .A(data_ready), .B(n89), .C(n17), .Y(n94) );
  NOR2X1 U108 ( .A(rw_mode), .B(n90), .Y(n91) );
  NAND3X1 U109 ( .A(n92), .B(n20), .C(n91), .Y(n93) );
  MUX2X1 U110 ( .B(n94), .A(n93), .S(n10), .Y(n95) );
  INVX2 U111 ( .A(n95), .Y(n96) );
  OAI21X1 U112 ( .A(n97), .B(n34), .C(n96), .Y(nstate[0]) );
  NOR2X1 U113 ( .A(n14), .B(n32), .Y(round_number[0]) );
  NOR2X1 U114 ( .A(n31), .B(n28), .Y(round_number[1]) );
  NOR2X1 U115 ( .A(n31), .B(n30), .Y(round_number[2]) );
  NAND2X1 U116 ( .A(n100), .B(n14), .Y(n99) );
  NAND3X1 U117 ( .A(n32), .B(n28), .C(n30), .Y(n98) );
  NOR2X1 U118 ( .A(n98), .B(n99), .Y(round_number[4]) );
  NAND3X1 U119 ( .A(n101), .B(n100), .C(n27), .Y(n106) );
  INVX2 U120 ( .A(n106), .Y(next_data) );
  INVX2 U121 ( .A(n102), .Y(n103) );
  NAND2X1 U122 ( .A(n103), .B(n19), .Y(n109) );
  INVX2 U123 ( .A(n104), .Y(n105) );
  NAND2X1 U124 ( .A(n105), .B(n16), .Y(n107) );
  OAI21X1 U125 ( .A(n23), .B(n107), .C(n106), .Y(n110) );
  OAI21X1 U126 ( .A(n21), .B(n109), .C(n108), .Y(io_select[0]) );
  NOR2X1 U127 ( .A(n114), .B(n110), .Y(n113) );
  NAND3X1 U128 ( .A(n113), .B(n112), .C(n111), .Y(io_select[1]) );
endmodule


module expansion_2 ( data_in, data_out );
  input [31:0] data_in;
  output [47:0] data_out;
  wire   \data_in[0] , \data_in[31] , \data_in[30] , \data_in[29] ,
         \data_in[28] , \data_in[27] , \data_in[26] , \data_in[25] ,
         \data_in[24] , \data_in[23] , \data_in[22] , \data_in[21] ,
         \data_in[20] , \data_in[19] , \data_in[18] , \data_in[17] ,
         \data_in[16] , \data_in[15] , \data_in[14] , \data_in[13] ,
         \data_in[12] , \data_in[11] , \data_in[10] , \data_in[9] ,
         \data_in[8] , \data_in[7] , \data_in[6] , \data_in[5] , \data_in[4] ,
         \data_in[3] , \data_in[2] , \data_in[1] ;
  assign data_out[1] = \data_in[0] ;
  assign data_out[47] = \data_in[0] ;
  assign \data_in[0]  = data_in[0];
  assign data_out[0] = \data_in[31] ;
  assign data_out[46] = \data_in[31] ;
  assign \data_in[31]  = data_in[31];
  assign data_out[45] = \data_in[30] ;
  assign \data_in[30]  = data_in[30];
  assign data_out[44] = \data_in[29] ;
  assign \data_in[29]  = data_in[29];
  assign data_out[41] = \data_in[28] ;
  assign data_out[43] = \data_in[28] ;
  assign \data_in[28]  = data_in[28];
  assign data_out[40] = \data_in[27] ;
  assign data_out[42] = \data_in[27] ;
  assign \data_in[27]  = data_in[27];
  assign data_out[39] = \data_in[26] ;
  assign \data_in[26]  = data_in[26];
  assign data_out[38] = \data_in[25] ;
  assign \data_in[25]  = data_in[25];
  assign data_out[35] = \data_in[24] ;
  assign data_out[37] = \data_in[24] ;
  assign \data_in[24]  = data_in[24];
  assign data_out[34] = \data_in[23] ;
  assign data_out[36] = \data_in[23] ;
  assign \data_in[23]  = data_in[23];
  assign data_out[33] = \data_in[22] ;
  assign \data_in[22]  = data_in[22];
  assign data_out[32] = \data_in[21] ;
  assign \data_in[21]  = data_in[21];
  assign data_out[29] = \data_in[20] ;
  assign data_out[31] = \data_in[20] ;
  assign \data_in[20]  = data_in[20];
  assign data_out[28] = \data_in[19] ;
  assign data_out[30] = \data_in[19] ;
  assign \data_in[19]  = data_in[19];
  assign data_out[27] = \data_in[18] ;
  assign \data_in[18]  = data_in[18];
  assign data_out[26] = \data_in[17] ;
  assign \data_in[17]  = data_in[17];
  assign data_out[23] = \data_in[16] ;
  assign data_out[25] = \data_in[16] ;
  assign \data_in[16]  = data_in[16];
  assign data_out[22] = \data_in[15] ;
  assign data_out[24] = \data_in[15] ;
  assign \data_in[15]  = data_in[15];
  assign data_out[21] = \data_in[14] ;
  assign \data_in[14]  = data_in[14];
  assign data_out[20] = \data_in[13] ;
  assign \data_in[13]  = data_in[13];
  assign data_out[17] = \data_in[12] ;
  assign data_out[19] = \data_in[12] ;
  assign \data_in[12]  = data_in[12];
  assign data_out[16] = \data_in[11] ;
  assign data_out[18] = \data_in[11] ;
  assign \data_in[11]  = data_in[11];
  assign data_out[15] = \data_in[10] ;
  assign \data_in[10]  = data_in[10];
  assign data_out[14] = \data_in[9] ;
  assign \data_in[9]  = data_in[9];
  assign data_out[11] = \data_in[8] ;
  assign data_out[13] = \data_in[8] ;
  assign \data_in[8]  = data_in[8];
  assign data_out[10] = \data_in[7] ;
  assign data_out[12] = \data_in[7] ;
  assign \data_in[7]  = data_in[7];
  assign data_out[9] = \data_in[6] ;
  assign \data_in[6]  = data_in[6];
  assign data_out[8] = \data_in[5] ;
  assign \data_in[5]  = data_in[5];
  assign data_out[5] = \data_in[4] ;
  assign data_out[7] = \data_in[4] ;
  assign \data_in[4]  = data_in[4];
  assign data_out[4] = \data_in[3] ;
  assign data_out[6] = \data_in[3] ;
  assign \data_in[3]  = data_in[3];
  assign data_out[3] = \data_in[2] ;
  assign \data_in[2]  = data_in[2];
  assign data_out[2] = \data_in[1] ;
  assign \data_in[1]  = data_in[1];

endmodule


module key_permutation1_2 ( k_o, kout );
  input [63:0] k_o;
  output [55:0] kout;
  wire   \k_o[3] , \k_o[11] , \k_o[19] , \k_o[27] , \k_o[4] , \k_o[12] ,
         \k_o[20] , \k_o[28] , \k_o[36] , \k_o[44] , \k_o[52] , \k_o[60] ,
         \k_o[5] , \k_o[13] , \k_o[21] , \k_o[29] , \k_o[37] , \k_o[45] ,
         \k_o[53] , \k_o[61] , \k_o[6] , \k_o[14] , \k_o[22] , \k_o[30] ,
         \k_o[38] , \k_o[46] , \k_o[54] , \k_o[62] , \k_o[35] , \k_o[43] ,
         \k_o[51] , \k_o[59] , \k_o[2] , \k_o[10] , \k_o[18] , \k_o[26] ,
         \k_o[34] , \k_o[42] , \k_o[50] , \k_o[58] , \k_o[1] , \k_o[9] ,
         \k_o[17] , \k_o[25] , \k_o[33] , \k_o[41] , \k_o[49] , \k_o[57] ,
         \k_o[0] , \k_o[8] , \k_o[16] , \k_o[24] , \k_o[32] , \k_o[40] ,
         \k_o[48] , \k_o[56] ;
  assign kout[55] = \k_o[3] ;
  assign \k_o[3]  = k_o[3];
  assign kout[54] = \k_o[11] ;
  assign \k_o[11]  = k_o[11];
  assign kout[53] = \k_o[19] ;
  assign \k_o[19]  = k_o[19];
  assign kout[52] = \k_o[27] ;
  assign \k_o[27]  = k_o[27];
  assign kout[51] = \k_o[4] ;
  assign \k_o[4]  = k_o[4];
  assign kout[50] = \k_o[12] ;
  assign \k_o[12]  = k_o[12];
  assign kout[49] = \k_o[20] ;
  assign \k_o[20]  = k_o[20];
  assign kout[48] = \k_o[28] ;
  assign \k_o[28]  = k_o[28];
  assign kout[47] = \k_o[36] ;
  assign \k_o[36]  = k_o[36];
  assign kout[46] = \k_o[44] ;
  assign \k_o[44]  = k_o[44];
  assign kout[45] = \k_o[52] ;
  assign \k_o[52]  = k_o[52];
  assign kout[44] = \k_o[60] ;
  assign \k_o[60]  = k_o[60];
  assign kout[43] = \k_o[5] ;
  assign \k_o[5]  = k_o[5];
  assign kout[42] = \k_o[13] ;
  assign \k_o[13]  = k_o[13];
  assign kout[41] = \k_o[21] ;
  assign \k_o[21]  = k_o[21];
  assign kout[40] = \k_o[29] ;
  assign \k_o[29]  = k_o[29];
  assign kout[39] = \k_o[37] ;
  assign \k_o[37]  = k_o[37];
  assign kout[38] = \k_o[45] ;
  assign \k_o[45]  = k_o[45];
  assign kout[37] = \k_o[53] ;
  assign \k_o[53]  = k_o[53];
  assign kout[36] = \k_o[61] ;
  assign \k_o[61]  = k_o[61];
  assign kout[35] = \k_o[6] ;
  assign \k_o[6]  = k_o[6];
  assign kout[34] = \k_o[14] ;
  assign \k_o[14]  = k_o[14];
  assign kout[33] = \k_o[22] ;
  assign \k_o[22]  = k_o[22];
  assign kout[32] = \k_o[30] ;
  assign \k_o[30]  = k_o[30];
  assign kout[31] = \k_o[38] ;
  assign \k_o[38]  = k_o[38];
  assign kout[30] = \k_o[46] ;
  assign \k_o[46]  = k_o[46];
  assign kout[29] = \k_o[54] ;
  assign \k_o[54]  = k_o[54];
  assign kout[28] = \k_o[62] ;
  assign \k_o[62]  = k_o[62];
  assign kout[27] = \k_o[35] ;
  assign \k_o[35]  = k_o[35];
  assign kout[26] = \k_o[43] ;
  assign \k_o[43]  = k_o[43];
  assign kout[25] = \k_o[51] ;
  assign \k_o[51]  = k_o[51];
  assign kout[24] = \k_o[59] ;
  assign \k_o[59]  = k_o[59];
  assign kout[23] = \k_o[2] ;
  assign \k_o[2]  = k_o[2];
  assign kout[22] = \k_o[10] ;
  assign \k_o[10]  = k_o[10];
  assign kout[21] = \k_o[18] ;
  assign \k_o[18]  = k_o[18];
  assign kout[20] = \k_o[26] ;
  assign \k_o[26]  = k_o[26];
  assign kout[19] = \k_o[34] ;
  assign \k_o[34]  = k_o[34];
  assign kout[18] = \k_o[42] ;
  assign \k_o[42]  = k_o[42];
  assign kout[17] = \k_o[50] ;
  assign \k_o[50]  = k_o[50];
  assign kout[16] = \k_o[58] ;
  assign \k_o[58]  = k_o[58];
  assign kout[15] = \k_o[1] ;
  assign \k_o[1]  = k_o[1];
  assign kout[14] = \k_o[9] ;
  assign \k_o[9]  = k_o[9];
  assign kout[13] = \k_o[17] ;
  assign \k_o[17]  = k_o[17];
  assign kout[12] = \k_o[25] ;
  assign \k_o[25]  = k_o[25];
  assign kout[11] = \k_o[33] ;
  assign \k_o[33]  = k_o[33];
  assign kout[10] = \k_o[41] ;
  assign \k_o[41]  = k_o[41];
  assign kout[9] = \k_o[49] ;
  assign \k_o[49]  = k_o[49];
  assign kout[8] = \k_o[57] ;
  assign \k_o[57]  = k_o[57];
  assign kout[7] = \k_o[0] ;
  assign \k_o[0]  = k_o[0];
  assign kout[6] = \k_o[8] ;
  assign \k_o[8]  = k_o[8];
  assign kout[5] = \k_o[16] ;
  assign \k_o[16]  = k_o[16];
  assign kout[4] = \k_o[24] ;
  assign \k_o[24]  = k_o[24];
  assign kout[3] = \k_o[32] ;
  assign \k_o[32]  = k_o[32];
  assign kout[2] = \k_o[40] ;
  assign \k_o[40]  = k_o[40];
  assign kout[1] = \k_o[48] ;
  assign \k_o[48]  = k_o[48];
  assign kout[0] = \k_o[56] ;
  assign \k_o[56]  = k_o[56];

endmodule


module key_shift_2 ( kin, k_out, roundSel );
  input [55:0] kin;
  output [55:0] k_out;
  input [4:0] roundSel;
  wire   n99, n100, n177, n178, n321, n322, n393, n394, n429, n430, n561, n562,
         n597, n598, n657, n658, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366,
         n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377,
         n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, n388,
         n389, n390, n391, n392, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491,
         n492, n493, n494, n495, n496, n497, n498, n499, n500, n501, n502,
         n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, n513,
         n514, n515, n516, n517, n518, n519, n520, n521, n522, n523, n524,
         n525, n526, n527, n528, n529, n530, n531, n532, n533, n534, n535,
         n536, n537, n538, n539, n540, n541, n542, n543, n544, n545, n546,
         n547, n548, n549, n550, n551, n552, n553, n554, n555, n556, n557,
         n558, n559, n560, n563, n564, n565, n566, n567, n568, n569, n570,
         n571, n572, n573, n574, n575, n576, n577, n578, n579, n580, n581,
         n582, n583, n584, n585, n586, n587, n588, n589, n590, n591, n592,
         n593, n594, n595, n596, n599, n600, n601, n602, n603, n604, n605,
         n606, n607, n608, n609, n610, n611, n612, n613, n614, n615, n616,
         n617, n618, n619, n620, n621, n622, n623, n624, n625, n626, n627,
         n628, n629, n630, n631, n632, n633, n634, n635, n636, n637, n638,
         n639, n640, n641, n642, n643, n644, n645, n646, n647, n648, n649,
         n650, n651, n652, n653, n654, n655, n656, n659, n660, n661, n662,
         n663, n664, n665, n666, n667, n668, n669, n670, n671, n672, n673,
         n674, n675, n676, n677, n678, n679, n680, n681, n682, n683, n684,
         n685, n686, n687, n688, n689, n690, n691, n692, n693, n694, n695,
         n696, n697, n698, n699, n700, n701, n702, n703, n704, n705, n706,
         n707, n708, n709, n710, n711, n712, n713, n714, n715, n716, n717,
         n718, n719, n720, n721, n722, n723, n724, n725, n726, n727, n728,
         n729, n730, n731, n732, n733, n734, n735, n736, n737, n738, n739,
         n740, n741, n742, n743, n744, n745, n746, n747, n748, n749, n750,
         n751, n752, n753, n754, n755, n756, n757, n758, n759, n760, n761,
         n762, n763, n764, n765, n766, n767, n768, n769, n770, n771, n772,
         n773, n774, n775, n776, n777, n778, n779, n780, n781, n782, n783,
         n784, n785, n786, n787, n788, n789, n790, n791, n792, n793, n794,
         n795, n796, n797, n798, n799, n800, n801, n802, n803, n804, n805,
         n806, n807, n808, n809, n810, n811, n812, n813, n814, n815, n816,
         n817, n818, n819, n820, n821, n822, n823, n824, n825, n826, n827,
         n828, n829, n830, n831, n832, n833, n834, n835, n836, n837, n838,
         n839, n840, n841, n842, n843, n844, n845, n846, n847, n848, n849,
         n850, n851, n852, n853, n854, n855, n856, n857, n858, n859, n860,
         n861, n862, n863, n864, n865, n866, n867, n868, n869, n870, n871,
         n872, n873, n874, n875, n876, n877, n878, n879, n880, n881, n882,
         n883, n884, n885, n886, n887, n888, n889, n890, n891, n892, n893,
         n894, n895, n896, n897, n898, n899, n900, n901, n902, n903, n904,
         n905, n906, n907, n908, n909, n910, n911, n912, n913, n914, n915,
         n916, n917, n918, n919, n920, n921, n922, n923, n924, n925, n926,
         n927, n928, n929, n930, n931, n932, n933, n934, n935, n936, n937,
         n938;

  OR2X2 U2 ( .A(n99), .B(n100), .Y(k_out[8]) );
  OR2X2 U8 ( .A(n177), .B(n178), .Y(k_out[53]) );
  OR2X2 U20 ( .A(n321), .B(n322), .Y(k_out[42]) );
  OR2X2 U26 ( .A(n393), .B(n394), .Y(k_out[37]) );
  OR2X2 U29 ( .A(n429), .B(n430), .Y(k_out[34]) );
  OR2X2 U40 ( .A(n561), .B(n562), .Y(k_out[24]) );
  OR2X2 U43 ( .A(n597), .B(n598), .Y(k_out[21]) );
  OR2X2 U48 ( .A(n657), .B(n658), .Y(k_out[17]) );
  INVX1 U1 ( .A(n21), .Y(n1) );
  AND2X2 U3 ( .A(n193), .B(n195), .Y(n9) );
  INVX4 U4 ( .A(n166), .Y(n25) );
  INVX4 U5 ( .A(n169), .Y(n162) );
  INVX1 U6 ( .A(roundSel[3]), .Y(n194) );
  INVX1 U7 ( .A(roundSel[3]), .Y(n15) );
  INVX4 U9 ( .A(n56), .Y(n57) );
  BUFX2 U10 ( .A(n140), .Y(n2) );
  BUFX2 U11 ( .A(n140), .Y(n3) );
  BUFX4 U12 ( .A(n140), .Y(n4) );
  BUFX2 U13 ( .A(n70), .Y(n140) );
  BUFX2 U14 ( .A(roundSel[4]), .Y(n5) );
  INVX2 U15 ( .A(n161), .Y(n24) );
  INVX4 U16 ( .A(n168), .Y(n6) );
  INVX4 U17 ( .A(n168), .Y(n7) );
  INVX2 U18 ( .A(n168), .Y(n163) );
  INVX8 U19 ( .A(n86), .Y(n97) );
  INVX4 U21 ( .A(n73), .Y(n95) );
  INVX4 U22 ( .A(n552), .Y(n915) );
  BUFX2 U23 ( .A(n70), .Y(n142) );
  INVX4 U24 ( .A(n5), .Y(n79) );
  BUFX2 U25 ( .A(n917), .Y(n130) );
  AND2X1 U27 ( .A(n497), .B(n496), .Y(n8) );
  INVX8 U28 ( .A(n19), .Y(n20) );
  INVX8 U30 ( .A(n137), .Y(n56) );
  INVX2 U31 ( .A(n167), .Y(n38) );
  INVX4 U32 ( .A(n136), .Y(n45) );
  INVX4 U33 ( .A(n45), .Y(n46) );
  INVX1 U34 ( .A(n35), .Y(n10) );
  BUFX2 U35 ( .A(roundSel[1]), .Y(n11) );
  INVX4 U36 ( .A(n130), .Y(n28) );
  BUFX2 U37 ( .A(n133), .Y(n12) );
  INVX1 U38 ( .A(n189), .Y(n13) );
  INVX4 U39 ( .A(n14), .Y(n19) );
  NAND2X1 U41 ( .A(n94), .B(n197), .Y(n14) );
  INVX2 U42 ( .A(n181), .Y(n80) );
  AND2X2 U44 ( .A(n179), .B(n195), .Y(n16) );
  INVX8 U45 ( .A(n59), .Y(n160) );
  BUFX4 U46 ( .A(n92), .Y(n59) );
  INVX2 U47 ( .A(n28), .Y(n17) );
  INVX4 U49 ( .A(n28), .Y(n29) );
  INVX1 U50 ( .A(roundSel[2]), .Y(n18) );
  INVX1 U51 ( .A(roundSel[2]), .Y(n179) );
  AND2X2 U52 ( .A(n91), .B(n198), .Y(n21) );
  INVX4 U53 ( .A(n103), .Y(n22) );
  INVX2 U54 ( .A(n103), .Y(n671) );
  AND2X2 U55 ( .A(n197), .B(n91), .Y(n73) );
  AND2X2 U56 ( .A(n191), .B(n91), .Y(n23) );
  BUFX2 U57 ( .A(n921), .Y(n136) );
  BUFX4 U58 ( .A(n37), .Y(n166) );
  AND2X2 U59 ( .A(n90), .B(n80), .Y(n26) );
  INVX1 U60 ( .A(n125), .Y(n553) );
  BUFX4 U61 ( .A(n928), .Y(n149) );
  INVX2 U62 ( .A(n28), .Y(n27) );
  INVX1 U63 ( .A(n28), .Y(n30) );
  INVX2 U64 ( .A(n551), .Y(n31) );
  BUFX4 U65 ( .A(n55), .Y(n169) );
  INVX2 U66 ( .A(n97), .Y(n98) );
  INVX1 U67 ( .A(n131), .Y(n49) );
  INVX1 U68 ( .A(roundSel[3]), .Y(n32) );
  INVX2 U69 ( .A(n169), .Y(n39) );
  INVX8 U70 ( .A(n174), .Y(n171) );
  BUFX2 U71 ( .A(n919), .Y(n131) );
  BUFX4 U72 ( .A(n70), .Y(n33) );
  BUFX4 U73 ( .A(n70), .Y(n34) );
  AND2X2 U74 ( .A(n197), .B(n93), .Y(n69) );
  INVX2 U75 ( .A(n40), .Y(n41) );
  INVX8 U76 ( .A(n45), .Y(n35) );
  INVX8 U77 ( .A(n56), .Y(n36) );
  AND2X2 U78 ( .A(n93), .B(n52), .Y(n37) );
  BUFX2 U79 ( .A(n928), .Y(n148) );
  NAND2X1 U80 ( .A(n269), .B(n268), .Y(n40) );
  NAND2X1 U81 ( .A(n267), .B(n41), .Y(n270) );
  BUFX4 U82 ( .A(n87), .Y(n174) );
  INVX4 U83 ( .A(n108), .Y(n83) );
  NAND2X1 U84 ( .A(n711), .B(n712), .Y(n42) );
  NAND2X1 U85 ( .A(n710), .B(n43), .Y(n713) );
  INVX2 U86 ( .A(n42), .Y(n43) );
  INVX1 U87 ( .A(n78), .Y(n44) );
  BUFX2 U88 ( .A(n23), .Y(n143) );
  INVX4 U89 ( .A(n153), .Y(n150) );
  INVX4 U90 ( .A(n64), .Y(n154) );
  INVX1 U91 ( .A(n10), .Y(n47) );
  AND2X1 U92 ( .A(n459), .B(n458), .Y(n48) );
  AND2X2 U93 ( .A(n197), .B(n91), .Y(n76) );
  INVX2 U94 ( .A(n18), .Y(n81) );
  INVX1 U95 ( .A(n49), .Y(n50) );
  INVX8 U96 ( .A(n56), .Y(n51) );
  INVX1 U97 ( .A(n176), .Y(n52) );
  INVX1 U98 ( .A(n176), .Y(n198) );
  INVX4 U99 ( .A(n56), .Y(n53) );
  BUFX4 U100 ( .A(n62), .Y(n54) );
  AND2X2 U101 ( .A(n93), .B(n52), .Y(n55) );
  INVX2 U102 ( .A(n72), .Y(n928) );
  BUFX2 U103 ( .A(n162), .Y(n58) );
  BUFX4 U104 ( .A(n92), .Y(n161) );
  INVX4 U105 ( .A(n88), .Y(n139) );
  NAND2X1 U106 ( .A(n495), .B(n8), .Y(n498) );
  INVX2 U107 ( .A(n77), .Y(n60) );
  BUFX4 U108 ( .A(n65), .Y(n77) );
  INVX8 U109 ( .A(n167), .Y(n61) );
  INVX4 U110 ( .A(n169), .Y(n164) );
  AND2X2 U111 ( .A(n74), .B(n90), .Y(n62) );
  INVX1 U112 ( .A(n62), .Y(n551) );
  AND2X1 U113 ( .A(n305), .B(n304), .Y(n63) );
  AND2X2 U114 ( .A(n213), .B(n214), .Y(n64) );
  INVX4 U115 ( .A(n166), .Y(n165) );
  NAND2X1 U116 ( .A(n303), .B(n63), .Y(n306) );
  INVX4 U117 ( .A(n190), .Y(n929) );
  BUFX4 U118 ( .A(n37), .Y(n168) );
  AND2X2 U119 ( .A(n213), .B(n214), .Y(n65) );
  BUFX2 U120 ( .A(n24), .Y(n66) );
  BUFX4 U121 ( .A(n23), .Y(n147) );
  INVX8 U122 ( .A(n175), .Y(n170) );
  BUFX4 U123 ( .A(n87), .Y(n175) );
  NAND2X1 U124 ( .A(n368), .B(n367), .Y(n67) );
  NAND2X1 U125 ( .A(n366), .B(n68), .Y(n369) );
  INVX1 U126 ( .A(n67), .Y(n68) );
  AND2X2 U127 ( .A(n80), .B(n93), .Y(n70) );
  INVX1 U128 ( .A(n77), .Y(n71) );
  NAND2X1 U129 ( .A(n191), .B(n93), .Y(n72) );
  INVX1 U130 ( .A(n176), .Y(n74) );
  AND2X1 U131 ( .A(n233), .B(n232), .Y(n75) );
  INVX8 U132 ( .A(n76), .Y(n96) );
  NAND2X1 U133 ( .A(n457), .B(n48), .Y(n460) );
  NAND2X1 U134 ( .A(n9), .B(n192), .Y(n214) );
  INVX1 U135 ( .A(n143), .Y(n78) );
  INVX2 U136 ( .A(roundSel[4]), .Y(n215) );
  INVX4 U137 ( .A(n89), .Y(n103) );
  INVX4 U138 ( .A(n89), .Y(n104) );
  NAND2X1 U139 ( .A(n75), .B(n231), .Y(n234) );
  INVX1 U140 ( .A(n181), .Y(n197) );
  INVX8 U141 ( .A(n173), .Y(n172) );
  BUFX4 U142 ( .A(n87), .Y(n173) );
  BUFX4 U143 ( .A(n72), .Y(n82) );
  AND2X2 U144 ( .A(roundSel[0]), .B(roundSel[3]), .Y(n94) );
  AND2X2 U145 ( .A(n189), .B(roundSel[3]), .Y(n90) );
  AND2X2 U146 ( .A(n214), .B(n213), .Y(n89) );
  INVX8 U147 ( .A(n97), .Y(n102) );
  INVX8 U148 ( .A(n21), .Y(n159) );
  INVX2 U149 ( .A(n108), .Y(n84) );
  INVX4 U150 ( .A(n794), .Y(n108) );
  BUFX4 U151 ( .A(n928), .Y(n85) );
  BUFX4 U152 ( .A(n928), .Y(n86) );
  INVX4 U153 ( .A(n88), .Y(n138) );
  INVX8 U154 ( .A(n161), .Y(n158) );
  BUFX2 U155 ( .A(n915), .Y(n122) );
  INVX4 U156 ( .A(n64), .Y(n156) );
  BUFX2 U157 ( .A(n26), .Y(n127) );
  BUFX2 U158 ( .A(n62), .Y(n117) );
  INVX2 U159 ( .A(n108), .Y(n106) );
  INVX2 U160 ( .A(n108), .Y(n105) );
  BUFX2 U161 ( .A(n919), .Y(n135) );
  INVX2 U162 ( .A(n108), .Y(n107) );
  AND2X2 U163 ( .A(n91), .B(n80), .Y(n87) );
  AND2X2 U164 ( .A(n207), .B(n16), .Y(n88) );
  AND2X2 U165 ( .A(n189), .B(n15), .Y(n91) );
  AND2X2 U166 ( .A(n91), .B(n198), .Y(n92) );
  AND2X2 U167 ( .A(n13), .B(n194), .Y(n93) );
  INVX2 U168 ( .A(kin[41]), .Y(n887) );
  INVX2 U169 ( .A(kin[44]), .Y(n744) );
  INVX2 U170 ( .A(kin[50]), .Y(n785) );
  INVX2 U171 ( .A(kin[52]), .Y(n905) );
  INVX2 U172 ( .A(kin[27]), .Y(n835) );
  INVX2 U173 ( .A(kin[39]), .Y(n852) );
  INVX2 U174 ( .A(kin[15]), .Y(n828) );
  INVX2 U175 ( .A(kin[2]), .Y(n933) );
  INVX2 U176 ( .A(kin[6]), .Y(n931) );
  INVX2 U177 ( .A(kin[22]), .Y(n844) );
  INVX1 U178 ( .A(n97), .Y(n101) );
  BUFX4 U179 ( .A(n65), .Y(n157) );
  INVX4 U180 ( .A(n206), .Y(n777) );
  INVX4 U181 ( .A(n216), .Y(n784) );
  INVX8 U182 ( .A(n112), .Y(n109) );
  INVX8 U183 ( .A(n112), .Y(n110) );
  INVX8 U184 ( .A(n112), .Y(n111) );
  INVX8 U185 ( .A(n914), .Y(n112) );
  BUFX4 U186 ( .A(n62), .Y(n113) );
  BUFX4 U187 ( .A(n62), .Y(n114) );
  BUFX4 U188 ( .A(n62), .Y(n115) );
  BUFX4 U189 ( .A(n62), .Y(n116) );
  BUFX4 U190 ( .A(n915), .Y(n118) );
  BUFX4 U191 ( .A(n915), .Y(n119) );
  BUFX4 U192 ( .A(n915), .Y(n120) );
  BUFX4 U193 ( .A(n915), .Y(n121) );
  BUFX4 U194 ( .A(n26), .Y(n123) );
  BUFX4 U195 ( .A(n26), .Y(n124) );
  BUFX4 U196 ( .A(n26), .Y(n125) );
  BUFX4 U197 ( .A(n26), .Y(n126) );
  BUFX4 U198 ( .A(n917), .Y(n128) );
  BUFX4 U199 ( .A(n917), .Y(n129) );
  BUFX4 U200 ( .A(n919), .Y(n132) );
  BUFX4 U201 ( .A(n919), .Y(n133) );
  BUFX4 U202 ( .A(n919), .Y(n134) );
  BUFX4 U203 ( .A(n921), .Y(n137) );
  BUFX4 U204 ( .A(n70), .Y(n141) );
  BUFX4 U205 ( .A(n23), .Y(n144) );
  BUFX4 U206 ( .A(n23), .Y(n145) );
  BUFX4 U207 ( .A(n23), .Y(n146) );
  INVX8 U208 ( .A(n153), .Y(n151) );
  INVX8 U209 ( .A(n153), .Y(n152) );
  INVX8 U210 ( .A(n929), .Y(n153) );
  INVX8 U211 ( .A(n157), .Y(n155) );
  BUFX4 U212 ( .A(n55), .Y(n167) );
  NAND3X1 U213 ( .A(n215), .B(n179), .C(n11), .Y(n176) );
  INVX2 U214 ( .A(roundSel[0]), .Y(n189) );
  INVX2 U215 ( .A(roundSel[1]), .Y(n195) );
  NAND3X1 U216 ( .A(n16), .B(n79), .C(n94), .Y(n180) );
  INVX2 U217 ( .A(n180), .Y(n914) );
  AOI22X1 U218 ( .A(kin[11]), .B(n115), .C(kin[13]), .D(n109), .Y(n188) );
  NAND3X1 U219 ( .A(n215), .B(n195), .C(n81), .Y(n181) );
  NAND2X1 U220 ( .A(n94), .B(n74), .Y(n552) );
  AOI22X1 U221 ( .A(n124), .B(kin[7]), .C(kin[9]), .D(n118), .Y(n187) );
  NAND3X1 U222 ( .A(n215), .B(n11), .C(n81), .Y(n182) );
  INVX2 U223 ( .A(n182), .Y(n191) );
  NAND2X1 U224 ( .A(n191), .B(n90), .Y(n919) );
  INVX2 U225 ( .A(kin[3]), .Y(n474) );
  NAND2X1 U226 ( .A(n80), .B(n94), .Y(n917) );
  INVX2 U227 ( .A(kin[5]), .Y(n327) );
  OAI22X1 U228 ( .A(n131), .B(n474), .C(n27), .D(n327), .Y(n185) );
  INVX2 U229 ( .A(kin[0]), .Y(n487) );
  NAND3X1 U230 ( .A(n32), .B(n189), .C(n5), .Y(n183) );
  INVX2 U231 ( .A(n183), .Y(n207) );
  NAND2X1 U232 ( .A(n191), .B(n94), .Y(n921) );
  INVX2 U233 ( .A(kin[1]), .Y(n834) );
  OAI22X1 U234 ( .A(n487), .B(n138), .C(n51), .D(n834), .Y(n184) );
  NOR2X1 U235 ( .A(n185), .B(n184), .Y(n186) );
  NAND3X1 U236 ( .A(n188), .B(n187), .C(n186), .Y(n205) );
  AOI22X1 U237 ( .A(kin[18]), .B(n146), .C(kin[20]), .D(n4), .Y(n203) );
  NAND3X1 U238 ( .A(n90), .B(n79), .C(n16), .Y(n190) );
  AOI22X1 U239 ( .A(kin[14]), .B(n151), .C(kin[16]), .D(n102), .Y(n202) );
  INVX2 U240 ( .A(kin[26]), .Y(n819) );
  NOR2X1 U241 ( .A(roundSel[2]), .B(roundSel[0]), .Y(n193) );
  NOR2X1 U242 ( .A(roundSel[3]), .B(n215), .Y(n192) );
  NAND2X1 U243 ( .A(n32), .B(n195), .Y(n196) );
  OAI21X1 U244 ( .A(n81), .B(n196), .C(n79), .Y(n213) );
  OAI22X1 U245 ( .A(n819), .B(n159), .C(n156), .D(n835), .Y(n200) );
  INVX2 U246 ( .A(kin[24]), .Y(n837) );
  OAI22X1 U247 ( .A(n844), .B(n172), .C(n837), .D(n61), .Y(n199) );
  NOR2X1 U248 ( .A(n199), .B(n200), .Y(n201) );
  NAND3X1 U249 ( .A(n203), .B(n202), .C(n201), .Y(n204) );
  OR2X2 U250 ( .A(n204), .B(n205), .Y(k_out[0]) );
  NAND3X1 U251 ( .A(n94), .B(n79), .C(n16), .Y(n206) );
  AOI22X1 U252 ( .A(kin[12]), .B(n54), .C(n777), .D(kin[14]), .Y(n212) );
  AOI22X1 U253 ( .A(kin[8]), .B(n126), .C(kin[10]), .D(n120), .Y(n211) );
  INVX2 U254 ( .A(kin[4]), .Y(n932) );
  OAI22X1 U255 ( .A(n134), .B(n932), .C(n931), .D(n128), .Y(n209) );
  NAND2X1 U256 ( .A(n207), .B(n16), .Y(n794) );
  OAI22X1 U257 ( .A(n834), .B(n84), .C(n933), .D(n57), .Y(n208) );
  NOR2X1 U258 ( .A(n208), .B(n209), .Y(n210) );
  NAND3X1 U259 ( .A(n212), .B(n211), .C(n210), .Y(n223) );
  AOI22X1 U260 ( .A(n671), .B(kin[0]), .C(kin[19]), .D(n146), .Y(n221) );
  NAND3X1 U261 ( .A(n90), .B(n79), .C(n16), .Y(n216) );
  AOI22X1 U262 ( .A(kin[21]), .B(n33), .C(n784), .D(kin[15]), .Y(n220) );
  INVX2 U263 ( .A(kin[23]), .Y(n843) );
  OAI22X1 U264 ( .A(n159), .B(n835), .C(n96), .D(n843), .Y(n218) );
  INVX2 U265 ( .A(kin[25]), .Y(n836) );
  INVX2 U266 ( .A(kin[17]), .Y(n827) );
  OAI22X1 U267 ( .A(n165), .B(n836), .C(n82), .D(n827), .Y(n217) );
  NOR2X1 U268 ( .A(n217), .B(n218), .Y(n219) );
  NAND3X1 U269 ( .A(n220), .B(n221), .C(n219), .Y(n222) );
  OR2X2 U270 ( .A(n223), .B(n222), .Y(k_out[1]) );
  AOI22X1 U271 ( .A(kin[13]), .B(n115), .C(kin[15]), .D(n111), .Y(n228) );
  AOI22X1 U272 ( .A(kin[9]), .B(n124), .C(kin[11]), .D(n118), .Y(n227) );
  INVX2 U273 ( .A(kin[7]), .Y(n930) );
  OAI22X1 U274 ( .A(n134), .B(n327), .C(n930), .D(n128), .Y(n225) );
  OAI22X1 U275 ( .A(n933), .B(n138), .C(n36), .D(n474), .Y(n224) );
  NOR2X1 U276 ( .A(n225), .B(n224), .Y(n226) );
  NAND3X1 U277 ( .A(n228), .B(n227), .C(n226), .Y(n235) );
  AOI22X1 U278 ( .A(kin[20]), .B(n147), .C(kin[22]), .D(n142), .Y(n233) );
  AOI22X1 U279 ( .A(kin[16]), .B(n150), .C(kin[18]), .D(n148), .Y(n232) );
  OAI22X1 U280 ( .A(n487), .B(n160), .C(n156), .D(n834), .Y(n230) );
  OAI22X1 U281 ( .A(n837), .B(n95), .C(n819), .D(n39), .Y(n229) );
  NOR2X1 U282 ( .A(n229), .B(n230), .Y(n231) );
  OR2X2 U283 ( .A(n235), .B(n234), .Y(k_out[2]) );
  AOI22X1 U284 ( .A(kin[14]), .B(n113), .C(kin[16]), .D(n111), .Y(n240) );
  AOI22X1 U285 ( .A(kin[10]), .B(n123), .C(kin[12]), .D(n119), .Y(n239) );
  INVX2 U286 ( .A(kin[8]), .Y(n922) );
  OAI22X1 U287 ( .A(n931), .B(n133), .C(n922), .D(n29), .Y(n237) );
  OAI22X1 U288 ( .A(n474), .B(n83), .C(n932), .D(n51), .Y(n236) );
  NOR2X1 U289 ( .A(n237), .B(n236), .Y(n238) );
  NAND3X1 U290 ( .A(n240), .B(n239), .C(n238), .Y(n247) );
  AOI22X1 U291 ( .A(kin[21]), .B(n146), .C(kin[23]), .D(n141), .Y(n245) );
  AOI22X1 U292 ( .A(kin[17]), .B(n151), .C(kin[19]), .D(n148), .Y(n244) );
  OAI22X1 U293 ( .A(n159), .B(n834), .C(n933), .D(n104), .Y(n242) );
  OAI22X1 U294 ( .A(n95), .B(n836), .C(n61), .D(n835), .Y(n241) );
  NOR2X1 U295 ( .A(n241), .B(n242), .Y(n243) );
  NAND3X1 U296 ( .A(n245), .B(n244), .C(n243), .Y(n246) );
  OR2X2 U297 ( .A(n247), .B(n246), .Y(k_out[3]) );
  AOI22X1 U298 ( .A(kin[15]), .B(n113), .C(kin[17]), .D(n111), .Y(n252) );
  AOI22X1 U299 ( .A(kin[11]), .B(n125), .C(kin[13]), .D(n122), .Y(n251) );
  INVX2 U300 ( .A(kin[9]), .Y(n920) );
  OAI22X1 U301 ( .A(n930), .B(n132), .C(n920), .D(n128), .Y(n249) );
  OAI22X1 U302 ( .A(n932), .B(n138), .C(n35), .D(n327), .Y(n248) );
  NOR2X1 U303 ( .A(n248), .B(n249), .Y(n250) );
  NAND3X1 U304 ( .A(n252), .B(n251), .C(n250), .Y(n259) );
  AOI22X1 U305 ( .A(kin[22]), .B(n144), .C(kin[24]), .D(n141), .Y(n257) );
  AOI22X1 U306 ( .A(kin[18]), .B(n152), .C(kin[20]), .D(n85), .Y(n256) );
  OAI22X1 U307 ( .A(n933), .B(n159), .C(n154), .D(n474), .Y(n254) );
  OAI22X1 U308 ( .A(n819), .B(n96), .C(n487), .D(n39), .Y(n253) );
  NOR2X1 U309 ( .A(n254), .B(n253), .Y(n255) );
  NAND3X1 U310 ( .A(n257), .B(n256), .C(n255), .Y(n258) );
  OR2X2 U311 ( .A(n259), .B(n258), .Y(k_out[4]) );
  AOI22X1 U312 ( .A(kin[16]), .B(n31), .C(kin[18]), .D(n111), .Y(n264) );
  AOI22X1 U313 ( .A(kin[12]), .B(n124), .C(kin[14]), .D(n119), .Y(n263) );
  INVX2 U314 ( .A(kin[10]), .Y(n388) );
  OAI22X1 U315 ( .A(n922), .B(n134), .C(n129), .D(n388), .Y(n261) );
  OAI22X1 U316 ( .A(n138), .B(n327), .C(n931), .D(n51), .Y(n260) );
  NOR2X1 U317 ( .A(n261), .B(n260), .Y(n262) );
  NAND3X1 U318 ( .A(n264), .B(n263), .C(n262), .Y(n271) );
  AOI22X1 U319 ( .A(kin[23]), .B(n147), .C(kin[25]), .D(n2), .Y(n269) );
  AOI22X1 U320 ( .A(kin[19]), .B(n151), .C(kin[21]), .D(n149), .Y(n268) );
  OAI22X1 U321 ( .A(n159), .B(n474), .C(n932), .D(n156), .Y(n266) );
  OAI22X1 U322 ( .A(n172), .B(n835), .C(n25), .D(n834), .Y(n265) );
  NOR2X1 U323 ( .A(n266), .B(n265), .Y(n267) );
  OR2X2 U324 ( .A(n271), .B(n270), .Y(k_out[5]) );
  AOI22X1 U325 ( .A(kin[17]), .B(n116), .C(n777), .D(kin[19]), .Y(n276) );
  AOI22X1 U326 ( .A(kin[13]), .B(n123), .C(n118), .D(kin[15]), .Y(n275) );
  INVX2 U327 ( .A(kin[11]), .Y(n918) );
  OAI22X1 U328 ( .A(n920), .B(n133), .C(n20), .D(n918), .Y(n273) );
  OAI22X1 U329 ( .A(n931), .B(n83), .C(n930), .D(n46), .Y(n272) );
  NOR2X1 U330 ( .A(n273), .B(n272), .Y(n274) );
  NAND3X1 U331 ( .A(n276), .B(n275), .C(n274), .Y(n283) );
  AOI22X1 U332 ( .A(n22), .B(kin[5]), .C(kin[24]), .D(n144), .Y(n281) );
  AOI22X1 U333 ( .A(n33), .B(kin[26]), .C(n784), .D(kin[20]), .Y(n280) );
  OAI22X1 U334 ( .A(n932), .B(n158), .C(n487), .D(n170), .Y(n278) );
  OAI22X1 U335 ( .A(n165), .B(n933), .C(n844), .D(n82), .Y(n277) );
  NOR2X1 U336 ( .A(n278), .B(n277), .Y(n279) );
  NAND3X1 U337 ( .A(n280), .B(n281), .C(n279), .Y(n282) );
  OR2X2 U338 ( .A(n283), .B(n282), .Y(k_out[6]) );
  AOI22X1 U339 ( .A(kin[18]), .B(n54), .C(n777), .D(kin[20]), .Y(n288) );
  AOI22X1 U340 ( .A(kin[14]), .B(n126), .C(kin[16]), .D(n120), .Y(n287) );
  INVX2 U341 ( .A(kin[12]), .Y(n403) );
  OAI22X1 U342 ( .A(n134), .B(n388), .C(n128), .D(n403), .Y(n285) );
  OAI22X1 U343 ( .A(n930), .B(n107), .C(n57), .D(n922), .Y(n284) );
  NOR2X1 U344 ( .A(n284), .B(n285), .Y(n286) );
  NAND3X1 U345 ( .A(n288), .B(n287), .C(n286), .Y(n295) );
  AOI22X1 U346 ( .A(kin[25]), .B(n144), .C(kin[27]), .D(n4), .Y(n293) );
  AOI22X1 U347 ( .A(n784), .B(kin[21]), .C(kin[23]), .D(n85), .Y(n292) );
  OAI22X1 U348 ( .A(n160), .B(n327), .C(n103), .D(n931), .Y(n290) );
  OAI22X1 U349 ( .A(n96), .B(n834), .C(n164), .D(n474), .Y(n289) );
  NOR2X1 U350 ( .A(n289), .B(n290), .Y(n291) );
  NAND3X1 U351 ( .A(n292), .B(n293), .C(n291), .Y(n294) );
  OR2X2 U352 ( .A(n295), .B(n294), .Y(k_out[7]) );
  AOI22X1 U353 ( .A(kin[20]), .B(n115), .C(n111), .D(kin[22]), .Y(n300) );
  AOI22X1 U354 ( .A(kin[16]), .B(n126), .C(kin[18]), .D(n120), .Y(n299) );
  INVX2 U355 ( .A(kin[14]), .Y(n428) );
  OAI22X1 U356 ( .A(n132), .B(n403), .C(n128), .D(n428), .Y(n297) );
  OAI22X1 U357 ( .A(n920), .B(n107), .C(n57), .D(n388), .Y(n296) );
  NOR2X1 U358 ( .A(n296), .B(n297), .Y(n298) );
  NAND3X1 U359 ( .A(n300), .B(n299), .C(n298), .Y(n307) );
  AOI22X1 U360 ( .A(kin[27]), .B(n147), .C(kin[1]), .D(n142), .Y(n305) );
  AOI22X1 U361 ( .A(kin[23]), .B(n150), .C(kin[25]), .D(n86), .Y(n304) );
  OAI22X1 U362 ( .A(n160), .B(n930), .C(n154), .D(n922), .Y(n302) );
  OAI22X1 U363 ( .A(n95), .B(n474), .C(n164), .D(n327), .Y(n301) );
  NOR2X1 U364 ( .A(n301), .B(n302), .Y(n303) );
  OR2X2 U365 ( .A(n307), .B(n306), .Y(k_out[9]) );
  AOI22X1 U366 ( .A(kin[21]), .B(n116), .C(kin[23]), .D(n111), .Y(n312) );
  AOI22X1 U367 ( .A(kin[17]), .B(n127), .C(n122), .D(kin[19]), .Y(n311) );
  INVX2 U368 ( .A(kin[13]), .Y(n916) );
  OAI22X1 U369 ( .A(n916), .B(n134), .C(n828), .D(n17), .Y(n309) );
  OAI22X1 U370 ( .A(n139), .B(n388), .C(n46), .D(n918), .Y(n308) );
  NOR2X1 U371 ( .A(n308), .B(n309), .Y(n310) );
  NAND3X1 U372 ( .A(n312), .B(n311), .C(n310), .Y(n319) );
  AOI22X1 U373 ( .A(kin[0]), .B(n144), .C(kin[2]), .D(n33), .Y(n317) );
  AOI22X1 U374 ( .A(kin[24]), .B(n152), .C(n85), .D(kin[26]), .Y(n316) );
  OAI22X1 U375 ( .A(n159), .B(n922), .C(n154), .D(n920), .Y(n314) );
  OAI22X1 U376 ( .A(n932), .B(n95), .C(n38), .D(n931), .Y(n313) );
  NOR2X1 U377 ( .A(n313), .B(n314), .Y(n315) );
  NAND3X1 U378 ( .A(n317), .B(n316), .C(n315), .Y(n318) );
  OR2X2 U379 ( .A(n319), .B(n318), .Y(k_out[10]) );
  AOI22X1 U380 ( .A(n116), .B(kin[22]), .C(n777), .D(kin[24]), .Y(n326) );
  AOI22X1 U381 ( .A(kin[18]), .B(n126), .C(kin[20]), .D(n118), .Y(n325) );
  INVX2 U382 ( .A(kin[16]), .Y(n813) );
  OAI22X1 U383 ( .A(n133), .B(n428), .C(n129), .D(n813), .Y(n323) );
  OAI22X1 U384 ( .A(n918), .B(n105), .C(n35), .D(n403), .Y(n320) );
  NOR2X1 U385 ( .A(n323), .B(n320), .Y(n324) );
  NAND3X1 U386 ( .A(n326), .B(n325), .C(n324), .Y(n334) );
  AOI22X1 U387 ( .A(n22), .B(kin[10]), .C(kin[1]), .D(n143), .Y(n332) );
  AOI22X1 U388 ( .A(kin[3]), .B(n141), .C(n784), .D(kin[25]), .Y(n331) );
  OAI22X1 U389 ( .A(n159), .B(n920), .C(n171), .D(n327), .Y(n329) );
  OAI22X1 U390 ( .A(n25), .B(n930), .C(n82), .D(n835), .Y(n328) );
  NOR2X1 U391 ( .A(n328), .B(n329), .Y(n330) );
  NAND3X1 U392 ( .A(n331), .B(n332), .C(n330), .Y(n333) );
  OR2X2 U393 ( .A(n334), .B(n333), .Y(k_out[11]) );
  AOI22X1 U394 ( .A(kin[23]), .B(n116), .C(n777), .D(kin[25]), .Y(n339) );
  AOI22X1 U395 ( .A(n127), .B(kin[19]), .C(n118), .D(kin[21]), .Y(n338) );
  OAI22X1 U396 ( .A(n828), .B(n135), .C(n827), .D(n20), .Y(n336) );
  OAI22X1 U397 ( .A(n403), .B(n83), .C(n36), .D(n916), .Y(n335) );
  NOR2X1 U398 ( .A(n336), .B(n335), .Y(n337) );
  NAND3X1 U399 ( .A(n339), .B(n338), .C(n337), .Y(n346) );
  AOI22X1 U400 ( .A(kin[2]), .B(n146), .C(kin[4]), .D(n34), .Y(n344) );
  AOI22X1 U401 ( .A(n784), .B(kin[26]), .C(n102), .D(kin[0]), .Y(n343) );
  OAI22X1 U402 ( .A(n159), .B(n388), .C(n918), .D(n104), .Y(n341) );
  OAI22X1 U403 ( .A(n171), .B(n931), .C(n61), .D(n922), .Y(n340) );
  NOR2X1 U404 ( .A(n341), .B(n340), .Y(n342) );
  NAND3X1 U405 ( .A(n344), .B(n343), .C(n342), .Y(n345) );
  OR2X2 U406 ( .A(n346), .B(n345), .Y(k_out[12]) );
  AOI22X1 U407 ( .A(n31), .B(kin[24]), .C(n111), .D(kin[26]), .Y(n351) );
  AOI22X1 U408 ( .A(kin[20]), .B(n124), .C(n119), .D(kin[22]), .Y(n350) );
  INVX2 U409 ( .A(kin[18]), .Y(n846) );
  OAI22X1 U410 ( .A(n134), .B(n813), .C(n129), .D(n846), .Y(n348) );
  OAI22X1 U411 ( .A(n139), .B(n916), .C(n36), .D(n428), .Y(n347) );
  NOR2X1 U412 ( .A(n348), .B(n347), .Y(n349) );
  NAND3X1 U413 ( .A(n351), .B(n350), .C(n349), .Y(n358) );
  AOI22X1 U414 ( .A(kin[3]), .B(n145), .C(kin[5]), .D(n141), .Y(n356) );
  AOI22X1 U415 ( .A(kin[27]), .B(n151), .C(kin[1]), .D(n149), .Y(n355) );
  OAI22X1 U416 ( .A(n159), .B(n918), .C(n155), .D(n403), .Y(n353) );
  OAI22X1 U417 ( .A(n172), .B(n930), .C(n165), .D(n920), .Y(n352) );
  NOR2X1 U418 ( .A(n353), .B(n352), .Y(n354) );
  NAND3X1 U419 ( .A(n356), .B(n355), .C(n354), .Y(n357) );
  OR2X2 U420 ( .A(n358), .B(n357), .Y(k_out[13]) );
  AOI22X1 U421 ( .A(kin[25]), .B(n115), .C(kin[27]), .D(n110), .Y(n363) );
  AOI22X1 U422 ( .A(n123), .B(kin[21]), .C(kin[23]), .D(n120), .Y(n362) );
  INVX2 U423 ( .A(kin[19]), .Y(n826) );
  OAI22X1 U424 ( .A(n132), .B(n827), .C(n826), .D(n128), .Y(n360) );
  OAI22X1 U425 ( .A(n428), .B(n106), .C(n828), .D(n53), .Y(n359) );
  NOR2X1 U426 ( .A(n359), .B(n360), .Y(n361) );
  NAND3X1 U427 ( .A(n363), .B(n362), .C(n361), .Y(n370) );
  AOI22X1 U428 ( .A(kin[13]), .B(n77), .C(kin[4]), .D(n147), .Y(n368) );
  AOI22X1 U429 ( .A(kin[6]), .B(n69), .C(n151), .D(kin[0]), .Y(n367) );
  OAI22X1 U430 ( .A(n159), .B(n403), .C(n171), .D(n922), .Y(n365) );
  OAI22X1 U431 ( .A(n6), .B(n388), .C(n82), .D(n933), .Y(n364) );
  NOR2X1 U432 ( .A(n364), .B(n365), .Y(n366) );
  OR2X2 U433 ( .A(n370), .B(n369), .Y(k_out[14]) );
  AOI22X1 U434 ( .A(n116), .B(kin[26]), .C(n111), .D(kin[0]), .Y(n375) );
  AOI22X1 U435 ( .A(n124), .B(kin[22]), .C(n119), .D(kin[24]), .Y(n374) );
  INVX2 U436 ( .A(kin[20]), .Y(n845) );
  OAI22X1 U437 ( .A(n135), .B(n846), .C(n129), .D(n845), .Y(n372) );
  OAI22X1 U438 ( .A(n828), .B(n138), .C(n53), .D(n813), .Y(n371) );
  NOR2X1 U439 ( .A(n371), .B(n372), .Y(n373) );
  NAND3X1 U440 ( .A(n375), .B(n374), .C(n373), .Y(n382) );
  AOI22X1 U441 ( .A(kin[5]), .B(n145), .C(kin[7]), .D(n141), .Y(n380) );
  AOI22X1 U442 ( .A(kin[1]), .B(n151), .C(kin[3]), .D(n149), .Y(n379) );
  OAI22X1 U443 ( .A(n160), .B(n916), .C(n103), .D(n428), .Y(n377) );
  OAI22X1 U444 ( .A(n170), .B(n920), .C(n61), .D(n918), .Y(n376) );
  NOR2X1 U445 ( .A(n377), .B(n376), .Y(n378) );
  NAND3X1 U446 ( .A(n380), .B(n379), .C(n378), .Y(n381) );
  OR2X2 U447 ( .A(n382), .B(n381), .Y(k_out[15]) );
  AOI22X1 U448 ( .A(kin[27]), .B(n113), .C(n777), .D(kin[1]), .Y(n387) );
  AOI22X1 U449 ( .A(kin[23]), .B(n127), .C(kin[25]), .D(n118), .Y(n386) );
  INVX2 U450 ( .A(kin[21]), .Y(n820) );
  OAI22X1 U451 ( .A(n826), .B(n132), .C(n20), .D(n820), .Y(n384) );
  OAI22X1 U452 ( .A(n813), .B(n105), .C(n827), .D(n51), .Y(n383) );
  NOR2X1 U453 ( .A(n384), .B(n383), .Y(n385) );
  NAND3X1 U454 ( .A(n387), .B(n386), .C(n385), .Y(n397) );
  AOI22X1 U455 ( .A(kin[6]), .B(n145), .C(kin[8]), .D(n34), .Y(n395) );
  AOI22X1 U456 ( .A(n784), .B(kin[2]), .C(kin[4]), .D(n85), .Y(n392) );
  OAI22X1 U457 ( .A(n159), .B(n428), .C(n828), .D(n104), .Y(n390) );
  OAI22X1 U458 ( .A(n172), .B(n388), .C(n61), .D(n403), .Y(n389) );
  NOR2X1 U459 ( .A(n390), .B(n389), .Y(n391) );
  NAND3X1 U460 ( .A(n395), .B(n392), .C(n391), .Y(n396) );
  OR2X2 U461 ( .A(n397), .B(n396), .Y(k_out[16]) );
  AOI22X1 U462 ( .A(kin[1]), .B(n115), .C(n777), .D(kin[3]), .Y(n402) );
  AOI22X1 U463 ( .A(kin[25]), .B(n123), .C(kin[27]), .D(n122), .Y(n401) );
  OAI22X1 U464 ( .A(n820), .B(n135), .C(n20), .D(n843), .Y(n399) );
  OAI22X1 U465 ( .A(n846), .B(n106), .C(n826), .D(n51), .Y(n398) );
  NOR2X1 U466 ( .A(n398), .B(n399), .Y(n400) );
  NAND3X1 U467 ( .A(n402), .B(n401), .C(n400), .Y(n410) );
  AOI22X1 U468 ( .A(n77), .B(kin[17]), .C(kin[8]), .D(n146), .Y(n408) );
  AOI22X1 U469 ( .A(kin[10]), .B(n69), .C(n784), .D(kin[4]), .Y(n407) );
  OAI22X1 U470 ( .A(n159), .B(n813), .C(n171), .D(n403), .Y(n405) );
  OAI22X1 U471 ( .A(n6), .B(n428), .C(n82), .D(n931), .Y(n404) );
  NOR2X1 U472 ( .A(n405), .B(n404), .Y(n406) );
  NAND3X1 U473 ( .A(n408), .B(n407), .C(n406), .Y(n409) );
  OR2X2 U474 ( .A(n410), .B(n409), .Y(k_out[18]) );
  AOI22X1 U475 ( .A(n117), .B(kin[2]), .C(n111), .D(kin[4]), .Y(n415) );
  AOI22X1 U476 ( .A(n127), .B(kin[26]), .C(n119), .D(kin[0]), .Y(n414) );
  OAI22X1 U477 ( .A(n844), .B(n135), .C(n837), .D(n129), .Y(n412) );
  OAI22X1 U478 ( .A(n826), .B(n83), .C(n51), .D(n845), .Y(n411) );
  NOR2X1 U479 ( .A(n411), .B(n412), .Y(n413) );
  NAND3X1 U480 ( .A(n415), .B(n414), .C(n413), .Y(n422) );
  AOI22X1 U481 ( .A(kin[9]), .B(n144), .C(kin[11]), .D(n33), .Y(n420) );
  AOI22X1 U482 ( .A(kin[5]), .B(n151), .C(kin[7]), .D(n102), .Y(n419) );
  OAI22X1 U483 ( .A(n159), .B(n827), .C(n846), .D(n104), .Y(n417) );
  OAI22X1 U484 ( .A(n172), .B(n916), .C(n61), .D(n828), .Y(n416) );
  NOR2X1 U485 ( .A(n417), .B(n416), .Y(n418) );
  NAND3X1 U486 ( .A(n420), .B(n419), .C(n418), .Y(n421) );
  OR2X2 U487 ( .A(n422), .B(n421), .Y(k_out[19]) );
  AOI22X1 U488 ( .A(kin[3]), .B(n31), .C(kin[5]), .D(n110), .Y(n427) );
  AOI22X1 U489 ( .A(kin[27]), .B(n127), .C(kin[1]), .D(n122), .Y(n426) );
  OAI22X1 U490 ( .A(n134), .B(n843), .C(n20), .D(n836), .Y(n424) );
  OAI22X1 U491 ( .A(n139), .B(n845), .C(n820), .D(n51), .Y(n423) );
  NOR2X1 U492 ( .A(n424), .B(n423), .Y(n425) );
  NAND3X1 U493 ( .A(n427), .B(n426), .C(n425), .Y(n437) );
  AOI22X1 U494 ( .A(kin[10]), .B(n143), .C(kin[12]), .D(n34), .Y(n435) );
  AOI22X1 U495 ( .A(kin[6]), .B(n151), .C(kin[8]), .D(n148), .Y(n434) );
  OAI22X1 U496 ( .A(n159), .B(n846), .C(n156), .D(n826), .Y(n432) );
  OAI22X1 U497 ( .A(n171), .B(n428), .C(n61), .D(n813), .Y(n431) );
  NOR2X1 U498 ( .A(n432), .B(n431), .Y(n433) );
  NAND3X1 U499 ( .A(n435), .B(n434), .C(n433), .Y(n436) );
  OR2X2 U500 ( .A(n437), .B(n436), .Y(k_out[20]) );
  AOI22X1 U501 ( .A(kin[5]), .B(n54), .C(n111), .D(kin[7]), .Y(n442) );
  AOI22X1 U502 ( .A(kin[1]), .B(n125), .C(kin[3]), .D(n120), .Y(n441) );
  OAI22X1 U503 ( .A(n133), .B(n836), .C(n128), .D(n835), .Y(n439) );
  OAI22X1 U504 ( .A(n844), .B(n138), .C(n35), .D(n843), .Y(n438) );
  NOR2X1 U505 ( .A(n439), .B(n438), .Y(n440) );
  NAND3X1 U506 ( .A(n442), .B(n441), .C(n440), .Y(n449) );
  AOI22X1 U507 ( .A(kin[12]), .B(n143), .C(kin[14]), .D(n34), .Y(n447) );
  AOI22X1 U508 ( .A(kin[8]), .B(n152), .C(kin[10]), .D(n149), .Y(n446) );
  OAI22X1 U509 ( .A(n159), .B(n845), .C(n155), .D(n820), .Y(n444) );
  OAI22X1 U510 ( .A(n96), .B(n813), .C(n164), .D(n846), .Y(n443) );
  NOR2X1 U511 ( .A(n443), .B(n444), .Y(n445) );
  NAND3X1 U512 ( .A(n447), .B(n446), .C(n445), .Y(n448) );
  OR2X2 U513 ( .A(n449), .B(n448), .Y(k_out[22]) );
  AOI22X1 U514 ( .A(n116), .B(kin[6]), .C(n777), .D(kin[8]), .Y(n454) );
  AOI22X1 U515 ( .A(n124), .B(kin[2]), .C(n119), .D(kin[4]), .Y(n453) );
  OAI22X1 U516 ( .A(n819), .B(n132), .C(n487), .D(n20), .Y(n451) );
  OAI22X1 U517 ( .A(n843), .B(n83), .C(n837), .D(n35), .Y(n450) );
  NOR2X1 U518 ( .A(n450), .B(n451), .Y(n452) );
  NAND3X1 U519 ( .A(n454), .B(n453), .C(n452), .Y(n461) );
  AOI22X1 U520 ( .A(kin[13]), .B(n147), .C(kin[15]), .D(n142), .Y(n459) );
  AOI22X1 U521 ( .A(n784), .B(kin[9]), .C(kin[11]), .D(n85), .Y(n458) );
  OAI22X1 U522 ( .A(n159), .B(n820), .C(n844), .D(n104), .Y(n456) );
  OAI22X1 U523 ( .A(n172), .B(n827), .C(n61), .D(n826), .Y(n455) );
  NOR2X1 U524 ( .A(n456), .B(n455), .Y(n457) );
  OR2X2 U525 ( .A(n461), .B(n460), .Y(k_out[23]) );
  AOI22X1 U526 ( .A(kin[8]), .B(n114), .C(n777), .D(kin[10]), .Y(n466) );
  AOI22X1 U527 ( .A(n124), .B(kin[4]), .C(n118), .D(kin[6]), .Y(n465) );
  OAI22X1 U528 ( .A(n487), .B(n133), .C(n128), .D(n933), .Y(n463) );
  OAI22X1 U529 ( .A(n836), .B(n106), .C(n819), .D(n36), .Y(n462) );
  NOR2X1 U530 ( .A(n463), .B(n462), .Y(n464) );
  NAND3X1 U531 ( .A(n466), .B(n465), .C(n464), .Y(n473) );
  AOI22X1 U532 ( .A(n22), .B(kin[24]), .C(kin[15]), .D(n144), .Y(n471) );
  AOI22X1 U533 ( .A(kin[17]), .B(n34), .C(n784), .D(kin[11]), .Y(n470) );
  OAI22X1 U534 ( .A(n159), .B(n843), .C(n170), .D(n826), .Y(n468) );
  OAI22X1 U535 ( .A(n162), .B(n820), .C(n82), .D(n916), .Y(n467) );
  NOR2X1 U536 ( .A(n468), .B(n467), .Y(n469) );
  NAND3X1 U537 ( .A(n470), .B(n471), .C(n469), .Y(n472) );
  OR2X2 U538 ( .A(n473), .B(n472), .Y(k_out[25]) );
  AOI22X1 U539 ( .A(kin[9]), .B(n116), .C(n777), .D(kin[11]), .Y(n479) );
  AOI22X1 U540 ( .A(kin[5]), .B(n125), .C(n119), .D(kin[7]), .Y(n478) );
  OAI22X1 U541 ( .A(n134), .B(n834), .C(n20), .D(n474), .Y(n476) );
  OAI22X1 U542 ( .A(n819), .B(n105), .C(n51), .D(n835), .Y(n475) );
  NOR2X1 U543 ( .A(n476), .B(n475), .Y(n477) );
  NAND3X1 U544 ( .A(n479), .B(n478), .C(n477), .Y(n486) );
  AOI22X1 U545 ( .A(kin[16]), .B(n145), .C(kin[18]), .D(n33), .Y(n484) );
  AOI22X1 U546 ( .A(n784), .B(kin[12]), .C(kin[14]), .D(n85), .Y(n483) );
  OAI22X1 U547 ( .A(n837), .B(n160), .C(n836), .D(n104), .Y(n481) );
  OAI22X1 U548 ( .A(n171), .B(n845), .C(n844), .D(n61), .Y(n480) );
  NOR2X1 U549 ( .A(n481), .B(n480), .Y(n482) );
  NAND3X1 U550 ( .A(n484), .B(n483), .C(n482), .Y(n485) );
  OR2X2 U551 ( .A(n486), .B(n485), .Y(k_out[26]) );
  AOI22X1 U552 ( .A(kin[10]), .B(n54), .C(kin[12]), .D(n110), .Y(n492) );
  AOI22X1 U553 ( .A(n127), .B(kin[6]), .C(kin[8]), .D(n119), .Y(n491) );
  OAI22X1 U554 ( .A(n133), .B(n933), .C(n932), .D(n29), .Y(n489) );
  OAI22X1 U555 ( .A(n835), .B(n84), .C(n487), .D(n36), .Y(n488) );
  NOR2X1 U556 ( .A(n489), .B(n488), .Y(n490) );
  NAND3X1 U557 ( .A(n492), .B(n491), .C(n490), .Y(n499) );
  AOI22X1 U558 ( .A(n77), .B(kin[26]), .C(kin[17]), .D(n147), .Y(n497) );
  AOI22X1 U559 ( .A(kin[19]), .B(n69), .C(kin[13]), .D(n150), .Y(n496) );
  OAI22X1 U560 ( .A(n160), .B(n836), .C(n95), .D(n820), .Y(n494) );
  OAI22X1 U561 ( .A(n39), .B(n843), .C(n82), .D(n828), .Y(n493) );
  NOR2X1 U562 ( .A(n494), .B(n493), .Y(n495) );
  OR2X2 U563 ( .A(n499), .B(n498), .Y(k_out[27]) );
  AOI22X1 U564 ( .A(kin[39]), .B(n113), .C(n777), .D(kin[41]), .Y(n504) );
  AOI22X1 U565 ( .A(kin[35]), .B(n124), .C(kin[37]), .D(n119), .Y(n503) );
  INVX2 U566 ( .A(kin[31]), .Y(n873) );
  INVX2 U567 ( .A(kin[33]), .Y(n872) );
  OAI22X1 U568 ( .A(n132), .B(n873), .C(n27), .D(n872), .Y(n501) );
  INVX2 U569 ( .A(kin[28]), .Y(n897) );
  INVX2 U570 ( .A(kin[29]), .Y(n778) );
  OAI22X1 U571 ( .A(n897), .B(n83), .C(n51), .D(n778), .Y(n500) );
  NOR2X1 U572 ( .A(n500), .B(n501), .Y(n502) );
  NAND3X1 U573 ( .A(n504), .B(n503), .C(n502), .Y(n511) );
  AOI22X1 U574 ( .A(n22), .B(kin[55]), .C(kin[46]), .D(n146), .Y(n509) );
  AOI22X1 U575 ( .A(kin[48]), .B(n141), .C(n784), .D(kin[42]), .Y(n508) );
  INVX2 U576 ( .A(kin[54]), .Y(n898) );
  OAI22X1 U577 ( .A(n159), .B(n898), .C(n171), .D(n785), .Y(n506) );
  OAI22X1 U578 ( .A(n39), .B(n905), .C(n82), .D(n744), .Y(n505) );
  NOR2X1 U579 ( .A(n506), .B(n505), .Y(n507) );
  NAND3X1 U580 ( .A(n508), .B(n509), .C(n507), .Y(n510) );
  OR2X2 U581 ( .A(n511), .B(n510), .Y(k_out[28]) );
  AOI22X1 U582 ( .A(kin[40]), .B(n117), .C(kin[42]), .D(n110), .Y(n516) );
  AOI22X1 U583 ( .A(kin[36]), .B(n124), .C(kin[38]), .D(n119), .Y(n515) );
  INVX2 U584 ( .A(kin[32]), .Y(n859) );
  INVX2 U585 ( .A(kin[34]), .Y(n853) );
  OAI22X1 U586 ( .A(n134), .B(n859), .C(n20), .D(n853), .Y(n513) );
  INVX2 U587 ( .A(kin[30]), .Y(n896) );
  OAI22X1 U588 ( .A(n139), .B(n778), .C(n51), .D(n896), .Y(n512) );
  NOR2X1 U589 ( .A(n513), .B(n512), .Y(n514) );
  NAND3X1 U590 ( .A(n516), .B(n515), .C(n514), .Y(n523) );
  AOI22X1 U591 ( .A(kin[47]), .B(n145), .C(kin[49]), .D(n34), .Y(n521) );
  AOI22X1 U592 ( .A(kin[43]), .B(n151), .C(kin[45]), .D(n102), .Y(n520) );
  INVX2 U593 ( .A(kin[55]), .Y(n795) );
  OAI22X1 U594 ( .A(n159), .B(n795), .C(n155), .D(n897), .Y(n518) );
  INVX2 U595 ( .A(kin[51]), .Y(n906) );
  INVX2 U596 ( .A(kin[53]), .Y(n899) );
  OAI22X1 U597 ( .A(n170), .B(n906), .C(n61), .D(n899), .Y(n517) );
  NOR2X1 U598 ( .A(n518), .B(n517), .Y(n519) );
  NAND3X1 U599 ( .A(n521), .B(n520), .C(n519), .Y(n522) );
  OR2X2 U600 ( .A(n523), .B(n522), .Y(k_out[29]) );
  AOI22X1 U601 ( .A(kin[41]), .B(n117), .C(n777), .D(kin[43]), .Y(n528) );
  AOI22X1 U602 ( .A(kin[37]), .B(n123), .C(kin[39]), .D(n119), .Y(n527) );
  INVX2 U603 ( .A(kin[35]), .Y(n871) );
  OAI22X1 U604 ( .A(n131), .B(n872), .C(n129), .D(n871), .Y(n525) );
  OAI22X1 U605 ( .A(n896), .B(n83), .C(n36), .D(n873), .Y(n524) );
  NOR2X1 U606 ( .A(n524), .B(n525), .Y(n526) );
  NAND3X1 U607 ( .A(n528), .B(n527), .C(n526), .Y(n535) );
  AOI22X1 U608 ( .A(n22), .B(kin[29]), .C(kin[48]), .D(n145), .Y(n533) );
  AOI22X1 U609 ( .A(kin[50]), .B(n4), .C(n784), .D(kin[44]), .Y(n532) );
  OAI22X1 U610 ( .A(n160), .B(n897), .C(n172), .D(n905), .Y(n530) );
  INVX2 U611 ( .A(kin[46]), .Y(n769) );
  OAI22X1 U612 ( .A(n7), .B(n898), .C(n82), .D(n769), .Y(n529) );
  NOR2X1 U613 ( .A(n529), .B(n530), .Y(n531) );
  NAND3X1 U614 ( .A(n532), .B(n533), .C(n531), .Y(n534) );
  OR2X2 U615 ( .A(n535), .B(n534), .Y(k_out[30]) );
  AOI22X1 U616 ( .A(kin[42]), .B(n113), .C(kin[44]), .D(n110), .Y(n540) );
  AOI22X1 U617 ( .A(kin[38]), .B(n123), .C(kin[40]), .D(n118), .Y(n539) );
  INVX2 U618 ( .A(kin[36]), .Y(n890) );
  OAI22X1 U619 ( .A(n132), .B(n853), .C(n129), .D(n890), .Y(n537) );
  OAI22X1 U620 ( .A(n873), .B(n105), .C(n46), .D(n859), .Y(n536) );
  NOR2X1 U621 ( .A(n536), .B(n537), .Y(n538) );
  NAND3X1 U622 ( .A(n540), .B(n539), .C(n538), .Y(n547) );
  AOI22X1 U623 ( .A(kin[49]), .B(n144), .C(kin[51]), .D(n33), .Y(n545) );
  AOI22X1 U624 ( .A(kin[45]), .B(n151), .C(kin[47]), .D(n149), .Y(n544) );
  OAI22X1 U625 ( .A(n159), .B(n778), .C(n155), .D(n896), .Y(n542) );
  OAI22X1 U626 ( .A(n96), .B(n899), .C(n38), .D(n795), .Y(n541) );
  NOR2X1 U627 ( .A(n541), .B(n542), .Y(n543) );
  NAND3X1 U628 ( .A(n545), .B(n544), .C(n543), .Y(n546) );
  OR2X2 U629 ( .A(n547), .B(n546), .Y(k_out[31]) );
  INVX2 U630 ( .A(kin[37]), .Y(n865) );
  OAI22X1 U631 ( .A(n51), .B(n872), .C(n20), .D(n865), .Y(n549) );
  OAI22X1 U632 ( .A(n12), .B(n871), .C(n78), .D(n785), .Y(n548) );
  NOR2X1 U633 ( .A(n549), .B(n548), .Y(n565) );
  INVX2 U634 ( .A(kin[43]), .Y(n880) );
  AOI22X1 U635 ( .A(n777), .B(kin[45]), .C(n784), .D(kin[46]), .Y(n550) );
  OAI21X1 U636 ( .A(n551), .B(n880), .C(n550), .Y(n555) );
  OAI22X1 U637 ( .A(n553), .B(n852), .C(n552), .D(n887), .Y(n554) );
  NOR2X1 U638 ( .A(n555), .B(n554), .Y(n564) );
  AOI22X1 U639 ( .A(kin[54]), .B(n173), .C(kin[28]), .D(n166), .Y(n557) );
  AOI22X1 U640 ( .A(kin[48]), .B(n85), .C(kin[52]), .D(n33), .Y(n556) );
  NAND2X1 U641 ( .A(n557), .B(n556), .Y(n560) );
  AOI22X1 U642 ( .A(n108), .B(kin[32]), .C(kin[30]), .D(n59), .Y(n558) );
  OAI21X1 U643 ( .A(n156), .B(n873), .C(n558), .Y(n559) );
  NOR2X1 U644 ( .A(n560), .B(n559), .Y(n563) );
  NAND3X1 U645 ( .A(n565), .B(n564), .C(n563), .Y(k_out[32]) );
  AOI22X1 U646 ( .A(kin[44]), .B(n113), .C(kin[46]), .D(n110), .Y(n570) );
  AOI22X1 U647 ( .A(kin[40]), .B(n124), .C(kin[42]), .D(n118), .Y(n569) );
  INVX2 U648 ( .A(kin[38]), .Y(n889) );
  OAI22X1 U649 ( .A(n131), .B(n890), .C(n129), .D(n889), .Y(n567) );
  OAI22X1 U650 ( .A(n139), .B(n872), .C(n35), .D(n853), .Y(n566) );
  NOR2X1 U651 ( .A(n567), .B(n566), .Y(n568) );
  NAND3X1 U652 ( .A(n570), .B(n569), .C(n568), .Y(n577) );
  AOI22X1 U653 ( .A(kin[51]), .B(n143), .C(kin[53]), .D(n69), .Y(n575) );
  AOI22X1 U654 ( .A(kin[47]), .B(n152), .C(kin[49]), .D(n149), .Y(n574) );
  OAI22X1 U655 ( .A(n159), .B(n873), .C(n155), .D(n859), .Y(n572) );
  OAI22X1 U656 ( .A(n172), .B(n795), .C(n61), .D(n778), .Y(n571) );
  NOR2X1 U657 ( .A(n572), .B(n571), .Y(n573) );
  NAND3X1 U658 ( .A(n575), .B(n574), .C(n573), .Y(n576) );
  OR2X2 U659 ( .A(n577), .B(n576), .Y(k_out[33]) );
  AOI22X1 U660 ( .A(kin[46]), .B(n113), .C(kin[48]), .D(n110), .Y(n582) );
  AOI22X1 U661 ( .A(kin[42]), .B(n127), .C(kin[44]), .D(n121), .Y(n581) );
  INVX2 U662 ( .A(kin[40]), .Y(n888) );
  OAI22X1 U663 ( .A(n134), .B(n889), .C(n128), .D(n888), .Y(n579) );
  OAI22X1 U664 ( .A(n139), .B(n871), .C(n35), .D(n890), .Y(n578) );
  NOR2X1 U665 ( .A(n578), .B(n579), .Y(n580) );
  NAND3X1 U666 ( .A(n582), .B(n581), .C(n580), .Y(n589) );
  AOI22X1 U667 ( .A(kin[53]), .B(n144), .C(kin[55]), .D(n34), .Y(n587) );
  AOI22X1 U668 ( .A(kin[49]), .B(n151), .C(kin[51]), .D(n149), .Y(n586) );
  OAI22X1 U669 ( .A(n159), .B(n872), .C(n154), .D(n853), .Y(n584) );
  OAI22X1 U670 ( .A(n171), .B(n778), .C(n6), .D(n873), .Y(n583) );
  NOR2X1 U671 ( .A(n584), .B(n583), .Y(n585) );
  NAND3X1 U672 ( .A(n587), .B(n586), .C(n585), .Y(n588) );
  OR2X2 U673 ( .A(n589), .B(n588), .Y(k_out[35]) );
  AOI22X1 U674 ( .A(kin[47]), .B(n113), .C(n777), .D(kin[49]), .Y(n594) );
  AOI22X1 U675 ( .A(kin[43]), .B(n124), .C(kin[45]), .D(n119), .Y(n593) );
  OAI22X1 U676 ( .A(n132), .B(n852), .C(n29), .D(n887), .Y(n591) );
  OAI22X1 U677 ( .A(n890), .B(n83), .C(n53), .D(n865), .Y(n590) );
  NOR2X1 U678 ( .A(n590), .B(n591), .Y(n592) );
  NAND3X1 U679 ( .A(n594), .B(n593), .C(n592), .Y(n603) );
  AOI22X1 U680 ( .A(n671), .B(kin[35]), .C(kin[54]), .D(n145), .Y(n601) );
  AOI22X1 U681 ( .A(kin[28]), .B(n141), .C(n784), .D(kin[50]), .Y(n600) );
  OAI22X1 U682 ( .A(n1), .B(n853), .C(n96), .D(n896), .Y(n596) );
  OAI22X1 U683 ( .A(n164), .B(n859), .C(n82), .D(n905), .Y(n595) );
  NOR2X1 U684 ( .A(n596), .B(n595), .Y(n599) );
  NAND3X1 U685 ( .A(n600), .B(n601), .C(n599), .Y(n602) );
  OR2X2 U686 ( .A(n603), .B(n602), .Y(k_out[36]) );
  AOI22X1 U687 ( .A(kin[49]), .B(n113), .C(n777), .D(kin[51]), .Y(n608) );
  AOI22X1 U688 ( .A(kin[45]), .B(n123), .C(kin[47]), .D(n121), .Y(n607) );
  OAI22X1 U689 ( .A(n134), .B(n887), .C(n129), .D(n880), .Y(n605) );
  OAI22X1 U690 ( .A(n889), .B(n84), .C(n36), .D(n852), .Y(n604) );
  NOR2X1 U691 ( .A(n605), .B(n604), .Y(n606) );
  NAND3X1 U692 ( .A(n608), .B(n607), .C(n606), .Y(n615) );
  AOI22X1 U693 ( .A(kin[28]), .B(n145), .C(kin[30]), .D(n142), .Y(n613) );
  AOI22X1 U694 ( .A(n784), .B(kin[52]), .C(kin[54]), .D(n85), .Y(n612) );
  OAI22X1 U695 ( .A(n160), .B(n890), .C(n865), .D(n104), .Y(n610) );
  OAI22X1 U696 ( .A(n170), .B(n859), .C(n6), .D(n853), .Y(n609) );
  NOR2X1 U697 ( .A(n609), .B(n610), .Y(n611) );
  NAND3X1 U698 ( .A(n613), .B(n612), .C(n611), .Y(n614) );
  OR2X2 U699 ( .A(n615), .B(n614), .Y(k_out[38]) );
  AOI22X1 U700 ( .A(kin[50]), .B(n116), .C(kin[52]), .D(n110), .Y(n620) );
  AOI22X1 U701 ( .A(kin[46]), .B(n123), .C(kin[48]), .D(n118), .Y(n619) );
  INVX2 U702 ( .A(kin[42]), .Y(n881) );
  OAI22X1 U703 ( .A(n131), .B(n881), .C(n20), .D(n744), .Y(n617) );
  OAI22X1 U704 ( .A(n852), .B(n83), .C(n36), .D(n888), .Y(n616) );
  NOR2X1 U705 ( .A(n616), .B(n617), .Y(n618) );
  NAND3X1 U706 ( .A(n620), .B(n619), .C(n618), .Y(n627) );
  AOI22X1 U707 ( .A(kin[29]), .B(n144), .C(kin[31]), .D(n33), .Y(n625) );
  AOI22X1 U708 ( .A(kin[53]), .B(n151), .C(kin[55]), .D(n85), .Y(n624) );
  OAI22X1 U709 ( .A(n159), .B(n865), .C(n155), .D(n889), .Y(n622) );
  OAI22X1 U710 ( .A(n171), .B(n872), .C(n61), .D(n871), .Y(n621) );
  NOR2X1 U711 ( .A(n622), .B(n621), .Y(n623) );
  NAND3X1 U712 ( .A(n625), .B(n624), .C(n623), .Y(n626) );
  OR2X2 U713 ( .A(n627), .B(n626), .Y(k_out[39]) );
  AOI22X1 U714 ( .A(kin[51]), .B(n54), .C(kin[53]), .D(n110), .Y(n632) );
  AOI22X1 U715 ( .A(kin[47]), .B(n126), .C(kin[49]), .D(n120), .Y(n631) );
  INVX2 U716 ( .A(kin[45]), .Y(n879) );
  OAI22X1 U717 ( .A(n133), .B(n880), .C(n129), .D(n879), .Y(n629) );
  OAI22X1 U718 ( .A(n139), .B(n888), .C(n46), .D(n887), .Y(n628) );
  NOR2X1 U719 ( .A(n628), .B(n629), .Y(n630) );
  NAND3X1 U720 ( .A(n632), .B(n631), .C(n630), .Y(n639) );
  AOI22X1 U721 ( .A(kin[30]), .B(n143), .C(kin[32]), .D(n34), .Y(n637) );
  AOI22X1 U722 ( .A(kin[54]), .B(n152), .C(kin[28]), .D(n148), .Y(n636) );
  OAI22X1 U723 ( .A(n159), .B(n889), .C(n154), .D(n852), .Y(n634) );
  OAI22X1 U724 ( .A(n96), .B(n853), .C(n163), .D(n890), .Y(n633) );
  NOR2X1 U725 ( .A(n633), .B(n634), .Y(n635) );
  NAND3X1 U726 ( .A(n637), .B(n636), .C(n635), .Y(n638) );
  OR2X2 U727 ( .A(n639), .B(n638), .Y(k_out[40]) );
  AOI22X1 U728 ( .A(kin[52]), .B(n115), .C(kin[54]), .D(n110), .Y(n644) );
  AOI22X1 U729 ( .A(kin[48]), .B(n123), .C(kin[50]), .D(n118), .Y(n643) );
  OAI22X1 U730 ( .A(n134), .B(n744), .C(n129), .D(n769), .Y(n641) );
  OAI22X1 U731 ( .A(n139), .B(n887), .C(n35), .D(n881), .Y(n640) );
  NOR2X1 U732 ( .A(n641), .B(n640), .Y(n642) );
  NAND3X1 U733 ( .A(n644), .B(n643), .C(n642), .Y(n651) );
  AOI22X1 U734 ( .A(kin[31]), .B(n143), .C(kin[33]), .D(n33), .Y(n649) );
  AOI22X1 U735 ( .A(kin[55]), .B(n152), .C(kin[29]), .D(n102), .Y(n648) );
  OAI22X1 U736 ( .A(n159), .B(n852), .C(n155), .D(n888), .Y(n646) );
  OAI22X1 U737 ( .A(n171), .B(n871), .C(n7), .D(n865), .Y(n645) );
  NOR2X1 U738 ( .A(n646), .B(n645), .Y(n647) );
  NAND3X1 U739 ( .A(n649), .B(n648), .C(n647), .Y(n650) );
  OR2X2 U740 ( .A(n651), .B(n650), .Y(k_out[41]) );
  AOI22X1 U741 ( .A(kin[54]), .B(n117), .C(kin[28]), .D(n110), .Y(n656) );
  AOI22X1 U742 ( .A(kin[50]), .B(n126), .C(kin[52]), .D(n120), .Y(n655) );
  INVX2 U743 ( .A(kin[48]), .Y(n786) );
  OAI22X1 U744 ( .A(n135), .B(n769), .C(n20), .D(n786), .Y(n653) );
  OAI22X1 U745 ( .A(n139), .B(n880), .C(n46), .D(n744), .Y(n652) );
  NOR2X1 U746 ( .A(n652), .B(n653), .Y(n654) );
  NAND3X1 U747 ( .A(n656), .B(n655), .C(n654), .Y(n665) );
  AOI22X1 U748 ( .A(kin[33]), .B(n144), .C(kin[35]), .D(n69), .Y(n663) );
  AOI22X1 U749 ( .A(kin[29]), .B(n151), .C(kin[31]), .D(n85), .Y(n662) );
  OAI22X1 U750 ( .A(n24), .B(n887), .C(n154), .D(n881), .Y(n660) );
  OAI22X1 U751 ( .A(n95), .B(n865), .C(n61), .D(n852), .Y(n659) );
  NOR2X1 U752 ( .A(n660), .B(n659), .Y(n661) );
  NAND3X1 U753 ( .A(n663), .B(n662), .C(n661), .Y(n664) );
  OR2X2 U754 ( .A(n665), .B(n664), .Y(k_out[43]) );
  AOI22X1 U755 ( .A(kin[55]), .B(n115), .C(n777), .D(kin[29]), .Y(n670) );
  AOI22X1 U756 ( .A(kin[51]), .B(n123), .C(kin[53]), .D(n121), .Y(n669) );
  INVX2 U757 ( .A(kin[47]), .Y(n908) );
  INVX2 U758 ( .A(kin[49]), .Y(n907) );
  OAI22X1 U759 ( .A(n132), .B(n908), .C(n20), .D(n907), .Y(n667) );
  OAI22X1 U760 ( .A(n744), .B(n105), .C(n35), .D(n879), .Y(n666) );
  NOR2X1 U761 ( .A(n667), .B(n666), .Y(n668) );
  NAND3X1 U762 ( .A(n670), .B(n669), .C(n668), .Y(n678) );
  AOI22X1 U763 ( .A(n22), .B(kin[43]), .C(kin[34]), .D(n145), .Y(n676) );
  AOI22X1 U764 ( .A(kin[36]), .B(n69), .C(n784), .D(kin[30]), .Y(n675) );
  OAI22X1 U765 ( .A(n158), .B(n881), .C(n96), .D(n889), .Y(n673) );
  OAI22X1 U766 ( .A(n162), .B(n888), .C(n82), .D(n859), .Y(n672) );
  NOR2X1 U767 ( .A(n673), .B(n672), .Y(n674) );
  NAND3X1 U768 ( .A(n675), .B(n676), .C(n674), .Y(n677) );
  OR2X2 U769 ( .A(n678), .B(n677), .Y(k_out[44]) );
  AOI22X1 U770 ( .A(kin[28]), .B(n116), .C(kin[30]), .D(n110), .Y(n683) );
  AOI22X1 U771 ( .A(kin[52]), .B(n126), .C(kin[54]), .D(n121), .Y(n682) );
  OAI22X1 U772 ( .A(n131), .B(n786), .C(n17), .D(n785), .Y(n680) );
  OAI22X1 U773 ( .A(n139), .B(n879), .C(n35), .D(n769), .Y(n679) );
  NOR2X1 U774 ( .A(n679), .B(n680), .Y(n681) );
  NAND3X1 U775 ( .A(n683), .B(n682), .C(n681), .Y(n690) );
  AOI22X1 U776 ( .A(kin[35]), .B(n146), .C(kin[37]), .D(n141), .Y(n688) );
  AOI22X1 U777 ( .A(kin[31]), .B(n151), .C(kin[33]), .D(n149), .Y(n687) );
  OAI22X1 U778 ( .A(n158), .B(n880), .C(n154), .D(n744), .Y(n685) );
  OAI22X1 U779 ( .A(n170), .B(n852), .C(n7), .D(n887), .Y(n684) );
  NOR2X1 U780 ( .A(n685), .B(n684), .Y(n686) );
  NAND3X1 U781 ( .A(n688), .B(n687), .C(n686), .Y(n689) );
  OR2X2 U782 ( .A(n690), .B(n689), .Y(k_out[45]) );
  AOI22X1 U783 ( .A(kin[29]), .B(n113), .C(kin[31]), .D(n109), .Y(n695) );
  AOI22X1 U784 ( .A(kin[53]), .B(n123), .C(kin[55]), .D(n119), .Y(n694) );
  OAI22X1 U785 ( .A(n132), .B(n907), .C(n129), .D(n906), .Y(n692) );
  OAI22X1 U786 ( .A(n139), .B(n769), .C(n35), .D(n908), .Y(n691) );
  NOR2X1 U787 ( .A(n692), .B(n691), .Y(n693) );
  NAND3X1 U788 ( .A(n695), .B(n694), .C(n693), .Y(n702) );
  AOI22X1 U789 ( .A(kin[36]), .B(n146), .C(kin[38]), .D(n141), .Y(n700) );
  AOI22X1 U790 ( .A(kin[32]), .B(n151), .C(kin[34]), .D(n102), .Y(n699) );
  OAI22X1 U791 ( .A(n24), .B(n744), .C(n156), .D(n879), .Y(n697) );
  OAI22X1 U792 ( .A(n95), .B(n888), .C(n162), .D(n881), .Y(n696) );
  NOR2X1 U793 ( .A(n697), .B(n696), .Y(n698) );
  NAND3X1 U794 ( .A(n700), .B(n699), .C(n698), .Y(n701) );
  OR2X2 U795 ( .A(n702), .B(n701), .Y(k_out[46]) );
  AOI22X1 U796 ( .A(kin[30]), .B(n54), .C(kin[32]), .D(n109), .Y(n707) );
  AOI22X1 U797 ( .A(kin[54]), .B(n126), .C(kin[28]), .D(n120), .Y(n706) );
  OAI22X1 U798 ( .A(n132), .B(n785), .C(n129), .D(n905), .Y(n704) );
  OAI22X1 U799 ( .A(n139), .B(n908), .C(n53), .D(n786), .Y(n703) );
  NOR2X1 U800 ( .A(n703), .B(n704), .Y(n705) );
  NAND3X1 U801 ( .A(n707), .B(n706), .C(n705), .Y(n714) );
  AOI22X1 U802 ( .A(kin[46]), .B(n77), .C(kin[37]), .D(n147), .Y(n712) );
  AOI22X1 U803 ( .A(kin[39]), .B(n69), .C(kin[33]), .D(n152), .Y(n711) );
  OAI22X1 U804 ( .A(n158), .B(n879), .C(n96), .D(n887), .Y(n709) );
  OAI22X1 U805 ( .A(n165), .B(n880), .C(n82), .D(n871), .Y(n708) );
  NOR2X1 U806 ( .A(n709), .B(n708), .Y(n710) );
  OR2X2 U807 ( .A(n714), .B(n713), .Y(k_out[47]) );
  AOI22X1 U808 ( .A(kin[31]), .B(n116), .C(kin[33]), .D(n109), .Y(n719) );
  AOI22X1 U809 ( .A(kin[55]), .B(n124), .C(kin[29]), .D(n122), .Y(n718) );
  OAI22X1 U810 ( .A(n131), .B(n906), .C(n20), .D(n899), .Y(n716) );
  OAI22X1 U811 ( .A(n786), .B(n84), .C(n36), .D(n907), .Y(n715) );
  NOR2X1 U812 ( .A(n716), .B(n715), .Y(n717) );
  NAND3X1 U813 ( .A(n719), .B(n718), .C(n717), .Y(n726) );
  AOI22X1 U814 ( .A(kin[38]), .B(n146), .C(kin[40]), .D(n34), .Y(n724) );
  AOI22X1 U815 ( .A(kin[34]), .B(n151), .C(kin[36]), .D(n148), .Y(n723) );
  OAI22X1 U816 ( .A(n158), .B(n769), .C(n154), .D(n908), .Y(n721) );
  OAI22X1 U817 ( .A(n96), .B(n881), .C(n25), .D(n744), .Y(n720) );
  NOR2X1 U818 ( .A(n721), .B(n720), .Y(n722) );
  NAND3X1 U819 ( .A(n724), .B(n723), .C(n722), .Y(n725) );
  OR2X2 U820 ( .A(n726), .B(n725), .Y(k_out[48]) );
  AOI22X1 U821 ( .A(kin[32]), .B(n54), .C(kin[34]), .D(n109), .Y(n731) );
  AOI22X1 U822 ( .A(kin[28]), .B(n126), .C(kin[30]), .D(n118), .Y(n730) );
  OAI22X1 U823 ( .A(n133), .B(n905), .C(n128), .D(n898), .Y(n728) );
  OAI22X1 U824 ( .A(n907), .B(n106), .C(n36), .D(n785), .Y(n727) );
  NOR2X1 U825 ( .A(n728), .B(n727), .Y(n729) );
  NAND3X1 U826 ( .A(n731), .B(n730), .C(n729), .Y(n738) );
  AOI22X1 U827 ( .A(kin[39]), .B(n146), .C(kin[41]), .D(n34), .Y(n736) );
  AOI22X1 U828 ( .A(kin[35]), .B(n152), .C(kin[37]), .D(n149), .Y(n735) );
  OAI22X1 U829 ( .A(n158), .B(n908), .C(n786), .D(n104), .Y(n733) );
  OAI22X1 U830 ( .A(n96), .B(n880), .C(n163), .D(n879), .Y(n732) );
  NOR2X1 U831 ( .A(n732), .B(n733), .Y(n734) );
  NAND3X1 U832 ( .A(n736), .B(n735), .C(n734), .Y(n737) );
  OR2X2 U833 ( .A(n738), .B(n737), .Y(k_out[49]) );
  AOI22X1 U834 ( .A(kin[33]), .B(n114), .C(n777), .D(kin[35]), .Y(n743) );
  AOI22X1 U835 ( .A(kin[29]), .B(n123), .C(kin[31]), .D(n122), .Y(n742) );
  OAI22X1 U836 ( .A(n135), .B(n899), .C(n20), .D(n795), .Y(n740) );
  OAI22X1 U837 ( .A(n785), .B(n84), .C(n35), .D(n906), .Y(n739) );
  NOR2X1 U838 ( .A(n740), .B(n739), .Y(n741) );
  NAND3X1 U839 ( .A(n743), .B(n742), .C(n741), .Y(n751) );
  AOI22X1 U840 ( .A(kin[40]), .B(n146), .C(kin[42]), .D(n34), .Y(n749) );
  AOI22X1 U841 ( .A(n784), .B(kin[36]), .C(kin[38]), .D(n102), .Y(n748) );
  OAI22X1 U842 ( .A(n158), .B(n786), .C(n907), .D(n60), .Y(n746) );
  OAI22X1 U843 ( .A(n171), .B(n744), .C(n7), .D(n769), .Y(n745) );
  NOR2X1 U844 ( .A(n746), .B(n745), .Y(n747) );
  NAND3X1 U845 ( .A(n749), .B(n748), .C(n747), .Y(n750) );
  OR2X2 U846 ( .A(n751), .B(n750), .Y(k_out[50]) );
  AOI22X1 U847 ( .A(kin[34]), .B(n115), .C(kin[36]), .D(n109), .Y(n756) );
  AOI22X1 U848 ( .A(kin[30]), .B(n124), .C(kin[32]), .D(n118), .Y(n755) );
  OAI22X1 U849 ( .A(n134), .B(n898), .C(n20), .D(n897), .Y(n753) );
  OAI22X1 U850 ( .A(n906), .B(n83), .C(n36), .D(n905), .Y(n752) );
  NOR2X1 U851 ( .A(n753), .B(n752), .Y(n754) );
  NAND3X1 U852 ( .A(n756), .B(n755), .C(n754), .Y(n763) );
  AOI22X1 U853 ( .A(kin[41]), .B(n145), .C(kin[43]), .D(n141), .Y(n761) );
  AOI22X1 U854 ( .A(kin[37]), .B(n152), .C(kin[39]), .D(n102), .Y(n760) );
  OAI22X1 U855 ( .A(n158), .B(n907), .C(n785), .D(n104), .Y(n758) );
  OAI22X1 U856 ( .A(n170), .B(n879), .C(n6), .D(n908), .Y(n757) );
  NOR2X1 U857 ( .A(n757), .B(n758), .Y(n759) );
  NAND3X1 U858 ( .A(n761), .B(n760), .C(n759), .Y(n762) );
  OR2X2 U859 ( .A(n763), .B(n762), .Y(k_out[51]) );
  AOI22X1 U860 ( .A(kin[35]), .B(n117), .C(kin[37]), .D(n109), .Y(n768) );
  AOI22X1 U861 ( .A(kin[31]), .B(n126), .C(kin[33]), .D(n120), .Y(n767) );
  OAI22X1 U862 ( .A(n135), .B(n795), .C(n20), .D(n778), .Y(n765) );
  OAI22X1 U863 ( .A(n905), .B(n107), .C(n35), .D(n899), .Y(n764) );
  NOR2X1 U864 ( .A(n764), .B(n765), .Y(n766) );
  NAND3X1 U865 ( .A(n768), .B(n767), .C(n766), .Y(n776) );
  AOI22X1 U866 ( .A(kin[42]), .B(n144), .C(kin[44]), .D(n34), .Y(n774) );
  AOI22X1 U867 ( .A(kin[38]), .B(n151), .C(kin[40]), .D(n102), .Y(n773) );
  OAI22X1 U868 ( .A(n160), .B(n785), .C(n906), .D(n104), .Y(n771) );
  OAI22X1 U869 ( .A(n95), .B(n769), .C(n7), .D(n786), .Y(n770) );
  NOR2X1 U870 ( .A(n770), .B(n771), .Y(n772) );
  NAND3X1 U871 ( .A(n774), .B(n773), .C(n772), .Y(n775) );
  OR2X2 U872 ( .A(n776), .B(n775), .Y(k_out[52]) );
  AOI22X1 U873 ( .A(kin[37]), .B(n54), .C(n777), .D(kin[39]), .Y(n783) );
  AOI22X1 U874 ( .A(kin[33]), .B(n126), .C(kin[35]), .D(n120), .Y(n782) );
  OAI22X1 U875 ( .A(n133), .B(n778), .C(n128), .D(n873), .Y(n780) );
  OAI22X1 U876 ( .A(n898), .B(n107), .C(n46), .D(n795), .Y(n779) );
  NOR2X1 U877 ( .A(n780), .B(n779), .Y(n781) );
  NAND3X1 U878 ( .A(n783), .B(n782), .C(n781), .Y(n793) );
  AOI22X1 U879 ( .A(kin[44]), .B(n146), .C(kin[46]), .D(n33), .Y(n791) );
  AOI22X1 U880 ( .A(n784), .B(kin[40]), .C(kin[42]), .D(n98), .Y(n790) );
  OAI22X1 U881 ( .A(n158), .B(n905), .C(n899), .D(n103), .Y(n788) );
  OAI22X1 U882 ( .A(n96), .B(n786), .C(n164), .D(n785), .Y(n787) );
  NOR2X1 U883 ( .A(n787), .B(n788), .Y(n789) );
  NAND3X1 U884 ( .A(n791), .B(n790), .C(n789), .Y(n792) );
  OR2X2 U885 ( .A(n793), .B(n792), .Y(k_out[54]) );
  AOI22X1 U886 ( .A(kin[38]), .B(n115), .C(kin[40]), .D(n109), .Y(n800) );
  AOI22X1 U887 ( .A(kin[34]), .B(n125), .C(kin[36]), .D(n122), .Y(n799) );
  OAI22X1 U888 ( .A(n132), .B(n896), .C(n20), .D(n859), .Y(n797) );
  OAI22X1 U889 ( .A(n795), .B(n106), .C(n51), .D(n897), .Y(n796) );
  NOR2X1 U890 ( .A(n797), .B(n796), .Y(n798) );
  NAND3X1 U891 ( .A(n800), .B(n799), .C(n798), .Y(n807) );
  AOI22X1 U892 ( .A(kin[45]), .B(n145), .C(kin[47]), .D(n141), .Y(n805) );
  AOI22X1 U893 ( .A(kin[41]), .B(n151), .C(kin[43]), .D(n102), .Y(n804) );
  OAI22X1 U894 ( .A(n158), .B(n899), .C(n154), .D(n898), .Y(n802) );
  OAI22X1 U895 ( .A(n172), .B(n907), .C(n162), .D(n906), .Y(n801) );
  NOR2X1 U896 ( .A(n802), .B(n801), .Y(n803) );
  NAND3X1 U897 ( .A(n805), .B(n804), .C(n803), .Y(n806) );
  OR2X2 U898 ( .A(n807), .B(n806), .Y(k_out[55]) );
  AOI22X1 U899 ( .A(n114), .B(kin[0]), .C(n111), .D(kin[2]), .Y(n812) );
  AOI22X1 U900 ( .A(n125), .B(kin[24]), .C(n121), .D(kin[26]), .Y(n811) );
  OAI22X1 U901 ( .A(n50), .B(n845), .C(n844), .D(n30), .Y(n809) );
  OAI22X1 U902 ( .A(n827), .B(n138), .C(n47), .D(n846), .Y(n808) );
  NOR2X1 U903 ( .A(n809), .B(n808), .Y(n810) );
  NAND3X1 U904 ( .A(n812), .B(n811), .C(n810), .Y(n657) );
  AOI22X1 U905 ( .A(kin[7]), .B(n144), .C(kin[9]), .D(n3), .Y(n818) );
  AOI22X1 U906 ( .A(kin[3]), .B(n152), .C(kin[5]), .D(n101), .Y(n817) );
  OAI22X1 U907 ( .A(n66), .B(n828), .C(n71), .D(n813), .Y(n815) );
  OAI22X1 U908 ( .A(n170), .B(n918), .C(n58), .D(n916), .Y(n814) );
  NOR2X1 U909 ( .A(n815), .B(n814), .Y(n816) );
  NAND3X1 U910 ( .A(n818), .B(n817), .C(n816), .Y(n658) );
  AOI22X1 U911 ( .A(n114), .B(kin[4]), .C(n111), .D(kin[6]), .Y(n825) );
  AOI22X1 U912 ( .A(n125), .B(kin[0]), .C(n121), .D(kin[2]), .Y(n824) );
  OAI22X1 U913 ( .A(n837), .B(n50), .C(n819), .D(n30), .Y(n822) );
  OAI22X1 U914 ( .A(n820), .B(n138), .C(n844), .D(n47), .Y(n821) );
  NOR2X1 U915 ( .A(n822), .B(n821), .Y(n823) );
  NAND3X1 U916 ( .A(n825), .B(n824), .C(n823), .Y(n597) );
  AOI22X1 U917 ( .A(kin[11]), .B(n44), .C(kin[13]), .D(n3), .Y(n833) );
  AOI22X1 U918 ( .A(kin[7]), .B(n152), .C(kin[9]), .D(n101), .Y(n832) );
  OAI22X1 U919 ( .A(n66), .B(n826), .C(n156), .D(n845), .Y(n830) );
  OAI22X1 U920 ( .A(n172), .B(n828), .C(n58), .D(n827), .Y(n829) );
  NOR2X1 U921 ( .A(n830), .B(n829), .Y(n831) );
  NAND3X1 U922 ( .A(n833), .B(n832), .C(n831), .Y(n598) );
  AOI22X1 U923 ( .A(n114), .B(kin[7]), .C(kin[9]), .D(n109), .Y(n842) );
  AOI22X1 U924 ( .A(kin[3]), .B(n125), .C(kin[5]), .D(n121), .Y(n841) );
  OAI22X1 U925 ( .A(n50), .B(n835), .C(n30), .D(n834), .Y(n839) );
  OAI22X1 U926 ( .A(n837), .B(n138), .C(n47), .D(n836), .Y(n838) );
  NOR2X1 U927 ( .A(n839), .B(n838), .Y(n840) );
  NAND3X1 U928 ( .A(n842), .B(n841), .C(n840), .Y(n561) );
  AOI22X1 U929 ( .A(kin[14]), .B(n44), .C(kin[16]), .D(n3), .Y(n851) );
  AOI22X1 U930 ( .A(kin[10]), .B(n152), .C(kin[12]), .D(n101), .Y(n850) );
  OAI22X1 U931 ( .A(n844), .B(n66), .C(n156), .D(n843), .Y(n848) );
  OAI22X1 U932 ( .A(n171), .B(n846), .C(n58), .D(n845), .Y(n847) );
  NOR2X1 U933 ( .A(n848), .B(n847), .Y(n849) );
  NAND3X1 U934 ( .A(n851), .B(n850), .C(n849), .Y(n562) );
  AOI22X1 U935 ( .A(kin[45]), .B(n114), .C(kin[47]), .D(n109), .Y(n858) );
  AOI22X1 U936 ( .A(kin[41]), .B(n125), .C(kin[43]), .D(n121), .Y(n857) );
  OAI22X1 U937 ( .A(n50), .B(n865), .C(n30), .D(n852), .Y(n855) );
  OAI22X1 U938 ( .A(n138), .B(n853), .C(n47), .D(n871), .Y(n854) );
  NOR2X1 U939 ( .A(n855), .B(n854), .Y(n856) );
  NAND3X1 U940 ( .A(n858), .B(n857), .C(n856), .Y(n429) );
  AOI22X1 U941 ( .A(kin[52]), .B(n44), .C(kin[54]), .D(n3), .Y(n864) );
  AOI22X1 U942 ( .A(kin[48]), .B(n152), .C(kin[50]), .D(n101), .Y(n863) );
  OAI22X1 U943 ( .A(n66), .B(n859), .C(n156), .D(n872), .Y(n861) );
  OAI22X1 U944 ( .A(n172), .B(n897), .C(n58), .D(n896), .Y(n860) );
  NOR2X1 U945 ( .A(n861), .B(n860), .Y(n862) );
  NAND3X1 U946 ( .A(n864), .B(n863), .C(n862), .Y(n430) );
  AOI22X1 U947 ( .A(kin[48]), .B(n114), .C(kin[50]), .D(n109), .Y(n870) );
  AOI22X1 U948 ( .A(kin[44]), .B(n125), .C(kin[46]), .D(n121), .Y(n869) );
  OAI22X1 U949 ( .A(n50), .B(n888), .C(n30), .D(n881), .Y(n867) );
  OAI22X1 U950 ( .A(n138), .B(n865), .C(n47), .D(n889), .Y(n866) );
  NOR2X1 U951 ( .A(n867), .B(n866), .Y(n868) );
  NAND3X1 U952 ( .A(n870), .B(n869), .C(n868), .Y(n393) );
  AOI22X1 U953 ( .A(kin[55]), .B(n44), .C(kin[29]), .D(n3), .Y(n878) );
  AOI22X1 U954 ( .A(kin[51]), .B(n152), .C(kin[53]), .D(n101), .Y(n877) );
  OAI22X1 U955 ( .A(n66), .B(n871), .C(n156), .D(n890), .Y(n875) );
  OAI22X1 U956 ( .A(n172), .B(n873), .C(n58), .D(n872), .Y(n874) );
  NOR2X1 U957 ( .A(n875), .B(n874), .Y(n876) );
  NAND3X1 U958 ( .A(n878), .B(n877), .C(n876), .Y(n394) );
  AOI22X1 U959 ( .A(kin[53]), .B(n114), .C(kin[55]), .D(n109), .Y(n886) );
  AOI22X1 U960 ( .A(kin[49]), .B(n125), .C(kin[51]), .D(n121), .Y(n885) );
  OAI22X1 U961 ( .A(n50), .B(n879), .C(n30), .D(n908), .Y(n883) );
  OAI22X1 U962 ( .A(n138), .B(n881), .C(n47), .D(n880), .Y(n882) );
  NOR2X1 U963 ( .A(n883), .B(n882), .Y(n884) );
  NAND3X1 U964 ( .A(n886), .B(n885), .C(n884), .Y(n321) );
  AOI22X1 U965 ( .A(kin[32]), .B(n44), .C(kin[34]), .D(n3), .Y(n895) );
  AOI22X1 U966 ( .A(kin[28]), .B(n152), .C(kin[30]), .D(n101), .Y(n894) );
  OAI22X1 U967 ( .A(n66), .B(n888), .C(n156), .D(n887), .Y(n892) );
  OAI22X1 U968 ( .A(n170), .B(n890), .C(n58), .D(n889), .Y(n891) );
  NOR2X1 U969 ( .A(n892), .B(n891), .Y(n893) );
  NAND3X1 U970 ( .A(n895), .B(n894), .C(n893), .Y(n322) );
  AOI22X1 U971 ( .A(kin[36]), .B(n114), .C(kin[38]), .D(n109), .Y(n904) );
  AOI22X1 U972 ( .A(kin[32]), .B(n125), .C(kin[34]), .D(n121), .Y(n903) );
  OAI22X1 U973 ( .A(n50), .B(n897), .C(n30), .D(n896), .Y(n901) );
  OAI22X1 U974 ( .A(n138), .B(n899), .C(n47), .D(n898), .Y(n900) );
  NOR2X1 U975 ( .A(n901), .B(n900), .Y(n902) );
  NAND3X1 U976 ( .A(n904), .B(n903), .C(n902), .Y(n177) );
  AOI22X1 U977 ( .A(kin[43]), .B(n44), .C(kin[45]), .D(n3), .Y(n913) );
  AOI22X1 U978 ( .A(kin[39]), .B(n152), .C(kin[41]), .D(n101), .Y(n912) );
  OAI22X1 U979 ( .A(n66), .B(n906), .C(n156), .D(n905), .Y(n910) );
  OAI22X1 U980 ( .A(n170), .B(n908), .C(n58), .D(n907), .Y(n909) );
  NOR2X1 U981 ( .A(n910), .B(n909), .Y(n911) );
  NAND3X1 U982 ( .A(n913), .B(n912), .C(n911), .Y(n178) );
  AOI22X1 U983 ( .A(kin[19]), .B(n114), .C(kin[21]), .D(n110), .Y(n927) );
  AOI22X1 U984 ( .A(kin[15]), .B(n125), .C(kin[17]), .D(n121), .Y(n926) );
  OAI22X1 U985 ( .A(n50), .B(n918), .C(n30), .D(n916), .Y(n924) );
  OAI22X1 U986 ( .A(n139), .B(n922), .C(n47), .D(n920), .Y(n923) );
  NOR2X1 U987 ( .A(n924), .B(n923), .Y(n925) );
  NAND3X1 U988 ( .A(n927), .B(n926), .C(n925), .Y(n99) );
  AOI22X1 U989 ( .A(kin[26]), .B(n44), .C(kin[0]), .D(n3), .Y(n938) );
  AOI22X1 U990 ( .A(kin[22]), .B(n152), .C(kin[24]), .D(n101), .Y(n937) );
  OAI22X1 U991 ( .A(n66), .B(n931), .C(n71), .D(n930), .Y(n935) );
  OAI22X1 U992 ( .A(n170), .B(n933), .C(n61), .D(n932), .Y(n934) );
  NOR2X1 U993 ( .A(n935), .B(n934), .Y(n936) );
  NAND3X1 U994 ( .A(n938), .B(n937), .C(n936), .Y(n100) );
endmodule


module key_permutation2_2 ( kin, kout );
  input [55:0] kin;
  output [47:0] kout;
  wire   \kin[31] , \kin[28] , \kin[35] , \kin[49] , \kin[41] , \kin[45] ,
         \kin[52] , \kin[33] , \kin[55] , \kin[38] , \kin[48] , \kin[43] ,
         \kin[47] , \kin[32] , \kin[44] , \kin[50] , \kin[39] , \kin[29] ,
         \kin[54] , \kin[46] , \kin[36] , \kin[30] , \kin[51] , \kin[40] ,
         \kin[1] , \kin[12] , \kin[19] , \kin[26] , \kin[6] , \kin[15] ,
         \kin[7] , \kin[25] , \kin[3] , \kin[11] , \kin[18] , \kin[22] ,
         \kin[9] , \kin[20] , \kin[5] , \kin[14] , \kin[27] , \kin[2] ,
         \kin[4] , \kin[0] , \kin[23] , \kin[10] , \kin[16] , \kin[13] ;
  assign kout[47] = \kin[31] ;
  assign \kin[31]  = kin[31];
  assign kout[46] = \kin[28] ;
  assign \kin[28]  = kin[28];
  assign kout[45] = \kin[35] ;
  assign \kin[35]  = kin[35];
  assign kout[44] = \kin[49] ;
  assign \kin[49]  = kin[49];
  assign kout[43] = \kin[41] ;
  assign \kin[41]  = kin[41];
  assign kout[42] = \kin[45] ;
  assign \kin[45]  = kin[45];
  assign kout[41] = \kin[52] ;
  assign \kin[52]  = kin[52];
  assign kout[40] = \kin[33] ;
  assign \kin[33]  = kin[33];
  assign kout[39] = \kin[55] ;
  assign \kin[55]  = kin[55];
  assign kout[38] = \kin[38] ;
  assign \kin[38]  = kin[38];
  assign kout[37] = \kin[48] ;
  assign \kin[48]  = kin[48];
  assign kout[36] = \kin[43] ;
  assign \kin[43]  = kin[43];
  assign kout[35] = \kin[47] ;
  assign \kin[47]  = kin[47];
  assign kout[34] = \kin[32] ;
  assign \kin[32]  = kin[32];
  assign kout[33] = \kin[44] ;
  assign \kin[44]  = kin[44];
  assign kout[32] = \kin[50] ;
  assign \kin[50]  = kin[50];
  assign kout[31] = \kin[39] ;
  assign \kin[39]  = kin[39];
  assign kout[30] = \kin[29] ;
  assign \kin[29]  = kin[29];
  assign kout[29] = \kin[54] ;
  assign \kin[54]  = kin[54];
  assign kout[28] = \kin[46] ;
  assign \kin[46]  = kin[46];
  assign kout[27] = \kin[36] ;
  assign \kin[36]  = kin[36];
  assign kout[26] = \kin[30] ;
  assign \kin[30]  = kin[30];
  assign kout[25] = \kin[51] ;
  assign \kin[51]  = kin[51];
  assign kout[24] = \kin[40] ;
  assign \kin[40]  = kin[40];
  assign kout[23] = \kin[1] ;
  assign \kin[1]  = kin[1];
  assign kout[22] = \kin[12] ;
  assign \kin[12]  = kin[12];
  assign kout[21] = \kin[19] ;
  assign \kin[19]  = kin[19];
  assign kout[20] = \kin[26] ;
  assign \kin[26]  = kin[26];
  assign kout[19] = \kin[6] ;
  assign \kin[6]  = kin[6];
  assign kout[18] = \kin[15] ;
  assign \kin[15]  = kin[15];
  assign kout[17] = \kin[7] ;
  assign \kin[7]  = kin[7];
  assign kout[16] = \kin[25] ;
  assign \kin[25]  = kin[25];
  assign kout[15] = \kin[3] ;
  assign \kin[3]  = kin[3];
  assign kout[14] = \kin[11] ;
  assign \kin[11]  = kin[11];
  assign kout[13] = \kin[18] ;
  assign \kin[18]  = kin[18];
  assign kout[12] = \kin[22] ;
  assign \kin[22]  = kin[22];
  assign kout[11] = \kin[9] ;
  assign \kin[9]  = kin[9];
  assign kout[10] = \kin[20] ;
  assign \kin[20]  = kin[20];
  assign kout[9] = \kin[5] ;
  assign \kin[5]  = kin[5];
  assign kout[8] = \kin[14] ;
  assign \kin[14]  = kin[14];
  assign kout[7] = \kin[27] ;
  assign \kin[27]  = kin[27];
  assign kout[6] = \kin[2] ;
  assign \kin[2]  = kin[2];
  assign kout[5] = \kin[4] ;
  assign \kin[4]  = kin[4];
  assign kout[4] = \kin[0] ;
  assign \kin[0]  = kin[0];
  assign kout[3] = \kin[23] ;
  assign \kin[23]  = kin[23];
  assign kout[2] = \kin[10] ;
  assign \kin[10]  = kin[10];
  assign kout[1] = \kin[16] ;
  assign \kin[16]  = kin[16];
  assign kout[0] = \kin[13] ;
  assign \kin[13]  = kin[13];

endmodule


module key_wrapper_2 ( key_in, round_number, kout );
  input [63:0] key_in;
  input [4:0] round_number;
  output [47:0] kout;

  wire   [55:0] k_p1toshift;
  wire   [55:0] k_shifttop2;

  key_permutation1_2 KEY_PREMUTATION1 ( .k_o(key_in), .kout(k_p1toshift) );
  key_shift_2 KEY_SHIFT ( .kin(k_p1toshift), .k_out(k_shifttop2), .roundSel(
        round_number) );
  key_permutation2_2 KEY_PERMUTATION2 ( .kin(k_shifttop2), .kout(kout) );
endmodule


module key_xor_2 ( data, key, out );
  input [47:0] data;
  input [47:0] key;
  output [47:0] out;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30;

  XOR2X1 U1 ( .A(key[42]), .B(n1), .Y(out[42]) );
  INVX8 U2 ( .A(n30), .Y(n1) );
  XNOR2X1 U3 ( .A(key[17]), .B(n2), .Y(out[17]) );
  INVX8 U4 ( .A(data[17]), .Y(n2) );
  XNOR2X1 U5 ( .A(key[11]), .B(n3), .Y(out[11]) );
  INVX8 U6 ( .A(data[11]), .Y(n3) );
  INVX2 U7 ( .A(data[14]), .Y(n24) );
  INVX2 U8 ( .A(data[12]), .Y(n29) );
  INVX2 U9 ( .A(data[9]), .Y(n15) );
  INVX2 U10 ( .A(data[42]), .Y(n30) );
  INVX2 U11 ( .A(data[1]), .Y(n10) );
  INVX2 U12 ( .A(data[24]), .Y(n7) );
  INVX2 U13 ( .A(data[26]), .Y(n16) );
  INVX2 U14 ( .A(data[20]), .Y(n11) );
  INVX2 U15 ( .A(data[44]), .Y(n17) );
  INVX2 U16 ( .A(data[8]), .Y(n6) );
  INVX2 U17 ( .A(data[30]), .Y(n27) );
  INVX2 U18 ( .A(data[35]), .Y(n8) );
  INVX2 U19 ( .A(data[16]), .Y(n5) );
  INVX2 U20 ( .A(data[0]), .Y(n23) );
  INVX2 U21 ( .A(data[4]), .Y(n9) );
  INVX2 U22 ( .A(data[36]), .Y(n20) );
  INVX2 U23 ( .A(data[41]), .Y(n18) );
  INVX2 U24 ( .A(data[43]), .Y(n4) );
  INVX2 U25 ( .A(data[28]), .Y(n19) );
  INVX2 U26 ( .A(data[6]), .Y(n21) );
  INVX2 U27 ( .A(data[39]), .Y(n14) );
  INVX2 U28 ( .A(data[27]), .Y(n12) );
  XOR2X1 U29 ( .A(key[19]), .B(data[19]), .Y(out[19]) );
  XNOR2X1 U30 ( .A(key[41]), .B(n18), .Y(out[41]) );
  XNOR2X1 U31 ( .A(key[43]), .B(n4), .Y(out[43]) );
  XOR2X1 U32 ( .A(key[7]), .B(data[7]), .Y(out[7]) );
  XNOR2X1 U33 ( .A(key[16]), .B(n5), .Y(out[16]) );
  XNOR2X1 U34 ( .A(key[8]), .B(n6), .Y(out[8]) );
  XOR2X1 U35 ( .A(key[3]), .B(data[3]), .Y(out[3]) );
  XNOR2X1 U36 ( .A(key[24]), .B(n7), .Y(out[24]) );
  XNOR2X1 U37 ( .A(key[35]), .B(n8), .Y(out[35]) );
  XNOR2X1 U38 ( .A(key[4]), .B(n9), .Y(out[4]) );
  XNOR2X1 U39 ( .A(key[27]), .B(n12), .Y(out[27]) );
  XOR2X1 U40 ( .A(key[18]), .B(data[18]), .Y(out[18]) );
  XNOR2X1 U41 ( .A(key[1]), .B(n10), .Y(out[1]) );
  XNOR2X1 U42 ( .A(key[20]), .B(n11), .Y(out[20]) );
  XNOR2X1 U43 ( .A(key[38]), .B(n13), .Y(out[38]) );
  INVX8 U44 ( .A(data[38]), .Y(n13) );
  XOR2X1 U45 ( .A(key[47]), .B(data[47]), .Y(out[47]) );
  XNOR2X1 U46 ( .A(key[39]), .B(n14), .Y(out[39]) );
  XNOR2X1 U47 ( .A(key[9]), .B(n15), .Y(out[9]) );
  XNOR2X1 U48 ( .A(key[12]), .B(n29), .Y(out[12]) );
  XNOR2X1 U49 ( .A(key[26]), .B(n16), .Y(out[26]) );
  XNOR2X1 U50 ( .A(key[44]), .B(n17), .Y(out[44]) );
  XOR2X1 U51 ( .A(key[23]), .B(data[23]), .Y(out[23]) );
  INVX4 U52 ( .A(n28), .Y(out[15]) );
  XOR2X1 U53 ( .A(key[40]), .B(data[40]), .Y(out[40]) );
  INVX4 U54 ( .A(n22), .Y(out[5]) );
  XNOR2X1 U55 ( .A(key[28]), .B(n19), .Y(out[28]) );
  XNOR2X1 U56 ( .A(key[36]), .B(n20), .Y(out[36]) );
  XNOR2X1 U57 ( .A(key[6]), .B(n21), .Y(out[6]) );
  XNOR2X1 U58 ( .A(key[5]), .B(data[5]), .Y(n22) );
  XNOR2X1 U59 ( .A(key[0]), .B(n23), .Y(out[0]) );
  XNOR2X1 U60 ( .A(key[14]), .B(n24), .Y(out[14]) );
  XNOR2X1 U61 ( .A(key[29]), .B(n25), .Y(out[29]) );
  INVX8 U62 ( .A(data[29]), .Y(n25) );
  XNOR2X1 U63 ( .A(key[37]), .B(n26), .Y(out[37]) );
  INVX8 U64 ( .A(data[37]), .Y(n26) );
  XNOR2X1 U65 ( .A(key[30]), .B(n27), .Y(out[30]) );
  XNOR2X1 U66 ( .A(key[15]), .B(data[15]), .Y(n28) );
  XOR2X1 U67 ( .A(key[2]), .B(data[2]), .Y(out[2]) );
  XOR2X1 U68 ( .A(key[10]), .B(data[10]), .Y(out[10]) );
  XOR2X1 U69 ( .A(key[13]), .B(data[13]), .Y(out[13]) );
  XOR2X1 U70 ( .A(key[21]), .B(data[21]), .Y(out[21]) );
  XOR2X1 U71 ( .A(key[22]), .B(data[22]), .Y(out[22]) );
  XOR2X1 U72 ( .A(key[25]), .B(data[25]), .Y(out[25]) );
  XOR2X1 U73 ( .A(key[31]), .B(data[31]), .Y(out[31]) );
  XOR2X1 U74 ( .A(key[32]), .B(data[32]), .Y(out[32]) );
  XOR2X1 U75 ( .A(key[33]), .B(data[33]), .Y(out[33]) );
  XOR2X1 U76 ( .A(key[34]), .B(data[34]), .Y(out[34]) );
  XOR2X1 U77 ( .A(key[45]), .B(data[45]), .Y(out[45]) );
  XOR2X1 U78 ( .A(key[46]), .B(data[46]), .Y(out[46]) );
endmodule


module Sbox1_2 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N48, N129, N165, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161;
  assign data_out[3] = N48;
  assign data_out[1] = N129;
  assign data_out[0] = N165;

  INVX2 U1 ( .A(n140), .Y(n1) );
  INVX1 U2 ( .A(data_in[0]), .Y(n2) );
  INVX1 U3 ( .A(n108), .Y(n16) );
  INVX2 U4 ( .A(n109), .Y(n9) );
  INVX2 U5 ( .A(n88), .Y(n3) );
  INVX2 U6 ( .A(n37), .Y(n4) );
  INVX2 U7 ( .A(n4), .Y(n5) );
  INVX2 U8 ( .A(n8), .Y(n25) );
  INVX2 U9 ( .A(n127), .Y(n83) );
  AND2X1 U10 ( .A(n33), .B(n42), .Y(n6) );
  INVX2 U11 ( .A(n19), .Y(n7) );
  INVX2 U12 ( .A(n19), .Y(n135) );
  INVX2 U13 ( .A(n147), .Y(n111) );
  AND2X2 U14 ( .A(n132), .B(n133), .Y(n36) );
  INVX4 U15 ( .A(n112), .Y(n24) );
  INVX2 U16 ( .A(n13), .Y(n8) );
  INVX2 U17 ( .A(data_in[5]), .Y(n13) );
  INVX1 U18 ( .A(n132), .Y(n158) );
  BUFX2 U19 ( .A(n2), .Y(n10) );
  INVX4 U20 ( .A(n7), .Y(n153) );
  BUFX2 U21 ( .A(n140), .Y(n35) );
  OR2X1 U22 ( .A(n124), .B(n135), .Y(n40) );
  INVX2 U23 ( .A(n56), .Y(n18) );
  AND2X2 U24 ( .A(n44), .B(n50), .Y(n11) );
  NOR2X1 U25 ( .A(n11), .B(n49), .Y(n71) );
  INVX4 U26 ( .A(n43), .Y(n44) );
  INVX4 U27 ( .A(n14), .Y(n109) );
  INVX4 U28 ( .A(n76), .Y(n12) );
  INVX2 U29 ( .A(n42), .Y(n76) );
  AND2X2 U30 ( .A(n39), .B(n56), .Y(n14) );
  BUFX2 U31 ( .A(data_in[2]), .Y(n33) );
  INVX4 U32 ( .A(data_in[1]), .Y(n41) );
  INVX1 U33 ( .A(n123), .Y(n15) );
  INVX2 U34 ( .A(n122), .Y(n123) );
  BUFX2 U35 ( .A(data_in[0]), .Y(n39) );
  INVX2 U36 ( .A(data_in[4]), .Y(n43) );
  AND2X2 U37 ( .A(n39), .B(data_in[5]), .Y(n17) );
  INVX4 U38 ( .A(n17), .Y(n147) );
  INVX1 U39 ( .A(n78), .Y(n79) );
  BUFX2 U40 ( .A(n39), .Y(n29) );
  INVX4 U41 ( .A(data_in[4]), .Y(n144) );
  AND2X2 U42 ( .A(n2), .B(n13), .Y(n19) );
  INVX2 U43 ( .A(n97), .Y(n20) );
  INVX2 U44 ( .A(n121), .Y(n97) );
  NOR2X1 U45 ( .A(n21), .B(n22), .Y(n23) );
  NOR2X1 U46 ( .A(n23), .B(n142), .Y(n161) );
  INVX2 U47 ( .A(n36), .Y(n21) );
  INVX1 U48 ( .A(n143), .Y(n22) );
  INVX2 U49 ( .A(n110), .Y(n112) );
  INVX2 U50 ( .A(n13), .Y(n34) );
  INVX2 U51 ( .A(data_in[5]), .Y(n56) );
  NAND2X1 U52 ( .A(n26), .B(n27), .Y(n28) );
  NAND2X1 U53 ( .A(n60), .B(n28), .Y(n68) );
  INVX1 U54 ( .A(n120), .Y(n26) );
  INVX2 U55 ( .A(n61), .Y(n27) );
  INVX4 U56 ( .A(n42), .Y(n120) );
  INVX1 U57 ( .A(data_in[3]), .Y(n30) );
  BUFX2 U58 ( .A(n1), .Y(n31) );
  MUX2X1 U59 ( .B(n126), .A(n125), .S(n44), .Y(n129) );
  NAND2X1 U60 ( .A(n17), .B(n6), .Y(n72) );
  INVX8 U61 ( .A(n41), .Y(n42) );
  INVX1 U62 ( .A(n33), .Y(n32) );
  INVX4 U63 ( .A(data_in[2]), .Y(n108) );
  OR2X2 U64 ( .A(n151), .B(n127), .Y(n128) );
  INVX1 U65 ( .A(n24), .Y(n77) );
  AND2X2 U66 ( .A(n30), .B(n16), .Y(n37) );
  BUFX4 U67 ( .A(n150), .Y(n38) );
  INVX4 U68 ( .A(n38), .Y(n149) );
  INVX1 U69 ( .A(n78), .Y(n73) );
  NAND2X1 U70 ( .A(n40), .B(n123), .Y(n125) );
  AND2X1 U71 ( .A(n129), .B(n128), .Y(n130) );
  INVX1 U72 ( .A(n38), .Y(n113) );
  NAND2X1 U73 ( .A(n1), .B(n108), .Y(n121) );
  INVX2 U74 ( .A(data_in[3]), .Y(n140) );
  NAND2X1 U75 ( .A(n18), .B(n2), .Y(n110) );
  INVX2 U76 ( .A(n110), .Y(n143) );
  NAND2X1 U77 ( .A(n37), .B(n143), .Y(n134) );
  OAI21X1 U78 ( .A(n34), .B(n20), .C(n134), .Y(n50) );
  NAND2X1 U79 ( .A(data_in[2]), .B(data_in[3]), .Y(n136) );
  INVX2 U80 ( .A(n136), .Y(n74) );
  AOI22X1 U81 ( .A(n153), .B(n5), .C(n74), .D(n29), .Y(n48) );
  NAND2X1 U82 ( .A(n44), .B(n31), .Y(n45) );
  AOI21X1 U83 ( .A(n109), .B(n120), .C(n45), .Y(n46) );
  OAI21X1 U84 ( .A(n153), .B(n120), .C(n46), .Y(n47) );
  OAI21X1 U85 ( .A(n48), .B(n44), .C(n47), .Y(n49) );
  NAND2X1 U86 ( .A(data_in[4]), .B(n140), .Y(n150) );
  NAND2X1 U87 ( .A(n17), .B(n108), .Y(n127) );
  OAI22X1 U88 ( .A(n25), .B(n38), .C(n31), .D(n127), .Y(n55) );
  NOR2X1 U89 ( .A(n34), .B(n108), .Y(n52) );
  NOR2X1 U90 ( .A(n33), .B(n29), .Y(n51) );
  MUX2X1 U91 ( .B(n52), .A(n51), .S(n44), .Y(n53) );
  NAND2X1 U92 ( .A(n97), .B(n143), .Y(n119) );
  NAND2X1 U93 ( .A(n44), .B(n143), .Y(n94) );
  NAND3X1 U94 ( .A(n53), .B(n119), .C(n3), .Y(n54) );
  OAI21X1 U95 ( .A(n55), .B(n54), .C(n120), .Y(n70) );
  OAI21X1 U96 ( .A(n44), .B(n25), .C(n147), .Y(n57) );
  NAND2X1 U97 ( .A(n74), .B(n57), .Y(n61) );
  NAND2X1 U98 ( .A(n14), .B(n42), .Y(n58) );
  NOR2X1 U99 ( .A(n32), .B(n58), .Y(n59) );
  AOI22X1 U100 ( .A(n83), .B(n149), .C(n149), .D(n59), .Y(n60) );
  NAND2X1 U101 ( .A(n109), .B(n24), .Y(n148) );
  INVX2 U102 ( .A(n148), .Y(n66) );
  NAND2X1 U103 ( .A(n30), .B(n144), .Y(n151) );
  INVX2 U104 ( .A(n151), .Y(n145) );
  NAND2X1 U105 ( .A(n108), .B(n42), .Y(n132) );
  NAND2X1 U106 ( .A(n145), .B(n158), .Y(n65) );
  NOR2X1 U107 ( .A(n135), .B(n20), .Y(n63) );
  NAND2X1 U108 ( .A(n31), .B(n144), .Y(n101) );
  NOR2X1 U109 ( .A(n147), .B(n101), .Y(n62) );
  AOI22X1 U110 ( .A(n63), .B(n12), .C(n62), .D(n12), .Y(n64) );
  OAI21X1 U111 ( .A(n66), .B(n65), .C(n64), .Y(n67) );
  NOR2X1 U112 ( .A(n67), .B(n68), .Y(n69) );
  NAND3X1 U113 ( .A(n70), .B(n71), .C(n69), .Y(N165) );
  NAND2X1 U114 ( .A(n149), .B(n33), .Y(n78) );
  OAI21X1 U115 ( .A(n132), .B(n109), .C(n72), .Y(n122) );
  AOI22X1 U116 ( .A(n73), .B(n111), .C(n15), .D(n144), .Y(n100) );
  NAND2X1 U117 ( .A(n44), .B(n74), .Y(n103) );
  INVX2 U118 ( .A(n103), .Y(n75) );
  AOI22X1 U119 ( .A(n75), .B(n153), .C(n113), .D(n29), .Y(n82) );
  AOI21X1 U120 ( .A(n102), .B(n77), .C(n76), .Y(n81) );
  NAND2X1 U121 ( .A(n79), .B(n18), .Y(n80) );
  NAND3X1 U122 ( .A(n82), .B(n81), .C(n80), .Y(n93) );
  AOI22X1 U123 ( .A(n149), .B(n153), .C(n145), .D(n83), .Y(n91) );
  OAI21X1 U124 ( .A(n24), .B(n108), .C(n144), .Y(n87) );
  MUX2X1 U125 ( .B(n135), .A(n109), .S(n37), .Y(n86) );
  AOI21X1 U126 ( .A(n17), .B(n31), .C(n144), .Y(n84) );
  OAI21X1 U127 ( .A(n10), .B(n103), .C(n84), .Y(n85) );
  OAI21X1 U128 ( .A(n87), .B(n86), .C(n85), .Y(n90) );
  INVX2 U129 ( .A(n94), .Y(n88) );
  AOI21X1 U130 ( .A(n88), .B(n32), .C(n12), .Y(n89) );
  NAND3X1 U131 ( .A(n91), .B(n89), .C(n90), .Y(n92) );
  NAND2X1 U132 ( .A(n92), .B(n93), .Y(n99) );
  OAI21X1 U133 ( .A(n44), .B(n34), .C(n94), .Y(n96) );
  NOR2X1 U134 ( .A(n34), .B(n38), .Y(n95) );
  AOI22X1 U135 ( .A(n97), .B(n96), .C(n95), .D(n32), .Y(n98) );
  NAND3X1 U136 ( .A(n100), .B(n98), .C(n99), .Y(N129) );
  INVX2 U137 ( .A(n101), .Y(n102) );
  AOI22X1 U138 ( .A(n145), .B(n10), .C(n102), .D(n9), .Y(n107) );
  OAI21X1 U139 ( .A(n35), .B(n144), .C(n108), .Y(n104) );
  NAND2X1 U140 ( .A(n104), .B(n103), .Y(n105) );
  MUX2X1 U141 ( .B(n5), .A(n105), .S(n34), .Y(n106) );
  NAND2X1 U142 ( .A(n107), .B(n106), .Y(n118) );
  NAND3X1 U143 ( .A(n144), .B(n32), .C(n153), .Y(n116) );
  NAND2X1 U144 ( .A(n9), .B(n145), .Y(n115) );
  AOI22X1 U145 ( .A(n113), .B(n112), .C(n111), .D(n74), .Y(n114) );
  NAND3X1 U146 ( .A(n116), .B(n115), .C(n114), .Y(n117) );
  MUX2X1 U147 ( .B(n118), .A(n117), .S(n12), .Y(n131) );
  INVX2 U148 ( .A(n119), .Y(n126) );
  NAND2X1 U149 ( .A(n120), .B(n121), .Y(n133) );
  NAND2X1 U150 ( .A(n133), .B(n132), .Y(n124) );
  NAND2X1 U151 ( .A(n131), .B(n130), .Y(data_out[2]) );
  MUX2X1 U152 ( .B(n9), .A(n153), .S(n12), .Y(n141) );
  INVX2 U153 ( .A(n134), .Y(n138) );
  OAI21X1 U154 ( .A(n136), .B(n135), .C(n144), .Y(n137) );
  NOR2X1 U155 ( .A(n138), .B(n137), .Y(n139) );
  OAI21X1 U156 ( .A(n141), .B(n35), .C(n139), .Y(n142) );
  AOI21X1 U157 ( .A(n29), .B(n36), .C(n144), .Y(n160) );
  MUX2X1 U158 ( .B(n44), .A(n145), .S(n29), .Y(n146) );
  OAI21X1 U159 ( .A(n44), .B(n147), .C(n146), .Y(n157) );
  NAND2X1 U160 ( .A(n149), .B(n148), .Y(n155) );
  MUX2X1 U161 ( .B(n151), .A(n38), .S(n42), .Y(n152) );
  OAI21X1 U162 ( .A(n153), .B(n111), .C(n152), .Y(n154) );
  OAI21X1 U163 ( .A(n12), .B(n155), .C(n154), .Y(n156) );
  AOI21X1 U164 ( .A(n158), .B(n157), .C(n156), .Y(n159) );
  OAI21X1 U165 ( .A(n161), .B(n160), .C(n159), .Y(N48) );
endmodule


module Sbox2_2 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N62, N106, N138, N163, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150;
  assign data_out[3] = N62;
  assign data_out[2] = N106;
  assign data_out[1] = N138;
  assign data_out[0] = N163;

  INVX1 U1 ( .A(n131), .Y(n1) );
  BUFX2 U2 ( .A(n69), .Y(n2) );
  INVX4 U3 ( .A(n47), .Y(n128) );
  BUFX4 U4 ( .A(n88), .Y(n3) );
  INVX2 U5 ( .A(data_in[5]), .Y(n88) );
  AND2X2 U6 ( .A(n45), .B(n128), .Y(n4) );
  INVX1 U7 ( .A(n118), .Y(n5) );
  INVX2 U8 ( .A(data_in[2]), .Y(n48) );
  NOR2X1 U9 ( .A(n42), .B(n49), .Y(n27) );
  INVX2 U10 ( .A(n49), .Y(n142) );
  INVX4 U11 ( .A(n48), .Y(n49) );
  INVX2 U12 ( .A(n41), .Y(n12) );
  AND2X2 U13 ( .A(n45), .B(n47), .Y(n6) );
  INVX1 U14 ( .A(n6), .Y(n55) );
  INVX4 U15 ( .A(n68), .Y(n135) );
  NAND2X1 U16 ( .A(data_in[5]), .B(n116), .Y(n7) );
  INVX4 U17 ( .A(n7), .Y(n38) );
  INVX8 U18 ( .A(n38), .Y(n44) );
  OR2X2 U19 ( .A(n48), .B(n42), .Y(n136) );
  BUFX2 U20 ( .A(n19), .Y(n8) );
  INVX4 U21 ( .A(n10), .Y(n20) );
  INVX1 U22 ( .A(n42), .Y(n17) );
  INVX4 U23 ( .A(n14), .Y(n9) );
  INVX2 U24 ( .A(n49), .Y(n14) );
  NAND2X1 U25 ( .A(n47), .B(n125), .Y(n10) );
  BUFX2 U26 ( .A(n31), .Y(n11) );
  NAND2X1 U27 ( .A(n12), .B(n130), .Y(n13) );
  NAND2X1 U28 ( .A(n13), .B(n63), .Y(n66) );
  INVX1 U29 ( .A(n29), .Y(n30) );
  NAND2X1 U30 ( .A(n14), .B(n15), .Y(n16) );
  NAND2X1 U31 ( .A(n16), .B(n95), .Y(n103) );
  INVX1 U32 ( .A(n96), .Y(n15) );
  INVX2 U33 ( .A(n21), .Y(n93) );
  INVX1 U34 ( .A(n42), .Y(n18) );
  BUFX2 U35 ( .A(data_in[3]), .Y(n42) );
  INVX2 U36 ( .A(n88), .Y(n23) );
  INVX2 U37 ( .A(n136), .Y(n131) );
  AND2X2 U38 ( .A(n41), .B(n88), .Y(n19) );
  INVX1 U39 ( .A(n8), .Y(n100) );
  INVX4 U40 ( .A(n20), .Y(n115) );
  AND2X2 U41 ( .A(n27), .B(n31), .Y(n21) );
  INVX2 U42 ( .A(n136), .Y(n22) );
  INVX4 U43 ( .A(n31), .Y(n138) );
  AND2X1 U44 ( .A(n38), .B(n34), .Y(n119) );
  AND2X1 U45 ( .A(n20), .B(n18), .Y(n24) );
  AND2X1 U46 ( .A(n20), .B(n17), .Y(n39) );
  BUFX2 U47 ( .A(n125), .Y(n25) );
  INVX2 U48 ( .A(data_in[4]), .Y(n125) );
  INVX2 U49 ( .A(n116), .Y(n26) );
  INVX2 U50 ( .A(data_in[0]), .Y(n116) );
  INVX1 U51 ( .A(n27), .Y(n118) );
  INVX2 U52 ( .A(n33), .Y(n34) );
  INVX2 U53 ( .A(data_in[1]), .Y(n46) );
  INVX4 U54 ( .A(n46), .Y(n47) );
  INVX1 U55 ( .A(n26), .Y(n28) );
  NAND2X1 U56 ( .A(n111), .B(n112), .Y(n29) );
  NAND2X1 U57 ( .A(n113), .B(n30), .Y(n124) );
  AND2X2 U58 ( .A(n26), .B(data_in[5]), .Y(n31) );
  BUFX2 U59 ( .A(data_in[0]), .Y(n41) );
  NAND2X1 U60 ( .A(n45), .B(n128), .Y(n32) );
  INVX1 U61 ( .A(n47), .Y(n33) );
  BUFX4 U62 ( .A(data_in[4]), .Y(n45) );
  AND2X2 U63 ( .A(n9), .B(n38), .Y(n35) );
  INVX2 U64 ( .A(n35), .Y(n94) );
  AND2X2 U65 ( .A(n116), .B(n88), .Y(n36) );
  INVX2 U66 ( .A(n36), .Y(n137) );
  INVX1 U67 ( .A(n109), .Y(n110) );
  AND2X2 U68 ( .A(n125), .B(n128), .Y(n37) );
  AND2X2 U69 ( .A(n43), .B(n142), .Y(n40) );
  BUFX2 U70 ( .A(data_in[3]), .Y(n43) );
  NOR2X1 U71 ( .A(n17), .B(n55), .Y(n51) );
  NAND2X1 U72 ( .A(n49), .B(n43), .Y(n139) );
  OAI21X1 U73 ( .A(n34), .B(n139), .C(n118), .Y(n50) );
  NAND2X1 U74 ( .A(n88), .B(n12), .Y(n96) );
  INVX2 U75 ( .A(n96), .Y(n69) );
  MUX2X1 U76 ( .B(n51), .A(n50), .S(n69), .Y(n62) );
  AOI22X1 U77 ( .A(n37), .B(n41), .C(n69), .D(n20), .Y(n53) );
  NAND2X1 U78 ( .A(n45), .B(n128), .Y(n117) );
  NAND2X1 U79 ( .A(n43), .B(n125), .Y(n68) );
  AOI22X1 U80 ( .A(n38), .B(n4), .C(n11), .D(n135), .Y(n52) );
  NAND2X1 U81 ( .A(n53), .B(n52), .Y(n54) );
  NAND2X1 U82 ( .A(n19), .B(n4), .Y(n70) );
  INVX2 U83 ( .A(n70), .Y(n92) );
  MUX2X1 U84 ( .B(n54), .A(n92), .S(n9), .Y(n61) );
  AOI22X1 U85 ( .A(n20), .B(n19), .C(n69), .D(n6), .Y(n56) );
  OAI21X1 U86 ( .A(n32), .B(n138), .C(n56), .Y(n59) );
  NAND3X1 U87 ( .A(n23), .B(n20), .C(n22), .Y(n57) );
  OAI21X1 U88 ( .A(n45), .B(n94), .C(n57), .Y(n58) );
  AOI21X1 U89 ( .A(n59), .B(n17), .C(n58), .Y(n60) );
  NAND3X1 U90 ( .A(n62), .B(n61), .C(n60), .Y(N163) );
  MUX2X1 U91 ( .B(n38), .A(n69), .S(n27), .Y(n63) );
  OAI21X1 U92 ( .A(n135), .B(n37), .C(n142), .Y(n64) );
  OAI21X1 U93 ( .A(n115), .B(n1), .C(n64), .Y(n65) );
  AOI22X1 U94 ( .A(n6), .B(n66), .C(n65), .D(n3), .Y(n82) );
  MUX2X1 U95 ( .B(n31), .A(n19), .S(n47), .Y(n67) );
  INVX2 U96 ( .A(n67), .Y(n97) );
  OAI22X1 U97 ( .A(n34), .B(n68), .C(n117), .D(n136), .Y(n114) );
  AOI22X1 U98 ( .A(n22), .B(n97), .C(n2), .D(n114), .Y(n81) );
  OAI22X1 U99 ( .A(n25), .B(n93), .C(n18), .D(n70), .Y(n79) );
  NOR2X1 U100 ( .A(n43), .B(n44), .Y(n72) );
  NOR2X1 U101 ( .A(n45), .B(n44), .Y(n71) );
  AOI22X1 U102 ( .A(n72), .B(n20), .C(n71), .D(n131), .Y(n77) );
  INVX2 U103 ( .A(n139), .Y(n130) );
  NAND3X1 U104 ( .A(n130), .B(n45), .C(n38), .Y(n76) );
  MUX2X1 U105 ( .B(n9), .A(n28), .S(n47), .Y(n74) );
  NOR2X1 U106 ( .A(n142), .B(n138), .Y(n73) );
  AOI22X1 U107 ( .A(n135), .B(n74), .C(n73), .D(n4), .Y(n75) );
  NAND3X1 U108 ( .A(n76), .B(n75), .C(n77), .Y(n78) );
  NOR2X1 U109 ( .A(n79), .B(n78), .Y(n80) );
  NAND3X1 U110 ( .A(n81), .B(n82), .C(n80), .Y(N138) );
  NAND2X1 U111 ( .A(n138), .B(n137), .Y(n132) );
  INVX2 U112 ( .A(n132), .Y(n83) );
  OAI21X1 U113 ( .A(n43), .B(n83), .C(n94), .Y(n87) );
  NAND2X1 U114 ( .A(n9), .B(n20), .Y(n85) );
  NAND2X1 U115 ( .A(n22), .B(n45), .Y(n84) );
  MUX2X1 U116 ( .B(n85), .A(n84), .S(n23), .Y(n86) );
  AOI21X1 U117 ( .A(n87), .B(n6), .C(n86), .Y(n106) );
  NOR2X1 U118 ( .A(n28), .B(n3), .Y(n89) );
  AOI22X1 U119 ( .A(n89), .B(n34), .C(n128), .D(n3), .Y(n90) );
  OAI22X1 U120 ( .A(n115), .B(n44), .C(n90), .D(n17), .Y(n91) );
  OAI21X1 U121 ( .A(n92), .B(n91), .C(n142), .Y(n105) );
  NOR2X1 U122 ( .A(n21), .B(n35), .Y(n95) );
  AOI21X1 U123 ( .A(n22), .B(n125), .C(n39), .Y(n101) );
  MUX2X1 U124 ( .B(n44), .A(n137), .S(n43), .Y(n98) );
  AOI22X1 U125 ( .A(n4), .B(n98), .C(n97), .D(n130), .Y(n99) );
  OAI21X1 U126 ( .A(n101), .B(n100), .C(n99), .Y(n102) );
  AOI21X1 U127 ( .A(n37), .B(n103), .C(n102), .Y(n104) );
  NAND3X1 U128 ( .A(n105), .B(n104), .C(n106), .Y(N106) );
  NOR2X1 U129 ( .A(n34), .B(n44), .Y(n108) );
  NAND2X1 U130 ( .A(n36), .B(n142), .Y(n109) );
  NOR2X1 U131 ( .A(n109), .B(n117), .Y(n107) );
  AOI21X1 U132 ( .A(n108), .B(n40), .C(n107), .Y(n113) );
  NAND3X1 U133 ( .A(n34), .B(n135), .C(n110), .Y(n112) );
  NAND3X1 U134 ( .A(n6), .B(n40), .C(n19), .Y(n111) );
  OAI21X1 U135 ( .A(n24), .B(n114), .C(n38), .Y(n122) );
  OAI22X1 U136 ( .A(n23), .B(n32), .C(n28), .D(n115), .Y(n120) );
  OAI21X1 U137 ( .A(n120), .B(n119), .C(n5), .Y(n121) );
  NAND2X1 U138 ( .A(n122), .B(n121), .Y(n123) );
  NOR2X1 U139 ( .A(n124), .B(n123), .Y(n150) );
  OAI21X1 U140 ( .A(n135), .B(n130), .C(n8), .Y(n127) );
  NAND3X1 U141 ( .A(n25), .B(n17), .C(n132), .Y(n126) );
  NAND2X1 U142 ( .A(n127), .B(n126), .Y(n129) );
  OAI21X1 U143 ( .A(n21), .B(n129), .C(n128), .Y(n149) );
  MUX2X1 U144 ( .B(n131), .A(n130), .S(n23), .Y(n134) );
  NAND2X1 U145 ( .A(n132), .B(n9), .Y(n133) );
  NAND2X1 U146 ( .A(n134), .B(n133), .Y(n147) );
  NAND3X1 U147 ( .A(n19), .B(n135), .C(n9), .Y(n145) );
  NOR2X1 U148 ( .A(n137), .B(n136), .Y(n141) );
  NOR2X1 U149 ( .A(n139), .B(n138), .Y(n140) );
  MUX2X1 U150 ( .B(n141), .A(n140), .S(n45), .Y(n144) );
  NAND3X1 U151 ( .A(n142), .B(n20), .C(n11), .Y(n143) );
  NAND3X1 U152 ( .A(n145), .B(n144), .C(n143), .Y(n146) );
  AOI21X1 U153 ( .A(n6), .B(n147), .C(n146), .Y(n148) );
  NAND3X1 U154 ( .A(n148), .B(n149), .C(n150), .Y(N62) );
endmodule


module Sbox3_2 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N62, N100, N138, N167, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143;
  assign data_out[3] = N62;
  assign data_out[2] = N100;
  assign data_out[1] = N138;
  assign data_out[0] = N167;

  INVX4 U1 ( .A(n107), .Y(n3) );
  INVX4 U2 ( .A(n28), .Y(n122) );
  NAND2X1 U3 ( .A(n27), .B(n25), .Y(n1) );
  NAND2X1 U4 ( .A(n27), .B(n25), .Y(n2) );
  INVX8 U5 ( .A(n30), .Y(n119) );
  INVX4 U6 ( .A(n7), .Y(n22) );
  OR2X1 U7 ( .A(n1), .B(n21), .Y(n4) );
  INVX2 U8 ( .A(data_in[0]), .Y(n49) );
  NOR2X1 U9 ( .A(n135), .B(n4), .Y(n139) );
  INVX4 U10 ( .A(data_in[3]), .Y(n27) );
  BUFX4 U11 ( .A(data_in[5]), .Y(n21) );
  INVX4 U12 ( .A(data_in[4]), .Y(n29) );
  INVX1 U13 ( .A(data_in[5]), .Y(n90) );
  BUFX2 U14 ( .A(n49), .Y(n5) );
  MUX2X1 U15 ( .B(n38), .A(n39), .S(n82), .Y(n86) );
  AND2X2 U16 ( .A(n30), .B(n24), .Y(n6) );
  INVX4 U17 ( .A(n6), .Y(n135) );
  AND2X2 U18 ( .A(n21), .B(n49), .Y(n7) );
  INVX1 U19 ( .A(n132), .Y(n8) );
  NAND2X1 U20 ( .A(n28), .B(n82), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n15) );
  INVX8 U22 ( .A(n23), .Y(n24) );
  INVX4 U23 ( .A(n24), .Y(n118) );
  INVX1 U24 ( .A(n120), .Y(n10) );
  INVX2 U25 ( .A(n120), .Y(n107) );
  NOR2X1 U26 ( .A(n139), .B(n138), .Y(n11) );
  NOR2X1 U27 ( .A(n140), .B(n12), .Y(n141) );
  INVX1 U28 ( .A(n11), .Y(n12) );
  NAND2X1 U29 ( .A(n28), .B(n25), .Y(n13) );
  AND2X2 U30 ( .A(n90), .B(data_in[0]), .Y(n14) );
  INVX2 U31 ( .A(n14), .Y(n116) );
  INVX1 U32 ( .A(n22), .Y(n93) );
  INVX1 U33 ( .A(n22), .Y(n74) );
  INVX4 U34 ( .A(data_in[2]), .Y(n25) );
  INVX4 U35 ( .A(n22), .Y(n132) );
  INVX2 U36 ( .A(n2), .Y(n16) );
  AND2X2 U37 ( .A(n49), .B(n90), .Y(n17) );
  INVX2 U38 ( .A(n17), .Y(n121) );
  AND2X2 U39 ( .A(n107), .B(n122), .Y(n18) );
  INVX1 U40 ( .A(n18), .Y(n63) );
  INVX1 U41 ( .A(n90), .Y(n19) );
  INVX2 U42 ( .A(n19), .Y(n20) );
  INVX8 U43 ( .A(n26), .Y(n82) );
  INVX2 U44 ( .A(data_in[1]), .Y(n23) );
  INVX8 U45 ( .A(n25), .Y(n26) );
  INVX8 U46 ( .A(n27), .Y(n28) );
  INVX8 U47 ( .A(n29), .Y(n30) );
  NAND2X1 U48 ( .A(n135), .B(n122), .Y(n35) );
  NAND2X1 U49 ( .A(n24), .B(n119), .Y(n115) );
  NAND2X1 U50 ( .A(n21), .B(data_in[0]), .Y(n120) );
  NAND2X1 U51 ( .A(n121), .B(n3), .Y(n113) );
  INVX2 U52 ( .A(n113), .Y(n31) );
  AOI21X1 U53 ( .A(n115), .B(n28), .C(n31), .Y(n34) );
  NAND2X1 U54 ( .A(n30), .B(n28), .Y(n114) );
  INVX2 U55 ( .A(n114), .Y(n103) );
  NAND2X1 U56 ( .A(n103), .B(n10), .Y(n87) );
  NAND3X1 U57 ( .A(n5), .B(n16), .C(n30), .Y(n32) );
  OAI21X1 U58 ( .A(n26), .B(n87), .C(n32), .Y(n33) );
  AOI21X1 U59 ( .A(n35), .B(n34), .C(n33), .Y(n48) );
  NAND2X1 U60 ( .A(n14), .B(n30), .Y(n81) );
  INVX2 U61 ( .A(n81), .Y(n64) );
  AOI22X1 U62 ( .A(n18), .B(n119), .C(n64), .D(n26), .Y(n36) );
  OAI21X1 U63 ( .A(n8), .B(n2), .C(n36), .Y(n43) );
  NAND2X1 U64 ( .A(n26), .B(n28), .Y(n131) );
  INVX2 U65 ( .A(n131), .Y(n37) );
  NOR2X1 U66 ( .A(n30), .B(n37), .Y(n41) );
  NAND2X1 U67 ( .A(n26), .B(n30), .Y(n62) );
  NAND2X1 U68 ( .A(n62), .B(n5), .Y(n40) );
  NOR2X1 U69 ( .A(n30), .B(n116), .Y(n39) );
  NAND2X1 U70 ( .A(n17), .B(n119), .Y(n123) );
  INVX2 U71 ( .A(n123), .Y(n38) );
  OAI21X1 U72 ( .A(n41), .B(n40), .C(n86), .Y(n42) );
  OAI21X1 U73 ( .A(n43), .B(n42), .C(n118), .Y(n47) );
  OAI22X1 U74 ( .A(n122), .B(n135), .C(n28), .D(n115), .Y(n45) );
  OAI21X1 U75 ( .A(n22), .B(n82), .C(n116), .Y(n102) );
  NOR2X1 U76 ( .A(n20), .B(n115), .Y(n44) );
  AOI22X1 U77 ( .A(n45), .B(n102), .C(n44), .D(n15), .Y(n46) );
  NAND3X1 U78 ( .A(n48), .B(n47), .C(n46), .Y(N167) );
  NAND2X1 U79 ( .A(n132), .B(n82), .Y(n50) );
  AOI21X1 U80 ( .A(n50), .B(n5), .C(n115), .Y(n57) );
  NAND3X1 U81 ( .A(n50), .B(n131), .C(n1), .Y(n56) );
  AOI22X1 U82 ( .A(n17), .B(n82), .C(n28), .D(n20), .Y(n54) );
  NOR2X1 U83 ( .A(n28), .B(n119), .Y(n52) );
  OAI21X1 U84 ( .A(n107), .B(n82), .C(n121), .Y(n51) );
  AOI22X1 U85 ( .A(n52), .B(n132), .C(n28), .D(n51), .Y(n53) );
  OAI21X1 U86 ( .A(n30), .B(n54), .C(n53), .Y(n55) );
  AOI22X1 U87 ( .A(n56), .B(n57), .C(n55), .D(n118), .Y(n72) );
  NAND3X1 U88 ( .A(n26), .B(n24), .C(n122), .Y(n58) );
  OAI21X1 U89 ( .A(n30), .B(n9), .C(n58), .Y(n108) );
  NAND2X1 U90 ( .A(n17), .B(n108), .Y(n71) );
  NAND2X1 U91 ( .A(n26), .B(n20), .Y(n59) );
  MUX2X1 U92 ( .B(n59), .A(n22), .S(n28), .Y(n60) );
  NOR2X1 U93 ( .A(n18), .B(n60), .Y(n61) );
  OAI21X1 U94 ( .A(n13), .B(n116), .C(n61), .Y(n69) );
  OAI21X1 U95 ( .A(n63), .B(n62), .C(n135), .Y(n68) );
  OAI21X1 U96 ( .A(n15), .B(n103), .C(n10), .Y(n66) );
  NAND3X1 U97 ( .A(n16), .B(n118), .C(n64), .Y(n65) );
  OAI21X1 U98 ( .A(n24), .B(n66), .C(n65), .Y(n67) );
  AOI21X1 U99 ( .A(n69), .B(n68), .C(n67), .Y(n70) );
  NAND3X1 U100 ( .A(n71), .B(n72), .C(n70), .Y(N138) );
  NOR2X1 U101 ( .A(n24), .B(n3), .Y(n73) );
  NAND3X1 U102 ( .A(n82), .B(n73), .C(n28), .Y(n78) );
  MUX2X1 U103 ( .B(n28), .A(n26), .S(n24), .Y(n75) );
  NAND2X1 U104 ( .A(n75), .B(n74), .Y(n77) );
  NAND2X1 U105 ( .A(n16), .B(n14), .Y(n76) );
  NAND3X1 U106 ( .A(n78), .B(n77), .C(n76), .Y(n80) );
  NOR2X1 U107 ( .A(n3), .B(n1), .Y(n79) );
  MUX2X1 U108 ( .B(n80), .A(n79), .S(n30), .Y(n101) );
  OAI21X1 U109 ( .A(n82), .B(n116), .C(n81), .Y(n84) );
  OAI21X1 U110 ( .A(n119), .B(n22), .C(n123), .Y(n83) );
  OAI21X1 U111 ( .A(n84), .B(n83), .C(n28), .Y(n85) );
  INVX2 U112 ( .A(n85), .Y(n89) );
  NAND2X1 U113 ( .A(n87), .B(n86), .Y(n88) );
  MUX2X1 U114 ( .B(n89), .A(n88), .S(n24), .Y(n100) );
  NOR2X1 U115 ( .A(n135), .B(n121), .Y(n98) );
  NAND2X1 U116 ( .A(n18), .B(n118), .Y(n96) );
  AND2X2 U117 ( .A(n30), .B(n20), .Y(n92) );
  AND2X2 U118 ( .A(n107), .B(n24), .Y(n91) );
  MUX2X1 U119 ( .B(n92), .A(n91), .S(n28), .Y(n95) );
  NAND2X1 U120 ( .A(n6), .B(n93), .Y(n94) );
  NAND3X1 U121 ( .A(n96), .B(n95), .C(n94), .Y(n97) );
  MUX2X1 U122 ( .B(n98), .A(n97), .S(n26), .Y(n99) );
  NAND3X1 U123 ( .A(n101), .B(n100), .C(n99), .Y(N100) );
  NAND3X1 U124 ( .A(n30), .B(n118), .C(n22), .Y(n105) );
  NAND3X1 U125 ( .A(n103), .B(n118), .C(n102), .Y(n104) );
  OAI21X1 U126 ( .A(n13), .B(n105), .C(n104), .Y(n112) );
  OAI21X1 U127 ( .A(n30), .B(n26), .C(n1), .Y(n106) );
  NAND3X1 U128 ( .A(n10), .B(n106), .C(n24), .Y(n110) );
  NAND2X1 U129 ( .A(n108), .B(n93), .Y(n109) );
  NAND2X1 U130 ( .A(n110), .B(n109), .Y(n111) );
  NOR2X1 U131 ( .A(n112), .B(n111), .Y(n143) );
  NAND3X1 U132 ( .A(n118), .B(n114), .C(n113), .Y(n129) );
  INVX2 U133 ( .A(n115), .Y(n117) );
  NAND2X1 U134 ( .A(n117), .B(n14), .Y(n128) );
  AOI21X1 U135 ( .A(n28), .B(n119), .C(n118), .Y(n126) );
  NAND2X1 U136 ( .A(n121), .B(n3), .Y(n125) );
  NAND2X1 U137 ( .A(n123), .B(n122), .Y(n124) );
  NAND3X1 U138 ( .A(n126), .B(n125), .C(n124), .Y(n127) );
  NAND3X1 U139 ( .A(n129), .B(n128), .C(n127), .Y(n130) );
  NAND2X1 U140 ( .A(n26), .B(n130), .Y(n142) );
  NAND2X1 U141 ( .A(n14), .B(n131), .Y(n134) );
  NAND3X1 U142 ( .A(n24), .B(n15), .C(n132), .Y(n133) );
  OAI21X1 U143 ( .A(n134), .B(n135), .C(n133), .Y(n140) );
  NOR2X1 U144 ( .A(n2), .B(n24), .Y(n137) );
  OAI21X1 U145 ( .A(n21), .B(n30), .C(n22), .Y(n136) );
  AND2X2 U146 ( .A(n137), .B(n136), .Y(n138) );
  NAND3X1 U147 ( .A(n142), .B(n143), .C(n141), .Y(N62) );
endmodule


module Sbox4_2 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N55, N92, N129, N161, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161;
  assign data_out[3] = N55;
  assign data_out[2] = N92;
  assign data_out[1] = N129;
  assign data_out[0] = N161;

  NAND2X1 U1 ( .A(n107), .B(n3), .Y(n1) );
  MUX2X1 U2 ( .B(n45), .A(n96), .S(n58), .Y(n2) );
  AND2X2 U3 ( .A(n37), .B(n36), .Y(n45) );
  INVX2 U4 ( .A(data_in[0]), .Y(n3) );
  NAND2X1 U5 ( .A(n44), .B(n139), .Y(n4) );
  AND2X2 U6 ( .A(n40), .B(n27), .Y(n48) );
  INVX1 U7 ( .A(n35), .Y(n5) );
  OAI21X1 U8 ( .A(n53), .B(n97), .C(n2), .Y(n6) );
  BUFX4 U9 ( .A(data_in[3]), .Y(n55) );
  INVX2 U10 ( .A(n11), .Y(n35) );
  AND2X2 U11 ( .A(n9), .B(n149), .Y(n7) );
  INVX2 U12 ( .A(n145), .Y(n125) );
  AND2X2 U13 ( .A(n58), .B(n26), .Y(n8) );
  AND2X2 U14 ( .A(data_in[5]), .B(n3), .Y(n9) );
  OR2X2 U15 ( .A(n56), .B(n50), .Y(n10) );
  MUX2X1 U16 ( .B(n12), .A(n13), .S(n58), .Y(n11) );
  NOR2X1 U17 ( .A(n108), .B(n95), .Y(n12) );
  NOR2X1 U18 ( .A(n53), .B(n127), .Y(n13) );
  BUFX4 U19 ( .A(n145), .Y(n17) );
  INVX2 U20 ( .A(n33), .Y(n152) );
  INVX8 U21 ( .A(n53), .Y(n109) );
  INVX1 U22 ( .A(n31), .Y(n32) );
  INVX1 U23 ( .A(data_in[5]), .Y(n31) );
  NAND2X1 U24 ( .A(n7), .B(n138), .Y(n14) );
  INVX2 U25 ( .A(n55), .Y(n146) );
  INVX2 U26 ( .A(n1), .Y(n15) );
  INVX4 U27 ( .A(n33), .Y(n16) );
  AND2X2 U28 ( .A(n51), .B(n149), .Y(n18) );
  INVX1 U29 ( .A(n18), .Y(n80) );
  AND2X2 U30 ( .A(n56), .B(n139), .Y(n19) );
  AND2X2 U31 ( .A(n8), .B(n41), .Y(n20) );
  NOR2X1 U32 ( .A(n20), .B(n153), .Y(n154) );
  NOR2X1 U33 ( .A(data_in[5]), .B(n3), .Y(n21) );
  BUFX2 U34 ( .A(n38), .Y(n22) );
  NAND2X1 U35 ( .A(n56), .B(n38), .Y(n23) );
  BUFX4 U36 ( .A(data_in[3]), .Y(n56) );
  INVX1 U37 ( .A(n108), .Y(n24) );
  INVX2 U38 ( .A(n108), .Y(n110) );
  BUFX2 U39 ( .A(n10), .Y(n25) );
  NOR2X1 U40 ( .A(n55), .B(n50), .Y(n26) );
  INVX1 U41 ( .A(n56), .Y(n27) );
  INVX1 U42 ( .A(n56), .Y(n28) );
  INVX2 U43 ( .A(n36), .Y(n29) );
  INVX1 U44 ( .A(n36), .Y(n95) );
  INVX2 U45 ( .A(n10), .Y(n86) );
  BUFX2 U46 ( .A(n51), .Y(n30) );
  AND2X1 U47 ( .A(n144), .B(n143), .Y(n90) );
  AND2X2 U48 ( .A(n50), .B(n55), .Y(n33) );
  INVX8 U49 ( .A(n16), .Y(n138) );
  BUFX2 U50 ( .A(n9), .Y(n34) );
  INVX4 U51 ( .A(n50), .Y(n139) );
  AND2X2 U52 ( .A(n146), .B(n52), .Y(n36) );
  BUFX4 U53 ( .A(data_in[2]), .Y(n50) );
  AND2X2 U54 ( .A(n107), .B(n3), .Y(n37) );
  INVX1 U55 ( .A(data_in[5]), .Y(n38) );
  INVX2 U56 ( .A(data_in[5]), .Y(n107) );
  AND2X2 U57 ( .A(n44), .B(n139), .Y(n39) );
  INVX1 U58 ( .A(n31), .Y(n40) );
  NAND2X1 U59 ( .A(n3), .B(data_in[5]), .Y(n41) );
  NAND2X1 U60 ( .A(n109), .B(n91), .Y(n42) );
  NAND2X1 U61 ( .A(n90), .B(n43), .Y(n92) );
  INVX2 U62 ( .A(n42), .Y(n43) );
  NOR2X1 U63 ( .A(data_in[5]), .B(n3), .Y(n44) );
  INVX2 U64 ( .A(n21), .Y(n108) );
  AND2X1 U65 ( .A(n109), .B(n149), .Y(n47) );
  AND2X2 U66 ( .A(n37), .B(n19), .Y(n46) );
  AND2X2 U67 ( .A(n58), .B(n44), .Y(n49) );
  INVX2 U68 ( .A(data_in[1]), .Y(n57) );
  BUFX2 U69 ( .A(data_in[2]), .Y(n51) );
  INVX4 U70 ( .A(data_in[4]), .Y(n52) );
  INVX8 U71 ( .A(n52), .Y(n53) );
  BUFX2 U72 ( .A(data_in[0]), .Y(n54) );
  INVX1 U73 ( .A(n54), .Y(n104) );
  INVX1 U74 ( .A(n51), .Y(n115) );
  AND2X1 U75 ( .A(n10), .B(n58), .Y(n81) );
  INVX1 U76 ( .A(n41), .Y(n116) );
  INVX8 U77 ( .A(n58), .Y(n149) );
  INVX8 U78 ( .A(n57), .Y(n58) );
  NAND2X1 U79 ( .A(n9), .B(n56), .Y(n127) );
  NAND2X1 U80 ( .A(n37), .B(n36), .Y(n99) );
  NAND2X1 U81 ( .A(n56), .B(n38), .Y(n87) );
  AOI21X1 U82 ( .A(n54), .B(n23), .C(n30), .Y(n60) );
  NOR2X1 U83 ( .A(n58), .B(n109), .Y(n59) );
  OAI21X1 U84 ( .A(n48), .B(n60), .C(n59), .Y(n61) );
  OAI21X1 U85 ( .A(n18), .B(n99), .C(n61), .Y(n62) );
  NOR2X1 U86 ( .A(n35), .B(n62), .Y(n77) );
  NAND2X1 U87 ( .A(data_in[5]), .B(n54), .Y(n145) );
  OAI22X1 U88 ( .A(n86), .B(n49), .C(n125), .D(n25), .Y(n63) );
  OAI21X1 U89 ( .A(n41), .B(n80), .C(n63), .Y(n64) );
  NAND2X1 U90 ( .A(n64), .B(n109), .Y(n76) );
  NAND2X1 U91 ( .A(n108), .B(n149), .Y(n68) );
  NAND2X1 U92 ( .A(n138), .B(n109), .Y(n67) );
  NOR2X1 U93 ( .A(n10), .B(n109), .Y(n65) );
  OAI21X1 U94 ( .A(n34), .B(n49), .C(n65), .Y(n66) );
  OAI21X1 U95 ( .A(n68), .B(n67), .C(n66), .Y(n74) );
  NAND2X1 U96 ( .A(n56), .B(n139), .Y(n147) );
  NAND2X1 U97 ( .A(n53), .B(n51), .Y(n70) );
  OAI22X1 U98 ( .A(n149), .B(n147), .C(n56), .D(n70), .Y(n69) );
  INVX2 U99 ( .A(n69), .Y(n98) );
  INVX2 U100 ( .A(n70), .Y(n71) );
  NAND2X1 U101 ( .A(n37), .B(n58), .Y(n114) );
  INVX2 U102 ( .A(n114), .Y(n78) );
  AOI22X1 U103 ( .A(n71), .B(n78), .C(n49), .D(n138), .Y(n72) );
  OAI21X1 U104 ( .A(n98), .B(n17), .C(n72), .Y(n73) );
  NOR2X1 U105 ( .A(n74), .B(n73), .Y(n75) );
  NAND3X1 U106 ( .A(n76), .B(n77), .C(n75), .Y(N161) );
  NAND2X1 U107 ( .A(n18), .B(n28), .Y(n123) );
  INVX2 U108 ( .A(n123), .Y(n137) );
  AOI22X1 U109 ( .A(n78), .B(n138), .C(n137), .D(n24), .Y(n103) );
  NAND2X1 U110 ( .A(n58), .B(n39), .Y(n151) );
  NAND2X1 U111 ( .A(n46), .B(n149), .Y(n79) );
  NAND3X1 U112 ( .A(n53), .B(n151), .C(n79), .Y(n94) );
  NAND2X1 U113 ( .A(n8), .B(n22), .Y(n85) );
  AOI22X1 U114 ( .A(n18), .B(n110), .C(n81), .D(n125), .Y(n84) );
  NAND3X1 U115 ( .A(n28), .B(n9), .C(n149), .Y(n82) );
  OAI21X1 U116 ( .A(n152), .B(n17), .C(n82), .Y(n83) );
  INVX2 U117 ( .A(n83), .Y(n155) );
  NAND3X1 U118 ( .A(n85), .B(n84), .C(n155), .Y(n93) );
  NAND2X1 U119 ( .A(n26), .B(n40), .Y(n91) );
  NAND2X1 U120 ( .A(n7), .B(n138), .Y(n144) );
  NAND3X1 U121 ( .A(n54), .B(n139), .C(n32), .Y(n88) );
  MUX2X1 U122 ( .B(n88), .A(n87), .S(n58), .Y(n89) );
  INVX2 U123 ( .A(n89), .Y(n143) );
  OAI21X1 U124 ( .A(n94), .B(n93), .C(n92), .Y(n102) );
  NAND2X1 U125 ( .A(n19), .B(n110), .Y(n97) );
  NOR2X1 U126 ( .A(n145), .B(n29), .Y(n96) );
  OAI21X1 U127 ( .A(n53), .B(n97), .C(n2), .Y(n133) );
  OAI22X1 U128 ( .A(n139), .B(n99), .C(n98), .D(n41), .Y(n100) );
  NOR2X1 U129 ( .A(n100), .B(n6), .Y(n101) );
  NAND3X1 U130 ( .A(n103), .B(n102), .C(n101), .Y(N129) );
  NAND2X1 U131 ( .A(n15), .B(n56), .Y(n106) );
  MUX2X1 U132 ( .B(n125), .A(n104), .S(n51), .Y(n105) );
  AOI21X1 U133 ( .A(n106), .B(n105), .C(n149), .Y(n122) );
  NAND3X1 U134 ( .A(n22), .B(n149), .C(n138), .Y(n113) );
  NAND2X1 U135 ( .A(n7), .B(n115), .Y(n112) );
  AOI21X1 U136 ( .A(n86), .B(n110), .C(n109), .Y(n111) );
  NAND3X1 U137 ( .A(n113), .B(n112), .C(n111), .Y(n121) );
  NAND2X1 U138 ( .A(n78), .B(n115), .Y(n119) );
  NAND2X1 U139 ( .A(n8), .B(n40), .Y(n118) );
  AOI21X1 U140 ( .A(n116), .B(n138), .C(n53), .Y(n117) );
  NAND3X1 U141 ( .A(n119), .B(n118), .C(n117), .Y(n120) );
  OAI21X1 U142 ( .A(n122), .B(n121), .C(n120), .Y(n136) );
  OAI21X1 U143 ( .A(n18), .B(n27), .C(n123), .Y(n124) );
  NAND3X1 U144 ( .A(n125), .B(n124), .C(n53), .Y(n135) );
  NAND3X1 U145 ( .A(n28), .B(n49), .C(n30), .Y(n126) );
  INVX2 U146 ( .A(n126), .Y(n132) );
  NAND2X1 U147 ( .A(n127), .B(n4), .Y(n128) );
  NAND2X1 U148 ( .A(n47), .B(n128), .Y(n130) );
  NAND3X1 U149 ( .A(n138), .B(n47), .C(n40), .Y(n129) );
  NAND2X1 U150 ( .A(n129), .B(n130), .Y(n131) );
  NOR3X1 U151 ( .A(n132), .B(n131), .C(n133), .Y(n134) );
  NAND3X1 U152 ( .A(n136), .B(n135), .C(n134), .Y(N92) );
  AOI22X1 U153 ( .A(n137), .B(n15), .C(n7), .D(n86), .Y(n161) );
  AOI21X1 U154 ( .A(n138), .B(n24), .C(n46), .Y(n142) );
  NOR2X1 U155 ( .A(n149), .B(n139), .Y(n140) );
  OAI21X1 U156 ( .A(n54), .B(n48), .C(n140), .Y(n141) );
  NAND2X1 U157 ( .A(n142), .B(n141), .Y(n159) );
  NAND3X1 U158 ( .A(n53), .B(n14), .C(n143), .Y(n158) );
  NOR2X1 U159 ( .A(n27), .B(n17), .Y(n150) );
  OAI21X1 U160 ( .A(n147), .B(n41), .C(n109), .Y(n148) );
  AOI21X1 U161 ( .A(n150), .B(n149), .C(n148), .Y(n156) );
  OAI21X1 U162 ( .A(n1), .B(n152), .C(n151), .Y(n153) );
  NAND3X1 U163 ( .A(n156), .B(n155), .C(n154), .Y(n157) );
  OAI21X1 U164 ( .A(n159), .B(n158), .C(n157), .Y(n160) );
  NAND3X1 U165 ( .A(n161), .B(n5), .C(n160), .Y(N55) );
endmodule


module Sbox5_2 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N55, N140, N163, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152;
  assign data_out[3] = N55;
  assign data_out[1] = N140;
  assign data_out[0] = N163;

  BUFX4 U1 ( .A(data_in[5]), .Y(n30) );
  INVX2 U2 ( .A(n25), .Y(n26) );
  NAND2X1 U3 ( .A(n8), .B(n142), .Y(n1) );
  NAND2X1 U4 ( .A(n31), .B(n33), .Y(n2) );
  AND2X2 U5 ( .A(n42), .B(n43), .Y(n3) );
  NOR2X1 U6 ( .A(n130), .B(n54), .Y(n4) );
  AND2X1 U7 ( .A(n115), .B(n42), .Y(n5) );
  AND2X1 U8 ( .A(n101), .B(n40), .Y(n6) );
  AND2X2 U9 ( .A(n20), .B(n89), .Y(n7) );
  AND2X2 U10 ( .A(n20), .B(n89), .Y(n8) );
  AND2X2 U11 ( .A(n31), .B(n89), .Y(n9) );
  INVX4 U12 ( .A(n30), .Y(n20) );
  INVX4 U13 ( .A(n115), .Y(n10) );
  INVX2 U14 ( .A(n39), .Y(n130) );
  INVX4 U15 ( .A(n38), .Y(n39) );
  INVX4 U16 ( .A(n39), .Y(n115) );
  AND2X2 U17 ( .A(n33), .B(n13), .Y(n11) );
  INVX2 U18 ( .A(n8), .Y(n34) );
  MUX2X1 U19 ( .B(n133), .A(n103), .S(n35), .Y(n59) );
  NOR2X1 U20 ( .A(n38), .B(n35), .Y(n28) );
  INVX4 U21 ( .A(n35), .Y(n37) );
  NAND2X1 U22 ( .A(n7), .B(n4), .Y(n12) );
  NAND2X1 U23 ( .A(n12), .B(n57), .Y(n58) );
  BUFX4 U24 ( .A(data_in[5]), .Y(n31) );
  NAND2X1 U25 ( .A(n100), .B(n6), .Y(n102) );
  INVX1 U26 ( .A(n98), .Y(n101) );
  INVX1 U27 ( .A(data_in[5]), .Y(n13) );
  BUFX2 U28 ( .A(n33), .Y(n14) );
  BUFX2 U29 ( .A(n142), .Y(n15) );
  AND2X2 U30 ( .A(n26), .B(n142), .Y(n16) );
  INVX2 U31 ( .A(n16), .Y(n114) );
  INVX1 U32 ( .A(n75), .Y(n76) );
  INVX1 U33 ( .A(n89), .Y(n17) );
  BUFX2 U34 ( .A(data_in[0]), .Y(n33) );
  AND2X2 U35 ( .A(n8), .B(n142), .Y(n18) );
  AND2X2 U36 ( .A(n44), .B(n131), .Y(n19) );
  INVX1 U37 ( .A(n143), .Y(n65) );
  INVX2 U38 ( .A(n2), .Y(n124) );
  NOR2X1 U39 ( .A(n131), .B(n29), .Y(n21) );
  NOR2X1 U40 ( .A(n21), .B(n87), .Y(n95) );
  INVX4 U41 ( .A(data_in[2]), .Y(n38) );
  INVX4 U42 ( .A(n38), .Y(n40) );
  INVX1 U43 ( .A(n14), .Y(n63) );
  AND2X2 U44 ( .A(n5), .B(n26), .Y(n22) );
  INVX2 U45 ( .A(n22), .Y(n133) );
  BUFX2 U46 ( .A(n9), .Y(n23) );
  AND2X2 U47 ( .A(n31), .B(n33), .Y(n24) );
  INVX8 U48 ( .A(n43), .Y(n44) );
  INVX4 U49 ( .A(data_in[4]), .Y(n43) );
  INVX8 U50 ( .A(n42), .Y(n131) );
  NAND2X1 U51 ( .A(n31), .B(n89), .Y(n25) );
  INVX4 U52 ( .A(data_in[1]), .Y(n35) );
  INVX8 U53 ( .A(n36), .Y(n142) );
  INVX8 U54 ( .A(n35), .Y(n36) );
  INVX2 U55 ( .A(n11), .Y(n27) );
  INVX1 U56 ( .A(n105), .Y(n87) );
  INVX1 U57 ( .A(n108), .Y(n112) );
  AND2X2 U58 ( .A(n20), .B(n89), .Y(n29) );
  INVX4 U59 ( .A(n32), .Y(n89) );
  INVX2 U60 ( .A(n123), .Y(n99) );
  INVX1 U61 ( .A(n138), .Y(n100) );
  INVX2 U62 ( .A(data_in[3]), .Y(n41) );
  BUFX2 U63 ( .A(data_in[0]), .Y(n32) );
  INVX8 U64 ( .A(n41), .Y(n42) );
  NAND2X1 U65 ( .A(n42), .B(n130), .Y(n137) );
  NAND2X1 U66 ( .A(n33), .B(n13), .Y(n123) );
  NAND2X1 U67 ( .A(n40), .B(n42), .Y(n147) );
  OAI22X1 U68 ( .A(n137), .B(n27), .C(n147), .D(n2), .Y(n45) );
  AOI22X1 U69 ( .A(n44), .B(n45), .C(n3), .D(n18), .Y(n62) );
  NAND3X1 U70 ( .A(n11), .B(n37), .C(n130), .Y(n46) );
  OAI21X1 U71 ( .A(n147), .B(n27), .C(n46), .Y(n50) );
  NAND2X1 U72 ( .A(n124), .B(n15), .Y(n48) );
  NAND3X1 U73 ( .A(n40), .B(n9), .C(n15), .Y(n47) );
  OAI21X1 U74 ( .A(n10), .B(n48), .C(n47), .Y(n49) );
  OAI21X1 U75 ( .A(n50), .B(n49), .C(n43), .Y(n61) );
  NAND2X1 U76 ( .A(n99), .B(n44), .Y(n52) );
  NAND3X1 U77 ( .A(n42), .B(n115), .C(n7), .Y(n51) );
  OAI21X1 U78 ( .A(n42), .B(n52), .C(n51), .Y(n53) );
  INVX2 U79 ( .A(n53), .Y(n103) );
  OAI21X1 U80 ( .A(n36), .B(n131), .C(n44), .Y(n54) );
  NAND2X1 U81 ( .A(n44), .B(n131), .Y(n143) );
  OAI22X1 U82 ( .A(n99), .B(n142), .C(n10), .D(n25), .Y(n56) );
  OAI21X1 U83 ( .A(n17), .B(n42), .C(n2), .Y(n55) );
  AOI22X1 U84 ( .A(n19), .B(n56), .C(n28), .D(n55), .Y(n57) );
  NOR2X1 U85 ( .A(n59), .B(n58), .Y(n60) );
  NAND3X1 U86 ( .A(n62), .B(n61), .C(n60), .Y(N163) );
  XOR2X1 U87 ( .A(n43), .B(n36), .Y(n121) );
  NOR3X1 U88 ( .A(n121), .B(n63), .C(n137), .Y(n69) );
  NAND2X1 U89 ( .A(n37), .B(n43), .Y(n64) );
  NAND3X1 U90 ( .A(n124), .B(n131), .C(n64), .Y(n67) );
  NAND3X1 U91 ( .A(n65), .B(n40), .C(n20), .Y(n66) );
  OAI21X1 U92 ( .A(n40), .B(n67), .C(n66), .Y(n68) );
  NOR2X1 U93 ( .A(n69), .B(n68), .Y(n85) );
  NAND2X1 U94 ( .A(n40), .B(n31), .Y(n70) );
  AOI22X1 U95 ( .A(n36), .B(n34), .C(n17), .D(n70), .Y(n72) );
  NAND2X1 U96 ( .A(n115), .B(n142), .Y(n75) );
  NOR3X1 U97 ( .A(n75), .B(n34), .C(n44), .Y(n71) );
  AOI21X1 U98 ( .A(n72), .B(n3), .C(n71), .Y(n84) );
  NAND2X1 U99 ( .A(n131), .B(n43), .Y(n90) );
  INVX2 U100 ( .A(n90), .Y(n82) );
  MUX2X1 U101 ( .B(n11), .A(n31), .S(n28), .Y(n74) );
  NAND2X1 U102 ( .A(n37), .B(n9), .Y(n73) );
  NAND2X1 U103 ( .A(n74), .B(n73), .Y(n81) );
  AOI22X1 U104 ( .A(n76), .B(n31), .C(n18), .D(n10), .Y(n79) );
  NAND2X1 U105 ( .A(n42), .B(n31), .Y(n132) );
  NAND2X1 U106 ( .A(n132), .B(n123), .Y(n77) );
  NAND2X1 U107 ( .A(n28), .B(n77), .Y(n78) );
  NAND3X1 U108 ( .A(n133), .B(n78), .C(n79), .Y(n80) );
  AOI22X1 U109 ( .A(n81), .B(n82), .C(n80), .D(n44), .Y(n83) );
  NAND3X1 U110 ( .A(n85), .B(n84), .C(n83), .Y(N140) );
  NAND3X1 U111 ( .A(n7), .B(n131), .C(n44), .Y(n86) );
  NAND2X1 U112 ( .A(n44), .B(n42), .Y(n98) );
  OAI22X1 U113 ( .A(n15), .B(n86), .C(n98), .D(n1), .Y(n97) );
  NAND2X1 U114 ( .A(n99), .B(n142), .Y(n105) );
  NOR2X1 U115 ( .A(n44), .B(n40), .Y(n88) );
  OAI21X1 U116 ( .A(n37), .B(n11), .C(n88), .Y(n94) );
  OAI21X1 U117 ( .A(n89), .B(n142), .C(n2), .Y(n92) );
  NOR2X1 U118 ( .A(n130), .B(n90), .Y(n91) );
  OAI21X1 U119 ( .A(n18), .B(n92), .C(n91), .Y(n93) );
  OAI21X1 U120 ( .A(n95), .B(n94), .C(n93), .Y(n96) );
  NOR2X1 U121 ( .A(n97), .B(n96), .Y(n120) );
  MUX2X1 U122 ( .B(n24), .A(n99), .S(n36), .Y(n138) );
  OAI21X1 U123 ( .A(n37), .B(n103), .C(n102), .Y(n104) );
  AOI21X1 U124 ( .A(n4), .B(n23), .C(n104), .Y(n119) );
  NAND2X1 U125 ( .A(n40), .B(n37), .Y(n145) );
  NAND2X1 U126 ( .A(n24), .B(n37), .Y(n108) );
  NAND2X1 U127 ( .A(n105), .B(n108), .Y(n106) );
  AOI21X1 U128 ( .A(n16), .B(n10), .C(n106), .Y(n107) );
  OAI21X1 U129 ( .A(n145), .B(n34), .C(n107), .Y(n117) );
  NAND2X1 U130 ( .A(n24), .B(n131), .Y(n110) );
  NAND3X1 U131 ( .A(n7), .B(n131), .C(n37), .Y(n109) );
  OAI21X1 U132 ( .A(n43), .B(n110), .C(n109), .Y(n111) );
  AOI21X1 U133 ( .A(n112), .B(n44), .C(n111), .Y(n113) );
  OAI21X1 U134 ( .A(n3), .B(n114), .C(n113), .Y(n116) );
  AOI22X1 U135 ( .A(n117), .B(n3), .C(n116), .D(n130), .Y(n118) );
  NAND3X1 U136 ( .A(n120), .B(n119), .C(n118), .Y(data_out[2]) );
  NOR3X1 U137 ( .A(n121), .B(n10), .C(n34), .Y(n129) );
  NAND3X1 U138 ( .A(n19), .B(n9), .C(n145), .Y(n122) );
  INVX2 U139 ( .A(n122), .Y(n128) );
  NAND3X1 U140 ( .A(n11), .B(n40), .C(n19), .Y(n126) );
  NAND3X1 U141 ( .A(n124), .B(n37), .C(n19), .Y(n125) );
  NAND2X1 U142 ( .A(n126), .B(n125), .Y(n127) );
  NOR3X1 U143 ( .A(n129), .B(n128), .C(n127), .Y(n152) );
  NOR2X1 U144 ( .A(n138), .B(n42), .Y(n141) );
  NAND3X1 U145 ( .A(n14), .B(n131), .C(n130), .Y(n136) );
  INVX2 U146 ( .A(n132), .Y(n134) );
  AOI21X1 U147 ( .A(n36), .B(n134), .C(n22), .Y(n135) );
  NAND3X1 U148 ( .A(n43), .B(n136), .C(n135), .Y(n140) );
  OAI21X1 U149 ( .A(n138), .B(n137), .C(n44), .Y(n139) );
  OAI21X1 U150 ( .A(n141), .B(n140), .C(n139), .Y(n151) );
  NOR2X1 U151 ( .A(n43), .B(n145), .Y(n149) );
  NAND2X1 U152 ( .A(n142), .B(n20), .Y(n146) );
  NAND2X1 U153 ( .A(n9), .B(n143), .Y(n144) );
  OAI22X1 U154 ( .A(n147), .B(n146), .C(n145), .D(n144), .Y(n148) );
  AOI21X1 U155 ( .A(n29), .B(n149), .C(n148), .Y(n150) );
  NAND3X1 U156 ( .A(n150), .B(n151), .C(n152), .Y(N55) );
endmodule


module Sbox6_2 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N59, N101, N137, N164, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173;
  assign data_out[3] = N59;
  assign data_out[2] = N101;
  assign data_out[1] = N137;
  assign data_out[0] = N164;

  INVX4 U1 ( .A(data_in[4]), .Y(n57) );
  INVX1 U2 ( .A(n51), .Y(n1) );
  INVX1 U3 ( .A(n17), .Y(n2) );
  INVX2 U4 ( .A(n15), .Y(n17) );
  BUFX2 U5 ( .A(n34), .Y(n3) );
  INVX1 U6 ( .A(n139), .Y(n4) );
  INVX4 U7 ( .A(n57), .Y(n59) );
  AND2X1 U8 ( .A(n9), .B(n152), .Y(n5) );
  INVX1 U9 ( .A(n59), .Y(n9) );
  BUFX4 U10 ( .A(data_in[5]), .Y(n6) );
  MUX2X1 U11 ( .B(n20), .A(n49), .S(n10), .Y(n151) );
  INVX4 U12 ( .A(n144), .Y(n12) );
  INVX4 U13 ( .A(n152), .Y(n7) );
  INVX4 U14 ( .A(n7), .Y(n8) );
  INVX1 U15 ( .A(data_in[2]), .Y(n10) );
  INVX2 U16 ( .A(data_in[2]), .Y(n55) );
  BUFX2 U17 ( .A(data_in[0]), .Y(n50) );
  INVX2 U18 ( .A(n55), .Y(n11) );
  INVX2 U19 ( .A(n55), .Y(n56) );
  INVX1 U20 ( .A(n96), .Y(n65) );
  INVX4 U21 ( .A(n14), .Y(n39) );
  INVX4 U22 ( .A(n57), .Y(n58) );
  BUFX2 U23 ( .A(n51), .Y(n13) );
  INVX1 U24 ( .A(n159), .Y(n161) );
  AND2X2 U25 ( .A(n6), .B(n34), .Y(n14) );
  INVX2 U26 ( .A(n48), .Y(n25) );
  INVX2 U27 ( .A(n11), .Y(n15) );
  INVX2 U28 ( .A(n56), .Y(n16) );
  INVX1 U29 ( .A(n11), .Y(n141) );
  NOR2X1 U30 ( .A(n50), .B(n6), .Y(n38) );
  INVX1 U31 ( .A(n6), .Y(n18) );
  AND2X2 U32 ( .A(n56), .B(data_in[3]), .Y(n19) );
  AND2X2 U33 ( .A(n34), .B(n51), .Y(n20) );
  INVX2 U34 ( .A(n20), .Y(n117) );
  BUFX2 U35 ( .A(n11), .Y(n36) );
  AND2X2 U36 ( .A(n6), .B(n34), .Y(n21) );
  AND2X2 U37 ( .A(n1), .B(n34), .Y(n22) );
  INVX1 U38 ( .A(n15), .Y(n23) );
  INVX2 U39 ( .A(data_in[5]), .Y(n51) );
  NOR2X1 U40 ( .A(n34), .B(n6), .Y(n40) );
  INVX1 U41 ( .A(n34), .Y(n35) );
  NOR2X1 U42 ( .A(n24), .B(n25), .Y(n26) );
  NOR2X1 U43 ( .A(n26), .B(n79), .Y(n88) );
  INVX1 U44 ( .A(n29), .Y(n24) );
  INVX2 U45 ( .A(n81), .Y(n43) );
  INVX4 U46 ( .A(n19), .Y(n27) );
  AND2X2 U47 ( .A(data_in[3]), .B(n141), .Y(n47) );
  BUFX2 U48 ( .A(n51), .Y(n28) );
  INVX2 U49 ( .A(n28), .Y(n29) );
  BUFX2 U50 ( .A(n142), .Y(n30) );
  BUFX4 U51 ( .A(data_in[3]), .Y(n31) );
  BUFX2 U52 ( .A(n46), .Y(n32) );
  AND2X2 U53 ( .A(n6), .B(n50), .Y(n33) );
  INVX2 U54 ( .A(data_in[0]), .Y(n34) );
  AND2X2 U55 ( .A(n15), .B(n144), .Y(n45) );
  INVX8 U56 ( .A(n59), .Y(n144) );
  INVX1 U57 ( .A(n162), .Y(n37) );
  INVX1 U58 ( .A(n130), .Y(n64) );
  INVX1 U59 ( .A(n151), .Y(n153) );
  INVX2 U60 ( .A(n40), .Y(n154) );
  AND2X2 U61 ( .A(n50), .B(n51), .Y(n49) );
  BUFX2 U62 ( .A(n3), .Y(n41) );
  INVX2 U63 ( .A(n27), .Y(n165) );
  OR2X2 U64 ( .A(n139), .B(n27), .Y(n80) );
  INVX4 U65 ( .A(n129), .Y(n164) );
  NAND2X1 U66 ( .A(n42), .B(n43), .Y(n44) );
  NAND2X1 U67 ( .A(n44), .B(n73), .Y(n74) );
  INVX1 U68 ( .A(n58), .Y(n42) );
  AND2X2 U69 ( .A(n5), .B(n21), .Y(n142) );
  INVX4 U70 ( .A(data_in[3]), .Y(n152) );
  AND2X2 U71 ( .A(data_in[3]), .B(n59), .Y(n46) );
  INVX4 U72 ( .A(n54), .Y(n155) );
  XNOR2X1 U73 ( .A(n16), .B(n54), .Y(n48) );
  INVX2 U74 ( .A(data_in[1]), .Y(n53) );
  NAND2X1 U75 ( .A(n22), .B(n16), .Y(n52) );
  INVX8 U76 ( .A(n53), .Y(n54) );
  NAND2X1 U77 ( .A(n31), .B(n35), .Y(n60) );
  NAND2X1 U78 ( .A(n21), .B(n15), .Y(n70) );
  MUX2X1 U79 ( .B(n60), .A(n52), .S(n12), .Y(n63) );
  NAND2X1 U80 ( .A(n58), .B(n152), .Y(n106) );
  NAND2X1 U81 ( .A(n6), .B(n50), .Y(n139) );
  OAI21X1 U82 ( .A(n45), .B(n155), .C(n4), .Y(n61) );
  AOI21X1 U83 ( .A(n106), .B(n155), .C(n61), .Y(n62) );
  AOI21X1 U84 ( .A(n63), .B(n155), .C(n62), .Y(n78) );
  NAND2X1 U85 ( .A(n58), .B(n18), .Y(n96) );
  NAND2X1 U86 ( .A(n34), .B(n51), .Y(n162) );
  MUX2X1 U87 ( .B(n40), .A(n38), .S(n58), .Y(n130) );
  AOI22X1 U88 ( .A(n65), .B(n48), .C(n165), .D(n64), .Y(n77) );
  OAI22X1 U89 ( .A(n36), .B(n29), .C(n58), .D(n162), .Y(n66) );
  NAND2X1 U90 ( .A(n66), .B(n8), .Y(n69) );
  NAND3X1 U91 ( .A(n152), .B(n144), .C(n22), .Y(n103) );
  NAND2X1 U92 ( .A(n144), .B(n47), .Y(n92) );
  NOR2X1 U93 ( .A(n54), .B(n92), .Y(n67) );
  AOI22X1 U94 ( .A(n142), .B(n155), .C(n67), .D(n28), .Y(n68) );
  OAI21X1 U95 ( .A(n155), .B(n69), .C(n68), .Y(n75) );
  NAND3X1 U96 ( .A(n36), .B(n54), .C(n21), .Y(n81) );
  OAI21X1 U97 ( .A(n54), .B(n39), .C(n70), .Y(n72) );
  NAND3X1 U98 ( .A(n36), .B(n54), .C(n33), .Y(n148) );
  INVX2 U99 ( .A(n148), .Y(n71) );
  AOI22X1 U100 ( .A(n46), .B(n72), .C(n71), .D(n12), .Y(n73) );
  NOR2X1 U101 ( .A(n75), .B(n74), .Y(n76) );
  NAND3X1 U102 ( .A(n78), .B(n77), .C(n76), .Y(N164) );
  NAND3X1 U103 ( .A(n144), .B(n151), .C(n80), .Y(n79) );
  INVX2 U104 ( .A(n80), .Y(n82) );
  OAI22X1 U105 ( .A(n82), .B(n8), .C(n43), .D(n42), .Y(n87) );
  NAND2X1 U106 ( .A(n10), .B(data_in[3]), .Y(n129) );
  OAI21X1 U107 ( .A(n17), .B(n144), .C(n155), .Y(n83) );
  NAND2X1 U108 ( .A(n38), .B(n83), .Y(n84) );
  OAI21X1 U109 ( .A(n39), .B(n16), .C(n84), .Y(n85) );
  OAI21X1 U110 ( .A(n164), .B(n32), .C(n85), .Y(n86) );
  OAI21X1 U111 ( .A(n88), .B(n87), .C(n86), .Y(n102) );
  NAND2X1 U112 ( .A(n40), .B(n58), .Y(n91) );
  OAI21X1 U113 ( .A(n31), .B(n13), .C(n139), .Y(n89) );
  NAND3X1 U114 ( .A(n58), .B(n15), .C(n89), .Y(n90) );
  OAI21X1 U115 ( .A(n27), .B(n91), .C(n90), .Y(n94) );
  OAI22X1 U116 ( .A(n151), .B(n46), .C(n39), .D(n92), .Y(n93) );
  NOR2X1 U117 ( .A(n94), .B(n93), .Y(n100) );
  NAND3X1 U118 ( .A(n12), .B(n152), .C(n33), .Y(n95) );
  OAI21X1 U119 ( .A(n39), .B(n27), .C(n95), .Y(n98) );
  NAND3X1 U120 ( .A(n49), .B(n23), .C(n152), .Y(n159) );
  OAI21X1 U121 ( .A(n129), .B(n96), .C(n159), .Y(n97) );
  NOR2X1 U122 ( .A(n98), .B(n97), .Y(n99) );
  MUX2X1 U123 ( .B(n100), .A(n99), .S(n54), .Y(n101) );
  OR2X2 U124 ( .A(n102), .B(n101), .Y(N137) );
  NOR2X1 U125 ( .A(n8), .B(n154), .Y(n105) );
  NAND2X1 U126 ( .A(n33), .B(n58), .Y(n114) );
  OAI21X1 U127 ( .A(n164), .B(n114), .C(n103), .Y(n104) );
  AOI21X1 U128 ( .A(n105), .B(n144), .C(n104), .Y(n113) );
  INVX2 U129 ( .A(n106), .Y(n160) );
  NAND2X1 U130 ( .A(n49), .B(n36), .Y(n110) );
  NAND2X1 U131 ( .A(n58), .B(n152), .Y(n109) );
  NOR2X1 U132 ( .A(n31), .B(n16), .Y(n107) );
  OAI21X1 U133 ( .A(n33), .B(n38), .C(n107), .Y(n108) );
  OAI21X1 U134 ( .A(n110), .B(n109), .C(n108), .Y(n111) );
  AOI21X1 U135 ( .A(n160), .B(n37), .C(n111), .Y(n112) );
  AND2X2 U136 ( .A(n113), .B(n112), .Y(n138) );
  INVX2 U137 ( .A(n114), .Y(n116) );
  OAI21X1 U138 ( .A(n12), .B(n18), .C(n162), .Y(n115) );
  AOI22X1 U139 ( .A(n164), .B(n116), .C(n165), .D(n115), .Y(n123) );
  NAND2X1 U140 ( .A(n16), .B(n152), .Y(n120) );
  OAI21X1 U141 ( .A(n3), .B(n13), .C(n117), .Y(n118) );
  NAND2X1 U142 ( .A(n118), .B(n144), .Y(n119) );
  OAI21X1 U143 ( .A(n120), .B(n119), .C(n159), .Y(n121) );
  AOI21X1 U144 ( .A(n22), .B(n160), .C(n121), .Y(n122) );
  NAND2X1 U145 ( .A(n123), .B(n122), .Y(n136) );
  MUX2X1 U146 ( .B(n160), .A(n45), .S(n54), .Y(n134) );
  NAND2X1 U147 ( .A(n54), .B(n35), .Y(n127) );
  NAND2X1 U148 ( .A(n47), .B(n144), .Y(n126) );
  NOR2X1 U149 ( .A(n58), .B(n31), .Y(n124) );
  NAND3X1 U150 ( .A(n36), .B(n21), .C(n124), .Y(n125) );
  OAI21X1 U151 ( .A(n127), .B(n126), .C(n125), .Y(n132) );
  NAND3X1 U152 ( .A(n22), .B(n54), .C(n46), .Y(n128) );
  OAI21X1 U153 ( .A(n130), .B(n129), .C(n128), .Y(n131) );
  NOR2X1 U154 ( .A(n132), .B(n131), .Y(n133) );
  OAI21X1 U155 ( .A(n134), .B(n154), .C(n133), .Y(n135) );
  AOI21X1 U156 ( .A(n155), .B(n136), .C(n135), .Y(n137) );
  OAI21X1 U157 ( .A(n138), .B(n155), .C(n137), .Y(N101) );
  OAI21X1 U158 ( .A(n162), .B(n155), .C(n139), .Y(n140) );
  INVX2 U159 ( .A(n140), .Y(n145) );
  NOR2X1 U160 ( .A(n17), .B(n145), .Y(n143) );
  AOI22X1 U161 ( .A(n160), .B(n143), .C(n30), .D(n2), .Y(n173) );
  NAND2X1 U162 ( .A(n144), .B(n155), .Y(n146) );
  OAI21X1 U163 ( .A(n41), .B(n146), .C(n145), .Y(n150) );
  AOI22X1 U164 ( .A(n4), .B(n31), .C(n8), .D(n41), .Y(n147) );
  OAI22X1 U165 ( .A(n12), .B(n148), .C(n147), .D(n146), .Y(n149) );
  AOI21X1 U166 ( .A(n165), .B(n150), .C(n149), .Y(n172) );
  NAND2X1 U167 ( .A(n153), .B(n8), .Y(n158) );
  NOR2X1 U168 ( .A(n155), .B(n154), .Y(n156) );
  OAI21X1 U169 ( .A(n164), .B(n46), .C(n156), .Y(n157) );
  OAI21X1 U170 ( .A(n12), .B(n158), .C(n157), .Y(n170) );
  AOI22X1 U171 ( .A(n161), .B(n12), .C(n160), .D(n43), .Y(n168) );
  NOR2X1 U172 ( .A(n54), .B(n18), .Y(n166) );
  MUX2X1 U173 ( .B(n162), .A(n39), .S(n54), .Y(n163) );
  AOI22X1 U174 ( .A(n166), .B(n165), .C(n164), .D(n163), .Y(n167) );
  NAND2X1 U175 ( .A(n167), .B(n168), .Y(n169) );
  NOR2X1 U176 ( .A(n170), .B(n169), .Y(n171) );
  NAND3X1 U177 ( .A(n173), .B(n172), .C(n171), .Y(N59) );
endmodule


module Sbox7_2 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N61, N96, N131, N161, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150;
  assign data_out[3] = N61;
  assign data_out[2] = N96;
  assign data_out[1] = N131;
  assign data_out[0] = N161;

  INVX2 U1 ( .A(n86), .Y(n87) );
  INVX4 U2 ( .A(n107), .Y(n135) );
  INVX4 U3 ( .A(n17), .Y(n107) );
  INVX1 U4 ( .A(n56), .Y(n1) );
  INVX2 U5 ( .A(n6), .Y(n56) );
  NAND2X1 U6 ( .A(n41), .B(n140), .Y(n2) );
  INVX4 U7 ( .A(n2), .Y(n40) );
  INVX2 U8 ( .A(n40), .Y(n16) );
  BUFX2 U9 ( .A(n115), .Y(n3) );
  BUFX2 U10 ( .A(n41), .Y(n4) );
  INVX2 U11 ( .A(data_in[5]), .Y(n41) );
  AND2X2 U12 ( .A(data_in[0]), .B(data_in[5]), .Y(n17) );
  AND2X2 U13 ( .A(n36), .B(n53), .Y(n5) );
  NAND2X1 U14 ( .A(data_in[0]), .B(n41), .Y(n6) );
  AND2X2 U15 ( .A(n44), .B(n40), .Y(n7) );
  INVX2 U16 ( .A(data_in[2]), .Y(n15) );
  AND2X2 U17 ( .A(n51), .B(n25), .Y(n8) );
  INVX2 U18 ( .A(n49), .Y(n25) );
  NAND2X1 U19 ( .A(n53), .B(n96), .Y(n9) );
  NAND2X1 U20 ( .A(n10), .B(n7), .Y(n11) );
  NAND2X1 U21 ( .A(n11), .B(n82), .Y(n85) );
  INVX1 U22 ( .A(n145), .Y(n10) );
  INVX4 U23 ( .A(n55), .Y(n145) );
  AND2X1 U24 ( .A(n138), .B(n137), .Y(n144) );
  NAND2X1 U25 ( .A(n53), .B(n50), .Y(n12) );
  BUFX4 U26 ( .A(n52), .Y(n13) );
  INVX2 U27 ( .A(data_in[1]), .Y(n52) );
  INVX4 U28 ( .A(n52), .Y(n53) );
  INVX1 U29 ( .A(n105), .Y(n92) );
  INVX1 U30 ( .A(data_in[2]), .Y(n14) );
  OR2X1 U31 ( .A(n53), .B(n41), .Y(n33) );
  AND2X2 U32 ( .A(n53), .B(n25), .Y(n21) );
  BUFX2 U33 ( .A(n140), .Y(n32) );
  NAND2X1 U34 ( .A(n26), .B(n91), .Y(n18) );
  NAND2X1 U35 ( .A(n50), .B(n96), .Y(n19) );
  NAND2X1 U36 ( .A(n6), .B(n95), .Y(n20) );
  INVX1 U37 ( .A(n137), .Y(n109) );
  NAND2X1 U38 ( .A(n51), .B(n25), .Y(n22) );
  AND2X2 U39 ( .A(n96), .B(n53), .Y(n23) );
  AND2X2 U40 ( .A(n47), .B(n140), .Y(n24) );
  INVX4 U41 ( .A(n15), .Y(n49) );
  AND2X2 U42 ( .A(n13), .B(n96), .Y(n26) );
  INVX1 U43 ( .A(n63), .Y(n27) );
  INVX1 U44 ( .A(n140), .Y(n28) );
  AND2X1 U45 ( .A(n49), .B(n51), .Y(n29) );
  NAND2X1 U46 ( .A(n49), .B(n13), .Y(n30) );
  INVX2 U47 ( .A(n30), .Y(n39) );
  BUFX2 U48 ( .A(n47), .Y(n31) );
  BUFX2 U49 ( .A(data_in[5]), .Y(n47) );
  INVX2 U50 ( .A(data_in[0]), .Y(n140) );
  NAND2X1 U51 ( .A(n33), .B(n63), .Y(n64) );
  BUFX2 U52 ( .A(n51), .Y(n34) );
  INVX1 U53 ( .A(n26), .Y(n35) );
  AND2X2 U54 ( .A(n50), .B(n96), .Y(n36) );
  NAND2X1 U55 ( .A(n37), .B(n5), .Y(n38) );
  NAND2X1 U56 ( .A(n83), .B(n38), .Y(n84) );
  INVX1 U57 ( .A(n16), .Y(n37) );
  BUFX4 U58 ( .A(data_in[3]), .Y(n51) );
  INVX4 U59 ( .A(n48), .Y(n91) );
  AND2X2 U60 ( .A(n51), .B(n13), .Y(n42) );
  AND2X2 U61 ( .A(n51), .B(n49), .Y(n43) );
  AND2X2 U62 ( .A(n29), .B(n13), .Y(n44) );
  AND2X2 U63 ( .A(n24), .B(n96), .Y(n45) );
  AND2X2 U64 ( .A(n55), .B(n135), .Y(n46) );
  INVX4 U65 ( .A(data_in[4]), .Y(n54) );
  INVX2 U66 ( .A(n14), .Y(n48) );
  INVX2 U67 ( .A(n15), .Y(n50) );
  INVX8 U68 ( .A(n54), .Y(n55) );
  INVX2 U69 ( .A(data_in[3]), .Y(n96) );
  NAND2X1 U70 ( .A(n36), .B(n56), .Y(n58) );
  NAND2X1 U71 ( .A(n47), .B(n140), .Y(n95) );
  NAND2X1 U72 ( .A(n6), .B(n95), .Y(n122) );
  NAND3X1 U73 ( .A(n17), .B(n96), .C(n91), .Y(n86) );
  AOI21X1 U74 ( .A(n8), .B(n20), .C(n87), .Y(n57) );
  MUX2X1 U75 ( .B(n58), .A(n57), .S(n53), .Y(n68) );
  INVX2 U76 ( .A(n122), .Y(n63) );
  NOR2X1 U77 ( .A(n55), .B(n53), .Y(n60) );
  NOR2X1 U78 ( .A(n13), .B(n145), .Y(n59) );
  AOI22X1 U79 ( .A(n22), .B(n60), .C(n59), .D(n91), .Y(n62) );
  NAND3X1 U80 ( .A(n31), .B(n44), .C(n55), .Y(n61) );
  OAI21X1 U81 ( .A(n63), .B(n62), .C(n61), .Y(n67) );
  NOR2X1 U82 ( .A(n55), .B(n19), .Y(n65) );
  AND2X2 U83 ( .A(n65), .B(n64), .Y(n66) );
  NOR3X1 U84 ( .A(n68), .B(n67), .C(n66), .Y(n78) );
  OAI21X1 U85 ( .A(n55), .B(n107), .C(n16), .Y(n70) );
  NAND2X1 U86 ( .A(n53), .B(n51), .Y(n105) );
  NAND2X1 U87 ( .A(n92), .B(n49), .Y(n94) );
  NAND3X1 U88 ( .A(n51), .B(n13), .C(n91), .Y(n139) );
  NAND2X1 U89 ( .A(n94), .B(n139), .Y(n69) );
  NAND2X1 U90 ( .A(n70), .B(n69), .Y(n77) );
  NOR2X1 U91 ( .A(n34), .B(n39), .Y(n75) );
  NAND3X1 U92 ( .A(n145), .B(n40), .C(n91), .Y(n73) );
  NAND2X1 U93 ( .A(n53), .B(n50), .Y(n128) );
  NAND2X1 U94 ( .A(n13), .B(n96), .Y(n104) );
  NAND2X1 U95 ( .A(n128), .B(n35), .Y(n71) );
  NAND3X1 U96 ( .A(n55), .B(n40), .C(n71), .Y(n72) );
  OAI21X1 U97 ( .A(n9), .B(n73), .C(n72), .Y(n74) );
  AOI21X1 U98 ( .A(n75), .B(n46), .C(n74), .Y(n76) );
  NAND3X1 U99 ( .A(n77), .B(n76), .C(n78), .Y(N161) );
  NAND2X1 U100 ( .A(n51), .B(n21), .Y(n120) );
  NAND2X1 U101 ( .A(n26), .B(n91), .Y(n121) );
  NAND2X1 U102 ( .A(n120), .B(n121), .Y(n81) );
  NOR2X1 U103 ( .A(n55), .B(n23), .Y(n79) );
  AOI21X1 U104 ( .A(n79), .B(n139), .C(n16), .Y(n80) );
  OAI21X1 U105 ( .A(n145), .B(n81), .C(n80), .Y(n82) );
  OAI21X1 U106 ( .A(n42), .B(n5), .C(n46), .Y(n83) );
  NOR2X1 U107 ( .A(n85), .B(n84), .Y(n103) );
  NOR2X1 U108 ( .A(n55), .B(n87), .Y(n88) );
  OAI21X1 U109 ( .A(n6), .B(n12), .C(n88), .Y(n101) );
  OAI21X1 U110 ( .A(n39), .B(n92), .C(n24), .Y(n90) );
  MUX2X1 U111 ( .B(n36), .A(n43), .S(n31), .Y(n89) );
  NAND2X1 U112 ( .A(n90), .B(n89), .Y(n100) );
  OAI21X1 U113 ( .A(n92), .B(n91), .C(n56), .Y(n93) );
  OAI21X1 U114 ( .A(n95), .B(n94), .C(n93), .Y(n99) );
  AOI22X1 U115 ( .A(n12), .B(n45), .C(n8), .D(n28), .Y(n97) );
  NAND2X1 U116 ( .A(n97), .B(n55), .Y(n98) );
  OAI22X1 U117 ( .A(n101), .B(n100), .C(n99), .D(n98), .Y(n102) );
  NAND2X1 U118 ( .A(n102), .B(n103), .Y(N131) );
  NAND2X1 U119 ( .A(n105), .B(n104), .Y(n115) );
  NAND2X1 U120 ( .A(n115), .B(n56), .Y(n137) );
  AOI21X1 U121 ( .A(n42), .B(n40), .C(n145), .Y(n106) );
  OAI21X1 U122 ( .A(n107), .B(n139), .C(n106), .Y(n108) );
  NOR2X1 U123 ( .A(n109), .B(n108), .Y(n119) );
  OAI22X1 U124 ( .A(n50), .B(n13), .C(n53), .D(n19), .Y(n127) );
  OAI21X1 U125 ( .A(n40), .B(n135), .C(n23), .Y(n138) );
  OAI21X1 U126 ( .A(n32), .B(n12), .C(n138), .Y(n110) );
  AOI21X1 U127 ( .A(n24), .B(n127), .C(n110), .Y(n118) );
  INVX2 U128 ( .A(n128), .Y(n142) );
  NAND2X1 U129 ( .A(n13), .B(n4), .Y(n111) );
  OAI21X1 U130 ( .A(n50), .B(n111), .C(n145), .Y(n112) );
  AOI21X1 U131 ( .A(n142), .B(n32), .C(n112), .Y(n114) );
  OAI21X1 U132 ( .A(n23), .B(n42), .C(n24), .Y(n113) );
  AND2X2 U133 ( .A(n114), .B(n113), .Y(n117) );
  AOI22X1 U134 ( .A(n5), .B(n4), .C(n135), .D(n3), .Y(n116) );
  AOI22X1 U135 ( .A(n119), .B(n118), .C(n116), .D(n117), .Y(N96) );
  AOI21X1 U136 ( .A(n18), .B(n120), .C(n1), .Y(n126) );
  NAND2X1 U137 ( .A(n45), .B(n30), .Y(n124) );
  NAND3X1 U138 ( .A(n34), .B(n27), .C(n39), .Y(n123) );
  NAND2X1 U139 ( .A(n124), .B(n123), .Y(n125) );
  NOR2X1 U140 ( .A(n126), .B(n125), .Y(n150) );
  INVX2 U141 ( .A(n55), .Y(n134) );
  NAND2X1 U142 ( .A(n40), .B(n127), .Y(n132) );
  OAI21X1 U143 ( .A(n53), .B(n49), .C(n128), .Y(n129) );
  NAND2X1 U144 ( .A(n135), .B(n129), .Y(n131) );
  NAND3X1 U145 ( .A(n28), .B(n36), .C(n53), .Y(n130) );
  NAND3X1 U146 ( .A(n132), .B(n131), .C(n130), .Y(n133) );
  NOR2X1 U147 ( .A(n134), .B(n133), .Y(n149) );
  AOI22X1 U148 ( .A(n135), .B(n39), .C(n43), .D(n40), .Y(n136) );
  OAI21X1 U149 ( .A(n4), .B(n19), .C(n136), .Y(n147) );
  INVX2 U150 ( .A(n139), .Y(n141) );
  OAI21X1 U151 ( .A(n142), .B(n141), .C(n32), .Y(n143) );
  NAND3X1 U152 ( .A(n145), .B(n143), .C(n144), .Y(n146) );
  NOR2X1 U153 ( .A(n147), .B(n146), .Y(n148) );
  AOI21X1 U154 ( .A(n150), .B(n149), .C(n148), .Y(N61) );
endmodule


module Sbox8_2 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N59, N98, N129, N162, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143;
  assign data_out[3] = N59;
  assign data_out[2] = N98;
  assign data_out[1] = N129;
  assign data_out[0] = N162;

  BUFX4 U1 ( .A(n39), .Y(n1) );
  INVX4 U2 ( .A(n38), .Y(n39) );
  BUFX4 U3 ( .A(n43), .Y(n2) );
  BUFX4 U4 ( .A(n111), .Y(n3) );
  BUFX2 U5 ( .A(n29), .Y(n4) );
  INVX4 U6 ( .A(n106), .Y(n123) );
  INVX4 U7 ( .A(n42), .Y(n43) );
  BUFX2 U8 ( .A(n106), .Y(n5) );
  INVX4 U9 ( .A(data_in[3]), .Y(n42) );
  BUFX2 U10 ( .A(n134), .Y(n6) );
  NAND2X1 U11 ( .A(n28), .B(n45), .Y(n7) );
  INVX4 U12 ( .A(data_in[4]), .Y(n44) );
  INVX8 U13 ( .A(n44), .Y(n45) );
  INVX4 U14 ( .A(n45), .Y(n122) );
  INVX4 U15 ( .A(n39), .Y(n119) );
  INVX2 U16 ( .A(n86), .Y(n116) );
  NOR2X1 U17 ( .A(n42), .B(n41), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n134) );
  INVX2 U19 ( .A(n102), .Y(n9) );
  INVX4 U20 ( .A(n19), .Y(n106) );
  INVX1 U21 ( .A(n132), .Y(n77) );
  BUFX2 U22 ( .A(n28), .Y(n10) );
  AND2X1 U23 ( .A(n141), .B(n140), .Y(n142) );
  AND2X2 U24 ( .A(n76), .B(n47), .Y(n11) );
  INVX4 U25 ( .A(n11), .Y(n88) );
  INVX2 U26 ( .A(n88), .Y(n23) );
  INVX4 U27 ( .A(n41), .Y(n111) );
  BUFX2 U28 ( .A(n31), .Y(n12) );
  NAND2X1 U29 ( .A(n29), .B(n76), .Y(n13) );
  NAND2X1 U30 ( .A(n29), .B(n76), .Y(n14) );
  NAND2X1 U31 ( .A(n40), .B(n44), .Y(n120) );
  INVX2 U32 ( .A(n116), .Y(n15) );
  INVX1 U33 ( .A(n7), .Y(n51) );
  BUFX2 U34 ( .A(n45), .Y(n16) );
  INVX1 U35 ( .A(n31), .Y(n109) );
  INVX1 U36 ( .A(n42), .Y(n17) );
  INVX1 U37 ( .A(data_in[0]), .Y(n47) );
  INVX4 U38 ( .A(n35), .Y(n18) );
  INVX2 U39 ( .A(n35), .Y(n37) );
  AND2X2 U40 ( .A(data_in[5]), .B(n29), .Y(n19) );
  INVX4 U41 ( .A(data_in[2]), .Y(n38) );
  AND2X2 U42 ( .A(n45), .B(n111), .Y(n20) );
  BUFX4 U43 ( .A(n43), .Y(n21) );
  INVX1 U44 ( .A(n89), .Y(n22) );
  NAND2X1 U45 ( .A(n23), .B(n24), .Y(n25) );
  NAND2X1 U46 ( .A(n25), .B(n107), .Y(n48) );
  INVX1 U47 ( .A(n18), .Y(n24) );
  INVX2 U48 ( .A(n120), .Y(n26) );
  INVX4 U49 ( .A(n26), .Y(n27) );
  INVX1 U50 ( .A(n18), .Y(n101) );
  INVX4 U51 ( .A(n40), .Y(n28) );
  INVX4 U52 ( .A(n40), .Y(n41) );
  INVX4 U53 ( .A(data_in[1]), .Y(n40) );
  BUFX4 U54 ( .A(data_in[0]), .Y(n29) );
  AND2X2 U55 ( .A(n31), .B(n47), .Y(n30) );
  INVX2 U56 ( .A(n30), .Y(n107) );
  INVX1 U57 ( .A(data_in[5]), .Y(n102) );
  INVX4 U58 ( .A(data_in[5]), .Y(n76) );
  INVX1 U59 ( .A(n133), .Y(n138) );
  AND2X2 U60 ( .A(n43), .B(n38), .Y(n31) );
  AND2X2 U61 ( .A(n39), .B(n42), .Y(n35) );
  AND2X2 U62 ( .A(n29), .B(n76), .Y(n32) );
  AND2X2 U63 ( .A(n28), .B(n44), .Y(n36) );
  AND2X2 U64 ( .A(n135), .B(n37), .Y(n33) );
  AND2X2 U65 ( .A(n45), .B(n111), .Y(n34) );
  NAND2X1 U66 ( .A(n39), .B(n43), .Y(n86) );
  OAI22X1 U67 ( .A(n20), .B(n88), .C(n10), .D(n14), .Y(n46) );
  NAND2X1 U68 ( .A(data_in[5]), .B(n47), .Y(n133) );
  INVX2 U69 ( .A(n133), .Y(n112) );
  OAI22X1 U70 ( .A(n3), .B(n37), .C(n1), .D(n27), .Y(n85) );
  AOI22X1 U71 ( .A(n46), .B(n116), .C(n22), .D(n138), .Y(n62) );
  MUX2X1 U72 ( .B(n106), .A(n133), .S(n21), .Y(n49) );
  OAI21X1 U73 ( .A(n49), .B(n48), .C(n20), .Y(n61) );
  OAI21X1 U74 ( .A(n1), .B(n9), .C(n13), .Y(n50) );
  NAND2X1 U75 ( .A(n28), .B(n45), .Y(n90) );
  NAND2X1 U76 ( .A(n120), .B(n90), .Y(n110) );
  NAND2X1 U77 ( .A(n50), .B(n110), .Y(n53) );
  NAND2X1 U78 ( .A(n51), .B(n123), .Y(n52) );
  MUX2X1 U79 ( .B(n53), .A(n52), .S(n2), .Y(n59) );
  NAND2X1 U80 ( .A(n9), .B(n45), .Y(n57) );
  MUX2X1 U81 ( .B(n76), .A(n88), .S(n2), .Y(n55) );
  MUX2X1 U82 ( .B(n13), .A(n106), .S(n39), .Y(n54) );
  OAI21X1 U83 ( .A(n54), .B(n55), .C(n36), .Y(n56) );
  OAI21X1 U84 ( .A(n109), .B(n57), .C(n56), .Y(n58) );
  NOR2X1 U85 ( .A(n59), .B(n58), .Y(n60) );
  NAND3X1 U86 ( .A(n61), .B(n62), .C(n60), .Y(N162) );
  NOR2X1 U87 ( .A(n4), .B(n18), .Y(n64) );
  OAI22X1 U88 ( .A(n1), .B(n106), .C(n17), .D(n88), .Y(n63) );
  OAI21X1 U89 ( .A(n64), .B(n63), .C(n20), .Y(n81) );
  NAND3X1 U90 ( .A(n10), .B(n12), .C(n4), .Y(n65) );
  INVX2 U91 ( .A(n65), .Y(n75) );
  NAND2X1 U92 ( .A(n38), .B(n42), .Y(n121) );
  NAND2X1 U93 ( .A(n86), .B(n121), .Y(n103) );
  NAND2X1 U94 ( .A(n112), .B(n103), .Y(n68) );
  OAI21X1 U95 ( .A(n28), .B(n2), .C(n18), .Y(n66) );
  NAND2X1 U96 ( .A(n123), .B(n66), .Y(n67) );
  NAND3X1 U97 ( .A(n68), .B(n67), .C(n122), .Y(n74) );
  NAND2X1 U98 ( .A(n28), .B(n119), .Y(n69) );
  AOI21X1 U99 ( .A(n69), .B(n109), .C(n133), .Y(n73) );
  NAND3X1 U100 ( .A(n10), .B(n17), .C(n32), .Y(n71) );
  NAND2X1 U101 ( .A(n123), .B(n116), .Y(n70) );
  NAND3X1 U102 ( .A(n16), .B(n71), .C(n70), .Y(n72) );
  OAI22X1 U103 ( .A(n75), .B(n74), .C(n73), .D(n72), .Y(n80) );
  NAND2X1 U104 ( .A(n39), .B(n28), .Y(n135) );
  MUX2X1 U105 ( .B(n6), .A(n33), .S(n16), .Y(n78) );
  NAND2X1 U106 ( .A(n36), .B(n119), .Y(n132) );
  OAI21X1 U107 ( .A(n78), .B(n77), .C(n76), .Y(n79) );
  NAND3X1 U108 ( .A(n81), .B(n80), .C(n79), .Y(N129) );
  OAI22X1 U109 ( .A(n3), .B(n107), .C(n33), .D(n5), .Y(n84) );
  NAND3X1 U110 ( .A(n12), .B(n3), .C(n123), .Y(n82) );
  OAI21X1 U111 ( .A(n14), .B(n15), .C(n82), .Y(n83) );
  OAI21X1 U112 ( .A(n84), .B(n83), .C(n122), .Y(n100) );
  INVX2 U113 ( .A(n85), .Y(n89) );
  AOI22X1 U114 ( .A(n20), .B(n9), .C(n23), .D(n45), .Y(n87) );
  OAI22X1 U115 ( .A(n89), .B(n88), .C(n87), .D(n15), .Y(n98) );
  OAI22X1 U116 ( .A(n31), .B(n27), .C(n7), .D(n21), .Y(n131) );
  INVX2 U117 ( .A(n131), .Y(n96) );
  MUX2X1 U118 ( .B(n18), .A(n121), .S(n28), .Y(n94) );
  NAND2X1 U119 ( .A(n34), .B(n21), .Y(n92) );
  NAND3X1 U120 ( .A(n45), .B(n119), .C(n134), .Y(n91) );
  MUX2X1 U121 ( .B(n92), .A(n91), .S(n29), .Y(n93) );
  AOI21X1 U122 ( .A(n32), .B(n94), .C(n93), .Y(n95) );
  OAI21X1 U123 ( .A(n96), .B(n133), .C(n95), .Y(n97) );
  NOR2X1 U124 ( .A(n98), .B(n97), .Y(n99) );
  NAND2X1 U125 ( .A(n100), .B(n99), .Y(N98) );
  NAND2X1 U126 ( .A(n101), .B(n32), .Y(n105) );
  NAND2X1 U127 ( .A(n103), .B(n102), .Y(n104) );
  MUX2X1 U128 ( .B(n105), .A(n104), .S(n20), .Y(n130) );
  MUX2X1 U129 ( .B(n13), .A(n106), .S(n21), .Y(n108) );
  OAI21X1 U130 ( .A(n30), .B(n108), .C(n36), .Y(n128) );
  NAND2X1 U131 ( .A(n32), .B(n110), .Y(n114) );
  NAND2X1 U132 ( .A(n112), .B(n3), .Y(n113) );
  NAND2X1 U133 ( .A(n114), .B(n113), .Y(n115) );
  NAND2X1 U134 ( .A(n12), .B(n115), .Y(n127) );
  NAND2X1 U135 ( .A(n116), .B(n28), .Y(n118) );
  NAND2X1 U136 ( .A(n34), .B(n42), .Y(n117) );
  NAND2X1 U137 ( .A(n117), .B(n118), .Y(n125) );
  OAI22X1 U138 ( .A(n122), .B(n121), .C(n27), .D(n119), .Y(n124) );
  OAI21X1 U139 ( .A(n125), .B(n124), .C(n123), .Y(n126) );
  NAND3X1 U140 ( .A(n126), .B(n127), .C(n128), .Y(n129) );
  NOR2X1 U141 ( .A(n130), .B(n129), .Y(n143) );
  NAND2X1 U142 ( .A(n131), .B(n11), .Y(n141) );
  INVX2 U143 ( .A(n132), .Y(n139) );
  AOI21X1 U144 ( .A(n134), .B(n122), .C(n133), .Y(n137) );
  NAND3X1 U145 ( .A(n45), .B(n135), .C(n18), .Y(n136) );
  AOI22X1 U146 ( .A(n139), .B(n138), .C(n137), .D(n136), .Y(n140) );
  NAND2X1 U147 ( .A(n142), .B(n143), .Y(N59) );
endmodule


module substitution_2 ( data_in, dout );
  input [47:0] data_in;
  output [31:0] dout;


  Sbox1_2 SB1 ( .data_in(data_in[47:42]), .data_out(dout[31:28]) );
  Sbox2_2 SB2 ( .data_in(data_in[41:36]), .data_out(dout[27:24]) );
  Sbox3_2 SB3 ( .data_in(data_in[35:30]), .data_out(dout[23:20]) );
  Sbox4_2 SB4 ( .data_in(data_in[29:24]), .data_out(dout[19:16]) );
  Sbox5_2 SB5 ( .data_in(data_in[23:18]), .data_out(dout[15:12]) );
  Sbox6_2 SB6 ( .data_in(data_in[17:12]), .data_out(dout[11:8]) );
  Sbox7_2 SB7 ( .data_in(data_in[11:6]), .data_out(dout[7:4]) );
  Sbox8_2 SB8 ( .data_in(data_in[5:0]), .data_out(dout[3:0]) );
endmodule


module permutation_2 ( data_in, data_left, data_right, data_out );
  input [31:0] data_in;
  input [31:0] data_left;
  input [31:0] data_right;
  output [63:0] data_out;
  wire   \data_right[31] , \data_right[30] , \data_right[29] ,
         \data_right[28] , \data_right[27] , \data_right[26] ,
         \data_right[25] , \data_right[24] , \data_right[23] ,
         \data_right[22] , \data_right[21] , \data_right[20] ,
         \data_right[19] , \data_right[18] , \data_right[17] ,
         \data_right[16] , \data_right[15] , \data_right[14] ,
         \data_right[13] , \data_right[12] , \data_right[11] ,
         \data_right[10] , \data_right[9] , \data_right[8] , \data_right[7] ,
         \data_right[6] , \data_right[5] , \data_right[4] , \data_right[3] ,
         \data_right[2] , \data_right[1] , \data_right[0] , n1, n2, n3, n4, n5,
         n6, n7, n8;
  assign data_out[63] = \data_right[31] ;
  assign \data_right[31]  = data_right[31];
  assign data_out[62] = \data_right[30] ;
  assign \data_right[30]  = data_right[30];
  assign data_out[61] = \data_right[29] ;
  assign \data_right[29]  = data_right[29];
  assign data_out[60] = \data_right[28] ;
  assign \data_right[28]  = data_right[28];
  assign data_out[59] = \data_right[27] ;
  assign \data_right[27]  = data_right[27];
  assign data_out[58] = \data_right[26] ;
  assign \data_right[26]  = data_right[26];
  assign data_out[57] = \data_right[25] ;
  assign \data_right[25]  = data_right[25];
  assign data_out[56] = \data_right[24] ;
  assign \data_right[24]  = data_right[24];
  assign data_out[55] = \data_right[23] ;
  assign \data_right[23]  = data_right[23];
  assign data_out[54] = \data_right[22] ;
  assign \data_right[22]  = data_right[22];
  assign data_out[53] = \data_right[21] ;
  assign \data_right[21]  = data_right[21];
  assign data_out[52] = \data_right[20] ;
  assign \data_right[20]  = data_right[20];
  assign data_out[51] = \data_right[19] ;
  assign \data_right[19]  = data_right[19];
  assign data_out[50] = \data_right[18] ;
  assign \data_right[18]  = data_right[18];
  assign data_out[49] = \data_right[17] ;
  assign \data_right[17]  = data_right[17];
  assign data_out[48] = \data_right[16] ;
  assign \data_right[16]  = data_right[16];
  assign data_out[47] = \data_right[15] ;
  assign \data_right[15]  = data_right[15];
  assign data_out[46] = \data_right[14] ;
  assign \data_right[14]  = data_right[14];
  assign data_out[45] = \data_right[13] ;
  assign \data_right[13]  = data_right[13];
  assign data_out[44] = \data_right[12] ;
  assign \data_right[12]  = data_right[12];
  assign data_out[43] = \data_right[11] ;
  assign \data_right[11]  = data_right[11];
  assign data_out[42] = \data_right[10] ;
  assign \data_right[10]  = data_right[10];
  assign data_out[41] = \data_right[9] ;
  assign \data_right[9]  = data_right[9];
  assign data_out[40] = \data_right[8] ;
  assign \data_right[8]  = data_right[8];
  assign data_out[39] = \data_right[7] ;
  assign \data_right[7]  = data_right[7];
  assign data_out[38] = \data_right[6] ;
  assign \data_right[6]  = data_right[6];
  assign data_out[37] = \data_right[5] ;
  assign \data_right[5]  = data_right[5];
  assign data_out[36] = \data_right[4] ;
  assign \data_right[4]  = data_right[4];
  assign data_out[35] = \data_right[3] ;
  assign \data_right[3]  = data_right[3];
  assign data_out[34] = \data_right[2] ;
  assign \data_right[2]  = data_right[2];
  assign data_out[33] = \data_right[1] ;
  assign \data_right[1]  = data_right[1];
  assign data_out[32] = \data_right[0] ;
  assign \data_right[0]  = data_right[0];

  XNOR2X1 U1 ( .A(data_in[30]), .B(n1), .Y(data_out[14]) );
  INVX8 U2 ( .A(data_left[14]), .Y(n1) );
  XOR2X1 U3 ( .A(data_in[17]), .B(data_left[13]), .Y(data_out[13]) );
  XOR2X1 U4 ( .A(data_in[14]), .B(data_left[9]), .Y(data_out[9]) );
  XOR2X1 U5 ( .A(data_in[4]), .B(n2), .Y(data_out[12]) );
  INVX8 U6 ( .A(n3), .Y(n2) );
  INVX8 U7 ( .A(data_left[12]), .Y(n3) );
  INVX2 U8 ( .A(data_left[6]), .Y(n5) );
  INVX2 U9 ( .A(data_left[19]), .Y(n4) );
  INVX2 U10 ( .A(data_left[22]), .Y(n7) );
  INVX2 U11 ( .A(data_left[27]), .Y(n8) );
  INVX2 U12 ( .A(data_left[30]), .Y(n6) );
  XOR2X1 U13 ( .A(data_in[25]), .B(data_left[11]), .Y(data_out[11]) );
  XOR2X1 U14 ( .A(data_in[28]), .B(data_left[4]), .Y(data_out[4]) );
  XNOR2X1 U15 ( .A(data_in[13]), .B(n4), .Y(data_out[19]) );
  XNOR2X1 U16 ( .A(data_in[27]), .B(n5), .Y(data_out[6]) );
  XOR2X1 U17 ( .A(data_in[23]), .B(data_left[18]), .Y(data_out[18]) );
  XNOR2X1 U18 ( .A(data_in[3]), .B(n6), .Y(data_out[30]) );
  XOR2X1 U19 ( .A(data_in[26]), .B(data_left[21]), .Y(data_out[21]) );
  XNOR2X1 U20 ( .A(data_in[2]), .B(n7), .Y(data_out[22]) );
  XOR2X1 U21 ( .A(data_in[18]), .B(data_left[24]), .Y(data_out[24]) );
  XNOR2X1 U22 ( .A(data_in[5]), .B(n8), .Y(data_out[27]) );
  XOR2X1 U23 ( .A(data_in[15]), .B(data_left[0]), .Y(data_out[0]) );
  XOR2X1 U24 ( .A(data_in[6]), .B(data_left[1]), .Y(data_out[1]) );
  XOR2X1 U25 ( .A(data_in[19]), .B(data_left[2]), .Y(data_out[2]) );
  XOR2X1 U26 ( .A(data_in[20]), .B(data_left[3]), .Y(data_out[3]) );
  XOR2X1 U27 ( .A(data_in[11]), .B(data_left[5]), .Y(data_out[5]) );
  XOR2X1 U28 ( .A(data_in[16]), .B(data_left[7]), .Y(data_out[7]) );
  XOR2X1 U29 ( .A(data_in[0]), .B(data_left[8]), .Y(data_out[8]) );
  XOR2X1 U30 ( .A(data_in[22]), .B(data_left[10]), .Y(data_out[10]) );
  XOR2X1 U31 ( .A(data_in[9]), .B(data_left[15]), .Y(data_out[15]) );
  XOR2X1 U32 ( .A(data_in[1]), .B(data_left[16]), .Y(data_out[16]) );
  XOR2X1 U33 ( .A(data_in[7]), .B(data_left[17]), .Y(data_out[17]) );
  XOR2X1 U34 ( .A(data_in[31]), .B(data_left[20]), .Y(data_out[20]) );
  XOR2X1 U35 ( .A(data_in[8]), .B(data_left[23]), .Y(data_out[23]) );
  XOR2X1 U36 ( .A(data_in[12]), .B(data_left[25]), .Y(data_out[25]) );
  XOR2X1 U37 ( .A(data_in[29]), .B(data_left[26]), .Y(data_out[26]) );
  XOR2X1 U38 ( .A(data_in[21]), .B(data_left[28]), .Y(data_out[28]) );
  XOR2X1 U39 ( .A(data_in[10]), .B(data_left[29]), .Y(data_out[29]) );
  XOR2X1 U40 ( .A(data_in[24]), .B(data_left[31]), .Y(data_out[31]) );
endmodule


module des_2 ( clk, n_rst, data_in, key_in, ready, rw_mode, data_out, 
        next_data );
  input [63:0] data_in;
  input [63:0] key_in;
  output [63:0] data_out;
  input clk, n_rst, ready, rw_mode;
  output next_data;
  wire   n1;
  wire   [1:0] io;
  wire   [63:0] internal_data;
  wire   [31:0] data_right;
  wire   [31:0] data_left;
  wire   [4:0] r_num;
  wire   [47:0] exp_to_key;
  wire   [47:0] rkey;
  wire   [47:0] key_to_sub;
  wire   [31:0] sub_to_perm;

  des_io_select_2 IOSELECT ( .clk(clk), .io_sel(io), .ext_in(data_in), 
        .int_in(internal_data), .data_out_right(data_right), .data_out_left(
        data_left), .ext_out(data_out) );
  des_controller_2 DESCONTROLLER ( .clk(clk), .n_rst(n_rst), .data_ready(ready), .rw_mode(rw_mode), .io_select(io), .next_data(next_data), .round_number(
        r_num) );
  expansion_2 EXP ( .data_in(data_right), .data_out(exp_to_key) );
  key_wrapper_2 KEY ( .key_in(key_in), .round_number(r_num), .kout(rkey) );
  key_xor_2 KXOR ( .data(exp_to_key), .key(rkey), .out(key_to_sub) );
  substitution_2 SUB ( .data_in({key_to_sub[47:30], n1, key_to_sub[28:0]}), 
        .dout(sub_to_perm) );
  permutation_2 PERM ( .data_in(sub_to_perm), .data_left(data_left), 
        .data_right(data_right), .data_out(internal_data) );
  BUFX4 U1 ( .A(key_to_sub[29]), .Y(n1) );
endmodule


module des_io_select_1 ( clk, io_sel, ext_in, int_in, data_out_right, 
        data_out_left, ext_out );
  input [1:0] io_sel;
  input [63:0] ext_in;
  input [63:0] int_in;
  output [31:0] data_out_right;
  output [31:0] data_out_left;
  output [63:0] ext_out;
  input clk;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n133, n134,
         n141, n145, n146, n147, n149, n151, n155, n158, n159, n161, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304;
  assign ext_out[63] = data_out_right[31];
  assign ext_out[62] = data_out_right[30];
  assign ext_out[61] = data_out_right[29];
  assign ext_out[60] = data_out_right[28];
  assign ext_out[59] = data_out_right[27];
  assign ext_out[58] = data_out_right[26];
  assign ext_out[57] = data_out_right[25];
  assign ext_out[56] = data_out_right[24];
  assign ext_out[55] = data_out_right[23];
  assign ext_out[54] = data_out_right[22];
  assign ext_out[53] = data_out_right[21];
  assign ext_out[52] = data_out_right[20];
  assign ext_out[51] = data_out_right[19];
  assign ext_out[50] = data_out_right[18];
  assign ext_out[49] = data_out_right[17];
  assign ext_out[48] = data_out_right[16];
  assign ext_out[47] = data_out_right[15];
  assign ext_out[46] = data_out_right[14];
  assign ext_out[45] = data_out_right[13];
  assign ext_out[44] = data_out_right[12];
  assign ext_out[43] = data_out_right[11];
  assign ext_out[42] = data_out_right[10];
  assign ext_out[41] = data_out_right[9];
  assign ext_out[40] = data_out_right[8];
  assign ext_out[39] = data_out_right[7];
  assign ext_out[38] = data_out_right[6];
  assign ext_out[37] = data_out_right[5];
  assign ext_out[36] = data_out_right[4];
  assign ext_out[35] = data_out_right[3];
  assign ext_out[34] = data_out_right[2];
  assign ext_out[33] = data_out_right[1];
  assign ext_out[32] = data_out_right[0];
  assign ext_out[31] = data_out_left[31];
  assign ext_out[30] = data_out_left[30];
  assign ext_out[29] = data_out_left[29];
  assign ext_out[28] = data_out_left[28];
  assign ext_out[27] = data_out_left[27];
  assign ext_out[26] = data_out_left[26];
  assign ext_out[25] = data_out_left[25];
  assign ext_out[24] = data_out_left[24];
  assign ext_out[23] = data_out_left[23];
  assign ext_out[22] = data_out_left[22];
  assign ext_out[21] = data_out_left[21];
  assign ext_out[20] = data_out_left[20];
  assign ext_out[19] = data_out_left[19];
  assign ext_out[18] = data_out_left[18];
  assign ext_out[17] = data_out_left[17];
  assign ext_out[16] = data_out_left[16];
  assign ext_out[15] = data_out_left[15];
  assign ext_out[14] = data_out_left[14];
  assign ext_out[13] = data_out_left[13];
  assign ext_out[12] = data_out_left[12];
  assign ext_out[11] = data_out_left[11];
  assign ext_out[10] = data_out_left[10];
  assign ext_out[9] = data_out_left[9];
  assign ext_out[8] = data_out_left[8];
  assign ext_out[7] = data_out_left[7];
  assign ext_out[6] = data_out_left[6];
  assign ext_out[5] = data_out_left[5];
  assign ext_out[4] = data_out_left[4];
  assign ext_out[3] = data_out_left[3];
  assign ext_out[2] = data_out_left[2];
  assign ext_out[1] = data_out_left[1];
  assign ext_out[0] = data_out_left[0];

  DFFPOSX1 \left_curr_reg[31]  ( .D(n253), .CLK(clk), .Q(data_out_left[31]) );
  DFFPOSX1 \left_curr_reg[30]  ( .D(n254), .CLK(clk), .Q(data_out_left[30]) );
  DFFPOSX1 \left_curr_reg[29]  ( .D(n255), .CLK(clk), .Q(data_out_left[29]) );
  DFFPOSX1 \left_curr_reg[28]  ( .D(n256), .CLK(clk), .Q(data_out_left[28]) );
  DFFPOSX1 \left_curr_reg[27]  ( .D(n257), .CLK(clk), .Q(data_out_left[27]) );
  DFFPOSX1 \left_curr_reg[26]  ( .D(n258), .CLK(clk), .Q(data_out_left[26]) );
  DFFPOSX1 \left_curr_reg[25]  ( .D(n259), .CLK(clk), .Q(data_out_left[25]) );
  DFFPOSX1 \left_curr_reg[24]  ( .D(n260), .CLK(clk), .Q(data_out_left[24]) );
  DFFPOSX1 \left_curr_reg[23]  ( .D(n261), .CLK(clk), .Q(data_out_left[23]) );
  DFFPOSX1 \left_curr_reg[22]  ( .D(n262), .CLK(clk), .Q(data_out_left[22]) );
  DFFPOSX1 \left_curr_reg[21]  ( .D(n263), .CLK(clk), .Q(data_out_left[21]) );
  DFFPOSX1 \left_curr_reg[20]  ( .D(n264), .CLK(clk), .Q(data_out_left[20]) );
  DFFPOSX1 \left_curr_reg[19]  ( .D(n265), .CLK(clk), .Q(data_out_left[19]) );
  DFFPOSX1 \left_curr_reg[18]  ( .D(n266), .CLK(clk), .Q(data_out_left[18]) );
  DFFPOSX1 \left_curr_reg[17]  ( .D(n267), .CLK(clk), .Q(data_out_left[17]) );
  DFFPOSX1 \left_curr_reg[16]  ( .D(n268), .CLK(clk), .Q(data_out_left[16]) );
  DFFPOSX1 \left_curr_reg[15]  ( .D(n269), .CLK(clk), .Q(data_out_left[15]) );
  DFFPOSX1 \left_curr_reg[14]  ( .D(n270), .CLK(clk), .Q(data_out_left[14]) );
  DFFPOSX1 \left_curr_reg[13]  ( .D(n271), .CLK(clk), .Q(data_out_left[13]) );
  DFFPOSX1 \left_curr_reg[12]  ( .D(n272), .CLK(clk), .Q(data_out_left[12]) );
  DFFPOSX1 \left_curr_reg[11]  ( .D(n273), .CLK(clk), .Q(data_out_left[11]) );
  DFFPOSX1 \left_curr_reg[10]  ( .D(n274), .CLK(clk), .Q(data_out_left[10]) );
  DFFPOSX1 \left_curr_reg[9]  ( .D(n275), .CLK(clk), .Q(data_out_left[9]) );
  DFFPOSX1 \left_curr_reg[8]  ( .D(n276), .CLK(clk), .Q(data_out_left[8]) );
  DFFPOSX1 \left_curr_reg[7]  ( .D(n277), .CLK(clk), .Q(data_out_left[7]) );
  DFFPOSX1 \left_curr_reg[6]  ( .D(n278), .CLK(clk), .Q(data_out_left[6]) );
  DFFPOSX1 \left_curr_reg[5]  ( .D(n279), .CLK(clk), .Q(data_out_left[5]) );
  DFFPOSX1 \left_curr_reg[4]  ( .D(n280), .CLK(clk), .Q(data_out_left[4]) );
  DFFPOSX1 \left_curr_reg[3]  ( .D(n281), .CLK(clk), .Q(data_out_left[3]) );
  DFFPOSX1 \left_curr_reg[2]  ( .D(n282), .CLK(clk), .Q(data_out_left[2]) );
  DFFPOSX1 \left_curr_reg[1]  ( .D(n283), .CLK(clk), .Q(data_out_left[1]) );
  DFFPOSX1 \left_curr_reg[0]  ( .D(n284), .CLK(clk), .Q(data_out_left[0]) );
  DFFPOSX1 \right_curr_reg[31]  ( .D(n285), .CLK(clk), .Q(data_out_right[31])
         );
  DFFPOSX1 \right_curr_reg[30]  ( .D(n286), .CLK(clk), .Q(data_out_right[30])
         );
  DFFPOSX1 \right_curr_reg[29]  ( .D(n250), .CLK(clk), .Q(data_out_right[29])
         );
  DFFPOSX1 \right_curr_reg[28]  ( .D(n287), .CLK(clk), .Q(data_out_right[28])
         );
  DFFPOSX1 \right_curr_reg[27]  ( .D(n243), .CLK(clk), .Q(data_out_right[27])
         );
  DFFPOSX1 \right_curr_reg[26]  ( .D(n242), .CLK(clk), .Q(data_out_right[26])
         );
  DFFPOSX1 \right_curr_reg[25]  ( .D(n288), .CLK(clk), .Q(data_out_right[25])
         );
  DFFPOSX1 \right_curr_reg[24]  ( .D(n289), .CLK(clk), .Q(data_out_right[24])
         );
  DFFPOSX1 \right_curr_reg[23]  ( .D(n249), .CLK(clk), .Q(data_out_right[23])
         );
  DFFPOSX1 \right_curr_reg[22]  ( .D(n290), .CLK(clk), .Q(data_out_right[22])
         );
  DFFPOSX1 \right_curr_reg[21]  ( .D(n291), .CLK(clk), .Q(data_out_right[21])
         );
  DFFPOSX1 \right_curr_reg[20]  ( .D(n292), .CLK(clk), .Q(data_out_right[20])
         );
  DFFPOSX1 \right_curr_reg[19]  ( .D(n244), .CLK(clk), .Q(data_out_right[19])
         );
  DFFPOSX1 \right_curr_reg[18]  ( .D(n293), .CLK(clk), .Q(data_out_right[18])
         );
  DFFPOSX1 \right_curr_reg[17]  ( .D(n246), .CLK(clk), .Q(data_out_right[17])
         );
  DFFPOSX1 \right_curr_reg[16]  ( .D(n294), .CLK(clk), .Q(data_out_right[16])
         );
  DFFPOSX1 \right_curr_reg[15]  ( .D(n252), .CLK(clk), .Q(data_out_right[15])
         );
  DFFPOSX1 \right_curr_reg[14]  ( .D(n241), .CLK(clk), .Q(data_out_right[14])
         );
  DFFPOSX1 \right_curr_reg[13]  ( .D(n248), .CLK(clk), .Q(data_out_right[13])
         );
  DFFPOSX1 \right_curr_reg[12]  ( .D(n295), .CLK(clk), .Q(data_out_right[12])
         );
  DFFPOSX1 \right_curr_reg[11]  ( .D(n296), .CLK(clk), .Q(data_out_right[11])
         );
  DFFPOSX1 \right_curr_reg[10]  ( .D(n297), .CLK(clk), .Q(data_out_right[10])
         );
  DFFPOSX1 \right_curr_reg[9]  ( .D(n251), .CLK(clk), .Q(data_out_right[9]) );
  DFFPOSX1 \right_curr_reg[8]  ( .D(n298), .CLK(clk), .Q(data_out_right[8]) );
  DFFPOSX1 \right_curr_reg[7]  ( .D(n299), .CLK(clk), .Q(data_out_right[7]) );
  DFFPOSX1 \right_curr_reg[6]  ( .D(n300), .CLK(clk), .Q(data_out_right[6]) );
  DFFPOSX1 \right_curr_reg[5]  ( .D(n301), .CLK(clk), .Q(data_out_right[5]) );
  DFFPOSX1 \right_curr_reg[4]  ( .D(n302), .CLK(clk), .Q(data_out_right[4]) );
  DFFPOSX1 \right_curr_reg[3]  ( .D(n303), .CLK(clk), .Q(data_out_right[3]) );
  DFFPOSX1 \right_curr_reg[2]  ( .D(n247), .CLK(clk), .Q(data_out_right[2]) );
  DFFPOSX1 \right_curr_reg[1]  ( .D(n245), .CLK(clk), .Q(data_out_right[1]) );
  DFFPOSX1 \right_curr_reg[0]  ( .D(n304), .CLK(clk), .Q(data_out_right[0]) );
  INVX2 U2 ( .A(n146), .Y(n241) );
  INVX2 U3 ( .A(n204), .Y(n244) );
  INVX2 U4 ( .A(n222), .Y(n242) );
  INVX2 U5 ( .A(n214), .Y(n249) );
  INVX2 U6 ( .A(n3), .Y(n8) );
  INVX2 U7 ( .A(n3), .Y(n9) );
  INVX2 U8 ( .A(n3), .Y(n10) );
  INVX2 U9 ( .A(n3), .Y(n11) );
  INVX4 U10 ( .A(n16), .Y(n15) );
  BUFX2 U11 ( .A(io_sel[1]), .Y(n1) );
  BUFX4 U12 ( .A(n237), .Y(n27) );
  BUFX4 U13 ( .A(n237), .Y(n28) );
  BUFX4 U14 ( .A(n237), .Y(n29) );
  INVX2 U15 ( .A(int_in[16]), .Y(n159) );
  INVX2 U16 ( .A(n106), .Y(n247) );
  INVX1 U17 ( .A(n155), .Y(n252) );
  INVX1 U18 ( .A(n234), .Y(n250) );
  INVX1 U19 ( .A(n198), .Y(n246) );
  INVX1 U20 ( .A(n122), .Y(n251) );
  INVX4 U21 ( .A(n17), .Y(n14) );
  INVX4 U22 ( .A(n18), .Y(n13) );
  BUFX4 U23 ( .A(n22), .Y(n16) );
  BUFX4 U24 ( .A(n21), .Y(n19) );
  BUFX2 U25 ( .A(n233), .Y(n26) );
  INVX2 U26 ( .A(n19), .Y(n12) );
  BUFX2 U27 ( .A(n22), .Y(n17) );
  BUFX2 U28 ( .A(n22), .Y(n18) );
  BUFX2 U29 ( .A(n21), .Y(n20) );
  AND2X2 U30 ( .A(n1), .B(n15), .Y(n2) );
  AND2X2 U31 ( .A(n1), .B(n15), .Y(n3) );
  BUFX2 U32 ( .A(n237), .Y(n30) );
  INVX2 U33 ( .A(n231), .Y(n22) );
  INVX1 U34 ( .A(n231), .Y(n21) );
  INVX1 U35 ( .A(n226), .Y(n243) );
  INVX1 U36 ( .A(n133), .Y(n248) );
  INVX1 U37 ( .A(n2), .Y(n4) );
  INVX1 U38 ( .A(n2), .Y(n5) );
  INVX1 U39 ( .A(n2), .Y(n6) );
  INVX1 U40 ( .A(n2), .Y(n7) );
  BUFX4 U41 ( .A(n233), .Y(n23) );
  BUFX4 U42 ( .A(n233), .Y(n24) );
  BUFX4 U43 ( .A(n233), .Y(n25) );
  BUFX4 U44 ( .A(n237), .Y(n31) );
  NAND2X1 U45 ( .A(io_sel[0]), .B(io_sel[1]), .Y(n231) );
  INVX2 U46 ( .A(data_out_left[0]), .Y(n34) );
  NAND2X1 U47 ( .A(n1), .B(n15), .Y(n240) );
  INVX2 U48 ( .A(n240), .Y(n233) );
  NAND2X1 U49 ( .A(io_sel[0]), .B(n15), .Y(n32) );
  INVX2 U50 ( .A(n32), .Y(n237) );
  AOI22X1 U51 ( .A(int_in[32]), .B(n24), .C(ext_in[32]), .D(n28), .Y(n33) );
  OAI21X1 U52 ( .A(n15), .B(n34), .C(n33), .Y(n284) );
  INVX2 U53 ( .A(data_out_left[1]), .Y(n36) );
  AOI22X1 U54 ( .A(int_in[33]), .B(n25), .C(ext_in[33]), .D(n29), .Y(n35) );
  OAI21X1 U55 ( .A(n15), .B(n36), .C(n35), .Y(n283) );
  INVX2 U56 ( .A(data_out_left[2]), .Y(n38) );
  AOI22X1 U57 ( .A(int_in[34]), .B(n25), .C(ext_in[34]), .D(n29), .Y(n37) );
  OAI21X1 U58 ( .A(n15), .B(n38), .C(n37), .Y(n282) );
  INVX2 U59 ( .A(data_out_left[3]), .Y(n40) );
  AOI22X1 U60 ( .A(int_in[35]), .B(n25), .C(ext_in[35]), .D(n29), .Y(n39) );
  OAI21X1 U61 ( .A(n15), .B(n40), .C(n39), .Y(n281) );
  INVX2 U62 ( .A(data_out_left[4]), .Y(n42) );
  AOI22X1 U63 ( .A(int_in[36]), .B(n25), .C(ext_in[36]), .D(n29), .Y(n41) );
  OAI21X1 U64 ( .A(n15), .B(n42), .C(n41), .Y(n280) );
  INVX2 U65 ( .A(data_out_left[5]), .Y(n44) );
  AOI22X1 U66 ( .A(int_in[37]), .B(n25), .C(ext_in[37]), .D(n29), .Y(n43) );
  OAI21X1 U67 ( .A(n14), .B(n44), .C(n43), .Y(n279) );
  INVX2 U68 ( .A(data_out_left[6]), .Y(n46) );
  AOI22X1 U69 ( .A(int_in[38]), .B(n25), .C(ext_in[38]), .D(n29), .Y(n45) );
  OAI21X1 U70 ( .A(n14), .B(n46), .C(n45), .Y(n278) );
  INVX2 U71 ( .A(data_out_left[7]), .Y(n48) );
  AOI22X1 U72 ( .A(int_in[39]), .B(n24), .C(ext_in[39]), .D(n29), .Y(n47) );
  OAI21X1 U73 ( .A(n14), .B(n48), .C(n47), .Y(n277) );
  INVX2 U74 ( .A(data_out_left[8]), .Y(n50) );
  AOI22X1 U75 ( .A(int_in[40]), .B(n24), .C(ext_in[40]), .D(n29), .Y(n49) );
  OAI21X1 U76 ( .A(n14), .B(n50), .C(n49), .Y(n276) );
  INVX2 U77 ( .A(data_out_left[9]), .Y(n52) );
  AOI22X1 U78 ( .A(int_in[41]), .B(n24), .C(ext_in[41]), .D(n29), .Y(n51) );
  OAI21X1 U79 ( .A(n14), .B(n52), .C(n51), .Y(n275) );
  INVX2 U80 ( .A(data_out_left[10]), .Y(n54) );
  AOI22X1 U81 ( .A(int_in[42]), .B(n24), .C(ext_in[42]), .D(n28), .Y(n53) );
  OAI21X1 U82 ( .A(n14), .B(n54), .C(n53), .Y(n274) );
  INVX2 U83 ( .A(data_out_left[11]), .Y(n56) );
  AOI22X1 U84 ( .A(int_in[43]), .B(n24), .C(ext_in[43]), .D(n28), .Y(n55) );
  OAI21X1 U85 ( .A(n14), .B(n56), .C(n55), .Y(n273) );
  INVX2 U86 ( .A(data_out_left[12]), .Y(n58) );
  AOI22X1 U87 ( .A(int_in[44]), .B(n24), .C(ext_in[44]), .D(n28), .Y(n57) );
  OAI21X1 U88 ( .A(n14), .B(n58), .C(n57), .Y(n272) );
  INVX2 U89 ( .A(data_out_left[13]), .Y(n60) );
  AOI22X1 U90 ( .A(int_in[45]), .B(n24), .C(ext_in[45]), .D(n28), .Y(n59) );
  OAI21X1 U91 ( .A(n14), .B(n60), .C(n59), .Y(n271) );
  INVX2 U92 ( .A(data_out_left[14]), .Y(n62) );
  AOI22X1 U93 ( .A(int_in[46]), .B(n24), .C(ext_in[46]), .D(n28), .Y(n61) );
  OAI21X1 U94 ( .A(n14), .B(n62), .C(n61), .Y(n270) );
  INVX2 U95 ( .A(data_out_left[15]), .Y(n64) );
  AOI22X1 U96 ( .A(int_in[47]), .B(n24), .C(ext_in[47]), .D(n28), .Y(n63) );
  OAI21X1 U97 ( .A(n14), .B(n64), .C(n63), .Y(n269) );
  INVX2 U98 ( .A(data_out_left[16]), .Y(n66) );
  AOI22X1 U99 ( .A(int_in[48]), .B(n24), .C(ext_in[48]), .D(n28), .Y(n65) );
  OAI21X1 U100 ( .A(n14), .B(n66), .C(n65), .Y(n268) );
  INVX2 U101 ( .A(data_out_left[17]), .Y(n68) );
  AOI22X1 U102 ( .A(int_in[49]), .B(n24), .C(ext_in[49]), .D(n28), .Y(n67) );
  OAI21X1 U103 ( .A(n14), .B(n68), .C(n67), .Y(n267) );
  INVX2 U104 ( .A(data_out_left[18]), .Y(n70) );
  AOI22X1 U105 ( .A(int_in[50]), .B(n24), .C(ext_in[50]), .D(n28), .Y(n69) );
  OAI21X1 U106 ( .A(n13), .B(n70), .C(n69), .Y(n266) );
  INVX2 U107 ( .A(data_out_left[19]), .Y(n72) );
  AOI22X1 U108 ( .A(int_in[51]), .B(n23), .C(ext_in[51]), .D(n28), .Y(n71) );
  OAI21X1 U109 ( .A(n13), .B(n72), .C(n71), .Y(n265) );
  INVX2 U110 ( .A(data_out_left[20]), .Y(n74) );
  AOI22X1 U111 ( .A(int_in[52]), .B(n23), .C(ext_in[52]), .D(n28), .Y(n73) );
  OAI21X1 U112 ( .A(n13), .B(n74), .C(n73), .Y(n264) );
  INVX2 U113 ( .A(data_out_left[21]), .Y(n76) );
  AOI22X1 U114 ( .A(int_in[53]), .B(n23), .C(ext_in[53]), .D(n28), .Y(n75) );
  OAI21X1 U115 ( .A(n13), .B(n76), .C(n75), .Y(n263) );
  INVX2 U116 ( .A(data_out_left[22]), .Y(n78) );
  AOI22X1 U117 ( .A(int_in[54]), .B(n23), .C(ext_in[54]), .D(n27), .Y(n77) );
  OAI21X1 U118 ( .A(n13), .B(n78), .C(n77), .Y(n262) );
  INVX2 U119 ( .A(data_out_left[23]), .Y(n80) );
  AOI22X1 U120 ( .A(int_in[55]), .B(n23), .C(ext_in[55]), .D(n27), .Y(n79) );
  OAI21X1 U121 ( .A(n13), .B(n80), .C(n79), .Y(n261) );
  INVX2 U122 ( .A(data_out_left[24]), .Y(n82) );
  AOI22X1 U123 ( .A(int_in[56]), .B(n23), .C(ext_in[56]), .D(n27), .Y(n81) );
  OAI21X1 U124 ( .A(n13), .B(n82), .C(n81), .Y(n260) );
  INVX2 U125 ( .A(data_out_left[25]), .Y(n84) );
  AOI22X1 U126 ( .A(int_in[57]), .B(n23), .C(ext_in[57]), .D(n27), .Y(n83) );
  OAI21X1 U127 ( .A(n13), .B(n84), .C(n83), .Y(n259) );
  INVX2 U128 ( .A(data_out_left[26]), .Y(n86) );
  AOI22X1 U129 ( .A(int_in[58]), .B(n23), .C(ext_in[58]), .D(n27), .Y(n85) );
  OAI21X1 U130 ( .A(n13), .B(n86), .C(n85), .Y(n258) );
  INVX2 U131 ( .A(data_out_left[27]), .Y(n88) );
  AOI22X1 U132 ( .A(int_in[59]), .B(n23), .C(ext_in[59]), .D(n27), .Y(n87) );
  OAI21X1 U133 ( .A(n13), .B(n88), .C(n87), .Y(n257) );
  INVX2 U134 ( .A(data_out_left[28]), .Y(n90) );
  AOI22X1 U135 ( .A(int_in[60]), .B(n23), .C(ext_in[60]), .D(n27), .Y(n89) );
  OAI21X1 U136 ( .A(n13), .B(n90), .C(n89), .Y(n256) );
  INVX2 U137 ( .A(data_out_left[29]), .Y(n92) );
  AOI22X1 U138 ( .A(int_in[61]), .B(n23), .C(ext_in[61]), .D(n27), .Y(n91) );
  OAI21X1 U139 ( .A(n13), .B(n92), .C(n91), .Y(n255) );
  INVX2 U140 ( .A(data_out_left[30]), .Y(n94) );
  AOI22X1 U141 ( .A(int_in[62]), .B(n23), .C(ext_in[62]), .D(n27), .Y(n93) );
  OAI21X1 U142 ( .A(n13), .B(n94), .C(n93), .Y(n254) );
  INVX2 U143 ( .A(data_out_left[31]), .Y(n96) );
  AOI22X1 U144 ( .A(int_in[63]), .B(n23), .C(ext_in[63]), .D(n27), .Y(n95) );
  OAI21X1 U145 ( .A(n12), .B(n96), .C(n95), .Y(n253) );
  INVX2 U146 ( .A(int_in[0]), .Y(n98) );
  AOI22X1 U147 ( .A(ext_in[0]), .B(n29), .C(data_out_right[0]), .D(n16), .Y(
        n97) );
  OAI21X1 U148 ( .A(n8), .B(n98), .C(n97), .Y(n304) );
  INVX2 U149 ( .A(data_out_right[1]), .Y(n100) );
  NAND2X1 U150 ( .A(ext_in[1]), .B(n31), .Y(n99) );
  OAI21X1 U151 ( .A(n12), .B(n100), .C(n99), .Y(n101) );
  OAI22X1 U152 ( .A(n25), .B(n101), .C(int_in[1]), .D(n101), .Y(n102) );
  INVX2 U153 ( .A(n102), .Y(n245) );
  INVX2 U154 ( .A(data_out_right[2]), .Y(n104) );
  NAND2X1 U155 ( .A(ext_in[2]), .B(n31), .Y(n103) );
  OAI21X1 U156 ( .A(n12), .B(n104), .C(n103), .Y(n105) );
  OAI22X1 U157 ( .A(n26), .B(n105), .C(int_in[2]), .D(n105), .Y(n106) );
  INVX2 U158 ( .A(int_in[3]), .Y(n108) );
  AOI22X1 U159 ( .A(ext_in[3]), .B(n30), .C(data_out_right[3]), .D(n19), .Y(
        n107) );
  OAI21X1 U160 ( .A(n9), .B(n108), .C(n107), .Y(n303) );
  INVX2 U161 ( .A(int_in[4]), .Y(n110) );
  AOI22X1 U162 ( .A(ext_in[4]), .B(n29), .C(data_out_right[4]), .D(n20), .Y(
        n109) );
  OAI21X1 U163 ( .A(n10), .B(n110), .C(n109), .Y(n302) );
  INVX2 U164 ( .A(int_in[5]), .Y(n112) );
  AOI22X1 U165 ( .A(ext_in[5]), .B(n29), .C(data_out_right[5]), .D(n20), .Y(
        n111) );
  OAI21X1 U166 ( .A(n11), .B(n112), .C(n111), .Y(n301) );
  INVX2 U167 ( .A(int_in[6]), .Y(n114) );
  AOI22X1 U168 ( .A(ext_in[6]), .B(n29), .C(data_out_right[6]), .D(n20), .Y(
        n113) );
  OAI21X1 U169 ( .A(n11), .B(n114), .C(n113), .Y(n300) );
  INVX2 U170 ( .A(int_in[7]), .Y(n116) );
  AOI22X1 U171 ( .A(data_out_right[7]), .B(n20), .C(ext_in[7]), .D(n27), .Y(
        n115) );
  OAI21X1 U172 ( .A(n10), .B(n116), .C(n115), .Y(n299) );
  INVX2 U173 ( .A(int_in[8]), .Y(n118) );
  AOI22X1 U174 ( .A(ext_in[8]), .B(n30), .C(data_out_right[8]), .D(n20), .Y(
        n117) );
  OAI21X1 U175 ( .A(n9), .B(n118), .C(n117), .Y(n298) );
  INVX2 U176 ( .A(data_out_right[9]), .Y(n120) );
  NAND2X1 U177 ( .A(ext_in[9]), .B(n31), .Y(n119) );
  OAI21X1 U178 ( .A(n12), .B(n120), .C(n119), .Y(n121) );
  OAI22X1 U179 ( .A(n25), .B(n121), .C(int_in[9]), .D(n121), .Y(n122) );
  INVX2 U180 ( .A(int_in[10]), .Y(n124) );
  AOI22X1 U181 ( .A(ext_in[10]), .B(n30), .C(data_out_right[10]), .D(n20), .Y(
        n123) );
  OAI21X1 U182 ( .A(n8), .B(n124), .C(n123), .Y(n297) );
  INVX2 U183 ( .A(int_in[11]), .Y(n126) );
  AOI22X1 U184 ( .A(data_out_right[11]), .B(n20), .C(ext_in[11]), .D(n27), .Y(
        n125) );
  OAI21X1 U185 ( .A(n4), .B(n126), .C(n125), .Y(n296) );
  INVX2 U186 ( .A(int_in[12]), .Y(n128) );
  AOI22X1 U187 ( .A(data_out_right[12]), .B(n20), .C(ext_in[12]), .D(n27), .Y(
        n127) );
  OAI21X1 U188 ( .A(n5), .B(n128), .C(n127), .Y(n295) );
  INVX2 U189 ( .A(data_out_right[13]), .Y(n130) );
  NAND2X1 U190 ( .A(ext_in[13]), .B(n31), .Y(n129) );
  OAI21X1 U191 ( .A(n12), .B(n130), .C(n129), .Y(n131) );
  OAI22X1 U192 ( .A(n26), .B(n131), .C(int_in[13]), .D(n131), .Y(n133) );
  INVX2 U193 ( .A(data_out_right[14]), .Y(n141) );
  NAND2X1 U194 ( .A(ext_in[14]), .B(n31), .Y(n134) );
  OAI21X1 U195 ( .A(n12), .B(n141), .C(n134), .Y(n145) );
  OAI22X1 U196 ( .A(int_in[14]), .B(n145), .C(n25), .D(n145), .Y(n146) );
  INVX2 U197 ( .A(data_out_right[15]), .Y(n149) );
  NAND2X1 U198 ( .A(ext_in[15]), .B(n31), .Y(n147) );
  OAI21X1 U199 ( .A(n12), .B(n149), .C(n147), .Y(n151) );
  OAI22X1 U200 ( .A(n26), .B(n151), .C(int_in[15]), .D(n151), .Y(n155) );
  AOI22X1 U201 ( .A(ext_in[16]), .B(n30), .C(data_out_right[16]), .D(n19), .Y(
        n158) );
  OAI21X1 U202 ( .A(n6), .B(n159), .C(n158), .Y(n294) );
  INVX2 U203 ( .A(data_out_right[17]), .Y(n196) );
  NAND2X1 U204 ( .A(ext_in[17]), .B(n31), .Y(n161) );
  OAI21X1 U205 ( .A(n12), .B(n196), .C(n161), .Y(n197) );
  OAI22X1 U206 ( .A(n26), .B(n197), .C(int_in[17]), .D(n197), .Y(n198) );
  INVX2 U207 ( .A(int_in[18]), .Y(n200) );
  AOI22X1 U208 ( .A(ext_in[18]), .B(n30), .C(data_out_right[18]), .D(n18), .Y(
        n199) );
  OAI21X1 U209 ( .A(n7), .B(n200), .C(n199), .Y(n293) );
  INVX2 U210 ( .A(data_out_right[19]), .Y(n202) );
  NAND2X1 U211 ( .A(ext_in[19]), .B(n31), .Y(n201) );
  OAI21X1 U212 ( .A(n12), .B(n202), .C(n201), .Y(n203) );
  OAI22X1 U213 ( .A(int_in[19]), .B(n203), .C(n25), .D(n203), .Y(n204) );
  INVX2 U214 ( .A(int_in[20]), .Y(n206) );
  AOI22X1 U215 ( .A(ext_in[20]), .B(n30), .C(data_out_right[20]), .D(n18), .Y(
        n205) );
  OAI21X1 U216 ( .A(n4), .B(n206), .C(n205), .Y(n292) );
  INVX2 U217 ( .A(int_in[21]), .Y(n208) );
  AOI22X1 U218 ( .A(ext_in[21]), .B(n30), .C(data_out_right[21]), .D(n18), .Y(
        n207) );
  OAI21X1 U219 ( .A(n5), .B(n208), .C(n207), .Y(n291) );
  INVX2 U220 ( .A(int_in[22]), .Y(n210) );
  AOI22X1 U221 ( .A(ext_in[22]), .B(n30), .C(data_out_right[22]), .D(n17), .Y(
        n209) );
  OAI21X1 U222 ( .A(n6), .B(n210), .C(n209), .Y(n290) );
  INVX2 U223 ( .A(data_out_right[23]), .Y(n212) );
  NAND2X1 U224 ( .A(ext_in[23]), .B(n31), .Y(n211) );
  OAI21X1 U225 ( .A(n12), .B(n212), .C(n211), .Y(n213) );
  OAI22X1 U226 ( .A(int_in[23]), .B(n213), .C(n25), .D(n213), .Y(n214) );
  INVX2 U227 ( .A(int_in[24]), .Y(n216) );
  AOI22X1 U228 ( .A(ext_in[24]), .B(n30), .C(data_out_right[24]), .D(n17), .Y(
        n215) );
  OAI21X1 U229 ( .A(n7), .B(n216), .C(n215), .Y(n289) );
  INVX2 U230 ( .A(int_in[25]), .Y(n218) );
  AOI22X1 U231 ( .A(ext_in[25]), .B(n30), .C(data_out_right[25]), .D(n17), .Y(
        n217) );
  OAI21X1 U232 ( .A(n8), .B(n218), .C(n217), .Y(n288) );
  INVX2 U233 ( .A(data_out_right[26]), .Y(n220) );
  NAND2X1 U234 ( .A(ext_in[26]), .B(n31), .Y(n219) );
  OAI21X1 U235 ( .A(n12), .B(n220), .C(n219), .Y(n221) );
  OAI22X1 U236 ( .A(int_in[26]), .B(n221), .C(n25), .D(n221), .Y(n222) );
  INVX2 U237 ( .A(data_out_right[27]), .Y(n224) );
  NAND2X1 U238 ( .A(ext_in[27]), .B(n31), .Y(n223) );
  OAI21X1 U239 ( .A(n12), .B(n224), .C(n223), .Y(n225) );
  OAI22X1 U240 ( .A(int_in[27]), .B(n225), .C(n25), .D(n225), .Y(n226) );
  INVX2 U241 ( .A(int_in[28]), .Y(n228) );
  AOI22X1 U242 ( .A(ext_in[28]), .B(n30), .C(data_out_right[28]), .D(n16), .Y(
        n227) );
  OAI21X1 U243 ( .A(n9), .B(n228), .C(n227), .Y(n287) );
  INVX2 U244 ( .A(data_out_right[29]), .Y(n230) );
  NAND2X1 U245 ( .A(ext_in[29]), .B(n31), .Y(n229) );
  OAI21X1 U246 ( .A(n12), .B(n230), .C(n229), .Y(n232) );
  OAI22X1 U247 ( .A(n26), .B(n232), .C(int_in[29]), .D(n232), .Y(n234) );
  INVX2 U248 ( .A(int_in[30]), .Y(n236) );
  AOI22X1 U249 ( .A(ext_in[30]), .B(n30), .C(data_out_right[30]), .D(n16), .Y(
        n235) );
  OAI21X1 U250 ( .A(n10), .B(n236), .C(n235), .Y(n286) );
  INVX2 U251 ( .A(int_in[31]), .Y(n239) );
  AOI22X1 U252 ( .A(ext_in[31]), .B(n30), .C(data_out_right[31]), .D(n19), .Y(
        n238) );
  OAI21X1 U253 ( .A(n11), .B(n239), .C(n238), .Y(n285) );
endmodule


module des_controller_1 ( clk, n_rst, data_ready, rw_mode, io_select, 
        next_data, round_number );
  output [1:0] io_select;
  output [4:0] round_number;
  input clk, n_rst, data_ready, rw_mode;
  output next_data;
  wire   n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n116;
  wire   [4:0] state;
  wire   [4:0] nstate;

  DFFSR \state_reg[0]  ( .D(nstate[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[4]  ( .D(nstate[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[4]) );
  DFFSR \state_reg[1]  ( .D(nstate[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        n116) );
  DFFSR \state_reg[3]  ( .D(nstate[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[3]) );
  DFFSR \state_reg[2]  ( .D(nstate[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[2]) );
  INVX1 U8 ( .A(n8), .Y(n27) );
  INVX2 U9 ( .A(state[0]), .Y(n11) );
  INVX1 U10 ( .A(rw_mode), .Y(n33) );
  INVX2 U11 ( .A(n11), .Y(n12) );
  INVX2 U12 ( .A(n47), .Y(n7) );
  INVX2 U13 ( .A(n9), .Y(n87) );
  BUFX4 U14 ( .A(n29), .Y(n6) );
  INVX1 U15 ( .A(state[2]), .Y(n8) );
  INVX1 U16 ( .A(state[2]), .Y(n26) );
  INVX1 U17 ( .A(n28), .Y(n29) );
  INVX2 U18 ( .A(n29), .Y(n105) );
  INVX1 U19 ( .A(n31), .Y(n9) );
  INVX2 U20 ( .A(n28), .Y(n30) );
  INVX2 U21 ( .A(n32), .Y(n10) );
  INVX1 U22 ( .A(n32), .Y(n31) );
  BUFX2 U23 ( .A(state[3]), .Y(n25) );
  OR2X1 U24 ( .A(state[0]), .B(state[3]), .Y(n98) );
  INVX1 U25 ( .A(n27), .Y(n97) );
  INVX1 U26 ( .A(state[3]), .Y(n100) );
  BUFX2 U27 ( .A(n9), .Y(n13) );
  BUFX2 U28 ( .A(n97), .Y(n14) );
  BUFX2 U29 ( .A(n87), .Y(n15) );
  INVX1 U30 ( .A(n11), .Y(n16) );
  INVX2 U31 ( .A(n30), .Y(n17) );
  INVX1 U32 ( .A(n16), .Y(n18) );
  AND2X2 U33 ( .A(n13), .B(n18), .Y(n24) );
  NAND2X1 U34 ( .A(state[3]), .B(n31), .Y(n19) );
  INVX1 U35 ( .A(n26), .Y(n20) );
  AND2X2 U36 ( .A(n100), .B(n97), .Y(n21) );
  XNOR2X1 U37 ( .A(n22), .B(n20), .Y(n81) );
  XNOR2X1 U38 ( .A(n100), .B(n6), .Y(n22) );
  AND2X2 U39 ( .A(n49), .B(n57), .Y(n23) );
  NOR2X1 U40 ( .A(n32), .B(n8), .Y(round_number[2]) );
  INVX4 U41 ( .A(n19), .Y(round_number[3]) );
  BUFX4 U42 ( .A(state[4]), .Y(n32) );
  INVX2 U43 ( .A(n116), .Y(n28) );
  AND2X2 U44 ( .A(n30), .B(n10), .Y(round_number[1]) );
  NAND2X1 U45 ( .A(n100), .B(n87), .Y(n112) );
  NAND3X1 U46 ( .A(n97), .B(n105), .C(n12), .Y(n102) );
  NAND2X1 U47 ( .A(n29), .B(n97), .Y(n75) );
  NAND3X1 U48 ( .A(n100), .B(n87), .C(n11), .Y(n104) );
  NAND2X1 U49 ( .A(n20), .B(n6), .Y(n78) );
  NAND3X1 U50 ( .A(n12), .B(n105), .C(n20), .Y(n34) );
  OAI22X1 U51 ( .A(n104), .B(n78), .C(n112), .D(n34), .Y(n69) );
  NAND3X1 U52 ( .A(n18), .B(n87), .C(n25), .Y(n63) );
  INVX2 U53 ( .A(n63), .Y(n36) );
  NAND2X1 U54 ( .A(n25), .B(n87), .Y(n47) );
  NAND2X1 U55 ( .A(n34), .B(n102), .Y(n35) );
  AOI22X1 U56 ( .A(n36), .B(n6), .C(n7), .D(n35), .Y(n60) );
  INVX2 U57 ( .A(n60), .Y(n37) );
  NOR2X1 U58 ( .A(n69), .B(n37), .Y(n38) );
  OAI21X1 U59 ( .A(n75), .B(n104), .C(n38), .Y(n52) );
  NAND3X1 U60 ( .A(n6), .B(n97), .C(n12), .Y(n40) );
  INVX2 U61 ( .A(n40), .Y(n39) );
  NAND2X1 U62 ( .A(n7), .B(n39), .Y(n55) );
  OAI21X1 U63 ( .A(n112), .B(n40), .C(n55), .Y(n44) );
  NAND2X1 U64 ( .A(n20), .B(n105), .Y(n76) );
  NOR2X1 U65 ( .A(n12), .B(n100), .Y(n42) );
  NOR2X1 U66 ( .A(n6), .B(n13), .Y(n41) );
  NAND3X1 U67 ( .A(n42), .B(n20), .C(n41), .Y(n56) );
  OAI21X1 U68 ( .A(n104), .B(n76), .C(n56), .Y(n43) );
  OR2X2 U69 ( .A(n44), .B(n43), .Y(n68) );
  INVX2 U70 ( .A(n68), .Y(n50) );
  NAND3X1 U71 ( .A(n14), .B(n105), .C(n18), .Y(n46) );
  NAND3X1 U72 ( .A(n100), .B(n87), .C(n12), .Y(n45) );
  OAI22X1 U73 ( .A(n47), .B(n46), .C(n78), .D(n45), .Y(n59) );
  INVX2 U74 ( .A(n59), .Y(n49) );
  NOR2X1 U75 ( .A(n105), .B(n18), .Y(n48) );
  NAND3X1 U76 ( .A(n48), .B(n20), .C(n7), .Y(n57) );
  NAND2X1 U77 ( .A(n50), .B(n23), .Y(n51) );
  MUX2X1 U78 ( .B(n52), .A(n51), .S(rw_mode), .Y(n53) );
  NAND3X1 U79 ( .A(n24), .B(n105), .C(n21), .Y(n113) );
  AND2X2 U80 ( .A(n53), .B(n113), .Y(n54) );
  OAI21X1 U81 ( .A(n112), .B(n102), .C(n54), .Y(nstate[1]) );
  AND2X2 U82 ( .A(n56), .B(n55), .Y(n62) );
  NAND2X1 U83 ( .A(n57), .B(n113), .Y(n58) );
  MUX2X1 U84 ( .B(n59), .A(n58), .S(rw_mode), .Y(n61) );
  NAND3X1 U85 ( .A(n62), .B(n61), .C(n60), .Y(nstate[3]) );
  NOR2X1 U86 ( .A(n18), .B(n14), .Y(n66) );
  NOR2X1 U87 ( .A(n6), .B(n13), .Y(n65) );
  NOR2X1 U88 ( .A(n78), .B(n63), .Y(n64) );
  AOI21X1 U89 ( .A(n66), .B(n65), .C(n64), .Y(n72) );
  NAND2X1 U90 ( .A(n23), .B(n113), .Y(n67) );
  MUX2X1 U91 ( .B(n68), .A(n67), .S(rw_mode), .Y(n71) );
  INVX2 U92 ( .A(n69), .Y(n70) );
  NAND3X1 U93 ( .A(n72), .B(n71), .C(n70), .Y(nstate[2]) );
  INVX2 U94 ( .A(data_ready), .Y(n73) );
  NOR2X1 U95 ( .A(n13), .B(n73), .Y(n74) );
  MUX2X1 U96 ( .B(n74), .A(rw_mode), .S(n12), .Y(n86) );
  INVX2 U97 ( .A(n75), .Y(n101) );
  INVX2 U98 ( .A(n76), .Y(n77) );
  OAI21X1 U99 ( .A(n101), .B(n77), .C(n25), .Y(n79) );
  NAND2X1 U100 ( .A(n79), .B(n78), .Y(n80) );
  INVX2 U101 ( .A(n80), .Y(n91) );
  NAND2X1 U102 ( .A(n91), .B(n81), .Y(n88) );
  INVX2 U103 ( .A(n81), .Y(n89) );
  NAND2X1 U104 ( .A(n89), .B(n15), .Y(n83) );
  NAND2X1 U105 ( .A(n12), .B(n80), .Y(n82) );
  NAND3X1 U106 ( .A(n21), .B(n24), .C(n81), .Y(n96) );
  OAI21X1 U107 ( .A(n83), .B(n82), .C(n96), .Y(n84) );
  NAND2X1 U108 ( .A(n84), .B(n33), .Y(n85) );
  OAI21X1 U109 ( .A(n86), .B(n88), .C(n85), .Y(nstate[4]) );
  OAI21X1 U110 ( .A(data_ready), .B(n88), .C(n15), .Y(n93) );
  NOR2X1 U111 ( .A(rw_mode), .B(n89), .Y(n90) );
  NAND3X1 U112 ( .A(n91), .B(n13), .C(n90), .Y(n92) );
  MUX2X1 U113 ( .B(n93), .A(n92), .S(n12), .Y(n94) );
  INVX2 U114 ( .A(n94), .Y(n95) );
  OAI21X1 U115 ( .A(n96), .B(n33), .C(n95), .Y(nstate[0]) );
  NOR2X1 U116 ( .A(n32), .B(n11), .Y(round_number[0]) );
  NAND3X1 U117 ( .A(n26), .B(n17), .C(n32), .Y(n99) );
  NOR2X1 U118 ( .A(n98), .B(n99), .Y(round_number[4]) );
  NAND3X1 U119 ( .A(n101), .B(n24), .C(n100), .Y(n107) );
  INVX2 U120 ( .A(n107), .Y(next_data) );
  INVX2 U121 ( .A(n102), .Y(n103) );
  NAND2X1 U122 ( .A(n103), .B(n13), .Y(n110) );
  INVX2 U123 ( .A(n104), .Y(n106) );
  NAND2X1 U124 ( .A(n106), .B(n105), .Y(n108) );
  OAI21X1 U125 ( .A(n20), .B(n108), .C(n107), .Y(n111) );
  INVX2 U126 ( .A(n111), .Y(n109) );
  OAI21X1 U127 ( .A(n25), .B(n110), .C(n109), .Y(io_select[0]) );
  NOR2X1 U128 ( .A(n7), .B(n111), .Y(n114) );
  NAND3X1 U129 ( .A(n114), .B(n113), .C(n112), .Y(io_select[1]) );
endmodule


module expansion_1 ( data_in, data_out );
  input [31:0] data_in;
  output [47:0] data_out;
  wire   \data_in[0] , \data_in[31] , \data_in[30] , \data_in[29] ,
         \data_in[28] , \data_in[27] , \data_in[26] , \data_in[25] ,
         \data_in[24] , \data_in[23] , \data_in[22] , \data_in[21] ,
         \data_in[20] , \data_in[19] , \data_in[18] , \data_in[17] ,
         \data_in[16] , \data_in[15] , \data_in[14] , \data_in[13] ,
         \data_in[12] , \data_in[11] , \data_in[10] , \data_in[9] ,
         \data_in[8] , \data_in[7] , \data_in[6] , \data_in[5] , \data_in[4] ,
         \data_in[3] , \data_in[2] , \data_in[1] ;
  assign data_out[1] = \data_in[0] ;
  assign data_out[47] = \data_in[0] ;
  assign \data_in[0]  = data_in[0];
  assign data_out[0] = \data_in[31] ;
  assign data_out[46] = \data_in[31] ;
  assign \data_in[31]  = data_in[31];
  assign data_out[45] = \data_in[30] ;
  assign \data_in[30]  = data_in[30];
  assign data_out[44] = \data_in[29] ;
  assign \data_in[29]  = data_in[29];
  assign data_out[41] = \data_in[28] ;
  assign data_out[43] = \data_in[28] ;
  assign \data_in[28]  = data_in[28];
  assign data_out[40] = \data_in[27] ;
  assign data_out[42] = \data_in[27] ;
  assign \data_in[27]  = data_in[27];
  assign data_out[39] = \data_in[26] ;
  assign \data_in[26]  = data_in[26];
  assign data_out[38] = \data_in[25] ;
  assign \data_in[25]  = data_in[25];
  assign data_out[35] = \data_in[24] ;
  assign data_out[37] = \data_in[24] ;
  assign \data_in[24]  = data_in[24];
  assign data_out[34] = \data_in[23] ;
  assign data_out[36] = \data_in[23] ;
  assign \data_in[23]  = data_in[23];
  assign data_out[33] = \data_in[22] ;
  assign \data_in[22]  = data_in[22];
  assign data_out[32] = \data_in[21] ;
  assign \data_in[21]  = data_in[21];
  assign data_out[29] = \data_in[20] ;
  assign data_out[31] = \data_in[20] ;
  assign \data_in[20]  = data_in[20];
  assign data_out[28] = \data_in[19] ;
  assign data_out[30] = \data_in[19] ;
  assign \data_in[19]  = data_in[19];
  assign data_out[27] = \data_in[18] ;
  assign \data_in[18]  = data_in[18];
  assign data_out[26] = \data_in[17] ;
  assign \data_in[17]  = data_in[17];
  assign data_out[23] = \data_in[16] ;
  assign data_out[25] = \data_in[16] ;
  assign \data_in[16]  = data_in[16];
  assign data_out[22] = \data_in[15] ;
  assign data_out[24] = \data_in[15] ;
  assign \data_in[15]  = data_in[15];
  assign data_out[21] = \data_in[14] ;
  assign \data_in[14]  = data_in[14];
  assign data_out[20] = \data_in[13] ;
  assign \data_in[13]  = data_in[13];
  assign data_out[17] = \data_in[12] ;
  assign data_out[19] = \data_in[12] ;
  assign \data_in[12]  = data_in[12];
  assign data_out[16] = \data_in[11] ;
  assign data_out[18] = \data_in[11] ;
  assign \data_in[11]  = data_in[11];
  assign data_out[15] = \data_in[10] ;
  assign \data_in[10]  = data_in[10];
  assign data_out[14] = \data_in[9] ;
  assign \data_in[9]  = data_in[9];
  assign data_out[11] = \data_in[8] ;
  assign data_out[13] = \data_in[8] ;
  assign \data_in[8]  = data_in[8];
  assign data_out[10] = \data_in[7] ;
  assign data_out[12] = \data_in[7] ;
  assign \data_in[7]  = data_in[7];
  assign data_out[9] = \data_in[6] ;
  assign \data_in[6]  = data_in[6];
  assign data_out[8] = \data_in[5] ;
  assign \data_in[5]  = data_in[5];
  assign data_out[5] = \data_in[4] ;
  assign data_out[7] = \data_in[4] ;
  assign \data_in[4]  = data_in[4];
  assign data_out[4] = \data_in[3] ;
  assign data_out[6] = \data_in[3] ;
  assign \data_in[3]  = data_in[3];
  assign data_out[3] = \data_in[2] ;
  assign \data_in[2]  = data_in[2];
  assign data_out[2] = \data_in[1] ;
  assign \data_in[1]  = data_in[1];

endmodule


module key_permutation1_1 ( k_o, kout );
  input [63:0] k_o;
  output [55:0] kout;
  wire   \k_o[3] , \k_o[11] , \k_o[19] , \k_o[27] , \k_o[4] , \k_o[12] ,
         \k_o[20] , \k_o[28] , \k_o[36] , \k_o[44] , \k_o[52] , \k_o[60] ,
         \k_o[5] , \k_o[13] , \k_o[21] , \k_o[29] , \k_o[37] , \k_o[45] ,
         \k_o[53] , \k_o[61] , \k_o[6] , \k_o[14] , \k_o[22] , \k_o[30] ,
         \k_o[38] , \k_o[46] , \k_o[54] , \k_o[62] , \k_o[35] , \k_o[43] ,
         \k_o[51] , \k_o[59] , \k_o[2] , \k_o[10] , \k_o[18] , \k_o[26] ,
         \k_o[34] , \k_o[42] , \k_o[50] , \k_o[58] , \k_o[1] , \k_o[9] ,
         \k_o[17] , \k_o[25] , \k_o[33] , \k_o[41] , \k_o[49] , \k_o[57] ,
         \k_o[0] , \k_o[8] , \k_o[16] , \k_o[24] , \k_o[32] , \k_o[40] ,
         \k_o[48] , \k_o[56] ;
  assign kout[55] = \k_o[3] ;
  assign \k_o[3]  = k_o[3];
  assign kout[54] = \k_o[11] ;
  assign \k_o[11]  = k_o[11];
  assign kout[53] = \k_o[19] ;
  assign \k_o[19]  = k_o[19];
  assign kout[52] = \k_o[27] ;
  assign \k_o[27]  = k_o[27];
  assign kout[51] = \k_o[4] ;
  assign \k_o[4]  = k_o[4];
  assign kout[50] = \k_o[12] ;
  assign \k_o[12]  = k_o[12];
  assign kout[49] = \k_o[20] ;
  assign \k_o[20]  = k_o[20];
  assign kout[48] = \k_o[28] ;
  assign \k_o[28]  = k_o[28];
  assign kout[47] = \k_o[36] ;
  assign \k_o[36]  = k_o[36];
  assign kout[46] = \k_o[44] ;
  assign \k_o[44]  = k_o[44];
  assign kout[45] = \k_o[52] ;
  assign \k_o[52]  = k_o[52];
  assign kout[44] = \k_o[60] ;
  assign \k_o[60]  = k_o[60];
  assign kout[43] = \k_o[5] ;
  assign \k_o[5]  = k_o[5];
  assign kout[42] = \k_o[13] ;
  assign \k_o[13]  = k_o[13];
  assign kout[41] = \k_o[21] ;
  assign \k_o[21]  = k_o[21];
  assign kout[40] = \k_o[29] ;
  assign \k_o[29]  = k_o[29];
  assign kout[39] = \k_o[37] ;
  assign \k_o[37]  = k_o[37];
  assign kout[38] = \k_o[45] ;
  assign \k_o[45]  = k_o[45];
  assign kout[37] = \k_o[53] ;
  assign \k_o[53]  = k_o[53];
  assign kout[36] = \k_o[61] ;
  assign \k_o[61]  = k_o[61];
  assign kout[35] = \k_o[6] ;
  assign \k_o[6]  = k_o[6];
  assign kout[34] = \k_o[14] ;
  assign \k_o[14]  = k_o[14];
  assign kout[33] = \k_o[22] ;
  assign \k_o[22]  = k_o[22];
  assign kout[32] = \k_o[30] ;
  assign \k_o[30]  = k_o[30];
  assign kout[31] = \k_o[38] ;
  assign \k_o[38]  = k_o[38];
  assign kout[30] = \k_o[46] ;
  assign \k_o[46]  = k_o[46];
  assign kout[29] = \k_o[54] ;
  assign \k_o[54]  = k_o[54];
  assign kout[28] = \k_o[62] ;
  assign \k_o[62]  = k_o[62];
  assign kout[27] = \k_o[35] ;
  assign \k_o[35]  = k_o[35];
  assign kout[26] = \k_o[43] ;
  assign \k_o[43]  = k_o[43];
  assign kout[25] = \k_o[51] ;
  assign \k_o[51]  = k_o[51];
  assign kout[24] = \k_o[59] ;
  assign \k_o[59]  = k_o[59];
  assign kout[23] = \k_o[2] ;
  assign \k_o[2]  = k_o[2];
  assign kout[22] = \k_o[10] ;
  assign \k_o[10]  = k_o[10];
  assign kout[21] = \k_o[18] ;
  assign \k_o[18]  = k_o[18];
  assign kout[20] = \k_o[26] ;
  assign \k_o[26]  = k_o[26];
  assign kout[19] = \k_o[34] ;
  assign \k_o[34]  = k_o[34];
  assign kout[18] = \k_o[42] ;
  assign \k_o[42]  = k_o[42];
  assign kout[17] = \k_o[50] ;
  assign \k_o[50]  = k_o[50];
  assign kout[16] = \k_o[58] ;
  assign \k_o[58]  = k_o[58];
  assign kout[15] = \k_o[1] ;
  assign \k_o[1]  = k_o[1];
  assign kout[14] = \k_o[9] ;
  assign \k_o[9]  = k_o[9];
  assign kout[13] = \k_o[17] ;
  assign \k_o[17]  = k_o[17];
  assign kout[12] = \k_o[25] ;
  assign \k_o[25]  = k_o[25];
  assign kout[11] = \k_o[33] ;
  assign \k_o[33]  = k_o[33];
  assign kout[10] = \k_o[41] ;
  assign \k_o[41]  = k_o[41];
  assign kout[9] = \k_o[49] ;
  assign \k_o[49]  = k_o[49];
  assign kout[8] = \k_o[57] ;
  assign \k_o[57]  = k_o[57];
  assign kout[7] = \k_o[0] ;
  assign \k_o[0]  = k_o[0];
  assign kout[6] = \k_o[8] ;
  assign \k_o[8]  = k_o[8];
  assign kout[5] = \k_o[16] ;
  assign \k_o[16]  = k_o[16];
  assign kout[4] = \k_o[24] ;
  assign \k_o[24]  = k_o[24];
  assign kout[3] = \k_o[32] ;
  assign \k_o[32]  = k_o[32];
  assign kout[2] = \k_o[40] ;
  assign \k_o[40]  = k_o[40];
  assign kout[1] = \k_o[48] ;
  assign \k_o[48]  = k_o[48];
  assign kout[0] = \k_o[56] ;
  assign \k_o[56]  = k_o[56];

endmodule


module key_shift_1 ( kin, k_out, roundSel );
  input [55:0] kin;
  output [55:0] k_out;
  input [4:0] roundSel;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, n301,
         n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312,
         n313, n314, n315, n316, n317, n318, n319, n320, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, n426,
         n427, n428, n431, n432, n433, n434, n435, n436, n437, n438, n439,
         n440, n441, n442, n443, n444, n445, n446, n447, n448, n449, n450,
         n451, n452, n453, n454, n455, n456, n457, n458, n459, n460, n461,
         n462, n463, n464, n465, n466, n467, n468, n469, n470, n471, n472,
         n473, n474, n475, n476, n477, n478, n479, n480, n481, n482, n483,
         n484, n485, n486, n487, n488, n489, n490, n491, n492, n493, n494,
         n495, n496, n497, n498, n499, n500, n501, n502, n503, n504, n505,
         n506, n507, n508, n509, n510, n511, n512, n513, n514, n515, n516,
         n517, n518, n519, n520, n521, n522, n523, n524, n525, n526, n527,
         n528, n529, n530, n531, n532, n533, n534, n535, n536, n537, n538,
         n539, n540, n541, n542, n543, n544, n545, n546, n547, n548, n549,
         n550, n551, n552, n553, n554, n555, n556, n557, n558, n559, n560,
         n563, n564, n565, n566, n567, n568, n569, n570, n571, n572, n573,
         n574, n575, n576, n577, n578, n579, n580, n581, n582, n583, n584,
         n585, n586, n587, n588, n589, n590, n591, n592, n593, n594, n595,
         n596, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633, n634, n635, n636, n637, n638, n639, n640, n641,
         n642, n643, n644, n645, n646, n647, n648, n649, n650, n651, n652,
         n653, n654, n655, n656, n659, n660, n661, n662, n663, n664, n665,
         n666, n667, n668, n669, n670, n671, n672, n673, n674, n675, n676,
         n677, n678, n679, n680, n681, n682, n683, n684, n685, n686, n687,
         n688, n689, n690, n691, n692, n693, n694, n695, n696, n697, n698,
         n699, n700, n701, n702, n703, n704, n705, n706, n707, n708, n709,
         n710, n711, n712, n713, n714, n715, n716, n717, n718, n719, n720,
         n721, n722, n723, n724, n725, n726, n727, n728, n729, n730, n731,
         n732, n733, n734, n735, n736, n737, n738, n739, n740, n741, n742,
         n743, n744, n745, n746, n747, n748, n749, n750, n751, n752, n753,
         n754, n755, n756, n757, n758, n759, n760, n761, n762, n763, n764,
         n765, n766, n767, n768, n769, n770, n771, n772, n773, n774, n775,
         n776, n777, n778, n779, n780, n781, n782, n783, n784, n785, n786,
         n787, n788, n789, n790, n791, n792, n793, n794, n795, n796, n797,
         n798, n799, n800, n801, n802, n803, n804, n805, n806, n807, n808,
         n809, n810, n811, n812, n813, n814, n815, n816, n817, n818, n819,
         n820, n821, n822, n823, n824, n825, n826, n827, n828, n829, n830,
         n831, n832, n833, n834, n835, n836, n837, n838, n839, n840, n841,
         n842, n843, n844, n845, n846, n847, n848, n849, n850, n851, n852,
         n853, n854, n855, n856, n857, n858, n859, n860, n861, n862, n863,
         n864, n865, n866, n867, n868, n869, n870, n871, n872, n873, n874,
         n875, n876, n877, n878, n879, n880, n881, n882, n883, n884, n885,
         n886, n887, n888, n889, n890, n891, n892, n893, n894, n895, n896,
         n897, n898, n899, n900, n901, n902, n903, n904, n905, n906, n907,
         n908, n909, n910, n911, n912, n913, n914, n915, n916, n917, n918,
         n919, n920, n921;

  OR2X2 U2 ( .A(n921), .B(n920), .Y(k_out[8]) );
  OR2X2 U8 ( .A(n919), .B(n918), .Y(k_out[53]) );
  OR2X2 U20 ( .A(n917), .B(n916), .Y(k_out[42]) );
  OR2X2 U26 ( .A(n915), .B(n914), .Y(k_out[37]) );
  OR2X2 U29 ( .A(n913), .B(n912), .Y(k_out[34]) );
  OR2X2 U40 ( .A(n911), .B(n910), .Y(k_out[24]) );
  OR2X2 U43 ( .A(n909), .B(n908), .Y(k_out[21]) );
  OR2X2 U48 ( .A(n907), .B(n906), .Y(k_out[17]) );
  INVX8 U1 ( .A(n125), .Y(n60) );
  INVX2 U3 ( .A(n897), .Y(n46) );
  INVX8 U4 ( .A(n137), .Y(n134) );
  BUFX4 U5 ( .A(n55), .Y(n147) );
  INVX1 U6 ( .A(n27), .Y(n1) );
  BUFX4 U7 ( .A(n92), .Y(n2) );
  BUFX2 U9 ( .A(n92), .Y(n3) );
  BUFX4 U10 ( .A(n92), .Y(n4) );
  BUFX2 U11 ( .A(n885), .Y(n92) );
  INVX8 U12 ( .A(n137), .Y(n5) );
  INVX1 U13 ( .A(n36), .Y(n38) );
  INVX2 U14 ( .A(kin[3]), .Y(n439) );
  INVX8 U15 ( .A(n53), .Y(n61) );
  BUFX2 U16 ( .A(n85), .Y(n6) );
  BUFX2 U17 ( .A(n881), .Y(n85) );
  INVX1 U18 ( .A(n16), .Y(n7) );
  INVX2 U19 ( .A(n125), .Y(n123) );
  INVX2 U21 ( .A(n897), .Y(n125) );
  BUFX2 U22 ( .A(n46), .Y(n124) );
  INVX2 U23 ( .A(n160), .Y(n33) );
  BUFX2 U24 ( .A(n883), .Y(n88) );
  INVX4 U25 ( .A(n90), .Y(n8) );
  INVX8 U27 ( .A(n8), .Y(n9) );
  BUFX2 U28 ( .A(n142), .Y(n10) );
  INVX4 U30 ( .A(n88), .Y(n11) );
  INVX4 U31 ( .A(n11), .Y(n12) );
  INVX1 U32 ( .A(n11), .Y(n13) );
  INVX4 U33 ( .A(n11), .Y(n14) );
  BUFX4 U34 ( .A(n18), .Y(n139) );
  INVX1 U35 ( .A(n102), .Y(n15) );
  NAND2X1 U36 ( .A(n27), .B(n22), .Y(n16) );
  INVX2 U37 ( .A(n40), .Y(n39) );
  INVX2 U38 ( .A(n151), .Y(n26) );
  AND2X1 U39 ( .A(n150), .B(roundSel[2]), .Y(n19) );
  INVX2 U41 ( .A(n144), .Y(n37) );
  INVX2 U42 ( .A(n131), .Y(n17) );
  AND2X2 U44 ( .A(n58), .B(n165), .Y(n18) );
  BUFX4 U45 ( .A(n18), .Y(n136) );
  BUFX4 U46 ( .A(n52), .Y(n137) );
  INVX1 U47 ( .A(n136), .Y(n20) );
  INVX8 U49 ( .A(n139), .Y(n21) );
  INVX2 U50 ( .A(roundSel[1]), .Y(n22) );
  INVX1 U51 ( .A(roundSel[1]), .Y(n150) );
  INVX4 U52 ( .A(n124), .Y(n28) );
  INVX4 U53 ( .A(n513), .Y(n23) );
  INVX1 U54 ( .A(n110), .Y(n24) );
  INVX2 U55 ( .A(n513), .Y(n894) );
  INVX1 U56 ( .A(n126), .Y(n25) );
  INVX2 U57 ( .A(roundSel[2]), .Y(n27) );
  INVX1 U58 ( .A(n148), .Y(n29) );
  INVX1 U59 ( .A(n148), .Y(n165) );
  INVX1 U60 ( .A(n48), .Y(n30) );
  NOR2X1 U61 ( .A(roundSel[0]), .B(roundSel[3]), .Y(n54) );
  BUFX2 U62 ( .A(n162), .Y(n49) );
  BUFX4 U63 ( .A(n104), .Y(n101) );
  BUFX4 U64 ( .A(n104), .Y(n103) );
  AND2X2 U65 ( .A(roundSel[0]), .B(n160), .Y(n58) );
  BUFX2 U66 ( .A(n123), .Y(n31) );
  INVX1 U67 ( .A(n148), .Y(n32) );
  INVX8 U68 ( .A(n60), .Y(n635) );
  AND2X2 U69 ( .A(n152), .B(roundSel[3]), .Y(n34) );
  INVX4 U70 ( .A(n56), .Y(n59) );
  AND2X2 U71 ( .A(n22), .B(n27), .Y(n35) );
  INVX4 U72 ( .A(n144), .Y(n36) );
  BUFX4 U73 ( .A(n55), .Y(n146) );
  BUFX4 U74 ( .A(n55), .Y(n144) );
  OR2X2 U75 ( .A(n667), .B(n668), .Y(k_out[46]) );
  BUFX4 U76 ( .A(n104), .Y(n102) );
  BUFX2 U77 ( .A(n46), .Y(n40) );
  INVX4 U78 ( .A(n132), .Y(n126) );
  AND2X2 U79 ( .A(n32), .B(n34), .Y(n41) );
  INVX1 U80 ( .A(n41), .Y(n517) );
  BUFX4 U81 ( .A(n45), .Y(n132) );
  INVX2 U82 ( .A(n138), .Y(n42) );
  NAND2X1 U83 ( .A(n145), .B(kin[1]), .Y(n50) );
  INVX4 U84 ( .A(n144), .Y(n143) );
  INVX1 U85 ( .A(n132), .Y(n43) );
  INVX4 U86 ( .A(n132), .Y(n44) );
  AND2X2 U87 ( .A(n54), .B(n29), .Y(n45) );
  AND2X2 U88 ( .A(roundSel[3]), .B(roundSel[0]), .Y(n57) );
  INVX4 U89 ( .A(roundSel[3]), .Y(n160) );
  BUFX4 U90 ( .A(n55), .Y(n145) );
  BUFX2 U91 ( .A(roundSel[1]), .Y(n47) );
  AND2X2 U92 ( .A(n19), .B(n162), .Y(n164) );
  BUFX2 U93 ( .A(roundSel[4]), .Y(n48) );
  INVX8 U94 ( .A(n102), .Y(n97) );
  INVX8 U95 ( .A(n101), .Y(n95) );
  OR2X1 U96 ( .A(n42), .B(n439), .Y(n51) );
  NAND2X1 U97 ( .A(n51), .B(n50), .Y(n254) );
  INVX8 U98 ( .A(n136), .Y(n133) );
  INVX8 U99 ( .A(n146), .Y(n140) );
  INVX8 U100 ( .A(n147), .Y(n141) );
  INVX8 U101 ( .A(n103), .Y(n96) );
  INVX4 U102 ( .A(n130), .Y(n129) );
  BUFX4 U103 ( .A(n45), .Y(n130) );
  INVX4 U104 ( .A(n103), .Y(n98) );
  INVX8 U105 ( .A(n145), .Y(n142) );
  BUFX2 U106 ( .A(n56), .Y(n117) );
  BUFX2 U107 ( .A(n878), .Y(n76) );
  BUFX2 U108 ( .A(n41), .Y(n71) );
  BUFX2 U109 ( .A(n879), .Y(n81) );
  INVX2 U110 ( .A(n138), .Y(n135) );
  BUFX2 U111 ( .A(n52), .Y(n138) );
  BUFX2 U112 ( .A(n883), .Y(n90) );
  BUFX2 U113 ( .A(n877), .Y(n66) );
  BUFX2 U114 ( .A(n893), .Y(n109) );
  BUFX2 U115 ( .A(n895), .Y(n122) );
  AND2X2 U116 ( .A(n58), .B(n165), .Y(n52) );
  AND2X2 U117 ( .A(n180), .B(n181), .Y(n53) );
  AND2X2 U118 ( .A(n54), .B(n164), .Y(n55) );
  AND2X2 U119 ( .A(n58), .B(n26), .Y(n56) );
  INVX2 U120 ( .A(n887), .Y(n104) );
  INVX2 U121 ( .A(kin[41]), .Y(n850) );
  INVX2 U122 ( .A(kin[27]), .Y(n798) );
  INVX2 U123 ( .A(kin[52]), .Y(n868) );
  INVX2 U124 ( .A(kin[50]), .Y(n749) );
  INVX2 U125 ( .A(kin[39]), .Y(n815) );
  INVX2 U126 ( .A(kin[44]), .Y(n710) );
  INVX2 U127 ( .A(kin[15]), .Y(n791) );
  INVX2 U128 ( .A(kin[6]), .Y(n898) );
  INVX2 U129 ( .A(kin[2]), .Y(n900) );
  INVX2 U130 ( .A(kin[22]), .Y(n807) );
  BUFX4 U131 ( .A(n877), .Y(n62) );
  BUFX4 U132 ( .A(n877), .Y(n63) );
  BUFX4 U133 ( .A(n877), .Y(n64) );
  BUFX4 U134 ( .A(n877), .Y(n65) );
  BUFX4 U135 ( .A(n41), .Y(n67) );
  BUFX4 U136 ( .A(n41), .Y(n68) );
  BUFX4 U137 ( .A(n41), .Y(n69) );
  BUFX4 U138 ( .A(n41), .Y(n70) );
  BUFX4 U139 ( .A(n878), .Y(n72) );
  BUFX4 U140 ( .A(n878), .Y(n73) );
  BUFX4 U141 ( .A(n878), .Y(n74) );
  BUFX4 U142 ( .A(n878), .Y(n75) );
  BUFX4 U143 ( .A(n879), .Y(n77) );
  BUFX4 U144 ( .A(n879), .Y(n78) );
  BUFX4 U145 ( .A(n879), .Y(n79) );
  BUFX4 U146 ( .A(n879), .Y(n80) );
  BUFX4 U147 ( .A(n881), .Y(n82) );
  BUFX4 U148 ( .A(n881), .Y(n83) );
  BUFX4 U149 ( .A(n881), .Y(n84) );
  BUFX4 U150 ( .A(n883), .Y(n86) );
  BUFX4 U151 ( .A(n883), .Y(n87) );
  BUFX4 U152 ( .A(n883), .Y(n89) );
  BUFX4 U153 ( .A(n885), .Y(n91) );
  BUFX4 U154 ( .A(n885), .Y(n93) );
  BUFX4 U155 ( .A(n885), .Y(n94) );
  BUFX4 U156 ( .A(n893), .Y(n105) );
  BUFX4 U157 ( .A(n893), .Y(n106) );
  BUFX4 U158 ( .A(n893), .Y(n107) );
  BUFX4 U159 ( .A(n893), .Y(n108) );
  BUFX4 U160 ( .A(n894), .Y(n110) );
  BUFX4 U161 ( .A(n894), .Y(n111) );
  BUFX4 U162 ( .A(n894), .Y(n112) );
  BUFX4 U163 ( .A(n894), .Y(n113) );
  BUFX4 U164 ( .A(n56), .Y(n114) );
  BUFX4 U165 ( .A(n56), .Y(n115) );
  BUFX4 U166 ( .A(n56), .Y(n116) );
  BUFX4 U167 ( .A(n895), .Y(n118) );
  BUFX4 U168 ( .A(n895), .Y(n119) );
  BUFX4 U169 ( .A(n895), .Y(n120) );
  BUFX4 U170 ( .A(n895), .Y(n121) );
  INVX8 U171 ( .A(n130), .Y(n127) );
  INVX8 U172 ( .A(n131), .Y(n128) );
  BUFX4 U173 ( .A(n45), .Y(n131) );
  INVX2 U174 ( .A(roundSel[4]), .Y(n162) );
  NAND3X1 U175 ( .A(n162), .B(n27), .C(n47), .Y(n148) );
  INVX2 U176 ( .A(roundSel[0]), .Y(n152) );
  NAND2X1 U177 ( .A(n27), .B(n22), .Y(n163) );
  NAND3X1 U178 ( .A(n7), .B(n30), .C(n57), .Y(n149) );
  INVX2 U179 ( .A(n149), .Y(n877) );
  AOI22X1 U180 ( .A(kin[11]), .B(n67), .C(kin[13]), .D(n62), .Y(n157) );
  NAND2X1 U181 ( .A(n164), .B(n34), .Y(n519) );
  INVX2 U182 ( .A(n519), .Y(n879) );
  NAND2X1 U183 ( .A(n57), .B(n32), .Y(n518) );
  INVX2 U184 ( .A(n518), .Y(n878) );
  AOI22X1 U185 ( .A(n81), .B(kin[7]), .C(kin[9]), .D(n72), .Y(n156) );
  NAND3X1 U186 ( .A(n162), .B(n1), .C(n47), .Y(n151) );
  NAND2X1 U187 ( .A(n26), .B(n34), .Y(n883) );
  NAND2X1 U188 ( .A(n164), .B(n57), .Y(n881) );
  INVX2 U189 ( .A(kin[5]), .Y(n290) );
  OAI22X1 U190 ( .A(n89), .B(n439), .C(n82), .D(n290), .Y(n154) );
  INVX2 U191 ( .A(kin[0]), .Y(n452) );
  NAND3X1 U192 ( .A(n35), .B(n48), .C(n54), .Y(n887) );
  NAND2X1 U193 ( .A(n26), .B(n57), .Y(n885) );
  INVX2 U194 ( .A(kin[1]), .Y(n797) );
  OAI22X1 U195 ( .A(n452), .B(n95), .C(n94), .D(n797), .Y(n153) );
  NOR2X1 U196 ( .A(n154), .B(n153), .Y(n155) );
  NAND3X1 U197 ( .A(n157), .B(n156), .C(n155), .Y(n172) );
  NAND2X1 U198 ( .A(n26), .B(n54), .Y(n513) );
  NAND2X1 U199 ( .A(n164), .B(n58), .Y(n158) );
  INVX2 U200 ( .A(n158), .Y(n893) );
  AOI22X1 U201 ( .A(kin[18]), .B(n23), .C(kin[20]), .D(n105), .Y(n170) );
  NAND3X1 U202 ( .A(n35), .B(n34), .C(n49), .Y(n159) );
  INVX2 U203 ( .A(n159), .Y(n895) );
  AOI22X1 U204 ( .A(kin[14]), .B(n119), .C(kin[16]), .D(n114), .Y(n169) );
  INVX2 U205 ( .A(kin[26]), .Y(n782) );
  NOR2X1 U206 ( .A(roundSel[0]), .B(n163), .Y(n161) );
  NAND3X1 U207 ( .A(n48), .B(n160), .C(n161), .Y(n181) );
  OAI21X1 U208 ( .A(n16), .B(n33), .C(n49), .Y(n180) );
  NAND2X1 U209 ( .A(n181), .B(n180), .Y(n897) );
  OAI22X1 U210 ( .A(n782), .B(n44), .C(n28), .D(n798), .Y(n167) );
  INVX2 U211 ( .A(kin[24]), .Y(n800) );
  OAI22X1 U212 ( .A(n807), .B(n37), .C(n800), .D(n133), .Y(n166) );
  NOR2X1 U213 ( .A(n167), .B(n166), .Y(n168) );
  NAND3X1 U214 ( .A(n170), .B(n169), .C(n168), .Y(n171) );
  OR2X2 U215 ( .A(n172), .B(n171), .Y(k_out[0]) );
  AOI22X1 U216 ( .A(kin[12]), .B(n69), .C(kin[14]), .D(n65), .Y(n179) );
  AOI22X1 U217 ( .A(kin[8]), .B(n80), .C(kin[10]), .D(n74), .Y(n176) );
  INVX2 U218 ( .A(kin[4]), .Y(n899) );
  OAI22X1 U219 ( .A(n899), .B(n86), .C(n898), .D(n83), .Y(n174) );
  OAI22X1 U220 ( .A(n96), .B(n797), .C(n900), .D(n4), .Y(n173) );
  NOR2X1 U221 ( .A(n174), .B(n173), .Y(n175) );
  NAND3X1 U222 ( .A(n179), .B(n176), .C(n175), .Y(n188) );
  AOI22X1 U223 ( .A(n635), .B(kin[0]), .C(kin[19]), .D(n111), .Y(n186) );
  AOI22X1 U224 ( .A(kin[21]), .B(n109), .C(kin[15]), .D(n118), .Y(n185) );
  INVX2 U225 ( .A(kin[23]), .Y(n806) );
  OAI22X1 U226 ( .A(n126), .B(n798), .C(n36), .D(n806), .Y(n183) );
  INVX2 U227 ( .A(kin[25]), .Y(n799) );
  INVX2 U228 ( .A(kin[17]), .Y(n790) );
  OAI22X1 U229 ( .A(n135), .B(n799), .C(n59), .D(n790), .Y(n182) );
  NOR2X1 U230 ( .A(n183), .B(n182), .Y(n184) );
  NAND3X1 U231 ( .A(n186), .B(n185), .C(n184), .Y(n187) );
  OR2X2 U232 ( .A(n188), .B(n187), .Y(k_out[1]) );
  AOI22X1 U233 ( .A(kin[13]), .B(n70), .C(kin[15]), .D(n65), .Y(n193) );
  AOI22X1 U234 ( .A(kin[9]), .B(n80), .C(kin[11]), .D(n75), .Y(n192) );
  INVX2 U235 ( .A(kin[7]), .Y(n896) );
  OAI22X1 U236 ( .A(n86), .B(n290), .C(n896), .D(n83), .Y(n190) );
  OAI22X1 U237 ( .A(n900), .B(n98), .C(n93), .D(n439), .Y(n189) );
  NOR2X1 U238 ( .A(n190), .B(n189), .Y(n191) );
  NAND3X1 U239 ( .A(n193), .B(n192), .C(n191), .Y(n200) );
  AOI22X1 U240 ( .A(kin[20]), .B(n23), .C(kin[22]), .D(n108), .Y(n198) );
  AOI22X1 U241 ( .A(kin[16]), .B(n122), .C(kin[18]), .D(n116), .Y(n197) );
  OAI22X1 U242 ( .A(n452), .B(n126), .C(n60), .D(n797), .Y(n195) );
  OAI22X1 U243 ( .A(n800), .B(n142), .C(n782), .D(n133), .Y(n194) );
  NOR2X1 U244 ( .A(n195), .B(n194), .Y(n196) );
  NAND3X1 U245 ( .A(n198), .B(n197), .C(n196), .Y(n199) );
  OR2X2 U246 ( .A(n200), .B(n199), .Y(k_out[2]) );
  AOI22X1 U247 ( .A(kin[14]), .B(n70), .C(kin[16]), .D(n65), .Y(n205) );
  AOI22X1 U248 ( .A(kin[10]), .B(n80), .C(kin[12]), .D(n75), .Y(n204) );
  INVX2 U249 ( .A(kin[8]), .Y(n886) );
  OAI22X1 U250 ( .A(n898), .B(n87), .C(n886), .D(n82), .Y(n202) );
  OAI22X1 U251 ( .A(n98), .B(n439), .C(n899), .D(n94), .Y(n201) );
  NOR2X1 U252 ( .A(n202), .B(n201), .Y(n203) );
  NAND3X1 U253 ( .A(n205), .B(n204), .C(n203), .Y(n212) );
  AOI22X1 U254 ( .A(kin[21]), .B(n110), .C(kin[23]), .D(n108), .Y(n210) );
  AOI22X1 U255 ( .A(kin[17]), .B(n122), .C(kin[19]), .D(n114), .Y(n209) );
  OAI22X1 U256 ( .A(n128), .B(n797), .C(n900), .D(n61), .Y(n207) );
  OAI22X1 U257 ( .A(n143), .B(n799), .C(n21), .D(n798), .Y(n206) );
  NOR2X1 U258 ( .A(n206), .B(n207), .Y(n208) );
  NAND3X1 U259 ( .A(n210), .B(n209), .C(n208), .Y(n211) );
  OR2X2 U260 ( .A(n212), .B(n211), .Y(k_out[3]) );
  AOI22X1 U261 ( .A(kin[15]), .B(n70), .C(kin[17]), .D(n65), .Y(n217) );
  AOI22X1 U262 ( .A(kin[11]), .B(n80), .C(kin[13]), .D(n75), .Y(n216) );
  INVX2 U263 ( .A(kin[9]), .Y(n884) );
  OAI22X1 U264 ( .A(n896), .B(n9), .C(n884), .D(n82), .Y(n214) );
  OAI22X1 U265 ( .A(n899), .B(n97), .C(n93), .D(n290), .Y(n213) );
  NOR2X1 U266 ( .A(n213), .B(n214), .Y(n215) );
  NAND3X1 U267 ( .A(n217), .B(n216), .C(n215), .Y(n224) );
  AOI22X1 U268 ( .A(kin[22]), .B(n113), .C(kin[24]), .D(n108), .Y(n222) );
  AOI22X1 U269 ( .A(kin[18]), .B(n122), .C(kin[20]), .D(n115), .Y(n221) );
  OAI22X1 U270 ( .A(n900), .B(n126), .C(n61), .D(n439), .Y(n219) );
  OAI22X1 U271 ( .A(n782), .B(n140), .C(n452), .D(n133), .Y(n218) );
  NOR2X1 U272 ( .A(n219), .B(n218), .Y(n220) );
  NAND3X1 U273 ( .A(n222), .B(n221), .C(n220), .Y(n223) );
  OR2X2 U274 ( .A(n224), .B(n223), .Y(k_out[4]) );
  AOI22X1 U275 ( .A(kin[16]), .B(n70), .C(kin[18]), .D(n65), .Y(n229) );
  AOI22X1 U276 ( .A(kin[12]), .B(n79), .C(kin[14]), .D(n74), .Y(n228) );
  INVX2 U277 ( .A(kin[10]), .Y(n353) );
  OAI22X1 U278 ( .A(n89), .B(n886), .C(n85), .D(n353), .Y(n226) );
  OAI22X1 U279 ( .A(n98), .B(n290), .C(n898), .D(n2), .Y(n225) );
  NOR2X1 U280 ( .A(n226), .B(n225), .Y(n227) );
  NAND3X1 U281 ( .A(n229), .B(n228), .C(n227), .Y(n236) );
  AOI22X1 U282 ( .A(kin[23]), .B(n111), .C(kin[25]), .D(n107), .Y(n234) );
  AOI22X1 U283 ( .A(kin[19]), .B(n121), .C(kin[21]), .D(n115), .Y(n233) );
  OAI22X1 U284 ( .A(n129), .B(n439), .C(n899), .D(n28), .Y(n231) );
  OAI22X1 U285 ( .A(n140), .B(n798), .C(n21), .D(n797), .Y(n230) );
  NOR2X1 U286 ( .A(n231), .B(n230), .Y(n232) );
  NAND3X1 U287 ( .A(n234), .B(n233), .C(n232), .Y(n235) );
  OR2X2 U288 ( .A(n236), .B(n235), .Y(k_out[5]) );
  AOI22X1 U289 ( .A(kin[17]), .B(n70), .C(n65), .D(kin[19]), .Y(n241) );
  AOI22X1 U290 ( .A(kin[13]), .B(n79), .C(n75), .D(kin[15]), .Y(n240) );
  INVX2 U291 ( .A(kin[11]), .Y(n882) );
  OAI22X1 U292 ( .A(n884), .B(n14), .C(n85), .D(n882), .Y(n238) );
  OAI22X1 U293 ( .A(n898), .B(n95), .C(n896), .D(n94), .Y(n237) );
  NOR2X1 U294 ( .A(n238), .B(n237), .Y(n239) );
  NAND3X1 U295 ( .A(n241), .B(n240), .C(n239), .Y(n248) );
  AOI22X1 U296 ( .A(n635), .B(kin[5]), .C(kin[24]), .D(n110), .Y(n246) );
  AOI22X1 U297 ( .A(n109), .B(kin[26]), .C(kin[20]), .D(n118), .Y(n245) );
  OAI22X1 U298 ( .A(n899), .B(n44), .C(n452), .D(n37), .Y(n243) );
  OAI22X1 U299 ( .A(n135), .B(n900), .C(n807), .D(n59), .Y(n242) );
  NOR2X1 U300 ( .A(n243), .B(n242), .Y(n244) );
  NAND3X1 U301 ( .A(n246), .B(n245), .C(n244), .Y(n247) );
  OR2X2 U302 ( .A(n248), .B(n247), .Y(k_out[6]) );
  AOI22X1 U303 ( .A(kin[18]), .B(n70), .C(kin[20]), .D(n65), .Y(n253) );
  AOI22X1 U304 ( .A(kin[14]), .B(n80), .C(kin[16]), .D(n74), .Y(n252) );
  INVX2 U305 ( .A(kin[12]), .Y(n366) );
  OAI22X1 U306 ( .A(n86), .B(n353), .C(n83), .D(n366), .Y(n250) );
  OAI22X1 U307 ( .A(n896), .B(n98), .C(n91), .D(n886), .Y(n249) );
  NOR2X1 U308 ( .A(n249), .B(n250), .Y(n251) );
  NAND3X1 U309 ( .A(n253), .B(n252), .C(n251), .Y(n260) );
  AOI22X1 U310 ( .A(kin[25]), .B(n113), .C(kin[27]), .D(n107), .Y(n258) );
  AOI22X1 U311 ( .A(kin[21]), .B(n121), .C(kin[23]), .D(n116), .Y(n257) );
  OAI22X1 U312 ( .A(n128), .B(n290), .C(n898), .D(n61), .Y(n255) );
  NOR2X1 U313 ( .A(n255), .B(n254), .Y(n256) );
  NAND3X1 U314 ( .A(n258), .B(n257), .C(n256), .Y(n259) );
  OR2X2 U315 ( .A(n259), .B(n260), .Y(k_out[7]) );
  AOI22X1 U316 ( .A(kin[20]), .B(n69), .C(n65), .D(kin[22]), .Y(n265) );
  AOI22X1 U317 ( .A(kin[16]), .B(n79), .C(kin[18]), .D(n75), .Y(n264) );
  INVX2 U318 ( .A(kin[14]), .Y(n391) );
  OAI22X1 U319 ( .A(n86), .B(n366), .C(n83), .D(n391), .Y(n262) );
  OAI22X1 U320 ( .A(n884), .B(n97), .C(n94), .D(n353), .Y(n261) );
  NOR2X1 U321 ( .A(n262), .B(n261), .Y(n263) );
  NAND3X1 U322 ( .A(n265), .B(n264), .C(n263), .Y(n272) );
  AOI22X1 U323 ( .A(kin[27]), .B(n23), .C(kin[1]), .D(n108), .Y(n270) );
  AOI22X1 U324 ( .A(kin[23]), .B(n121), .C(kin[25]), .D(n116), .Y(n269) );
  OAI22X1 U325 ( .A(n44), .B(n896), .C(n61), .D(n886), .Y(n267) );
  OAI22X1 U326 ( .A(n141), .B(n439), .C(n133), .D(n290), .Y(n266) );
  NOR2X1 U327 ( .A(n267), .B(n266), .Y(n268) );
  NAND3X1 U328 ( .A(n270), .B(n269), .C(n268), .Y(n271) );
  OR2X2 U329 ( .A(n272), .B(n271), .Y(k_out[9]) );
  AOI22X1 U330 ( .A(kin[21]), .B(n70), .C(kin[23]), .D(n64), .Y(n277) );
  AOI22X1 U331 ( .A(kin[17]), .B(n80), .C(n76), .D(kin[19]), .Y(n276) );
  INVX2 U332 ( .A(kin[13]), .Y(n880) );
  OAI22X1 U333 ( .A(n880), .B(n9), .C(n791), .D(n83), .Y(n274) );
  OAI22X1 U334 ( .A(n98), .B(n353), .C(n2), .D(n882), .Y(n273) );
  NOR2X1 U335 ( .A(n273), .B(n274), .Y(n275) );
  NAND3X1 U336 ( .A(n277), .B(n276), .C(n275), .Y(n284) );
  AOI22X1 U337 ( .A(kin[0]), .B(n113), .C(kin[2]), .D(n107), .Y(n282) );
  AOI22X1 U338 ( .A(kin[24]), .B(n121), .C(n114), .D(kin[26]), .Y(n281) );
  OAI22X1 U339 ( .A(n129), .B(n886), .C(n61), .D(n884), .Y(n279) );
  OAI22X1 U340 ( .A(n899), .B(n140), .C(n5), .D(n898), .Y(n278) );
  NOR2X1 U341 ( .A(n279), .B(n278), .Y(n280) );
  NAND3X1 U342 ( .A(n282), .B(n281), .C(n280), .Y(n283) );
  OR2X2 U343 ( .A(n284), .B(n283), .Y(k_out[10]) );
  AOI22X1 U344 ( .A(n71), .B(kin[22]), .C(n65), .D(kin[24]), .Y(n289) );
  AOI22X1 U345 ( .A(kin[18]), .B(n79), .C(kin[20]), .D(n75), .Y(n288) );
  INVX2 U346 ( .A(kin[16]), .Y(n776) );
  OAI22X1 U347 ( .A(n86), .B(n391), .C(n83), .D(n776), .Y(n286) );
  OAI22X1 U348 ( .A(n98), .B(n882), .C(n91), .D(n366), .Y(n285) );
  NOR2X1 U349 ( .A(n285), .B(n286), .Y(n287) );
  NAND3X1 U350 ( .A(n289), .B(n288), .C(n287), .Y(n297) );
  AOI22X1 U351 ( .A(n635), .B(kin[10]), .C(kin[1]), .D(n112), .Y(n295) );
  AOI22X1 U352 ( .A(kin[3]), .B(n108), .C(kin[25]), .D(n118), .Y(n294) );
  OAI22X1 U353 ( .A(n128), .B(n884), .C(n141), .D(n290), .Y(n292) );
  OAI22X1 U354 ( .A(n21), .B(n896), .C(n59), .D(n798), .Y(n291) );
  NOR2X1 U355 ( .A(n291), .B(n292), .Y(n293) );
  NAND3X1 U356 ( .A(n295), .B(n294), .C(n293), .Y(n296) );
  OR2X2 U357 ( .A(n296), .B(n297), .Y(k_out[11]) );
  AOI22X1 U358 ( .A(kin[23]), .B(n70), .C(kin[25]), .D(n65), .Y(n302) );
  AOI22X1 U359 ( .A(n80), .B(kin[19]), .C(n76), .D(kin[21]), .Y(n301) );
  OAI22X1 U360 ( .A(n791), .B(n87), .C(n790), .D(n82), .Y(n299) );
  OAI22X1 U361 ( .A(n97), .B(n366), .C(n93), .D(n880), .Y(n298) );
  NOR2X1 U362 ( .A(n299), .B(n298), .Y(n300) );
  NAND3X1 U363 ( .A(n302), .B(n301), .C(n300), .Y(n309) );
  AOI22X1 U364 ( .A(kin[2]), .B(n110), .C(kin[4]), .D(n107), .Y(n307) );
  AOI22X1 U365 ( .A(n122), .B(kin[26]), .C(n114), .D(kin[0]), .Y(n306) );
  OAI22X1 U366 ( .A(n128), .B(n353), .C(n882), .D(n61), .Y(n304) );
  OAI22X1 U367 ( .A(n142), .B(n898), .C(n5), .D(n886), .Y(n303) );
  NOR2X1 U368 ( .A(n304), .B(n303), .Y(n305) );
  NAND3X1 U369 ( .A(n307), .B(n306), .C(n305), .Y(n308) );
  OR2X2 U370 ( .A(n309), .B(n308), .Y(k_out[12]) );
  AOI22X1 U371 ( .A(n71), .B(kin[24]), .C(n66), .D(kin[26]), .Y(n314) );
  AOI22X1 U372 ( .A(kin[20]), .B(n79), .C(n75), .D(kin[22]), .Y(n313) );
  INVX2 U373 ( .A(kin[18]), .Y(n809) );
  OAI22X1 U374 ( .A(n9), .B(n776), .C(n84), .D(n809), .Y(n311) );
  OAI22X1 U375 ( .A(n97), .B(n880), .C(n94), .D(n391), .Y(n310) );
  NOR2X1 U376 ( .A(n311), .B(n310), .Y(n312) );
  NAND3X1 U377 ( .A(n314), .B(n313), .C(n312), .Y(n323) );
  AOI22X1 U378 ( .A(kin[3]), .B(n113), .C(kin[5]), .D(n108), .Y(n319) );
  AOI22X1 U379 ( .A(kin[27]), .B(n121), .C(kin[1]), .D(n117), .Y(n318) );
  OAI22X1 U380 ( .A(n128), .B(n882), .C(n61), .D(n366), .Y(n316) );
  OAI22X1 U381 ( .A(n140), .B(n896), .C(n21), .D(n884), .Y(n315) );
  NOR2X1 U382 ( .A(n315), .B(n316), .Y(n317) );
  NAND3X1 U383 ( .A(n319), .B(n318), .C(n317), .Y(n320) );
  OR2X2 U384 ( .A(n323), .B(n320), .Y(k_out[13]) );
  AOI22X1 U385 ( .A(kin[25]), .B(n69), .C(kin[27]), .D(n64), .Y(n328) );
  AOI22X1 U386 ( .A(n80), .B(kin[21]), .C(kin[23]), .D(n74), .Y(n327) );
  INVX2 U387 ( .A(kin[19]), .Y(n789) );
  OAI22X1 U388 ( .A(n790), .B(n14), .C(n789), .D(n83), .Y(n325) );
  OAI22X1 U389 ( .A(n97), .B(n391), .C(n791), .D(n4), .Y(n324) );
  NOR2X1 U390 ( .A(n325), .B(n324), .Y(n326) );
  NAND3X1 U391 ( .A(n328), .B(n327), .C(n326), .Y(n335) );
  AOI22X1 U392 ( .A(kin[13]), .B(n40), .C(kin[4]), .D(n112), .Y(n333) );
  AOI22X1 U393 ( .A(kin[6]), .B(n109), .C(n118), .D(kin[0]), .Y(n332) );
  OAI22X1 U394 ( .A(n129), .B(n366), .C(n140), .D(n886), .Y(n330) );
  OAI22X1 U395 ( .A(n134), .B(n353), .C(n59), .D(n900), .Y(n329) );
  NOR2X1 U396 ( .A(n330), .B(n329), .Y(n331) );
  NAND3X1 U397 ( .A(n333), .B(n332), .C(n331), .Y(n334) );
  OR2X2 U398 ( .A(n335), .B(n334), .Y(k_out[14]) );
  AOI22X1 U399 ( .A(n70), .B(kin[26]), .C(n66), .D(kin[0]), .Y(n340) );
  AOI22X1 U400 ( .A(n80), .B(kin[22]), .C(n75), .D(kin[24]), .Y(n339) );
  INVX2 U401 ( .A(kin[20]), .Y(n808) );
  OAI22X1 U402 ( .A(n86), .B(n809), .C(n85), .D(n808), .Y(n337) );
  OAI22X1 U403 ( .A(n791), .B(n97), .C(n93), .D(n776), .Y(n336) );
  NOR2X1 U404 ( .A(n337), .B(n336), .Y(n338) );
  NAND3X1 U405 ( .A(n340), .B(n339), .C(n338), .Y(n347) );
  AOI22X1 U406 ( .A(kin[5]), .B(n23), .C(kin[7]), .D(n107), .Y(n345) );
  AOI22X1 U407 ( .A(kin[1]), .B(n121), .C(kin[3]), .D(n117), .Y(n344) );
  OAI22X1 U408 ( .A(n129), .B(n880), .C(n61), .D(n391), .Y(n342) );
  OAI22X1 U409 ( .A(n140), .B(n884), .C(n5), .D(n882), .Y(n341) );
  NOR2X1 U410 ( .A(n342), .B(n341), .Y(n343) );
  NAND3X1 U411 ( .A(n345), .B(n344), .C(n343), .Y(n346) );
  OR2X2 U412 ( .A(n347), .B(n346), .Y(k_out[15]) );
  AOI22X1 U413 ( .A(kin[27]), .B(n69), .C(kin[1]), .D(n64), .Y(n352) );
  AOI22X1 U414 ( .A(kin[23]), .B(n79), .C(kin[25]), .D(n74), .Y(n351) );
  INVX2 U415 ( .A(kin[21]), .Y(n783) );
  OAI22X1 U416 ( .A(n789), .B(n89), .C(n783), .D(n84), .Y(n349) );
  OAI22X1 U417 ( .A(n97), .B(n776), .C(n790), .D(n2), .Y(n348) );
  NOR2X1 U418 ( .A(n348), .B(n349), .Y(n350) );
  NAND3X1 U419 ( .A(n352), .B(n351), .C(n350), .Y(n360) );
  AOI22X1 U420 ( .A(kin[6]), .B(n113), .C(kin[8]), .D(n107), .Y(n358) );
  AOI22X1 U421 ( .A(kin[2]), .B(n121), .C(kin[4]), .D(n115), .Y(n357) );
  OAI22X1 U422 ( .A(n128), .B(n391), .C(n791), .D(n61), .Y(n355) );
  OAI22X1 U423 ( .A(n141), .B(n353), .C(n5), .D(n366), .Y(n354) );
  NOR2X1 U424 ( .A(n354), .B(n355), .Y(n356) );
  NAND3X1 U425 ( .A(n358), .B(n357), .C(n356), .Y(n359) );
  OR2X2 U426 ( .A(n359), .B(n360), .Y(k_out[16]) );
  AOI22X1 U427 ( .A(kin[1]), .B(n69), .C(kin[3]), .D(n64), .Y(n365) );
  AOI22X1 U428 ( .A(kin[25]), .B(n79), .C(kin[27]), .D(n74), .Y(n364) );
  OAI22X1 U429 ( .A(n87), .B(n783), .C(n84), .D(n806), .Y(n362) );
  OAI22X1 U430 ( .A(n97), .B(n809), .C(n789), .D(n93), .Y(n361) );
  NOR2X1 U431 ( .A(n362), .B(n361), .Y(n363) );
  NAND3X1 U432 ( .A(n365), .B(n364), .C(n363), .Y(n373) );
  AOI22X1 U433 ( .A(n635), .B(kin[17]), .C(kin[8]), .D(n113), .Y(n371) );
  AOI22X1 U434 ( .A(kin[10]), .B(n108), .C(kin[4]), .D(n118), .Y(n370) );
  OAI22X1 U435 ( .A(n128), .B(n776), .C(n143), .D(n366), .Y(n368) );
  OAI22X1 U436 ( .A(n21), .B(n391), .C(n59), .D(n898), .Y(n367) );
  NOR2X1 U437 ( .A(n368), .B(n367), .Y(n369) );
  NAND3X1 U438 ( .A(n371), .B(n370), .C(n369), .Y(n372) );
  OR2X2 U439 ( .A(n373), .B(n372), .Y(k_out[18]) );
  AOI22X1 U440 ( .A(n70), .B(kin[2]), .C(n65), .D(kin[4]), .Y(n378) );
  AOI22X1 U441 ( .A(n80), .B(kin[26]), .C(n75), .D(kin[0]), .Y(n377) );
  OAI22X1 U442 ( .A(n807), .B(n9), .C(n800), .D(n82), .Y(n375) );
  OAI22X1 U443 ( .A(n789), .B(n97), .C(n91), .D(n808), .Y(n374) );
  NOR2X1 U444 ( .A(n375), .B(n374), .Y(n376) );
  NAND3X1 U445 ( .A(n378), .B(n377), .C(n376), .Y(n385) );
  AOI22X1 U446 ( .A(kin[9]), .B(n23), .C(kin[11]), .D(n107), .Y(n383) );
  AOI22X1 U447 ( .A(kin[5]), .B(n121), .C(kin[7]), .D(n117), .Y(n382) );
  OAI22X1 U448 ( .A(n128), .B(n790), .C(n809), .D(n61), .Y(n380) );
  OAI22X1 U449 ( .A(n140), .B(n880), .C(n5), .D(n791), .Y(n379) );
  NOR2X1 U450 ( .A(n380), .B(n379), .Y(n381) );
  NAND3X1 U451 ( .A(n383), .B(n382), .C(n381), .Y(n384) );
  OR2X2 U452 ( .A(n385), .B(n384), .Y(k_out[19]) );
  AOI22X1 U453 ( .A(kin[3]), .B(n69), .C(kin[5]), .D(n64), .Y(n390) );
  AOI22X1 U454 ( .A(kin[27]), .B(n79), .C(kin[1]), .D(n74), .Y(n389) );
  OAI22X1 U455 ( .A(n87), .B(n806), .C(n82), .D(n799), .Y(n387) );
  OAI22X1 U456 ( .A(n15), .B(n808), .C(n783), .D(n94), .Y(n386) );
  NOR2X1 U457 ( .A(n387), .B(n386), .Y(n388) );
  NAND3X1 U458 ( .A(n390), .B(n389), .C(n388), .Y(n400) );
  AOI22X1 U459 ( .A(kin[10]), .B(n112), .C(kin[12]), .D(n107), .Y(n398) );
  AOI22X1 U460 ( .A(kin[6]), .B(n121), .C(kin[8]), .D(n117), .Y(n397) );
  OAI22X1 U461 ( .A(n128), .B(n809), .C(n61), .D(n789), .Y(n395) );
  OAI22X1 U462 ( .A(n36), .B(n391), .C(n133), .D(n776), .Y(n392) );
  NOR2X1 U463 ( .A(n395), .B(n392), .Y(n396) );
  NAND3X1 U464 ( .A(n398), .B(n397), .C(n396), .Y(n399) );
  OR2X2 U465 ( .A(n400), .B(n399), .Y(k_out[20]) );
  AOI22X1 U466 ( .A(kin[5]), .B(n69), .C(n65), .D(kin[7]), .Y(n405) );
  AOI22X1 U467 ( .A(kin[1]), .B(n79), .C(kin[3]), .D(n74), .Y(n404) );
  OAI22X1 U468 ( .A(n89), .B(n799), .C(n82), .D(n798), .Y(n402) );
  OAI22X1 U469 ( .A(n807), .B(n96), .C(n91), .D(n806), .Y(n401) );
  NOR2X1 U470 ( .A(n401), .B(n402), .Y(n403) );
  NAND3X1 U471 ( .A(n405), .B(n404), .C(n403), .Y(n412) );
  AOI22X1 U472 ( .A(kin[12]), .B(n23), .C(kin[14]), .D(n107), .Y(n410) );
  AOI22X1 U473 ( .A(kin[8]), .B(n121), .C(kin[10]), .D(n116), .Y(n409) );
  OAI22X1 U474 ( .A(n129), .B(n808), .C(n61), .D(n783), .Y(n407) );
  OAI22X1 U475 ( .A(n141), .B(n776), .C(n134), .D(n809), .Y(n406) );
  NOR2X1 U476 ( .A(n406), .B(n407), .Y(n408) );
  NAND3X1 U477 ( .A(n410), .B(n409), .C(n408), .Y(n411) );
  OR2X2 U478 ( .A(n412), .B(n411), .Y(k_out[22]) );
  AOI22X1 U479 ( .A(n70), .B(kin[6]), .C(kin[8]), .D(n64), .Y(n417) );
  AOI22X1 U480 ( .A(n80), .B(kin[2]), .C(n75), .D(kin[4]), .Y(n416) );
  OAI22X1 U481 ( .A(n782), .B(n89), .C(n452), .D(n84), .Y(n414) );
  OAI22X1 U482 ( .A(n97), .B(n806), .C(n800), .D(n91), .Y(n413) );
  NOR2X1 U483 ( .A(n413), .B(n414), .Y(n415) );
  NAND3X1 U484 ( .A(n417), .B(n416), .C(n415), .Y(n424) );
  AOI22X1 U485 ( .A(kin[13]), .B(n112), .C(kin[15]), .D(n107), .Y(n422) );
  AOI22X1 U486 ( .A(kin[9]), .B(n121), .C(kin[11]), .D(n114), .Y(n421) );
  OAI22X1 U487 ( .A(n128), .B(n783), .C(n807), .D(n123), .Y(n419) );
  OAI22X1 U488 ( .A(n142), .B(n790), .C(n21), .D(n789), .Y(n418) );
  NOR2X1 U489 ( .A(n419), .B(n418), .Y(n420) );
  NAND3X1 U490 ( .A(n422), .B(n421), .C(n420), .Y(n423) );
  OR2X2 U491 ( .A(n423), .B(n424), .Y(k_out[23]) );
  AOI22X1 U492 ( .A(kin[8]), .B(n69), .C(kin[10]), .D(n64), .Y(n431) );
  AOI22X1 U493 ( .A(n80), .B(kin[4]), .C(n75), .D(kin[6]), .Y(n428) );
  OAI22X1 U494 ( .A(n452), .B(n14), .C(n900), .D(n85), .Y(n426) );
  OAI22X1 U495 ( .A(n97), .B(n799), .C(n782), .D(n94), .Y(n425) );
  NOR2X1 U496 ( .A(n425), .B(n426), .Y(n427) );
  NAND3X1 U497 ( .A(n431), .B(n428), .C(n427), .Y(n438) );
  AOI22X1 U498 ( .A(n635), .B(kin[24]), .C(kin[15]), .D(n112), .Y(n436) );
  AOI22X1 U499 ( .A(kin[17]), .B(n108), .C(kin[11]), .D(n118), .Y(n435) );
  OAI22X1 U500 ( .A(n128), .B(n806), .C(n141), .D(n789), .Y(n433) );
  OAI22X1 U501 ( .A(n134), .B(n783), .C(n59), .D(n880), .Y(n432) );
  NOR2X1 U502 ( .A(n432), .B(n433), .Y(n434) );
  NAND3X1 U503 ( .A(n436), .B(n435), .C(n434), .Y(n437) );
  OR2X2 U504 ( .A(n438), .B(n437), .Y(k_out[25]) );
  AOI22X1 U505 ( .A(kin[9]), .B(n69), .C(kin[11]), .D(n64), .Y(n444) );
  AOI22X1 U506 ( .A(kin[5]), .B(n79), .C(n75), .D(kin[7]), .Y(n443) );
  OAI22X1 U507 ( .A(n86), .B(n797), .C(n85), .D(n439), .Y(n441) );
  OAI22X1 U508 ( .A(n782), .B(n95), .C(n93), .D(n798), .Y(n440) );
  NOR2X1 U509 ( .A(n441), .B(n440), .Y(n442) );
  NAND3X1 U510 ( .A(n444), .B(n443), .C(n442), .Y(n451) );
  AOI22X1 U511 ( .A(kin[16]), .B(n111), .C(kin[18]), .D(n107), .Y(n449) );
  AOI22X1 U512 ( .A(kin[12]), .B(n121), .C(kin[14]), .D(n114), .Y(n448) );
  OAI22X1 U513 ( .A(n44), .B(n800), .C(n799), .D(n61), .Y(n446) );
  OAI22X1 U514 ( .A(n36), .B(n808), .C(n807), .D(n133), .Y(n445) );
  NOR2X1 U515 ( .A(n446), .B(n445), .Y(n447) );
  NAND3X1 U516 ( .A(n449), .B(n448), .C(n447), .Y(n450) );
  OR2X2 U517 ( .A(n451), .B(n450), .Y(k_out[26]) );
  AOI22X1 U518 ( .A(kin[10]), .B(n69), .C(kin[12]), .D(n64), .Y(n457) );
  AOI22X1 U519 ( .A(n81), .B(kin[6]), .C(kin[8]), .D(n74), .Y(n456) );
  OAI22X1 U520 ( .A(n900), .B(n9), .C(n899), .D(n82), .Y(n454) );
  OAI22X1 U521 ( .A(n97), .B(n798), .C(n452), .D(n91), .Y(n453) );
  NOR2X1 U522 ( .A(n453), .B(n454), .Y(n455) );
  NAND3X1 U523 ( .A(n457), .B(n456), .C(n455), .Y(n464) );
  AOI22X1 U524 ( .A(n40), .B(kin[26]), .C(kin[17]), .D(n110), .Y(n462) );
  AOI22X1 U525 ( .A(kin[19]), .B(n108), .C(kin[13]), .D(n118), .Y(n461) );
  OAI22X1 U526 ( .A(n127), .B(n799), .C(n141), .D(n783), .Y(n459) );
  OAI22X1 U527 ( .A(n134), .B(n806), .C(n59), .D(n791), .Y(n458) );
  NOR2X1 U528 ( .A(n458), .B(n459), .Y(n460) );
  NAND3X1 U529 ( .A(n462), .B(n461), .C(n460), .Y(n463) );
  OR2X2 U530 ( .A(n464), .B(n463), .Y(k_out[27]) );
  AOI22X1 U531 ( .A(kin[39]), .B(n69), .C(kin[41]), .D(n64), .Y(n469) );
  AOI22X1 U532 ( .A(kin[35]), .B(n79), .C(kin[37]), .D(n74), .Y(n468) );
  INVX2 U533 ( .A(kin[31]), .Y(n836) );
  INVX2 U534 ( .A(kin[33]), .Y(n835) );
  OAI22X1 U535 ( .A(n87), .B(n836), .C(n84), .D(n835), .Y(n466) );
  INVX2 U536 ( .A(kin[28]), .Y(n860) );
  INVX2 U537 ( .A(kin[29]), .Y(n743) );
  OAI22X1 U538 ( .A(n95), .B(n860), .C(n93), .D(n743), .Y(n465) );
  NOR2X1 U539 ( .A(n465), .B(n466), .Y(n467) );
  NAND3X1 U540 ( .A(n469), .B(n468), .C(n467), .Y(n476) );
  AOI22X1 U541 ( .A(n635), .B(kin[55]), .C(kin[46]), .D(n113), .Y(n474) );
  AOI22X1 U542 ( .A(kin[48]), .B(n108), .C(kin[42]), .D(n118), .Y(n473) );
  INVX2 U543 ( .A(kin[54]), .Y(n861) );
  OAI22X1 U544 ( .A(n127), .B(n861), .C(n140), .D(n749), .Y(n471) );
  OAI22X1 U545 ( .A(n5), .B(n868), .C(n59), .D(n710), .Y(n470) );
  NOR2X1 U546 ( .A(n471), .B(n470), .Y(n472) );
  NAND3X1 U547 ( .A(n474), .B(n473), .C(n472), .Y(n475) );
  OR2X2 U548 ( .A(n476), .B(n475), .Y(k_out[28]) );
  AOI22X1 U549 ( .A(kin[40]), .B(n69), .C(kin[42]), .D(n64), .Y(n481) );
  AOI22X1 U550 ( .A(kin[36]), .B(n79), .C(kin[38]), .D(n74), .Y(n480) );
  INVX2 U551 ( .A(kin[32]), .Y(n822) );
  INVX2 U552 ( .A(kin[34]), .Y(n816) );
  OAI22X1 U553 ( .A(n89), .B(n822), .C(n84), .D(n816), .Y(n478) );
  INVX2 U554 ( .A(kin[30]), .Y(n859) );
  OAI22X1 U555 ( .A(n97), .B(n743), .C(n94), .D(n859), .Y(n477) );
  NOR2X1 U556 ( .A(n477), .B(n478), .Y(n479) );
  NAND3X1 U557 ( .A(n481), .B(n480), .C(n479), .Y(n488) );
  AOI22X1 U558 ( .A(kin[47]), .B(n23), .C(kin[49]), .D(n107), .Y(n486) );
  AOI22X1 U559 ( .A(kin[43]), .B(n121), .C(kin[45]), .D(n114), .Y(n485) );
  INVX2 U560 ( .A(kin[55]), .Y(n758) );
  OAI22X1 U561 ( .A(n127), .B(n758), .C(n61), .D(n860), .Y(n483) );
  INVX2 U562 ( .A(kin[51]), .Y(n869) );
  INVX2 U563 ( .A(kin[53]), .Y(n862) );
  OAI22X1 U564 ( .A(n36), .B(n869), .C(n5), .D(n862), .Y(n482) );
  NOR2X1 U565 ( .A(n483), .B(n482), .Y(n484) );
  NAND3X1 U566 ( .A(n486), .B(n485), .C(n484), .Y(n487) );
  OR2X2 U567 ( .A(n488), .B(n487), .Y(k_out[29]) );
  AOI22X1 U568 ( .A(kin[41]), .B(n68), .C(kin[43]), .D(n64), .Y(n493) );
  AOI22X1 U569 ( .A(kin[37]), .B(n78), .C(kin[39]), .D(n74), .Y(n492) );
  INVX2 U570 ( .A(kin[35]), .Y(n834) );
  OAI22X1 U571 ( .A(n12), .B(n835), .C(n84), .D(n834), .Y(n490) );
  OAI22X1 U572 ( .A(n97), .B(n859), .C(n93), .D(n836), .Y(n489) );
  NOR2X1 U573 ( .A(n490), .B(n489), .Y(n491) );
  NAND3X1 U574 ( .A(n493), .B(n492), .C(n491), .Y(n500) );
  AOI22X1 U575 ( .A(n635), .B(kin[29]), .C(kin[48]), .D(n111), .Y(n498) );
  AOI22X1 U576 ( .A(kin[50]), .B(n108), .C(kin[44]), .D(n118), .Y(n497) );
  OAI22X1 U577 ( .A(n127), .B(n860), .C(n141), .D(n868), .Y(n495) );
  INVX2 U578 ( .A(kin[46]), .Y(n735) );
  OAI22X1 U579 ( .A(n21), .B(n861), .C(n59), .D(n735), .Y(n494) );
  NOR2X1 U580 ( .A(n495), .B(n494), .Y(n496) );
  NAND3X1 U581 ( .A(n498), .B(n497), .C(n496), .Y(n499) );
  OR2X2 U582 ( .A(n500), .B(n499), .Y(k_out[30]) );
  AOI22X1 U583 ( .A(kin[42]), .B(n68), .C(kin[44]), .D(n63), .Y(n505) );
  AOI22X1 U584 ( .A(kin[38]), .B(n78), .C(kin[40]), .D(n74), .Y(n504) );
  INVX2 U585 ( .A(kin[36]), .Y(n853) );
  OAI22X1 U586 ( .A(n86), .B(n816), .C(n85), .D(n853), .Y(n502) );
  OAI22X1 U587 ( .A(n97), .B(n836), .C(n93), .D(n822), .Y(n501) );
  NOR2X1 U588 ( .A(n502), .B(n501), .Y(n503) );
  NAND3X1 U589 ( .A(n505), .B(n504), .C(n503), .Y(n512) );
  AOI22X1 U590 ( .A(kin[49]), .B(n23), .C(kin[51]), .D(n106), .Y(n510) );
  AOI22X1 U591 ( .A(kin[45]), .B(n120), .C(kin[47]), .D(n116), .Y(n509) );
  OAI22X1 U592 ( .A(n127), .B(n743), .C(n61), .D(n859), .Y(n507) );
  OAI22X1 U593 ( .A(n143), .B(n862), .C(n5), .D(n758), .Y(n506) );
  NOR2X1 U594 ( .A(n507), .B(n506), .Y(n508) );
  NAND3X1 U595 ( .A(n510), .B(n509), .C(n508), .Y(n511) );
  OR2X2 U596 ( .A(n512), .B(n511), .Y(k_out[31]) );
  INVX2 U597 ( .A(kin[37]), .Y(n828) );
  OAI22X1 U598 ( .A(n94), .B(n835), .C(n82), .D(n828), .Y(n515) );
  OAI22X1 U599 ( .A(n9), .B(n834), .C(n24), .D(n749), .Y(n514) );
  NOR2X1 U600 ( .A(n515), .B(n514), .Y(n529) );
  INVX2 U601 ( .A(kin[43]), .Y(n843) );
  AOI22X1 U602 ( .A(kin[45]), .B(n66), .C(kin[46]), .D(n118), .Y(n516) );
  OAI21X1 U603 ( .A(n517), .B(n843), .C(n516), .Y(n521) );
  OAI22X1 U604 ( .A(n519), .B(n815), .C(n518), .D(n850), .Y(n520) );
  NOR2X1 U605 ( .A(n521), .B(n520), .Y(n528) );
  AOI22X1 U606 ( .A(kin[54]), .B(n38), .C(kin[28]), .D(n139), .Y(n523) );
  AOI22X1 U607 ( .A(kin[48]), .B(n117), .C(kin[52]), .D(n106), .Y(n522) );
  NAND2X1 U608 ( .A(n523), .B(n522), .Y(n526) );
  AOI22X1 U609 ( .A(kin[32]), .B(n102), .C(kin[30]), .D(n25), .Y(n524) );
  OAI21X1 U610 ( .A(n39), .B(n836), .C(n524), .Y(n525) );
  NOR2X1 U611 ( .A(n526), .B(n525), .Y(n527) );
  NAND3X1 U612 ( .A(n529), .B(n528), .C(n527), .Y(k_out[32]) );
  AOI22X1 U613 ( .A(kin[44]), .B(n68), .C(kin[46]), .D(n63), .Y(n534) );
  AOI22X1 U614 ( .A(kin[40]), .B(n78), .C(kin[42]), .D(n73), .Y(n533) );
  INVX2 U615 ( .A(kin[38]), .Y(n852) );
  OAI22X1 U616 ( .A(n87), .B(n853), .C(n83), .D(n852), .Y(n531) );
  OAI22X1 U617 ( .A(n96), .B(n835), .C(n93), .D(n816), .Y(n530) );
  NOR2X1 U618 ( .A(n530), .B(n531), .Y(n532) );
  NAND3X1 U619 ( .A(n534), .B(n533), .C(n532), .Y(n541) );
  AOI22X1 U620 ( .A(kin[51]), .B(n23), .C(kin[53]), .D(n106), .Y(n539) );
  AOI22X1 U621 ( .A(kin[47]), .B(n120), .C(kin[49]), .D(n115), .Y(n538) );
  OAI22X1 U622 ( .A(n127), .B(n836), .C(n61), .D(n822), .Y(n536) );
  OAI22X1 U623 ( .A(n141), .B(n758), .C(n133), .D(n743), .Y(n535) );
  NOR2X1 U624 ( .A(n536), .B(n535), .Y(n537) );
  NAND3X1 U625 ( .A(n539), .B(n538), .C(n537), .Y(n540) );
  OR2X2 U626 ( .A(n541), .B(n540), .Y(k_out[33]) );
  AOI22X1 U627 ( .A(kin[46]), .B(n68), .C(kin[48]), .D(n63), .Y(n546) );
  AOI22X1 U628 ( .A(kin[42]), .B(n78), .C(kin[44]), .D(n73), .Y(n545) );
  INVX2 U629 ( .A(kin[40]), .Y(n851) );
  OAI22X1 U630 ( .A(n89), .B(n852), .C(n84), .D(n851), .Y(n543) );
  OAI22X1 U631 ( .A(n96), .B(n834), .C(n94), .D(n853), .Y(n542) );
  NOR2X1 U632 ( .A(n543), .B(n542), .Y(n544) );
  NAND3X1 U633 ( .A(n546), .B(n545), .C(n544), .Y(n553) );
  AOI22X1 U634 ( .A(kin[53]), .B(n23), .C(kin[55]), .D(n106), .Y(n551) );
  AOI22X1 U635 ( .A(kin[49]), .B(n120), .C(kin[51]), .D(n116), .Y(n550) );
  OAI22X1 U636 ( .A(n127), .B(n835), .C(n61), .D(n816), .Y(n548) );
  OAI22X1 U637 ( .A(n143), .B(n743), .C(n135), .D(n836), .Y(n547) );
  NOR2X1 U638 ( .A(n548), .B(n547), .Y(n549) );
  NAND3X1 U639 ( .A(n551), .B(n550), .C(n549), .Y(n552) );
  OR2X2 U640 ( .A(n553), .B(n552), .Y(k_out[35]) );
  AOI22X1 U641 ( .A(kin[47]), .B(n68), .C(kin[49]), .D(n63), .Y(n558) );
  AOI22X1 U642 ( .A(kin[43]), .B(n78), .C(kin[45]), .D(n73), .Y(n557) );
  OAI22X1 U643 ( .A(n87), .B(n815), .C(n82), .D(n850), .Y(n555) );
  OAI22X1 U644 ( .A(n96), .B(n853), .C(n94), .D(n828), .Y(n554) );
  NOR2X1 U645 ( .A(n554), .B(n555), .Y(n556) );
  NAND3X1 U646 ( .A(n558), .B(n557), .C(n556), .Y(n567) );
  AOI22X1 U647 ( .A(n635), .B(kin[35]), .C(kin[54]), .D(n112), .Y(n565) );
  AOI22X1 U648 ( .A(kin[28]), .B(n108), .C(kin[50]), .D(n118), .Y(n564) );
  OAI22X1 U649 ( .A(n127), .B(n816), .C(n37), .D(n859), .Y(n560) );
  OAI22X1 U650 ( .A(n134), .B(n822), .C(n59), .D(n868), .Y(n559) );
  NOR2X1 U651 ( .A(n560), .B(n559), .Y(n563) );
  NAND3X1 U652 ( .A(n565), .B(n564), .C(n563), .Y(n566) );
  OR2X2 U653 ( .A(n567), .B(n566), .Y(k_out[36]) );
  AOI22X1 U654 ( .A(kin[49]), .B(n68), .C(kin[51]), .D(n63), .Y(n572) );
  AOI22X1 U655 ( .A(kin[45]), .B(n78), .C(kin[47]), .D(n73), .Y(n571) );
  OAI22X1 U656 ( .A(n9), .B(n850), .C(n82), .D(n843), .Y(n569) );
  OAI22X1 U657 ( .A(n96), .B(n852), .C(n94), .D(n815), .Y(n568) );
  NOR2X1 U658 ( .A(n568), .B(n569), .Y(n570) );
  NAND3X1 U659 ( .A(n572), .B(n571), .C(n570), .Y(n579) );
  AOI22X1 U660 ( .A(kin[28]), .B(n110), .C(kin[30]), .D(n106), .Y(n577) );
  AOI22X1 U661 ( .A(kin[52]), .B(n120), .C(kin[54]), .D(n114), .Y(n576) );
  OAI22X1 U662 ( .A(n17), .B(n853), .C(n828), .D(n61), .Y(n574) );
  OAI22X1 U663 ( .A(n140), .B(n822), .C(n21), .D(n816), .Y(n573) );
  NOR2X1 U664 ( .A(n574), .B(n573), .Y(n575) );
  NAND3X1 U665 ( .A(n577), .B(n576), .C(n575), .Y(n578) );
  OR2X2 U666 ( .A(n579), .B(n578), .Y(k_out[38]) );
  AOI22X1 U667 ( .A(kin[50]), .B(n68), .C(kin[52]), .D(n63), .Y(n584) );
  AOI22X1 U668 ( .A(kin[46]), .B(n78), .C(kin[48]), .D(n73), .Y(n583) );
  INVX2 U669 ( .A(kin[42]), .Y(n844) );
  OAI22X1 U670 ( .A(n89), .B(n844), .C(n82), .D(n710), .Y(n581) );
  OAI22X1 U671 ( .A(n96), .B(n815), .C(n93), .D(n851), .Y(n580) );
  NOR2X1 U672 ( .A(n581), .B(n580), .Y(n582) );
  NAND3X1 U673 ( .A(n584), .B(n583), .C(n582), .Y(n591) );
  AOI22X1 U674 ( .A(kin[29]), .B(n111), .C(kin[31]), .D(n106), .Y(n589) );
  AOI22X1 U675 ( .A(kin[53]), .B(n120), .C(kin[55]), .D(n114), .Y(n588) );
  OAI22X1 U676 ( .A(n128), .B(n828), .C(n123), .D(n852), .Y(n586) );
  OAI22X1 U677 ( .A(n140), .B(n835), .C(n5), .D(n834), .Y(n585) );
  NOR2X1 U678 ( .A(n586), .B(n585), .Y(n587) );
  NAND3X1 U679 ( .A(n589), .B(n588), .C(n587), .Y(n590) );
  OR2X2 U680 ( .A(n591), .B(n590), .Y(k_out[39]) );
  AOI22X1 U681 ( .A(kin[51]), .B(n68), .C(kin[53]), .D(n63), .Y(n596) );
  AOI22X1 U682 ( .A(kin[47]), .B(n78), .C(kin[49]), .D(n73), .Y(n595) );
  INVX2 U683 ( .A(kin[45]), .Y(n842) );
  OAI22X1 U684 ( .A(n89), .B(n843), .C(n82), .D(n842), .Y(n593) );
  OAI22X1 U685 ( .A(n96), .B(n851), .C(n4), .D(n850), .Y(n592) );
  NOR2X1 U686 ( .A(n593), .B(n592), .Y(n594) );
  NAND3X1 U687 ( .A(n596), .B(n595), .C(n594), .Y(n605) );
  AOI22X1 U688 ( .A(kin[30]), .B(n23), .C(kin[32]), .D(n106), .Y(n603) );
  AOI22X1 U689 ( .A(kin[54]), .B(n120), .C(kin[28]), .D(n114), .Y(n602) );
  OAI22X1 U690 ( .A(n127), .B(n852), .C(n61), .D(n815), .Y(n600) );
  OAI22X1 U691 ( .A(n141), .B(n816), .C(n5), .D(n853), .Y(n599) );
  NOR2X1 U692 ( .A(n600), .B(n599), .Y(n601) );
  NAND3X1 U693 ( .A(n603), .B(n602), .C(n601), .Y(n604) );
  OR2X2 U694 ( .A(n605), .B(n604), .Y(k_out[40]) );
  AOI22X1 U695 ( .A(kin[52]), .B(n68), .C(kin[54]), .D(n63), .Y(n610) );
  AOI22X1 U696 ( .A(kin[48]), .B(n78), .C(kin[50]), .D(n73), .Y(n609) );
  OAI22X1 U697 ( .A(n9), .B(n710), .C(n84), .D(n735), .Y(n607) );
  OAI22X1 U698 ( .A(n96), .B(n850), .C(n94), .D(n844), .Y(n606) );
  NOR2X1 U699 ( .A(n607), .B(n606), .Y(n608) );
  NAND3X1 U700 ( .A(n610), .B(n609), .C(n608), .Y(n617) );
  AOI22X1 U701 ( .A(kin[31]), .B(n112), .C(kin[33]), .D(n106), .Y(n615) );
  AOI22X1 U702 ( .A(kin[55]), .B(n120), .C(kin[29]), .D(n117), .Y(n614) );
  OAI22X1 U703 ( .A(n44), .B(n815), .C(n39), .D(n851), .Y(n612) );
  OAI22X1 U704 ( .A(n140), .B(n834), .C(n21), .D(n828), .Y(n611) );
  NOR2X1 U705 ( .A(n611), .B(n612), .Y(n613) );
  NAND3X1 U706 ( .A(n615), .B(n614), .C(n613), .Y(n616) );
  OR2X2 U707 ( .A(n616), .B(n617), .Y(k_out[41]) );
  AOI22X1 U708 ( .A(kin[54]), .B(n68), .C(kin[28]), .D(n63), .Y(n622) );
  AOI22X1 U709 ( .A(kin[50]), .B(n78), .C(kin[52]), .D(n73), .Y(n621) );
  INVX2 U710 ( .A(kin[48]), .Y(n750) );
  OAI22X1 U711 ( .A(n87), .B(n735), .C(n84), .D(n750), .Y(n619) );
  OAI22X1 U712 ( .A(n96), .B(n843), .C(n93), .D(n710), .Y(n618) );
  NOR2X1 U713 ( .A(n619), .B(n618), .Y(n620) );
  NAND3X1 U714 ( .A(n622), .B(n621), .C(n620), .Y(n629) );
  AOI22X1 U715 ( .A(kin[33]), .B(n23), .C(kin[35]), .D(n106), .Y(n627) );
  AOI22X1 U716 ( .A(kin[29]), .B(n120), .C(kin[31]), .D(n116), .Y(n626) );
  OAI22X1 U717 ( .A(n17), .B(n850), .C(n60), .D(n844), .Y(n624) );
  OAI22X1 U718 ( .A(n142), .B(n828), .C(n21), .D(n815), .Y(n623) );
  NOR2X1 U719 ( .A(n624), .B(n623), .Y(n625) );
  NAND3X1 U720 ( .A(n627), .B(n626), .C(n625), .Y(n628) );
  OR2X2 U721 ( .A(n629), .B(n628), .Y(k_out[43]) );
  AOI22X1 U722 ( .A(kin[55]), .B(n68), .C(kin[29]), .D(n63), .Y(n634) );
  AOI22X1 U723 ( .A(kin[51]), .B(n78), .C(kin[53]), .D(n73), .Y(n633) );
  INVX2 U724 ( .A(kin[47]), .Y(n871) );
  INVX2 U725 ( .A(kin[49]), .Y(n870) );
  OAI22X1 U726 ( .A(n89), .B(n871), .C(n82), .D(n870), .Y(n631) );
  OAI22X1 U727 ( .A(n96), .B(n710), .C(n4), .D(n842), .Y(n630) );
  NOR2X1 U728 ( .A(n631), .B(n630), .Y(n632) );
  NAND3X1 U729 ( .A(n634), .B(n633), .C(n632), .Y(n642) );
  AOI22X1 U730 ( .A(n635), .B(kin[43]), .C(kin[34]), .D(n110), .Y(n640) );
  AOI22X1 U731 ( .A(kin[36]), .B(n108), .C(kin[30]), .D(n118), .Y(n639) );
  OAI22X1 U732 ( .A(n44), .B(n844), .C(n140), .D(n852), .Y(n637) );
  OAI22X1 U733 ( .A(n133), .B(n851), .C(n59), .D(n822), .Y(n636) );
  NOR2X1 U734 ( .A(n636), .B(n637), .Y(n638) );
  NAND3X1 U735 ( .A(n640), .B(n639), .C(n638), .Y(n641) );
  OR2X2 U736 ( .A(n642), .B(n641), .Y(k_out[44]) );
  AOI22X1 U737 ( .A(kin[28]), .B(n68), .C(kin[30]), .D(n63), .Y(n647) );
  AOI22X1 U738 ( .A(kin[52]), .B(n78), .C(kin[54]), .D(n73), .Y(n646) );
  OAI22X1 U739 ( .A(n87), .B(n750), .C(n83), .D(n749), .Y(n644) );
  OAI22X1 U740 ( .A(n96), .B(n842), .C(n94), .D(n735), .Y(n643) );
  NOR2X1 U741 ( .A(n643), .B(n644), .Y(n645) );
  NAND3X1 U742 ( .A(n647), .B(n646), .C(n645), .Y(n654) );
  AOI22X1 U743 ( .A(kin[35]), .B(n111), .C(kin[37]), .D(n106), .Y(n652) );
  AOI22X1 U744 ( .A(kin[31]), .B(n120), .C(kin[33]), .D(n116), .Y(n651) );
  OAI22X1 U745 ( .A(n127), .B(n843), .C(n123), .D(n710), .Y(n649) );
  OAI22X1 U746 ( .A(n142), .B(n815), .C(n21), .D(n850), .Y(n648) );
  NOR2X1 U747 ( .A(n648), .B(n649), .Y(n650) );
  NAND3X1 U748 ( .A(n652), .B(n651), .C(n650), .Y(n653) );
  OR2X2 U749 ( .A(n654), .B(n653), .Y(k_out[45]) );
  AOI22X1 U750 ( .A(kin[29]), .B(n68), .C(kin[31]), .D(n63), .Y(n661) );
  AOI22X1 U751 ( .A(kin[53]), .B(n78), .C(kin[55]), .D(n73), .Y(n660) );
  OAI22X1 U752 ( .A(n87), .B(n870), .C(n84), .D(n869), .Y(n656) );
  OAI22X1 U753 ( .A(n96), .B(n735), .C(n91), .D(n871), .Y(n655) );
  NOR2X1 U754 ( .A(n655), .B(n656), .Y(n659) );
  NAND3X1 U755 ( .A(n661), .B(n660), .C(n659), .Y(n668) );
  AOI22X1 U756 ( .A(kin[36]), .B(n23), .C(kin[38]), .D(n106), .Y(n666) );
  AOI22X1 U757 ( .A(kin[32]), .B(n120), .C(kin[34]), .D(n116), .Y(n665) );
  OAI22X1 U758 ( .A(n128), .B(n710), .C(n28), .D(n842), .Y(n663) );
  OAI22X1 U759 ( .A(n140), .B(n851), .C(n21), .D(n844), .Y(n662) );
  NOR2X1 U760 ( .A(n662), .B(n663), .Y(n664) );
  NAND3X1 U761 ( .A(n666), .B(n665), .C(n664), .Y(n667) );
  AOI22X1 U762 ( .A(kin[30]), .B(n67), .C(kin[32]), .D(n63), .Y(n673) );
  AOI22X1 U763 ( .A(kin[54]), .B(n77), .C(kin[28]), .D(n73), .Y(n672) );
  OAI22X1 U764 ( .A(n87), .B(n749), .C(n84), .D(n868), .Y(n670) );
  OAI22X1 U765 ( .A(n96), .B(n871), .C(n91), .D(n750), .Y(n669) );
  NOR2X1 U766 ( .A(n669), .B(n670), .Y(n671) );
  NAND3X1 U767 ( .A(n673), .B(n672), .C(n671), .Y(n680) );
  AOI22X1 U768 ( .A(kin[46]), .B(n40), .C(kin[37]), .D(n111), .Y(n678) );
  AOI22X1 U769 ( .A(kin[39]), .B(n109), .C(kin[33]), .D(n118), .Y(n677) );
  OAI22X1 U770 ( .A(n126), .B(n842), .C(n140), .D(n850), .Y(n675) );
  OAI22X1 U771 ( .A(n42), .B(n843), .C(n59), .D(n834), .Y(n674) );
  NOR2X1 U772 ( .A(n674), .B(n675), .Y(n676) );
  NAND3X1 U773 ( .A(n678), .B(n677), .C(n676), .Y(n679) );
  OR2X2 U774 ( .A(n680), .B(n679), .Y(k_out[47]) );
  AOI22X1 U775 ( .A(kin[31]), .B(n67), .C(kin[33]), .D(n62), .Y(n685) );
  AOI22X1 U776 ( .A(kin[55]), .B(n77), .C(kin[29]), .D(n72), .Y(n684) );
  OAI22X1 U777 ( .A(n87), .B(n869), .C(n84), .D(n862), .Y(n682) );
  OAI22X1 U778 ( .A(n95), .B(n750), .C(n91), .D(n870), .Y(n681) );
  NOR2X1 U779 ( .A(n681), .B(n682), .Y(n683) );
  NAND3X1 U780 ( .A(n685), .B(n684), .C(n683), .Y(n692) );
  AOI22X1 U781 ( .A(kin[38]), .B(n23), .C(kin[40]), .D(n106), .Y(n690) );
  AOI22X1 U782 ( .A(kin[34]), .B(n119), .C(kin[36]), .D(n114), .Y(n689) );
  OAI22X1 U783 ( .A(n126), .B(n735), .C(n60), .D(n871), .Y(n687) );
  OAI22X1 U784 ( .A(n142), .B(n844), .C(n135), .D(n710), .Y(n686) );
  NOR2X1 U785 ( .A(n687), .B(n686), .Y(n688) );
  NAND3X1 U786 ( .A(n690), .B(n689), .C(n688), .Y(n691) );
  OR2X2 U787 ( .A(n692), .B(n691), .Y(k_out[48]) );
  AOI22X1 U788 ( .A(kin[32]), .B(n67), .C(kin[34]), .D(n62), .Y(n697) );
  AOI22X1 U789 ( .A(kin[28]), .B(n77), .C(kin[30]), .D(n72), .Y(n696) );
  OAI22X1 U790 ( .A(n12), .B(n868), .C(n85), .D(n861), .Y(n694) );
  OAI22X1 U791 ( .A(n95), .B(n870), .C(n93), .D(n749), .Y(n693) );
  NOR2X1 U792 ( .A(n694), .B(n693), .Y(n695) );
  NAND3X1 U793 ( .A(n697), .B(n696), .C(n695), .Y(n704) );
  AOI22X1 U794 ( .A(kin[39]), .B(n23), .C(kin[41]), .D(n106), .Y(n702) );
  AOI22X1 U795 ( .A(kin[35]), .B(n119), .C(kin[37]), .D(n115), .Y(n701) );
  OAI22X1 U796 ( .A(n128), .B(n871), .C(n750), .D(n61), .Y(n699) );
  OAI22X1 U797 ( .A(n143), .B(n843), .C(n133), .D(n842), .Y(n698) );
  NOR2X1 U798 ( .A(n698), .B(n699), .Y(n700) );
  NAND3X1 U799 ( .A(n702), .B(n701), .C(n700), .Y(n703) );
  OR2X2 U800 ( .A(n704), .B(n703), .Y(k_out[49]) );
  AOI22X1 U801 ( .A(kin[33]), .B(n67), .C(kin[35]), .D(n62), .Y(n709) );
  AOI22X1 U802 ( .A(kin[29]), .B(n77), .C(kin[31]), .D(n72), .Y(n708) );
  OAI22X1 U803 ( .A(n89), .B(n862), .C(n83), .D(n758), .Y(n706) );
  OAI22X1 U804 ( .A(n95), .B(n749), .C(n93), .D(n869), .Y(n705) );
  NOR2X1 U805 ( .A(n706), .B(n705), .Y(n707) );
  NAND3X1 U806 ( .A(n709), .B(n708), .C(n707), .Y(n717) );
  AOI22X1 U807 ( .A(kin[40]), .B(n23), .C(kin[42]), .D(n105), .Y(n715) );
  AOI22X1 U808 ( .A(kin[36]), .B(n119), .C(kin[38]), .D(n117), .Y(n714) );
  OAI22X1 U809 ( .A(n128), .B(n750), .C(n870), .D(n61), .Y(n712) );
  OAI22X1 U810 ( .A(n140), .B(n710), .C(n133), .D(n735), .Y(n711) );
  NOR2X1 U811 ( .A(n711), .B(n712), .Y(n713) );
  NAND3X1 U812 ( .A(n715), .B(n714), .C(n713), .Y(n716) );
  OR2X2 U813 ( .A(n717), .B(n716), .Y(k_out[50]) );
  AOI22X1 U814 ( .A(kin[34]), .B(n67), .C(kin[36]), .D(n62), .Y(n722) );
  AOI22X1 U815 ( .A(kin[30]), .B(n77), .C(kin[32]), .D(n72), .Y(n721) );
  OAI22X1 U816 ( .A(n89), .B(n861), .C(n82), .D(n860), .Y(n719) );
  OAI22X1 U817 ( .A(n95), .B(n869), .C(n94), .D(n868), .Y(n718) );
  NOR2X1 U818 ( .A(n719), .B(n718), .Y(n720) );
  NAND3X1 U819 ( .A(n722), .B(n721), .C(n720), .Y(n729) );
  AOI22X1 U820 ( .A(kin[41]), .B(n110), .C(kin[43]), .D(n105), .Y(n727) );
  AOI22X1 U821 ( .A(kin[37]), .B(n119), .C(kin[39]), .D(n114), .Y(n726) );
  OAI22X1 U822 ( .A(n127), .B(n870), .C(n749), .D(n61), .Y(n724) );
  OAI22X1 U823 ( .A(n142), .B(n842), .C(n5), .D(n871), .Y(n723) );
  NOR2X1 U824 ( .A(n724), .B(n723), .Y(n725) );
  NAND3X1 U825 ( .A(n727), .B(n726), .C(n725), .Y(n728) );
  OR2X2 U826 ( .A(n729), .B(n728), .Y(k_out[51]) );
  AOI22X1 U827 ( .A(kin[35]), .B(n67), .C(kin[37]), .D(n62), .Y(n734) );
  AOI22X1 U828 ( .A(kin[31]), .B(n77), .C(kin[33]), .D(n72), .Y(n733) );
  OAI22X1 U829 ( .A(n87), .B(n758), .C(n84), .D(n743), .Y(n731) );
  OAI22X1 U830 ( .A(n95), .B(n868), .C(n91), .D(n862), .Y(n730) );
  NOR2X1 U831 ( .A(n730), .B(n731), .Y(n732) );
  NAND3X1 U832 ( .A(n734), .B(n733), .C(n732), .Y(n742) );
  AOI22X1 U833 ( .A(kin[42]), .B(n23), .C(kin[44]), .D(n105), .Y(n740) );
  AOI22X1 U834 ( .A(kin[38]), .B(n120), .C(kin[40]), .D(n114), .Y(n739) );
  OAI22X1 U835 ( .A(n44), .B(n749), .C(n869), .D(n60), .Y(n737) );
  OAI22X1 U836 ( .A(n142), .B(n735), .C(n42), .D(n750), .Y(n736) );
  NOR2X1 U837 ( .A(n736), .B(n737), .Y(n738) );
  NAND3X1 U838 ( .A(n740), .B(n739), .C(n738), .Y(n741) );
  OR2X2 U839 ( .A(n742), .B(n741), .Y(k_out[52]) );
  AOI22X1 U840 ( .A(kin[37]), .B(n67), .C(kin[39]), .D(n62), .Y(n748) );
  AOI22X1 U841 ( .A(kin[33]), .B(n77), .C(kin[35]), .D(n72), .Y(n747) );
  OAI22X1 U842 ( .A(n86), .B(n743), .C(n83), .D(n836), .Y(n745) );
  OAI22X1 U843 ( .A(n95), .B(n861), .C(n758), .D(n91), .Y(n744) );
  NOR2X1 U844 ( .A(n745), .B(n744), .Y(n746) );
  NAND3X1 U845 ( .A(n748), .B(n747), .C(n746), .Y(n757) );
  AOI22X1 U846 ( .A(kin[44]), .B(n23), .C(kin[46]), .D(n105), .Y(n755) );
  AOI22X1 U847 ( .A(kin[40]), .B(n119), .C(kin[42]), .D(n116), .Y(n754) );
  OAI22X1 U848 ( .A(n17), .B(n868), .C(n862), .D(n60), .Y(n752) );
  OAI22X1 U849 ( .A(n142), .B(n750), .C(n133), .D(n749), .Y(n751) );
  NOR2X1 U850 ( .A(n751), .B(n752), .Y(n753) );
  NAND3X1 U851 ( .A(n755), .B(n754), .C(n753), .Y(n756) );
  OR2X2 U852 ( .A(n757), .B(n756), .Y(k_out[54]) );
  AOI22X1 U853 ( .A(kin[38]), .B(n67), .C(kin[40]), .D(n62), .Y(n763) );
  AOI22X1 U854 ( .A(kin[34]), .B(n77), .C(kin[36]), .D(n72), .Y(n762) );
  OAI22X1 U855 ( .A(n86), .B(n859), .C(n83), .D(n822), .Y(n760) );
  OAI22X1 U856 ( .A(n95), .B(n758), .C(n91), .D(n860), .Y(n759) );
  NOR2X1 U857 ( .A(n760), .B(n759), .Y(n761) );
  NAND3X1 U858 ( .A(n763), .B(n762), .C(n761), .Y(n770) );
  AOI22X1 U859 ( .A(kin[45]), .B(n23), .C(kin[47]), .D(n105), .Y(n768) );
  AOI22X1 U860 ( .A(kin[41]), .B(n119), .C(kin[43]), .D(n114), .Y(n767) );
  OAI22X1 U861 ( .A(n128), .B(n862), .C(n123), .D(n861), .Y(n765) );
  OAI22X1 U862 ( .A(n143), .B(n870), .C(n133), .D(n869), .Y(n764) );
  NOR2X1 U863 ( .A(n765), .B(n764), .Y(n766) );
  NAND3X1 U864 ( .A(n768), .B(n767), .C(n766), .Y(n769) );
  OR2X2 U865 ( .A(n769), .B(n770), .Y(k_out[55]) );
  AOI22X1 U866 ( .A(n70), .B(kin[0]), .C(n65), .D(kin[2]), .Y(n775) );
  AOI22X1 U867 ( .A(n80), .B(kin[24]), .C(n75), .D(kin[26]), .Y(n774) );
  OAI22X1 U868 ( .A(n13), .B(n808), .C(n807), .D(n6), .Y(n772) );
  OAI22X1 U869 ( .A(n790), .B(n15), .C(n3), .D(n809), .Y(n771) );
  NOR2X1 U870 ( .A(n772), .B(n771), .Y(n773) );
  NAND3X1 U871 ( .A(n775), .B(n774), .C(n773), .Y(n907) );
  AOI22X1 U872 ( .A(kin[7]), .B(n112), .C(kin[9]), .D(n105), .Y(n781) );
  AOI22X1 U873 ( .A(kin[3]), .B(n119), .C(kin[5]), .D(n115), .Y(n780) );
  OAI22X1 U874 ( .A(n43), .B(n791), .C(n31), .D(n776), .Y(n778) );
  OAI22X1 U875 ( .A(n10), .B(n882), .C(n20), .D(n880), .Y(n777) );
  NOR2X1 U876 ( .A(n778), .B(n777), .Y(n779) );
  NAND3X1 U877 ( .A(n781), .B(n780), .C(n779), .Y(n906) );
  AOI22X1 U878 ( .A(n71), .B(kin[4]), .C(n66), .D(kin[6]), .Y(n788) );
  AOI22X1 U879 ( .A(n81), .B(kin[0]), .C(n76), .D(kin[2]), .Y(n787) );
  OAI22X1 U880 ( .A(n800), .B(n13), .C(n782), .D(n6), .Y(n785) );
  OAI22X1 U881 ( .A(n783), .B(n96), .C(n807), .D(n3), .Y(n784) );
  NOR2X1 U882 ( .A(n785), .B(n784), .Y(n786) );
  NAND3X1 U883 ( .A(n788), .B(n787), .C(n786), .Y(n909) );
  AOI22X1 U884 ( .A(kin[11]), .B(n111), .C(kin[13]), .D(n105), .Y(n796) );
  AOI22X1 U885 ( .A(kin[7]), .B(n120), .C(kin[9]), .D(n115), .Y(n795) );
  OAI22X1 U886 ( .A(n43), .B(n789), .C(n31), .D(n808), .Y(n793) );
  OAI22X1 U887 ( .A(n10), .B(n791), .C(n20), .D(n790), .Y(n792) );
  NOR2X1 U888 ( .A(n793), .B(n792), .Y(n794) );
  NAND3X1 U889 ( .A(n796), .B(n795), .C(n794), .Y(n908) );
  AOI22X1 U890 ( .A(n70), .B(kin[7]), .C(kin[9]), .D(n62), .Y(n805) );
  AOI22X1 U891 ( .A(kin[3]), .B(n77), .C(kin[5]), .D(n72), .Y(n804) );
  OAI22X1 U892 ( .A(n13), .B(n798), .C(n6), .D(n797), .Y(n802) );
  OAI22X1 U893 ( .A(n800), .B(n95), .C(n3), .D(n799), .Y(n801) );
  NOR2X1 U894 ( .A(n802), .B(n801), .Y(n803) );
  NAND3X1 U895 ( .A(n805), .B(n804), .C(n803), .Y(n911) );
  AOI22X1 U896 ( .A(kin[14]), .B(n23), .C(kin[16]), .D(n105), .Y(n814) );
  AOI22X1 U897 ( .A(kin[10]), .B(n119), .C(kin[12]), .D(n115), .Y(n813) );
  OAI22X1 U898 ( .A(n807), .B(n43), .C(n31), .D(n806), .Y(n811) );
  OAI22X1 U899 ( .A(n10), .B(n809), .C(n20), .D(n808), .Y(n810) );
  NOR2X1 U900 ( .A(n811), .B(n810), .Y(n812) );
  NAND3X1 U901 ( .A(n814), .B(n813), .C(n812), .Y(n910) );
  AOI22X1 U902 ( .A(kin[45]), .B(n67), .C(kin[47]), .D(n62), .Y(n821) );
  AOI22X1 U903 ( .A(kin[41]), .B(n77), .C(kin[43]), .D(n72), .Y(n820) );
  OAI22X1 U904 ( .A(n13), .B(n828), .C(n6), .D(n815), .Y(n818) );
  OAI22X1 U905 ( .A(n95), .B(n816), .C(n3), .D(n834), .Y(n817) );
  NOR2X1 U906 ( .A(n818), .B(n817), .Y(n819) );
  NAND3X1 U907 ( .A(n821), .B(n820), .C(n819), .Y(n913) );
  AOI22X1 U908 ( .A(kin[52]), .B(n112), .C(kin[54]), .D(n105), .Y(n827) );
  AOI22X1 U909 ( .A(kin[48]), .B(n119), .C(kin[50]), .D(n115), .Y(n826) );
  OAI22X1 U910 ( .A(n43), .B(n822), .C(n31), .D(n835), .Y(n824) );
  OAI22X1 U911 ( .A(n141), .B(n860), .C(n20), .D(n859), .Y(n823) );
  NOR2X1 U912 ( .A(n824), .B(n823), .Y(n825) );
  NAND3X1 U913 ( .A(n827), .B(n826), .C(n825), .Y(n912) );
  AOI22X1 U914 ( .A(kin[48]), .B(n67), .C(kin[50]), .D(n62), .Y(n833) );
  AOI22X1 U915 ( .A(kin[44]), .B(n77), .C(kin[46]), .D(n72), .Y(n832) );
  OAI22X1 U916 ( .A(n13), .B(n851), .C(n6), .D(n844), .Y(n830) );
  OAI22X1 U917 ( .A(n95), .B(n828), .C(n3), .D(n852), .Y(n829) );
  NOR2X1 U918 ( .A(n830), .B(n829), .Y(n831) );
  NAND3X1 U919 ( .A(n833), .B(n832), .C(n831), .Y(n915) );
  AOI22X1 U920 ( .A(kin[55]), .B(n23), .C(kin[29]), .D(n105), .Y(n841) );
  AOI22X1 U921 ( .A(kin[51]), .B(n119), .C(kin[53]), .D(n115), .Y(n840) );
  OAI22X1 U922 ( .A(n43), .B(n834), .C(n31), .D(n853), .Y(n838) );
  OAI22X1 U923 ( .A(n10), .B(n836), .C(n20), .D(n835), .Y(n837) );
  NOR2X1 U924 ( .A(n838), .B(n837), .Y(n839) );
  NAND3X1 U925 ( .A(n841), .B(n840), .C(n839), .Y(n914) );
  AOI22X1 U926 ( .A(kin[53]), .B(n67), .C(kin[55]), .D(n62), .Y(n849) );
  AOI22X1 U927 ( .A(kin[49]), .B(n77), .C(kin[51]), .D(n72), .Y(n848) );
  OAI22X1 U928 ( .A(n13), .B(n842), .C(n6), .D(n871), .Y(n846) );
  OAI22X1 U929 ( .A(n95), .B(n844), .C(n3), .D(n843), .Y(n845) );
  NOR2X1 U930 ( .A(n846), .B(n845), .Y(n847) );
  NAND3X1 U931 ( .A(n849), .B(n848), .C(n847), .Y(n917) );
  AOI22X1 U932 ( .A(kin[32]), .B(n113), .C(kin[34]), .D(n105), .Y(n858) );
  AOI22X1 U933 ( .A(kin[28]), .B(n119), .C(kin[30]), .D(n115), .Y(n857) );
  OAI22X1 U934 ( .A(n43), .B(n851), .C(n31), .D(n850), .Y(n855) );
  OAI22X1 U935 ( .A(n36), .B(n853), .C(n20), .D(n852), .Y(n854) );
  NOR2X1 U936 ( .A(n855), .B(n854), .Y(n856) );
  NAND3X1 U937 ( .A(n858), .B(n857), .C(n856), .Y(n916) );
  AOI22X1 U938 ( .A(kin[36]), .B(n67), .C(kin[38]), .D(n62), .Y(n867) );
  AOI22X1 U939 ( .A(kin[32]), .B(n77), .C(kin[34]), .D(n72), .Y(n866) );
  OAI22X1 U940 ( .A(n13), .B(n860), .C(n6), .D(n859), .Y(n864) );
  OAI22X1 U941 ( .A(n95), .B(n862), .C(n3), .D(n861), .Y(n863) );
  NOR2X1 U942 ( .A(n864), .B(n863), .Y(n865) );
  NAND3X1 U943 ( .A(n867), .B(n866), .C(n865), .Y(n919) );
  AOI22X1 U944 ( .A(kin[43]), .B(n112), .C(kin[45]), .D(n105), .Y(n876) );
  AOI22X1 U945 ( .A(kin[39]), .B(n119), .C(kin[41]), .D(n115), .Y(n875) );
  OAI22X1 U946 ( .A(n43), .B(n869), .C(n31), .D(n868), .Y(n873) );
  OAI22X1 U947 ( .A(n10), .B(n871), .C(n20), .D(n870), .Y(n872) );
  NOR2X1 U948 ( .A(n873), .B(n872), .Y(n874) );
  NAND3X1 U949 ( .A(n876), .B(n875), .C(n874), .Y(n918) );
  AOI22X1 U950 ( .A(kin[19]), .B(n69), .C(kin[21]), .D(n64), .Y(n892) );
  AOI22X1 U951 ( .A(kin[15]), .B(n79), .C(kin[17]), .D(n73), .Y(n891) );
  OAI22X1 U952 ( .A(n13), .B(n882), .C(n6), .D(n880), .Y(n889) );
  OAI22X1 U953 ( .A(n96), .B(n886), .C(n3), .D(n884), .Y(n888) );
  NOR2X1 U954 ( .A(n889), .B(n888), .Y(n890) );
  NAND3X1 U955 ( .A(n892), .B(n891), .C(n890), .Y(n921) );
  AOI22X1 U956 ( .A(kin[26]), .B(n111), .C(kin[0]), .D(n107), .Y(n905) );
  AOI22X1 U957 ( .A(kin[22]), .B(n120), .C(kin[24]), .D(n115), .Y(n904) );
  OAI22X1 U958 ( .A(n43), .B(n898), .C(n39), .D(n896), .Y(n902) );
  OAI22X1 U959 ( .A(n10), .B(n900), .C(n20), .D(n899), .Y(n901) );
  NOR2X1 U960 ( .A(n902), .B(n901), .Y(n903) );
  NAND3X1 U961 ( .A(n905), .B(n904), .C(n903), .Y(n920) );
endmodule


module key_permutation2_1 ( kin, kout );
  input [55:0] kin;
  output [47:0] kout;
  wire   \kin[31] , \kin[28] , \kin[35] , \kin[49] , \kin[41] , \kin[45] ,
         \kin[52] , \kin[33] , \kin[55] , \kin[38] , \kin[48] , \kin[43] ,
         \kin[47] , \kin[32] , \kin[44] , \kin[50] , \kin[39] , \kin[29] ,
         \kin[54] , \kin[46] , \kin[36] , \kin[30] , \kin[51] , \kin[40] ,
         \kin[1] , \kin[12] , \kin[19] , \kin[26] , \kin[6] , \kin[15] ,
         \kin[7] , \kin[25] , \kin[3] , \kin[11] , \kin[18] , \kin[22] ,
         \kin[9] , \kin[20] , \kin[5] , \kin[14] , \kin[27] , \kin[2] ,
         \kin[4] , \kin[0] , \kin[23] , \kin[10] , \kin[16] , \kin[13] ;
  assign kout[47] = \kin[31] ;
  assign \kin[31]  = kin[31];
  assign kout[46] = \kin[28] ;
  assign \kin[28]  = kin[28];
  assign kout[45] = \kin[35] ;
  assign \kin[35]  = kin[35];
  assign kout[44] = \kin[49] ;
  assign \kin[49]  = kin[49];
  assign kout[43] = \kin[41] ;
  assign \kin[41]  = kin[41];
  assign kout[42] = \kin[45] ;
  assign \kin[45]  = kin[45];
  assign kout[41] = \kin[52] ;
  assign \kin[52]  = kin[52];
  assign kout[40] = \kin[33] ;
  assign \kin[33]  = kin[33];
  assign kout[39] = \kin[55] ;
  assign \kin[55]  = kin[55];
  assign kout[38] = \kin[38] ;
  assign \kin[38]  = kin[38];
  assign kout[37] = \kin[48] ;
  assign \kin[48]  = kin[48];
  assign kout[36] = \kin[43] ;
  assign \kin[43]  = kin[43];
  assign kout[35] = \kin[47] ;
  assign \kin[47]  = kin[47];
  assign kout[34] = \kin[32] ;
  assign \kin[32]  = kin[32];
  assign kout[33] = \kin[44] ;
  assign \kin[44]  = kin[44];
  assign kout[32] = \kin[50] ;
  assign \kin[50]  = kin[50];
  assign kout[31] = \kin[39] ;
  assign \kin[39]  = kin[39];
  assign kout[30] = \kin[29] ;
  assign \kin[29]  = kin[29];
  assign kout[29] = \kin[54] ;
  assign \kin[54]  = kin[54];
  assign kout[28] = \kin[46] ;
  assign \kin[46]  = kin[46];
  assign kout[27] = \kin[36] ;
  assign \kin[36]  = kin[36];
  assign kout[26] = \kin[30] ;
  assign \kin[30]  = kin[30];
  assign kout[25] = \kin[51] ;
  assign \kin[51]  = kin[51];
  assign kout[24] = \kin[40] ;
  assign \kin[40]  = kin[40];
  assign kout[23] = \kin[1] ;
  assign \kin[1]  = kin[1];
  assign kout[22] = \kin[12] ;
  assign \kin[12]  = kin[12];
  assign kout[21] = \kin[19] ;
  assign \kin[19]  = kin[19];
  assign kout[20] = \kin[26] ;
  assign \kin[26]  = kin[26];
  assign kout[19] = \kin[6] ;
  assign \kin[6]  = kin[6];
  assign kout[18] = \kin[15] ;
  assign \kin[15]  = kin[15];
  assign kout[17] = \kin[7] ;
  assign \kin[7]  = kin[7];
  assign kout[16] = \kin[25] ;
  assign \kin[25]  = kin[25];
  assign kout[15] = \kin[3] ;
  assign \kin[3]  = kin[3];
  assign kout[14] = \kin[11] ;
  assign \kin[11]  = kin[11];
  assign kout[13] = \kin[18] ;
  assign \kin[18]  = kin[18];
  assign kout[12] = \kin[22] ;
  assign \kin[22]  = kin[22];
  assign kout[11] = \kin[9] ;
  assign \kin[9]  = kin[9];
  assign kout[10] = \kin[20] ;
  assign \kin[20]  = kin[20];
  assign kout[9] = \kin[5] ;
  assign \kin[5]  = kin[5];
  assign kout[8] = \kin[14] ;
  assign \kin[14]  = kin[14];
  assign kout[7] = \kin[27] ;
  assign \kin[27]  = kin[27];
  assign kout[6] = \kin[2] ;
  assign \kin[2]  = kin[2];
  assign kout[5] = \kin[4] ;
  assign \kin[4]  = kin[4];
  assign kout[4] = \kin[0] ;
  assign \kin[0]  = kin[0];
  assign kout[3] = \kin[23] ;
  assign \kin[23]  = kin[23];
  assign kout[2] = \kin[10] ;
  assign \kin[10]  = kin[10];
  assign kout[1] = \kin[16] ;
  assign \kin[16]  = kin[16];
  assign kout[0] = \kin[13] ;
  assign \kin[13]  = kin[13];

endmodule


module key_wrapper_1 ( key_in, round_number, kout );
  input [63:0] key_in;
  input [4:0] round_number;
  output [47:0] kout;
  wire   n1;
  wire   [55:0] k_p1toshift;
  wire   [55:0] k_shifttop2;

  key_permutation1_1 KEY_PREMUTATION1 ( .k_o(key_in), .kout(k_p1toshift) );
  key_shift_1 KEY_SHIFT ( .kin(k_p1toshift), .k_out(k_shifttop2), .roundSel({
        round_number[4:1], n1}) );
  key_permutation2_1 KEY_PERMUTATION2 ( .kin(k_shifttop2), .kout(kout) );
  BUFX4 U1 ( .A(round_number[0]), .Y(n1) );
endmodule


module key_xor_1 ( data, key, out );
  input [47:0] data;
  input [47:0] key;
  output [47:0] out;
  wire   n3, n4, n5, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n29, n30, n31, n32, n33,
         n34, n35, n37;

  XNOR2X1 U1 ( .A(key[35]), .B(n14), .Y(out[35]) );
  XOR2X1 U2 ( .A(key[32]), .B(data[32]), .Y(out[32]) );
  INVX2 U3 ( .A(data[6]), .Y(n12) );
  INVX2 U4 ( .A(data[11]), .Y(n3) );
  INVX2 U5 ( .A(data[37]), .Y(n25) );
  INVX2 U6 ( .A(data[27]), .Y(n29) );
  INVX2 U7 ( .A(data[8]), .Y(n11) );
  INVX2 U8 ( .A(data[2]), .Y(n27) );
  INVX2 U9 ( .A(data[9]), .Y(n17) );
  INVX2 U10 ( .A(data[12]), .Y(n22) );
  INVX2 U11 ( .A(data[24]), .Y(n19) );
  INVX2 U12 ( .A(data[26]), .Y(n7) );
  INVX2 U13 ( .A(data[46]), .Y(n18) );
  INVX2 U14 ( .A(data[35]), .Y(n14) );
  INVX2 U15 ( .A(data[30]), .Y(n23) );
  INVX2 U16 ( .A(data[14]), .Y(n21) );
  INVX2 U17 ( .A(data[17]), .Y(n4) );
  INVX2 U18 ( .A(data[16]), .Y(n9) );
  INVX2 U19 ( .A(data[3]), .Y(n20) );
  INVX2 U20 ( .A(data[39]), .Y(n16) );
  INVX2 U21 ( .A(data[7]), .Y(n10) );
  INVX2 U22 ( .A(data[1]), .Y(n13) );
  INVX2 U23 ( .A(data[33]), .Y(n26) );
  INVX2 U24 ( .A(data[15]), .Y(n5) );
  AND2X2 U25 ( .A(n32), .B(n33), .Y(out[28]) );
  INVX2 U26 ( .A(data[29]), .Y(n34) );
  XOR2X1 U27 ( .A(key[18]), .B(data[18]), .Y(out[18]) );
  XNOR2X1 U28 ( .A(key[11]), .B(n3), .Y(out[11]) );
  XNOR2X1 U29 ( .A(key[17]), .B(n4), .Y(out[17]) );
  XNOR2X1 U30 ( .A(key[15]), .B(n5), .Y(out[15]) );
  XNOR2X1 U31 ( .A(key[26]), .B(n7), .Y(out[26]) );
  XNOR2X1 U32 ( .A(key[20]), .B(n8), .Y(out[20]) );
  INVX8 U33 ( .A(data[20]), .Y(n8) );
  XNOR2X1 U34 ( .A(key[8]), .B(n11), .Y(out[8]) );
  XOR2X1 U35 ( .A(key[25]), .B(data[25]), .Y(out[25]) );
  XNOR2X1 U36 ( .A(key[16]), .B(n9), .Y(out[16]) );
  XNOR2X1 U37 ( .A(key[7]), .B(n10), .Y(out[7]) );
  XNOR2X1 U38 ( .A(key[6]), .B(n12), .Y(out[6]) );
  XNOR2X1 U39 ( .A(key[1]), .B(n13), .Y(out[1]) );
  XNOR2X1 U40 ( .A(key[23]), .B(n15), .Y(out[23]) );
  INVX8 U41 ( .A(data[23]), .Y(n15) );
  XNOR2X1 U42 ( .A(key[39]), .B(n16), .Y(out[39]) );
  XOR2X1 U43 ( .A(key[4]), .B(data[4]), .Y(out[4]) );
  XNOR2X1 U44 ( .A(key[9]), .B(n17), .Y(out[9]) );
  XNOR2X1 U45 ( .A(key[29]), .B(n34), .Y(out[29]) );
  XNOR2X1 U46 ( .A(key[46]), .B(n18), .Y(out[46]) );
  XNOR2X1 U47 ( .A(key[24]), .B(n19), .Y(out[24]) );
  XOR2X1 U48 ( .A(key[41]), .B(data[41]), .Y(out[41]) );
  XNOR2X1 U49 ( .A(key[42]), .B(data[42]), .Y(n35) );
  XNOR2X1 U50 ( .A(key[3]), .B(n20), .Y(out[3]) );
  XNOR2X1 U51 ( .A(key[14]), .B(n21), .Y(out[14]) );
  XNOR2X1 U52 ( .A(key[12]), .B(n22), .Y(out[12]) );
  XNOR2X1 U53 ( .A(key[30]), .B(n23), .Y(out[30]) );
  XNOR2X1 U54 ( .A(key[45]), .B(n24), .Y(out[45]) );
  INVX8 U55 ( .A(data[45]), .Y(n24) );
  XNOR2X1 U56 ( .A(key[37]), .B(n25), .Y(out[37]) );
  XNOR2X1 U57 ( .A(key[33]), .B(n26), .Y(out[33]) );
  XNOR2X1 U58 ( .A(key[2]), .B(n27), .Y(out[2]) );
  XNOR2X1 U59 ( .A(key[27]), .B(n29), .Y(out[27]) );
  NAND2X1 U60 ( .A(key[28]), .B(data[28]), .Y(n32) );
  NAND2X1 U61 ( .A(n30), .B(n31), .Y(n33) );
  INVX1 U62 ( .A(key[28]), .Y(n30) );
  INVX1 U63 ( .A(data[28]), .Y(n31) );
  INVX4 U64 ( .A(n35), .Y(out[42]) );
  INVX4 U65 ( .A(n37), .Y(out[47]) );
  XNOR2X1 U66 ( .A(key[47]), .B(data[47]), .Y(n37) );
  XOR2X1 U67 ( .A(key[0]), .B(data[0]), .Y(out[0]) );
  XOR2X1 U68 ( .A(key[5]), .B(data[5]), .Y(out[5]) );
  XOR2X1 U69 ( .A(key[10]), .B(data[10]), .Y(out[10]) );
  XOR2X1 U70 ( .A(key[13]), .B(data[13]), .Y(out[13]) );
  XOR2X1 U71 ( .A(key[19]), .B(data[19]), .Y(out[19]) );
  XOR2X1 U72 ( .A(key[21]), .B(data[21]), .Y(out[21]) );
  XOR2X1 U73 ( .A(key[22]), .B(data[22]), .Y(out[22]) );
  XOR2X1 U74 ( .A(key[31]), .B(data[31]), .Y(out[31]) );
  XOR2X1 U75 ( .A(key[34]), .B(data[34]), .Y(out[34]) );
  XOR2X1 U76 ( .A(key[36]), .B(data[36]), .Y(out[36]) );
  XOR2X1 U77 ( .A(key[38]), .B(data[38]), .Y(out[38]) );
  XOR2X1 U78 ( .A(key[40]), .B(data[40]), .Y(out[40]) );
  XOR2X1 U79 ( .A(key[43]), .B(data[43]), .Y(out[43]) );
  XOR2X1 U80 ( .A(key[44]), .B(data[44]), .Y(out[44]) );
endmodule


module Sbox1_1 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N48, N129, N165, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145;
  assign data_out[3] = N48;
  assign data_out[1] = N129;
  assign data_out[0] = N165;

  INVX4 U1 ( .A(n10), .Y(n39) );
  INVX4 U2 ( .A(n46), .Y(n1) );
  INVX1 U3 ( .A(n46), .Y(n131) );
  INVX4 U4 ( .A(n45), .Y(n46) );
  NOR2X1 U5 ( .A(data_in[0]), .B(data_in[5]), .Y(n2) );
  INVX2 U6 ( .A(n2), .Y(n124) );
  INVX2 U7 ( .A(data_in[0]), .Y(n13) );
  INVX2 U8 ( .A(data_in[0]), .Y(n34) );
  INVX2 U9 ( .A(n31), .Y(n3) );
  BUFX4 U10 ( .A(n46), .Y(n31) );
  MUX2X1 U11 ( .B(n110), .A(n9), .S(n30), .Y(n111) );
  INVX4 U12 ( .A(n37), .Y(n30) );
  INVX2 U13 ( .A(n100), .Y(n48) );
  INVX2 U14 ( .A(n22), .Y(n125) );
  INVX2 U15 ( .A(data_in[5]), .Y(n91) );
  INVX2 U16 ( .A(n26), .Y(n136) );
  BUFX2 U17 ( .A(n32), .Y(n38) );
  AND2X2 U18 ( .A(data_in[5]), .B(data_in[0]), .Y(n4) );
  INVX2 U19 ( .A(data_in[3]), .Y(n5) );
  INVX2 U20 ( .A(data_in[3]), .Y(n6) );
  INVX2 U21 ( .A(data_in[3]), .Y(n128) );
  AND2X2 U22 ( .A(data_in[5]), .B(data_in[0]), .Y(n7) );
  AND2X2 U23 ( .A(n6), .B(n1), .Y(n8) );
  AND2X2 U24 ( .A(n10), .B(data_in[3]), .Y(n22) );
  BUFX2 U25 ( .A(n42), .Y(n9) );
  BUFX2 U26 ( .A(data_in[2]), .Y(n10) );
  INVX2 U27 ( .A(n125), .Y(n11) );
  NAND2X1 U28 ( .A(n46), .B(n22), .Y(n12) );
  BUFX4 U29 ( .A(data_in[5]), .Y(n37) );
  INVX1 U30 ( .A(n13), .Y(n14) );
  BUFX2 U31 ( .A(data_in[0]), .Y(n25) );
  NAND2X1 U32 ( .A(n13), .B(n91), .Y(n15) );
  AND2X2 U33 ( .A(n7), .B(n39), .Y(n16) );
  INVX2 U34 ( .A(n45), .Y(n17) );
  INVX4 U35 ( .A(n19), .Y(n135) );
  INVX2 U36 ( .A(n124), .Y(n47) );
  INVX4 U37 ( .A(n15), .Y(n138) );
  AND2X2 U38 ( .A(n26), .B(n33), .Y(n18) );
  OR2X2 U39 ( .A(n45), .B(data_in[3]), .Y(n19) );
  OR2X2 U40 ( .A(n45), .B(data_in[3]), .Y(n20) );
  AND2X2 U41 ( .A(n44), .B(n113), .Y(n21) );
  INVX2 U42 ( .A(n40), .Y(n23) );
  INVX4 U43 ( .A(n23), .Y(n24) );
  BUFX2 U44 ( .A(data_in[2]), .Y(n40) );
  AND2X2 U45 ( .A(n6), .B(n131), .Y(n26) );
  BUFX2 U46 ( .A(n124), .Y(n27) );
  AND2X1 U47 ( .A(n42), .B(n32), .Y(n35) );
  AND2X2 U48 ( .A(n14), .B(n91), .Y(n28) );
  INVX1 U49 ( .A(n5), .Y(n29) );
  AND2X2 U50 ( .A(n13), .B(data_in[5]), .Y(n32) );
  AND2X2 U51 ( .A(n7), .B(n39), .Y(n33) );
  INVX2 U52 ( .A(n4), .Y(n133) );
  INVX1 U53 ( .A(n35), .Y(n123) );
  INVX1 U54 ( .A(n18), .Y(n36) );
  INVX1 U55 ( .A(data_in[2]), .Y(n113) );
  AND2X2 U56 ( .A(n40), .B(n128), .Y(n42) );
  AND2X2 U57 ( .A(n122), .B(n121), .Y(n41) );
  INVX4 U58 ( .A(data_in[4]), .Y(n45) );
  INVX4 U59 ( .A(data_in[1]), .Y(n43) );
  INVX8 U60 ( .A(n43), .Y(n44) );
  NAND2X1 U61 ( .A(data_in[3]), .B(n113), .Y(n100) );
  NAND3X1 U62 ( .A(n48), .B(n44), .C(n47), .Y(n51) );
  NAND2X1 U63 ( .A(data_in[3]), .B(n1), .Y(n106) );
  NAND3X1 U64 ( .A(n107), .B(n7), .C(n44), .Y(n50) );
  NAND2X1 U65 ( .A(n44), .B(n113), .Y(n121) );
  NAND2X1 U66 ( .A(data_in[0]), .B(n91), .Y(n79) );
  NAND2X1 U67 ( .A(n34), .B(data_in[5]), .Y(n86) );
  NAND2X1 U68 ( .A(n79), .B(n86), .Y(n134) );
  NAND3X1 U69 ( .A(n134), .B(n21), .C(n8), .Y(n49) );
  NAND3X1 U70 ( .A(n51), .B(n50), .C(n49), .Y(n58) );
  OAI21X1 U71 ( .A(n17), .B(n30), .C(n133), .Y(n52) );
  NAND3X1 U72 ( .A(n11), .B(n52), .C(n44), .Y(n53) );
  INVX2 U73 ( .A(n53), .Y(n57) );
  NAND3X1 U74 ( .A(n28), .B(n44), .C(n24), .Y(n55) );
  NAND2X1 U75 ( .A(n16), .B(n135), .Y(n54) );
  OAI21X1 U76 ( .A(n20), .B(n55), .C(n54), .Y(n56) );
  NOR3X1 U77 ( .A(n57), .B(n56), .C(n58), .Y(n73) );
  INVX2 U78 ( .A(n44), .Y(n99) );
  NAND2X1 U79 ( .A(n48), .B(n32), .Y(n98) );
  NAND2X1 U80 ( .A(n32), .B(n17), .Y(n78) );
  AND2X2 U81 ( .A(n98), .B(n78), .Y(n63) );
  NOR2X1 U82 ( .A(n37), .B(n39), .Y(n60) );
  NOR2X1 U83 ( .A(n24), .B(n25), .Y(n59) );
  MUX2X1 U84 ( .B(n60), .A(n59), .S(n17), .Y(n62) );
  AOI22X1 U85 ( .A(n16), .B(n6), .C(n135), .D(n37), .Y(n61) );
  NAND3X1 U86 ( .A(n63), .B(n62), .C(n61), .Y(n64) );
  NAND2X1 U87 ( .A(n99), .B(n64), .Y(n72) );
  OAI21X1 U88 ( .A(n37), .B(n100), .C(n123), .Y(n70) );
  NOR2X1 U89 ( .A(n138), .B(n99), .Y(n68) );
  NAND2X1 U90 ( .A(n79), .B(n99), .Y(n65) );
  NAND3X1 U91 ( .A(n31), .B(n29), .C(n65), .Y(n67) );
  AOI22X1 U92 ( .A(n11), .B(n25), .C(n9), .D(n138), .Y(n66) );
  OAI22X1 U93 ( .A(n68), .B(n67), .C(n66), .D(n31), .Y(n69) );
  AOI21X1 U94 ( .A(n31), .B(n70), .C(n69), .Y(n71) );
  NAND3X1 U95 ( .A(n72), .B(n71), .C(n73), .Y(N165) );
  NOR2X1 U96 ( .A(n37), .B(n20), .Y(n75) );
  OAI21X1 U97 ( .A(n31), .B(n37), .C(n78), .Y(n74) );
  AOI22X1 U98 ( .A(n75), .B(n39), .C(n48), .D(n74), .Y(n97) );
  NAND3X1 U99 ( .A(n44), .B(n4), .C(n24), .Y(n76) );
  OAI21X1 U100 ( .A(n121), .B(n79), .C(n76), .Y(n101) );
  NAND2X1 U101 ( .A(n135), .B(n24), .Y(n90) );
  INVX2 U102 ( .A(n90), .Y(n77) );
  AOI22X1 U103 ( .A(n101), .B(n3), .C(n77), .D(n4), .Y(n96) );
  OAI21X1 U104 ( .A(n24), .B(n78), .C(n99), .Y(n94) );
  AOI21X1 U105 ( .A(n135), .B(n138), .C(n18), .Y(n85) );
  MUX2X1 U106 ( .B(n124), .A(n79), .S(n42), .Y(n83) );
  OAI21X1 U107 ( .A(n86), .B(n39), .C(n1), .Y(n82) );
  NAND2X1 U108 ( .A(n46), .B(n22), .Y(n108) );
  AOI21X1 U109 ( .A(n4), .B(n29), .C(n1), .Y(n80) );
  OAI21X1 U110 ( .A(n34), .B(n12), .C(n80), .Y(n81) );
  OAI21X1 U111 ( .A(n82), .B(n83), .C(n81), .Y(n84) );
  NAND2X1 U112 ( .A(n85), .B(n84), .Y(n93) );
  OAI21X1 U113 ( .A(n86), .B(n106), .C(n44), .Y(n88) );
  OAI22X1 U114 ( .A(n34), .B(n20), .C(n124), .D(n12), .Y(n87) );
  NOR2X1 U115 ( .A(n88), .B(n87), .Y(n89) );
  OAI21X1 U116 ( .A(n30), .B(n90), .C(n89), .Y(n92) );
  OAI21X1 U117 ( .A(n94), .B(n93), .C(n92), .Y(n95) );
  NAND3X1 U118 ( .A(n96), .B(n97), .C(n95), .Y(N129) );
  INVX2 U119 ( .A(n98), .Y(n105) );
  NAND2X1 U120 ( .A(n100), .B(n99), .Y(n122) );
  NAND2X1 U121 ( .A(n122), .B(n121), .Y(n103) );
  INVX2 U122 ( .A(n101), .Y(n102) );
  OAI21X1 U123 ( .A(n27), .B(n103), .C(n102), .Y(n104) );
  MUX2X1 U124 ( .B(n105), .A(n104), .S(n31), .Y(n120) );
  INVX2 U125 ( .A(n106), .Y(n107) );
  AOI22X1 U126 ( .A(n107), .B(n28), .C(n26), .D(n34), .Y(n112) );
  OAI21X1 U127 ( .A(n5), .B(n1), .C(n39), .Y(n109) );
  NAND2X1 U128 ( .A(n109), .B(n108), .Y(n110) );
  NAND2X1 U129 ( .A(n111), .B(n112), .Y(n118) );
  NOR2X1 U130 ( .A(n17), .B(n15), .Y(n114) );
  AOI22X1 U131 ( .A(n114), .B(n39), .C(n28), .D(n8), .Y(n116) );
  AOI22X1 U132 ( .A(n135), .B(n38), .C(n4), .D(n11), .Y(n115) );
  NAND2X1 U133 ( .A(n116), .B(n115), .Y(n117) );
  MUX2X1 U134 ( .B(n118), .A(n117), .S(n44), .Y(n119) );
  NAND3X1 U135 ( .A(n120), .B(n36), .C(n119), .Y(data_out[2]) );
  MUX2X1 U136 ( .B(n28), .A(n138), .S(n44), .Y(n129) );
  OAI21X1 U137 ( .A(n124), .B(n125), .C(n1), .Y(n126) );
  NOR2X1 U138 ( .A(n35), .B(n126), .Y(n127) );
  OAI21X1 U139 ( .A(n129), .B(n5), .C(n127), .Y(n130) );
  AOI21X1 U140 ( .A(n41), .B(n38), .C(n130), .Y(n145) );
  AOI21X1 U141 ( .A(n25), .B(n41), .C(n3), .Y(n144) );
  MUX2X1 U142 ( .B(n31), .A(n8), .S(n25), .Y(n132) );
  OAI21X1 U143 ( .A(n31), .B(n133), .C(n132), .Y(n142) );
  NAND2X1 U144 ( .A(n135), .B(n134), .Y(n140) );
  MUX2X1 U145 ( .B(n136), .A(n20), .S(n44), .Y(n137) );
  OAI21X1 U146 ( .A(n138), .B(n7), .C(n137), .Y(n139) );
  OAI21X1 U147 ( .A(n44), .B(n140), .C(n139), .Y(n141) );
  AOI21X1 U148 ( .A(n21), .B(n142), .C(n141), .Y(n143) );
  OAI21X1 U149 ( .A(n145), .B(n144), .C(n143), .Y(N48) );
endmodule


module Sbox2_1 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N62, N106, N138, N163, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134;
  assign data_out[3] = N62;
  assign data_out[2] = N106;
  assign data_out[1] = N138;
  assign data_out[0] = N163;

  AND2X2 U1 ( .A(data_in[0]), .B(n41), .Y(n1) );
  BUFX2 U2 ( .A(n25), .Y(n2) );
  INVX2 U3 ( .A(data_in[0]), .Y(n25) );
  BUFX2 U4 ( .A(n115), .Y(n3) );
  BUFX4 U5 ( .A(n20), .Y(n4) );
  INVX2 U6 ( .A(n20), .Y(n95) );
  BUFX2 U7 ( .A(n96), .Y(n5) );
  INVX2 U8 ( .A(n96), .Y(n94) );
  INVX2 U9 ( .A(n21), .Y(n123) );
  BUFX2 U10 ( .A(n15), .Y(n6) );
  INVX1 U11 ( .A(n26), .Y(n7) );
  BUFX2 U12 ( .A(data_in[5]), .Y(n40) );
  NAND2X1 U13 ( .A(n37), .B(n106), .Y(n8) );
  NAND2X1 U14 ( .A(n37), .B(n106), .Y(n9) );
  INVX4 U15 ( .A(n43), .Y(n44) );
  INVX2 U16 ( .A(n27), .Y(n28) );
  NAND2X1 U17 ( .A(n42), .B(n111), .Y(n10) );
  INVX4 U18 ( .A(n62), .Y(n117) );
  AND2X2 U19 ( .A(n23), .B(n26), .Y(n11) );
  INVX4 U20 ( .A(n8), .Y(n92) );
  BUFX2 U21 ( .A(n111), .Y(n12) );
  INVX4 U22 ( .A(n44), .Y(n111) );
  INVX2 U23 ( .A(n15), .Y(n125) );
  BUFX2 U24 ( .A(data_in[3]), .Y(n38) );
  BUFX4 U25 ( .A(data_in[3]), .Y(n39) );
  AND2X2 U26 ( .A(n42), .B(n111), .Y(n13) );
  INVX1 U27 ( .A(n39), .Y(n14) );
  INVX4 U28 ( .A(n18), .Y(n96) );
  NAND2X1 U29 ( .A(n40), .B(n25), .Y(n15) );
  NAND2X1 U30 ( .A(n41), .B(n25), .Y(n16) );
  BUFX4 U31 ( .A(data_in[5]), .Y(n41) );
  NOR2X1 U32 ( .A(n39), .B(n36), .Y(n17) );
  INVX1 U33 ( .A(n17), .Y(n128) );
  INVX4 U34 ( .A(n38), .Y(n106) );
  INVX4 U35 ( .A(n36), .Y(n114) );
  AND2X2 U36 ( .A(data_in[0]), .B(n41), .Y(n18) );
  AND2X2 U37 ( .A(n11), .B(n13), .Y(n19) );
  INVX1 U38 ( .A(n37), .Y(n31) );
  INVX1 U39 ( .A(n105), .Y(n113) );
  BUFX4 U40 ( .A(data_in[4]), .Y(n42) );
  NOR2X1 U41 ( .A(data_in[0]), .B(n40), .Y(n20) );
  INVX2 U42 ( .A(n40), .Y(n26) );
  BUFX4 U43 ( .A(data_in[2]), .Y(n36) );
  AND2X2 U44 ( .A(n44), .B(n107), .Y(n21) );
  AND2X2 U45 ( .A(n44), .B(n107), .Y(n22) );
  INVX1 U46 ( .A(n25), .Y(n23) );
  AND2X2 U47 ( .A(n95), .B(n96), .Y(n32) );
  MUX2X1 U48 ( .B(n85), .A(n96), .S(n43), .Y(n24) );
  AND2X1 U49 ( .A(n125), .B(n28), .Y(n29) );
  INVX1 U50 ( .A(n44), .Y(n27) );
  NOR2X1 U51 ( .A(n29), .B(n124), .Y(n129) );
  INVX1 U52 ( .A(n25), .Y(n30) );
  BUFX4 U53 ( .A(data_in[2]), .Y(n37) );
  INVX4 U54 ( .A(data_in[1]), .Y(n43) );
  OR2X2 U55 ( .A(n31), .B(n16), .Y(n82) );
  INVX4 U56 ( .A(data_in[4]), .Y(n107) );
  AND2X1 U57 ( .A(n107), .B(n111), .Y(n33) );
  AND2X2 U58 ( .A(n39), .B(n114), .Y(n34) );
  AND2X2 U59 ( .A(n21), .B(n106), .Y(n35) );
  NAND2X1 U60 ( .A(n42), .B(n44), .Y(n50) );
  NOR2X1 U61 ( .A(n14), .B(n50), .Y(n46) );
  NAND2X1 U62 ( .A(n37), .B(n39), .Y(n97) );
  OAI21X1 U63 ( .A(n28), .B(n97), .C(n128), .Y(n45) );
  MUX2X1 U64 ( .B(n46), .A(n45), .S(n4), .Y(n57) );
  AOI22X1 U65 ( .A(n33), .B(n30), .C(n4), .D(n22), .Y(n48) );
  NAND2X1 U66 ( .A(n39), .B(n107), .Y(n62) );
  AOI22X1 U67 ( .A(n13), .B(n125), .C(n94), .D(n117), .Y(n47) );
  NAND2X1 U68 ( .A(n48), .B(n47), .Y(n49) );
  NAND2X1 U69 ( .A(n23), .B(n26), .Y(n85) );
  NAND2X1 U70 ( .A(n13), .B(n11), .Y(n63) );
  MUX2X1 U71 ( .B(n49), .A(n19), .S(n37), .Y(n56) );
  INVX2 U72 ( .A(n50), .Y(n115) );
  AOI22X1 U73 ( .A(n11), .B(n22), .C(n115), .D(n4), .Y(n51) );
  OAI21X1 U74 ( .A(n10), .B(n5), .C(n51), .Y(n54) );
  NAND3X1 U75 ( .A(n41), .B(n22), .C(n92), .Y(n52) );
  OAI21X1 U76 ( .A(n42), .B(n82), .C(n52), .Y(n53) );
  AOI21X1 U77 ( .A(n54), .B(n14), .C(n53), .Y(n55) );
  NAND3X1 U78 ( .A(n57), .B(n56), .C(n55), .Y(N163) );
  MUX2X1 U79 ( .B(n125), .A(n4), .S(n17), .Y(n58) );
  OAI21X1 U80 ( .A(n30), .B(n97), .C(n58), .Y(n61) );
  OAI21X1 U81 ( .A(n117), .B(n33), .C(n114), .Y(n59) );
  OAI21X1 U82 ( .A(n123), .B(n9), .C(n59), .Y(n60) );
  AOI22X1 U83 ( .A(n61), .B(n115), .C(n60), .D(n26), .Y(n75) );
  OAI22X1 U84 ( .A(n28), .B(n62), .C(n10), .D(n9), .Y(n126) );
  AOI22X1 U85 ( .A(n24), .B(n92), .C(n4), .D(n126), .Y(n74) );
  NAND2X1 U86 ( .A(n1), .B(n17), .Y(n105) );
  OAI22X1 U87 ( .A(n105), .B(n107), .C(n106), .D(n63), .Y(n72) );
  NOR2X1 U88 ( .A(n39), .B(n16), .Y(n65) );
  NOR2X1 U89 ( .A(n42), .B(n16), .Y(n64) );
  AOI22X1 U90 ( .A(n65), .B(n22), .C(n64), .D(n92), .Y(n70) );
  INVX2 U91 ( .A(n97), .Y(n108) );
  NAND3X1 U92 ( .A(n108), .B(n42), .C(n125), .Y(n69) );
  MUX2X1 U93 ( .B(n37), .A(n2), .S(n44), .Y(n67) );
  NOR2X1 U94 ( .A(n114), .B(n96), .Y(n66) );
  AOI22X1 U95 ( .A(n117), .B(n67), .C(n13), .D(n66), .Y(n68) );
  NAND3X1 U96 ( .A(n69), .B(n70), .C(n68), .Y(n71) );
  NOR2X1 U97 ( .A(n72), .B(n71), .Y(n73) );
  NAND3X1 U98 ( .A(n75), .B(n74), .C(n73), .Y(N138) );
  OAI21X1 U99 ( .A(n39), .B(n32), .C(n82), .Y(n79) );
  NAND2X1 U100 ( .A(n37), .B(n22), .Y(n77) );
  NAND2X1 U101 ( .A(n92), .B(n42), .Y(n76) );
  MUX2X1 U102 ( .B(n77), .A(n76), .S(n41), .Y(n78) );
  AOI21X1 U103 ( .A(n3), .B(n79), .C(n78), .Y(n91) );
  AOI22X1 U104 ( .A(n94), .B(n28), .C(n12), .D(n26), .Y(n80) );
  OAI22X1 U105 ( .A(n123), .B(n16), .C(n80), .D(n106), .Y(n81) );
  OAI21X1 U106 ( .A(n19), .B(n81), .C(n114), .Y(n90) );
  NAND2X1 U107 ( .A(n20), .B(n114), .Y(n116) );
  NAND3X1 U108 ( .A(n82), .B(n105), .C(n116), .Y(n88) );
  AOI21X1 U109 ( .A(n92), .B(n107), .C(n35), .Y(n86) );
  MUX2X1 U110 ( .B(n6), .A(n95), .S(n39), .Y(n83) );
  AOI22X1 U111 ( .A(n13), .B(n83), .C(n108), .D(n24), .Y(n84) );
  OAI21X1 U112 ( .A(n86), .B(n85), .C(n84), .Y(n87) );
  AOI21X1 U113 ( .A(n33), .B(n88), .C(n87), .Y(n89) );
  NAND3X1 U114 ( .A(n91), .B(n90), .C(n89), .Y(N106) );
  MUX2X1 U115 ( .B(n92), .A(n108), .S(n41), .Y(n93) );
  OAI21X1 U116 ( .A(n32), .B(n114), .C(n93), .Y(n104) );
  NAND3X1 U117 ( .A(n94), .B(n114), .C(n22), .Y(n102) );
  NAND3X1 U118 ( .A(n37), .B(n11), .C(n117), .Y(n101) );
  NOR2X1 U119 ( .A(n95), .B(n9), .Y(n99) );
  NOR2X1 U120 ( .A(n97), .B(n96), .Y(n98) );
  MUX2X1 U121 ( .B(n99), .A(n98), .S(n42), .Y(n100) );
  NAND3X1 U122 ( .A(n102), .B(n101), .C(n100), .Y(n103) );
  AOI21X1 U123 ( .A(n3), .B(n104), .C(n103), .Y(n134) );
  NAND2X1 U124 ( .A(n107), .B(n106), .Y(n110) );
  OAI21X1 U125 ( .A(n117), .B(n108), .C(n11), .Y(n109) );
  OAI21X1 U126 ( .A(n32), .B(n110), .C(n109), .Y(n112) );
  OAI21X1 U127 ( .A(n113), .B(n112), .C(n12), .Y(n133) );
  NAND3X1 U128 ( .A(n11), .B(n115), .C(n34), .Y(n122) );
  INVX2 U129 ( .A(n116), .Y(n119) );
  NAND3X1 U130 ( .A(n119), .B(n28), .C(n117), .Y(n121) );
  NOR2X1 U131 ( .A(n28), .B(n16), .Y(n118) );
  AOI22X1 U132 ( .A(n13), .B(n119), .C(n118), .D(n34), .Y(n120) );
  NAND3X1 U133 ( .A(n122), .B(n121), .C(n120), .Y(n131) );
  OAI22X1 U134 ( .A(n7), .B(n10), .C(n2), .D(n123), .Y(n124) );
  OAI21X1 U135 ( .A(n35), .B(n126), .C(n125), .Y(n127) );
  OAI21X1 U136 ( .A(n129), .B(n128), .C(n127), .Y(n130) );
  NOR2X1 U137 ( .A(n131), .B(n130), .Y(n132) );
  NAND3X1 U138 ( .A(n133), .B(n134), .C(n132), .Y(N62) );
endmodule


module Sbox3_1 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N62, N100, N138, N167, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150;
  assign data_out[3] = N62;
  assign data_out[2] = N100;
  assign data_out[1] = N138;
  assign data_out[0] = N167;

  INVX1 U1 ( .A(n20), .Y(n1) );
  INVX1 U2 ( .A(n1), .Y(n2) );
  BUFX2 U3 ( .A(n142), .Y(n3) );
  BUFX2 U4 ( .A(n29), .Y(n4) );
  INVX2 U5 ( .A(n28), .Y(n16) );
  AND2X1 U6 ( .A(n28), .B(n97), .Y(n67) );
  BUFX2 U7 ( .A(n59), .Y(n5) );
  INVX2 U8 ( .A(data_in[0]), .Y(n59) );
  INVX2 U9 ( .A(n30), .Y(n6) );
  INVX1 U10 ( .A(n15), .Y(n7) );
  INVX1 U11 ( .A(n115), .Y(n8) );
  NAND2X1 U12 ( .A(n26), .B(n125), .Y(n9) );
  INVX4 U13 ( .A(n32), .Y(n125) );
  AND2X2 U14 ( .A(n21), .B(n4), .Y(n10) );
  INVX2 U15 ( .A(n10), .Y(n72) );
  AND2X2 U16 ( .A(n23), .B(n33), .Y(n11) );
  AND2X2 U17 ( .A(n22), .B(n125), .Y(n12) );
  INVX4 U18 ( .A(n28), .Y(n89) );
  INVX1 U19 ( .A(n136), .Y(n45) );
  INVX2 U20 ( .A(n97), .Y(n13) );
  MUX2X1 U21 ( .B(n12), .A(n42), .S(n89), .Y(n93) );
  INVX1 U22 ( .A(n26), .Y(n64) );
  NAND2X1 U23 ( .A(n14), .B(n16), .Y(n60) );
  INVX4 U24 ( .A(n14), .Y(n24) );
  AND2X2 U25 ( .A(n62), .B(n61), .Y(n63) );
  INVX1 U26 ( .A(n24), .Y(n115) );
  INVX1 U27 ( .A(n24), .Y(n100) );
  OR2X2 U28 ( .A(data_in[2]), .B(n29), .Y(n113) );
  AND2X2 U29 ( .A(data_in[5]), .B(n59), .Y(n14) );
  INVX4 U30 ( .A(data_in[4]), .Y(n31) );
  INVX1 U31 ( .A(n24), .Y(n137) );
  NAND2X1 U32 ( .A(n18), .B(n97), .Y(n15) );
  NAND2X1 U33 ( .A(n125), .B(n16), .Y(n17) );
  NAND2X1 U34 ( .A(n17), .B(n142), .Y(n114) );
  INVX4 U35 ( .A(data_in[1]), .Y(n25) );
  INVX1 U36 ( .A(n28), .Y(n56) );
  INVX4 U37 ( .A(n31), .Y(n32) );
  INVX4 U38 ( .A(data_in[5]), .Y(n97) );
  INVX4 U39 ( .A(n31), .Y(n33) );
  INVX2 U40 ( .A(n59), .Y(n18) );
  AND2X2 U41 ( .A(n32), .B(n26), .Y(n19) );
  INVX4 U42 ( .A(n19), .Y(n141) );
  INVX1 U43 ( .A(n113), .Y(n68) );
  AND2X2 U44 ( .A(n27), .B(n29), .Y(n20) );
  INVX4 U45 ( .A(n20), .Y(n142) );
  AND2X2 U46 ( .A(data_in[5]), .B(data_in[0]), .Y(n21) );
  INVX2 U47 ( .A(n21), .Y(n126) );
  INVX1 U48 ( .A(n122), .Y(n123) );
  INVX4 U49 ( .A(data_in[2]), .Y(n27) );
  INVX1 U50 ( .A(n24), .Y(n66) );
  INVX4 U51 ( .A(data_in[3]), .Y(n29) );
  AND2X2 U52 ( .A(n59), .B(n97), .Y(n22) );
  INVX2 U53 ( .A(n22), .Y(n127) );
  AND2X2 U54 ( .A(n18), .B(n97), .Y(n23) );
  INVX8 U55 ( .A(n25), .Y(n26) );
  INVX8 U56 ( .A(n27), .Y(n28) );
  INVX8 U57 ( .A(n29), .Y(n30) );
  NAND2X1 U58 ( .A(n26), .B(n125), .Y(n122) );
  NOR2X1 U59 ( .A(n97), .B(n9), .Y(n35) );
  INVX2 U60 ( .A(n113), .Y(n138) );
  OAI22X1 U61 ( .A(n6), .B(n141), .C(n30), .D(n9), .Y(n34) );
  OAI21X1 U62 ( .A(n24), .B(n89), .C(n15), .Y(n109) );
  AOI22X1 U63 ( .A(n35), .B(n138), .C(n34), .D(n109), .Y(n51) );
  INVX2 U64 ( .A(n141), .Y(n36) );
  OAI21X1 U65 ( .A(n30), .B(n36), .C(n130), .Y(n37) );
  AOI21X1 U66 ( .A(n30), .B(n9), .C(n37), .Y(n40) );
  NAND2X1 U67 ( .A(n32), .B(n30), .Y(n121) );
  INVX2 U68 ( .A(n121), .Y(n110) );
  NAND2X1 U69 ( .A(n110), .B(n21), .Y(n94) );
  NAND3X1 U70 ( .A(n33), .B(n5), .C(n20), .Y(n38) );
  OAI21X1 U71 ( .A(n28), .B(n94), .C(n38), .Y(n39) );
  NOR2X1 U72 ( .A(n39), .B(n40), .Y(n50) );
  NAND2X1 U73 ( .A(n23), .B(n33), .Y(n88) );
  AOI22X1 U74 ( .A(n11), .B(n28), .C(n10), .D(n125), .Y(n41) );
  OAI21X1 U75 ( .A(n8), .B(n3), .C(n41), .Y(n48) );
  NOR2X1 U76 ( .A(n33), .B(n15), .Y(n42) );
  NAND2X1 U77 ( .A(n22), .B(n125), .Y(n128) );
  NAND2X1 U78 ( .A(n28), .B(n30), .Y(n136) );
  NAND2X1 U79 ( .A(n28), .B(n33), .Y(n71) );
  INVX2 U80 ( .A(n71), .Y(n43) );
  NOR2X1 U81 ( .A(n18), .B(n43), .Y(n44) );
  OAI21X1 U82 ( .A(n33), .B(n45), .C(n44), .Y(n46) );
  NAND2X1 U83 ( .A(n93), .B(n46), .Y(n47) );
  INVX2 U84 ( .A(n26), .Y(n124) );
  OAI21X1 U85 ( .A(n48), .B(n47), .C(n124), .Y(n49) );
  NAND3X1 U86 ( .A(n51), .B(n50), .C(n49), .Y(N167) );
  NAND3X1 U87 ( .A(n28), .B(n26), .C(n4), .Y(n52) );
  OAI21X1 U88 ( .A(n33), .B(n113), .C(n52), .Y(n116) );
  NAND2X1 U89 ( .A(n22), .B(n116), .Y(n80) );
  NOR2X1 U90 ( .A(n21), .B(n89), .Y(n54) );
  OAI21X1 U91 ( .A(n13), .B(n33), .C(n127), .Y(n53) );
  OAI21X1 U92 ( .A(n54), .B(n53), .C(n30), .Y(n58) );
  NOR2X1 U93 ( .A(n24), .B(n30), .Y(n55) );
  AOI22X1 U94 ( .A(n12), .B(n56), .C(n55), .D(n33), .Y(n57) );
  NAND2X1 U95 ( .A(n58), .B(n57), .Y(n65) );
  AOI21X1 U96 ( .A(n60), .B(n5), .C(n122), .Y(n62) );
  NAND3X1 U97 ( .A(n136), .B(n60), .C(n142), .Y(n61) );
  AOI21X1 U98 ( .A(n65), .B(n64), .C(n63), .Y(n79) );
  MUX2X1 U99 ( .B(n67), .A(n66), .S(n30), .Y(n70) );
  NAND2X1 U100 ( .A(n23), .B(n68), .Y(n69) );
  NAND3X1 U101 ( .A(n69), .B(n72), .C(n70), .Y(n77) );
  OAI21X1 U102 ( .A(n72), .B(n71), .C(n141), .Y(n76) );
  OAI21X1 U103 ( .A(n138), .B(n110), .C(n21), .Y(n74) );
  NAND3X1 U104 ( .A(n124), .B(n11), .C(n2), .Y(n73) );
  OAI21X1 U105 ( .A(n26), .B(n74), .C(n73), .Y(n75) );
  AOI21X1 U106 ( .A(n77), .B(n76), .C(n75), .Y(n78) );
  NAND3X1 U107 ( .A(n80), .B(n78), .C(n79), .Y(N138) );
  NOR2X1 U108 ( .A(n26), .B(n126), .Y(n81) );
  NAND3X1 U109 ( .A(n89), .B(n81), .C(n30), .Y(n85) );
  MUX2X1 U110 ( .B(n30), .A(n28), .S(n26), .Y(n82) );
  NAND2X1 U111 ( .A(n82), .B(n100), .Y(n84) );
  NAND2X1 U112 ( .A(n20), .B(n23), .Y(n83) );
  NAND3X1 U113 ( .A(n85), .B(n84), .C(n83), .Y(n87) );
  NOR2X1 U114 ( .A(n126), .B(n142), .Y(n86) );
  MUX2X1 U115 ( .B(n87), .A(n86), .S(n33), .Y(n108) );
  OAI21X1 U116 ( .A(n89), .B(n15), .C(n88), .Y(n91) );
  OAI21X1 U117 ( .A(n125), .B(n24), .C(n128), .Y(n90) );
  OAI21X1 U118 ( .A(n91), .B(n90), .C(n30), .Y(n92) );
  INVX2 U119 ( .A(n92), .Y(n96) );
  NAND2X1 U120 ( .A(n94), .B(n93), .Y(n95) );
  MUX2X1 U121 ( .B(n96), .A(n95), .S(n26), .Y(n107) );
  NOR2X1 U122 ( .A(n141), .B(n127), .Y(n105) );
  NAND2X1 U123 ( .A(n10), .B(n124), .Y(n103) );
  AND2X2 U124 ( .A(n33), .B(n97), .Y(n99) );
  AND2X2 U125 ( .A(n21), .B(n26), .Y(n98) );
  MUX2X1 U126 ( .B(n99), .A(n98), .S(n30), .Y(n102) );
  NAND2X1 U127 ( .A(n19), .B(n100), .Y(n101) );
  NAND3X1 U128 ( .A(n103), .B(n102), .C(n101), .Y(n104) );
  MUX2X1 U129 ( .B(n105), .A(n104), .S(n28), .Y(n106) );
  NAND3X1 U130 ( .A(n108), .B(n107), .C(n106), .Y(N100) );
  NAND3X1 U131 ( .A(n33), .B(n64), .C(n24), .Y(n112) );
  NAND3X1 U132 ( .A(n110), .B(n124), .C(n109), .Y(n111) );
  OAI21X1 U133 ( .A(n113), .B(n112), .C(n111), .Y(n120) );
  NAND3X1 U134 ( .A(n21), .B(n26), .C(n114), .Y(n118) );
  NAND2X1 U135 ( .A(n116), .B(n115), .Y(n117) );
  NAND2X1 U136 ( .A(n118), .B(n117), .Y(n119) );
  NOR2X1 U137 ( .A(n120), .B(n119), .Y(n150) );
  NAND3X1 U138 ( .A(n130), .B(n121), .C(n124), .Y(n134) );
  NAND2X1 U139 ( .A(n123), .B(n7), .Y(n133) );
  AOI21X1 U140 ( .A(n30), .B(n125), .C(n124), .Y(n131) );
  NAND2X1 U141 ( .A(n127), .B(n126), .Y(n130) );
  NAND2X1 U142 ( .A(n128), .B(n6), .Y(n129) );
  NAND3X1 U143 ( .A(n131), .B(n130), .C(n129), .Y(n132) );
  NAND3X1 U144 ( .A(n134), .B(n133), .C(n132), .Y(n135) );
  NAND2X1 U145 ( .A(n28), .B(n135), .Y(n149) );
  NAND2X1 U146 ( .A(n23), .B(n136), .Y(n140) );
  NAND3X1 U147 ( .A(n26), .B(n138), .C(n137), .Y(n139) );
  OAI21X1 U148 ( .A(n140), .B(n141), .C(n139), .Y(n147) );
  NOR3X1 U149 ( .A(n13), .B(n142), .C(n141), .Y(n146) );
  NOR2X1 U150 ( .A(n142), .B(n26), .Y(n144) );
  OAI21X1 U151 ( .A(n13), .B(n33), .C(n24), .Y(n143) );
  AND2X2 U152 ( .A(n144), .B(n143), .Y(n145) );
  NOR3X1 U153 ( .A(n147), .B(n146), .C(n145), .Y(n148) );
  NAND3X1 U154 ( .A(n149), .B(n150), .C(n148), .Y(N62) );
endmodule


module Sbox4_1 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N55, N92, N129, N161, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156;
  assign data_out[3] = N55;
  assign data_out[2] = N92;
  assign data_out[1] = N129;
  assign data_out[0] = N161;

  INVX1 U1 ( .A(n41), .Y(n1) );
  INVX1 U2 ( .A(n139), .Y(n141) );
  AOI22X1 U3 ( .A(n28), .B(n56), .C(n123), .D(n3), .Y(n2) );
  INVX8 U4 ( .A(n68), .Y(n3) );
  INVX2 U5 ( .A(n28), .Y(n148) );
  OR2X2 U6 ( .A(n53), .B(n33), .Y(n4) );
  BUFX2 U7 ( .A(n36), .Y(n5) );
  BUFX4 U8 ( .A(n116), .Y(n6) );
  INVX2 U9 ( .A(n50), .Y(n22) );
  AND2X2 U10 ( .A(n56), .B(n24), .Y(n7) );
  AND2X2 U11 ( .A(n50), .B(n144), .Y(n8) );
  INVX2 U12 ( .A(data_in[4]), .Y(n39) );
  INVX2 U13 ( .A(data_in[4]), .Y(n104) );
  NAND2X1 U14 ( .A(n54), .B(n48), .Y(n9) );
  AND2X2 U15 ( .A(n32), .B(n28), .Y(n10) );
  AND2X1 U16 ( .A(n123), .B(n50), .Y(n11) );
  INVX2 U17 ( .A(n147), .Y(n132) );
  BUFX2 U18 ( .A(n102), .Y(n12) );
  INVX2 U19 ( .A(n53), .Y(n102) );
  BUFX2 U20 ( .A(data_in[2]), .Y(n49) );
  AND2X2 U21 ( .A(n21), .B(n28), .Y(n44) );
  BUFX4 U22 ( .A(data_in[3]), .Y(n51) );
  INVX2 U23 ( .A(n16), .Y(n13) );
  INVX2 U24 ( .A(n34), .Y(n16) );
  MUX2X1 U25 ( .B(n77), .A(n42), .S(n55), .Y(n14) );
  AND2X2 U26 ( .A(n17), .B(n43), .Y(n77) );
  BUFX2 U27 ( .A(data_in[3]), .Y(n52) );
  INVX2 U28 ( .A(n123), .Y(n15) );
  INVX1 U29 ( .A(n34), .Y(n45) );
  INVX2 U30 ( .A(data_in[0]), .Y(n57) );
  AND2X2 U31 ( .A(n54), .B(n48), .Y(n17) );
  INVX1 U32 ( .A(n49), .Y(n133) );
  OR2X1 U33 ( .A(n150), .B(n149), .Y(n151) );
  INVX2 U34 ( .A(n29), .Y(n143) );
  INVX2 U35 ( .A(n57), .Y(n33) );
  INVX1 U36 ( .A(n48), .Y(n98) );
  NAND2X1 U37 ( .A(n47), .B(n11), .Y(n124) );
  AND2X2 U38 ( .A(n31), .B(n56), .Y(n18) );
  INVX1 U39 ( .A(n52), .Y(n123) );
  AND2X2 U40 ( .A(n8), .B(n6), .Y(n19) );
  AND2X2 U41 ( .A(n34), .B(n144), .Y(n20) );
  INVX2 U42 ( .A(n4), .Y(n21) );
  INVX2 U43 ( .A(n4), .Y(n24) );
  INVX1 U44 ( .A(n140), .Y(n90) );
  INVX1 U45 ( .A(n49), .Y(n23) );
  INVX1 U46 ( .A(n43), .Y(n76) );
  BUFX4 U47 ( .A(data_in[2]), .Y(n50) );
  MUX2X1 U48 ( .B(n26), .A(n27), .S(n56), .Y(n25) );
  INVX1 U49 ( .A(n25), .Y(n30) );
  OR2X2 U50 ( .A(n76), .B(n103), .Y(n26) );
  OR2X1 U51 ( .A(n119), .B(n35), .Y(n27) );
  INVX2 U52 ( .A(n9), .Y(n99) );
  INVX4 U53 ( .A(n51), .Y(n116) );
  AND2X2 U54 ( .A(n52), .B(n133), .Y(n28) );
  NOR2X1 U55 ( .A(n144), .B(n36), .Y(n29) );
  INVX2 U56 ( .A(n36), .Y(n38) );
  AND2X2 U57 ( .A(n48), .B(n102), .Y(n31) );
  AND2X2 U58 ( .A(n48), .B(n102), .Y(n32) );
  INVX1 U59 ( .A(n21), .Y(n146) );
  AND2X2 U60 ( .A(n53), .B(n57), .Y(n34) );
  INVX2 U61 ( .A(n104), .Y(n35) );
  OR2X2 U62 ( .A(n51), .B(n49), .Y(n36) );
  NAND2X1 U63 ( .A(n40), .B(n14), .Y(n37) );
  BUFX4 U64 ( .A(data_in[5]), .Y(n53) );
  BUFX2 U65 ( .A(data_in[5]), .Y(n54) );
  INVX1 U66 ( .A(n147), .Y(n122) );
  INVX1 U67 ( .A(n147), .Y(n108) );
  NAND2X1 U68 ( .A(n39), .B(n10), .Y(n40) );
  NAND2X1 U69 ( .A(n40), .B(n78), .Y(n128) );
  AND2X2 U70 ( .A(n48), .B(n102), .Y(n41) );
  INVX2 U71 ( .A(n41), .Y(n103) );
  AND2X2 U72 ( .A(n43), .B(n24), .Y(n42) );
  INVX2 U73 ( .A(n42), .Y(n79) );
  MUX2X1 U74 ( .B(n77), .A(n42), .S(n55), .Y(n78) );
  AND2X2 U75 ( .A(n116), .B(n39), .Y(n43) );
  INVX4 U76 ( .A(data_in[1]), .Y(n55) );
  AND2X2 U77 ( .A(n54), .B(n116), .Y(n46) );
  AND2X2 U78 ( .A(n31), .B(n56), .Y(n47) );
  BUFX4 U79 ( .A(data_in[0]), .Y(n48) );
  INVX8 U80 ( .A(n56), .Y(n144) );
  INVX8 U81 ( .A(n55), .Y(n56) );
  NAND2X1 U82 ( .A(n34), .B(n52), .Y(n119) );
  NAND2X1 U83 ( .A(n50), .B(n144), .Y(n87) );
  NAND2X1 U84 ( .A(n52), .B(n102), .Y(n81) );
  AOI21X1 U85 ( .A(n48), .B(n81), .C(n50), .Y(n59) );
  NOR2X1 U86 ( .A(n56), .B(n104), .Y(n58) );
  OAI21X1 U87 ( .A(n46), .B(n59), .C(n58), .Y(n60) );
  OAI21X1 U88 ( .A(n8), .B(n79), .C(n60), .Y(n61) );
  NOR2X1 U89 ( .A(n25), .B(n61), .Y(n75) );
  OAI22X1 U90 ( .A(n38), .B(n18), .C(n99), .D(n5), .Y(n62) );
  OAI21X1 U91 ( .A(n45), .B(n87), .C(n62), .Y(n63) );
  NAND2X1 U92 ( .A(n63), .B(n39), .Y(n74) );
  NAND2X1 U93 ( .A(n103), .B(n144), .Y(n67) );
  NAND2X1 U94 ( .A(n50), .B(n52), .Y(n147) );
  NAND2X1 U95 ( .A(n122), .B(n39), .Y(n66) );
  NOR2X1 U96 ( .A(n36), .B(n39), .Y(n64) );
  OAI21X1 U97 ( .A(n13), .B(n47), .C(n64), .Y(n65) );
  OAI21X1 U98 ( .A(n67), .B(n66), .C(n65), .Y(n72) );
  NAND2X1 U99 ( .A(data_in[4]), .B(n50), .Y(n68) );
  INVX2 U100 ( .A(n68), .Y(n69) );
  AOI22X1 U101 ( .A(n69), .B(n7), .C(n18), .D(n108), .Y(n70) );
  OAI21X1 U102 ( .A(n2), .B(n9), .C(n70), .Y(n71) );
  NOR2X1 U103 ( .A(n72), .B(n71), .Y(n73) );
  NAND3X1 U104 ( .A(n74), .B(n75), .C(n73), .Y(N161) );
  OAI22X1 U105 ( .A(n22), .B(n79), .C(n45), .D(n2), .Y(n80) );
  NOR2X1 U106 ( .A(n37), .B(n80), .Y(n97) );
  NAND2X1 U107 ( .A(n8), .B(n6), .Y(n115) );
  AOI22X1 U108 ( .A(n19), .B(n32), .C(n7), .D(n122), .Y(n96) );
  NAND2X1 U109 ( .A(n20), .B(n132), .Y(n138) );
  NAND3X1 U110 ( .A(n48), .B(n22), .C(n54), .Y(n82) );
  MUX2X1 U111 ( .B(n82), .A(n81), .S(n56), .Y(n83) );
  INVX2 U112 ( .A(n83), .Y(n137) );
  NAND2X1 U113 ( .A(n138), .B(n137), .Y(n94) );
  OAI21X1 U114 ( .A(n12), .B(n5), .C(n104), .Y(n93) );
  NAND3X1 U115 ( .A(n56), .B(n23), .C(n41), .Y(n139) );
  NAND2X1 U116 ( .A(n35), .B(n139), .Y(n84) );
  AOI21X1 U117 ( .A(n44), .B(n144), .C(n84), .Y(n91) );
  NAND3X1 U118 ( .A(n116), .B(n144), .C(n34), .Y(n85) );
  OAI21X1 U119 ( .A(n147), .B(n9), .C(n85), .Y(n140) );
  NAND3X1 U120 ( .A(n17), .B(n36), .C(n56), .Y(n86) );
  OAI21X1 U121 ( .A(n1), .B(n87), .C(n86), .Y(n88) );
  AOI21X1 U122 ( .A(n29), .B(n12), .C(n88), .Y(n89) );
  NAND3X1 U123 ( .A(n91), .B(n90), .C(n89), .Y(n92) );
  OAI21X1 U124 ( .A(n94), .B(n93), .C(n92), .Y(n95) );
  NAND3X1 U125 ( .A(n96), .B(n97), .C(n95), .Y(N129) );
  NAND2X1 U126 ( .A(n21), .B(n15), .Y(n101) );
  MUX2X1 U127 ( .B(n99), .A(n98), .S(n50), .Y(n100) );
  AOI21X1 U128 ( .A(n100), .B(n101), .C(n144), .Y(n114) );
  NAND3X1 U129 ( .A(n12), .B(n144), .C(n108), .Y(n107) );
  NAND2X1 U130 ( .A(n20), .B(n22), .Y(n106) );
  AOI21X1 U131 ( .A(n32), .B(n38), .C(n104), .Y(n105) );
  NAND3X1 U132 ( .A(n107), .B(n106), .C(n105), .Y(n113) );
  NAND2X1 U133 ( .A(n7), .B(n22), .Y(n111) );
  NAND2X1 U134 ( .A(n54), .B(n29), .Y(n110) );
  AOI21X1 U135 ( .A(n132), .B(n13), .C(n35), .Y(n109) );
  NAND3X1 U136 ( .A(n111), .B(n109), .C(n110), .Y(n112) );
  OAI21X1 U137 ( .A(n114), .B(n113), .C(n112), .Y(n131) );
  OAI21X1 U138 ( .A(n8), .B(n6), .C(n115), .Y(n117) );
  NAND3X1 U139 ( .A(n99), .B(n117), .C(n35), .Y(n130) );
  NAND2X1 U140 ( .A(n31), .B(n23), .Y(n118) );
  NAND2X1 U141 ( .A(n104), .B(n144), .Y(n120) );
  AOI21X1 U142 ( .A(n119), .B(n118), .C(n120), .Y(n127) );
  INVX2 U143 ( .A(n120), .Y(n121) );
  NAND3X1 U144 ( .A(n132), .B(n54), .C(n121), .Y(n125) );
  NAND2X1 U145 ( .A(n125), .B(n124), .Y(n126) );
  NOR3X1 U146 ( .A(n127), .B(n126), .C(n128), .Y(n129) );
  NAND3X1 U147 ( .A(n131), .B(n130), .C(n129), .Y(N92) );
  AOI22X1 U148 ( .A(n19), .B(n21), .C(n20), .D(n38), .Y(n156) );
  AOI21X1 U149 ( .A(n32), .B(n132), .C(n44), .Y(n136) );
  NOR2X1 U150 ( .A(n23), .B(n144), .Y(n134) );
  OAI21X1 U151 ( .A(n48), .B(n46), .C(n134), .Y(n135) );
  NAND2X1 U152 ( .A(n136), .B(n135), .Y(n154) );
  NAND3X1 U153 ( .A(n35), .B(n138), .C(n137), .Y(n153) );
  NOR2X1 U154 ( .A(n141), .B(n140), .Y(n142) );
  OAI21X1 U155 ( .A(n13), .B(n143), .C(n142), .Y(n152) );
  NAND3X1 U156 ( .A(n17), .B(n15), .C(n144), .Y(n145) );
  OAI21X1 U157 ( .A(n147), .B(n146), .C(n145), .Y(n150) );
  OAI21X1 U158 ( .A(n148), .B(n16), .C(n104), .Y(n149) );
  OAI22X1 U159 ( .A(n154), .B(n153), .C(n152), .D(n151), .Y(n155) );
  NAND3X1 U160 ( .A(n156), .B(n30), .C(n155), .Y(N55) );
endmodule


module Sbox5_1 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N55, N140, N163, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143;
  assign data_out[3] = N55;
  assign data_out[1] = N140;
  assign data_out[0] = N163;

  XNOR2X1 U1 ( .A(n133), .B(n27), .Y(n1) );
  INVX2 U2 ( .A(n113), .Y(n58) );
  INVX2 U3 ( .A(n121), .Y(n10) );
  INVX4 U4 ( .A(n16), .Y(n64) );
  INVX1 U5 ( .A(n21), .Y(n2) );
  INVX2 U6 ( .A(data_in[5]), .Y(n21) );
  INVX2 U7 ( .A(n21), .Y(n22) );
  BUFX2 U8 ( .A(data_in[0]), .Y(n3) );
  INVX2 U9 ( .A(n93), .Y(n4) );
  INVX2 U10 ( .A(n138), .Y(n93) );
  INVX4 U11 ( .A(n18), .Y(n14) );
  AND2X2 U12 ( .A(n31), .B(n129), .Y(n5) );
  INVX2 U13 ( .A(n23), .Y(n24) );
  INVX8 U14 ( .A(n25), .Y(n26) );
  INVX2 U15 ( .A(data_in[0]), .Y(n82) );
  INVX8 U16 ( .A(n33), .Y(n133) );
  NAND2X1 U17 ( .A(data_in[0]), .B(n21), .Y(n6) );
  INVX4 U18 ( .A(n6), .Y(n18) );
  INVX1 U19 ( .A(n98), .Y(n79) );
  NAND2X1 U20 ( .A(n22), .B(n82), .Y(n7) );
  INVX4 U21 ( .A(n7), .Y(n16) );
  AND2X2 U22 ( .A(n23), .B(n131), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n78) );
  AND2X2 U24 ( .A(n16), .B(n131), .Y(n9) );
  INVX1 U25 ( .A(n9), .Y(n106) );
  INVX8 U26 ( .A(n26), .Y(n131) );
  NAND2X1 U27 ( .A(n10), .B(n23), .Y(n11) );
  NAND2X1 U28 ( .A(n11), .B(n100), .Y(n108) );
  BUFX2 U29 ( .A(n3), .Y(n12) );
  INVX8 U30 ( .A(n29), .Y(n129) );
  AND2X2 U31 ( .A(n22), .B(n3), .Y(n13) );
  INVX2 U32 ( .A(n13), .Y(n81) );
  INVX4 U33 ( .A(data_in[3]), .Y(n30) );
  INVX8 U34 ( .A(n30), .Y(n31) );
  INVX4 U35 ( .A(data_in[1]), .Y(n25) );
  INVX4 U36 ( .A(n25), .Y(n27) );
  INVX4 U37 ( .A(data_in[2]), .Y(n28) );
  NOR2X1 U38 ( .A(n91), .B(n64), .Y(n15) );
  NOR2X1 U39 ( .A(n15), .B(n97), .Y(n111) );
  BUFX2 U40 ( .A(n21), .Y(n17) );
  INVX4 U41 ( .A(n120), .Y(n23) );
  AND2X2 U42 ( .A(n129), .B(n131), .Y(n19) );
  AND2X2 U43 ( .A(n29), .B(n26), .Y(n20) );
  INVX2 U44 ( .A(data_in[4]), .Y(n32) );
  INVX8 U45 ( .A(n28), .Y(n29) );
  INVX8 U46 ( .A(n32), .Y(n33) );
  NAND2X1 U47 ( .A(n31), .B(n129), .Y(n128) );
  NAND2X1 U48 ( .A(n29), .B(n31), .Y(n114) );
  OAI22X1 U49 ( .A(n128), .B(n14), .C(n114), .D(n81), .Y(n34) );
  NAND2X1 U50 ( .A(n31), .B(n133), .Y(n56) );
  INVX2 U51 ( .A(n56), .Y(n109) );
  NAND2X1 U52 ( .A(n21), .B(n82), .Y(n120) );
  AOI22X1 U53 ( .A(n33), .B(n34), .C(n8), .D(n109), .Y(n51) );
  NAND3X1 U54 ( .A(n18), .B(n27), .C(n129), .Y(n35) );
  OAI21X1 U55 ( .A(n114), .B(n14), .C(n35), .Y(n39) );
  NAND2X1 U56 ( .A(n13), .B(n131), .Y(n37) );
  NAND3X1 U57 ( .A(n29), .B(n16), .C(n131), .Y(n36) );
  OAI21X1 U58 ( .A(n29), .B(n37), .C(n36), .Y(n38) );
  OAI21X1 U59 ( .A(n39), .B(n38), .C(n133), .Y(n50) );
  NAND2X1 U60 ( .A(n18), .B(n33), .Y(n41) );
  NAND3X1 U61 ( .A(n129), .B(n23), .C(n31), .Y(n40) );
  OAI21X1 U62 ( .A(n31), .B(n41), .C(n40), .Y(n42) );
  INVX2 U63 ( .A(n42), .Y(n96) );
  NAND2X1 U64 ( .A(n5), .B(n16), .Y(n70) );
  MUX2X1 U65 ( .B(n96), .A(n70), .S(n27), .Y(n48) );
  OAI21X1 U66 ( .A(n26), .B(n30), .C(n33), .Y(n43) );
  OR2X2 U67 ( .A(n129), .B(n43), .Y(n91) );
  NAND2X1 U68 ( .A(n33), .B(n30), .Y(n113) );
  OAI22X1 U69 ( .A(n18), .B(n131), .C(n29), .D(n64), .Y(n45) );
  OAI21X1 U70 ( .A(n12), .B(n31), .C(n81), .Y(n44) );
  AOI22X1 U71 ( .A(n45), .B(n58), .C(n20), .D(n44), .Y(n46) );
  OAI21X1 U72 ( .A(n24), .B(n91), .C(n46), .Y(n47) );
  NOR2X1 U73 ( .A(n48), .B(n47), .Y(n49) );
  NAND3X1 U74 ( .A(n51), .B(n50), .C(n49), .Y(N163) );
  OAI21X1 U75 ( .A(n17), .B(n129), .C(n12), .Y(n53) );
  NAND2X1 U76 ( .A(n27), .B(n24), .Y(n52) );
  NAND2X1 U77 ( .A(n53), .B(n52), .Y(n55) );
  NAND3X1 U78 ( .A(n133), .B(n23), .C(n19), .Y(n54) );
  OAI21X1 U79 ( .A(n56), .B(n55), .C(n54), .Y(n63) );
  NAND2X1 U80 ( .A(n13), .B(n30), .Y(n103) );
  AOI21X1 U81 ( .A(n27), .B(n133), .C(n103), .Y(n57) );
  NAND2X1 U82 ( .A(n57), .B(n129), .Y(n61) );
  NAND3X1 U83 ( .A(n58), .B(n29), .C(n17), .Y(n60) );
  NAND3X1 U84 ( .A(n5), .B(n12), .C(n1), .Y(n59) );
  NAND3X1 U85 ( .A(n61), .B(n60), .C(n59), .Y(n62) );
  NOR2X1 U86 ( .A(n63), .B(n62), .Y(n75) );
  NAND2X1 U87 ( .A(n30), .B(n133), .Y(n83) );
  INVX2 U88 ( .A(n83), .Y(n73) );
  MUX2X1 U89 ( .B(n18), .A(n2), .S(n20), .Y(n66) );
  NAND2X1 U90 ( .A(n16), .B(n27), .Y(n65) );
  NAND2X1 U91 ( .A(n66), .B(n65), .Y(n72) );
  AOI22X1 U92 ( .A(n19), .B(n2), .C(n8), .D(n29), .Y(n69) );
  NAND2X1 U93 ( .A(n2), .B(n31), .Y(n132) );
  NAND2X1 U94 ( .A(n132), .B(n14), .Y(n67) );
  NAND2X1 U95 ( .A(n20), .B(n67), .Y(n68) );
  NAND3X1 U96 ( .A(n69), .B(n70), .C(n68), .Y(n71) );
  AOI22X1 U97 ( .A(n73), .B(n72), .C(n33), .D(n71), .Y(n74) );
  NAND2X1 U98 ( .A(n75), .B(n74), .Y(N140) );
  NAND2X1 U99 ( .A(n33), .B(n31), .Y(n92) );
  NAND2X1 U100 ( .A(n23), .B(n30), .Y(n102) );
  INVX2 U101 ( .A(n102), .Y(n76) );
  NAND3X1 U102 ( .A(n76), .B(n33), .C(n27), .Y(n77) );
  OAI21X1 U103 ( .A(n92), .B(n78), .C(n77), .Y(n90) );
  NAND2X1 U104 ( .A(n18), .B(n131), .Y(n98) );
  AOI21X1 U105 ( .A(n31), .B(n24), .C(n79), .Y(n88) );
  NOR2X1 U106 ( .A(n33), .B(n29), .Y(n80) );
  OAI21X1 U107 ( .A(n27), .B(n18), .C(n80), .Y(n87) );
  OAI21X1 U108 ( .A(n82), .B(n131), .C(n81), .Y(n85) );
  NOR2X1 U109 ( .A(n129), .B(n83), .Y(n84) );
  OAI21X1 U110 ( .A(n8), .B(n85), .C(n84), .Y(n86) );
  OAI21X1 U111 ( .A(n88), .B(n87), .C(n86), .Y(n89) );
  NOR2X1 U112 ( .A(n90), .B(n89), .Y(n112) );
  INVX2 U113 ( .A(n92), .Y(n94) );
  MUX2X1 U114 ( .B(n13), .A(n18), .S(n26), .Y(n138) );
  NAND3X1 U115 ( .A(n94), .B(n29), .C(n93), .Y(n95) );
  OAI21X1 U116 ( .A(n27), .B(n96), .C(n95), .Y(n97) );
  NAND2X1 U117 ( .A(n29), .B(n26), .Y(n121) );
  NAND2X1 U118 ( .A(n13), .B(n27), .Y(n101) );
  NAND2X1 U119 ( .A(n98), .B(n101), .Y(n99) );
  AOI21X1 U120 ( .A(n9), .B(n29), .C(n99), .Y(n100) );
  INVX2 U121 ( .A(n101), .Y(n122) );
  OAI22X1 U122 ( .A(n133), .B(n103), .C(n131), .D(n102), .Y(n104) );
  AOI21X1 U123 ( .A(n122), .B(n33), .C(n104), .Y(n105) );
  OAI21X1 U124 ( .A(n109), .B(n106), .C(n105), .Y(n107) );
  AOI22X1 U125 ( .A(n109), .B(n108), .C(n107), .D(n129), .Y(n110) );
  NAND3X1 U126 ( .A(n112), .B(n111), .C(n110), .Y(data_out[2]) );
  NOR2X1 U127 ( .A(n133), .B(n121), .Y(n119) );
  NAND2X1 U128 ( .A(n16), .B(n113), .Y(n117) );
  INVX2 U129 ( .A(n114), .Y(n115) );
  NAND3X1 U130 ( .A(n115), .B(n131), .C(n17), .Y(n116) );
  OAI21X1 U131 ( .A(n121), .B(n117), .C(n116), .Y(n118) );
  AOI21X1 U132 ( .A(n23), .B(n119), .C(n118), .Y(n143) );
  NOR2X1 U133 ( .A(n29), .B(n24), .Y(n127) );
  NAND2X1 U134 ( .A(n58), .B(n16), .Y(n125) );
  NOR2X1 U135 ( .A(n129), .B(n14), .Y(n123) );
  AOI22X1 U136 ( .A(n58), .B(n123), .C(n122), .D(n58), .Y(n124) );
  OAI21X1 U137 ( .A(n10), .B(n125), .C(n124), .Y(n126) );
  AOI21X1 U138 ( .A(n127), .B(n1), .C(n126), .Y(n142) );
  OAI21X1 U139 ( .A(n138), .B(n128), .C(n33), .Y(n140) );
  NAND3X1 U140 ( .A(n31), .B(n129), .C(n16), .Y(n130) );
  OAI21X1 U141 ( .A(n132), .B(n131), .C(n130), .Y(n136) );
  NAND2X1 U142 ( .A(n12), .B(n30), .Y(n134) );
  OAI21X1 U143 ( .A(n29), .B(n134), .C(n133), .Y(n135) );
  NOR2X1 U144 ( .A(n136), .B(n135), .Y(n137) );
  OAI21X1 U145 ( .A(n4), .B(n31), .C(n137), .Y(n139) );
  NAND2X1 U146 ( .A(n140), .B(n139), .Y(n141) );
  NAND3X1 U147 ( .A(n143), .B(n141), .C(n142), .Y(N55) );
endmodule


module Sbox6_1 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N59, N101, N137, N164, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177;
  assign data_out[3] = N59;
  assign data_out[2] = N101;
  assign data_out[1] = N137;
  assign data_out[0] = N164;

  NAND2X1 U1 ( .A(n153), .B(n44), .Y(n1) );
  NAND2X1 U2 ( .A(n152), .B(n2), .Y(n158) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  NAND2X1 U4 ( .A(n156), .B(n51), .Y(n3) );
  NAND2X1 U5 ( .A(n14), .B(n4), .Y(n96) );
  INVX2 U6 ( .A(n3), .Y(n4) );
  INVX8 U7 ( .A(n48), .Y(n156) );
  BUFX2 U8 ( .A(n48), .Y(n5) );
  INVX4 U9 ( .A(n41), .Y(n117) );
  BUFX2 U10 ( .A(n174), .Y(n6) );
  INVX2 U11 ( .A(data_in[2]), .Y(n45) );
  OR2X2 U12 ( .A(data_in[5]), .B(data_in[0]), .Y(n7) );
  AND2X2 U13 ( .A(n51), .B(n34), .Y(n8) );
  INVX2 U14 ( .A(n114), .Y(n56) );
  AND2X1 U15 ( .A(n120), .B(n119), .Y(n9) );
  AND2X1 U16 ( .A(n95), .B(n96), .Y(n10) );
  INVX2 U17 ( .A(n143), .Y(n144) );
  AND2X1 U18 ( .A(n44), .B(n27), .Y(n11) );
  AND2X1 U19 ( .A(n155), .B(n156), .Y(n12) );
  INVX4 U20 ( .A(n45), .Y(n46) );
  AND2X1 U21 ( .A(n70), .B(n69), .Y(n13) );
  INVX2 U22 ( .A(n139), .Y(n14) );
  INVX1 U23 ( .A(n139), .Y(n22) );
  INVX4 U24 ( .A(n49), .Y(n50) );
  BUFX2 U25 ( .A(n29), .Y(n15) );
  INVX4 U26 ( .A(n75), .Y(n16) );
  INVX2 U27 ( .A(n46), .Y(n17) );
  INVX2 U28 ( .A(n46), .Y(n173) );
  INVX1 U29 ( .A(n19), .Y(n18) );
  INVX2 U30 ( .A(n142), .Y(n19) );
  MUX2X1 U31 ( .B(n130), .A(n75), .S(n27), .Y(n154) );
  INVX2 U32 ( .A(n150), .Y(n130) );
  INVX1 U33 ( .A(n7), .Y(n160) );
  INVX2 U34 ( .A(data_in[0]), .Y(n142) );
  BUFX2 U35 ( .A(data_in[0]), .Y(n29) );
  INVX4 U36 ( .A(n45), .Y(n27) );
  AND2X2 U37 ( .A(n125), .B(n140), .Y(n20) );
  NOR2X1 U38 ( .A(n20), .B(n53), .Y(n54) );
  AND2X2 U39 ( .A(n50), .B(n156), .Y(n21) );
  INVX1 U40 ( .A(n23), .Y(n76) );
  INVX2 U41 ( .A(n151), .Y(n115) );
  AND2X1 U42 ( .A(n11), .B(n87), .Y(n165) );
  NAND2X1 U43 ( .A(n142), .B(data_in[5]), .Y(n23) );
  INVX4 U44 ( .A(n28), .Y(n139) );
  MUX2X1 U45 ( .B(n159), .A(n160), .S(n43), .Y(n163) );
  NAND2X1 U46 ( .A(n39), .B(n156), .Y(n24) );
  MUX2X1 U47 ( .B(n98), .A(n97), .S(n44), .Y(n99) );
  INVX1 U48 ( .A(n125), .Y(n126) );
  NAND2X1 U49 ( .A(n68), .B(n13), .Y(N164) );
  INVX4 U50 ( .A(n7), .Y(n75) );
  INVX1 U51 ( .A(n92), .Y(n161) );
  INVX1 U52 ( .A(n48), .Y(n123) );
  AND2X2 U53 ( .A(n104), .B(n29), .Y(n25) );
  AND2X2 U54 ( .A(n39), .B(n156), .Y(n26) );
  AND2X2 U55 ( .A(n19), .B(data_in[5]), .Y(n28) );
  INVX2 U56 ( .A(n154), .Y(n86) );
  BUFX2 U57 ( .A(data_in[5]), .Y(n42) );
  INVX1 U58 ( .A(data_in[5]), .Y(n104) );
  NAND2X1 U59 ( .A(n94), .B(n10), .Y(n97) );
  NAND2X1 U60 ( .A(n9), .B(n118), .Y(n121) );
  INVX4 U61 ( .A(data_in[4]), .Y(n49) );
  INVX4 U62 ( .A(n49), .Y(n51) );
  INVX1 U63 ( .A(n92), .Y(n93) );
  INVX1 U64 ( .A(n92), .Y(n84) );
  INVX1 U65 ( .A(n85), .Y(n88) );
  INVX1 U66 ( .A(n112), .Y(n59) );
  INVX1 U67 ( .A(n25), .Y(n30) );
  INVX1 U68 ( .A(n51), .Y(n167) );
  NAND2X1 U69 ( .A(n31), .B(n32), .Y(n33) );
  NAND2X1 U70 ( .A(n33), .B(n63), .Y(n64) );
  INVX1 U71 ( .A(n44), .Y(n31) );
  INVX1 U72 ( .A(n23), .Y(n32) );
  INVX4 U73 ( .A(n50), .Y(n138) );
  INVX1 U74 ( .A(data_in[5]), .Y(n34) );
  OR2X2 U75 ( .A(n23), .B(n46), .Y(n63) );
  NAND2X1 U76 ( .A(n86), .B(n12), .Y(n157) );
  BUFX2 U77 ( .A(n154), .Y(n35) );
  INVX1 U78 ( .A(n51), .Y(n155) );
  AND2X2 U79 ( .A(n17), .B(n138), .Y(n36) );
  INVX4 U80 ( .A(n38), .Y(n41) );
  AND2X2 U81 ( .A(n51), .B(n28), .Y(n37) );
  AND2X2 U82 ( .A(n48), .B(n173), .Y(n38) );
  AND2X2 U83 ( .A(n27), .B(n25), .Y(n39) );
  XNOR2X1 U84 ( .A(n17), .B(n44), .Y(n40) );
  INVX4 U85 ( .A(data_in[1]), .Y(n43) );
  INVX4 U86 ( .A(data_in[3]), .Y(n47) );
  INVX1 U87 ( .A(n150), .Y(n153) );
  INVX1 U88 ( .A(n23), .Y(n87) );
  INVX1 U89 ( .A(n23), .Y(n159) );
  INVX8 U90 ( .A(n44), .Y(n140) );
  INVX8 U91 ( .A(n43), .Y(n44) );
  INVX8 U92 ( .A(n47), .Y(n48) );
  NAND2X1 U93 ( .A(n48), .B(n29), .Y(n52) );
  MUX2X1 U94 ( .B(n52), .A(n63), .S(n51), .Y(n55) );
  NAND2X1 U95 ( .A(n50), .B(n156), .Y(n125) );
  OAI21X1 U96 ( .A(n36), .B(n140), .C(n14), .Y(n53) );
  AOI21X1 U97 ( .A(n55), .B(n140), .C(n54), .Y(n70) );
  NAND2X1 U98 ( .A(n46), .B(n48), .Y(n92) );
  NAND2X1 U99 ( .A(n29), .B(n104), .Y(n150) );
  MUX2X1 U100 ( .B(n130), .A(n75), .S(n50), .Y(n114) );
  AOI22X1 U101 ( .A(n8), .B(n40), .C(n84), .D(n56), .Y(n69) );
  OAI22X1 U102 ( .A(n27), .B(n42), .C(n16), .D(n51), .Y(n57) );
  NAND2X1 U103 ( .A(n57), .B(n156), .Y(n62) );
  NAND3X1 U104 ( .A(n156), .B(n138), .C(n32), .Y(n58) );
  INVX2 U105 ( .A(n58), .Y(n174) );
  NAND2X1 U106 ( .A(n48), .B(n173), .Y(n112) );
  NAND2X1 U107 ( .A(n59), .B(n138), .Y(n85) );
  NOR2X1 U108 ( .A(n44), .B(n85), .Y(n60) );
  AOI22X1 U109 ( .A(n174), .B(n140), .C(n60), .D(n34), .Y(n61) );
  OAI21X1 U110 ( .A(n140), .B(n62), .C(n61), .Y(n67) );
  NAND3X1 U111 ( .A(n27), .B(n44), .C(n76), .Y(n164) );
  NAND2X1 U112 ( .A(n48), .B(n50), .Y(n151) );
  NAND3X1 U113 ( .A(n27), .B(n28), .C(n44), .Y(n143) );
  AOI22X1 U114 ( .A(n115), .B(n64), .C(n144), .D(n51), .Y(n65) );
  OAI21X1 U115 ( .A(n51), .B(n164), .C(n65), .Y(n66) );
  NOR2X1 U116 ( .A(n67), .B(n66), .Y(n68) );
  NAND2X1 U117 ( .A(n28), .B(n161), .Y(n71) );
  AOI22X1 U118 ( .A(n51), .B(n164), .C(n71), .D(n5), .Y(n82) );
  AND2X2 U119 ( .A(n138), .B(n71), .Y(n73) );
  NAND2X1 U120 ( .A(n42), .B(n40), .Y(n72) );
  NAND3X1 U121 ( .A(n73), .B(n35), .C(n72), .Y(n81) );
  OAI21X1 U122 ( .A(n27), .B(n138), .C(n140), .Y(n74) );
  NAND2X1 U123 ( .A(n75), .B(n74), .Y(n78) );
  NAND2X1 U124 ( .A(n27), .B(n76), .Y(n77) );
  NAND2X1 U125 ( .A(n78), .B(n77), .Y(n80) );
  NAND2X1 U126 ( .A(n151), .B(n41), .Y(n79) );
  AOI22X1 U127 ( .A(n81), .B(n82), .C(n80), .D(n79), .Y(n100) );
  OAI21X1 U128 ( .A(n48), .B(n34), .C(n139), .Y(n83) );
  NAND3X1 U129 ( .A(n17), .B(n83), .C(n51), .Y(n91) );
  NAND3X1 U130 ( .A(n153), .B(n51), .C(n84), .Y(n90) );
  AOI22X1 U131 ( .A(n88), .B(n87), .C(n86), .D(n151), .Y(n89) );
  NAND3X1 U132 ( .A(n91), .B(n90), .C(n89), .Y(n98) );
  NAND2X1 U133 ( .A(n93), .B(n76), .Y(n95) );
  AOI21X1 U134 ( .A(n8), .B(n117), .C(n26), .Y(n94) );
  NAND2X1 U135 ( .A(n99), .B(n100), .Y(N137) );
  NAND2X1 U136 ( .A(n16), .B(n139), .Y(n124) );
  NOR2X1 U137 ( .A(n27), .B(n48), .Y(n101) );
  NAND3X1 U138 ( .A(n124), .B(n138), .C(n101), .Y(n103) );
  NAND2X1 U139 ( .A(n87), .B(n21), .Y(n102) );
  NAND3X1 U140 ( .A(n24), .B(n103), .C(n102), .Y(n109) );
  NAND2X1 U141 ( .A(n37), .B(n117), .Y(n107) );
  OAI21X1 U142 ( .A(n51), .B(n34), .C(n16), .Y(n105) );
  NAND2X1 U143 ( .A(n93), .B(n105), .Y(n106) );
  NAND2X1 U144 ( .A(n107), .B(n106), .Y(n108) );
  OAI21X1 U145 ( .A(n108), .B(n109), .C(n140), .Y(n137) );
  MUX2X1 U146 ( .B(n21), .A(n36), .S(n44), .Y(n110) );
  NOR2X1 U147 ( .A(n30), .B(n110), .Y(n122) );
  NOR2X1 U148 ( .A(n51), .B(n48), .Y(n111) );
  NAND3X1 U149 ( .A(n159), .B(n111), .C(n27), .Y(n120) );
  NOR2X1 U150 ( .A(n112), .B(n51), .Y(n113) );
  NAND3X1 U151 ( .A(n44), .B(n15), .C(n113), .Y(n119) );
  AND2X2 U152 ( .A(n44), .B(n115), .Y(n116) );
  AOI22X1 U153 ( .A(n56), .B(n117), .C(n116), .D(n159), .Y(n118) );
  NOR2X1 U154 ( .A(n122), .B(n121), .Y(n136) );
  NAND3X1 U155 ( .A(n51), .B(n123), .C(n39), .Y(n129) );
  NAND3X1 U156 ( .A(n27), .B(n123), .C(n124), .Y(n128) );
  NAND2X1 U157 ( .A(n126), .B(n160), .Y(n127) );
  NAND3X1 U158 ( .A(n129), .B(n128), .C(n127), .Y(n134) );
  NAND2X1 U159 ( .A(n153), .B(n5), .Y(n132) );
  AOI21X1 U160 ( .A(n37), .B(n41), .C(n174), .Y(n131) );
  OAI21X1 U161 ( .A(n51), .B(n132), .C(n131), .Y(n133) );
  OAI21X1 U162 ( .A(n134), .B(n133), .C(n44), .Y(n135) );
  NAND3X1 U163 ( .A(n137), .B(n135), .C(n136), .Y(N101) );
  NAND2X1 U164 ( .A(n138), .B(n140), .Y(n146) );
  OAI21X1 U165 ( .A(n16), .B(n140), .C(n139), .Y(n141) );
  INVX2 U166 ( .A(n141), .Y(n171) );
  OAI21X1 U167 ( .A(n18), .B(n146), .C(n171), .Y(n149) );
  AOI22X1 U168 ( .A(n156), .B(n18), .C(n22), .D(n5), .Y(n147) );
  NAND2X1 U169 ( .A(n144), .B(n155), .Y(n145) );
  OAI21X1 U170 ( .A(n147), .B(n146), .C(n145), .Y(n148) );
  AOI21X1 U171 ( .A(n93), .B(n149), .C(n148), .Y(n177) );
  NAND2X1 U172 ( .A(n151), .B(n41), .Y(n152) );
  NAND2X1 U173 ( .A(n158), .B(n157), .Y(n170) );
  NAND3X1 U174 ( .A(n42), .B(n140), .C(n84), .Y(n162) );
  OAI21X1 U175 ( .A(n163), .B(n41), .C(n162), .Y(n169) );
  NAND2X1 U176 ( .A(n165), .B(n21), .Y(n166) );
  OAI21X1 U177 ( .A(n167), .B(n24), .C(n166), .Y(n168) );
  NOR3X1 U178 ( .A(n169), .B(n168), .C(n170), .Y(n176) );
  NOR2X1 U179 ( .A(n27), .B(n171), .Y(n172) );
  AOI22X1 U180 ( .A(n6), .B(n17), .C(n21), .D(n172), .Y(n175) );
  NAND3X1 U181 ( .A(n177), .B(n175), .C(n176), .Y(N59) );
endmodule


module Sbox7_1 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N61, N96, N131, N161, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147;
  assign data_out[3] = N61;
  assign data_out[2] = N96;
  assign data_out[1] = N131;
  assign data_out[0] = N161;

  INVX1 U1 ( .A(n100), .Y(n87) );
  INVX1 U2 ( .A(n32), .Y(n1) );
  INVX2 U3 ( .A(n32), .Y(n132) );
  INVX4 U4 ( .A(n45), .Y(n35) );
  BUFX2 U5 ( .A(n90), .Y(n2) );
  NAND2X1 U6 ( .A(n45), .B(n41), .Y(n3) );
  NAND2X1 U7 ( .A(n45), .B(n41), .Y(n4) );
  AND2X2 U8 ( .A(n43), .B(n15), .Y(n5) );
  INVX4 U9 ( .A(n16), .Y(n80) );
  INVX4 U10 ( .A(n6), .Y(n16) );
  NAND2X1 U11 ( .A(n133), .B(n137), .Y(n6) );
  INVX2 U12 ( .A(data_in[5]), .Y(n133) );
  AND2X2 U13 ( .A(n41), .B(n107), .Y(n7) );
  INVX2 U14 ( .A(n20), .Y(n101) );
  INVX2 U15 ( .A(n83), .Y(n48) );
  AND2X1 U16 ( .A(n67), .B(n68), .Y(n8) );
  AND2X2 U17 ( .A(n20), .B(n90), .Y(n9) );
  NAND2X1 U18 ( .A(n71), .B(n22), .Y(n10) );
  BUFX2 U19 ( .A(n137), .Y(n11) );
  INVX2 U20 ( .A(data_in[0]), .Y(n137) );
  INVX1 U21 ( .A(n132), .Y(n12) );
  OR2X2 U22 ( .A(n107), .B(n70), .Y(n117) );
  NAND2X1 U23 ( .A(n69), .B(n8), .Y(N161) );
  INVX1 U24 ( .A(n101), .Y(n13) );
  AND2X2 U25 ( .A(n32), .B(n21), .Y(n14) );
  INVX1 U26 ( .A(n14), .Y(n79) );
  INVX1 U27 ( .A(data_in[2]), .Y(n15) );
  AND2X2 U28 ( .A(n45), .B(n91), .Y(n17) );
  INVX1 U29 ( .A(n17), .Y(n72) );
  INVX2 U30 ( .A(n41), .Y(n22) );
  AND2X2 U31 ( .A(n28), .B(n137), .Y(n18) );
  INVX2 U32 ( .A(n133), .Y(n28) );
  BUFX2 U33 ( .A(n41), .Y(n19) );
  NAND2X1 U34 ( .A(data_in[0]), .B(n133), .Y(n20) );
  INVX4 U35 ( .A(n107), .Y(n21) );
  INVX1 U36 ( .A(n4), .Y(n139) );
  INVX8 U37 ( .A(n47), .Y(n142) );
  NAND2X1 U38 ( .A(n127), .B(n128), .Y(n23) );
  NAND2X1 U39 ( .A(n129), .B(n24), .Y(n130) );
  INVX2 U40 ( .A(n23), .Y(n24) );
  BUFX2 U41 ( .A(n18), .Y(n25) );
  NAND2X1 U42 ( .A(n107), .B(n91), .Y(n26) );
  BUFX4 U43 ( .A(data_in[2]), .Y(n41) );
  INVX1 U44 ( .A(n137), .Y(n27) );
  AND2X2 U45 ( .A(data_in[5]), .B(data_in[0]), .Y(n29) );
  INVX2 U46 ( .A(n29), .Y(n103) );
  INVX1 U47 ( .A(n134), .Y(n105) );
  INVX1 U48 ( .A(n99), .Y(n71) );
  NAND2X1 U49 ( .A(n101), .B(n30), .Y(n31) );
  NAND2X1 U50 ( .A(n31), .B(n84), .Y(n96) );
  INVX1 U51 ( .A(n3), .Y(n30) );
  NOR2X1 U52 ( .A(n119), .B(n91), .Y(n36) );
  AND2X2 U53 ( .A(n41), .B(n91), .Y(n32) );
  BUFX2 U54 ( .A(n133), .Y(n33) );
  INVX4 U55 ( .A(data_in[1]), .Y(n44) );
  INVX2 U56 ( .A(data_in[3]), .Y(n91) );
  INVX2 U57 ( .A(n33), .Y(n34) );
  MUX2X1 U58 ( .B(n49), .A(n50), .S(n35), .Y(n59) );
  INVX8 U59 ( .A(n45), .Y(n107) );
  AND2X2 U60 ( .A(n42), .B(n35), .Y(n37) );
  AND2X2 U61 ( .A(n43), .B(n41), .Y(n38) );
  AND2X2 U62 ( .A(n18), .B(n91), .Y(n39) );
  AND2X2 U63 ( .A(n47), .B(n29), .Y(n40) );
  INVX4 U64 ( .A(data_in[4]), .Y(n46) );
  BUFX2 U65 ( .A(data_in[3]), .Y(n42) );
  BUFX2 U66 ( .A(data_in[3]), .Y(n43) );
  INVX8 U67 ( .A(n44), .Y(n45) );
  INVX8 U68 ( .A(n46), .Y(n47) );
  NAND2X1 U69 ( .A(n32), .B(n101), .Y(n50) );
  NAND2X1 U70 ( .A(n43), .B(n15), .Y(n70) );
  NAND2X1 U71 ( .A(n28), .B(n137), .Y(n90) );
  NAND2X1 U72 ( .A(n20), .B(n90), .Y(n120) );
  NAND3X1 U73 ( .A(n29), .B(n91), .C(n15), .Y(n83) );
  AOI21X1 U74 ( .A(n5), .B(n120), .C(n48), .Y(n49) );
  NOR2X1 U75 ( .A(n47), .B(n45), .Y(n52) );
  NOR2X1 U76 ( .A(n35), .B(n142), .Y(n51) );
  AOI22X1 U77 ( .A(n52), .B(n70), .C(n51), .D(n22), .Y(n54) );
  NAND2X1 U78 ( .A(n41), .B(n107), .Y(n119) );
  NAND3X1 U79 ( .A(n36), .B(n47), .C(n34), .Y(n53) );
  OAI21X1 U80 ( .A(n9), .B(n54), .C(n53), .Y(n58) );
  NOR2X1 U81 ( .A(n47), .B(n132), .Y(n56) );
  OAI21X1 U82 ( .A(n21), .B(n33), .C(n9), .Y(n55) );
  AND2X2 U83 ( .A(n56), .B(n55), .Y(n57) );
  NOR3X1 U84 ( .A(n58), .B(n59), .C(n57), .Y(n69) );
  OAI21X1 U85 ( .A(n47), .B(n103), .C(n80), .Y(n61) );
  NAND2X1 U86 ( .A(n45), .B(n42), .Y(n100) );
  NAND2X1 U87 ( .A(n87), .B(n19), .Y(n89) );
  NAND3X1 U88 ( .A(n15), .B(n107), .C(n42), .Y(n136) );
  NAND2X1 U89 ( .A(n89), .B(n136), .Y(n60) );
  NAND2X1 U90 ( .A(n61), .B(n60), .Y(n68) );
  NOR2X1 U91 ( .A(n42), .B(n7), .Y(n66) );
  NAND3X1 U92 ( .A(n142), .B(n16), .C(n22), .Y(n64) );
  NAND2X1 U93 ( .A(n107), .B(n91), .Y(n99) );
  NAND2X1 U94 ( .A(n4), .B(n99), .Y(n62) );
  NAND3X1 U95 ( .A(n47), .B(n16), .C(n62), .Y(n63) );
  OAI21X1 U96 ( .A(n72), .B(n64), .C(n63), .Y(n65) );
  AOI21X1 U97 ( .A(n66), .B(n40), .C(n65), .Y(n67) );
  NAND2X1 U98 ( .A(n36), .B(n16), .Y(n77) );
  NAND2X1 U99 ( .A(n71), .B(n22), .Y(n118) );
  NAND2X1 U100 ( .A(n117), .B(n118), .Y(n75) );
  NOR2X1 U101 ( .A(n47), .B(n17), .Y(n73) );
  AOI21X1 U102 ( .A(n73), .B(n136), .C(n80), .Y(n74) );
  OAI21X1 U103 ( .A(n142), .B(n75), .C(n74), .Y(n76) );
  OAI21X1 U104 ( .A(n142), .B(n77), .C(n76), .Y(n82) );
  OAI21X1 U105 ( .A(n37), .B(n14), .C(n40), .Y(n78) );
  OAI21X1 U106 ( .A(n80), .B(n79), .C(n78), .Y(n81) );
  NOR2X1 U107 ( .A(n82), .B(n81), .Y(n98) );
  NOR2X1 U108 ( .A(n47), .B(n48), .Y(n84) );
  OAI21X1 U109 ( .A(n7), .B(n87), .C(n18), .Y(n86) );
  MUX2X1 U110 ( .B(n12), .A(n38), .S(n34), .Y(n85) );
  NAND2X1 U111 ( .A(n86), .B(n85), .Y(n95) );
  OAI21X1 U112 ( .A(n87), .B(n22), .C(n101), .Y(n88) );
  OAI21X1 U113 ( .A(n2), .B(n89), .C(n88), .Y(n94) );
  AOI22X1 U114 ( .A(n39), .B(n3), .C(n5), .D(n27), .Y(n92) );
  NAND2X1 U115 ( .A(n92), .B(n47), .Y(n93) );
  OAI22X1 U116 ( .A(n96), .B(n95), .C(n94), .D(n93), .Y(n97) );
  NAND2X1 U117 ( .A(n97), .B(n98), .Y(N131) );
  NAND2X1 U118 ( .A(n100), .B(n26), .Y(n112) );
  NAND2X1 U119 ( .A(n101), .B(n112), .Y(n134) );
  AOI21X1 U120 ( .A(n37), .B(n16), .C(n142), .Y(n102) );
  OAI21X1 U121 ( .A(n103), .B(n136), .C(n102), .Y(n104) );
  NOR2X1 U122 ( .A(n105), .B(n104), .Y(n116) );
  OAI22X1 U123 ( .A(n19), .B(n35), .C(n21), .D(n1), .Y(n125) );
  OAI21X1 U124 ( .A(n16), .B(n29), .C(n17), .Y(n135) );
  OAI21X1 U125 ( .A(n11), .B(n4), .C(n135), .Y(n106) );
  AOI21X1 U126 ( .A(n125), .B(n25), .C(n106), .Y(n115) );
  NAND2X1 U127 ( .A(n35), .B(n33), .Y(n108) );
  OAI21X1 U128 ( .A(n19), .B(n108), .C(n142), .Y(n109) );
  AOI21X1 U129 ( .A(n30), .B(n11), .C(n109), .Y(n111) );
  OAI21X1 U130 ( .A(n17), .B(n37), .C(n18), .Y(n110) );
  AND2X2 U131 ( .A(n111), .B(n110), .Y(n114) );
  AOI22X1 U132 ( .A(n14), .B(n33), .C(n29), .D(n112), .Y(n113) );
  AOI22X1 U133 ( .A(n115), .B(n116), .C(n114), .D(n113), .Y(N96) );
  AOI21X1 U134 ( .A(n10), .B(n117), .C(n13), .Y(n124) );
  NAND2X1 U135 ( .A(n39), .B(n119), .Y(n122) );
  NAND3X1 U136 ( .A(n43), .B(n120), .C(n7), .Y(n121) );
  NAND2X1 U137 ( .A(n122), .B(n121), .Y(n123) );
  NOR2X1 U138 ( .A(n124), .B(n123), .Y(n147) );
  NAND2X1 U139 ( .A(n16), .B(n125), .Y(n129) );
  OAI21X1 U140 ( .A(n21), .B(n41), .C(n3), .Y(n126) );
  NAND2X1 U141 ( .A(n29), .B(n126), .Y(n128) );
  NAND3X1 U142 ( .A(n27), .B(n32), .C(n21), .Y(n127) );
  NOR2X1 U143 ( .A(n142), .B(n130), .Y(n146) );
  AOI22X1 U144 ( .A(n29), .B(n7), .C(n38), .D(n16), .Y(n131) );
  OAI21X1 U145 ( .A(n33), .B(n132), .C(n131), .Y(n144) );
  AND2X2 U146 ( .A(n135), .B(n134), .Y(n141) );
  INVX2 U147 ( .A(n136), .Y(n138) );
  OAI21X1 U148 ( .A(n139), .B(n138), .C(n11), .Y(n140) );
  NAND3X1 U149 ( .A(n142), .B(n141), .C(n140), .Y(n143) );
  NOR2X1 U150 ( .A(n144), .B(n143), .Y(n145) );
  AOI21X1 U151 ( .A(n147), .B(n146), .C(n145), .Y(N61) );
endmodule


module Sbox8_1 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N59, N98, N129, N162, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135;
  assign data_out[3] = N59;
  assign data_out[2] = N98;
  assign data_out[1] = N129;
  assign data_out[0] = N162;

  INVX2 U1 ( .A(data_in[2]), .Y(n38) );
  NAND2X1 U2 ( .A(n44), .B(n40), .Y(n1) );
  BUFX2 U3 ( .A(n32), .Y(n2) );
  BUFX4 U4 ( .A(n39), .Y(n3) );
  INVX4 U5 ( .A(n38), .Y(n39) );
  INVX2 U6 ( .A(n5), .Y(n4) );
  INVX1 U7 ( .A(n5), .Y(n34) );
  NAND2X1 U8 ( .A(n17), .B(n40), .Y(n5) );
  INVX1 U9 ( .A(data_in[5]), .Y(n75) );
  AND2X2 U10 ( .A(n36), .B(n20), .Y(n6) );
  AND2X1 U11 ( .A(n20), .B(n17), .Y(n7) );
  INVX4 U12 ( .A(n39), .Y(n20) );
  INVX1 U13 ( .A(n103), .Y(n8) );
  INVX2 U14 ( .A(n103), .Y(n117) );
  BUFX2 U15 ( .A(n46), .Y(n23) );
  INVX1 U16 ( .A(n22), .Y(n9) );
  BUFX2 U17 ( .A(n40), .Y(n10) );
  INVX1 U18 ( .A(n86), .Y(n11) );
  NAND2X1 U19 ( .A(n43), .B(n10), .Y(n12) );
  NAND2X1 U20 ( .A(n13), .B(n14), .Y(n15) );
  NAND2X1 U21 ( .A(n15), .B(n105), .Y(n47) );
  INVX1 U22 ( .A(n85), .Y(n13) );
  INVX1 U23 ( .A(n37), .Y(n14) );
  BUFX2 U24 ( .A(n107), .Y(n16) );
  BUFX4 U25 ( .A(data_in[4]), .Y(n17) );
  INVX2 U26 ( .A(data_in[4]), .Y(n44) );
  INVX1 U27 ( .A(n43), .Y(n18) );
  NAND2X1 U28 ( .A(n127), .B(n7), .Y(n89) );
  INVX2 U29 ( .A(n116), .Y(n19) );
  INVX2 U30 ( .A(n17), .Y(n116) );
  INVX2 U31 ( .A(n107), .Y(n88) );
  OR2X2 U32 ( .A(n38), .B(n42), .Y(n21) );
  INVX2 U33 ( .A(n21), .Y(n22) );
  INVX2 U34 ( .A(n39), .Y(n114) );
  INVX4 U35 ( .A(n23), .Y(n24) );
  INVX1 U36 ( .A(n87), .Y(n50) );
  NAND2X1 U37 ( .A(n1), .B(n87), .Y(n25) );
  MUX2X1 U38 ( .B(n33), .A(n127), .S(n44), .Y(n76) );
  INVX8 U39 ( .A(n40), .Y(n41) );
  AND2X2 U40 ( .A(n43), .B(n20), .Y(n26) );
  AND2X2 U41 ( .A(n75), .B(n46), .Y(n27) );
  INVX4 U42 ( .A(n27), .Y(n85) );
  AND2X2 U43 ( .A(n88), .B(n23), .Y(n28) );
  INVX2 U44 ( .A(n28), .Y(n105) );
  AND2X2 U45 ( .A(n39), .B(n42), .Y(n35) );
  BUFX2 U46 ( .A(n26), .Y(n29) );
  INVX1 U47 ( .A(n104), .Y(n30) );
  INVX2 U48 ( .A(n99), .Y(n31) );
  INVX4 U49 ( .A(data_in[1]), .Y(n40) );
  INVX1 U50 ( .A(n126), .Y(n131) );
  INVX1 U51 ( .A(data_in[5]), .Y(n99) );
  AND2X2 U52 ( .A(n41), .B(n44), .Y(n36) );
  AND2X2 U53 ( .A(data_in[0]), .B(n75), .Y(n32) );
  INVX4 U54 ( .A(n32), .Y(n104) );
  AND2X2 U55 ( .A(n128), .B(n37), .Y(n33) );
  INVX4 U56 ( .A(data_in[3]), .Y(n42) );
  INVX4 U57 ( .A(n35), .Y(n37) );
  INVX8 U58 ( .A(n42), .Y(n43) );
  INVX2 U59 ( .A(data_in[0]), .Y(n46) );
  OAI22X1 U60 ( .A(n4), .B(n85), .C(n41), .D(n104), .Y(n45) );
  NAND2X1 U61 ( .A(data_in[5]), .B(n46), .Y(n126) );
  INVX2 U62 ( .A(n126), .Y(n108) );
  OAI22X1 U63 ( .A(n10), .B(n37), .C(n1), .D(n3), .Y(n83) );
  AOI22X1 U64 ( .A(n22), .B(n45), .C(n11), .D(n131), .Y(n61) );
  NAND2X1 U65 ( .A(data_in[5]), .B(data_in[0]), .Y(n103) );
  MUX2X1 U66 ( .B(n103), .A(n126), .S(n43), .Y(n48) );
  NAND2X1 U67 ( .A(n43), .B(n20), .Y(n107) );
  OAI21X1 U68 ( .A(n48), .B(n47), .C(n4), .Y(n60) );
  OAI21X1 U69 ( .A(n3), .B(n31), .C(n104), .Y(n49) );
  NAND2X1 U70 ( .A(n41), .B(n17), .Y(n87) );
  NAND2X1 U71 ( .A(n25), .B(n49), .Y(n52) );
  NAND2X1 U72 ( .A(n50), .B(n117), .Y(n51) );
  MUX2X1 U73 ( .B(n52), .A(n51), .S(n43), .Y(n58) );
  NAND2X1 U74 ( .A(n31), .B(n17), .Y(n56) );
  MUX2X1 U75 ( .B(n99), .A(n85), .S(n43), .Y(n54) );
  MUX2X1 U76 ( .B(n104), .A(n103), .S(n3), .Y(n53) );
  OAI21X1 U77 ( .A(n54), .B(n53), .C(n36), .Y(n55) );
  OAI21X1 U78 ( .A(n16), .B(n56), .C(n55), .Y(n57) );
  NOR2X1 U79 ( .A(n58), .B(n57), .Y(n59) );
  NAND3X1 U80 ( .A(n61), .B(n60), .C(n59), .Y(N162) );
  NOR2X1 U81 ( .A(n24), .B(n37), .Y(n63) );
  OAI22X1 U82 ( .A(n3), .B(n103), .C(n43), .D(n85), .Y(n62) );
  OAI21X1 U83 ( .A(n63), .B(n62), .C(n4), .Y(n79) );
  NAND3X1 U84 ( .A(n41), .B(n26), .C(n24), .Y(n64) );
  INVX2 U85 ( .A(n64), .Y(n74) );
  NAND2X1 U86 ( .A(n114), .B(n42), .Y(n115) );
  NAND2X1 U87 ( .A(n21), .B(n115), .Y(n100) );
  NAND2X1 U88 ( .A(n108), .B(n100), .Y(n67) );
  OAI21X1 U89 ( .A(n41), .B(n43), .C(n37), .Y(n65) );
  NAND2X1 U90 ( .A(n117), .B(n65), .Y(n66) );
  NAND3X1 U91 ( .A(n44), .B(n66), .C(n67), .Y(n73) );
  NAND2X1 U92 ( .A(n41), .B(n20), .Y(n68) );
  AOI21X1 U93 ( .A(n68), .B(n16), .C(n126), .Y(n72) );
  NAND3X1 U94 ( .A(n41), .B(n43), .C(n2), .Y(n70) );
  NAND2X1 U95 ( .A(n117), .B(n22), .Y(n69) );
  NAND3X1 U96 ( .A(n19), .B(n70), .C(n69), .Y(n71) );
  OAI22X1 U97 ( .A(n74), .B(n73), .C(n72), .D(n71), .Y(n78) );
  NAND2X1 U98 ( .A(n43), .B(n40), .Y(n127) );
  NAND2X1 U99 ( .A(n39), .B(n41), .Y(n128) );
  OAI21X1 U100 ( .A(n6), .B(n76), .C(n99), .Y(n77) );
  NAND3X1 U101 ( .A(n79), .B(n78), .C(n77), .Y(N129) );
  OAI22X1 U102 ( .A(n10), .B(n105), .C(n33), .D(n103), .Y(n82) );
  NAND3X1 U103 ( .A(n29), .B(n10), .C(n8), .Y(n80) );
  OAI21X1 U104 ( .A(n104), .B(n9), .C(n80), .Y(n81) );
  OAI21X1 U105 ( .A(n82), .B(n81), .C(n44), .Y(n98) );
  INVX2 U106 ( .A(n83), .Y(n86) );
  AOI22X1 U107 ( .A(n4), .B(n31), .C(n27), .D(n19), .Y(n84) );
  OAI22X1 U108 ( .A(n85), .B(n86), .C(n84), .D(n9), .Y(n96) );
  OAI22X1 U109 ( .A(n1), .B(n26), .C(n43), .D(n87), .Y(n125) );
  INVX2 U110 ( .A(n125), .Y(n94) );
  MUX2X1 U111 ( .B(n37), .A(n115), .S(n41), .Y(n92) );
  NAND2X1 U112 ( .A(n34), .B(n43), .Y(n90) );
  MUX2X1 U113 ( .B(n90), .A(n89), .S(n24), .Y(n91) );
  AOI21X1 U114 ( .A(n92), .B(n30), .C(n91), .Y(n93) );
  OAI21X1 U115 ( .A(n126), .B(n94), .C(n93), .Y(n95) );
  NOR2X1 U116 ( .A(n96), .B(n95), .Y(n97) );
  NAND2X1 U117 ( .A(n98), .B(n97), .Y(N98) );
  NAND2X1 U118 ( .A(n14), .B(n30), .Y(n102) );
  NAND2X1 U119 ( .A(n100), .B(n99), .Y(n101) );
  MUX2X1 U120 ( .B(n102), .A(n101), .S(n4), .Y(n124) );
  MUX2X1 U121 ( .B(n104), .A(n103), .S(n43), .Y(n106) );
  OAI21X1 U122 ( .A(n106), .B(n28), .C(n36), .Y(n122) );
  NAND2X1 U123 ( .A(n25), .B(n2), .Y(n110) );
  NAND2X1 U124 ( .A(n108), .B(n10), .Y(n109) );
  NAND2X1 U125 ( .A(n109), .B(n110), .Y(n111) );
  NAND2X1 U126 ( .A(n29), .B(n111), .Y(n121) );
  NAND2X1 U127 ( .A(n22), .B(n41), .Y(n113) );
  NAND2X1 U128 ( .A(n34), .B(n18), .Y(n112) );
  NAND2X1 U129 ( .A(n113), .B(n112), .Y(n119) );
  OAI22X1 U130 ( .A(n116), .B(n115), .C(n1), .D(n114), .Y(n118) );
  OAI21X1 U131 ( .A(n119), .B(n118), .C(n8), .Y(n120) );
  NAND3X1 U132 ( .A(n122), .B(n120), .C(n121), .Y(n123) );
  NOR2X1 U133 ( .A(n124), .B(n123), .Y(n135) );
  NAND2X1 U134 ( .A(n125), .B(n27), .Y(n133) );
  AOI21X1 U135 ( .A(n12), .B(n116), .C(n126), .Y(n130) );
  NAND3X1 U136 ( .A(n17), .B(n128), .C(n37), .Y(n129) );
  AOI22X1 U137 ( .A(n6), .B(n131), .C(n130), .D(n129), .Y(n132) );
  AND2X2 U138 ( .A(n133), .B(n132), .Y(n134) );
  NAND2X1 U139 ( .A(n134), .B(n135), .Y(N59) );
endmodule


module substitution_1 ( data_in, dout );
  input [47:0] data_in;
  output [31:0] dout;
  wire   n1, n2;

  Sbox1_1 SB1 ( .data_in({data_in[47:46], n2, data_in[44:42]}), .data_out(
        dout[31:28]) );
  Sbox2_1 SB2 ( .data_in(data_in[41:36]), .data_out(dout[27:24]) );
  Sbox3_1 SB3 ( .data_in(data_in[35:30]), .data_out(dout[23:20]) );
  Sbox4_1 SB4 ( .data_in(data_in[29:24]), .data_out(dout[19:16]) );
  Sbox5_1 SB5 ( .data_in(data_in[23:18]), .data_out(dout[15:12]) );
  Sbox6_1 SB6 ( .data_in(data_in[17:12]), .data_out(dout[11:8]) );
  Sbox7_1 SB7 ( .data_in(data_in[11:6]), .data_out(dout[7:4]) );
  Sbox8_1 SB8 ( .data_in(data_in[5:0]), .data_out(dout[3:0]) );
  INVX2 U1 ( .A(data_in[45]), .Y(n1) );
  INVX4 U2 ( .A(n1), .Y(n2) );
endmodule


module permutation_1 ( data_in, data_left, data_right, data_out );
  input [31:0] data_in;
  input [31:0] data_left;
  input [31:0] data_right;
  output [63:0] data_out;
  wire   \data_right[31] , \data_right[30] , \data_right[29] ,
         \data_right[28] , \data_right[27] , \data_right[26] ,
         \data_right[25] , \data_right[24] , \data_right[23] ,
         \data_right[22] , \data_right[21] , \data_right[20] ,
         \data_right[19] , \data_right[18] , \data_right[17] ,
         \data_right[16] , \data_right[15] , \data_right[14] ,
         \data_right[13] , \data_right[12] , \data_right[11] ,
         \data_right[10] , \data_right[9] , \data_right[8] , \data_right[7] ,
         \data_right[6] , \data_right[5] , \data_right[4] , \data_right[3] ,
         \data_right[2] , \data_right[1] , \data_right[0] , n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12;
  assign data_out[63] = \data_right[31] ;
  assign \data_right[31]  = data_right[31];
  assign data_out[62] = \data_right[30] ;
  assign \data_right[30]  = data_right[30];
  assign data_out[61] = \data_right[29] ;
  assign \data_right[29]  = data_right[29];
  assign data_out[60] = \data_right[28] ;
  assign \data_right[28]  = data_right[28];
  assign data_out[59] = \data_right[27] ;
  assign \data_right[27]  = data_right[27];
  assign data_out[58] = \data_right[26] ;
  assign \data_right[26]  = data_right[26];
  assign data_out[57] = \data_right[25] ;
  assign \data_right[25]  = data_right[25];
  assign data_out[56] = \data_right[24] ;
  assign \data_right[24]  = data_right[24];
  assign data_out[55] = \data_right[23] ;
  assign \data_right[23]  = data_right[23];
  assign data_out[54] = \data_right[22] ;
  assign \data_right[22]  = data_right[22];
  assign data_out[53] = \data_right[21] ;
  assign \data_right[21]  = data_right[21];
  assign data_out[52] = \data_right[20] ;
  assign \data_right[20]  = data_right[20];
  assign data_out[51] = \data_right[19] ;
  assign \data_right[19]  = data_right[19];
  assign data_out[50] = \data_right[18] ;
  assign \data_right[18]  = data_right[18];
  assign data_out[49] = \data_right[17] ;
  assign \data_right[17]  = data_right[17];
  assign data_out[48] = \data_right[16] ;
  assign \data_right[16]  = data_right[16];
  assign data_out[47] = \data_right[15] ;
  assign \data_right[15]  = data_right[15];
  assign data_out[46] = \data_right[14] ;
  assign \data_right[14]  = data_right[14];
  assign data_out[45] = \data_right[13] ;
  assign \data_right[13]  = data_right[13];
  assign data_out[44] = \data_right[12] ;
  assign \data_right[12]  = data_right[12];
  assign data_out[43] = \data_right[11] ;
  assign \data_right[11]  = data_right[11];
  assign data_out[42] = \data_right[10] ;
  assign \data_right[10]  = data_right[10];
  assign data_out[41] = \data_right[9] ;
  assign \data_right[9]  = data_right[9];
  assign data_out[40] = \data_right[8] ;
  assign \data_right[8]  = data_right[8];
  assign data_out[39] = \data_right[7] ;
  assign \data_right[7]  = data_right[7];
  assign data_out[38] = \data_right[6] ;
  assign \data_right[6]  = data_right[6];
  assign data_out[37] = \data_right[5] ;
  assign \data_right[5]  = data_right[5];
  assign data_out[36] = \data_right[4] ;
  assign \data_right[4]  = data_right[4];
  assign data_out[35] = \data_right[3] ;
  assign \data_right[3]  = data_right[3];
  assign data_out[34] = \data_right[2] ;
  assign \data_right[2]  = data_right[2];
  assign data_out[33] = \data_right[1] ;
  assign \data_right[1]  = data_right[1];
  assign data_out[32] = \data_right[0] ;
  assign \data_right[0]  = data_right[0];

  XOR2X1 U1 ( .A(data_in[17]), .B(n1), .Y(data_out[13]) );
  INVX8 U2 ( .A(n2), .Y(n1) );
  INVX8 U3 ( .A(data_left[13]), .Y(n2) );
  XOR2X1 U4 ( .A(data_in[30]), .B(data_left[14]), .Y(data_out[14]) );
  INVX1 U5 ( .A(data_in[1]), .Y(n5) );
  XOR2X1 U6 ( .A(data_in[27]), .B(n3), .Y(data_out[6]) );
  INVX8 U7 ( .A(n8), .Y(n3) );
  INVX2 U8 ( .A(data_left[6]), .Y(n8) );
  INVX2 U9 ( .A(data_left[7]), .Y(n9) );
  INVX2 U10 ( .A(data_left[22]), .Y(n12) );
  INVX2 U11 ( .A(data_left[24]), .Y(n10) );
  INVX2 U12 ( .A(data_left[30]), .Y(n11) );
  XOR2X1 U13 ( .A(data_in[11]), .B(data_left[5]), .Y(data_out[5]) );
  NAND2X1 U14 ( .A(data_left[16]), .B(n5), .Y(n6) );
  NAND2X1 U15 ( .A(n4), .B(data_in[1]), .Y(n7) );
  NAND2X1 U16 ( .A(n6), .B(n7), .Y(data_out[16]) );
  INVX1 U17 ( .A(data_left[16]), .Y(n4) );
  XOR2X1 U18 ( .A(data_in[10]), .B(data_left[29]), .Y(data_out[29]) );
  XOR2X1 U19 ( .A(data_in[29]), .B(data_left[26]), .Y(data_out[26]) );
  XOR2X1 U20 ( .A(data_in[12]), .B(data_left[25]), .Y(data_out[25]) );
  XOR2X1 U21 ( .A(data_in[4]), .B(data_left[12]), .Y(data_out[12]) );
  XNOR2X1 U22 ( .A(data_in[16]), .B(n9), .Y(data_out[7]) );
  XNOR2X1 U23 ( .A(data_in[18]), .B(n10), .Y(data_out[24]) );
  XNOR2X1 U24 ( .A(data_in[3]), .B(n11), .Y(data_out[30]) );
  XNOR2X1 U25 ( .A(data_in[2]), .B(n12), .Y(data_out[22]) );
  XOR2X1 U26 ( .A(data_in[15]), .B(data_left[0]), .Y(data_out[0]) );
  XOR2X1 U27 ( .A(data_left[1]), .B(data_in[6]), .Y(data_out[1]) );
  XOR2X1 U28 ( .A(data_in[19]), .B(data_left[2]), .Y(data_out[2]) );
  XOR2X1 U29 ( .A(data_in[20]), .B(data_left[3]), .Y(data_out[3]) );
  XOR2X1 U30 ( .A(data_in[28]), .B(data_left[4]), .Y(data_out[4]) );
  XOR2X1 U31 ( .A(data_in[0]), .B(data_left[8]), .Y(data_out[8]) );
  XOR2X1 U32 ( .A(data_in[14]), .B(data_left[9]), .Y(data_out[9]) );
  XOR2X1 U33 ( .A(data_in[22]), .B(data_left[10]), .Y(data_out[10]) );
  XOR2X1 U34 ( .A(data_in[25]), .B(data_left[11]), .Y(data_out[11]) );
  XOR2X1 U35 ( .A(data_in[9]), .B(data_left[15]), .Y(data_out[15]) );
  XOR2X1 U36 ( .A(data_in[7]), .B(data_left[17]), .Y(data_out[17]) );
  XOR2X1 U37 ( .A(data_in[23]), .B(data_left[18]), .Y(data_out[18]) );
  XOR2X1 U38 ( .A(data_in[13]), .B(data_left[19]), .Y(data_out[19]) );
  XOR2X1 U39 ( .A(data_in[31]), .B(data_left[20]), .Y(data_out[20]) );
  XOR2X1 U40 ( .A(data_in[26]), .B(data_left[21]), .Y(data_out[21]) );
  XOR2X1 U41 ( .A(data_in[8]), .B(data_left[23]), .Y(data_out[23]) );
  XOR2X1 U42 ( .A(data_in[5]), .B(data_left[27]), .Y(data_out[27]) );
  XOR2X1 U43 ( .A(data_in[21]), .B(data_left[28]), .Y(data_out[28]) );
  XOR2X1 U44 ( .A(data_in[24]), .B(data_left[31]), .Y(data_out[31]) );
endmodule


module des_1 ( clk, n_rst, data_in, key_in, ready, rw_mode, data_out, 
        next_data );
  input [63:0] data_in;
  input [63:0] key_in;
  output [63:0] data_out;
  input clk, n_rst, ready, rw_mode;
  output next_data;

  wire   [1:0] io;
  wire   [63:0] internal_data;
  wire   [31:0] data_right;
  wire   [31:0] data_left;
  wire   [4:0] r_num;
  wire   [47:0] exp_to_key;
  wire   [47:0] rkey;
  wire   [47:0] key_to_sub;
  wire   [31:0] sub_to_perm;

  des_io_select_1 IOSELECT ( .clk(clk), .io_sel(io), .ext_in(data_in), 
        .int_in(internal_data), .data_out_right(data_right), .data_out_left(
        data_left), .ext_out(data_out) );
  des_controller_1 DESCONTROLLER ( .clk(clk), .n_rst(n_rst), .data_ready(ready), .rw_mode(rw_mode), .io_select(io), .next_data(next_data), .round_number(
        r_num) );
  expansion_1 EXP ( .data_in(data_right), .data_out(exp_to_key) );
  key_wrapper_1 KEY ( .key_in(key_in), .round_number(r_num), .kout(rkey) );
  key_xor_1 KXOR ( .data(exp_to_key), .key(rkey), .out(key_to_sub) );
  substitution_1 SUB ( .data_in(key_to_sub), .dout(sub_to_perm) );
  permutation_1 PERM ( .data_in(sub_to_perm), .data_left(data_left), 
        .data_right(data_right), .data_out(internal_data) );
endmodule


module des_io_select_0 ( clk, io_sel, ext_in, int_in, data_out_right, 
        data_out_left, ext_out );
  input [1:0] io_sel;
  input [63:0] ext_in;
  input [63:0] int_in;
  output [31:0] data_out_right;
  output [31:0] data_out_left;
  output [63:0] ext_out;
  input clk;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n133, n134,
         n141, n145, n146, n147, n149, n151, n155, n158, n159, n161, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300;
  assign ext_out[63] = data_out_right[31];
  assign ext_out[62] = data_out_right[30];
  assign ext_out[61] = data_out_right[29];
  assign ext_out[60] = data_out_right[28];
  assign ext_out[59] = data_out_right[27];
  assign ext_out[58] = data_out_right[26];
  assign ext_out[57] = data_out_right[25];
  assign ext_out[56] = data_out_right[24];
  assign ext_out[55] = data_out_right[23];
  assign ext_out[54] = data_out_right[22];
  assign ext_out[53] = data_out_right[21];
  assign ext_out[52] = data_out_right[20];
  assign ext_out[51] = data_out_right[19];
  assign ext_out[50] = data_out_right[18];
  assign ext_out[49] = data_out_right[17];
  assign ext_out[48] = data_out_right[16];
  assign ext_out[47] = data_out_right[15];
  assign ext_out[46] = data_out_right[14];
  assign ext_out[45] = data_out_right[13];
  assign ext_out[44] = data_out_right[12];
  assign ext_out[43] = data_out_right[11];
  assign ext_out[42] = data_out_right[10];
  assign ext_out[41] = data_out_right[9];
  assign ext_out[40] = data_out_right[8];
  assign ext_out[39] = data_out_right[7];
  assign ext_out[38] = data_out_right[6];
  assign ext_out[37] = data_out_right[5];
  assign ext_out[36] = data_out_right[4];
  assign ext_out[35] = data_out_right[3];
  assign ext_out[34] = data_out_right[2];
  assign ext_out[33] = data_out_right[1];
  assign ext_out[32] = data_out_right[0];
  assign ext_out[31] = data_out_left[31];
  assign ext_out[30] = data_out_left[30];
  assign ext_out[29] = data_out_left[29];
  assign ext_out[28] = data_out_left[28];
  assign ext_out[27] = data_out_left[27];
  assign ext_out[26] = data_out_left[26];
  assign ext_out[25] = data_out_left[25];
  assign ext_out[24] = data_out_left[24];
  assign ext_out[23] = data_out_left[23];
  assign ext_out[22] = data_out_left[22];
  assign ext_out[21] = data_out_left[21];
  assign ext_out[20] = data_out_left[20];
  assign ext_out[19] = data_out_left[19];
  assign ext_out[18] = data_out_left[18];
  assign ext_out[17] = data_out_left[17];
  assign ext_out[16] = data_out_left[16];
  assign ext_out[15] = data_out_left[15];
  assign ext_out[14] = data_out_left[14];
  assign ext_out[13] = data_out_left[13];
  assign ext_out[12] = data_out_left[12];
  assign ext_out[11] = data_out_left[11];
  assign ext_out[10] = data_out_left[10];
  assign ext_out[9] = data_out_left[9];
  assign ext_out[8] = data_out_left[8];
  assign ext_out[7] = data_out_left[7];
  assign ext_out[6] = data_out_left[6];
  assign ext_out[5] = data_out_left[5];
  assign ext_out[4] = data_out_left[4];
  assign ext_out[3] = data_out_left[3];
  assign ext_out[2] = data_out_left[2];
  assign ext_out[1] = data_out_left[1];
  assign ext_out[0] = data_out_left[0];

  DFFPOSX1 \left_curr_reg[31]  ( .D(n249), .CLK(clk), .Q(data_out_left[31]) );
  DFFPOSX1 \left_curr_reg[30]  ( .D(n250), .CLK(clk), .Q(data_out_left[30]) );
  DFFPOSX1 \left_curr_reg[29]  ( .D(n251), .CLK(clk), .Q(data_out_left[29]) );
  DFFPOSX1 \left_curr_reg[28]  ( .D(n252), .CLK(clk), .Q(data_out_left[28]) );
  DFFPOSX1 \left_curr_reg[27]  ( .D(n253), .CLK(clk), .Q(data_out_left[27]) );
  DFFPOSX1 \left_curr_reg[26]  ( .D(n254), .CLK(clk), .Q(data_out_left[26]) );
  DFFPOSX1 \left_curr_reg[25]  ( .D(n255), .CLK(clk), .Q(data_out_left[25]) );
  DFFPOSX1 \left_curr_reg[24]  ( .D(n256), .CLK(clk), .Q(data_out_left[24]) );
  DFFPOSX1 \left_curr_reg[23]  ( .D(n257), .CLK(clk), .Q(data_out_left[23]) );
  DFFPOSX1 \left_curr_reg[22]  ( .D(n258), .CLK(clk), .Q(data_out_left[22]) );
  DFFPOSX1 \left_curr_reg[21]  ( .D(n259), .CLK(clk), .Q(data_out_left[21]) );
  DFFPOSX1 \left_curr_reg[20]  ( .D(n260), .CLK(clk), .Q(data_out_left[20]) );
  DFFPOSX1 \left_curr_reg[19]  ( .D(n261), .CLK(clk), .Q(data_out_left[19]) );
  DFFPOSX1 \left_curr_reg[18]  ( .D(n262), .CLK(clk), .Q(data_out_left[18]) );
  DFFPOSX1 \left_curr_reg[17]  ( .D(n263), .CLK(clk), .Q(data_out_left[17]) );
  DFFPOSX1 \left_curr_reg[16]  ( .D(n264), .CLK(clk), .Q(data_out_left[16]) );
  DFFPOSX1 \left_curr_reg[15]  ( .D(n265), .CLK(clk), .Q(data_out_left[15]) );
  DFFPOSX1 \left_curr_reg[14]  ( .D(n266), .CLK(clk), .Q(data_out_left[14]) );
  DFFPOSX1 \left_curr_reg[13]  ( .D(n267), .CLK(clk), .Q(data_out_left[13]) );
  DFFPOSX1 \left_curr_reg[12]  ( .D(n268), .CLK(clk), .Q(data_out_left[12]) );
  DFFPOSX1 \left_curr_reg[11]  ( .D(n269), .CLK(clk), .Q(data_out_left[11]) );
  DFFPOSX1 \left_curr_reg[10]  ( .D(n270), .CLK(clk), .Q(data_out_left[10]) );
  DFFPOSX1 \left_curr_reg[9]  ( .D(n271), .CLK(clk), .Q(data_out_left[9]) );
  DFFPOSX1 \left_curr_reg[8]  ( .D(n272), .CLK(clk), .Q(data_out_left[8]) );
  DFFPOSX1 \left_curr_reg[7]  ( .D(n273), .CLK(clk), .Q(data_out_left[7]) );
  DFFPOSX1 \left_curr_reg[6]  ( .D(n274), .CLK(clk), .Q(data_out_left[6]) );
  DFFPOSX1 \left_curr_reg[5]  ( .D(n275), .CLK(clk), .Q(data_out_left[5]) );
  DFFPOSX1 \left_curr_reg[4]  ( .D(n276), .CLK(clk), .Q(data_out_left[4]) );
  DFFPOSX1 \left_curr_reg[3]  ( .D(n277), .CLK(clk), .Q(data_out_left[3]) );
  DFFPOSX1 \left_curr_reg[2]  ( .D(n278), .CLK(clk), .Q(data_out_left[2]) );
  DFFPOSX1 \left_curr_reg[1]  ( .D(n279), .CLK(clk), .Q(data_out_left[1]) );
  DFFPOSX1 \left_curr_reg[0]  ( .D(n280), .CLK(clk), .Q(data_out_left[0]) );
  DFFPOSX1 \right_curr_reg[31]  ( .D(n281), .CLK(clk), .Q(data_out_right[31])
         );
  DFFPOSX1 \right_curr_reg[30]  ( .D(n282), .CLK(clk), .Q(data_out_right[30])
         );
  DFFPOSX1 \right_curr_reg[29]  ( .D(n246), .CLK(clk), .Q(data_out_right[29])
         );
  DFFPOSX1 \right_curr_reg[28]  ( .D(n283), .CLK(clk), .Q(data_out_right[28])
         );
  DFFPOSX1 \right_curr_reg[27]  ( .D(n239), .CLK(clk), .Q(data_out_right[27])
         );
  DFFPOSX1 \right_curr_reg[26]  ( .D(n238), .CLK(clk), .Q(data_out_right[26])
         );
  DFFPOSX1 \right_curr_reg[25]  ( .D(n284), .CLK(clk), .Q(data_out_right[25])
         );
  DFFPOSX1 \right_curr_reg[24]  ( .D(n285), .CLK(clk), .Q(data_out_right[24])
         );
  DFFPOSX1 \right_curr_reg[23]  ( .D(n245), .CLK(clk), .Q(data_out_right[23])
         );
  DFFPOSX1 \right_curr_reg[22]  ( .D(n286), .CLK(clk), .Q(data_out_right[22])
         );
  DFFPOSX1 \right_curr_reg[21]  ( .D(n287), .CLK(clk), .Q(data_out_right[21])
         );
  DFFPOSX1 \right_curr_reg[20]  ( .D(n288), .CLK(clk), .Q(data_out_right[20])
         );
  DFFPOSX1 \right_curr_reg[19]  ( .D(n240), .CLK(clk), .Q(data_out_right[19])
         );
  DFFPOSX1 \right_curr_reg[18]  ( .D(n289), .CLK(clk), .Q(data_out_right[18])
         );
  DFFPOSX1 \right_curr_reg[17]  ( .D(n242), .CLK(clk), .Q(data_out_right[17])
         );
  DFFPOSX1 \right_curr_reg[16]  ( .D(n290), .CLK(clk), .Q(data_out_right[16])
         );
  DFFPOSX1 \right_curr_reg[15]  ( .D(n248), .CLK(clk), .Q(data_out_right[15])
         );
  DFFPOSX1 \right_curr_reg[14]  ( .D(n237), .CLK(clk), .Q(data_out_right[14])
         );
  DFFPOSX1 \right_curr_reg[13]  ( .D(n244), .CLK(clk), .Q(data_out_right[13])
         );
  DFFPOSX1 \right_curr_reg[12]  ( .D(n291), .CLK(clk), .Q(data_out_right[12])
         );
  DFFPOSX1 \right_curr_reg[11]  ( .D(n292), .CLK(clk), .Q(data_out_right[11])
         );
  DFFPOSX1 \right_curr_reg[10]  ( .D(n293), .CLK(clk), .Q(data_out_right[10])
         );
  DFFPOSX1 \right_curr_reg[9]  ( .D(n247), .CLK(clk), .Q(data_out_right[9]) );
  DFFPOSX1 \right_curr_reg[8]  ( .D(n294), .CLK(clk), .Q(data_out_right[8]) );
  DFFPOSX1 \right_curr_reg[7]  ( .D(n295), .CLK(clk), .Q(data_out_right[7]) );
  DFFPOSX1 \right_curr_reg[6]  ( .D(n296), .CLK(clk), .Q(data_out_right[6]) );
  DFFPOSX1 \right_curr_reg[5]  ( .D(n297), .CLK(clk), .Q(data_out_right[5]) );
  DFFPOSX1 \right_curr_reg[4]  ( .D(n298), .CLK(clk), .Q(data_out_right[4]) );
  DFFPOSX1 \right_curr_reg[3]  ( .D(n299), .CLK(clk), .Q(data_out_right[3]) );
  DFFPOSX1 \right_curr_reg[2]  ( .D(n243), .CLK(clk), .Q(data_out_right[2]) );
  DFFPOSX1 \right_curr_reg[1]  ( .D(n241), .CLK(clk), .Q(data_out_right[1]) );
  DFFPOSX1 \right_curr_reg[0]  ( .D(n300), .CLK(clk), .Q(data_out_right[0]) );
  INVX2 U2 ( .A(n119), .Y(n247) );
  BUFX4 U3 ( .A(n230), .Y(n24) );
  INVX8 U4 ( .A(n16), .Y(n13) );
  INVX8 U5 ( .A(n15), .Y(n14) );
  INVX1 U6 ( .A(int_in[12]), .Y(n125) );
  INVX1 U7 ( .A(n231), .Y(n246) );
  INVX2 U8 ( .A(n230), .Y(n11) );
  BUFX4 U9 ( .A(n2), .Y(n27) );
  BUFX4 U10 ( .A(n2), .Y(n25) );
  BUFX4 U11 ( .A(n2), .Y(n26) );
  INVX1 U12 ( .A(n103), .Y(n243) );
  INVX1 U13 ( .A(n129), .Y(n244) );
  INVX1 U14 ( .A(n147), .Y(n248) );
  INVX1 U15 ( .A(n161), .Y(n242) );
  BUFX4 U16 ( .A(n2), .Y(n29) );
  INVX4 U17 ( .A(n17), .Y(n12) );
  BUFX2 U18 ( .A(n19), .Y(n17) );
  BUFX2 U19 ( .A(n20), .Y(n15) );
  BUFX2 U20 ( .A(n20), .Y(n16) );
  BUFX2 U21 ( .A(n19), .Y(n18) );
  INVX2 U22 ( .A(n228), .Y(n20) );
  BUFX2 U23 ( .A(n2), .Y(n28) );
  INVX1 U24 ( .A(n228), .Y(n19) );
  AND2X2 U25 ( .A(io_sel[1]), .B(n14), .Y(n1) );
  AND2X2 U26 ( .A(io_sel[0]), .B(n228), .Y(n2) );
  INVX1 U27 ( .A(n223), .Y(n239) );
  INVX1 U28 ( .A(n201), .Y(n240) );
  INVX1 U29 ( .A(n211), .Y(n245) );
  INVX1 U30 ( .A(n219), .Y(n238) );
  INVX1 U31 ( .A(n24), .Y(n3) );
  INVX1 U32 ( .A(n24), .Y(n4) );
  INVX1 U33 ( .A(n24), .Y(n5) );
  INVX1 U34 ( .A(n24), .Y(n6) );
  INVX1 U35 ( .A(n1), .Y(n7) );
  INVX1 U36 ( .A(n1), .Y(n8) );
  INVX1 U37 ( .A(n1), .Y(n9) );
  INVX1 U38 ( .A(n1), .Y(n10) );
  BUFX4 U39 ( .A(n230), .Y(n21) );
  BUFX4 U40 ( .A(n230), .Y(n22) );
  BUFX4 U41 ( .A(n230), .Y(n23) );
  NAND2X1 U42 ( .A(io_sel[0]), .B(io_sel[1]), .Y(n228) );
  INVX2 U43 ( .A(data_out_left[0]), .Y(n31) );
  NAND2X1 U44 ( .A(io_sel[1]), .B(n228), .Y(n236) );
  INVX2 U45 ( .A(n236), .Y(n230) );
  AOI22X1 U46 ( .A(int_in[32]), .B(n22), .C(ext_in[32]), .D(n26), .Y(n30) );
  OAI21X1 U47 ( .A(n13), .B(n31), .C(n30), .Y(n280) );
  INVX2 U48 ( .A(data_out_left[1]), .Y(n33) );
  AOI22X1 U49 ( .A(int_in[33]), .B(n23), .C(ext_in[33]), .D(n27), .Y(n32) );
  OAI21X1 U50 ( .A(n13), .B(n33), .C(n32), .Y(n279) );
  INVX2 U51 ( .A(data_out_left[2]), .Y(n35) );
  AOI22X1 U52 ( .A(int_in[34]), .B(n23), .C(ext_in[34]), .D(n27), .Y(n34) );
  OAI21X1 U53 ( .A(n13), .B(n35), .C(n34), .Y(n278) );
  INVX2 U54 ( .A(data_out_left[3]), .Y(n37) );
  AOI22X1 U55 ( .A(int_in[35]), .B(n23), .C(ext_in[35]), .D(n27), .Y(n36) );
  OAI21X1 U56 ( .A(n13), .B(n37), .C(n36), .Y(n277) );
  INVX2 U57 ( .A(data_out_left[4]), .Y(n39) );
  AOI22X1 U58 ( .A(int_in[36]), .B(n23), .C(ext_in[36]), .D(n27), .Y(n38) );
  OAI21X1 U59 ( .A(n13), .B(n39), .C(n38), .Y(n276) );
  INVX2 U60 ( .A(data_out_left[5]), .Y(n41) );
  AOI22X1 U61 ( .A(int_in[37]), .B(n23), .C(ext_in[37]), .D(n27), .Y(n40) );
  OAI21X1 U62 ( .A(n14), .B(n41), .C(n40), .Y(n275) );
  INVX2 U63 ( .A(data_out_left[6]), .Y(n43) );
  AOI22X1 U64 ( .A(int_in[38]), .B(n23), .C(ext_in[38]), .D(n27), .Y(n42) );
  OAI21X1 U65 ( .A(n14), .B(n43), .C(n42), .Y(n274) );
  INVX2 U66 ( .A(data_out_left[7]), .Y(n45) );
  AOI22X1 U67 ( .A(int_in[39]), .B(n22), .C(ext_in[39]), .D(n27), .Y(n44) );
  OAI21X1 U68 ( .A(n14), .B(n45), .C(n44), .Y(n273) );
  INVX2 U69 ( .A(data_out_left[8]), .Y(n47) );
  AOI22X1 U70 ( .A(int_in[40]), .B(n22), .C(ext_in[40]), .D(n27), .Y(n46) );
  OAI21X1 U71 ( .A(n14), .B(n47), .C(n46), .Y(n272) );
  INVX2 U72 ( .A(data_out_left[9]), .Y(n49) );
  AOI22X1 U73 ( .A(int_in[41]), .B(n22), .C(ext_in[41]), .D(n27), .Y(n48) );
  OAI21X1 U74 ( .A(n14), .B(n49), .C(n48), .Y(n271) );
  INVX2 U75 ( .A(data_out_left[10]), .Y(n51) );
  AOI22X1 U76 ( .A(int_in[42]), .B(n22), .C(ext_in[42]), .D(n26), .Y(n50) );
  OAI21X1 U77 ( .A(n14), .B(n51), .C(n50), .Y(n270) );
  INVX2 U78 ( .A(data_out_left[11]), .Y(n53) );
  AOI22X1 U79 ( .A(int_in[43]), .B(n22), .C(ext_in[43]), .D(n26), .Y(n52) );
  OAI21X1 U80 ( .A(n14), .B(n53), .C(n52), .Y(n269) );
  INVX2 U81 ( .A(data_out_left[12]), .Y(n55) );
  AOI22X1 U82 ( .A(int_in[44]), .B(n22), .C(ext_in[44]), .D(n26), .Y(n54) );
  OAI21X1 U83 ( .A(n14), .B(n55), .C(n54), .Y(n268) );
  INVX2 U84 ( .A(data_out_left[13]), .Y(n57) );
  AOI22X1 U85 ( .A(int_in[45]), .B(n22), .C(ext_in[45]), .D(n26), .Y(n56) );
  OAI21X1 U86 ( .A(n14), .B(n57), .C(n56), .Y(n267) );
  INVX2 U87 ( .A(data_out_left[14]), .Y(n59) );
  AOI22X1 U88 ( .A(int_in[46]), .B(n22), .C(ext_in[46]), .D(n26), .Y(n58) );
  OAI21X1 U89 ( .A(n14), .B(n59), .C(n58), .Y(n266) );
  INVX2 U90 ( .A(data_out_left[15]), .Y(n61) );
  AOI22X1 U91 ( .A(int_in[47]), .B(n22), .C(ext_in[47]), .D(n26), .Y(n60) );
  OAI21X1 U92 ( .A(n14), .B(n61), .C(n60), .Y(n265) );
  INVX2 U93 ( .A(data_out_left[16]), .Y(n63) );
  AOI22X1 U94 ( .A(int_in[48]), .B(n22), .C(ext_in[48]), .D(n26), .Y(n62) );
  OAI21X1 U95 ( .A(n14), .B(n63), .C(n62), .Y(n264) );
  INVX2 U96 ( .A(data_out_left[17]), .Y(n65) );
  AOI22X1 U97 ( .A(int_in[49]), .B(n22), .C(ext_in[49]), .D(n26), .Y(n64) );
  OAI21X1 U98 ( .A(n14), .B(n65), .C(n64), .Y(n263) );
  INVX2 U99 ( .A(data_out_left[18]), .Y(n67) );
  AOI22X1 U100 ( .A(int_in[50]), .B(n22), .C(ext_in[50]), .D(n26), .Y(n66) );
  OAI21X1 U101 ( .A(n13), .B(n67), .C(n66), .Y(n262) );
  INVX2 U102 ( .A(data_out_left[19]), .Y(n69) );
  AOI22X1 U103 ( .A(int_in[51]), .B(n21), .C(ext_in[51]), .D(n26), .Y(n68) );
  OAI21X1 U104 ( .A(n13), .B(n69), .C(n68), .Y(n261) );
  INVX2 U105 ( .A(data_out_left[20]), .Y(n71) );
  AOI22X1 U106 ( .A(int_in[52]), .B(n21), .C(ext_in[52]), .D(n26), .Y(n70) );
  OAI21X1 U107 ( .A(n13), .B(n71), .C(n70), .Y(n260) );
  INVX2 U108 ( .A(data_out_left[21]), .Y(n73) );
  AOI22X1 U109 ( .A(int_in[53]), .B(n21), .C(ext_in[53]), .D(n26), .Y(n72) );
  OAI21X1 U110 ( .A(n13), .B(n73), .C(n72), .Y(n259) );
  INVX2 U111 ( .A(data_out_left[22]), .Y(n75) );
  AOI22X1 U112 ( .A(int_in[54]), .B(n21), .C(ext_in[54]), .D(n25), .Y(n74) );
  OAI21X1 U113 ( .A(n13), .B(n75), .C(n74), .Y(n258) );
  INVX2 U114 ( .A(data_out_left[23]), .Y(n77) );
  AOI22X1 U115 ( .A(int_in[55]), .B(n21), .C(ext_in[55]), .D(n25), .Y(n76) );
  OAI21X1 U116 ( .A(n13), .B(n77), .C(n76), .Y(n257) );
  INVX2 U117 ( .A(data_out_left[24]), .Y(n79) );
  AOI22X1 U118 ( .A(int_in[56]), .B(n21), .C(ext_in[56]), .D(n25), .Y(n78) );
  OAI21X1 U119 ( .A(n13), .B(n79), .C(n78), .Y(n256) );
  INVX2 U120 ( .A(data_out_left[25]), .Y(n81) );
  AOI22X1 U121 ( .A(int_in[57]), .B(n21), .C(ext_in[57]), .D(n25), .Y(n80) );
  OAI21X1 U122 ( .A(n13), .B(n81), .C(n80), .Y(n255) );
  INVX2 U123 ( .A(data_out_left[26]), .Y(n83) );
  AOI22X1 U124 ( .A(int_in[58]), .B(n21), .C(ext_in[58]), .D(n25), .Y(n82) );
  OAI21X1 U125 ( .A(n13), .B(n83), .C(n82), .Y(n254) );
  INVX2 U126 ( .A(data_out_left[27]), .Y(n85) );
  AOI22X1 U127 ( .A(int_in[59]), .B(n21), .C(ext_in[59]), .D(n25), .Y(n84) );
  OAI21X1 U128 ( .A(n13), .B(n85), .C(n84), .Y(n253) );
  INVX2 U129 ( .A(data_out_left[28]), .Y(n87) );
  AOI22X1 U130 ( .A(int_in[60]), .B(n21), .C(ext_in[60]), .D(n25), .Y(n86) );
  OAI21X1 U131 ( .A(n13), .B(n87), .C(n86), .Y(n252) );
  INVX2 U132 ( .A(data_out_left[29]), .Y(n89) );
  AOI22X1 U133 ( .A(int_in[61]), .B(n21), .C(ext_in[61]), .D(n25), .Y(n88) );
  OAI21X1 U134 ( .A(n13), .B(n89), .C(n88), .Y(n251) );
  INVX2 U135 ( .A(data_out_left[30]), .Y(n91) );
  AOI22X1 U136 ( .A(int_in[62]), .B(n21), .C(ext_in[62]), .D(n25), .Y(n90) );
  OAI21X1 U137 ( .A(n13), .B(n91), .C(n90), .Y(n250) );
  INVX2 U138 ( .A(data_out_left[31]), .Y(n93) );
  AOI22X1 U139 ( .A(int_in[63]), .B(n21), .C(ext_in[63]), .D(n25), .Y(n92) );
  OAI21X1 U140 ( .A(n12), .B(n93), .C(n92), .Y(n249) );
  INVX2 U141 ( .A(int_in[0]), .Y(n95) );
  AOI22X1 U142 ( .A(ext_in[0]), .B(n27), .C(data_out_right[0]), .D(n18), .Y(
        n94) );
  OAI21X1 U143 ( .A(n7), .B(n95), .C(n94), .Y(n300) );
  INVX2 U144 ( .A(data_out_right[1]), .Y(n97) );
  NAND2X1 U145 ( .A(ext_in[1]), .B(n29), .Y(n96) );
  OAI21X1 U146 ( .A(n12), .B(n97), .C(n96), .Y(n98) );
  OAI22X1 U147 ( .A(n23), .B(n98), .C(int_in[1]), .D(n98), .Y(n99) );
  INVX2 U148 ( .A(n99), .Y(n241) );
  INVX2 U149 ( .A(data_out_right[2]), .Y(n101) );
  NAND2X1 U150 ( .A(ext_in[2]), .B(n29), .Y(n100) );
  OAI21X1 U151 ( .A(n12), .B(n101), .C(n100), .Y(n102) );
  OAI22X1 U152 ( .A(n24), .B(n102), .C(int_in[2]), .D(n102), .Y(n103) );
  INVX2 U153 ( .A(int_in[3]), .Y(n105) );
  AOI22X1 U154 ( .A(ext_in[3]), .B(n28), .C(data_out_right[3]), .D(n17), .Y(
        n104) );
  OAI21X1 U155 ( .A(n8), .B(n105), .C(n104), .Y(n299) );
  INVX2 U156 ( .A(int_in[4]), .Y(n107) );
  AOI22X1 U157 ( .A(ext_in[4]), .B(n27), .C(data_out_right[4]), .D(n18), .Y(
        n106) );
  OAI21X1 U158 ( .A(n9), .B(n107), .C(n106), .Y(n298) );
  INVX2 U159 ( .A(int_in[5]), .Y(n109) );
  AOI22X1 U160 ( .A(ext_in[5]), .B(n27), .C(data_out_right[5]), .D(n18), .Y(
        n108) );
  OAI21X1 U161 ( .A(n10), .B(n109), .C(n108), .Y(n297) );
  INVX2 U162 ( .A(int_in[6]), .Y(n111) );
  AOI22X1 U163 ( .A(ext_in[6]), .B(n27), .C(data_out_right[6]), .D(n18), .Y(
        n110) );
  OAI21X1 U164 ( .A(n11), .B(n111), .C(n110), .Y(n296) );
  INVX2 U165 ( .A(int_in[7]), .Y(n113) );
  AOI22X1 U166 ( .A(data_out_right[7]), .B(n18), .C(ext_in[7]), .D(n25), .Y(
        n112) );
  OAI21X1 U167 ( .A(n11), .B(n113), .C(n112), .Y(n295) );
  INVX2 U168 ( .A(int_in[8]), .Y(n115) );
  AOI22X1 U169 ( .A(ext_in[8]), .B(n28), .C(data_out_right[8]), .D(n18), .Y(
        n114) );
  OAI21X1 U170 ( .A(n11), .B(n115), .C(n114), .Y(n294) );
  INVX2 U171 ( .A(data_out_right[9]), .Y(n117) );
  NAND2X1 U172 ( .A(ext_in[9]), .B(n29), .Y(n116) );
  OAI21X1 U173 ( .A(n12), .B(n117), .C(n116), .Y(n118) );
  OAI22X1 U174 ( .A(n23), .B(n118), .C(int_in[9]), .D(n118), .Y(n119) );
  INVX2 U175 ( .A(int_in[10]), .Y(n121) );
  AOI22X1 U176 ( .A(ext_in[10]), .B(n28), .C(data_out_right[10]), .D(n18), .Y(
        n120) );
  OAI21X1 U177 ( .A(n11), .B(n121), .C(n120), .Y(n293) );
  INVX2 U178 ( .A(int_in[11]), .Y(n123) );
  AOI22X1 U179 ( .A(data_out_right[11]), .B(n18), .C(ext_in[11]), .D(n25), .Y(
        n122) );
  OAI21X1 U180 ( .A(n3), .B(n123), .C(n122), .Y(n292) );
  AOI22X1 U181 ( .A(data_out_right[12]), .B(n18), .C(ext_in[12]), .D(n25), .Y(
        n124) );
  OAI21X1 U182 ( .A(n4), .B(n125), .C(n124), .Y(n291) );
  INVX2 U183 ( .A(data_out_right[13]), .Y(n127) );
  NAND2X1 U184 ( .A(ext_in[13]), .B(n29), .Y(n126) );
  OAI21X1 U185 ( .A(n12), .B(n127), .C(n126), .Y(n128) );
  OAI22X1 U186 ( .A(n24), .B(n128), .C(int_in[13]), .D(n128), .Y(n129) );
  INVX2 U187 ( .A(data_out_right[14]), .Y(n131) );
  NAND2X1 U188 ( .A(ext_in[14]), .B(n29), .Y(n130) );
  OAI21X1 U189 ( .A(n12), .B(n131), .C(n130), .Y(n133) );
  OAI22X1 U190 ( .A(int_in[14]), .B(n133), .C(n23), .D(n133), .Y(n134) );
  INVX2 U191 ( .A(n134), .Y(n237) );
  INVX2 U192 ( .A(data_out_right[15]), .Y(n145) );
  NAND2X1 U193 ( .A(ext_in[15]), .B(n29), .Y(n141) );
  OAI21X1 U194 ( .A(n12), .B(n145), .C(n141), .Y(n146) );
  OAI22X1 U195 ( .A(n24), .B(n146), .C(int_in[15]), .D(n146), .Y(n147) );
  INVX2 U196 ( .A(int_in[16]), .Y(n151) );
  AOI22X1 U197 ( .A(ext_in[16]), .B(n28), .C(data_out_right[16]), .D(n17), .Y(
        n149) );
  OAI21X1 U198 ( .A(n5), .B(n151), .C(n149), .Y(n290) );
  INVX2 U199 ( .A(data_out_right[17]), .Y(n158) );
  NAND2X1 U200 ( .A(ext_in[17]), .B(n29), .Y(n155) );
  OAI21X1 U201 ( .A(n12), .B(n158), .C(n155), .Y(n159) );
  OAI22X1 U202 ( .A(n24), .B(n159), .C(int_in[17]), .D(n159), .Y(n161) );
  INVX2 U203 ( .A(int_in[18]), .Y(n197) );
  AOI22X1 U204 ( .A(ext_in[18]), .B(n28), .C(data_out_right[18]), .D(n16), .Y(
        n196) );
  OAI21X1 U205 ( .A(n6), .B(n197), .C(n196), .Y(n289) );
  INVX2 U206 ( .A(data_out_right[19]), .Y(n199) );
  NAND2X1 U207 ( .A(ext_in[19]), .B(n29), .Y(n198) );
  OAI21X1 U208 ( .A(n12), .B(n199), .C(n198), .Y(n200) );
  OAI22X1 U209 ( .A(int_in[19]), .B(n200), .C(n23), .D(n200), .Y(n201) );
  INVX2 U210 ( .A(int_in[20]), .Y(n203) );
  AOI22X1 U211 ( .A(ext_in[20]), .B(n28), .C(data_out_right[20]), .D(n16), .Y(
        n202) );
  OAI21X1 U212 ( .A(n3), .B(n203), .C(n202), .Y(n288) );
  INVX2 U213 ( .A(int_in[21]), .Y(n205) );
  AOI22X1 U214 ( .A(ext_in[21]), .B(n28), .C(data_out_right[21]), .D(n16), .Y(
        n204) );
  OAI21X1 U215 ( .A(n4), .B(n205), .C(n204), .Y(n287) );
  INVX2 U216 ( .A(int_in[22]), .Y(n207) );
  AOI22X1 U217 ( .A(ext_in[22]), .B(n28), .C(data_out_right[22]), .D(n15), .Y(
        n206) );
  OAI21X1 U218 ( .A(n5), .B(n207), .C(n206), .Y(n286) );
  INVX2 U219 ( .A(data_out_right[23]), .Y(n209) );
  NAND2X1 U220 ( .A(ext_in[23]), .B(n29), .Y(n208) );
  OAI21X1 U221 ( .A(n12), .B(n209), .C(n208), .Y(n210) );
  OAI22X1 U222 ( .A(int_in[23]), .B(n210), .C(n23), .D(n210), .Y(n211) );
  INVX2 U223 ( .A(int_in[24]), .Y(n213) );
  AOI22X1 U224 ( .A(ext_in[24]), .B(n28), .C(data_out_right[24]), .D(n15), .Y(
        n212) );
  OAI21X1 U225 ( .A(n6), .B(n213), .C(n212), .Y(n285) );
  INVX2 U226 ( .A(int_in[25]), .Y(n215) );
  AOI22X1 U227 ( .A(ext_in[25]), .B(n28), .C(data_out_right[25]), .D(n15), .Y(
        n214) );
  OAI21X1 U228 ( .A(n7), .B(n215), .C(n214), .Y(n284) );
  INVX2 U229 ( .A(data_out_right[26]), .Y(n217) );
  NAND2X1 U230 ( .A(ext_in[26]), .B(n29), .Y(n216) );
  OAI21X1 U231 ( .A(n12), .B(n217), .C(n216), .Y(n218) );
  OAI22X1 U232 ( .A(int_in[26]), .B(n218), .C(n23), .D(n218), .Y(n219) );
  INVX2 U233 ( .A(data_out_right[27]), .Y(n221) );
  NAND2X1 U234 ( .A(ext_in[27]), .B(n29), .Y(n220) );
  OAI21X1 U235 ( .A(n12), .B(n221), .C(n220), .Y(n222) );
  OAI22X1 U236 ( .A(int_in[27]), .B(n222), .C(n23), .D(n222), .Y(n223) );
  INVX2 U237 ( .A(int_in[28]), .Y(n225) );
  AOI22X1 U238 ( .A(ext_in[28]), .B(n28), .C(data_out_right[28]), .D(n18), .Y(
        n224) );
  OAI21X1 U239 ( .A(n8), .B(n225), .C(n224), .Y(n283) );
  INVX2 U240 ( .A(data_out_right[29]), .Y(n227) );
  NAND2X1 U241 ( .A(ext_in[29]), .B(n29), .Y(n226) );
  OAI21X1 U242 ( .A(n12), .B(n227), .C(n226), .Y(n229) );
  OAI22X1 U243 ( .A(n24), .B(n229), .C(int_in[29]), .D(n229), .Y(n231) );
  INVX2 U244 ( .A(int_in[30]), .Y(n233) );
  AOI22X1 U245 ( .A(ext_in[30]), .B(n28), .C(data_out_right[30]), .D(n18), .Y(
        n232) );
  OAI21X1 U246 ( .A(n9), .B(n233), .C(n232), .Y(n282) );
  INVX2 U247 ( .A(int_in[31]), .Y(n235) );
  AOI22X1 U248 ( .A(ext_in[31]), .B(n28), .C(data_out_right[31]), .D(n17), .Y(
        n234) );
  OAI21X1 U249 ( .A(n10), .B(n235), .C(n234), .Y(n281) );
endmodule


module des_controller_0 ( clk, n_rst, data_ready, rw_mode, io_select, 
        next_data, round_number );
  output [1:0] io_select;
  output [4:0] round_number;
  input clk, n_rst, data_ready, rw_mode;
  output next_data;
  wire   n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113;
  wire   [4:0] state;
  wire   [4:0] nstate;

  DFFSR \state_reg[0]  ( .D(nstate[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[4]  ( .D(nstate[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[4]) );
  DFFSR \state_reg[1]  ( .D(nstate[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        n113) );
  DFFSR \state_reg[3]  ( .D(nstate[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[3]) );
  DFFSR \state_reg[2]  ( .D(nstate[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[2]) );
  INVX1 U8 ( .A(n13), .Y(n6) );
  BUFX4 U9 ( .A(state[4]), .Y(n9) );
  INVX2 U10 ( .A(state[3]), .Y(n101) );
  BUFX4 U11 ( .A(n26), .Y(n7) );
  INVX1 U12 ( .A(n104), .Y(n8) );
  INVX1 U13 ( .A(n101), .Y(n15) );
  INVX2 U14 ( .A(state[2]), .Y(n13) );
  INVX1 U15 ( .A(state[4]), .Y(n12) );
  BUFX2 U16 ( .A(state[0]), .Y(n27) );
  INVX1 U17 ( .A(n113), .Y(n10) );
  INVX2 U18 ( .A(n113), .Y(n23) );
  BUFX2 U19 ( .A(state[2]), .Y(n25) );
  AND2X2 U20 ( .A(n12), .B(state[0]), .Y(round_number[0]) );
  INVX2 U21 ( .A(state[0]), .Y(n14) );
  INVX1 U22 ( .A(n13), .Y(n11) );
  AND2X2 U23 ( .A(n25), .B(n10), .Y(n22) );
  INVX4 U24 ( .A(n15), .Y(n16) );
  INVX1 U25 ( .A(n6), .Y(n97) );
  INVX1 U26 ( .A(state[0]), .Y(n98) );
  BUFX2 U27 ( .A(n27), .Y(n17) );
  INVX2 U28 ( .A(n29), .Y(n28) );
  INVX2 U29 ( .A(rw_mode), .Y(n29) );
  AND2X2 U30 ( .A(n7), .B(n98), .Y(n18) );
  AND2X2 U31 ( .A(n32), .B(n31), .Y(n19) );
  AND2X2 U32 ( .A(n48), .B(n71), .Y(n20) );
  AND2X2 U33 ( .A(state[3]), .B(n12), .Y(round_number[3]) );
  INVX1 U34 ( .A(n12), .Y(n26) );
  INVX1 U35 ( .A(n23), .Y(n24) );
  INVX2 U36 ( .A(n26), .Y(n96) );
  NAND2X1 U37 ( .A(n16), .B(n96), .Y(n110) );
  NAND3X1 U38 ( .A(n10), .B(n97), .C(n27), .Y(n55) );
  NAND2X1 U39 ( .A(n24), .B(n97), .Y(n38) );
  NAND3X1 U40 ( .A(n16), .B(n96), .C(n98), .Y(n39) );
  NAND2X1 U41 ( .A(n25), .B(n24), .Y(n58) );
  NAND3X1 U42 ( .A(n27), .B(n10), .C(n25), .Y(n33) );
  OAI22X1 U43 ( .A(n39), .B(n58), .C(n110), .D(n33), .Y(n79) );
  NAND3X1 U44 ( .A(n98), .B(n96), .C(n15), .Y(n30) );
  INVX2 U45 ( .A(n30), .Y(n32) );
  INVX2 U46 ( .A(n38), .Y(n102) );
  INVX2 U47 ( .A(n58), .Y(n31) );
  AOI21X1 U48 ( .A(n32), .B(n102), .C(n19), .Y(n36) );
  INVX2 U49 ( .A(n33), .Y(n34) );
  INVX2 U50 ( .A(n55), .Y(n103) );
  NAND2X1 U51 ( .A(n15), .B(n96), .Y(n45) );
  INVX2 U52 ( .A(n45), .Y(n75) );
  OAI21X1 U53 ( .A(n34), .B(n103), .C(round_number[3]), .Y(n35) );
  NAND2X1 U54 ( .A(n36), .B(n35), .Y(n70) );
  NOR2X1 U55 ( .A(n79), .B(n70), .Y(n37) );
  OAI21X1 U56 ( .A(n38), .B(n8), .C(n37), .Y(n51) );
  NAND3X1 U57 ( .A(n24), .B(n97), .C(n17), .Y(n43) );
  INVX2 U58 ( .A(n39), .Y(n104) );
  NOR2X1 U59 ( .A(n27), .B(n16), .Y(n40) );
  NAND3X1 U60 ( .A(n40), .B(n11), .C(n80), .Y(n41) );
  INVX2 U61 ( .A(n41), .Y(n74) );
  AOI21X1 U62 ( .A(n22), .B(n104), .C(n74), .Y(n42) );
  OAI21X1 U63 ( .A(n7), .B(n43), .C(n42), .Y(n83) );
  INVX2 U64 ( .A(n83), .Y(n49) );
  NAND3X1 U65 ( .A(n97), .B(n98), .C(n10), .Y(n46) );
  NAND3X1 U66 ( .A(n96), .B(n17), .C(n16), .Y(n44) );
  OAI22X1 U67 ( .A(n46), .B(n45), .C(n58), .D(n44), .Y(n73) );
  INVX2 U68 ( .A(n73), .Y(n48) );
  NOR2X1 U69 ( .A(n10), .B(n98), .Y(n47) );
  NAND3X1 U70 ( .A(n47), .B(n11), .C(n75), .Y(n71) );
  NAND2X1 U71 ( .A(n49), .B(n20), .Y(n50) );
  MUX2X1 U72 ( .B(n51), .A(n50), .S(n28), .Y(n53) );
  NOR2X1 U73 ( .A(n25), .B(n15), .Y(n52) );
  NAND3X1 U74 ( .A(n18), .B(n10), .C(n52), .Y(n111) );
  AND2X2 U75 ( .A(n53), .B(n111), .Y(n54) );
  OAI21X1 U76 ( .A(n110), .B(n55), .C(n54), .Y(nstate[1]) );
  INVX2 U77 ( .A(data_ready), .Y(n56) );
  NOR2X1 U78 ( .A(n7), .B(n56), .Y(n57) );
  MUX2X1 U79 ( .B(n57), .A(n28), .S(n17), .Y(n69) );
  OAI21X1 U80 ( .A(n102), .B(n22), .C(n15), .Y(n59) );
  NAND2X1 U81 ( .A(n59), .B(n58), .Y(n61) );
  INVX2 U82 ( .A(n61), .Y(n90) );
  XOR2X1 U83 ( .A(n16), .B(n24), .Y(n60) );
  XOR2X1 U84 ( .A(n60), .B(n11), .Y(n63) );
  NAND2X1 U85 ( .A(n90), .B(n63), .Y(n87) );
  INVX2 U86 ( .A(n63), .Y(n88) );
  NAND2X1 U87 ( .A(n88), .B(n96), .Y(n66) );
  NAND2X1 U88 ( .A(n17), .B(n61), .Y(n65) );
  NAND3X1 U89 ( .A(n98), .B(n97), .C(n7), .Y(n62) );
  NOR2X1 U90 ( .A(n15), .B(n62), .Y(n64) );
  NAND2X1 U91 ( .A(n64), .B(n63), .Y(n95) );
  OAI21X1 U92 ( .A(n66), .B(n65), .C(n95), .Y(n67) );
  NAND2X1 U93 ( .A(n67), .B(n29), .Y(n68) );
  OAI21X1 U94 ( .A(n69), .B(n87), .C(n68), .Y(nstate[4]) );
  INVX2 U95 ( .A(n70), .Y(n78) );
  NAND2X1 U96 ( .A(n71), .B(n111), .Y(n72) );
  MUX2X1 U97 ( .B(n73), .A(n72), .S(n28), .Y(n77) );
  AOI21X1 U98 ( .A(n75), .B(n102), .C(n74), .Y(n76) );
  NAND3X1 U99 ( .A(n78), .B(n77), .C(n76), .Y(nstate[3]) );
  INVX2 U100 ( .A(n79), .Y(n86) );
  NOR2X1 U101 ( .A(n98), .B(n97), .Y(n81) );
  NOR2X1 U102 ( .A(n24), .B(n7), .Y(n80) );
  AOI21X1 U103 ( .A(n81), .B(n80), .C(n19), .Y(n85) );
  NAND2X1 U104 ( .A(n20), .B(n111), .Y(n82) );
  MUX2X1 U105 ( .B(n83), .A(n82), .S(n28), .Y(n84) );
  NAND3X1 U106 ( .A(n86), .B(n85), .C(n84), .Y(nstate[2]) );
  OAI21X1 U107 ( .A(data_ready), .B(n87), .C(n96), .Y(n92) );
  NOR2X1 U108 ( .A(n28), .B(n88), .Y(n89) );
  NAND3X1 U109 ( .A(n90), .B(n7), .C(n89), .Y(n91) );
  MUX2X1 U110 ( .B(n92), .A(n91), .S(n17), .Y(n93) );
  INVX2 U111 ( .A(n93), .Y(n94) );
  OAI21X1 U112 ( .A(n95), .B(n29), .C(n94), .Y(nstate[0]) );
  NOR2X1 U113 ( .A(n9), .B(n23), .Y(round_number[1]) );
  NOR2X1 U114 ( .A(n9), .B(n13), .Y(round_number[2]) );
  NAND2X1 U115 ( .A(n13), .B(n14), .Y(n100) );
  NAND3X1 U116 ( .A(n101), .B(n23), .C(n9), .Y(n99) );
  NOR2X1 U117 ( .A(n100), .B(n99), .Y(round_number[4]) );
  NAND3X1 U118 ( .A(n102), .B(n18), .C(n16), .Y(n105) );
  INVX2 U119 ( .A(n105), .Y(next_data) );
  NAND2X1 U120 ( .A(n103), .B(n7), .Y(n108) );
  NAND2X1 U121 ( .A(n104), .B(n23), .Y(n106) );
  OAI21X1 U122 ( .A(n25), .B(n106), .C(n105), .Y(n109) );
  INVX2 U123 ( .A(n109), .Y(n107) );
  OAI21X1 U124 ( .A(n15), .B(n108), .C(n107), .Y(io_select[0]) );
  NOR2X1 U125 ( .A(n75), .B(n109), .Y(n112) );
  NAND3X1 U126 ( .A(n112), .B(n111), .C(n110), .Y(io_select[1]) );
endmodule


module expansion_0 ( data_in, data_out );
  input [31:0] data_in;
  output [47:0] data_out;
  wire   \data_in[0] , \data_in[31] , \data_in[30] , \data_in[29] ,
         \data_in[28] , \data_in[27] , \data_in[26] , \data_in[25] ,
         \data_in[24] , \data_in[23] , \data_in[22] , \data_in[21] ,
         \data_in[20] , \data_in[19] , \data_in[18] , \data_in[17] ,
         \data_in[16] , \data_in[15] , \data_in[14] , \data_in[13] ,
         \data_in[12] , \data_in[11] , \data_in[10] , \data_in[9] ,
         \data_in[8] , \data_in[7] , \data_in[6] , \data_in[5] , \data_in[4] ,
         \data_in[3] , \data_in[2] , \data_in[1] ;
  assign data_out[1] = \data_in[0] ;
  assign data_out[47] = \data_in[0] ;
  assign \data_in[0]  = data_in[0];
  assign data_out[0] = \data_in[31] ;
  assign data_out[46] = \data_in[31] ;
  assign \data_in[31]  = data_in[31];
  assign data_out[45] = \data_in[30] ;
  assign \data_in[30]  = data_in[30];
  assign data_out[44] = \data_in[29] ;
  assign \data_in[29]  = data_in[29];
  assign data_out[41] = \data_in[28] ;
  assign data_out[43] = \data_in[28] ;
  assign \data_in[28]  = data_in[28];
  assign data_out[40] = \data_in[27] ;
  assign data_out[42] = \data_in[27] ;
  assign \data_in[27]  = data_in[27];
  assign data_out[39] = \data_in[26] ;
  assign \data_in[26]  = data_in[26];
  assign data_out[38] = \data_in[25] ;
  assign \data_in[25]  = data_in[25];
  assign data_out[35] = \data_in[24] ;
  assign data_out[37] = \data_in[24] ;
  assign \data_in[24]  = data_in[24];
  assign data_out[34] = \data_in[23] ;
  assign data_out[36] = \data_in[23] ;
  assign \data_in[23]  = data_in[23];
  assign data_out[33] = \data_in[22] ;
  assign \data_in[22]  = data_in[22];
  assign data_out[32] = \data_in[21] ;
  assign \data_in[21]  = data_in[21];
  assign data_out[29] = \data_in[20] ;
  assign data_out[31] = \data_in[20] ;
  assign \data_in[20]  = data_in[20];
  assign data_out[28] = \data_in[19] ;
  assign data_out[30] = \data_in[19] ;
  assign \data_in[19]  = data_in[19];
  assign data_out[27] = \data_in[18] ;
  assign \data_in[18]  = data_in[18];
  assign data_out[26] = \data_in[17] ;
  assign \data_in[17]  = data_in[17];
  assign data_out[23] = \data_in[16] ;
  assign data_out[25] = \data_in[16] ;
  assign \data_in[16]  = data_in[16];
  assign data_out[22] = \data_in[15] ;
  assign data_out[24] = \data_in[15] ;
  assign \data_in[15]  = data_in[15];
  assign data_out[21] = \data_in[14] ;
  assign \data_in[14]  = data_in[14];
  assign data_out[20] = \data_in[13] ;
  assign \data_in[13]  = data_in[13];
  assign data_out[17] = \data_in[12] ;
  assign data_out[19] = \data_in[12] ;
  assign \data_in[12]  = data_in[12];
  assign data_out[16] = \data_in[11] ;
  assign data_out[18] = \data_in[11] ;
  assign \data_in[11]  = data_in[11];
  assign data_out[15] = \data_in[10] ;
  assign \data_in[10]  = data_in[10];
  assign data_out[14] = \data_in[9] ;
  assign \data_in[9]  = data_in[9];
  assign data_out[11] = \data_in[8] ;
  assign data_out[13] = \data_in[8] ;
  assign \data_in[8]  = data_in[8];
  assign data_out[10] = \data_in[7] ;
  assign data_out[12] = \data_in[7] ;
  assign \data_in[7]  = data_in[7];
  assign data_out[9] = \data_in[6] ;
  assign \data_in[6]  = data_in[6];
  assign data_out[8] = \data_in[5] ;
  assign \data_in[5]  = data_in[5];
  assign data_out[5] = \data_in[4] ;
  assign data_out[7] = \data_in[4] ;
  assign \data_in[4]  = data_in[4];
  assign data_out[4] = \data_in[3] ;
  assign data_out[6] = \data_in[3] ;
  assign \data_in[3]  = data_in[3];
  assign data_out[3] = \data_in[2] ;
  assign \data_in[2]  = data_in[2];
  assign data_out[2] = \data_in[1] ;
  assign \data_in[1]  = data_in[1];

endmodule


module key_permutation1_0 ( k_o, kout );
  input [63:0] k_o;
  output [55:0] kout;
  wire   \k_o[3] , \k_o[11] , \k_o[19] , \k_o[27] , \k_o[4] , \k_o[12] ,
         \k_o[20] , \k_o[28] , \k_o[36] , \k_o[44] , \k_o[52] , \k_o[60] ,
         \k_o[5] , \k_o[13] , \k_o[21] , \k_o[29] , \k_o[37] , \k_o[45] ,
         \k_o[53] , \k_o[61] , \k_o[6] , \k_o[14] , \k_o[22] , \k_o[30] ,
         \k_o[38] , \k_o[46] , \k_o[54] , \k_o[62] , \k_o[35] , \k_o[43] ,
         \k_o[51] , \k_o[59] , \k_o[2] , \k_o[10] , \k_o[18] , \k_o[26] ,
         \k_o[34] , \k_o[42] , \k_o[50] , \k_o[58] , \k_o[1] , \k_o[9] ,
         \k_o[17] , \k_o[25] , \k_o[33] , \k_o[41] , \k_o[49] , \k_o[57] ,
         \k_o[0] , \k_o[8] , \k_o[16] , \k_o[24] , \k_o[32] , \k_o[40] ,
         \k_o[48] , \k_o[56] ;
  assign kout[55] = \k_o[3] ;
  assign \k_o[3]  = k_o[3];
  assign kout[54] = \k_o[11] ;
  assign \k_o[11]  = k_o[11];
  assign kout[53] = \k_o[19] ;
  assign \k_o[19]  = k_o[19];
  assign kout[52] = \k_o[27] ;
  assign \k_o[27]  = k_o[27];
  assign kout[51] = \k_o[4] ;
  assign \k_o[4]  = k_o[4];
  assign kout[50] = \k_o[12] ;
  assign \k_o[12]  = k_o[12];
  assign kout[49] = \k_o[20] ;
  assign \k_o[20]  = k_o[20];
  assign kout[48] = \k_o[28] ;
  assign \k_o[28]  = k_o[28];
  assign kout[47] = \k_o[36] ;
  assign \k_o[36]  = k_o[36];
  assign kout[46] = \k_o[44] ;
  assign \k_o[44]  = k_o[44];
  assign kout[45] = \k_o[52] ;
  assign \k_o[52]  = k_o[52];
  assign kout[44] = \k_o[60] ;
  assign \k_o[60]  = k_o[60];
  assign kout[43] = \k_o[5] ;
  assign \k_o[5]  = k_o[5];
  assign kout[42] = \k_o[13] ;
  assign \k_o[13]  = k_o[13];
  assign kout[41] = \k_o[21] ;
  assign \k_o[21]  = k_o[21];
  assign kout[40] = \k_o[29] ;
  assign \k_o[29]  = k_o[29];
  assign kout[39] = \k_o[37] ;
  assign \k_o[37]  = k_o[37];
  assign kout[38] = \k_o[45] ;
  assign \k_o[45]  = k_o[45];
  assign kout[37] = \k_o[53] ;
  assign \k_o[53]  = k_o[53];
  assign kout[36] = \k_o[61] ;
  assign \k_o[61]  = k_o[61];
  assign kout[35] = \k_o[6] ;
  assign \k_o[6]  = k_o[6];
  assign kout[34] = \k_o[14] ;
  assign \k_o[14]  = k_o[14];
  assign kout[33] = \k_o[22] ;
  assign \k_o[22]  = k_o[22];
  assign kout[32] = \k_o[30] ;
  assign \k_o[30]  = k_o[30];
  assign kout[31] = \k_o[38] ;
  assign \k_o[38]  = k_o[38];
  assign kout[30] = \k_o[46] ;
  assign \k_o[46]  = k_o[46];
  assign kout[29] = \k_o[54] ;
  assign \k_o[54]  = k_o[54];
  assign kout[28] = \k_o[62] ;
  assign \k_o[62]  = k_o[62];
  assign kout[27] = \k_o[35] ;
  assign \k_o[35]  = k_o[35];
  assign kout[26] = \k_o[43] ;
  assign \k_o[43]  = k_o[43];
  assign kout[25] = \k_o[51] ;
  assign \k_o[51]  = k_o[51];
  assign kout[24] = \k_o[59] ;
  assign \k_o[59]  = k_o[59];
  assign kout[23] = \k_o[2] ;
  assign \k_o[2]  = k_o[2];
  assign kout[22] = \k_o[10] ;
  assign \k_o[10]  = k_o[10];
  assign kout[21] = \k_o[18] ;
  assign \k_o[18]  = k_o[18];
  assign kout[20] = \k_o[26] ;
  assign \k_o[26]  = k_o[26];
  assign kout[19] = \k_o[34] ;
  assign \k_o[34]  = k_o[34];
  assign kout[18] = \k_o[42] ;
  assign \k_o[42]  = k_o[42];
  assign kout[17] = \k_o[50] ;
  assign \k_o[50]  = k_o[50];
  assign kout[16] = \k_o[58] ;
  assign \k_o[58]  = k_o[58];
  assign kout[15] = \k_o[1] ;
  assign \k_o[1]  = k_o[1];
  assign kout[14] = \k_o[9] ;
  assign \k_o[9]  = k_o[9];
  assign kout[13] = \k_o[17] ;
  assign \k_o[17]  = k_o[17];
  assign kout[12] = \k_o[25] ;
  assign \k_o[25]  = k_o[25];
  assign kout[11] = \k_o[33] ;
  assign \k_o[33]  = k_o[33];
  assign kout[10] = \k_o[41] ;
  assign \k_o[41]  = k_o[41];
  assign kout[9] = \k_o[49] ;
  assign \k_o[49]  = k_o[49];
  assign kout[8] = \k_o[57] ;
  assign \k_o[57]  = k_o[57];
  assign kout[7] = \k_o[0] ;
  assign \k_o[0]  = k_o[0];
  assign kout[6] = \k_o[8] ;
  assign \k_o[8]  = k_o[8];
  assign kout[5] = \k_o[16] ;
  assign \k_o[16]  = k_o[16];
  assign kout[4] = \k_o[24] ;
  assign \k_o[24]  = k_o[24];
  assign kout[3] = \k_o[32] ;
  assign \k_o[32]  = k_o[32];
  assign kout[2] = \k_o[40] ;
  assign \k_o[40]  = k_o[40];
  assign kout[1] = \k_o[48] ;
  assign \k_o[48]  = k_o[48];
  assign kout[0] = \k_o[56] ;
  assign \k_o[56]  = k_o[56];

endmodule


module key_shift_0 ( kin, k_out, roundSel );
  input [55:0] kin;
  output [55:0] k_out;
  input [4:0] roundSel;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, n301,
         n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312,
         n313, n314, n315, n316, n317, n318, n319, n320, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, n426,
         n427, n428, n431, n432, n433, n434, n435, n436, n437, n438, n439,
         n440, n441, n442, n443, n444, n445, n446, n447, n448, n449, n450,
         n451, n452, n453, n454, n455, n456, n457, n458, n459, n460, n461,
         n462, n463, n464, n465, n466, n467, n468, n469, n470, n471, n472,
         n473, n474, n475, n476, n477, n478, n479, n480, n481, n482, n483,
         n484, n485, n486, n487, n488, n489, n490, n491, n492, n493, n494,
         n495, n496, n497, n498, n499, n500, n501, n502, n503, n504, n505,
         n506, n507, n508, n509, n510, n511, n512, n513, n514, n515, n516,
         n517, n518, n519, n520, n521, n522, n523, n524, n525, n526, n527,
         n528, n529, n530, n531, n532, n533, n534, n535, n536, n537, n538,
         n539, n540, n541, n542, n543, n544, n545, n546, n547, n548, n549,
         n550, n551, n552, n553, n554, n555, n556, n557, n558, n559, n560,
         n563, n564, n565, n566, n567, n568, n569, n570, n571, n572, n573,
         n574, n575, n576, n577, n578, n579, n580, n581, n582, n583, n584,
         n585, n586, n587, n588, n589, n590, n591, n592, n593, n594, n595,
         n596, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633, n634, n635, n636, n637, n638, n639, n640, n641,
         n642, n643, n644, n645, n646, n647, n648, n649, n650, n651, n652,
         n653, n654, n655, n656, n659, n660, n661, n662, n663, n664, n665,
         n666, n667, n668, n669, n670, n671, n672, n673, n674, n675, n676,
         n677, n678, n679, n680, n681, n682, n683, n684, n685, n686, n687,
         n688, n689, n690, n691, n692, n693, n694, n695, n696, n697, n698,
         n699, n700, n701, n702, n703, n704, n705, n706, n707, n708, n709,
         n710, n711, n712, n713, n714, n715, n716, n717, n718, n719, n720,
         n721, n722, n723, n724, n725, n726, n727, n728, n729, n730, n731,
         n732, n733, n734, n735, n736, n737, n738, n739, n740, n741, n742,
         n743, n744, n745, n746, n747, n748, n749, n750, n751, n752, n753,
         n754, n755, n756, n757, n758, n759, n760, n761, n762, n763, n764,
         n765, n766, n767, n768, n769, n770, n771, n772, n773, n774, n775,
         n776, n777, n778, n779, n780, n781, n782, n783, n784, n785, n786,
         n787, n788, n789, n790, n791, n792, n793, n794, n795, n796, n797,
         n798, n799, n800, n801, n802, n803, n804, n805, n806, n807, n808,
         n809, n810, n811, n812, n813, n814, n815, n816, n817, n818, n819,
         n820, n821, n822, n823, n824, n825, n826, n827, n828, n829, n830,
         n831, n832, n833, n834, n835, n836, n837, n838, n839, n840, n841,
         n842, n843, n844, n845, n846, n847, n848, n849, n850, n851, n852,
         n853, n854, n855, n856, n857, n858, n859, n860, n861, n862, n863,
         n864, n865, n866, n867, n868, n869, n870, n871, n872, n873, n874,
         n875, n876, n877, n878, n879, n880, n881, n882, n883, n884, n885,
         n886, n887, n888, n889, n890, n891, n892, n893, n894, n895, n896,
         n897, n898, n899, n900, n901, n902, n903, n904, n905, n906, n907,
         n908, n909, n910, n911, n912, n913, n914, n915, n916, n917, n918,
         n919, n920, n921, n922, n923, n924, n925, n926, n927, n928, n929,
         n930, n931, n932, n933, n934, n935, n936, n937, n938, n939, n940,
         n941, n942, n943, n944, n945, n946, n947, n948, n949, n950, n951,
         n952, n953, n954, n955, n956, n957, n958, n959, n960, n961, n962,
         n963, n964;

  OR2X2 U2 ( .A(n964), .B(n963), .Y(k_out[8]) );
  OR2X2 U8 ( .A(n962), .B(n961), .Y(k_out[53]) );
  OR2X2 U20 ( .A(n960), .B(n959), .Y(k_out[42]) );
  OR2X2 U26 ( .A(n958), .B(n957), .Y(k_out[37]) );
  OR2X2 U29 ( .A(n956), .B(n955), .Y(k_out[34]) );
  OR2X2 U40 ( .A(n954), .B(n953), .Y(k_out[24]) );
  OR2X2 U43 ( .A(n952), .B(n951), .Y(k_out[21]) );
  OR2X2 U48 ( .A(n950), .B(n949), .Y(k_out[17]) );
  NAND2X1 U1 ( .A(n105), .B(n106), .Y(n1) );
  NAND2X1 U3 ( .A(n63), .B(n2), .Y(n197) );
  INVX2 U4 ( .A(n1), .Y(n2) );
  INVX4 U5 ( .A(n171), .Y(n25) );
  INVX8 U6 ( .A(n186), .Y(n8) );
  INVX4 U7 ( .A(n70), .Y(n3) );
  INVX4 U9 ( .A(n70), .Y(n169) );
  AND2X2 U10 ( .A(n113), .B(kin[34]), .Y(n94) );
  BUFX4 U11 ( .A(n110), .Y(n172) );
  INVX8 U12 ( .A(n172), .Y(n170) );
  INVX1 U13 ( .A(n198), .Y(n4) );
  BUFX2 U14 ( .A(n144), .Y(n76) );
  OR2X1 U15 ( .A(n170), .B(n933), .Y(n85) );
  OR2X2 U16 ( .A(n929), .B(n182), .Y(n92) );
  INVX4 U17 ( .A(n181), .Y(n173) );
  INVX4 U18 ( .A(n185), .Y(n77) );
  INVX1 U19 ( .A(n61), .Y(n5) );
  BUFX2 U21 ( .A(n148), .Y(n6) );
  INVX1 U22 ( .A(n37), .Y(n7) );
  INVX2 U23 ( .A(n8), .Y(n37) );
  INVX4 U24 ( .A(n193), .Y(n190) );
  INVX2 U25 ( .A(n174), .Y(n61) );
  INVX4 U27 ( .A(n185), .Y(n9) );
  INVX2 U28 ( .A(n187), .Y(n182) );
  INVX4 U30 ( .A(n181), .Y(n10) );
  INVX4 U31 ( .A(n181), .Y(n11) );
  INVX8 U32 ( .A(n104), .Y(n149) );
  INVX8 U33 ( .A(n30), .Y(n32) );
  AND2X1 U34 ( .A(n400), .B(n399), .Y(n12) );
  AND2X1 U35 ( .A(n580), .B(n581), .Y(n13) );
  BUFX2 U36 ( .A(n69), .Y(n136) );
  INVX2 U37 ( .A(kin[26]), .Y(n829) );
  INVX2 U38 ( .A(kin[24]), .Y(n847) );
  INVX2 U39 ( .A(kin[39]), .Y(n862) );
  INVX2 U41 ( .A(kin[37]), .Y(n875) );
  INVX2 U42 ( .A(roundSel[0]), .Y(n49) );
  AND2X1 U44 ( .A(n792), .B(n793), .Y(n14) );
  AND2X1 U45 ( .A(n59), .B(n33), .Y(n15) );
  AND2X1 U46 ( .A(n311), .B(n310), .Y(n16) );
  INVX2 U47 ( .A(roundSel[1]), .Y(n50) );
  AND2X1 U49 ( .A(n464), .B(n465), .Y(n17) );
  AND2X1 U50 ( .A(n717), .B(n718), .Y(n18) );
  AND2X1 U51 ( .A(n779), .B(n778), .Y(n19) );
  AND2X1 U52 ( .A(n350), .B(n349), .Y(n20) );
  INVX1 U53 ( .A(n3), .Y(n53) );
  INVX1 U54 ( .A(n71), .Y(n72) );
  AND2X1 U55 ( .A(n299), .B(n298), .Y(n21) );
  INVX4 U56 ( .A(n195), .Y(n22) );
  INVX4 U57 ( .A(n193), .Y(n189) );
  AND2X1 U58 ( .A(n179), .B(kin[13]), .Y(n95) );
  INVX2 U59 ( .A(n194), .Y(n192) );
  AND2X2 U60 ( .A(n212), .B(n101), .Y(n23) );
  INVX2 U61 ( .A(n54), .Y(n55) );
  INVX1 U62 ( .A(n171), .Y(n24) );
  INVX2 U63 ( .A(n171), .Y(n168) );
  NAND2X1 U64 ( .A(n398), .B(n12), .Y(n408) );
  INVX4 U65 ( .A(n74), .Y(n26) );
  INVX8 U66 ( .A(n26), .Y(n27) );
  INVX1 U67 ( .A(n564), .Y(n74) );
  INVX2 U68 ( .A(n195), .Y(n28) );
  BUFX4 U69 ( .A(n925), .Y(n29) );
  BUFX2 U70 ( .A(n928), .Y(n140) );
  INVX4 U71 ( .A(n140), .Y(n30) );
  INVX1 U72 ( .A(n30), .Y(n31) );
  INVX8 U73 ( .A(n187), .Y(n184) );
  AND2X2 U74 ( .A(n181), .B(kin[33]), .Y(n93) );
  BUFX2 U75 ( .A(roundSel[1]), .Y(n33) );
  INVX4 U76 ( .A(roundSel[3]), .Y(n209) );
  INVX1 U77 ( .A(n61), .Y(n34) );
  INVX1 U78 ( .A(n51), .Y(n52) );
  INVX4 U79 ( .A(n65), .Y(n35) );
  INVX8 U80 ( .A(n35), .Y(n36) );
  INVX1 U81 ( .A(n565), .Y(n65) );
  INVX1 U82 ( .A(n197), .Y(n38) );
  INVX2 U83 ( .A(n197), .Y(n924) );
  INVX1 U84 ( .A(n50), .Y(n42) );
  OAI21X1 U85 ( .A(n42), .B(n211), .C(n52), .Y(n39) );
  INVX2 U86 ( .A(roundSel[4]), .Y(n68) );
  AND2X1 U87 ( .A(n503), .B(n502), .Y(n40) );
  NAND2X1 U88 ( .A(n20), .B(n348), .Y(n357) );
  INVX1 U89 ( .A(roundSel[3]), .Y(n41) );
  INVX2 U90 ( .A(n564), .Y(n925) );
  INVX2 U91 ( .A(n682), .Y(n43) );
  INVX8 U92 ( .A(n114), .Y(n682) );
  AND2X1 U93 ( .A(n741), .B(n742), .Y(n44) );
  INVX1 U94 ( .A(n209), .Y(n45) );
  NAND2X1 U95 ( .A(n549), .B(n46), .Y(k_out[31]) );
  NOR2X1 U96 ( .A(n82), .B(n557), .Y(n46) );
  OR2X2 U97 ( .A(n883), .B(n117), .Y(n47) );
  OR2X1 U98 ( .A(n146), .B(n869), .Y(n48) );
  NAND2X1 U99 ( .A(n47), .B(n48), .Y(n547) );
  BUFX4 U100 ( .A(n925), .Y(n127) );
  NAND2X1 U101 ( .A(n740), .B(n44), .Y(n749) );
  NAND2X1 U102 ( .A(n716), .B(n18), .Y(n725) );
  BUFX4 U103 ( .A(n102), .Y(n187) );
  AND2X2 U104 ( .A(n209), .B(roundSel[0]), .Y(n109) );
  OR2X2 U105 ( .A(n182), .B(n829), .Y(n98) );
  AND2X2 U106 ( .A(n113), .B(kin[14]), .Y(n96) );
  BUFX2 U107 ( .A(roundSel[4]), .Y(n51) );
  INVX2 U108 ( .A(n198), .Y(n212) );
  INVX1 U109 ( .A(n86), .Y(n87) );
  INVX8 U110 ( .A(n113), .Y(n114) );
  INVX4 U111 ( .A(n794), .Y(n113) );
  NAND2X1 U112 ( .A(n693), .B(n694), .Y(n54) );
  NAND2X1 U113 ( .A(n692), .B(n55), .Y(n701) );
  BUFX4 U114 ( .A(n939), .Y(n56) );
  BUFX4 U115 ( .A(n939), .Y(n57) );
  INVX4 U116 ( .A(n205), .Y(n939) );
  INVX1 U117 ( .A(n188), .Y(n58) );
  OR2X1 U118 ( .A(n188), .B(n875), .Y(n89) );
  BUFX2 U119 ( .A(roundSel[2]), .Y(n59) );
  BUFX4 U120 ( .A(n23), .Y(n193) );
  INVX1 U121 ( .A(n37), .Y(n60) );
  NAND2X1 U122 ( .A(kin[7]), .B(n179), .Y(n84) );
  INVX1 U123 ( .A(n196), .Y(n62) );
  INVX1 U124 ( .A(n196), .Y(n213) );
  INVX1 U125 ( .A(n51), .Y(n63) );
  INVX4 U126 ( .A(n180), .Y(n176) );
  NAND2X1 U127 ( .A(n21), .B(n297), .Y(n306) );
  NAND2X1 U128 ( .A(n791), .B(n14), .Y(n803) );
  BUFX4 U129 ( .A(n107), .Y(n181) );
  BUFX4 U130 ( .A(n88), .Y(n64) );
  INVX1 U131 ( .A(n128), .Y(n66) );
  NAND2X1 U132 ( .A(n579), .B(n13), .Y(n588) );
  AND2X2 U133 ( .A(n4), .B(n101), .Y(n67) );
  BUFX4 U134 ( .A(n107), .Y(n180) );
  BUFX4 U135 ( .A(n107), .Y(n179) );
  AND2X2 U136 ( .A(n108), .B(n212), .Y(n69) );
  INVX1 U137 ( .A(n132), .Y(n566) );
  BUFX4 U138 ( .A(n110), .Y(n70) );
  NAND2X1 U139 ( .A(n463), .B(n17), .Y(n472) );
  NAND2X1 U140 ( .A(n753), .B(n754), .Y(n71) );
  NAND2X1 U141 ( .A(n72), .B(n752), .Y(n762) );
  BUFX4 U142 ( .A(n23), .Y(n194) );
  INVX1 U143 ( .A(n196), .Y(n73) );
  INVX1 U144 ( .A(n127), .Y(n75) );
  AND2X2 U145 ( .A(n210), .B(n50), .Y(n105) );
  INVX4 U146 ( .A(n113), .Y(n115) );
  BUFX4 U147 ( .A(n23), .Y(n195) );
  BUFX4 U148 ( .A(n102), .Y(n185) );
  BUFX4 U149 ( .A(n102), .Y(n186) );
  OR2X2 U150 ( .A(n847), .B(n188), .Y(n97) );
  INVX8 U151 ( .A(n67), .Y(n188) );
  BUFX4 U152 ( .A(n103), .Y(n151) );
  BUFX4 U153 ( .A(n103), .Y(n152) );
  BUFX4 U154 ( .A(n103), .Y(n150) );
  AND2X2 U155 ( .A(n4), .B(n109), .Y(n103) );
  NAND2X1 U156 ( .A(n501), .B(n40), .Y(n510) );
  AND2X2 U157 ( .A(n15), .B(n68), .Y(n206) );
  INVX1 U158 ( .A(n76), .Y(n80) );
  BUFX4 U159 ( .A(n88), .Y(n158) );
  BUFX4 U160 ( .A(n103), .Y(n153) );
  NAND2X1 U161 ( .A(n669), .B(n668), .Y(n78) );
  NAND2X1 U162 ( .A(n667), .B(n79), .Y(n676) );
  INVX2 U163 ( .A(n78), .Y(n79) );
  NAND2X1 U164 ( .A(n777), .B(n19), .Y(n787) );
  INVX4 U165 ( .A(n804), .Y(n118) );
  INVX8 U166 ( .A(n118), .Y(n117) );
  INVX8 U167 ( .A(n179), .Y(n174) );
  INVX1 U168 ( .A(n80), .Y(n81) );
  NAND2X1 U169 ( .A(n551), .B(n550), .Y(n82) );
  NAND2X1 U170 ( .A(n16), .B(n309), .Y(n318) );
  INVX8 U171 ( .A(n194), .Y(n191) );
  NAND2X1 U172 ( .A(n206), .B(n101), .Y(n83) );
  INVX2 U173 ( .A(n83), .Y(n88) );
  NAND2X1 U174 ( .A(n84), .B(n85), .Y(n313) );
  NAND2X1 U175 ( .A(n386), .B(n385), .Y(n86) );
  NAND2X1 U176 ( .A(n87), .B(n384), .Y(n395) );
  INVX4 U177 ( .A(n118), .Y(n116) );
  AND2X2 U178 ( .A(n109), .B(n73), .Y(n102) );
  INVX1 U179 ( .A(n64), .Y(n558) );
  BUFX4 U180 ( .A(n110), .Y(n171) );
  AND2X2 U181 ( .A(n39), .B(n227), .Y(n110) );
  INVX8 U182 ( .A(n180), .Y(n175) );
  OR2X1 U183 ( .A(n9), .B(n862), .Y(n90) );
  NAND2X1 U184 ( .A(n89), .B(n90), .Y(n670) );
  INVX8 U185 ( .A(n186), .Y(n183) );
  OR2X1 U186 ( .A(n188), .B(n931), .Y(n91) );
  NAND2X1 U187 ( .A(n91), .B(n92), .Y(n387) );
  OR2X1 U188 ( .A(n93), .B(n94), .Y(n595) );
  OR2X1 U189 ( .A(n95), .B(n96), .Y(n388) );
  NAND2X1 U190 ( .A(n97), .B(n98), .Y(n240) );
  INVX4 U191 ( .A(n111), .Y(n112) );
  BUFX2 U192 ( .A(n930), .Y(n144) );
  BUFX2 U193 ( .A(n38), .Y(n123) );
  BUFX2 U194 ( .A(n103), .Y(n154) );
  BUFX2 U195 ( .A(n939), .Y(n167) );
  AND2X2 U196 ( .A(n209), .B(n49), .Y(n101) );
  AND2X2 U197 ( .A(n221), .B(n105), .Y(n104) );
  AND2X2 U198 ( .A(roundSel[3]), .B(roundSel[0]), .Y(n106) );
  AND2X2 U199 ( .A(n101), .B(n62), .Y(n107) );
  AND2X2 U200 ( .A(n45), .B(n49), .Y(n108) );
  INVX2 U201 ( .A(kin[41]), .Y(n897) );
  INVX2 U202 ( .A(kin[44]), .Y(n755) );
  INVX2 U203 ( .A(kin[50]), .Y(n795) );
  INVX2 U204 ( .A(kin[52]), .Y(n915) );
  INVX2 U205 ( .A(kin[27]), .Y(n845) );
  INVX2 U206 ( .A(kin[15]), .Y(n838) );
  INVX2 U207 ( .A(kin[2]), .Y(n943) );
  INVX2 U208 ( .A(kin[6]), .Y(n941) );
  INVX2 U209 ( .A(kin[22]), .Y(n854) );
  BUFX2 U210 ( .A(n111), .Y(n162) );
  AND2X2 U211 ( .A(n109), .B(n206), .Y(n111) );
  BUFX4 U212 ( .A(n38), .Y(n119) );
  BUFX4 U213 ( .A(n924), .Y(n120) );
  BUFX4 U214 ( .A(n924), .Y(n121) );
  BUFX4 U215 ( .A(n924), .Y(n122) );
  BUFX4 U216 ( .A(n925), .Y(n124) );
  BUFX4 U217 ( .A(n925), .Y(n125) );
  BUFX4 U218 ( .A(n925), .Y(n126) );
  BUFX4 U219 ( .A(n926), .Y(n128) );
  BUFX4 U220 ( .A(n926), .Y(n129) );
  BUFX4 U221 ( .A(n926), .Y(n130) );
  BUFX4 U222 ( .A(n926), .Y(n131) );
  BUFX4 U223 ( .A(n69), .Y(n132) );
  BUFX4 U224 ( .A(n69), .Y(n133) );
  BUFX4 U225 ( .A(n69), .Y(n134) );
  BUFX4 U226 ( .A(n69), .Y(n135) );
  BUFX4 U227 ( .A(n928), .Y(n137) );
  BUFX4 U228 ( .A(n928), .Y(n138) );
  BUFX4 U229 ( .A(n928), .Y(n139) );
  BUFX4 U230 ( .A(n930), .Y(n141) );
  BUFX4 U231 ( .A(n930), .Y(n142) );
  BUFX4 U232 ( .A(n930), .Y(n143) );
  BUFX4 U233 ( .A(n932), .Y(n145) );
  BUFX4 U234 ( .A(n932), .Y(n146) );
  BUFX4 U235 ( .A(n932), .Y(n147) );
  BUFX4 U236 ( .A(n932), .Y(n148) );
  BUFX4 U237 ( .A(n88), .Y(n155) );
  BUFX4 U238 ( .A(n88), .Y(n156) );
  BUFX4 U239 ( .A(n88), .Y(n157) );
  BUFX4 U240 ( .A(n111), .Y(n159) );
  BUFX4 U241 ( .A(n111), .Y(n160) );
  BUFX4 U242 ( .A(n111), .Y(n161) );
  BUFX4 U243 ( .A(n939), .Y(n163) );
  BUFX4 U244 ( .A(n939), .Y(n164) );
  BUFX4 U245 ( .A(n939), .Y(n165) );
  BUFX4 U246 ( .A(n939), .Y(n166) );
  INVX2 U247 ( .A(roundSel[2]), .Y(n210) );
  NAND3X1 U248 ( .A(n68), .B(n33), .C(n210), .Y(n196) );
  NAND2X1 U249 ( .A(n213), .B(n108), .Y(n564) );
  AOI22X1 U250 ( .A(kin[11]), .B(n125), .C(kin[13]), .D(n122), .Y(n204) );
  NAND3X1 U251 ( .A(n68), .B(n59), .C(n50), .Y(n198) );
  NAND2X1 U252 ( .A(n213), .B(n106), .Y(n565) );
  INVX2 U253 ( .A(n565), .Y(n926) );
  AOI22X1 U254 ( .A(n135), .B(kin[7]), .C(kin[9]), .D(n130), .Y(n203) );
  NAND2X1 U255 ( .A(n206), .B(n108), .Y(n930) );
  INVX2 U256 ( .A(kin[3]), .Y(n485) );
  NAND2X1 U257 ( .A(n212), .B(n106), .Y(n928) );
  INVX2 U258 ( .A(kin[5]), .Y(n338) );
  OAI22X1 U259 ( .A(n143), .B(n485), .C(n138), .D(n338), .Y(n201) );
  INVX2 U260 ( .A(kin[0]), .Y(n498) );
  NAND3X1 U261 ( .A(n41), .B(n49), .C(n51), .Y(n199) );
  INVX2 U262 ( .A(n199), .Y(n221) );
  NAND2X1 U263 ( .A(n206), .B(n106), .Y(n932) );
  INVX2 U264 ( .A(kin[1]), .Y(n844) );
  OAI22X1 U265 ( .A(n498), .B(n149), .C(n146), .D(n844), .Y(n200) );
  NOR2X1 U266 ( .A(n201), .B(n200), .Y(n202) );
  NAND3X1 U267 ( .A(n204), .B(n203), .C(n202), .Y(n220) );
  AOI22X1 U268 ( .A(kin[18]), .B(n64), .C(kin[20]), .D(n150), .Y(n218) );
  NAND3X1 U269 ( .A(n108), .B(n63), .C(n105), .Y(n205) );
  AOI22X1 U270 ( .A(kin[14]), .B(n57), .C(kin[16]), .D(n162), .Y(n217) );
  NAND3X1 U271 ( .A(n209), .B(n50), .C(n210), .Y(n207) );
  NOR2X1 U272 ( .A(roundSel[0]), .B(n207), .Y(n208) );
  NAND2X1 U273 ( .A(n51), .B(n208), .Y(n227) );
  NAND2X1 U274 ( .A(n210), .B(n41), .Y(n211) );
  OAI22X1 U275 ( .A(n176), .B(n829), .C(n168), .D(n845), .Y(n215) );
  OAI22X1 U276 ( .A(n854), .B(n22), .C(n847), .D(n184), .Y(n214) );
  NOR2X1 U277 ( .A(n214), .B(n215), .Y(n216) );
  NAND3X1 U278 ( .A(n218), .B(n217), .C(n216), .Y(n219) );
  OR2X2 U279 ( .A(n220), .B(n219), .Y(k_out[0]) );
  AOI22X1 U280 ( .A(kin[12]), .B(n125), .C(kin[14]), .D(n121), .Y(n226) );
  AOI22X1 U281 ( .A(kin[8]), .B(n132), .C(kin[10]), .D(n129), .Y(n225) );
  INVX2 U282 ( .A(kin[4]), .Y(n942) );
  OAI22X1 U283 ( .A(n144), .B(n942), .C(n941), .D(n137), .Y(n223) );
  NAND2X1 U284 ( .A(n221), .B(n105), .Y(n804) );
  OAI22X1 U285 ( .A(n844), .B(n116), .C(n943), .D(n145), .Y(n222) );
  NOR2X1 U286 ( .A(n223), .B(n222), .Y(n224) );
  NAND3X1 U287 ( .A(n225), .B(n226), .C(n224), .Y(n234) );
  NAND2X1 U288 ( .A(n227), .B(n39), .Y(n794) );
  AOI22X1 U289 ( .A(n682), .B(kin[0]), .C(kin[19]), .D(n158), .Y(n232) );
  AOI22X1 U290 ( .A(kin[21]), .B(n153), .C(kin[15]), .D(n166), .Y(n231) );
  INVX2 U291 ( .A(kin[23]), .Y(n853) );
  OAI22X1 U292 ( .A(n174), .B(n845), .C(n188), .D(n853), .Y(n229) );
  INVX2 U293 ( .A(kin[25]), .Y(n846) );
  INVX2 U294 ( .A(kin[17]), .Y(n837) );
  OAI22X1 U295 ( .A(n9), .B(n846), .C(n112), .D(n837), .Y(n228) );
  NOR2X1 U296 ( .A(n228), .B(n229), .Y(n230) );
  NAND3X1 U297 ( .A(n231), .B(n232), .C(n230), .Y(n233) );
  OR2X2 U298 ( .A(n234), .B(n233), .Y(k_out[1]) );
  AOI22X1 U299 ( .A(kin[13]), .B(n127), .C(kin[15]), .D(n122), .Y(n239) );
  AOI22X1 U300 ( .A(kin[9]), .B(n135), .C(kin[11]), .D(n130), .Y(n238) );
  INVX2 U301 ( .A(kin[7]), .Y(n940) );
  OAI22X1 U302 ( .A(n143), .B(n338), .C(n940), .D(n137), .Y(n236) );
  OAI22X1 U303 ( .A(n943), .B(n117), .C(n485), .D(n147), .Y(n235) );
  NOR2X1 U304 ( .A(n235), .B(n236), .Y(n237) );
  NAND3X1 U305 ( .A(n239), .B(n238), .C(n237), .Y(n246) );
  AOI22X1 U306 ( .A(kin[20]), .B(n64), .C(kin[22]), .D(n151), .Y(n244) );
  AOI22X1 U307 ( .A(kin[16]), .B(n165), .C(kin[18]), .D(n161), .Y(n243) );
  OAI22X1 U308 ( .A(n174), .B(n498), .C(n170), .D(n844), .Y(n241) );
  NOR2X1 U309 ( .A(n241), .B(n240), .Y(n242) );
  NAND3X1 U310 ( .A(n244), .B(n243), .C(n242), .Y(n245) );
  OR2X2 U311 ( .A(n246), .B(n245), .Y(k_out[2]) );
  AOI22X1 U312 ( .A(kin[14]), .B(n29), .C(kin[16]), .D(n122), .Y(n251) );
  AOI22X1 U313 ( .A(kin[10]), .B(n133), .C(kin[12]), .D(n129), .Y(n250) );
  INVX2 U314 ( .A(kin[8]), .Y(n933) );
  OAI22X1 U315 ( .A(n142), .B(n941), .C(n933), .D(n32), .Y(n248) );
  OAI22X1 U316 ( .A(n485), .B(n116), .C(n942), .D(n146), .Y(n247) );
  NOR2X1 U317 ( .A(n248), .B(n247), .Y(n249) );
  NAND3X1 U318 ( .A(n251), .B(n250), .C(n249), .Y(n258) );
  AOI22X1 U319 ( .A(kin[21]), .B(n64), .C(kin[23]), .D(n150), .Y(n256) );
  AOI22X1 U320 ( .A(kin[17]), .B(n164), .C(kin[19]), .D(n161), .Y(n255) );
  OAI22X1 U321 ( .A(n175), .B(n844), .C(n943), .D(n114), .Y(n253) );
  OAI22X1 U322 ( .A(n188), .B(n846), .C(n184), .D(n845), .Y(n252) );
  NOR2X1 U323 ( .A(n253), .B(n252), .Y(n254) );
  NAND3X1 U324 ( .A(n256), .B(n255), .C(n254), .Y(n257) );
  OR2X2 U325 ( .A(n258), .B(n257), .Y(k_out[3]) );
  AOI22X1 U326 ( .A(kin[15]), .B(n125), .C(kin[17]), .D(n123), .Y(n263) );
  AOI22X1 U327 ( .A(kin[11]), .B(n132), .C(kin[13]), .D(n128), .Y(n262) );
  INVX2 U328 ( .A(kin[9]), .Y(n931) );
  OAI22X1 U329 ( .A(n141), .B(n940), .C(n931), .D(n137), .Y(n260) );
  OAI22X1 U330 ( .A(n942), .B(n149), .C(n146), .D(n338), .Y(n259) );
  NOR2X1 U331 ( .A(n259), .B(n260), .Y(n261) );
  NAND3X1 U332 ( .A(n263), .B(n262), .C(n261), .Y(n270) );
  AOI22X1 U333 ( .A(kin[22]), .B(n156), .C(kin[24]), .D(n152), .Y(n268) );
  AOI22X1 U334 ( .A(kin[18]), .B(n164), .C(kin[20]), .D(n162), .Y(n267) );
  OAI22X1 U335 ( .A(n175), .B(n943), .C(n170), .D(n485), .Y(n265) );
  OAI22X1 U336 ( .A(n829), .B(n190), .C(n498), .D(n77), .Y(n264) );
  NOR2X1 U337 ( .A(n264), .B(n265), .Y(n266) );
  NAND3X1 U338 ( .A(n268), .B(n267), .C(n266), .Y(n269) );
  OR2X2 U339 ( .A(n270), .B(n269), .Y(k_out[4]) );
  AOI22X1 U340 ( .A(kin[16]), .B(n127), .C(kin[18]), .D(n123), .Y(n275) );
  AOI22X1 U341 ( .A(kin[12]), .B(n132), .C(kin[14]), .D(n128), .Y(n274) );
  INVX2 U342 ( .A(kin[10]), .Y(n401) );
  OAI22X1 U343 ( .A(n143), .B(n933), .C(n139), .D(n401), .Y(n272) );
  OAI22X1 U344 ( .A(n117), .B(n338), .C(n941), .D(n148), .Y(n271) );
  NOR2X1 U345 ( .A(n272), .B(n271), .Y(n273) );
  NAND3X1 U346 ( .A(n275), .B(n274), .C(n273), .Y(n282) );
  AOI22X1 U347 ( .A(kin[23]), .B(n157), .C(kin[25]), .D(n152), .Y(n280) );
  AOI22X1 U348 ( .A(kin[19]), .B(n163), .C(kin[21]), .D(n160), .Y(n279) );
  OAI22X1 U349 ( .A(n10), .B(n485), .C(n942), .D(n168), .Y(n277) );
  OAI22X1 U350 ( .A(n191), .B(n845), .C(n77), .D(n844), .Y(n276) );
  NOR2X1 U351 ( .A(n276), .B(n277), .Y(n278) );
  NAND3X1 U352 ( .A(n280), .B(n279), .C(n278), .Y(n281) );
  OR2X2 U353 ( .A(n282), .B(n281), .Y(k_out[5]) );
  AOI22X1 U354 ( .A(kin[17]), .B(n29), .C(n123), .D(kin[19]), .Y(n287) );
  AOI22X1 U355 ( .A(kin[13]), .B(n135), .C(n130), .D(kin[15]), .Y(n286) );
  INVX2 U356 ( .A(kin[11]), .Y(n929) );
  OAI22X1 U357 ( .A(n142), .B(n931), .C(n32), .D(n929), .Y(n284) );
  OAI22X1 U358 ( .A(n941), .B(n116), .C(n940), .D(n145), .Y(n283) );
  NOR2X1 U359 ( .A(n283), .B(n284), .Y(n285) );
  NAND3X1 U360 ( .A(n287), .B(n286), .C(n285), .Y(n294) );
  AOI22X1 U361 ( .A(n682), .B(kin[5]), .C(kin[24]), .D(n156), .Y(n292) );
  AOI22X1 U362 ( .A(n152), .B(kin[26]), .C(kin[20]), .D(n163), .Y(n291) );
  OAI22X1 U363 ( .A(n942), .B(n176), .C(n498), .D(n191), .Y(n289) );
  OAI22X1 U364 ( .A(n183), .B(n943), .C(n854), .D(n112), .Y(n288) );
  NOR2X1 U365 ( .A(n289), .B(n288), .Y(n290) );
  NAND3X1 U366 ( .A(n292), .B(n291), .C(n290), .Y(n293) );
  OR2X2 U367 ( .A(n293), .B(n294), .Y(k_out[6]) );
  AOI22X1 U368 ( .A(kin[18]), .B(n124), .C(kin[20]), .D(n119), .Y(n299) );
  AOI22X1 U369 ( .A(kin[14]), .B(n134), .C(kin[16]), .D(n36), .Y(n298) );
  INVX2 U370 ( .A(kin[12]), .Y(n414) );
  OAI22X1 U371 ( .A(n141), .B(n401), .C(n137), .D(n414), .Y(n296) );
  OAI22X1 U372 ( .A(n940), .B(n116), .C(n933), .D(n147), .Y(n295) );
  NOR2X1 U373 ( .A(n296), .B(n295), .Y(n297) );
  AOI22X1 U374 ( .A(kin[25]), .B(n155), .C(kin[27]), .D(n153), .Y(n304) );
  AOI22X1 U375 ( .A(kin[21]), .B(n166), .C(kin[23]), .D(n161), .Y(n303) );
  OAI22X1 U376 ( .A(n173), .B(n338), .C(n941), .D(n114), .Y(n301) );
  OAI22X1 U377 ( .A(n188), .B(n844), .C(n9), .D(n485), .Y(n300) );
  NOR2X1 U378 ( .A(n300), .B(n301), .Y(n302) );
  NAND3X1 U379 ( .A(n304), .B(n303), .C(n302), .Y(n305) );
  OR2X2 U380 ( .A(n306), .B(n305), .Y(k_out[7]) );
  AOI22X1 U381 ( .A(kin[20]), .B(n27), .C(n120), .D(kin[22]), .Y(n311) );
  AOI22X1 U382 ( .A(kin[16]), .B(n134), .C(kin[18]), .D(n36), .Y(n310) );
  INVX2 U383 ( .A(kin[14]), .Y(n441) );
  OAI22X1 U384 ( .A(n143), .B(n414), .C(n137), .D(n441), .Y(n308) );
  OAI22X1 U385 ( .A(n931), .B(n116), .C(n147), .D(n401), .Y(n307) );
  NOR2X1 U386 ( .A(n308), .B(n307), .Y(n309) );
  AOI22X1 U387 ( .A(kin[27]), .B(n157), .C(kin[1]), .D(n150), .Y(n316) );
  AOI22X1 U388 ( .A(kin[23]), .B(n165), .C(kin[25]), .D(n159), .Y(n315) );
  OAI22X1 U389 ( .A(n188), .B(n485), .C(n184), .D(n338), .Y(n312) );
  NOR2X1 U390 ( .A(n312), .B(n313), .Y(n314) );
  NAND3X1 U391 ( .A(n316), .B(n315), .C(n314), .Y(n317) );
  OR2X2 U392 ( .A(n317), .B(n318), .Y(k_out[9]) );
  AOI22X1 U393 ( .A(kin[21]), .B(n29), .C(kin[23]), .D(n121), .Y(n325) );
  AOI22X1 U394 ( .A(kin[17]), .B(n133), .C(n130), .D(kin[19]), .Y(n324) );
  INVX2 U395 ( .A(kin[13]), .Y(n927) );
  OAI22X1 U396 ( .A(n143), .B(n927), .C(n838), .D(n139), .Y(n320) );
  OAI22X1 U397 ( .A(n149), .B(n401), .C(n148), .D(n929), .Y(n319) );
  NOR2X1 U398 ( .A(n319), .B(n320), .Y(n323) );
  NAND3X1 U399 ( .A(n325), .B(n324), .C(n323), .Y(n332) );
  AOI22X1 U400 ( .A(kin[0]), .B(n155), .C(kin[2]), .D(n150), .Y(n330) );
  AOI22X1 U401 ( .A(kin[24]), .B(n57), .C(n159), .D(kin[26]), .Y(n329) );
  OAI22X1 U402 ( .A(n11), .B(n933), .C(n170), .D(n931), .Y(n327) );
  OAI22X1 U403 ( .A(n942), .B(n191), .C(n184), .D(n941), .Y(n326) );
  NOR2X1 U404 ( .A(n326), .B(n327), .Y(n328) );
  NAND3X1 U405 ( .A(n330), .B(n329), .C(n328), .Y(n331) );
  OR2X2 U406 ( .A(n332), .B(n331), .Y(k_out[10]) );
  AOI22X1 U407 ( .A(n127), .B(kin[22]), .C(n120), .D(kin[24]), .Y(n337) );
  AOI22X1 U408 ( .A(kin[18]), .B(n133), .C(kin[20]), .D(n128), .Y(n336) );
  INVX2 U409 ( .A(kin[16]), .Y(n823) );
  OAI22X1 U410 ( .A(n144), .B(n441), .C(n137), .D(n823), .Y(n334) );
  OAI22X1 U411 ( .A(n929), .B(n116), .C(n145), .D(n414), .Y(n333) );
  NOR2X1 U412 ( .A(n334), .B(n333), .Y(n335) );
  NAND3X1 U413 ( .A(n337), .B(n336), .C(n335), .Y(n345) );
  AOI22X1 U414 ( .A(n682), .B(kin[10]), .C(kin[1]), .D(n64), .Y(n343) );
  AOI22X1 U415 ( .A(kin[3]), .B(n152), .C(kin[25]), .D(n164), .Y(n342) );
  OAI22X1 U416 ( .A(n175), .B(n931), .C(n189), .D(n338), .Y(n340) );
  OAI22X1 U417 ( .A(n183), .B(n940), .C(n112), .D(n845), .Y(n339) );
  NOR2X1 U418 ( .A(n340), .B(n339), .Y(n341) );
  NAND3X1 U419 ( .A(n343), .B(n342), .C(n341), .Y(n344) );
  OR2X2 U420 ( .A(n344), .B(n345), .Y(k_out[11]) );
  AOI22X1 U421 ( .A(kin[23]), .B(n29), .C(kin[25]), .D(n122), .Y(n350) );
  AOI22X1 U422 ( .A(n135), .B(kin[19]), .C(n129), .D(kin[21]), .Y(n349) );
  OAI22X1 U423 ( .A(n838), .B(n76), .C(n837), .D(n139), .Y(n347) );
  OAI22X1 U424 ( .A(n414), .B(n116), .C(n146), .D(n927), .Y(n346) );
  NOR2X1 U425 ( .A(n347), .B(n346), .Y(n348) );
  AOI22X1 U426 ( .A(kin[2]), .B(n157), .C(kin[4]), .D(n154), .Y(n355) );
  AOI22X1 U427 ( .A(n57), .B(kin[26]), .C(n162), .D(kin[0]), .Y(n354) );
  OAI22X1 U428 ( .A(n176), .B(n401), .C(n929), .D(n114), .Y(n352) );
  OAI22X1 U429 ( .A(n192), .B(n941), .C(n7), .D(n933), .Y(n351) );
  NOR2X1 U430 ( .A(n352), .B(n351), .Y(n353) );
  NAND3X1 U431 ( .A(n355), .B(n354), .C(n353), .Y(n356) );
  OR2X2 U432 ( .A(n357), .B(n356), .Y(k_out[12]) );
  AOI22X1 U433 ( .A(n125), .B(kin[24]), .C(n122), .D(kin[26]), .Y(n362) );
  AOI22X1 U434 ( .A(kin[20]), .B(n133), .C(n36), .D(kin[22]), .Y(n361) );
  INVX2 U435 ( .A(kin[18]), .Y(n856) );
  OAI22X1 U436 ( .A(n143), .B(n823), .C(n137), .D(n856), .Y(n359) );
  OAI22X1 U437 ( .A(n149), .B(n927), .C(n146), .D(n441), .Y(n358) );
  NOR2X1 U438 ( .A(n359), .B(n358), .Y(n360) );
  NAND3X1 U439 ( .A(n362), .B(n361), .C(n360), .Y(n369) );
  AOI22X1 U440 ( .A(kin[3]), .B(n156), .C(kin[5]), .D(n152), .Y(n367) );
  AOI22X1 U441 ( .A(kin[27]), .B(n56), .C(kin[1]), .D(n162), .Y(n366) );
  OAI22X1 U442 ( .A(n10), .B(n929), .C(n3), .D(n414), .Y(n364) );
  OAI22X1 U443 ( .A(n28), .B(n940), .C(n183), .D(n931), .Y(n363) );
  NOR2X1 U444 ( .A(n364), .B(n363), .Y(n365) );
  NAND3X1 U445 ( .A(n367), .B(n366), .C(n365), .Y(n368) );
  OR2X2 U446 ( .A(n369), .B(n368), .Y(k_out[13]) );
  AOI22X1 U447 ( .A(kin[25]), .B(n126), .C(kin[27]), .D(n122), .Y(n374) );
  AOI22X1 U448 ( .A(n135), .B(kin[21]), .C(kin[23]), .D(n129), .Y(n373) );
  INVX2 U449 ( .A(kin[19]), .Y(n836) );
  OAI22X1 U450 ( .A(n142), .B(n837), .C(n139), .D(n836), .Y(n371) );
  OAI22X1 U451 ( .A(n441), .B(n116), .C(n838), .D(n145), .Y(n370) );
  NOR2X1 U452 ( .A(n370), .B(n371), .Y(n372) );
  NAND3X1 U453 ( .A(n374), .B(n373), .C(n372), .Y(n381) );
  AOI22X1 U454 ( .A(kin[13]), .B(n171), .C(kin[4]), .D(n156), .Y(n379) );
  AOI22X1 U455 ( .A(kin[6]), .B(n150), .C(n164), .D(kin[0]), .Y(n378) );
  OAI22X1 U456 ( .A(n175), .B(n414), .C(n188), .D(n933), .Y(n376) );
  OAI22X1 U457 ( .A(n9), .B(n401), .C(n112), .D(n943), .Y(n375) );
  NOR2X1 U458 ( .A(n375), .B(n376), .Y(n377) );
  NAND3X1 U459 ( .A(n379), .B(n378), .C(n377), .Y(n380) );
  OR2X2 U460 ( .A(n381), .B(n380), .Y(k_out[14]) );
  AOI22X1 U461 ( .A(n27), .B(kin[26]), .C(n119), .D(kin[0]), .Y(n386) );
  AOI22X1 U462 ( .A(n135), .B(kin[22]), .C(n36), .D(kin[24]), .Y(n385) );
  INVX2 U463 ( .A(kin[20]), .Y(n855) );
  OAI22X1 U464 ( .A(n143), .B(n856), .C(n32), .D(n855), .Y(n383) );
  OAI22X1 U465 ( .A(n838), .B(n117), .C(n147), .D(n823), .Y(n382) );
  NOR2X1 U466 ( .A(n383), .B(n382), .Y(n384) );
  AOI22X1 U467 ( .A(kin[5]), .B(n155), .C(kin[7]), .D(n153), .Y(n391) );
  AOI22X1 U468 ( .A(kin[1]), .B(n165), .C(kin[3]), .D(n161), .Y(n390) );
  NOR2X1 U469 ( .A(n388), .B(n387), .Y(n389) );
  NAND3X1 U470 ( .A(n391), .B(n390), .C(n389), .Y(n392) );
  OR2X2 U471 ( .A(n395), .B(n392), .Y(k_out[15]) );
  AOI22X1 U472 ( .A(kin[27]), .B(n127), .C(kin[1]), .D(n123), .Y(n400) );
  AOI22X1 U473 ( .A(kin[23]), .B(n134), .C(kin[25]), .D(n131), .Y(n399) );
  INVX2 U474 ( .A(kin[21]), .Y(n830) );
  OAI22X1 U475 ( .A(n141), .B(n836), .C(n830), .D(n137), .Y(n397) );
  OAI22X1 U476 ( .A(n823), .B(n116), .C(n837), .D(n146), .Y(n396) );
  NOR2X1 U477 ( .A(n397), .B(n396), .Y(n398) );
  AOI22X1 U478 ( .A(kin[6]), .B(n156), .C(kin[8]), .D(n152), .Y(n406) );
  AOI22X1 U479 ( .A(kin[2]), .B(n164), .C(kin[4]), .D(n160), .Y(n405) );
  OAI22X1 U480 ( .A(n175), .B(n441), .C(n838), .D(n114), .Y(n403) );
  OAI22X1 U481 ( .A(n189), .B(n401), .C(n184), .D(n414), .Y(n402) );
  NOR2X1 U482 ( .A(n403), .B(n402), .Y(n404) );
  NAND3X1 U483 ( .A(n406), .B(n405), .C(n404), .Y(n407) );
  OR2X2 U484 ( .A(n408), .B(n407), .Y(k_out[16]) );
  AOI22X1 U485 ( .A(kin[1]), .B(n29), .C(kin[3]), .D(n122), .Y(n413) );
  AOI22X1 U486 ( .A(kin[25]), .B(n135), .C(kin[27]), .D(n130), .Y(n412) );
  OAI22X1 U487 ( .A(n143), .B(n830), .C(n139), .D(n853), .Y(n410) );
  OAI22X1 U488 ( .A(n856), .B(n116), .C(n836), .D(n148), .Y(n409) );
  NOR2X1 U489 ( .A(n410), .B(n409), .Y(n411) );
  NAND3X1 U490 ( .A(n413), .B(n412), .C(n411), .Y(n421) );
  AOI22X1 U491 ( .A(n682), .B(kin[17]), .C(kin[8]), .D(n157), .Y(n419) );
  AOI22X1 U492 ( .A(kin[10]), .B(n154), .C(kin[4]), .D(n165), .Y(n418) );
  OAI22X1 U493 ( .A(n175), .B(n823), .C(n190), .D(n414), .Y(n416) );
  OAI22X1 U494 ( .A(n183), .B(n441), .C(n112), .D(n941), .Y(n415) );
  NOR2X1 U495 ( .A(n416), .B(n415), .Y(n417) );
  NAND3X1 U496 ( .A(n419), .B(n418), .C(n417), .Y(n420) );
  OR2X2 U497 ( .A(n421), .B(n420), .Y(k_out[18]) );
  AOI22X1 U498 ( .A(n127), .B(kin[2]), .C(n123), .D(kin[4]), .Y(n426) );
  AOI22X1 U499 ( .A(n133), .B(kin[26]), .C(n130), .D(kin[0]), .Y(n425) );
  OAI22X1 U500 ( .A(n854), .B(n141), .C(n847), .D(n32), .Y(n423) );
  OAI22X1 U501 ( .A(n836), .B(n116), .C(n147), .D(n855), .Y(n422) );
  NOR2X1 U502 ( .A(n423), .B(n422), .Y(n424) );
  NAND3X1 U503 ( .A(n426), .B(n425), .C(n424), .Y(n435) );
  AOI22X1 U504 ( .A(kin[9]), .B(n156), .C(kin[11]), .D(n152), .Y(n433) );
  AOI22X1 U505 ( .A(kin[5]), .B(n56), .C(kin[7]), .D(n159), .Y(n432) );
  OAI22X1 U506 ( .A(n176), .B(n837), .C(n856), .D(n115), .Y(n428) );
  OAI22X1 U507 ( .A(n191), .B(n927), .C(n184), .D(n838), .Y(n427) );
  NOR2X1 U508 ( .A(n427), .B(n428), .Y(n431) );
  NAND3X1 U509 ( .A(n433), .B(n432), .C(n431), .Y(n434) );
  OR2X2 U510 ( .A(n435), .B(n434), .Y(k_out[19]) );
  AOI22X1 U511 ( .A(kin[3]), .B(n125), .C(kin[5]), .D(n122), .Y(n440) );
  AOI22X1 U512 ( .A(kin[27]), .B(n133), .C(kin[1]), .D(n129), .Y(n439) );
  OAI22X1 U513 ( .A(n142), .B(n853), .C(n139), .D(n846), .Y(n437) );
  OAI22X1 U514 ( .A(n149), .B(n855), .C(n830), .D(n147), .Y(n436) );
  NOR2X1 U515 ( .A(n437), .B(n436), .Y(n438) );
  NAND3X1 U516 ( .A(n440), .B(n439), .C(n438), .Y(n448) );
  AOI22X1 U517 ( .A(kin[10]), .B(n158), .C(kin[12]), .D(n150), .Y(n446) );
  AOI22X1 U518 ( .A(kin[6]), .B(n163), .C(kin[8]), .D(n159), .Y(n445) );
  OAI22X1 U519 ( .A(n175), .B(n856), .C(n169), .D(n836), .Y(n443) );
  OAI22X1 U520 ( .A(n28), .B(n441), .C(n184), .D(n823), .Y(n442) );
  NOR2X1 U521 ( .A(n443), .B(n442), .Y(n444) );
  NAND3X1 U522 ( .A(n446), .B(n445), .C(n444), .Y(n447) );
  OR2X2 U523 ( .A(n448), .B(n447), .Y(k_out[20]) );
  AOI22X1 U524 ( .A(kin[5]), .B(n127), .C(n120), .D(kin[7]), .Y(n453) );
  AOI22X1 U525 ( .A(kin[1]), .B(n132), .C(kin[3]), .D(n128), .Y(n452) );
  OAI22X1 U526 ( .A(n141), .B(n846), .C(n139), .D(n845), .Y(n450) );
  OAI22X1 U527 ( .A(n854), .B(n149), .C(n145), .D(n853), .Y(n449) );
  NOR2X1 U528 ( .A(n449), .B(n450), .Y(n451) );
  NAND3X1 U529 ( .A(n453), .B(n452), .C(n451), .Y(n460) );
  AOI22X1 U530 ( .A(kin[12]), .B(n155), .C(kin[14]), .D(n150), .Y(n458) );
  AOI22X1 U531 ( .A(kin[8]), .B(n166), .C(kin[10]), .D(n161), .Y(n457) );
  OAI22X1 U532 ( .A(n174), .B(n855), .C(n169), .D(n830), .Y(n455) );
  OAI22X1 U533 ( .A(n190), .B(n823), .C(n9), .D(n856), .Y(n454) );
  NOR2X1 U534 ( .A(n454), .B(n455), .Y(n456) );
  NAND3X1 U535 ( .A(n458), .B(n457), .C(n456), .Y(n459) );
  OR2X2 U536 ( .A(n460), .B(n459), .Y(k_out[22]) );
  AOI22X1 U537 ( .A(n124), .B(kin[6]), .C(kin[8]), .D(n120), .Y(n465) );
  AOI22X1 U538 ( .A(n135), .B(kin[2]), .C(n129), .D(kin[4]), .Y(n464) );
  OAI22X1 U539 ( .A(n142), .B(n829), .C(n498), .D(n32), .Y(n462) );
  OAI22X1 U540 ( .A(n853), .B(n116), .C(n847), .D(n147), .Y(n461) );
  NOR2X1 U541 ( .A(n462), .B(n461), .Y(n463) );
  AOI22X1 U542 ( .A(kin[13]), .B(n155), .C(kin[15]), .D(n152), .Y(n470) );
  AOI22X1 U543 ( .A(kin[9]), .B(n56), .C(kin[11]), .D(n161), .Y(n469) );
  OAI22X1 U544 ( .A(n175), .B(n830), .C(n854), .D(n115), .Y(n467) );
  OAI22X1 U545 ( .A(n188), .B(n837), .C(n77), .D(n836), .Y(n466) );
  NOR2X1 U546 ( .A(n466), .B(n467), .Y(n468) );
  NAND3X1 U547 ( .A(n470), .B(n469), .C(n468), .Y(n471) );
  OR2X2 U548 ( .A(n472), .B(n471), .Y(k_out[23]) );
  AOI22X1 U549 ( .A(kin[8]), .B(n127), .C(kin[10]), .D(n121), .Y(n477) );
  AOI22X1 U550 ( .A(n133), .B(kin[4]), .C(n36), .D(kin[6]), .Y(n476) );
  OAI22X1 U551 ( .A(n498), .B(n144), .C(n943), .D(n137), .Y(n474) );
  OAI22X1 U552 ( .A(n846), .B(n117), .C(n829), .D(n147), .Y(n473) );
  NOR2X1 U553 ( .A(n474), .B(n473), .Y(n475) );
  NAND3X1 U554 ( .A(n477), .B(n476), .C(n475), .Y(n484) );
  AOI22X1 U555 ( .A(n682), .B(kin[24]), .C(kin[15]), .D(n64), .Y(n482) );
  AOI22X1 U556 ( .A(kin[17]), .B(n154), .C(kin[11]), .D(n57), .Y(n481) );
  OAI22X1 U557 ( .A(n11), .B(n853), .C(n189), .D(n836), .Y(n479) );
  OAI22X1 U558 ( .A(n183), .B(n830), .C(n112), .D(n927), .Y(n478) );
  NOR2X1 U559 ( .A(n479), .B(n478), .Y(n480) );
  NAND3X1 U560 ( .A(n482), .B(n481), .C(n480), .Y(n483) );
  OR2X2 U561 ( .A(n483), .B(n484), .Y(k_out[25]) );
  AOI22X1 U562 ( .A(kin[9]), .B(n27), .C(kin[11]), .D(n120), .Y(n490) );
  AOI22X1 U563 ( .A(kin[5]), .B(n135), .C(n128), .D(kin[7]), .Y(n489) );
  OAI22X1 U564 ( .A(n141), .B(n844), .C(n139), .D(n485), .Y(n487) );
  OAI22X1 U565 ( .A(n829), .B(n117), .C(n148), .D(n845), .Y(n486) );
  NOR2X1 U566 ( .A(n487), .B(n486), .Y(n488) );
  NAND3X1 U567 ( .A(n490), .B(n489), .C(n488), .Y(n497) );
  AOI22X1 U568 ( .A(kin[16]), .B(n157), .C(kin[18]), .D(n152), .Y(n495) );
  AOI22X1 U569 ( .A(kin[12]), .B(n164), .C(kin[14]), .D(n159), .Y(n494) );
  OAI22X1 U570 ( .A(n847), .B(n176), .C(n846), .D(n115), .Y(n492) );
  OAI22X1 U571 ( .A(n191), .B(n855), .C(n854), .D(n183), .Y(n491) );
  NOR2X1 U572 ( .A(n492), .B(n491), .Y(n493) );
  NAND3X1 U573 ( .A(n495), .B(n494), .C(n493), .Y(n496) );
  OR2X2 U574 ( .A(n496), .B(n497), .Y(k_out[26]) );
  AOI22X1 U575 ( .A(kin[10]), .B(n27), .C(kin[12]), .D(n119), .Y(n503) );
  AOI22X1 U576 ( .A(n134), .B(kin[6]), .C(kin[8]), .D(n128), .Y(n502) );
  OAI22X1 U577 ( .A(n144), .B(n943), .C(n942), .D(n32), .Y(n500) );
  OAI22X1 U578 ( .A(n845), .B(n117), .C(n498), .D(n148), .Y(n499) );
  NOR2X1 U579 ( .A(n500), .B(n499), .Y(n501) );
  AOI22X1 U580 ( .A(n171), .B(kin[26]), .C(kin[17]), .D(n155), .Y(n508) );
  AOI22X1 U581 ( .A(kin[19]), .B(n153), .C(kin[13]), .D(n56), .Y(n507) );
  OAI22X1 U582 ( .A(n174), .B(n846), .C(n191), .D(n830), .Y(n505) );
  OAI22X1 U583 ( .A(n8), .B(n853), .C(n112), .D(n838), .Y(n504) );
  NOR2X1 U584 ( .A(n504), .B(n505), .Y(n506) );
  NAND3X1 U585 ( .A(n508), .B(n507), .C(n506), .Y(n509) );
  OR2X2 U586 ( .A(n510), .B(n509), .Y(k_out[27]) );
  AOI22X1 U587 ( .A(kin[39]), .B(n126), .C(kin[41]), .D(n123), .Y(n515) );
  AOI22X1 U588 ( .A(kin[35]), .B(n135), .C(kin[37]), .D(n130), .Y(n514) );
  INVX2 U589 ( .A(kin[31]), .Y(n883) );
  INVX2 U590 ( .A(kin[33]), .Y(n882) );
  OAI22X1 U591 ( .A(n141), .B(n883), .C(n138), .D(n882), .Y(n512) );
  INVX2 U592 ( .A(kin[28]), .Y(n907) );
  INVX2 U593 ( .A(kin[29]), .Y(n788) );
  OAI22X1 U594 ( .A(n907), .B(n117), .C(n145), .D(n788), .Y(n511) );
  NOR2X1 U595 ( .A(n511), .B(n512), .Y(n513) );
  NAND3X1 U596 ( .A(n515), .B(n514), .C(n513), .Y(n522) );
  AOI22X1 U597 ( .A(n682), .B(kin[55]), .C(kin[46]), .D(n64), .Y(n520) );
  AOI22X1 U598 ( .A(kin[48]), .B(n153), .C(kin[42]), .D(n57), .Y(n519) );
  INVX2 U599 ( .A(kin[54]), .Y(n908) );
  OAI22X1 U600 ( .A(n174), .B(n908), .C(n188), .D(n795), .Y(n517) );
  OAI22X1 U601 ( .A(n184), .B(n915), .C(n112), .D(n755), .Y(n516) );
  NOR2X1 U602 ( .A(n517), .B(n516), .Y(n518) );
  NAND3X1 U603 ( .A(n520), .B(n519), .C(n518), .Y(n521) );
  OR2X2 U604 ( .A(n522), .B(n521), .Y(k_out[28]) );
  AOI22X1 U605 ( .A(kin[40]), .B(n29), .C(kin[42]), .D(n122), .Y(n527) );
  AOI22X1 U606 ( .A(kin[36]), .B(n132), .C(kin[38]), .D(n129), .Y(n526) );
  INVX2 U607 ( .A(kin[32]), .Y(n869) );
  INVX2 U608 ( .A(kin[34]), .Y(n863) );
  OAI22X1 U609 ( .A(n141), .B(n869), .C(n138), .D(n863), .Y(n524) );
  INVX2 U610 ( .A(kin[30]), .Y(n906) );
  OAI22X1 U611 ( .A(n149), .B(n788), .C(n146), .D(n906), .Y(n523) );
  NOR2X1 U612 ( .A(n523), .B(n524), .Y(n525) );
  NAND3X1 U613 ( .A(n527), .B(n526), .C(n525), .Y(n534) );
  AOI22X1 U614 ( .A(kin[47]), .B(n157), .C(kin[49]), .D(n152), .Y(n532) );
  AOI22X1 U615 ( .A(kin[43]), .B(n165), .C(kin[45]), .D(n160), .Y(n531) );
  INVX2 U616 ( .A(kin[55]), .Y(n805) );
  OAI22X1 U617 ( .A(n176), .B(n805), .C(n3), .D(n907), .Y(n529) );
  INVX2 U618 ( .A(kin[51]), .Y(n916) );
  INVX2 U619 ( .A(kin[53]), .Y(n909) );
  OAI22X1 U620 ( .A(n22), .B(n916), .C(n184), .D(n909), .Y(n528) );
  NOR2X1 U621 ( .A(n528), .B(n529), .Y(n530) );
  NAND3X1 U622 ( .A(n532), .B(n531), .C(n530), .Y(n533) );
  OR2X2 U623 ( .A(n534), .B(n533), .Y(k_out[29]) );
  AOI22X1 U624 ( .A(kin[41]), .B(n126), .C(kin[43]), .D(n122), .Y(n539) );
  AOI22X1 U625 ( .A(kin[37]), .B(n132), .C(kin[39]), .D(n130), .Y(n538) );
  INVX2 U626 ( .A(kin[35]), .Y(n881) );
  OAI22X1 U627 ( .A(n141), .B(n882), .C(n138), .D(n881), .Y(n536) );
  OAI22X1 U628 ( .A(n906), .B(n117), .C(n146), .D(n883), .Y(n535) );
  NOR2X1 U629 ( .A(n535), .B(n536), .Y(n537) );
  NAND3X1 U630 ( .A(n539), .B(n538), .C(n537), .Y(n546) );
  AOI22X1 U631 ( .A(n682), .B(kin[29]), .C(kin[48]), .D(n157), .Y(n544) );
  AOI22X1 U632 ( .A(kin[50]), .B(n153), .C(kin[44]), .D(n163), .Y(n543) );
  OAI22X1 U633 ( .A(n174), .B(n907), .C(n188), .D(n915), .Y(n541) );
  INVX2 U634 ( .A(kin[46]), .Y(n780) );
  OAI22X1 U635 ( .A(n184), .B(n908), .C(n112), .D(n780), .Y(n540) );
  NOR2X1 U636 ( .A(n541), .B(n540), .Y(n542) );
  NAND3X1 U637 ( .A(n544), .B(n543), .C(n542), .Y(n545) );
  OR2X2 U638 ( .A(n546), .B(n545), .Y(k_out[30]) );
  AOI22X1 U639 ( .A(kin[42]), .B(n27), .C(kin[44]), .D(n120), .Y(n551) );
  AOI22X1 U640 ( .A(kin[38]), .B(n135), .C(kin[40]), .D(n36), .Y(n550) );
  INVX2 U641 ( .A(kin[36]), .Y(n900) );
  OAI22X1 U642 ( .A(n141), .B(n863), .C(n137), .D(n900), .Y(n548) );
  NOR2X1 U643 ( .A(n547), .B(n548), .Y(n549) );
  AOI22X1 U644 ( .A(kin[49]), .B(n155), .C(kin[51]), .D(n153), .Y(n556) );
  AOI22X1 U645 ( .A(kin[45]), .B(n166), .C(kin[47]), .D(n161), .Y(n555) );
  OAI22X1 U646 ( .A(n174), .B(n788), .C(n169), .D(n906), .Y(n553) );
  OAI22X1 U647 ( .A(n188), .B(n909), .C(n8), .D(n805), .Y(n552) );
  NOR2X1 U648 ( .A(n552), .B(n553), .Y(n554) );
  NAND3X1 U649 ( .A(n555), .B(n556), .C(n554), .Y(n557) );
  OAI22X1 U650 ( .A(n147), .B(n882), .C(n139), .D(n875), .Y(n560) );
  OAI22X1 U651 ( .A(n76), .B(n881), .C(n558), .D(n795), .Y(n559) );
  NOR2X1 U652 ( .A(n560), .B(n559), .Y(n576) );
  INVX2 U653 ( .A(kin[43]), .Y(n890) );
  AOI22X1 U654 ( .A(kin[45]), .B(n120), .C(kin[46]), .D(n56), .Y(n563) );
  OAI21X1 U655 ( .A(n75), .B(n890), .C(n563), .Y(n568) );
  OAI22X1 U656 ( .A(n566), .B(n862), .C(n66), .D(n897), .Y(n567) );
  NOR2X1 U657 ( .A(n568), .B(n567), .Y(n575) );
  AOI22X1 U658 ( .A(kin[54]), .B(n58), .C(kin[28]), .D(n37), .Y(n570) );
  AOI22X1 U659 ( .A(kin[48]), .B(n159), .C(kin[52]), .D(n154), .Y(n569) );
  NAND2X1 U660 ( .A(n570), .B(n569), .Y(n573) );
  AOI22X1 U661 ( .A(n118), .B(kin[32]), .C(kin[30]), .D(n61), .Y(n571) );
  OAI21X1 U662 ( .A(n43), .B(n883), .C(n571), .Y(n572) );
  NOR2X1 U663 ( .A(n573), .B(n572), .Y(n574) );
  NAND3X1 U664 ( .A(n576), .B(n575), .C(n574), .Y(k_out[32]) );
  AOI22X1 U665 ( .A(kin[44]), .B(n29), .C(kin[46]), .D(n120), .Y(n581) );
  AOI22X1 U666 ( .A(kin[40]), .B(n133), .C(kin[42]), .D(n36), .Y(n580) );
  INVX2 U667 ( .A(kin[38]), .Y(n899) );
  OAI22X1 U668 ( .A(n142), .B(n900), .C(n138), .D(n899), .Y(n578) );
  OAI22X1 U669 ( .A(n149), .B(n882), .C(n147), .D(n863), .Y(n577) );
  NOR2X1 U670 ( .A(n578), .B(n577), .Y(n579) );
  AOI22X1 U671 ( .A(kin[51]), .B(n157), .C(kin[53]), .D(n150), .Y(n586) );
  AOI22X1 U672 ( .A(kin[47]), .B(n163), .C(kin[49]), .D(n160), .Y(n585) );
  OAI22X1 U673 ( .A(n11), .B(n883), .C(n3), .D(n869), .Y(n583) );
  OAI22X1 U674 ( .A(n28), .B(n805), .C(n183), .D(n788), .Y(n582) );
  NOR2X1 U675 ( .A(n583), .B(n582), .Y(n584) );
  NAND3X1 U676 ( .A(n586), .B(n585), .C(n584), .Y(n587) );
  OR2X2 U677 ( .A(n588), .B(n587), .Y(k_out[33]) );
  AOI22X1 U678 ( .A(kin[46]), .B(n29), .C(kin[48]), .D(n120), .Y(n593) );
  AOI22X1 U679 ( .A(kin[42]), .B(n133), .C(kin[44]), .D(n130), .Y(n592) );
  INVX2 U680 ( .A(kin[40]), .Y(n898) );
  OAI22X1 U681 ( .A(n144), .B(n899), .C(n137), .D(n898), .Y(n590) );
  OAI22X1 U682 ( .A(n149), .B(n881), .C(n146), .D(n900), .Y(n589) );
  NOR2X1 U683 ( .A(n590), .B(n589), .Y(n591) );
  NAND3X1 U684 ( .A(n593), .B(n592), .C(n591), .Y(n602) );
  AOI22X1 U685 ( .A(kin[53]), .B(n157), .C(kin[55]), .D(n150), .Y(n600) );
  AOI22X1 U686 ( .A(kin[49]), .B(n164), .C(kin[51]), .D(n159), .Y(n599) );
  OAI22X1 U687 ( .A(n189), .B(n788), .C(n183), .D(n883), .Y(n594) );
  NOR2X1 U688 ( .A(n595), .B(n594), .Y(n596) );
  NAND3X1 U689 ( .A(n600), .B(n599), .C(n596), .Y(n601) );
  OR2X2 U690 ( .A(n601), .B(n602), .Y(k_out[35]) );
  AOI22X1 U691 ( .A(kin[47]), .B(n125), .C(kin[49]), .D(n121), .Y(n607) );
  AOI22X1 U692 ( .A(kin[43]), .B(n132), .C(kin[45]), .D(n131), .Y(n606) );
  OAI22X1 U693 ( .A(n141), .B(n862), .C(n139), .D(n897), .Y(n604) );
  OAI22X1 U694 ( .A(n900), .B(n117), .C(n146), .D(n875), .Y(n603) );
  NOR2X1 U695 ( .A(n603), .B(n604), .Y(n605) );
  NAND3X1 U696 ( .A(n607), .B(n606), .C(n605), .Y(n614) );
  AOI22X1 U697 ( .A(n682), .B(kin[35]), .C(kin[54]), .D(n64), .Y(n612) );
  AOI22X1 U698 ( .A(kin[28]), .B(n153), .C(kin[50]), .D(n163), .Y(n611) );
  OAI22X1 U699 ( .A(n174), .B(n863), .C(n188), .D(n906), .Y(n609) );
  OAI22X1 U700 ( .A(n184), .B(n869), .C(n112), .D(n915), .Y(n608) );
  NOR2X1 U701 ( .A(n609), .B(n608), .Y(n610) );
  NAND3X1 U702 ( .A(n612), .B(n611), .C(n610), .Y(n613) );
  OR2X2 U703 ( .A(n614), .B(n613), .Y(k_out[36]) );
  AOI22X1 U704 ( .A(kin[49]), .B(n125), .C(kin[51]), .D(n121), .Y(n619) );
  AOI22X1 U705 ( .A(kin[45]), .B(n133), .C(kin[47]), .D(n129), .Y(n618) );
  OAI22X1 U706 ( .A(n142), .B(n897), .C(n32), .D(n890), .Y(n616) );
  OAI22X1 U707 ( .A(n899), .B(n117), .C(n862), .D(n148), .Y(n615) );
  NOR2X1 U708 ( .A(n616), .B(n615), .Y(n617) );
  NAND3X1 U709 ( .A(n619), .B(n618), .C(n617), .Y(n626) );
  AOI22X1 U710 ( .A(kin[28]), .B(n155), .C(kin[30]), .D(n154), .Y(n624) );
  AOI22X1 U711 ( .A(kin[52]), .B(n57), .C(kin[54]), .D(n160), .Y(n623) );
  OAI22X1 U712 ( .A(n174), .B(n900), .C(n875), .D(n115), .Y(n621) );
  OAI22X1 U713 ( .A(n191), .B(n869), .C(n77), .D(n863), .Y(n620) );
  NOR2X1 U714 ( .A(n621), .B(n620), .Y(n622) );
  NAND3X1 U715 ( .A(n624), .B(n623), .C(n622), .Y(n625) );
  OR2X2 U716 ( .A(n626), .B(n625), .Y(k_out[38]) );
  AOI22X1 U717 ( .A(kin[50]), .B(n125), .C(kin[52]), .D(n122), .Y(n631) );
  AOI22X1 U718 ( .A(kin[46]), .B(n132), .C(kin[48]), .D(n129), .Y(n630) );
  INVX2 U719 ( .A(kin[42]), .Y(n891) );
  OAI22X1 U720 ( .A(n142), .B(n891), .C(n138), .D(n755), .Y(n628) );
  OAI22X1 U721 ( .A(n862), .B(n117), .C(n148), .D(n898), .Y(n627) );
  NOR2X1 U722 ( .A(n628), .B(n627), .Y(n629) );
  NAND3X1 U723 ( .A(n631), .B(n630), .C(n629), .Y(n638) );
  AOI22X1 U724 ( .A(kin[29]), .B(n157), .C(kin[31]), .D(n152), .Y(n636) );
  AOI22X1 U725 ( .A(kin[53]), .B(n163), .C(kin[55]), .D(n159), .Y(n635) );
  OAI22X1 U726 ( .A(n10), .B(n875), .C(n170), .D(n899), .Y(n633) );
  OAI22X1 U727 ( .A(n22), .B(n882), .C(n183), .D(n881), .Y(n632) );
  NOR2X1 U728 ( .A(n633), .B(n632), .Y(n634) );
  NAND3X1 U729 ( .A(n636), .B(n635), .C(n634), .Y(n637) );
  OR2X2 U730 ( .A(n638), .B(n637), .Y(k_out[39]) );
  AOI22X1 U731 ( .A(kin[51]), .B(n125), .C(kin[53]), .D(n121), .Y(n643) );
  AOI22X1 U732 ( .A(kin[47]), .B(n132), .C(kin[49]), .D(n128), .Y(n642) );
  INVX2 U733 ( .A(kin[45]), .Y(n889) );
  OAI22X1 U734 ( .A(n143), .B(n890), .C(n139), .D(n889), .Y(n640) );
  OAI22X1 U735 ( .A(n149), .B(n898), .C(n145), .D(n897), .Y(n639) );
  NOR2X1 U736 ( .A(n639), .B(n640), .Y(n641) );
  NAND3X1 U737 ( .A(n643), .B(n642), .C(n641), .Y(n650) );
  AOI22X1 U738 ( .A(kin[30]), .B(n155), .C(kin[32]), .D(n151), .Y(n648) );
  AOI22X1 U739 ( .A(kin[54]), .B(n56), .C(kin[28]), .D(n161), .Y(n647) );
  OAI22X1 U740 ( .A(n174), .B(n899), .C(n169), .D(n862), .Y(n645) );
  OAI22X1 U741 ( .A(n22), .B(n863), .C(n184), .D(n900), .Y(n644) );
  NOR2X1 U742 ( .A(n645), .B(n644), .Y(n646) );
  NAND3X1 U743 ( .A(n648), .B(n647), .C(n646), .Y(n649) );
  OR2X2 U744 ( .A(n650), .B(n649), .Y(k_out[40]) );
  AOI22X1 U745 ( .A(kin[52]), .B(n127), .C(kin[54]), .D(n122), .Y(n655) );
  AOI22X1 U746 ( .A(kin[48]), .B(n133), .C(kin[50]), .D(n128), .Y(n654) );
  OAI22X1 U747 ( .A(n141), .B(n755), .C(n138), .D(n780), .Y(n652) );
  OAI22X1 U748 ( .A(n149), .B(n897), .C(n148), .D(n891), .Y(n651) );
  NOR2X1 U749 ( .A(n652), .B(n651), .Y(n653) );
  NAND3X1 U750 ( .A(n655), .B(n654), .C(n653), .Y(n664) );
  AOI22X1 U751 ( .A(kin[31]), .B(n156), .C(kin[33]), .D(n152), .Y(n662) );
  AOI22X1 U752 ( .A(kin[55]), .B(n165), .C(kin[29]), .D(n162), .Y(n661) );
  OAI22X1 U753 ( .A(n173), .B(n862), .C(n3), .D(n898), .Y(n659) );
  OAI22X1 U754 ( .A(n188), .B(n881), .C(n184), .D(n875), .Y(n656) );
  NOR2X1 U755 ( .A(n659), .B(n656), .Y(n660) );
  NAND3X1 U756 ( .A(n662), .B(n661), .C(n660), .Y(n663) );
  OR2X2 U757 ( .A(n664), .B(n663), .Y(k_out[41]) );
  AOI22X1 U758 ( .A(kin[54]), .B(n27), .C(kin[28]), .D(n119), .Y(n669) );
  AOI22X1 U759 ( .A(kin[50]), .B(n132), .C(kin[52]), .D(n36), .Y(n668) );
  INVX2 U760 ( .A(kin[48]), .Y(n796) );
  OAI22X1 U761 ( .A(n143), .B(n780), .C(n138), .D(n796), .Y(n666) );
  OAI22X1 U762 ( .A(n149), .B(n890), .C(n146), .D(n755), .Y(n665) );
  NOR2X1 U763 ( .A(n666), .B(n665), .Y(n667) );
  AOI22X1 U764 ( .A(kin[33]), .B(n156), .C(kin[35]), .D(n151), .Y(n674) );
  AOI22X1 U765 ( .A(kin[29]), .B(n163), .C(kin[31]), .D(n162), .Y(n673) );
  OAI22X1 U766 ( .A(n11), .B(n897), .C(n3), .D(n891), .Y(n671) );
  NOR2X1 U767 ( .A(n671), .B(n670), .Y(n672) );
  NAND3X1 U768 ( .A(n674), .B(n673), .C(n672), .Y(n675) );
  OR2X2 U769 ( .A(n676), .B(n675), .Y(k_out[43]) );
  AOI22X1 U770 ( .A(kin[55]), .B(n125), .C(kin[29]), .D(n122), .Y(n681) );
  AOI22X1 U771 ( .A(kin[51]), .B(n135), .C(kin[53]), .D(n129), .Y(n680) );
  INVX2 U772 ( .A(kin[47]), .Y(n918) );
  INVX2 U773 ( .A(kin[49]), .Y(n917) );
  OAI22X1 U774 ( .A(n143), .B(n918), .C(n139), .D(n917), .Y(n678) );
  OAI22X1 U775 ( .A(n755), .B(n117), .C(n148), .D(n889), .Y(n677) );
  NOR2X1 U776 ( .A(n677), .B(n678), .Y(n679) );
  NAND3X1 U777 ( .A(n681), .B(n680), .C(n679), .Y(n689) );
  AOI22X1 U778 ( .A(n682), .B(kin[43]), .C(kin[34]), .D(n64), .Y(n687) );
  AOI22X1 U779 ( .A(kin[36]), .B(n154), .C(kin[30]), .D(n165), .Y(n686) );
  OAI22X1 U780 ( .A(n10), .B(n891), .C(n22), .D(n899), .Y(n684) );
  OAI22X1 U781 ( .A(n184), .B(n898), .C(n112), .D(n869), .Y(n683) );
  NOR2X1 U782 ( .A(n684), .B(n683), .Y(n685) );
  NAND3X1 U783 ( .A(n687), .B(n686), .C(n685), .Y(n688) );
  OR2X2 U784 ( .A(n689), .B(n688), .Y(k_out[44]) );
  AOI22X1 U785 ( .A(kin[28]), .B(n124), .C(kin[30]), .D(n119), .Y(n694) );
  AOI22X1 U786 ( .A(kin[52]), .B(n134), .C(kin[54]), .D(n36), .Y(n693) );
  OAI22X1 U787 ( .A(n142), .B(n796), .C(n138), .D(n795), .Y(n691) );
  OAI22X1 U788 ( .A(n149), .B(n889), .C(n145), .D(n780), .Y(n690) );
  NOR2X1 U789 ( .A(n690), .B(n691), .Y(n692) );
  AOI22X1 U790 ( .A(kin[35]), .B(n64), .C(kin[37]), .D(n152), .Y(n699) );
  AOI22X1 U791 ( .A(kin[31]), .B(n56), .C(kin[33]), .D(n159), .Y(n698) );
  OAI22X1 U792 ( .A(n175), .B(n890), .C(n25), .D(n755), .Y(n696) );
  OAI22X1 U793 ( .A(n189), .B(n862), .C(n183), .D(n897), .Y(n695) );
  NOR2X1 U794 ( .A(n696), .B(n695), .Y(n697) );
  NAND3X1 U795 ( .A(n699), .B(n698), .C(n697), .Y(n700) );
  OR2X2 U796 ( .A(n700), .B(n701), .Y(k_out[45]) );
  AOI22X1 U797 ( .A(kin[29]), .B(n29), .C(kin[31]), .D(n123), .Y(n706) );
  AOI22X1 U798 ( .A(kin[53]), .B(n135), .C(kin[55]), .D(n128), .Y(n705) );
  OAI22X1 U799 ( .A(n142), .B(n917), .C(n138), .D(n916), .Y(n703) );
  OAI22X1 U800 ( .A(n149), .B(n780), .C(n148), .D(n918), .Y(n702) );
  NOR2X1 U801 ( .A(n703), .B(n702), .Y(n704) );
  NAND3X1 U802 ( .A(n706), .B(n705), .C(n704), .Y(n713) );
  AOI22X1 U803 ( .A(kin[36]), .B(n64), .C(kin[38]), .D(n150), .Y(n711) );
  AOI22X1 U804 ( .A(kin[32]), .B(n56), .C(kin[34]), .D(n162), .Y(n710) );
  OAI22X1 U805 ( .A(n176), .B(n755), .C(n25), .D(n889), .Y(n708) );
  OAI22X1 U806 ( .A(n28), .B(n898), .C(n183), .D(n891), .Y(n707) );
  NOR2X1 U807 ( .A(n708), .B(n707), .Y(n709) );
  NAND3X1 U808 ( .A(n711), .B(n710), .C(n709), .Y(n712) );
  OR2X2 U809 ( .A(n713), .B(n712), .Y(k_out[46]) );
  AOI22X1 U810 ( .A(kin[30]), .B(n124), .C(kin[32]), .D(n119), .Y(n718) );
  AOI22X1 U811 ( .A(kin[54]), .B(n133), .C(kin[28]), .D(n131), .Y(n717) );
  OAI22X1 U812 ( .A(n143), .B(n795), .C(n32), .D(n915), .Y(n715) );
  OAI22X1 U813 ( .A(n149), .B(n918), .C(n147), .D(n796), .Y(n714) );
  NOR2X1 U814 ( .A(n715), .B(n714), .Y(n716) );
  AOI22X1 U815 ( .A(kin[46]), .B(n53), .C(kin[37]), .D(n156), .Y(n723) );
  AOI22X1 U816 ( .A(kin[39]), .B(n150), .C(kin[33]), .D(n164), .Y(n722) );
  OAI22X1 U817 ( .A(n10), .B(n889), .C(n189), .D(n897), .Y(n720) );
  OAI22X1 U818 ( .A(n77), .B(n890), .C(n112), .D(n881), .Y(n719) );
  NOR2X1 U819 ( .A(n719), .B(n720), .Y(n721) );
  NAND3X1 U820 ( .A(n722), .B(n721), .C(n723), .Y(n724) );
  OR2X2 U821 ( .A(n725), .B(n724), .Y(k_out[47]) );
  AOI22X1 U822 ( .A(kin[31]), .B(n27), .C(kin[33]), .D(n122), .Y(n730) );
  AOI22X1 U823 ( .A(kin[55]), .B(n132), .C(kin[29]), .D(n36), .Y(n729) );
  OAI22X1 U824 ( .A(n142), .B(n916), .C(n138), .D(n909), .Y(n727) );
  OAI22X1 U825 ( .A(n796), .B(n117), .C(n148), .D(n917), .Y(n726) );
  NOR2X1 U826 ( .A(n727), .B(n726), .Y(n728) );
  NAND3X1 U827 ( .A(n730), .B(n729), .C(n728), .Y(n737) );
  AOI22X1 U828 ( .A(kin[38]), .B(n157), .C(kin[40]), .D(n154), .Y(n735) );
  AOI22X1 U829 ( .A(kin[34]), .B(n165), .C(kin[36]), .D(n162), .Y(n734) );
  OAI22X1 U830 ( .A(n175), .B(n780), .C(n25), .D(n918), .Y(n732) );
  OAI22X1 U831 ( .A(n189), .B(n891), .C(n183), .D(n755), .Y(n731) );
  NOR2X1 U832 ( .A(n732), .B(n731), .Y(n733) );
  NAND3X1 U833 ( .A(n735), .B(n734), .C(n733), .Y(n736) );
  OR2X2 U834 ( .A(n737), .B(n736), .Y(k_out[48]) );
  AOI22X1 U835 ( .A(kin[32]), .B(n27), .C(kin[34]), .D(n120), .Y(n742) );
  AOI22X1 U836 ( .A(kin[28]), .B(n134), .C(kin[30]), .D(n128), .Y(n741) );
  OAI22X1 U837 ( .A(n142), .B(n915), .C(n138), .D(n908), .Y(n739) );
  OAI22X1 U838 ( .A(n917), .B(n117), .C(n795), .D(n148), .Y(n738) );
  NOR2X1 U839 ( .A(n739), .B(n738), .Y(n740) );
  AOI22X1 U840 ( .A(kin[39]), .B(n64), .C(kin[41]), .D(n151), .Y(n747) );
  AOI22X1 U841 ( .A(kin[35]), .B(n57), .C(kin[37]), .D(n161), .Y(n746) );
  OAI22X1 U842 ( .A(n173), .B(n918), .C(n796), .D(n115), .Y(n744) );
  OAI22X1 U843 ( .A(n190), .B(n890), .C(n184), .D(n889), .Y(n743) );
  NOR2X1 U844 ( .A(n744), .B(n743), .Y(n745) );
  NAND3X1 U845 ( .A(n747), .B(n746), .C(n745), .Y(n748) );
  OR2X2 U846 ( .A(n749), .B(n748), .Y(k_out[49]) );
  AOI22X1 U847 ( .A(kin[33]), .B(n29), .C(kin[35]), .D(n119), .Y(n754) );
  AOI22X1 U848 ( .A(kin[29]), .B(n132), .C(kin[31]), .D(n36), .Y(n753) );
  OAI22X1 U849 ( .A(n142), .B(n909), .C(n138), .D(n805), .Y(n751) );
  OAI22X1 U850 ( .A(n795), .B(n117), .C(n148), .D(n916), .Y(n750) );
  NOR2X1 U851 ( .A(n751), .B(n750), .Y(n752) );
  AOI22X1 U852 ( .A(kin[40]), .B(n156), .C(kin[42]), .D(n150), .Y(n760) );
  AOI22X1 U853 ( .A(kin[36]), .B(n57), .C(kin[38]), .D(n159), .Y(n759) );
  OAI22X1 U854 ( .A(n11), .B(n796), .C(n917), .D(n115), .Y(n757) );
  OAI22X1 U855 ( .A(n191), .B(n755), .C(n183), .D(n780), .Y(n756) );
  NOR2X1 U856 ( .A(n757), .B(n756), .Y(n758) );
  NAND3X1 U857 ( .A(n759), .B(n760), .C(n758), .Y(n761) );
  OR2X2 U858 ( .A(n762), .B(n761), .Y(k_out[50]) );
  AOI22X1 U859 ( .A(kin[34]), .B(n27), .C(kin[36]), .D(n121), .Y(n767) );
  AOI22X1 U860 ( .A(kin[30]), .B(n132), .C(kin[32]), .D(n129), .Y(n766) );
  OAI22X1 U861 ( .A(n142), .B(n908), .C(n139), .D(n907), .Y(n764) );
  OAI22X1 U862 ( .A(n916), .B(n117), .C(n146), .D(n915), .Y(n763) );
  NOR2X1 U863 ( .A(n764), .B(n763), .Y(n765) );
  NAND3X1 U864 ( .A(n767), .B(n766), .C(n765), .Y(n774) );
  AOI22X1 U865 ( .A(kin[41]), .B(n157), .C(kin[43]), .D(n150), .Y(n772) );
  AOI22X1 U866 ( .A(kin[37]), .B(n57), .C(kin[39]), .D(n159), .Y(n771) );
  OAI22X1 U867 ( .A(n10), .B(n917), .C(n795), .D(n115), .Y(n769) );
  OAI22X1 U868 ( .A(n188), .B(n889), .C(n183), .D(n918), .Y(n768) );
  NOR2X1 U869 ( .A(n769), .B(n768), .Y(n770) );
  NAND3X1 U870 ( .A(n772), .B(n771), .C(n770), .Y(n773) );
  OR2X2 U871 ( .A(n774), .B(n773), .Y(k_out[51]) );
  AOI22X1 U872 ( .A(kin[35]), .B(n27), .C(kin[37]), .D(n119), .Y(n779) );
  AOI22X1 U873 ( .A(kin[31]), .B(n134), .C(kin[33]), .D(n36), .Y(n778) );
  OAI22X1 U874 ( .A(n141), .B(n805), .C(n138), .D(n788), .Y(n776) );
  OAI22X1 U875 ( .A(n915), .B(n117), .C(n145), .D(n909), .Y(n775) );
  NOR2X1 U876 ( .A(n775), .B(n776), .Y(n777) );
  AOI22X1 U877 ( .A(kin[42]), .B(n156), .C(kin[44]), .D(n152), .Y(n785) );
  AOI22X1 U878 ( .A(kin[38]), .B(n56), .C(kin[40]), .D(n159), .Y(n784) );
  OAI22X1 U879 ( .A(n176), .B(n795), .C(n916), .D(n115), .Y(n782) );
  OAI22X1 U880 ( .A(n22), .B(n780), .C(n8), .D(n796), .Y(n781) );
  NOR2X1 U881 ( .A(n781), .B(n782), .Y(n783) );
  NAND3X1 U882 ( .A(n785), .B(n784), .C(n783), .Y(n786) );
  OR2X2 U883 ( .A(n786), .B(n787), .Y(k_out[52]) );
  AOI22X1 U884 ( .A(kin[37]), .B(n124), .C(kin[39]), .D(n119), .Y(n793) );
  AOI22X1 U885 ( .A(kin[33]), .B(n134), .C(kin[35]), .D(n130), .Y(n792) );
  OAI22X1 U886 ( .A(n143), .B(n788), .C(n138), .D(n883), .Y(n790) );
  OAI22X1 U887 ( .A(n908), .B(n117), .C(n145), .D(n805), .Y(n789) );
  NOR2X1 U888 ( .A(n789), .B(n790), .Y(n791) );
  AOI22X1 U889 ( .A(kin[44]), .B(n158), .C(kin[46]), .D(n153), .Y(n801) );
  AOI22X1 U890 ( .A(kin[40]), .B(n166), .C(kin[42]), .D(n161), .Y(n800) );
  OAI22X1 U891 ( .A(n175), .B(n915), .C(n909), .D(n115), .Y(n798) );
  OAI22X1 U892 ( .A(n188), .B(n796), .C(n77), .D(n795), .Y(n797) );
  NOR2X1 U893 ( .A(n797), .B(n798), .Y(n799) );
  NAND3X1 U894 ( .A(n801), .B(n800), .C(n799), .Y(n802) );
  OR2X2 U895 ( .A(n803), .B(n802), .Y(k_out[54]) );
  AOI22X1 U896 ( .A(kin[38]), .B(n127), .C(kin[40]), .D(n122), .Y(n810) );
  AOI22X1 U897 ( .A(kin[34]), .B(n133), .C(kin[36]), .D(n130), .Y(n809) );
  OAI22X1 U898 ( .A(n143), .B(n906), .C(n139), .D(n869), .Y(n807) );
  OAI22X1 U899 ( .A(n805), .B(n149), .C(n146), .D(n907), .Y(n806) );
  NOR2X1 U900 ( .A(n807), .B(n806), .Y(n808) );
  NAND3X1 U901 ( .A(n810), .B(n809), .C(n808), .Y(n817) );
  AOI22X1 U902 ( .A(kin[45]), .B(n158), .C(kin[47]), .D(n151), .Y(n815) );
  AOI22X1 U903 ( .A(kin[41]), .B(n165), .C(kin[43]), .D(n160), .Y(n814) );
  OAI22X1 U904 ( .A(n11), .B(n909), .C(n168), .D(n908), .Y(n812) );
  OAI22X1 U905 ( .A(n191), .B(n917), .C(n184), .D(n916), .Y(n811) );
  NOR2X1 U906 ( .A(n811), .B(n812), .Y(n813) );
  NAND3X1 U907 ( .A(n815), .B(n814), .C(n813), .Y(n816) );
  OR2X2 U908 ( .A(n817), .B(n816), .Y(k_out[55]) );
  AOI22X1 U909 ( .A(n27), .B(kin[0]), .C(n121), .D(kin[2]), .Y(n822) );
  AOI22X1 U910 ( .A(n136), .B(kin[24]), .C(n131), .D(kin[26]), .Y(n821) );
  OAI22X1 U911 ( .A(n81), .B(n855), .C(n854), .D(n31), .Y(n819) );
  OAI22X1 U912 ( .A(n837), .B(n149), .C(n6), .D(n856), .Y(n818) );
  NOR2X1 U913 ( .A(n819), .B(n818), .Y(n820) );
  NAND3X1 U914 ( .A(n822), .B(n821), .C(n820), .Y(n950) );
  AOI22X1 U915 ( .A(kin[7]), .B(n158), .C(kin[9]), .D(n151), .Y(n828) );
  AOI22X1 U916 ( .A(kin[3]), .B(n167), .C(kin[5]), .D(n160), .Y(n827) );
  OAI22X1 U917 ( .A(n34), .B(n838), .C(n24), .D(n823), .Y(n825) );
  OAI22X1 U918 ( .A(n192), .B(n929), .C(n60), .D(n927), .Y(n824) );
  NOR2X1 U919 ( .A(n825), .B(n824), .Y(n826) );
  NAND3X1 U920 ( .A(n828), .B(n827), .C(n826), .Y(n949) );
  AOI22X1 U921 ( .A(n126), .B(kin[4]), .C(n121), .D(kin[6]), .Y(n835) );
  AOI22X1 U922 ( .A(n136), .B(kin[0]), .C(n131), .D(kin[2]), .Y(n834) );
  OAI22X1 U923 ( .A(n847), .B(n81), .C(n829), .D(n31), .Y(n832) );
  OAI22X1 U924 ( .A(n830), .B(n117), .C(n854), .D(n6), .Y(n831) );
  NOR2X1 U925 ( .A(n832), .B(n831), .Y(n833) );
  NAND3X1 U926 ( .A(n835), .B(n834), .C(n833), .Y(n952) );
  AOI22X1 U927 ( .A(kin[11]), .B(n158), .C(kin[13]), .D(n151), .Y(n843) );
  AOI22X1 U928 ( .A(kin[7]), .B(n167), .C(kin[9]), .D(n160), .Y(n842) );
  OAI22X1 U929 ( .A(n34), .B(n836), .C(n24), .D(n855), .Y(n840) );
  OAI22X1 U930 ( .A(n192), .B(n838), .C(n60), .D(n837), .Y(n839) );
  NOR2X1 U931 ( .A(n840), .B(n839), .Y(n841) );
  NAND3X1 U932 ( .A(n843), .B(n842), .C(n841), .Y(n951) );
  AOI22X1 U933 ( .A(n126), .B(kin[7]), .C(kin[9]), .D(n121), .Y(n852) );
  AOI22X1 U934 ( .A(kin[3]), .B(n136), .C(kin[5]), .D(n131), .Y(n851) );
  OAI22X1 U935 ( .A(n81), .B(n845), .C(n31), .D(n844), .Y(n849) );
  OAI22X1 U936 ( .A(n847), .B(n117), .C(n6), .D(n846), .Y(n848) );
  NOR2X1 U937 ( .A(n849), .B(n848), .Y(n850) );
  NAND3X1 U938 ( .A(n852), .B(n851), .C(n850), .Y(n954) );
  AOI22X1 U939 ( .A(kin[14]), .B(n158), .C(kin[16]), .D(n151), .Y(n861) );
  AOI22X1 U940 ( .A(kin[10]), .B(n167), .C(kin[12]), .D(n160), .Y(n860) );
  OAI22X1 U941 ( .A(n854), .B(n34), .C(n24), .D(n853), .Y(n858) );
  OAI22X1 U942 ( .A(n192), .B(n856), .C(n60), .D(n855), .Y(n857) );
  NOR2X1 U943 ( .A(n858), .B(n857), .Y(n859) );
  NAND3X1 U944 ( .A(n861), .B(n860), .C(n859), .Y(n953) );
  AOI22X1 U945 ( .A(kin[45]), .B(n126), .C(kin[47]), .D(n121), .Y(n868) );
  AOI22X1 U946 ( .A(kin[41]), .B(n136), .C(kin[43]), .D(n131), .Y(n867) );
  OAI22X1 U947 ( .A(n81), .B(n875), .C(n31), .D(n862), .Y(n865) );
  OAI22X1 U948 ( .A(n149), .B(n863), .C(n6), .D(n881), .Y(n864) );
  NOR2X1 U949 ( .A(n865), .B(n864), .Y(n866) );
  NAND3X1 U950 ( .A(n868), .B(n867), .C(n866), .Y(n956) );
  AOI22X1 U951 ( .A(kin[52]), .B(n158), .C(kin[54]), .D(n151), .Y(n874) );
  AOI22X1 U952 ( .A(kin[48]), .B(n167), .C(kin[50]), .D(n160), .Y(n873) );
  OAI22X1 U953 ( .A(n5), .B(n869), .C(n24), .D(n882), .Y(n871) );
  OAI22X1 U954 ( .A(n188), .B(n907), .C(n60), .D(n906), .Y(n870) );
  NOR2X1 U955 ( .A(n871), .B(n870), .Y(n872) );
  NAND3X1 U956 ( .A(n874), .B(n873), .C(n872), .Y(n955) );
  AOI22X1 U957 ( .A(kin[48]), .B(n126), .C(kin[50]), .D(n121), .Y(n880) );
  AOI22X1 U958 ( .A(kin[44]), .B(n136), .C(kin[46]), .D(n131), .Y(n879) );
  OAI22X1 U959 ( .A(n81), .B(n898), .C(n31), .D(n891), .Y(n877) );
  OAI22X1 U960 ( .A(n117), .B(n875), .C(n6), .D(n899), .Y(n876) );
  NOR2X1 U961 ( .A(n877), .B(n876), .Y(n878) );
  NAND3X1 U962 ( .A(n880), .B(n879), .C(n878), .Y(n958) );
  AOI22X1 U963 ( .A(kin[55]), .B(n158), .C(kin[29]), .D(n151), .Y(n888) );
  AOI22X1 U964 ( .A(kin[51]), .B(n167), .C(kin[53]), .D(n160), .Y(n887) );
  OAI22X1 U965 ( .A(n5), .B(n881), .C(n24), .D(n900), .Y(n885) );
  OAI22X1 U966 ( .A(n188), .B(n883), .C(n60), .D(n882), .Y(n884) );
  NOR2X1 U967 ( .A(n885), .B(n884), .Y(n886) );
  NAND3X1 U968 ( .A(n888), .B(n887), .C(n886), .Y(n957) );
  AOI22X1 U969 ( .A(kin[53]), .B(n126), .C(kin[55]), .D(n121), .Y(n896) );
  AOI22X1 U970 ( .A(kin[49]), .B(n136), .C(kin[51]), .D(n36), .Y(n895) );
  OAI22X1 U971 ( .A(n81), .B(n889), .C(n31), .D(n918), .Y(n893) );
  OAI22X1 U972 ( .A(n117), .B(n891), .C(n6), .D(n890), .Y(n892) );
  NOR2X1 U973 ( .A(n893), .B(n892), .Y(n894) );
  NAND3X1 U974 ( .A(n896), .B(n895), .C(n894), .Y(n960) );
  AOI22X1 U975 ( .A(kin[32]), .B(n158), .C(kin[34]), .D(n151), .Y(n905) );
  AOI22X1 U976 ( .A(kin[28]), .B(n167), .C(kin[30]), .D(n160), .Y(n904) );
  OAI22X1 U977 ( .A(n34), .B(n898), .C(n24), .D(n897), .Y(n902) );
  OAI22X1 U978 ( .A(n192), .B(n900), .C(n60), .D(n899), .Y(n901) );
  NOR2X1 U979 ( .A(n902), .B(n901), .Y(n903) );
  NAND3X1 U980 ( .A(n905), .B(n904), .C(n903), .Y(n959) );
  AOI22X1 U981 ( .A(kin[36]), .B(n126), .C(kin[38]), .D(n121), .Y(n914) );
  AOI22X1 U982 ( .A(kin[32]), .B(n136), .C(kin[34]), .D(n131), .Y(n913) );
  OAI22X1 U983 ( .A(n81), .B(n907), .C(n31), .D(n906), .Y(n911) );
  OAI22X1 U984 ( .A(n117), .B(n909), .C(n6), .D(n908), .Y(n910) );
  NOR2X1 U985 ( .A(n911), .B(n910), .Y(n912) );
  NAND3X1 U986 ( .A(n914), .B(n913), .C(n912), .Y(n962) );
  AOI22X1 U987 ( .A(kin[43]), .B(n158), .C(kin[45]), .D(n151), .Y(n923) );
  AOI22X1 U988 ( .A(kin[39]), .B(n167), .C(kin[41]), .D(n160), .Y(n922) );
  OAI22X1 U989 ( .A(n34), .B(n916), .C(n24), .D(n915), .Y(n920) );
  OAI22X1 U990 ( .A(n192), .B(n918), .C(n60), .D(n917), .Y(n919) );
  NOR2X1 U991 ( .A(n920), .B(n919), .Y(n921) );
  NAND3X1 U992 ( .A(n923), .B(n922), .C(n921), .Y(n961) );
  AOI22X1 U993 ( .A(kin[19]), .B(n126), .C(kin[21]), .D(n121), .Y(n938) );
  AOI22X1 U994 ( .A(kin[15]), .B(n136), .C(kin[17]), .D(n131), .Y(n937) );
  OAI22X1 U995 ( .A(n81), .B(n929), .C(n31), .D(n927), .Y(n935) );
  OAI22X1 U996 ( .A(n149), .B(n933), .C(n6), .D(n931), .Y(n934) );
  NOR2X1 U997 ( .A(n935), .B(n934), .Y(n936) );
  NAND3X1 U998 ( .A(n938), .B(n937), .C(n936), .Y(n964) );
  AOI22X1 U999 ( .A(kin[26]), .B(n158), .C(kin[0]), .D(n151), .Y(n948) );
  AOI22X1 U1000 ( .A(kin[22]), .B(n167), .C(kin[24]), .D(n160), .Y(n947) );
  OAI22X1 U1001 ( .A(n34), .B(n941), .C(n24), .D(n940), .Y(n945) );
  OAI22X1 U1002 ( .A(n188), .B(n943), .C(n60), .D(n942), .Y(n944) );
  NOR2X1 U1003 ( .A(n945), .B(n944), .Y(n946) );
  NAND3X1 U1004 ( .A(n948), .B(n947), .C(n946), .Y(n963) );
endmodule


module key_permutation2_0 ( kin, kout );
  input [55:0] kin;
  output [47:0] kout;
  wire   \kin[31] , \kin[28] , \kin[35] , \kin[49] , \kin[41] , \kin[45] ,
         \kin[52] , \kin[33] , \kin[55] , \kin[38] , \kin[48] , \kin[43] ,
         \kin[47] , \kin[32] , \kin[44] , \kin[50] , \kin[39] , \kin[29] ,
         \kin[54] , \kin[46] , \kin[36] , \kin[30] , \kin[51] , \kin[40] ,
         \kin[1] , \kin[12] , \kin[19] , \kin[26] , \kin[6] , \kin[15] ,
         \kin[7] , \kin[25] , \kin[3] , \kin[11] , \kin[18] , \kin[22] ,
         \kin[9] , \kin[20] , \kin[5] , \kin[14] , \kin[27] , \kin[2] ,
         \kin[4] , \kin[0] , \kin[23] , \kin[10] , \kin[16] , \kin[13] ;
  assign kout[47] = \kin[31] ;
  assign \kin[31]  = kin[31];
  assign kout[46] = \kin[28] ;
  assign \kin[28]  = kin[28];
  assign kout[45] = \kin[35] ;
  assign \kin[35]  = kin[35];
  assign kout[44] = \kin[49] ;
  assign \kin[49]  = kin[49];
  assign kout[43] = \kin[41] ;
  assign \kin[41]  = kin[41];
  assign kout[42] = \kin[45] ;
  assign \kin[45]  = kin[45];
  assign kout[41] = \kin[52] ;
  assign \kin[52]  = kin[52];
  assign kout[40] = \kin[33] ;
  assign \kin[33]  = kin[33];
  assign kout[39] = \kin[55] ;
  assign \kin[55]  = kin[55];
  assign kout[38] = \kin[38] ;
  assign \kin[38]  = kin[38];
  assign kout[37] = \kin[48] ;
  assign \kin[48]  = kin[48];
  assign kout[36] = \kin[43] ;
  assign \kin[43]  = kin[43];
  assign kout[35] = \kin[47] ;
  assign \kin[47]  = kin[47];
  assign kout[34] = \kin[32] ;
  assign \kin[32]  = kin[32];
  assign kout[33] = \kin[44] ;
  assign \kin[44]  = kin[44];
  assign kout[32] = \kin[50] ;
  assign \kin[50]  = kin[50];
  assign kout[31] = \kin[39] ;
  assign \kin[39]  = kin[39];
  assign kout[30] = \kin[29] ;
  assign \kin[29]  = kin[29];
  assign kout[29] = \kin[54] ;
  assign \kin[54]  = kin[54];
  assign kout[28] = \kin[46] ;
  assign \kin[46]  = kin[46];
  assign kout[27] = \kin[36] ;
  assign \kin[36]  = kin[36];
  assign kout[26] = \kin[30] ;
  assign \kin[30]  = kin[30];
  assign kout[25] = \kin[51] ;
  assign \kin[51]  = kin[51];
  assign kout[24] = \kin[40] ;
  assign \kin[40]  = kin[40];
  assign kout[23] = \kin[1] ;
  assign \kin[1]  = kin[1];
  assign kout[22] = \kin[12] ;
  assign \kin[12]  = kin[12];
  assign kout[21] = \kin[19] ;
  assign \kin[19]  = kin[19];
  assign kout[20] = \kin[26] ;
  assign \kin[26]  = kin[26];
  assign kout[19] = \kin[6] ;
  assign \kin[6]  = kin[6];
  assign kout[18] = \kin[15] ;
  assign \kin[15]  = kin[15];
  assign kout[17] = \kin[7] ;
  assign \kin[7]  = kin[7];
  assign kout[16] = \kin[25] ;
  assign \kin[25]  = kin[25];
  assign kout[15] = \kin[3] ;
  assign \kin[3]  = kin[3];
  assign kout[14] = \kin[11] ;
  assign \kin[11]  = kin[11];
  assign kout[13] = \kin[18] ;
  assign \kin[18]  = kin[18];
  assign kout[12] = \kin[22] ;
  assign \kin[22]  = kin[22];
  assign kout[11] = \kin[9] ;
  assign \kin[9]  = kin[9];
  assign kout[10] = \kin[20] ;
  assign \kin[20]  = kin[20];
  assign kout[9] = \kin[5] ;
  assign \kin[5]  = kin[5];
  assign kout[8] = \kin[14] ;
  assign \kin[14]  = kin[14];
  assign kout[7] = \kin[27] ;
  assign \kin[27]  = kin[27];
  assign kout[6] = \kin[2] ;
  assign \kin[2]  = kin[2];
  assign kout[5] = \kin[4] ;
  assign \kin[4]  = kin[4];
  assign kout[4] = \kin[0] ;
  assign \kin[0]  = kin[0];
  assign kout[3] = \kin[23] ;
  assign \kin[23]  = kin[23];
  assign kout[2] = \kin[10] ;
  assign \kin[10]  = kin[10];
  assign kout[1] = \kin[16] ;
  assign \kin[16]  = kin[16];
  assign kout[0] = \kin[13] ;
  assign \kin[13]  = kin[13];

endmodule


module key_wrapper_0 ( key_in, round_number, kout );
  input [63:0] key_in;
  input [4:0] round_number;
  output [47:0] kout;

  wire   [55:0] k_p1toshift;
  wire   [55:0] k_shifttop2;

  key_permutation1_0 KEY_PREMUTATION1 ( .k_o(key_in), .kout(k_p1toshift) );
  key_shift_0 KEY_SHIFT ( .kin(k_p1toshift), .k_out(k_shifttop2), .roundSel(
        round_number) );
  key_permutation2_0 KEY_PERMUTATION2 ( .kin(k_shifttop2), .kout(kout) );
endmodule


module key_xor_0 ( data, key, out );
  input [47:0] data;
  input [47:0] key;
  output [47:0] out;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n18, n19, n20, n21, n23, n24, n25, n26, n27, n28, n29, n30, n31;

  XOR2X1 U1 ( .A(key[23]), .B(n1), .Y(out[23]) );
  INVX8 U2 ( .A(n31), .Y(n1) );
  XOR2X1 U3 ( .A(key[47]), .B(n2), .Y(out[47]) );
  INVX8 U4 ( .A(n15), .Y(n2) );
  XNOR2X1 U5 ( .A(key[6]), .B(n3), .Y(out[6]) );
  INVX8 U6 ( .A(data[6]), .Y(n3) );
  INVX4 U7 ( .A(n7), .Y(out[27]) );
  INVX2 U8 ( .A(data[15]), .Y(n4) );
  INVX2 U9 ( .A(data[14]), .Y(n12) );
  INVX2 U10 ( .A(data[17]), .Y(n26) );
  INVX2 U11 ( .A(data[18]), .Y(n28) );
  INVX2 U12 ( .A(data[21]), .Y(n9) );
  INVX2 U13 ( .A(data[26]), .Y(n24) );
  INVX2 U14 ( .A(data[24]), .Y(n25) );
  INVX2 U15 ( .A(data[44]), .Y(n14) );
  INVX2 U16 ( .A(data[35]), .Y(n19) );
  INVX2 U17 ( .A(data[30]), .Y(n16) );
  INVX2 U18 ( .A(data[16]), .Y(n10) );
  INVX2 U19 ( .A(data[1]), .Y(n6) );
  INVX2 U20 ( .A(data[3]), .Y(n21) );
  INVX2 U21 ( .A(data[37]), .Y(n18) );
  INVX2 U22 ( .A(data[11]), .Y(n29) );
  INVX2 U23 ( .A(data[5]), .Y(n13) );
  INVX2 U24 ( .A(data[39]), .Y(n11) );
  INVX2 U25 ( .A(data[29]), .Y(n20) );
  XOR2X1 U26 ( .A(key[42]), .B(data[42]), .Y(out[42]) );
  XNOR2X1 U27 ( .A(key[45]), .B(data[45]), .Y(n27) );
  XNOR2X1 U28 ( .A(key[15]), .B(n4), .Y(out[15]) );
  XNOR2X1 U29 ( .A(key[46]), .B(n5), .Y(out[46]) );
  INVX8 U30 ( .A(data[46]), .Y(n5) );
  XNOR2X1 U31 ( .A(key[29]), .B(n20), .Y(out[29]) );
  XOR2X1 U32 ( .A(key[9]), .B(data[9]), .Y(out[9]) );
  XNOR2X1 U33 ( .A(key[1]), .B(n6), .Y(out[1]) );
  XNOR2X1 U34 ( .A(key[27]), .B(data[27]), .Y(n7) );
  XNOR2X1 U35 ( .A(key[19]), .B(n8), .Y(out[19]) );
  INVX8 U36 ( .A(data[19]), .Y(n8) );
  XNOR2X1 U37 ( .A(key[21]), .B(n9), .Y(out[21]) );
  XNOR2X1 U38 ( .A(key[16]), .B(n10), .Y(out[16]) );
  XOR2X1 U39 ( .A(key[0]), .B(data[0]), .Y(out[0]) );
  XNOR2X1 U40 ( .A(key[39]), .B(n11), .Y(out[39]) );
  XOR2X1 U41 ( .A(key[22]), .B(data[22]), .Y(out[22]) );
  XNOR2X1 U42 ( .A(key[14]), .B(n12), .Y(out[14]) );
  XNOR2X1 U43 ( .A(key[5]), .B(n13), .Y(out[5]) );
  XNOR2X1 U44 ( .A(key[44]), .B(n14), .Y(out[44]) );
  INVX8 U45 ( .A(data[47]), .Y(n15) );
  XOR2X1 U46 ( .A(key[12]), .B(data[12]), .Y(out[12]) );
  XNOR2X1 U47 ( .A(key[30]), .B(n16), .Y(out[30]) );
  XOR2X1 U48 ( .A(key[40]), .B(data[40]), .Y(out[40]) );
  XNOR2X1 U49 ( .A(key[37]), .B(n18), .Y(out[37]) );
  XNOR2X1 U50 ( .A(key[35]), .B(n19), .Y(out[35]) );
  XNOR2X1 U51 ( .A(key[3]), .B(n21), .Y(out[3]) );
  XOR2X1 U52 ( .A(key[41]), .B(data[41]), .Y(out[41]) );
  XNOR2X1 U53 ( .A(key[7]), .B(n23), .Y(out[7]) );
  INVX8 U54 ( .A(data[7]), .Y(n23) );
  XNOR2X1 U55 ( .A(key[26]), .B(n24), .Y(out[26]) );
  XNOR2X1 U56 ( .A(key[24]), .B(n25), .Y(out[24]) );
  INVX4 U57 ( .A(n27), .Y(out[45]) );
  XNOR2X1 U58 ( .A(key[17]), .B(n26), .Y(out[17]) );
  XNOR2X1 U59 ( .A(key[18]), .B(n28), .Y(out[18]) );
  XNOR2X1 U60 ( .A(key[11]), .B(n29), .Y(out[11]) );
  INVX4 U61 ( .A(n30), .Y(out[36]) );
  XNOR2X1 U62 ( .A(key[36]), .B(data[36]), .Y(n30) );
  INVX8 U63 ( .A(data[23]), .Y(n31) );
  XOR2X1 U64 ( .A(key[2]), .B(data[2]), .Y(out[2]) );
  XOR2X1 U65 ( .A(key[4]), .B(data[4]), .Y(out[4]) );
  XOR2X1 U66 ( .A(key[8]), .B(data[8]), .Y(out[8]) );
  XOR2X1 U67 ( .A(key[10]), .B(data[10]), .Y(out[10]) );
  XOR2X1 U68 ( .A(key[13]), .B(data[13]), .Y(out[13]) );
  XOR2X1 U69 ( .A(key[20]), .B(data[20]), .Y(out[20]) );
  XOR2X1 U70 ( .A(key[25]), .B(data[25]), .Y(out[25]) );
  XOR2X1 U71 ( .A(key[28]), .B(data[28]), .Y(out[28]) );
  XOR2X1 U72 ( .A(key[31]), .B(data[31]), .Y(out[31]) );
  XOR2X1 U73 ( .A(key[32]), .B(data[32]), .Y(out[32]) );
  XOR2X1 U74 ( .A(key[33]), .B(data[33]), .Y(out[33]) );
  XOR2X1 U75 ( .A(key[34]), .B(data[34]), .Y(out[34]) );
  XOR2X1 U76 ( .A(key[38]), .B(data[38]), .Y(out[38]) );
  XOR2X1 U77 ( .A(key[43]), .B(data[43]), .Y(out[43]) );
endmodule


module Sbox1_0 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N48, N129, N165, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157;
  assign data_out[3] = N48;
  assign data_out[1] = N129;
  assign data_out[0] = N165;

  BUFX2 U1 ( .A(n3), .Y(n1) );
  INVX1 U2 ( .A(n51), .Y(n2) );
  INVX2 U3 ( .A(n24), .Y(n3) );
  INVX4 U4 ( .A(data_in[3]), .Y(n140) );
  INVX1 U5 ( .A(n31), .Y(n4) );
  BUFX2 U6 ( .A(data_in[2]), .Y(n44) );
  INVX2 U7 ( .A(n44), .Y(n121) );
  AND2X1 U8 ( .A(n50), .B(n45), .Y(n5) );
  AND2X2 U9 ( .A(n2), .B(n140), .Y(n6) );
  INVX1 U10 ( .A(n136), .Y(n123) );
  BUFX2 U11 ( .A(n135), .Y(n43) );
  AND2X1 U12 ( .A(n123), .B(n50), .Y(n7) );
  BUFX4 U13 ( .A(n51), .Y(n8) );
  INVX2 U14 ( .A(data_in[4]), .Y(n51) );
  BUFX2 U15 ( .A(n41), .Y(n9) );
  INVX1 U16 ( .A(data_in[0]), .Y(n10) );
  INVX1 U17 ( .A(n38), .Y(n11) );
  INVX4 U18 ( .A(data_in[1]), .Y(n49) );
  AND2X2 U19 ( .A(n7), .B(n57), .Y(n61) );
  AND2X2 U20 ( .A(n50), .B(n43), .Y(n74) );
  INVX1 U21 ( .A(n135), .Y(n12) );
  OR2X2 U22 ( .A(n114), .B(data_in[5]), .Y(n87) );
  INVX2 U23 ( .A(data_in[5]), .Y(n99) );
  BUFX2 U24 ( .A(data_in[4]), .Y(n21) );
  INVX2 U25 ( .A(data_in[0]), .Y(n114) );
  INVX2 U26 ( .A(n110), .Y(n13) );
  INVX1 U27 ( .A(n45), .Y(n20) );
  BUFX2 U28 ( .A(data_in[0]), .Y(n48) );
  BUFX4 U29 ( .A(n18), .Y(n14) );
  BUFX2 U30 ( .A(n48), .Y(n35) );
  INVX2 U31 ( .A(data_in[5]), .Y(n15) );
  BUFX4 U32 ( .A(n87), .Y(n38) );
  INVX2 U33 ( .A(n27), .Y(n16) );
  INVX4 U34 ( .A(n99), .Y(n27) );
  AND2X2 U35 ( .A(n50), .B(n121), .Y(n17) );
  INVX2 U36 ( .A(n17), .Y(n131) );
  AND2X2 U37 ( .A(n132), .B(n4), .Y(n42) );
  AND2X2 U38 ( .A(n66), .B(n24), .Y(n18) );
  INVX1 U39 ( .A(n18), .Y(n148) );
  INVX1 U40 ( .A(n46), .Y(n65) );
  INVX4 U41 ( .A(n46), .Y(n147) );
  INVX1 U42 ( .A(n99), .Y(n19) );
  INVX2 U43 ( .A(n140), .Y(n29) );
  BUFX2 U44 ( .A(n121), .Y(n22) );
  INVX8 U45 ( .A(n49), .Y(n50) );
  OR2X2 U46 ( .A(n24), .B(n136), .Y(n116) );
  BUFX2 U47 ( .A(n135), .Y(n23) );
  BUFX2 U48 ( .A(n51), .Y(n24) );
  BUFX2 U49 ( .A(n94), .Y(n25) );
  NAND2X1 U50 ( .A(n29), .B(n8), .Y(n26) );
  INVX1 U51 ( .A(data_in[3]), .Y(n39) );
  AND2X1 U52 ( .A(n131), .B(n132), .Y(n28) );
  INVX1 U53 ( .A(n113), .Y(n115) );
  INVX1 U54 ( .A(n113), .Y(n53) );
  BUFX2 U55 ( .A(n33), .Y(n30) );
  INVX1 U56 ( .A(n129), .Y(n86) );
  BUFX2 U57 ( .A(n17), .Y(n31) );
  BUFX2 U58 ( .A(n143), .Y(n32) );
  INVX2 U59 ( .A(n94), .Y(n143) );
  INVX2 U60 ( .A(n108), .Y(n81) );
  INVX2 U61 ( .A(n43), .Y(n36) );
  NOR2X1 U62 ( .A(n145), .B(n45), .Y(n33) );
  INVX2 U63 ( .A(n145), .Y(n150) );
  BUFX2 U64 ( .A(n123), .Y(n34) );
  NAND2X1 U65 ( .A(n133), .B(n5), .Y(n59) );
  NAND2X1 U66 ( .A(n36), .B(n28), .Y(n37) );
  NAND2X1 U67 ( .A(n37), .B(n110), .Y(n111) );
  INVX1 U68 ( .A(n87), .Y(n133) );
  BUFX4 U69 ( .A(data_in[2]), .Y(n45) );
  INVX4 U70 ( .A(n6), .Y(n46) );
  NAND2X1 U71 ( .A(data_in[5]), .B(data_in[0]), .Y(n40) );
  AND2X2 U72 ( .A(n45), .B(n66), .Y(n41) );
  BUFX2 U73 ( .A(n10), .Y(n47) );
  INVX1 U74 ( .A(n40), .Y(n52) );
  NAND2X1 U75 ( .A(data_in[3]), .B(n121), .Y(n108) );
  NAND2X1 U76 ( .A(n15), .B(n10), .Y(n135) );
  NAND3X1 U77 ( .A(n81), .B(n12), .C(n50), .Y(n56) );
  NAND2X1 U78 ( .A(n29), .B(n8), .Y(n113) );
  NAND2X1 U79 ( .A(data_in[5]), .B(data_in[0]), .Y(n145) );
  NAND3X1 U80 ( .A(n53), .B(n52), .C(n50), .Y(n55) );
  NAND2X1 U81 ( .A(data_in[5]), .B(n114), .Y(n94) );
  NAND2X1 U82 ( .A(n87), .B(n94), .Y(n146) );
  NAND3X1 U83 ( .A(n18), .B(n17), .C(n146), .Y(n54) );
  NAND3X1 U84 ( .A(n55), .B(n54), .C(n56), .Y(n62) );
  NAND2X1 U85 ( .A(n44), .B(data_in[3]), .Y(n136) );
  OAI21X1 U86 ( .A(n3), .B(n16), .C(n40), .Y(n57) );
  NAND2X1 U87 ( .A(n30), .B(n147), .Y(n58) );
  OAI21X1 U88 ( .A(n46), .B(n59), .C(n58), .Y(n60) );
  NOR3X1 U89 ( .A(n61), .B(n62), .C(n60), .Y(n79) );
  INVX2 U90 ( .A(n50), .Y(n107) );
  NAND2X1 U91 ( .A(n81), .B(n143), .Y(n106) );
  NAND2X1 U92 ( .A(n3), .B(n143), .Y(n85) );
  AND2X2 U93 ( .A(n106), .B(n85), .Y(n69) );
  NOR2X1 U94 ( .A(n19), .B(n20), .Y(n64) );
  NOR2X1 U95 ( .A(n45), .B(n48), .Y(n63) );
  MUX2X1 U96 ( .B(n64), .A(n63), .S(n3), .Y(n68) );
  INVX2 U97 ( .A(data_in[3]), .Y(n66) );
  AOI22X1 U98 ( .A(n30), .B(n39), .C(n65), .D(n27), .Y(n67) );
  NAND3X1 U99 ( .A(n69), .B(n68), .C(n67), .Y(n70) );
  NAND2X1 U100 ( .A(n70), .B(n107), .Y(n78) );
  NAND2X1 U101 ( .A(n143), .B(n41), .Y(n134) );
  OAI21X1 U102 ( .A(n27), .B(n108), .C(n134), .Y(n76) );
  NAND2X1 U103 ( .A(n38), .B(n107), .Y(n71) );
  NAND3X1 U104 ( .A(n1), .B(n29), .C(n71), .Y(n73) );
  AOI22X1 U105 ( .A(n34), .B(n35), .C(n12), .D(n9), .Y(n72) );
  OAI22X1 U106 ( .A(n74), .B(n73), .C(n72), .D(n21), .Y(n75) );
  AOI21X1 U107 ( .A(n21), .B(n76), .C(n75), .Y(n77) );
  NAND3X1 U108 ( .A(n79), .B(n78), .C(n77), .Y(N165) );
  NOR2X1 U109 ( .A(n27), .B(n46), .Y(n82) );
  OAI21X1 U110 ( .A(n21), .B(n27), .C(n85), .Y(n80) );
  AOI22X1 U111 ( .A(n82), .B(n22), .C(n81), .D(n80), .Y(n105) );
  NAND3X1 U112 ( .A(n50), .B(n150), .C(n45), .Y(n83) );
  OAI21X1 U113 ( .A(n131), .B(n38), .C(n83), .Y(n109) );
  NAND2X1 U114 ( .A(n147), .B(n45), .Y(n98) );
  INVX2 U115 ( .A(n98), .Y(n84) );
  AOI22X1 U116 ( .A(n13), .B(n8), .C(n84), .D(n150), .Y(n104) );
  OAI21X1 U117 ( .A(n45), .B(n85), .C(n107), .Y(n102) );
  NAND2X1 U118 ( .A(n18), .B(n33), .Y(n129) );
  AOI21X1 U119 ( .A(n147), .B(n36), .C(n86), .Y(n93) );
  MUX2X1 U120 ( .B(n23), .A(n38), .S(n41), .Y(n91) );
  OAI21X1 U121 ( .A(n25), .B(n20), .C(n8), .Y(n90) );
  AOI21X1 U122 ( .A(n150), .B(n29), .C(n8), .Y(n88) );
  OAI21X1 U123 ( .A(n47), .B(n116), .C(n88), .Y(n89) );
  OAI21X1 U124 ( .A(n90), .B(n91), .C(n89), .Y(n92) );
  NAND2X1 U125 ( .A(n93), .B(n92), .Y(n101) );
  OAI21X1 U126 ( .A(n25), .B(n26), .C(n50), .Y(n96) );
  OAI22X1 U127 ( .A(n47), .B(n46), .C(n23), .D(n116), .Y(n95) );
  NOR2X1 U128 ( .A(n96), .B(n95), .Y(n97) );
  OAI21X1 U129 ( .A(n16), .B(n98), .C(n97), .Y(n100) );
  OAI21X1 U130 ( .A(n102), .B(n101), .C(n100), .Y(n103) );
  NAND3X1 U131 ( .A(n105), .B(n104), .C(n103), .Y(N129) );
  INVX2 U132 ( .A(n106), .Y(n112) );
  NAND2X1 U133 ( .A(n108), .B(n107), .Y(n132) );
  INVX2 U134 ( .A(n109), .Y(n110) );
  MUX2X1 U135 ( .B(n112), .A(n111), .S(n21), .Y(n130) );
  AOI22X1 U136 ( .A(n115), .B(n133), .C(n14), .D(n47), .Y(n120) );
  OAI21X1 U137 ( .A(n39), .B(n8), .C(n20), .Y(n117) );
  NAND2X1 U138 ( .A(n116), .B(n117), .Y(n118) );
  MUX2X1 U139 ( .B(n9), .A(n118), .S(n19), .Y(n119) );
  NAND2X1 U140 ( .A(n119), .B(n120), .Y(n127) );
  NOR2X1 U141 ( .A(n3), .B(n23), .Y(n122) );
  AOI22X1 U142 ( .A(n122), .B(n22), .C(n11), .D(n14), .Y(n125) );
  AOI22X1 U143 ( .A(n147), .B(n32), .C(n150), .D(n34), .Y(n124) );
  NAND2X1 U144 ( .A(n124), .B(n125), .Y(n126) );
  MUX2X1 U145 ( .B(n127), .A(n126), .S(n50), .Y(n128) );
  NAND3X1 U146 ( .A(n129), .B(n130), .C(n128), .Y(data_out[2]) );
  MUX2X1 U147 ( .B(n133), .A(n12), .S(n50), .Y(n141) );
  INVX2 U148 ( .A(n134), .Y(n138) );
  OAI21X1 U149 ( .A(n43), .B(n136), .C(n8), .Y(n137) );
  NOR2X1 U150 ( .A(n138), .B(n137), .Y(n139) );
  OAI21X1 U151 ( .A(n66), .B(n141), .C(n139), .Y(n142) );
  AOI21X1 U152 ( .A(n42), .B(n32), .C(n142), .Y(n157) );
  AOI21X1 U153 ( .A(n35), .B(n42), .C(n8), .Y(n156) );
  MUX2X1 U154 ( .B(n21), .A(n14), .S(n35), .Y(n144) );
  OAI21X1 U155 ( .A(n21), .B(n40), .C(n144), .Y(n154) );
  NAND2X1 U156 ( .A(n147), .B(n146), .Y(n152) );
  MUX2X1 U157 ( .B(n148), .A(n46), .S(n50), .Y(n149) );
  OAI21X1 U158 ( .A(n36), .B(n150), .C(n149), .Y(n151) );
  OAI21X1 U159 ( .A(n50), .B(n152), .C(n151), .Y(n153) );
  AOI21X1 U160 ( .A(n31), .B(n154), .C(n153), .Y(n155) );
  OAI21X1 U161 ( .A(n157), .B(n156), .C(n155), .Y(N48) );
endmodule


module Sbox2_0 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N62, N106, N138, N163, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128;
  assign data_out[3] = N62;
  assign data_out[2] = N106;
  assign data_out[1] = N138;
  assign data_out[0] = N163;

  INVX4 U1 ( .A(n81), .Y(n110) );
  INVX2 U2 ( .A(n110), .Y(n12) );
  BUFX4 U3 ( .A(n108), .Y(n1) );
  BUFX2 U4 ( .A(n17), .Y(n2) );
  INVX4 U5 ( .A(n9), .Y(n11) );
  INVX4 U6 ( .A(n33), .Y(n9) );
  INVX1 U7 ( .A(n113), .Y(n3) );
  INVX2 U8 ( .A(n37), .Y(n21) );
  BUFX2 U9 ( .A(data_in[5]), .Y(n31) );
  AND2X2 U10 ( .A(n10), .B(n101), .Y(n4) );
  NAND2X1 U11 ( .A(n101), .B(n108), .Y(n5) );
  NAND2X1 U12 ( .A(n30), .B(n117), .Y(n6) );
  NAND2X1 U13 ( .A(n30), .B(n117), .Y(n7) );
  BUFX4 U14 ( .A(data_in[3]), .Y(n35) );
  NAND2X1 U15 ( .A(n10), .B(n101), .Y(n8) );
  INVX4 U16 ( .A(n6), .Y(n120) );
  INVX2 U17 ( .A(n9), .Y(n10) );
  INVX4 U18 ( .A(n55), .Y(n111) );
  INVX4 U19 ( .A(n23), .Y(n13) );
  INVX2 U20 ( .A(n30), .Y(n23) );
  BUFX2 U21 ( .A(data_in[5]), .Y(n30) );
  BUFX2 U22 ( .A(data_in[3]), .Y(n34) );
  INVX1 U23 ( .A(n117), .Y(n14) );
  INVX2 U24 ( .A(n102), .Y(n18) );
  AND2X2 U25 ( .A(n31), .B(data_in[0]), .Y(n15) );
  INVX4 U26 ( .A(n15), .Y(n91) );
  NAND2X1 U27 ( .A(n37), .B(n102), .Y(n16) );
  NAND2X1 U28 ( .A(n37), .B(n102), .Y(n17) );
  INVX1 U29 ( .A(n100), .Y(n107) );
  INVX4 U30 ( .A(data_in[0]), .Y(n117) );
  OR2X2 U31 ( .A(data_in[0]), .B(n31), .Y(n90) );
  MUX2X1 U32 ( .B(n91), .A(n81), .S(n37), .Y(n19) );
  INVX2 U33 ( .A(n90), .Y(n77) );
  NOR2X1 U34 ( .A(n90), .B(n11), .Y(n20) );
  INVX1 U35 ( .A(n20), .Y(n25) );
  INVX1 U36 ( .A(n30), .Y(n73) );
  AND2X2 U37 ( .A(n101), .B(n108), .Y(n22) );
  INVX1 U38 ( .A(n91), .Y(n24) );
  INVX4 U39 ( .A(data_in[4]), .Y(n102) );
  INVX4 U40 ( .A(data_in[1]), .Y(n36) );
  INVX4 U41 ( .A(n118), .Y(n113) );
  INVX4 U42 ( .A(n32), .Y(n108) );
  NOR2X1 U43 ( .A(n35), .B(n17), .Y(n29) );
  INVX4 U44 ( .A(n34), .Y(n101) );
  INVX4 U45 ( .A(n16), .Y(n89) );
  AND2X2 U46 ( .A(n91), .B(n90), .Y(n26) );
  AND2X2 U47 ( .A(n102), .B(n21), .Y(n27) );
  AND2X2 U48 ( .A(n35), .B(n108), .Y(n28) );
  BUFX2 U49 ( .A(data_in[2]), .Y(n32) );
  BUFX2 U50 ( .A(data_in[2]), .Y(n33) );
  INVX8 U51 ( .A(n36), .Y(n37) );
  NAND2X1 U52 ( .A(data_in[4]), .B(n37), .Y(n43) );
  NOR2X1 U53 ( .A(n101), .B(n43), .Y(n39) );
  NAND2X1 U54 ( .A(n32), .B(n35), .Y(n92) );
  OAI21X1 U55 ( .A(n37), .B(n92), .C(n5), .Y(n38) );
  MUX2X1 U56 ( .B(n39), .A(n38), .S(n77), .Y(n50) );
  AOI22X1 U57 ( .A(n27), .B(n14), .C(n77), .D(n89), .Y(n41) );
  NAND2X1 U58 ( .A(data_in[4]), .B(n36), .Y(n118) );
  NAND2X1 U59 ( .A(n35), .B(n102), .Y(n55) );
  AOI22X1 U60 ( .A(n120), .B(n113), .C(n24), .D(n111), .Y(n40) );
  NAND2X1 U61 ( .A(n41), .B(n40), .Y(n42) );
  NAND2X1 U62 ( .A(data_in[0]), .B(n73), .Y(n81) );
  NAND2X1 U63 ( .A(n110), .B(n113), .Y(n56) );
  INVX2 U64 ( .A(n56), .Y(n76) );
  MUX2X1 U65 ( .B(n42), .A(n76), .S(n11), .Y(n49) );
  INVX2 U66 ( .A(n43), .Y(n109) );
  AOI22X1 U67 ( .A(n110), .B(n89), .C(n109), .D(n77), .Y(n44) );
  OAI21X1 U68 ( .A(n3), .B(n91), .C(n44), .Y(n47) );
  NAND2X1 U69 ( .A(n11), .B(n120), .Y(n78) );
  NAND3X1 U70 ( .A(n13), .B(n89), .C(n4), .Y(n45) );
  OAI21X1 U71 ( .A(n78), .B(n18), .C(n45), .Y(n46) );
  AOI21X1 U72 ( .A(n47), .B(n101), .C(n46), .Y(n48) );
  NAND3X1 U73 ( .A(n50), .B(n49), .C(n48), .Y(N163) );
  MUX2X1 U74 ( .B(n120), .A(n77), .S(n22), .Y(n51) );
  OAI21X1 U75 ( .A(n14), .B(n92), .C(n51), .Y(n54) );
  OAI21X1 U76 ( .A(n111), .B(n27), .C(n1), .Y(n52) );
  OAI21X1 U77 ( .A(n2), .B(n8), .C(n52), .Y(n53) );
  AOI22X1 U78 ( .A(n54), .B(n109), .C(n53), .D(n23), .Y(n68) );
  OAI22X1 U79 ( .A(n37), .B(n55), .C(n118), .D(n8), .Y(n121) );
  AOI22X1 U80 ( .A(n4), .B(n19), .C(n77), .D(n121), .Y(n67) );
  NAND2X1 U81 ( .A(n15), .B(n22), .Y(n100) );
  OAI22X1 U82 ( .A(n102), .B(n100), .C(n56), .D(n101), .Y(n65) );
  NOR2X1 U83 ( .A(n35), .B(n7), .Y(n58) );
  NOR2X1 U84 ( .A(n18), .B(n7), .Y(n57) );
  AOI22X1 U85 ( .A(n58), .B(n89), .C(n57), .D(n4), .Y(n63) );
  INVX2 U86 ( .A(n92), .Y(n103) );
  NAND3X1 U87 ( .A(n103), .B(n18), .C(n120), .Y(n62) );
  MUX2X1 U88 ( .B(n11), .A(n117), .S(n37), .Y(n60) );
  NOR2X1 U89 ( .A(n108), .B(n91), .Y(n59) );
  AOI22X1 U90 ( .A(n111), .B(n60), .C(n59), .D(n113), .Y(n61) );
  NAND3X1 U91 ( .A(n61), .B(n62), .C(n63), .Y(n64) );
  NOR2X1 U92 ( .A(n65), .B(n64), .Y(n66) );
  NAND3X1 U93 ( .A(n67), .B(n68), .C(n66), .Y(N138) );
  OAI21X1 U94 ( .A(n35), .B(n26), .C(n78), .Y(n72) );
  NAND2X1 U95 ( .A(n11), .B(n89), .Y(n70) );
  NAND2X1 U96 ( .A(n4), .B(n18), .Y(n69) );
  MUX2X1 U97 ( .B(n70), .A(n69), .S(n13), .Y(n71) );
  AOI21X1 U98 ( .A(n72), .B(n109), .C(n71), .Y(n87) );
  AOI22X1 U99 ( .A(n15), .B(n37), .C(n21), .D(n23), .Y(n74) );
  OAI22X1 U100 ( .A(n2), .B(n7), .C(n74), .D(n101), .Y(n75) );
  OAI21X1 U101 ( .A(n76), .B(n75), .C(n1), .Y(n86) );
  NAND3X1 U102 ( .A(n78), .B(n100), .C(n25), .Y(n84) );
  AOI21X1 U103 ( .A(n4), .B(n102), .C(n29), .Y(n82) );
  MUX2X1 U104 ( .B(n6), .A(n90), .S(n35), .Y(n79) );
  AOI22X1 U105 ( .A(n113), .B(n79), .C(n19), .D(n103), .Y(n80) );
  OAI21X1 U106 ( .A(n82), .B(n12), .C(n80), .Y(n83) );
  AOI21X1 U107 ( .A(n84), .B(n27), .C(n83), .Y(n85) );
  NAND3X1 U108 ( .A(n87), .B(n86), .C(n85), .Y(N106) );
  MUX2X1 U109 ( .B(n4), .A(n103), .S(n13), .Y(n88) );
  OAI21X1 U110 ( .A(n26), .B(n1), .C(n88), .Y(n99) );
  NAND3X1 U111 ( .A(n24), .B(n1), .C(n89), .Y(n97) );
  NAND3X1 U112 ( .A(n11), .B(n110), .C(n111), .Y(n96) );
  NOR2X1 U113 ( .A(n90), .B(n8), .Y(n94) );
  NOR2X1 U114 ( .A(n92), .B(n91), .Y(n93) );
  MUX2X1 U115 ( .B(n94), .A(n93), .S(n18), .Y(n95) );
  NAND3X1 U116 ( .A(n97), .B(n96), .C(n95), .Y(n98) );
  AOI21X1 U117 ( .A(n109), .B(n99), .C(n98), .Y(n128) );
  NAND2X1 U118 ( .A(n102), .B(n101), .Y(n105) );
  OAI21X1 U119 ( .A(n111), .B(n103), .C(n110), .Y(n104) );
  OAI21X1 U120 ( .A(n26), .B(n105), .C(n104), .Y(n106) );
  OAI21X1 U121 ( .A(n107), .B(n106), .C(n21), .Y(n127) );
  NAND3X1 U122 ( .A(n110), .B(n109), .C(n28), .Y(n116) );
  NAND3X1 U123 ( .A(n111), .B(n20), .C(n37), .Y(n115) );
  NOR2X1 U124 ( .A(n37), .B(n7), .Y(n112) );
  AOI22X1 U125 ( .A(n20), .B(n113), .C(n112), .D(n28), .Y(n114) );
  NAND3X1 U126 ( .A(n116), .B(n115), .C(n114), .Y(n125) );
  OAI22X1 U127 ( .A(n13), .B(n118), .C(n117), .D(n16), .Y(n119) );
  AOI21X1 U128 ( .A(n120), .B(n37), .C(n119), .Y(n123) );
  OAI21X1 U129 ( .A(n29), .B(n121), .C(n120), .Y(n122) );
  OAI21X1 U130 ( .A(n123), .B(n5), .C(n122), .Y(n124) );
  NOR2X1 U131 ( .A(n125), .B(n124), .Y(n126) );
  NAND3X1 U132 ( .A(n127), .B(n128), .C(n126), .Y(N62) );
endmodule


module Sbox3_0 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N62, N100, N138, N167, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148;
  assign data_out[3] = N62;
  assign data_out[2] = N100;
  assign data_out[1] = N138;
  assign data_out[0] = N167;

  AND2X2 U1 ( .A(n21), .B(n7), .Y(n1) );
  INVX1 U2 ( .A(n1), .Y(n70) );
  BUFX4 U3 ( .A(n30), .Y(n2) );
  INVX2 U4 ( .A(n19), .Y(n3) );
  INVX4 U5 ( .A(n97), .Y(n19) );
  INVX2 U6 ( .A(n4), .Y(n100) );
  INVX4 U7 ( .A(n15), .Y(n4) );
  INVX2 U8 ( .A(n15), .Y(n26) );
  INVX4 U9 ( .A(data_in[2]), .Y(n29) );
  INVX2 U10 ( .A(n21), .Y(n126) );
  INVX1 U11 ( .A(n28), .Y(n9) );
  INVX4 U12 ( .A(n28), .Y(n124) );
  INVX4 U13 ( .A(n16), .Y(n139) );
  INVX1 U14 ( .A(n24), .Y(n5) );
  OR2X2 U15 ( .A(data_in[5]), .B(data_in[0]), .Y(n6) );
  INVX4 U16 ( .A(n6), .Y(n23) );
  INVX1 U17 ( .A(n17), .Y(n55) );
  INVX2 U18 ( .A(data_in[5]), .Y(n97) );
  BUFX4 U19 ( .A(n31), .Y(n7) );
  INVX1 U20 ( .A(n135), .Y(n43) );
  NOR2X1 U21 ( .A(n9), .B(n35), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n122) );
  INVX4 U23 ( .A(n35), .Y(n125) );
  OR2X2 U24 ( .A(n30), .B(n32), .Y(n25) );
  BUFX2 U25 ( .A(n18), .Y(n10) );
  AND2X2 U26 ( .A(n17), .B(n97), .Y(n11) );
  INVX2 U27 ( .A(n11), .Y(n12) );
  INVX1 U28 ( .A(n30), .Y(n14) );
  OR2X2 U29 ( .A(n26), .B(n30), .Y(n56) );
  INVX4 U30 ( .A(n33), .Y(n34) );
  INVX4 U31 ( .A(data_in[4]), .Y(n33) );
  AND2X2 U32 ( .A(n23), .B(n125), .Y(n13) );
  MUX2X1 U33 ( .B(n13), .A(n45), .S(n89), .Y(n93) );
  INVX1 U34 ( .A(n32), .Y(n37) );
  AND2X2 U35 ( .A(n33), .B(n136), .Y(n45) );
  INVX2 U36 ( .A(n11), .Y(n24) );
  AND2X2 U37 ( .A(n44), .B(data_in[5]), .Y(n15) );
  INVX4 U38 ( .A(n33), .Y(n35) );
  INVX4 U39 ( .A(data_in[3]), .Y(n31) );
  AND2X2 U40 ( .A(n34), .B(n28), .Y(n16) );
  INVX2 U41 ( .A(n44), .Y(n17) );
  INVX2 U42 ( .A(data_in[0]), .Y(n44) );
  NAND2X1 U43 ( .A(n32), .B(n89), .Y(n18) );
  AND2X1 U44 ( .A(n35), .B(n3), .Y(n99) );
  INVX1 U45 ( .A(n120), .Y(n36) );
  AND2X2 U46 ( .A(n32), .B(n89), .Y(n20) );
  AND2X2 U47 ( .A(data_in[5]), .B(data_in[0]), .Y(n21) );
  BUFX2 U48 ( .A(n20), .Y(n22) );
  INVX8 U49 ( .A(n30), .Y(n89) );
  INVX2 U50 ( .A(data_in[1]), .Y(n27) );
  INVX8 U51 ( .A(n27), .Y(n28) );
  INVX8 U52 ( .A(n29), .Y(n30) );
  INVX8 U53 ( .A(n31), .Y(n32) );
  NAND2X1 U54 ( .A(n32), .B(n122), .Y(n41) );
  NAND2X1 U55 ( .A(n6), .B(n126), .Y(n120) );
  AOI21X1 U56 ( .A(n139), .B(n37), .C(n36), .Y(n40) );
  NAND2X1 U57 ( .A(n35), .B(n32), .Y(n121) );
  INVX2 U58 ( .A(n121), .Y(n111) );
  NAND2X1 U59 ( .A(n111), .B(n21), .Y(n94) );
  NAND2X1 U60 ( .A(n89), .B(n7), .Y(n140) );
  INVX2 U61 ( .A(n140), .Y(n82) );
  NAND3X1 U62 ( .A(n55), .B(n82), .C(n34), .Y(n38) );
  OAI21X1 U63 ( .A(n2), .B(n94), .C(n38), .Y(n39) );
  AOI21X1 U64 ( .A(n41), .B(n40), .C(n39), .Y(n54) );
  NAND2X1 U65 ( .A(n17), .B(n97), .Y(n123) );
  INVX2 U66 ( .A(n123), .Y(n136) );
  NAND2X1 U67 ( .A(n136), .B(n34), .Y(n88) );
  INVX2 U68 ( .A(n88), .Y(n71) );
  AOI22X1 U69 ( .A(n1), .B(n125), .C(n71), .D(n2), .Y(n42) );
  OAI21X1 U70 ( .A(n4), .B(n25), .C(n42), .Y(n49) );
  NAND2X1 U71 ( .A(n30), .B(n32), .Y(n135) );
  NOR2X1 U72 ( .A(n35), .B(n43), .Y(n47) );
  NAND2X1 U73 ( .A(n30), .B(n35), .Y(n69) );
  NAND2X1 U74 ( .A(n69), .B(n55), .Y(n46) );
  NAND2X1 U75 ( .A(n23), .B(n125), .Y(n127) );
  OAI21X1 U76 ( .A(n47), .B(n46), .C(n93), .Y(n48) );
  OAI21X1 U77 ( .A(n49), .B(n48), .C(n124), .Y(n53) );
  OAI22X1 U78 ( .A(n7), .B(n139), .C(n32), .D(n122), .Y(n51) );
  OAI21X1 U79 ( .A(n26), .B(n89), .C(n12), .Y(n110) );
  NOR2X1 U80 ( .A(n3), .B(n122), .Y(n50) );
  AOI22X1 U81 ( .A(n51), .B(n110), .C(n50), .D(n22), .Y(n52) );
  NAND3X1 U82 ( .A(n54), .B(n53), .C(n52), .Y(N167) );
  AOI21X1 U83 ( .A(n56), .B(n55), .C(n122), .Y(n59) );
  NAND3X1 U84 ( .A(n56), .B(n135), .C(n25), .Y(n58) );
  NAND3X1 U85 ( .A(n30), .B(n28), .C(n37), .Y(n57) );
  OAI21X1 U86 ( .A(n34), .B(n18), .C(n57), .Y(n115) );
  AOI22X1 U87 ( .A(n58), .B(n59), .C(n115), .D(n23), .Y(n79) );
  NOR2X1 U88 ( .A(n28), .B(n7), .Y(n65) );
  AOI21X1 U89 ( .A(n2), .B(n126), .C(n23), .Y(n60) );
  OAI21X1 U90 ( .A(n19), .B(n34), .C(n60), .Y(n64) );
  NAND3X1 U91 ( .A(n35), .B(n7), .C(n100), .Y(n62) );
  NAND3X1 U92 ( .A(n14), .B(n124), .C(n13), .Y(n61) );
  OAI21X1 U93 ( .A(n28), .B(n62), .C(n61), .Y(n63) );
  AOI21X1 U94 ( .A(n65), .B(n64), .C(n63), .Y(n78) );
  NAND2X1 U95 ( .A(n30), .B(n97), .Y(n66) );
  MUX2X1 U96 ( .B(n66), .A(n4), .S(n32), .Y(n67) );
  NOR2X1 U97 ( .A(n1), .B(n67), .Y(n68) );
  OAI21X1 U98 ( .A(n10), .B(n24), .C(n68), .Y(n76) );
  OAI21X1 U99 ( .A(n70), .B(n69), .C(n139), .Y(n75) );
  OAI21X1 U100 ( .A(n20), .B(n111), .C(n21), .Y(n73) );
  NAND3X1 U101 ( .A(n82), .B(n124), .C(n71), .Y(n72) );
  OAI21X1 U102 ( .A(n28), .B(n73), .C(n72), .Y(n74) );
  AOI21X1 U103 ( .A(n76), .B(n75), .C(n74), .Y(n77) );
  NAND3X1 U104 ( .A(n78), .B(n79), .C(n77), .Y(N138) );
  NOR2X1 U105 ( .A(n28), .B(n126), .Y(n80) );
  NAND3X1 U106 ( .A(n14), .B(n80), .C(n32), .Y(n85) );
  MUX2X1 U107 ( .B(n32), .A(n30), .S(n28), .Y(n81) );
  NAND2X1 U108 ( .A(n81), .B(n100), .Y(n84) );
  NAND2X1 U109 ( .A(n82), .B(n5), .Y(n83) );
  NAND3X1 U110 ( .A(n85), .B(n84), .C(n83), .Y(n87) );
  NOR2X1 U111 ( .A(n126), .B(n25), .Y(n86) );
  MUX2X1 U112 ( .B(n87), .A(n86), .S(n34), .Y(n109) );
  OAI21X1 U113 ( .A(n14), .B(n24), .C(n88), .Y(n91) );
  OAI21X1 U114 ( .A(n125), .B(n4), .C(n127), .Y(n90) );
  OAI21X1 U115 ( .A(n91), .B(n90), .C(n32), .Y(n92) );
  INVX2 U116 ( .A(n92), .Y(n96) );
  NAND2X1 U117 ( .A(n94), .B(n93), .Y(n95) );
  MUX2X1 U118 ( .B(n96), .A(n95), .S(n28), .Y(n108) );
  NOR2X1 U119 ( .A(n139), .B(n6), .Y(n106) );
  NAND2X1 U120 ( .A(n1), .B(n124), .Y(n104) );
  AND2X2 U121 ( .A(n21), .B(n28), .Y(n98) );
  MUX2X1 U122 ( .B(n99), .A(n98), .S(n32), .Y(n103) );
  INVX2 U123 ( .A(n139), .Y(n101) );
  NAND2X1 U124 ( .A(n101), .B(n100), .Y(n102) );
  NAND3X1 U125 ( .A(n104), .B(n103), .C(n102), .Y(n105) );
  MUX2X1 U126 ( .B(n106), .A(n105), .S(n2), .Y(n107) );
  NAND3X1 U127 ( .A(n109), .B(n107), .C(n108), .Y(N100) );
  NAND3X1 U128 ( .A(n34), .B(n124), .C(n4), .Y(n113) );
  NAND3X1 U129 ( .A(n111), .B(n124), .C(n110), .Y(n112) );
  OAI21X1 U130 ( .A(n10), .B(n113), .C(n112), .Y(n119) );
  OAI21X1 U131 ( .A(n35), .B(n2), .C(n140), .Y(n114) );
  NAND3X1 U132 ( .A(n21), .B(n114), .C(n28), .Y(n117) );
  NAND2X1 U133 ( .A(n115), .B(n100), .Y(n116) );
  NAND2X1 U134 ( .A(n117), .B(n116), .Y(n118) );
  NOR2X1 U135 ( .A(n119), .B(n118), .Y(n148) );
  NAND3X1 U136 ( .A(n124), .B(n121), .C(n120), .Y(n133) );
  NAND2X1 U137 ( .A(n8), .B(n11), .Y(n132) );
  AOI21X1 U138 ( .A(n32), .B(n125), .C(n124), .Y(n130) );
  NAND2X1 U139 ( .A(n6), .B(n126), .Y(n129) );
  NAND2X1 U140 ( .A(n127), .B(n7), .Y(n128) );
  NAND3X1 U141 ( .A(n130), .B(n129), .C(n128), .Y(n131) );
  NAND3X1 U142 ( .A(n133), .B(n132), .C(n131), .Y(n134) );
  NAND2X1 U143 ( .A(n134), .B(n2), .Y(n147) );
  NAND2X1 U144 ( .A(n136), .B(n135), .Y(n138) );
  NAND3X1 U145 ( .A(n28), .B(n20), .C(n15), .Y(n137) );
  OAI21X1 U146 ( .A(n138), .B(n139), .C(n137), .Y(n145) );
  NOR3X1 U147 ( .A(n25), .B(n19), .C(n139), .Y(n144) );
  NOR2X1 U148 ( .A(n140), .B(n28), .Y(n142) );
  OAI21X1 U149 ( .A(n19), .B(n35), .C(n4), .Y(n141) );
  AND2X2 U150 ( .A(n142), .B(n141), .Y(n143) );
  NOR3X1 U151 ( .A(n144), .B(n145), .C(n143), .Y(n146) );
  NAND3X1 U152 ( .A(n147), .B(n148), .C(n146), .Y(N62) );
endmodule


module Sbox4_0 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N55, N92, N129, N161, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154;
  assign data_out[3] = N55;
  assign data_out[2] = N92;
  assign data_out[1] = N129;
  assign data_out[0] = N161;

  INVX2 U1 ( .A(n41), .Y(n4) );
  AND2X1 U2 ( .A(n117), .B(n4), .Y(n1) );
  INVX2 U3 ( .A(n44), .Y(n118) );
  INVX4 U4 ( .A(data_in[4]), .Y(n43) );
  INVX2 U5 ( .A(data_in[2]), .Y(n2) );
  INVX1 U6 ( .A(data_in[2]), .Y(n41) );
  INVX2 U7 ( .A(n136), .Y(n106) );
  INVX2 U8 ( .A(n99), .Y(n70) );
  INVX2 U9 ( .A(n104), .Y(n66) );
  AND2X2 U10 ( .A(n118), .B(n139), .Y(n3) );
  INVX4 U11 ( .A(n2), .Y(n42) );
  INVX2 U12 ( .A(n17), .Y(n143) );
  AND2X2 U13 ( .A(n15), .B(n36), .Y(n16) );
  INVX1 U14 ( .A(n151), .Y(n5) );
  BUFX2 U15 ( .A(n8), .Y(n6) );
  OAI22X1 U16 ( .A(n143), .B(n139), .C(n9), .D(n51), .Y(n7) );
  BUFX4 U17 ( .A(n30), .Y(n8) );
  INVX2 U18 ( .A(n30), .Y(n141) );
  BUFX4 U19 ( .A(data_in[3]), .Y(n9) );
  AND2X2 U20 ( .A(n134), .B(n133), .Y(n79) );
  AND2X2 U21 ( .A(n35), .B(n37), .Y(n10) );
  AND2X2 U22 ( .A(n35), .B(n27), .Y(n11) );
  MUX2X1 U23 ( .B(n13), .A(n14), .S(n40), .Y(n12) );
  INVX2 U24 ( .A(n12), .Y(n28) );
  NOR2X1 U25 ( .A(n24), .B(n84), .Y(n13) );
  NOR2X1 U26 ( .A(n44), .B(n120), .Y(n14) );
  INVX1 U27 ( .A(data_in[5]), .Y(n15) );
  AND2X2 U28 ( .A(n1), .B(n116), .Y(n125) );
  AND2X2 U29 ( .A(data_in[3]), .B(n41), .Y(n17) );
  OAI21X1 U30 ( .A(n44), .B(n87), .C(n86), .Y(n18) );
  NAND2X1 U31 ( .A(n9), .B(n25), .Y(n19) );
  BUFX2 U32 ( .A(n15), .Y(n20) );
  BUFX2 U33 ( .A(n151), .Y(n21) );
  OR2X2 U34 ( .A(n5), .B(n141), .Y(n145) );
  BUFX2 U35 ( .A(n23), .Y(n22) );
  INVX1 U36 ( .A(n35), .Y(n25) );
  OR2X2 U37 ( .A(data_in[3]), .B(data_in[4]), .Y(n84) );
  INVX1 U38 ( .A(data_in[3]), .Y(n117) );
  AND2X2 U39 ( .A(n31), .B(n139), .Y(n23) );
  INVX2 U40 ( .A(n16), .Y(n24) );
  INVX4 U41 ( .A(data_in[1]), .Y(n39) );
  INVX1 U42 ( .A(n94), .Y(n53) );
  INVX1 U43 ( .A(n42), .Y(n105) );
  INVX1 U44 ( .A(n42), .Y(n98) );
  BUFX4 U45 ( .A(data_in[5]), .Y(n35) );
  BUFX2 U46 ( .A(n36), .Y(n26) );
  AND2X2 U47 ( .A(n16), .B(n105), .Y(n29) );
  INVX1 U48 ( .A(data_in[0]), .Y(n27) );
  AND2X2 U49 ( .A(n151), .B(n17), .Y(n33) );
  MUX2X1 U50 ( .B(n85), .A(n38), .S(n139), .Y(n86) );
  AND2X2 U51 ( .A(data_in[3]), .B(n42), .Y(n30) );
  INVX8 U52 ( .A(n39), .Y(n40) );
  INVX8 U53 ( .A(n40), .Y(n139) );
  AND2X2 U54 ( .A(n35), .B(n27), .Y(n31) );
  INVX1 U55 ( .A(n31), .Y(n142) );
  NOR2X1 U56 ( .A(data_in[3]), .B(n42), .Y(n32) );
  INVX2 U57 ( .A(n32), .Y(n100) );
  AND2X2 U58 ( .A(n35), .B(n117), .Y(n34) );
  BUFX2 U59 ( .A(data_in[0]), .Y(n36) );
  BUFX2 U60 ( .A(data_in[0]), .Y(n37) );
  OR2X2 U61 ( .A(n99), .B(n39), .Y(n50) );
  NOR2X1 U62 ( .A(n84), .B(n140), .Y(n38) );
  INVX1 U63 ( .A(n38), .Y(n89) );
  INVX1 U64 ( .A(n37), .Y(n95) );
  INVX1 U65 ( .A(n100), .Y(n75) );
  INVX1 U66 ( .A(n100), .Y(n48) );
  AND2X1 U67 ( .A(n100), .B(n40), .Y(n69) );
  INVX8 U68 ( .A(n43), .Y(n44) );
  NAND2X1 U69 ( .A(n15), .B(n36), .Y(n99) );
  INVX2 U70 ( .A(n50), .Y(n116) );
  NAND2X1 U71 ( .A(n35), .B(n37), .Y(n94) );
  OAI22X1 U72 ( .A(n48), .B(n116), .C(n10), .D(n100), .Y(n46) );
  NAND2X1 U73 ( .A(n4), .B(n139), .Y(n68) );
  NAND2X1 U74 ( .A(n114), .B(n11), .Y(n45) );
  AOI21X1 U75 ( .A(n46), .B(n45), .C(n44), .Y(n58) );
  NAND2X1 U76 ( .A(n50), .B(n142), .Y(n47) );
  NAND3X1 U77 ( .A(n44), .B(n48), .C(n47), .Y(n56) );
  NOR2X1 U78 ( .A(n44), .B(n141), .Y(n49) );
  NAND3X1 U79 ( .A(n24), .B(n139), .C(n49), .Y(n55) );
  NAND2X1 U80 ( .A(n44), .B(n42), .Y(n51) );
  NAND2X1 U81 ( .A(n27), .B(n15), .Y(n140) );
  INVX2 U82 ( .A(n140), .Y(n151) );
  NAND2X1 U83 ( .A(n151), .B(n40), .Y(n104) );
  OAI22X1 U84 ( .A(n104), .B(n51), .C(n50), .D(n141), .Y(n52) );
  AOI21X1 U85 ( .A(n7), .B(n53), .C(n52), .Y(n54) );
  NAND3X1 U86 ( .A(n56), .B(n55), .C(n54), .Y(n57) );
  NOR2X1 U87 ( .A(n58), .B(n57), .Y(n65) );
  NAND2X1 U88 ( .A(n31), .B(n9), .Y(n120) );
  INVX2 U89 ( .A(n68), .Y(n114) );
  NOR2X1 U90 ( .A(n114), .B(n89), .Y(n63) );
  NAND2X1 U91 ( .A(n9), .B(n25), .Y(n76) );
  AOI21X1 U92 ( .A(n26), .B(n19), .C(n4), .Y(n60) );
  NOR2X1 U93 ( .A(n40), .B(n118), .Y(n59) );
  OAI21X1 U94 ( .A(n34), .B(n60), .C(n59), .Y(n61) );
  INVX2 U95 ( .A(n61), .Y(n62) );
  NOR3X1 U96 ( .A(n62), .B(n63), .C(n28), .Y(n64) );
  NAND2X1 U97 ( .A(n64), .B(n65), .Y(N161) );
  NAND2X1 U98 ( .A(n114), .B(n117), .Y(n113) );
  INVX2 U99 ( .A(n113), .Y(n152) );
  AOI22X1 U100 ( .A(n66), .B(n6), .C(n152), .D(n70), .Y(n93) );
  NAND2X1 U101 ( .A(n16), .B(n105), .Y(n119) );
  NAND2X1 U102 ( .A(n29), .B(n40), .Y(n138) );
  NAND2X1 U103 ( .A(n33), .B(n139), .Y(n67) );
  NAND3X1 U104 ( .A(n44), .B(n138), .C(n67), .Y(n83) );
  NAND2X1 U105 ( .A(n40), .B(n32), .Y(n136) );
  NAND2X1 U106 ( .A(n106), .B(n20), .Y(n74) );
  AOI22X1 U107 ( .A(n114), .B(n70), .C(n69), .D(n10), .Y(n73) );
  NAND3X1 U108 ( .A(n117), .B(n139), .C(n11), .Y(n71) );
  OAI21X1 U109 ( .A(n141), .B(n94), .C(n71), .Y(n135) );
  INVX2 U110 ( .A(n135), .Y(n72) );
  NAND3X1 U111 ( .A(n74), .B(n73), .C(n72), .Y(n82) );
  NAND2X1 U112 ( .A(n75), .B(n35), .Y(n80) );
  NAND2X1 U113 ( .A(n8), .B(n23), .Y(n134) );
  NAND3X1 U114 ( .A(n26), .B(n98), .C(n35), .Y(n77) );
  MUX2X1 U115 ( .B(n77), .A(n76), .S(n40), .Y(n78) );
  INVX2 U116 ( .A(n78), .Y(n133) );
  NAND3X1 U117 ( .A(n43), .B(n80), .C(n79), .Y(n81) );
  OAI21X1 U118 ( .A(n83), .B(n82), .C(n81), .Y(n92) );
  NAND2X1 U119 ( .A(n17), .B(n16), .Y(n87) );
  NOR2X1 U120 ( .A(n84), .B(n94), .Y(n85) );
  OAI21X1 U121 ( .A(n44), .B(n87), .C(n86), .Y(n126) );
  INVX2 U122 ( .A(n7), .Y(n88) );
  OAI22X1 U123 ( .A(n105), .B(n89), .C(n88), .D(n142), .Y(n90) );
  NOR2X1 U124 ( .A(n18), .B(n90), .Y(n91) );
  NAND3X1 U125 ( .A(n93), .B(n91), .C(n92), .Y(N129) );
  NAND2X1 U126 ( .A(n151), .B(n9), .Y(n97) );
  MUX2X1 U127 ( .B(n10), .A(n95), .S(n4), .Y(n96) );
  AOI21X1 U128 ( .A(n97), .B(n96), .C(n139), .Y(n112) );
  NAND3X1 U129 ( .A(n20), .B(n139), .C(n8), .Y(n103) );
  NAND2X1 U130 ( .A(n23), .B(n98), .Y(n102) );
  AOI21X1 U131 ( .A(n70), .B(n75), .C(n118), .Y(n101) );
  NAND3X1 U132 ( .A(n103), .B(n102), .C(n101), .Y(n111) );
  NAND2X1 U133 ( .A(n66), .B(n105), .Y(n109) );
  NAND2X1 U134 ( .A(n106), .B(n35), .Y(n108) );
  AOI21X1 U135 ( .A(n8), .B(n11), .C(n44), .Y(n107) );
  NAND3X1 U136 ( .A(n109), .B(n108), .C(n107), .Y(n110) );
  OAI21X1 U137 ( .A(n112), .B(n111), .C(n110), .Y(n129) );
  OAI21X1 U138 ( .A(n114), .B(n117), .C(n113), .Y(n115) );
  NAND3X1 U139 ( .A(n10), .B(n115), .C(n44), .Y(n128) );
  NAND2X1 U140 ( .A(n119), .B(n120), .Y(n121) );
  NAND2X1 U141 ( .A(n3), .B(n121), .Y(n123) );
  NAND3X1 U142 ( .A(n35), .B(n8), .C(n3), .Y(n122) );
  NAND2X1 U143 ( .A(n123), .B(n122), .Y(n124) );
  NOR3X1 U144 ( .A(n126), .B(n125), .C(n124), .Y(n127) );
  NAND3X1 U145 ( .A(n129), .B(n128), .C(n127), .Y(N92) );
  NOR2X1 U146 ( .A(n37), .B(n34), .Y(n132) );
  NAND2X1 U147 ( .A(n40), .B(n4), .Y(n131) );
  AOI21X1 U148 ( .A(n70), .B(n8), .C(n33), .Y(n130) );
  OAI21X1 U149 ( .A(n132), .B(n131), .C(n130), .Y(n150) );
  NAND3X1 U150 ( .A(n133), .B(n134), .C(n44), .Y(n149) );
  NAND2X1 U151 ( .A(n106), .B(n142), .Y(n137) );
  NAND3X1 U152 ( .A(n138), .B(n72), .C(n137), .Y(n148) );
  NAND3X1 U153 ( .A(n9), .B(n139), .C(n10), .Y(n146) );
  AOI21X1 U154 ( .A(n11), .B(n17), .C(n44), .Y(n144) );
  NAND3X1 U155 ( .A(n146), .B(n145), .C(n144), .Y(n147) );
  OAI22X1 U156 ( .A(n150), .B(n149), .C(n147), .D(n148), .Y(n154) );
  AOI22X1 U157 ( .A(n22), .B(n75), .C(n152), .D(n21), .Y(n153) );
  NAND3X1 U158 ( .A(n12), .B(n154), .C(n153), .Y(N55) );
endmodule


module Sbox5_0 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N55, N140, N163, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162;
  assign data_out[3] = N55;
  assign data_out[1] = N140;
  assign data_out[0] = N163;

  AND2X1 U1 ( .A(n120), .B(n51), .Y(n27) );
  INVX2 U2 ( .A(n116), .Y(n120) );
  INVX1 U3 ( .A(data_in[0]), .Y(n1) );
  INVX1 U4 ( .A(n1), .Y(n2) );
  INVX2 U5 ( .A(n18), .Y(n3) );
  INVX2 U6 ( .A(n24), .Y(n18) );
  BUFX4 U7 ( .A(n47), .Y(n4) );
  BUFX2 U8 ( .A(n39), .Y(n5) );
  INVX2 U9 ( .A(n40), .Y(n6) );
  INVX2 U10 ( .A(n37), .Y(n40) );
  AND2X1 U11 ( .A(n51), .B(n45), .Y(n7) );
  AND2X1 U12 ( .A(n26), .B(n48), .Y(n8) );
  INVX1 U13 ( .A(n21), .Y(n9) );
  INVX4 U14 ( .A(data_in[2]), .Y(n46) );
  INVX2 U15 ( .A(n129), .Y(n76) );
  INVX1 U16 ( .A(n105), .Y(n112) );
  AND2X1 U17 ( .A(n36), .B(n150), .Y(n10) );
  INVX2 U18 ( .A(n131), .Y(n35) );
  AND2X1 U19 ( .A(n108), .B(n47), .Y(n11) );
  INVX2 U20 ( .A(n107), .Y(n12) );
  INVX2 U21 ( .A(n157), .Y(n107) );
  NAND2X1 U22 ( .A(n13), .B(n112), .Y(n14) );
  NAND2X1 U23 ( .A(n14), .B(n64), .Y(n65) );
  INVX1 U24 ( .A(n40), .Y(n13) );
  NAND2X1 U25 ( .A(n36), .B(n150), .Y(n15) );
  INVX2 U26 ( .A(data_in[0]), .Y(n22) );
  INVX2 U27 ( .A(n17), .Y(n83) );
  INVX1 U28 ( .A(n139), .Y(n16) );
  INVX4 U29 ( .A(data_in[1]), .Y(n43) );
  INVX8 U30 ( .A(n43), .Y(n44) );
  AND2X2 U31 ( .A(n41), .B(n22), .Y(n17) );
  AND2X2 U32 ( .A(n49), .B(n148), .Y(n19) );
  INVX2 U33 ( .A(n19), .Y(n147) );
  AND2X2 U34 ( .A(n20), .B(n22), .Y(n37) );
  INVX2 U35 ( .A(n20), .Y(n41) );
  INVX2 U36 ( .A(data_in[5]), .Y(n20) );
  INVX4 U37 ( .A(n21), .Y(n36) );
  OR2X2 U38 ( .A(n32), .B(n22), .Y(n21) );
  INVX1 U39 ( .A(n32), .Y(n131) );
  BUFX2 U40 ( .A(n51), .Y(n23) );
  INVX1 U41 ( .A(n137), .Y(n145) );
  INVX1 U42 ( .A(n137), .Y(n77) );
  INVX1 U43 ( .A(n22), .Y(n24) );
  INVX2 U44 ( .A(n35), .Y(n25) );
  INVX8 U45 ( .A(n48), .Y(n49) );
  INVX4 U46 ( .A(data_in[3]), .Y(n48) );
  BUFX4 U47 ( .A(n37), .Y(n26) );
  NOR2X1 U48 ( .A(n27), .B(n119), .Y(n121) );
  AND2X2 U49 ( .A(n2), .B(n41), .Y(n28) );
  INVX2 U50 ( .A(n28), .Y(n139) );
  NAND2X1 U51 ( .A(n26), .B(n150), .Y(n29) );
  NAND2X1 U52 ( .A(n8), .B(n7), .Y(n95) );
  INVX4 U53 ( .A(n43), .Y(n45) );
  NOR2X1 U54 ( .A(n105), .B(n83), .Y(n30) );
  NOR2X1 U55 ( .A(n30), .B(n111), .Y(n127) );
  INVX4 U56 ( .A(data_in[4]), .Y(n50) );
  INVX8 U57 ( .A(n51), .Y(n152) );
  INVX1 U58 ( .A(n29), .Y(n31) );
  NAND2X1 U59 ( .A(n107), .B(n11), .Y(n109) );
  INVX1 U60 ( .A(n106), .Y(n108) );
  INVX2 U61 ( .A(n20), .Y(n32) );
  NAND2X1 U62 ( .A(n24), .B(n131), .Y(n33) );
  BUFX2 U63 ( .A(n24), .Y(n34) );
  AND2X2 U64 ( .A(n47), .B(n36), .Y(n141) );
  INVX8 U65 ( .A(n47), .Y(n148) );
  INVX8 U66 ( .A(n44), .Y(n150) );
  AND2X2 U67 ( .A(n148), .B(n150), .Y(n38) );
  AND2X2 U68 ( .A(n47), .B(n44), .Y(n39) );
  AND2X2 U69 ( .A(n26), .B(n150), .Y(n42) );
  INVX8 U70 ( .A(n46), .Y(n47) );
  INVX8 U71 ( .A(n50), .Y(n51) );
  NAND2X1 U72 ( .A(n47), .B(n49), .Y(n130) );
  OAI22X1 U73 ( .A(n147), .B(n33), .C(n130), .D(n139), .Y(n52) );
  NAND2X1 U74 ( .A(n49), .B(n152), .Y(n74) );
  INVX2 U75 ( .A(n74), .Y(n125) );
  AOI22X1 U76 ( .A(n23), .B(n52), .C(n125), .D(n31), .Y(n69) );
  NAND3X1 U77 ( .A(n9), .B(n45), .C(n148), .Y(n53) );
  OAI21X1 U78 ( .A(n130), .B(n33), .C(n53), .Y(n57) );
  NAND2X1 U79 ( .A(n16), .B(n150), .Y(n55) );
  NAND3X1 U80 ( .A(n4), .B(n17), .C(n150), .Y(n54) );
  OAI21X1 U81 ( .A(n4), .B(n55), .C(n54), .Y(n56) );
  OAI21X1 U82 ( .A(n57), .B(n56), .C(n152), .Y(n68) );
  NAND2X1 U83 ( .A(n36), .B(n51), .Y(n59) );
  NAND3X1 U84 ( .A(n148), .B(n49), .C(n26), .Y(n58) );
  OAI21X1 U85 ( .A(n49), .B(n59), .C(n58), .Y(n60) );
  INVX2 U86 ( .A(n60), .Y(n110) );
  NAND2X1 U87 ( .A(n19), .B(n17), .Y(n89) );
  MUX2X1 U88 ( .B(n110), .A(n89), .S(n45), .Y(n66) );
  OAI21X1 U89 ( .A(n44), .B(n48), .C(n51), .Y(n61) );
  OR2X2 U90 ( .A(n148), .B(n61), .Y(n105) );
  NAND2X1 U91 ( .A(n51), .B(n48), .Y(n129) );
  OAI22X1 U92 ( .A(n36), .B(n150), .C(n47), .D(n83), .Y(n63) );
  OAI21X1 U93 ( .A(n34), .B(n49), .C(n139), .Y(n62) );
  AOI22X1 U94 ( .A(n63), .B(n76), .C(n39), .D(n62), .Y(n64) );
  NOR2X1 U95 ( .A(n66), .B(n65), .Y(n67) );
  NAND3X1 U96 ( .A(n69), .B(n68), .C(n67), .Y(N163) );
  OAI21X1 U97 ( .A(n25), .B(n148), .C(n3), .Y(n71) );
  NAND2X1 U98 ( .A(n45), .B(n40), .Y(n70) );
  NAND2X1 U99 ( .A(n71), .B(n70), .Y(n73) );
  NAND3X1 U100 ( .A(n152), .B(n6), .C(n38), .Y(n72) );
  OAI21X1 U101 ( .A(n74), .B(n73), .C(n72), .Y(n82) );
  NAND2X1 U102 ( .A(n28), .B(n48), .Y(n118) );
  AOI21X1 U103 ( .A(n45), .B(n152), .C(n118), .Y(n75) );
  NAND2X1 U104 ( .A(n75), .B(n148), .Y(n80) );
  NAND3X1 U105 ( .A(n76), .B(n4), .C(n25), .Y(n79) );
  XOR2X1 U106 ( .A(n152), .B(n45), .Y(n137) );
  NAND3X1 U107 ( .A(n19), .B(n34), .C(n77), .Y(n78) );
  NAND3X1 U108 ( .A(n80), .B(n79), .C(n78), .Y(n81) );
  NOR2X1 U109 ( .A(n82), .B(n81), .Y(n94) );
  NAND2X1 U110 ( .A(n48), .B(n152), .Y(n97) );
  INVX2 U111 ( .A(n97), .Y(n92) );
  MUX2X1 U112 ( .B(n9), .A(n35), .S(n39), .Y(n85) );
  NAND2X1 U113 ( .A(n17), .B(n45), .Y(n84) );
  NAND2X1 U114 ( .A(n84), .B(n85), .Y(n91) );
  AOI22X1 U115 ( .A(n38), .B(n35), .C(n42), .D(n4), .Y(n88) );
  NAND2X1 U116 ( .A(n41), .B(n49), .Y(n151) );
  NAND2X1 U117 ( .A(n151), .B(n33), .Y(n86) );
  NAND2X1 U118 ( .A(n39), .B(n86), .Y(n87) );
  NAND3X1 U119 ( .A(n89), .B(n88), .C(n87), .Y(n90) );
  AOI22X1 U120 ( .A(n91), .B(n92), .C(n23), .D(n90), .Y(n93) );
  NAND2X1 U121 ( .A(n94), .B(n93), .Y(N140) );
  NAND2X1 U122 ( .A(n51), .B(n49), .Y(n106) );
  NAND2X1 U123 ( .A(n26), .B(n48), .Y(n117) );
  OAI21X1 U124 ( .A(n106), .B(n29), .C(n95), .Y(n104) );
  AOI21X1 U125 ( .A(n49), .B(n40), .C(n10), .Y(n102) );
  NOR2X1 U126 ( .A(n51), .B(n47), .Y(n96) );
  OAI21X1 U127 ( .A(n45), .B(n9), .C(n96), .Y(n101) );
  OAI21X1 U128 ( .A(n18), .B(n150), .C(n139), .Y(n99) );
  NOR2X1 U129 ( .A(n148), .B(n97), .Y(n98) );
  OAI21X1 U130 ( .A(n42), .B(n99), .C(n98), .Y(n100) );
  OAI21X1 U131 ( .A(n102), .B(n101), .C(n100), .Y(n103) );
  NOR2X1 U132 ( .A(n104), .B(n103), .Y(n128) );
  MUX2X1 U133 ( .B(n28), .A(n36), .S(n44), .Y(n157) );
  OAI21X1 U134 ( .A(n45), .B(n110), .C(n109), .Y(n111) );
  NAND2X1 U135 ( .A(n47), .B(n44), .Y(n138) );
  NAND2X1 U136 ( .A(n17), .B(n150), .Y(n122) );
  INVX2 U137 ( .A(n122), .Y(n114) );
  NAND2X1 U138 ( .A(n28), .B(n44), .Y(n116) );
  NAND2X1 U139 ( .A(n116), .B(n15), .Y(n113) );
  AOI21X1 U140 ( .A(n114), .B(n4), .C(n113), .Y(n115) );
  OAI21X1 U141 ( .A(n138), .B(n40), .C(n115), .Y(n124) );
  OAI22X1 U142 ( .A(n152), .B(n118), .C(n117), .D(n150), .Y(n119) );
  OAI21X1 U143 ( .A(n125), .B(n122), .C(n121), .Y(n123) );
  AOI22X1 U144 ( .A(n125), .B(n124), .C(n123), .D(n148), .Y(n126) );
  NAND3X1 U145 ( .A(n128), .B(n127), .C(n126), .Y(data_out[2]) );
  NOR2X1 U146 ( .A(n152), .B(n138), .Y(n136) );
  NAND2X1 U147 ( .A(n17), .B(n129), .Y(n134) );
  INVX2 U148 ( .A(n130), .Y(n132) );
  NAND3X1 U149 ( .A(n132), .B(n150), .C(n25), .Y(n133) );
  OAI21X1 U150 ( .A(n138), .B(n134), .C(n133), .Y(n135) );
  AOI21X1 U151 ( .A(n6), .B(n136), .C(n135), .Y(n162) );
  NOR2X1 U152 ( .A(n4), .B(n40), .Y(n146) );
  NAND2X1 U153 ( .A(n76), .B(n17), .Y(n143) );
  NOR2X1 U154 ( .A(n150), .B(n139), .Y(n140) );
  AOI22X1 U155 ( .A(n76), .B(n141), .C(n140), .D(n76), .Y(n142) );
  OAI21X1 U156 ( .A(n5), .B(n143), .C(n142), .Y(n144) );
  AOI21X1 U157 ( .A(n146), .B(n145), .C(n144), .Y(n161) );
  OAI21X1 U158 ( .A(n12), .B(n147), .C(n23), .Y(n159) );
  NAND3X1 U159 ( .A(n49), .B(n148), .C(n17), .Y(n149) );
  OAI21X1 U160 ( .A(n151), .B(n150), .C(n149), .Y(n155) );
  NAND2X1 U161 ( .A(n3), .B(n48), .Y(n153) );
  OAI21X1 U162 ( .A(n47), .B(n153), .C(n152), .Y(n154) );
  NOR2X1 U163 ( .A(n155), .B(n154), .Y(n156) );
  OAI21X1 U164 ( .A(n12), .B(n49), .C(n156), .Y(n158) );
  NAND2X1 U165 ( .A(n159), .B(n158), .Y(n160) );
  NAND3X1 U166 ( .A(n162), .B(n160), .C(n161), .Y(N55) );
endmodule


module Sbox6_0 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N59, N101, N137, N164, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178;
  assign data_out[3] = N59;
  assign data_out[2] = N101;
  assign data_out[1] = N137;
  assign data_out[0] = N164;

  INVX1 U1 ( .A(n25), .Y(n1) );
  INVX2 U2 ( .A(n25), .Y(n44) );
  INVX2 U3 ( .A(n46), .Y(n31) );
  INVX8 U4 ( .A(n56), .Y(n58) );
  AND2X2 U5 ( .A(n45), .B(n2), .Y(n66) );
  AND2X1 U6 ( .A(n145), .B(n3), .Y(n2) );
  INVX1 U7 ( .A(n53), .Y(n3) );
  INVX2 U8 ( .A(n55), .Y(n4) );
  INVX4 U9 ( .A(data_in[1]), .Y(n52) );
  OR2X2 U10 ( .A(n54), .B(n154), .Y(n95) );
  INVX2 U11 ( .A(n50), .Y(n5) );
  INVX1 U12 ( .A(n47), .Y(n6) );
  INVX2 U13 ( .A(n47), .Y(n33) );
  INVX2 U14 ( .A(data_in[5]), .Y(n165) );
  INVX2 U15 ( .A(n130), .Y(n169) );
  INVX1 U16 ( .A(n16), .Y(n20) );
  INVX1 U17 ( .A(n95), .Y(n7) );
  INVX1 U18 ( .A(n95), .Y(n170) );
  AND2X1 U19 ( .A(n77), .B(n76), .Y(n8) );
  INVX2 U20 ( .A(n45), .Y(n9) );
  AND2X2 U21 ( .A(n37), .B(n142), .Y(n45) );
  INVX2 U22 ( .A(data_in[3]), .Y(n154) );
  INVX2 U23 ( .A(n23), .Y(n15) );
  INVX4 U24 ( .A(n140), .Y(n147) );
  INVX2 U25 ( .A(n161), .Y(n164) );
  NOR2X1 U26 ( .A(n10), .B(n11), .Y(n12) );
  NOR2X1 U27 ( .A(n12), .B(n60), .Y(n61) );
  INVX1 U28 ( .A(n106), .Y(n10) );
  INVX1 U29 ( .A(n157), .Y(n11) );
  INVX8 U30 ( .A(n53), .Y(n157) );
  INVX8 U31 ( .A(n57), .Y(n145) );
  INVX4 U32 ( .A(n55), .Y(n26) );
  AND2X2 U33 ( .A(n165), .B(n5), .Y(n13) );
  INVX2 U34 ( .A(n13), .Y(n156) );
  INVX2 U35 ( .A(n6), .Y(n34) );
  INVX1 U36 ( .A(n117), .Y(n14) );
  INVX2 U37 ( .A(n147), .Y(n23) );
  INVX2 U38 ( .A(n34), .Y(n48) );
  BUFX2 U39 ( .A(n51), .Y(n16) );
  BUFX2 U40 ( .A(data_in[0]), .Y(n51) );
  INVX1 U41 ( .A(n42), .Y(n17) );
  INVX1 U42 ( .A(n17), .Y(n18) );
  AND2X2 U43 ( .A(n37), .B(n142), .Y(n19) );
  INVX2 U44 ( .A(n48), .Y(n29) );
  AND2X2 U45 ( .A(n50), .B(n165), .Y(n28) );
  INVX4 U46 ( .A(data_in[4]), .Y(n56) );
  INVX1 U47 ( .A(n41), .Y(n21) );
  NAND2X1 U48 ( .A(n75), .B(n8), .Y(N164) );
  INVX1 U49 ( .A(n38), .Y(n22) );
  INVX8 U50 ( .A(n54), .Y(n55) );
  BUFX2 U51 ( .A(n49), .Y(n24) );
  BUFX4 U52 ( .A(n166), .Y(n41) );
  OR2X2 U53 ( .A(n36), .B(n56), .Y(n25) );
  MUX2X1 U54 ( .B(n30), .A(n42), .S(n142), .Y(n153) );
  INVX4 U55 ( .A(n142), .Y(n27) );
  INVX4 U56 ( .A(n28), .Y(n167) );
  AND2X2 U57 ( .A(n50), .B(n165), .Y(n30) );
  INVX2 U58 ( .A(n30), .Y(n117) );
  OR2X2 U59 ( .A(n95), .B(n140), .Y(n79) );
  INVX4 U60 ( .A(data_in[2]), .Y(n54) );
  NOR2X1 U61 ( .A(n29), .B(n31), .Y(n32) );
  NOR2X1 U62 ( .A(n32), .B(n78), .Y(n87) );
  INVX1 U63 ( .A(n131), .Y(n63) );
  BUFX2 U64 ( .A(n14), .Y(n35) );
  INVX2 U65 ( .A(data_in[0]), .Y(n50) );
  INVX1 U66 ( .A(data_in[3]), .Y(n36) );
  BUFX4 U67 ( .A(data_in[3]), .Y(n37) );
  INVX1 U68 ( .A(n153), .Y(n155) );
  INVX4 U69 ( .A(n56), .Y(n57) );
  INVX8 U70 ( .A(n55), .Y(n142) );
  BUFX2 U71 ( .A(n154), .Y(n38) );
  BUFX2 U72 ( .A(n154), .Y(n39) );
  BUFX4 U73 ( .A(n36), .Y(n40) );
  INVX2 U74 ( .A(n166), .Y(n128) );
  AND2X2 U75 ( .A(n165), .B(n51), .Y(n42) );
  AND2X2 U76 ( .A(n26), .B(n145), .Y(n43) );
  XNOR2X1 U77 ( .A(n4), .B(n53), .Y(n46) );
  INVX2 U78 ( .A(data_in[5]), .Y(n47) );
  INVX1 U79 ( .A(n51), .Y(n49) );
  INVX8 U80 ( .A(n52), .Y(n53) );
  NAND2X1 U81 ( .A(n22), .B(n16), .Y(n59) );
  NAND2X1 U82 ( .A(n33), .B(n50), .Y(n166) );
  NAND2X1 U83 ( .A(n128), .B(n26), .Y(n69) );
  MUX2X1 U84 ( .B(n59), .A(n69), .S(n58), .Y(n62) );
  NAND2X1 U85 ( .A(n57), .B(n38), .Y(n106) );
  NAND2X1 U86 ( .A(data_in[0]), .B(n33), .Y(n140) );
  OAI21X1 U87 ( .A(n157), .B(n43), .C(n147), .Y(n60) );
  AOI21X1 U88 ( .A(n62), .B(n157), .C(n61), .Y(n77) );
  NAND2X1 U89 ( .A(n58), .B(n34), .Y(n96) );
  INVX2 U90 ( .A(n96), .Y(n64) );
  MUX2X1 U91 ( .B(n13), .A(n28), .S(n57), .Y(n131) );
  AOI22X1 U92 ( .A(n64), .B(n46), .C(n7), .D(n63), .Y(n76) );
  OAI22X1 U93 ( .A(n27), .B(n48), .C(n58), .D(n167), .Y(n65) );
  NAND2X1 U94 ( .A(n65), .B(n39), .Y(n68) );
  NAND3X1 U95 ( .A(n40), .B(n145), .C(n128), .Y(n103) );
  INVX2 U96 ( .A(n103), .Y(n143) );
  NAND2X1 U97 ( .A(n45), .B(n145), .Y(n91) );
  AOI22X1 U98 ( .A(n143), .B(n157), .C(n29), .D(n66), .Y(n67) );
  OAI21X1 U99 ( .A(n157), .B(n68), .C(n67), .Y(n74) );
  NAND3X1 U100 ( .A(n27), .B(n53), .C(n128), .Y(n80) );
  OAI21X1 U101 ( .A(n53), .B(n41), .C(n69), .Y(n71) );
  NAND3X1 U102 ( .A(n27), .B(n53), .C(n147), .Y(n150) );
  INVX2 U103 ( .A(n150), .Y(n70) );
  AOI22X1 U104 ( .A(n71), .B(n1), .C(n70), .D(n58), .Y(n72) );
  OAI21X1 U105 ( .A(n58), .B(n80), .C(n72), .Y(n73) );
  NOR2X1 U106 ( .A(n74), .B(n73), .Y(n75) );
  NAND3X1 U107 ( .A(n145), .B(n153), .C(n79), .Y(n78) );
  INVX2 U108 ( .A(n79), .Y(n81) );
  INVX2 U109 ( .A(n80), .Y(n163) );
  OAI22X1 U110 ( .A(n81), .B(n40), .C(n163), .D(n145), .Y(n86) );
  NAND2X1 U111 ( .A(n37), .B(n4), .Y(n130) );
  OAI21X1 U112 ( .A(n27), .B(n145), .C(n157), .Y(n82) );
  NAND2X1 U113 ( .A(n14), .B(n82), .Y(n83) );
  OAI21X1 U114 ( .A(n41), .B(n26), .C(n83), .Y(n84) );
  OAI21X1 U115 ( .A(n169), .B(n1), .C(n84), .Y(n85) );
  OAI21X1 U116 ( .A(n87), .B(n86), .C(n85), .Y(n102) );
  NAND2X1 U117 ( .A(n13), .B(n58), .Y(n90) );
  OAI21X1 U118 ( .A(n37), .B(n34), .C(n140), .Y(n88) );
  NAND3X1 U119 ( .A(n58), .B(n26), .C(n88), .Y(n89) );
  OAI21X1 U120 ( .A(n95), .B(n90), .C(n89), .Y(n93) );
  OAI22X1 U121 ( .A(n153), .B(n44), .C(n91), .D(n41), .Y(n92) );
  NOR2X1 U122 ( .A(n93), .B(n92), .Y(n100) );
  NAND3X1 U123 ( .A(n147), .B(n40), .C(n58), .Y(n94) );
  OAI21X1 U124 ( .A(n95), .B(n41), .C(n94), .Y(n98) );
  NAND3X1 U125 ( .A(n13), .B(n27), .C(n39), .Y(n161) );
  OAI21X1 U126 ( .A(n9), .B(n96), .C(n161), .Y(n97) );
  NOR2X1 U127 ( .A(n98), .B(n97), .Y(n99) );
  MUX2X1 U128 ( .B(n100), .A(n99), .S(n53), .Y(n101) );
  OR2X2 U129 ( .A(n102), .B(n101), .Y(N137) );
  NOR2X1 U130 ( .A(n39), .B(n156), .Y(n105) );
  NAND2X1 U131 ( .A(n58), .B(n147), .Y(n114) );
  OAI21X1 U132 ( .A(n114), .B(n19), .C(n103), .Y(n104) );
  AOI21X1 U133 ( .A(n105), .B(n145), .C(n104), .Y(n113) );
  INVX2 U134 ( .A(n106), .Y(n162) );
  NAND2X1 U135 ( .A(n18), .B(n27), .Y(n110) );
  NAND2X1 U136 ( .A(n58), .B(n40), .Y(n109) );
  NOR2X1 U137 ( .A(n37), .B(n26), .Y(n107) );
  OAI21X1 U138 ( .A(n147), .B(n30), .C(n107), .Y(n108) );
  OAI21X1 U139 ( .A(n110), .B(n109), .C(n108), .Y(n111) );
  AOI21X1 U140 ( .A(n162), .B(n35), .C(n111), .Y(n112) );
  AND2X2 U141 ( .A(n113), .B(n112), .Y(n139) );
  INVX2 U142 ( .A(n114), .Y(n116) );
  OAI21X1 U143 ( .A(n58), .B(n29), .C(n167), .Y(n115) );
  AOI22X1 U144 ( .A(n116), .B(n169), .C(n170), .D(n115), .Y(n123) );
  NAND2X1 U145 ( .A(n39), .B(n26), .Y(n120) );
  OAI21X1 U146 ( .A(n49), .B(n34), .C(n117), .Y(n118) );
  NAND2X1 U147 ( .A(n118), .B(n145), .Y(n119) );
  OAI21X1 U148 ( .A(n120), .B(n119), .C(n161), .Y(n121) );
  AOI21X1 U149 ( .A(n21), .B(n162), .C(n121), .Y(n122) );
  NAND2X1 U150 ( .A(n123), .B(n122), .Y(n137) );
  MUX2X1 U151 ( .B(n162), .A(n43), .S(n53), .Y(n135) );
  NAND2X1 U152 ( .A(n53), .B(n16), .Y(n127) );
  NAND2X1 U153 ( .A(n19), .B(n145), .Y(n126) );
  NOR2X1 U154 ( .A(n58), .B(n37), .Y(n124) );
  NAND3X1 U155 ( .A(n27), .B(n128), .C(n124), .Y(n125) );
  OAI21X1 U156 ( .A(n127), .B(n126), .C(n125), .Y(n133) );
  NAND3X1 U157 ( .A(n128), .B(n53), .C(n44), .Y(n129) );
  OAI21X1 U158 ( .A(n131), .B(n9), .C(n129), .Y(n132) );
  NOR2X1 U159 ( .A(n133), .B(n132), .Y(n134) );
  OAI21X1 U160 ( .A(n135), .B(n156), .C(n134), .Y(n136) );
  AOI21X1 U161 ( .A(n137), .B(n157), .C(n136), .Y(n138) );
  OAI21X1 U162 ( .A(n139), .B(n157), .C(n138), .Y(N101) );
  OAI21X1 U163 ( .A(n167), .B(n157), .C(n23), .Y(n141) );
  INVX2 U164 ( .A(n141), .Y(n146) );
  NOR2X1 U165 ( .A(n27), .B(n146), .Y(n144) );
  AOI22X1 U166 ( .A(n162), .B(n144), .C(n143), .D(n26), .Y(n178) );
  NAND2X1 U167 ( .A(n145), .B(n157), .Y(n148) );
  OAI21X1 U168 ( .A(n24), .B(n148), .C(n146), .Y(n152) );
  AOI22X1 U169 ( .A(n15), .B(n37), .C(n40), .D(n20), .Y(n149) );
  OAI22X1 U170 ( .A(n58), .B(n150), .C(n149), .D(n148), .Y(n151) );
  AOI21X1 U171 ( .A(n7), .B(n152), .C(n151), .Y(n177) );
  NAND2X1 U172 ( .A(n155), .B(n39), .Y(n160) );
  NOR2X1 U173 ( .A(n157), .B(n156), .Y(n158) );
  OAI21X1 U174 ( .A(n169), .B(n1), .C(n158), .Y(n159) );
  OAI21X1 U175 ( .A(n58), .B(n160), .C(n159), .Y(n175) );
  AOI22X1 U176 ( .A(n164), .B(n58), .C(n163), .D(n162), .Y(n173) );
  NOR2X1 U177 ( .A(n53), .B(n34), .Y(n171) );
  MUX2X1 U178 ( .B(n167), .A(n41), .S(n53), .Y(n168) );
  AOI22X1 U179 ( .A(n171), .B(n170), .C(n169), .D(n168), .Y(n172) );
  NAND2X1 U180 ( .A(n172), .B(n173), .Y(n174) );
  NOR2X1 U181 ( .A(n175), .B(n174), .Y(n176) );
  NAND3X1 U182 ( .A(n176), .B(n178), .C(n177), .Y(N59) );
endmodule


module Sbox7_0 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N61, N96, N131, N161, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150;
  assign data_out[3] = N61;
  assign data_out[2] = N96;
  assign data_out[1] = N131;
  assign data_out[0] = N161;

  INVX2 U1 ( .A(n36), .Y(n83) );
  INVX2 U2 ( .A(n104), .Y(n91) );
  INVX8 U3 ( .A(n50), .Y(n145) );
  INVX2 U4 ( .A(n34), .Y(n33) );
  INVX1 U5 ( .A(n12), .Y(n1) );
  INVX2 U6 ( .A(n141), .Y(n12) );
  AND2X1 U7 ( .A(n10), .B(n46), .Y(n40) );
  AND2X1 U8 ( .A(n7), .B(n46), .Y(n2) );
  BUFX2 U9 ( .A(n29), .Y(n3) );
  INVX1 U10 ( .A(n47), .Y(n4) );
  BUFX4 U11 ( .A(data_in[3]), .Y(n45) );
  INVX2 U12 ( .A(n103), .Y(n75) );
  INVX1 U13 ( .A(n14), .Y(n5) );
  AND2X1 U14 ( .A(n139), .B(n138), .Y(n144) );
  NAND2X1 U15 ( .A(n48), .B(n43), .Y(n6) );
  AND2X1 U16 ( .A(n50), .B(n44), .Y(n7) );
  INVX2 U17 ( .A(n9), .Y(n18) );
  AND2X1 U18 ( .A(n40), .B(n36), .Y(n8) );
  NAND2X1 U19 ( .A(n43), .B(n95), .Y(n9) );
  INVX4 U20 ( .A(n11), .Y(n23) );
  AND2X2 U21 ( .A(n43), .B(n111), .Y(n10) );
  NAND2X1 U22 ( .A(data_in[5]), .B(data_in[0]), .Y(n11) );
  INVX2 U23 ( .A(n122), .Y(n105) );
  INVX2 U24 ( .A(n86), .Y(n51) );
  INVX2 U25 ( .A(n44), .Y(n31) );
  INVX2 U26 ( .A(data_in[0]), .Y(n141) );
  INVX1 U27 ( .A(n10), .Y(n13) );
  INVX1 U28 ( .A(n114), .Y(n14) );
  NAND2X1 U29 ( .A(n15), .B(n8), .Y(n16) );
  NAND2X1 U30 ( .A(n16), .B(n80), .Y(n85) );
  INVX1 U31 ( .A(n145), .Y(n15) );
  AND2X2 U32 ( .A(n4), .B(n43), .Y(n17) );
  INVX1 U33 ( .A(n18), .Y(n19) );
  AND2X2 U34 ( .A(n43), .B(n111), .Y(n20) );
  BUFX2 U35 ( .A(n125), .Y(n21) );
  AND2X2 U36 ( .A(n32), .B(n34), .Y(n22) );
  INVX1 U37 ( .A(n22), .Y(n82) );
  INVX4 U38 ( .A(data_in[1]), .Y(n47) );
  BUFX2 U39 ( .A(n117), .Y(n24) );
  INVX1 U40 ( .A(n75), .Y(n25) );
  BUFX4 U41 ( .A(data_in[3]), .Y(n46) );
  AND2X2 U42 ( .A(n94), .B(n122), .Y(n26) );
  INVX1 U43 ( .A(n105), .Y(n27) );
  INVX2 U44 ( .A(n94), .Y(n114) );
  OR2X2 U45 ( .A(n137), .B(data_in[0]), .Y(n94) );
  BUFX2 U46 ( .A(data_in[5]), .Y(n44) );
  INVX2 U47 ( .A(data_in[5]), .Y(n137) );
  AND2X2 U48 ( .A(n46), .B(n90), .Y(n28) );
  INVX1 U49 ( .A(n138), .Y(n109) );
  INVX1 U50 ( .A(n74), .Y(n52) );
  AND2X2 U51 ( .A(n48), .B(n95), .Y(n29) );
  INVX1 U52 ( .A(n29), .Y(n76) );
  INVX2 U53 ( .A(n35), .Y(n30) );
  BUFX4 U54 ( .A(n48), .Y(n34) );
  AND2X2 U55 ( .A(n43), .B(n95), .Y(n32) );
  MUX2X1 U56 ( .B(n53), .A(n54), .S(n33), .Y(n63) );
  INVX4 U57 ( .A(n42), .Y(n90) );
  NAND2X1 U58 ( .A(n2), .B(n10), .Y(n57) );
  BUFX2 U59 ( .A(n1), .Y(n35) );
  AND2X2 U60 ( .A(n137), .B(n141), .Y(n36) );
  INVX1 U61 ( .A(n23), .Y(n107) );
  INVX4 U62 ( .A(n45), .Y(n95) );
  INVX8 U63 ( .A(n48), .Y(n111) );
  AND2X2 U64 ( .A(n46), .B(n111), .Y(n37) );
  AND2X2 U65 ( .A(n46), .B(n43), .Y(n38) );
  AND2X2 U66 ( .A(n114), .B(n95), .Y(n39) );
  AND2X2 U67 ( .A(n50), .B(n23), .Y(n41) );
  INVX4 U68 ( .A(n49), .Y(n50) );
  INVX2 U69 ( .A(data_in[4]), .Y(n49) );
  BUFX2 U70 ( .A(data_in[2]), .Y(n42) );
  BUFX4 U71 ( .A(data_in[2]), .Y(n43) );
  INVX8 U72 ( .A(n47), .Y(n48) );
  NAND2X1 U73 ( .A(n12), .B(n137), .Y(n122) );
  NAND2X1 U74 ( .A(n32), .B(n105), .Y(n54) );
  NAND2X1 U75 ( .A(n46), .B(n90), .Y(n74) );
  NAND2X1 U76 ( .A(n94), .B(n122), .Y(n125) );
  NAND3X1 U77 ( .A(n23), .B(n95), .C(n90), .Y(n86) );
  AOI21X1 U78 ( .A(n125), .B(n52), .C(n51), .Y(n53) );
  NOR2X1 U79 ( .A(n50), .B(n4), .Y(n56) );
  NOR2X1 U80 ( .A(n111), .B(n145), .Y(n55) );
  AOI22X1 U81 ( .A(n74), .B(n56), .C(n55), .D(n90), .Y(n58) );
  OAI21X1 U82 ( .A(n58), .B(n26), .C(n57), .Y(n62) );
  NOR2X1 U83 ( .A(n50), .B(n9), .Y(n60) );
  OAI21X1 U84 ( .A(n34), .B(n31), .C(n26), .Y(n59) );
  AND2X2 U85 ( .A(n60), .B(n59), .Y(n61) );
  NOR3X1 U86 ( .A(n62), .B(n63), .C(n61), .Y(n73) );
  OAI21X1 U87 ( .A(n50), .B(n107), .C(n83), .Y(n65) );
  NAND2X1 U88 ( .A(n48), .B(n46), .Y(n104) );
  NAND2X1 U89 ( .A(n91), .B(n43), .Y(n93) );
  NAND3X1 U90 ( .A(n90), .B(n111), .C(n46), .Y(n140) );
  NAND2X1 U91 ( .A(n93), .B(n140), .Y(n64) );
  NAND2X1 U92 ( .A(n65), .B(n64), .Y(n72) );
  NOR2X1 U93 ( .A(n46), .B(n20), .Y(n70) );
  NAND3X1 U94 ( .A(n145), .B(n36), .C(n90), .Y(n68) );
  NAND2X1 U95 ( .A(n111), .B(n95), .Y(n103) );
  NAND2X1 U96 ( .A(n6), .B(n25), .Y(n66) );
  NAND3X1 U97 ( .A(n50), .B(n36), .C(n66), .Y(n67) );
  OAI21X1 U98 ( .A(n76), .B(n68), .C(n67), .Y(n69) );
  AOI21X1 U99 ( .A(n70), .B(n41), .C(n69), .Y(n71) );
  NAND3X1 U100 ( .A(n72), .B(n71), .C(n73), .Y(N161) );
  NAND2X1 U101 ( .A(n34), .B(n28), .Y(n123) );
  NAND2X1 U102 ( .A(n75), .B(n90), .Y(n124) );
  NAND2X1 U103 ( .A(n124), .B(n123), .Y(n79) );
  NOR2X1 U104 ( .A(n50), .B(n29), .Y(n77) );
  AOI21X1 U105 ( .A(n140), .B(n77), .C(n83), .Y(n78) );
  OAI21X1 U106 ( .A(n145), .B(n79), .C(n78), .Y(n80) );
  OAI21X1 U107 ( .A(n37), .B(n22), .C(n41), .Y(n81) );
  OAI21X1 U108 ( .A(n83), .B(n82), .C(n81), .Y(n84) );
  NOR2X1 U109 ( .A(n84), .B(n85), .Y(n102) );
  NOR2X1 U110 ( .A(n50), .B(n51), .Y(n87) );
  OAI21X1 U111 ( .A(n27), .B(n6), .C(n87), .Y(n100) );
  OAI21X1 U112 ( .A(n20), .B(n91), .C(n114), .Y(n89) );
  MUX2X1 U113 ( .B(n18), .A(n38), .S(n44), .Y(n88) );
  NAND2X1 U114 ( .A(n89), .B(n88), .Y(n99) );
  OAI21X1 U115 ( .A(n91), .B(n90), .C(n105), .Y(n92) );
  OAI21X1 U116 ( .A(n14), .B(n93), .C(n92), .Y(n98) );
  AOI22X1 U117 ( .A(n39), .B(n6), .C(n28), .D(n30), .Y(n96) );
  NAND2X1 U118 ( .A(n50), .B(n96), .Y(n97) );
  OAI22X1 U119 ( .A(n100), .B(n99), .C(n98), .D(n97), .Y(n101) );
  NAND2X1 U120 ( .A(n101), .B(n102), .Y(N131) );
  NAND2X1 U121 ( .A(n104), .B(n103), .Y(n117) );
  NAND2X1 U122 ( .A(n105), .B(n117), .Y(n138) );
  AOI21X1 U123 ( .A(n37), .B(n36), .C(n145), .Y(n106) );
  OAI21X1 U124 ( .A(n107), .B(n140), .C(n106), .Y(n108) );
  NOR2X1 U125 ( .A(n109), .B(n108), .Y(n121) );
  OAI22X1 U126 ( .A(n43), .B(n111), .C(n34), .D(n9), .Y(n130) );
  OAI21X1 U127 ( .A(n36), .B(n23), .C(n29), .Y(n139) );
  OAI21X1 U128 ( .A(n35), .B(n6), .C(n139), .Y(n110) );
  AOI21X1 U129 ( .A(n5), .B(n130), .C(n110), .Y(n120) );
  NAND2X1 U130 ( .A(n111), .B(n31), .Y(n112) );
  OAI21X1 U131 ( .A(n43), .B(n112), .C(n145), .Y(n113) );
  AOI21X1 U132 ( .A(n17), .B(n35), .C(n113), .Y(n116) );
  OAI21X1 U133 ( .A(n3), .B(n37), .C(n114), .Y(n115) );
  AND2X2 U134 ( .A(n116), .B(n115), .Y(n119) );
  AOI22X1 U135 ( .A(n22), .B(n31), .C(n23), .D(n24), .Y(n118) );
  AOI22X1 U136 ( .A(n120), .B(n121), .C(n119), .D(n118), .Y(N96) );
  AOI21X1 U137 ( .A(n124), .B(n123), .C(n27), .Y(n129) );
  NAND2X1 U138 ( .A(n13), .B(n39), .Y(n127) );
  NAND3X1 U139 ( .A(n46), .B(n21), .C(n20), .Y(n126) );
  NAND2X1 U140 ( .A(n127), .B(n126), .Y(n128) );
  NOR2X1 U141 ( .A(n129), .B(n128), .Y(n150) );
  NAND2X1 U142 ( .A(n36), .B(n130), .Y(n134) );
  OAI21X1 U143 ( .A(n34), .B(n43), .C(n6), .Y(n131) );
  NAND2X1 U144 ( .A(n23), .B(n131), .Y(n133) );
  NAND3X1 U145 ( .A(n30), .B(n18), .C(n34), .Y(n132) );
  NAND3X1 U146 ( .A(n132), .B(n133), .C(n134), .Y(n135) );
  NOR2X1 U147 ( .A(n145), .B(n135), .Y(n149) );
  AOI22X1 U148 ( .A(n23), .B(n20), .C(n38), .D(n36), .Y(n136) );
  OAI21X1 U149 ( .A(n31), .B(n19), .C(n136), .Y(n147) );
  INVX2 U150 ( .A(n140), .Y(n142) );
  OAI21X1 U151 ( .A(n17), .B(n142), .C(n35), .Y(n143) );
  NAND3X1 U152 ( .A(n145), .B(n143), .C(n144), .Y(n146) );
  NOR2X1 U153 ( .A(n147), .B(n146), .Y(n148) );
  AOI21X1 U154 ( .A(n150), .B(n149), .C(n148), .Y(N61) );
endmodule


module Sbox8_0 ( data_in, data_out );
  input [5:0] data_in;
  output [3:0] data_out;
  wire   N59, N98, N129, N162, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130;
  assign data_out[3] = N59;
  assign data_out[2] = N98;
  assign data_out[1] = N129;
  assign data_out[0] = N162;

  NAND2X1 U1 ( .A(n37), .B(n81), .Y(n1) );
  NAND2X1 U2 ( .A(n122), .B(n2), .Y(n82) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX2 U4 ( .A(n35), .Y(n17) );
  INVX1 U5 ( .A(n31), .Y(n109) );
  INVX2 U6 ( .A(n6), .Y(n3) );
  INVX2 U7 ( .A(n97), .Y(n4) );
  INVX1 U8 ( .A(data_in[5]), .Y(n68) );
  INVX4 U9 ( .A(n37), .Y(n121) );
  AND2X2 U10 ( .A(n26), .B(n81), .Y(n5) );
  AND2X2 U11 ( .A(n35), .B(n81), .Y(n22) );
  INVX4 U12 ( .A(data_in[3]), .Y(n34) );
  BUFX2 U13 ( .A(data_in[5]), .Y(n6) );
  BUFX2 U14 ( .A(n123), .Y(n28) );
  BUFX4 U15 ( .A(n10), .Y(n7) );
  INVX1 U16 ( .A(n77), .Y(n8) );
  AND2X2 U17 ( .A(data_in[5]), .B(data_in[0]), .Y(n9) );
  INVX4 U18 ( .A(n9), .Y(n96) );
  INVX4 U19 ( .A(n32), .Y(n10) );
  INVX4 U20 ( .A(n32), .Y(n33) );
  OR2X2 U21 ( .A(data_in[5]), .B(data_in[0]), .Y(n11) );
  INVX1 U22 ( .A(n11), .Y(n20) );
  INVX2 U23 ( .A(data_in[0]), .Y(n39) );
  AND2X1 U24 ( .A(n128), .B(n127), .Y(n129) );
  OR2X2 U25 ( .A(n34), .B(n33), .Y(n122) );
  INVX4 U26 ( .A(n33), .Y(n103) );
  INVX1 U27 ( .A(n39), .Y(n12) );
  INVX1 U28 ( .A(n80), .Y(n43) );
  BUFX2 U29 ( .A(n23), .Y(n13) );
  BUFX2 U30 ( .A(n35), .Y(n14) );
  INVX4 U31 ( .A(n19), .Y(n77) );
  AND2X2 U32 ( .A(n37), .B(n103), .Y(n15) );
  AND2X2 U33 ( .A(n37), .B(n103), .Y(n16) );
  AND2X2 U34 ( .A(n35), .B(n81), .Y(n18) );
  AND2X2 U35 ( .A(n31), .B(n35), .Y(n19) );
  MUX2X1 U36 ( .B(n11), .A(n3), .S(n17), .Y(n47) );
  AND2X2 U37 ( .A(n10), .B(n121), .Y(n26) );
  NAND2X1 U38 ( .A(n36), .B(n32), .Y(n110) );
  INVX1 U39 ( .A(n18), .Y(n101) );
  INVX4 U40 ( .A(data_in[1]), .Y(n32) );
  INVX8 U41 ( .A(n36), .Y(n37) );
  INVX4 U42 ( .A(data_in[4]), .Y(n36) );
  BUFX4 U43 ( .A(data_in[2]), .Y(n31) );
  AND2X2 U44 ( .A(data_in[5]), .B(n39), .Y(n21) );
  INVX2 U45 ( .A(n21), .Y(n120) );
  INVX4 U46 ( .A(n23), .Y(n97) );
  INVX4 U47 ( .A(n30), .Y(n81) );
  AND2X2 U48 ( .A(data_in[0]), .B(n68), .Y(n23) );
  AND2X2 U49 ( .A(n124), .B(n29), .Y(n24) );
  AND2X2 U50 ( .A(n37), .B(n103), .Y(n25) );
  BUFX2 U51 ( .A(n123), .Y(n27) );
  BUFX2 U52 ( .A(n123), .Y(n29) );
  BUFX2 U53 ( .A(data_in[2]), .Y(n30) );
  INVX1 U54 ( .A(n28), .Y(n92) );
  INVX8 U55 ( .A(n34), .Y(n35) );
  OAI22X1 U56 ( .A(n15), .B(n11), .C(n7), .D(n97), .Y(n38) );
  NAND2X1 U57 ( .A(n31), .B(n34), .Y(n123) );
  OAI22X1 U58 ( .A(n103), .B(n27), .C(n31), .D(n110), .Y(n76) );
  AOI22X1 U59 ( .A(n8), .B(n38), .C(n21), .D(n76), .Y(n54) );
  MUX2X1 U60 ( .B(n96), .A(n120), .S(n14), .Y(n41) );
  NAND2X1 U61 ( .A(n22), .B(n39), .Y(n98) );
  OAI21X1 U62 ( .A(n11), .B(n28), .C(n98), .Y(n40) );
  OAI21X1 U63 ( .A(n41), .B(n40), .C(n25), .Y(n53) );
  OAI21X1 U64 ( .A(n31), .B(n6), .C(n97), .Y(n42) );
  NAND2X1 U65 ( .A(n10), .B(n37), .Y(n80) );
  NAND2X1 U66 ( .A(n110), .B(n80), .Y(n102) );
  NAND2X1 U67 ( .A(n102), .B(n42), .Y(n45) );
  NAND2X1 U68 ( .A(n43), .B(n9), .Y(n44) );
  MUX2X1 U69 ( .B(n45), .A(n44), .S(n14), .Y(n51) );
  NAND2X1 U70 ( .A(n6), .B(n37), .Y(n49) );
  MUX2X1 U71 ( .B(n97), .A(n96), .S(n31), .Y(n46) );
  OAI21X1 U72 ( .A(n47), .B(n46), .C(n26), .Y(n48) );
  OAI21X1 U73 ( .A(n101), .B(n49), .C(n48), .Y(n50) );
  NOR2X1 U74 ( .A(n51), .B(n50), .Y(n52) );
  NAND3X1 U75 ( .A(n54), .B(n53), .C(n52), .Y(N162) );
  NOR2X1 U76 ( .A(n12), .B(n29), .Y(n56) );
  OAI22X1 U77 ( .A(n31), .B(n96), .C(n14), .D(n11), .Y(n55) );
  OAI21X1 U78 ( .A(n56), .B(n55), .C(n16), .Y(n72) );
  NAND3X1 U79 ( .A(n7), .B(n18), .C(n12), .Y(n57) );
  INVX2 U80 ( .A(n57), .Y(n67) );
  NAND2X1 U81 ( .A(n81), .B(n34), .Y(n111) );
  NAND2X1 U82 ( .A(n77), .B(n111), .Y(n93) );
  NAND2X1 U83 ( .A(n93), .B(n21), .Y(n60) );
  OAI21X1 U84 ( .A(n10), .B(n35), .C(n28), .Y(n58) );
  NAND2X1 U85 ( .A(n9), .B(n58), .Y(n59) );
  NAND3X1 U86 ( .A(n60), .B(n121), .C(n59), .Y(n66) );
  NAND2X1 U87 ( .A(n10), .B(n81), .Y(n61) );
  AOI21X1 U88 ( .A(n61), .B(n101), .C(n120), .Y(n65) );
  NAND3X1 U89 ( .A(n7), .B(n14), .C(n4), .Y(n63) );
  NAND2X1 U90 ( .A(n9), .B(n8), .Y(n62) );
  NAND3X1 U91 ( .A(n37), .B(n63), .C(n62), .Y(n64) );
  OAI22X1 U92 ( .A(n67), .B(n66), .C(n65), .D(n64), .Y(n71) );
  NAND2X1 U93 ( .A(n31), .B(n10), .Y(n124) );
  MUX2X1 U94 ( .B(n122), .A(n24), .S(n37), .Y(n69) );
  OAI21X1 U95 ( .A(n69), .B(n5), .C(n3), .Y(n70) );
  NAND3X1 U96 ( .A(n72), .B(n71), .C(n70), .Y(N129) );
  OAI22X1 U97 ( .A(n103), .B(n98), .C(n24), .D(n96), .Y(n75) );
  NAND3X1 U98 ( .A(n22), .B(n103), .C(n9), .Y(n73) );
  OAI21X1 U99 ( .A(n97), .B(n77), .C(n73), .Y(n74) );
  OAI21X1 U100 ( .A(n75), .B(n74), .C(n121), .Y(n91) );
  INVX2 U101 ( .A(n76), .Y(n79) );
  AOI22X1 U102 ( .A(n16), .B(n6), .C(n20), .D(n37), .Y(n78) );
  OAI22X1 U103 ( .A(n79), .B(n11), .C(n78), .D(n77), .Y(n89) );
  OAI22X1 U104 ( .A(n18), .B(n110), .C(n80), .D(n35), .Y(n119) );
  INVX2 U105 ( .A(n119), .Y(n87) );
  MUX2X1 U106 ( .B(n28), .A(n111), .S(n10), .Y(n85) );
  NAND2X1 U107 ( .A(n25), .B(n35), .Y(n83) );
  MUX2X1 U108 ( .B(n83), .A(n82), .S(n12), .Y(n84) );
  AOI21X1 U109 ( .A(n13), .B(n85), .C(n84), .Y(n86) );
  OAI21X1 U110 ( .A(n87), .B(n120), .C(n86), .Y(n88) );
  NOR2X1 U111 ( .A(n89), .B(n88), .Y(n90) );
  NAND2X1 U112 ( .A(n91), .B(n90), .Y(N98) );
  NAND2X1 U113 ( .A(n92), .B(n13), .Y(n95) );
  NAND2X1 U114 ( .A(n93), .B(n3), .Y(n94) );
  MUX2X1 U115 ( .B(n95), .A(n94), .S(n25), .Y(n118) );
  MUX2X1 U116 ( .B(n97), .A(n96), .S(n35), .Y(n100) );
  INVX2 U117 ( .A(n98), .Y(n99) );
  OAI21X1 U118 ( .A(n99), .B(n100), .C(n26), .Y(n116) );
  NAND2X1 U119 ( .A(n102), .B(n4), .Y(n105) );
  NAND2X1 U120 ( .A(n21), .B(n103), .Y(n104) );
  NAND2X1 U121 ( .A(n105), .B(n104), .Y(n106) );
  NAND2X1 U122 ( .A(n18), .B(n106), .Y(n115) );
  NAND2X1 U123 ( .A(n19), .B(n10), .Y(n108) );
  NAND2X1 U124 ( .A(n15), .B(n17), .Y(n107) );
  NAND2X1 U125 ( .A(n108), .B(n107), .Y(n113) );
  OAI22X1 U126 ( .A(n121), .B(n111), .C(n110), .D(n109), .Y(n112) );
  OAI21X1 U127 ( .A(n112), .B(n113), .C(n9), .Y(n114) );
  NAND3X1 U128 ( .A(n114), .B(n116), .C(n115), .Y(n117) );
  NOR2X1 U129 ( .A(n118), .B(n117), .Y(n130) );
  NAND2X1 U130 ( .A(n20), .B(n119), .Y(n128) );
  AOI21X1 U131 ( .A(n122), .B(n121), .C(n120), .Y(n126) );
  NAND3X1 U132 ( .A(n37), .B(n124), .C(n29), .Y(n125) );
  AOI22X1 U133 ( .A(n5), .B(n21), .C(n126), .D(n125), .Y(n127) );
  NAND2X1 U134 ( .A(n129), .B(n130), .Y(N59) );
endmodule


module substitution_0 ( data_in, dout );
  input [47:0] data_in;
  output [31:0] dout;


  Sbox1_0 SB1 ( .data_in(data_in[47:42]), .data_out(dout[31:28]) );
  Sbox2_0 SB2 ( .data_in(data_in[41:36]), .data_out(dout[27:24]) );
  Sbox3_0 SB3 ( .data_in(data_in[35:30]), .data_out(dout[23:20]) );
  Sbox4_0 SB4 ( .data_in(data_in[29:24]), .data_out(dout[19:16]) );
  Sbox5_0 SB5 ( .data_in(data_in[23:18]), .data_out(dout[15:12]) );
  Sbox6_0 SB6 ( .data_in(data_in[17:12]), .data_out(dout[11:8]) );
  Sbox7_0 SB7 ( .data_in(data_in[11:6]), .data_out(dout[7:4]) );
  Sbox8_0 SB8 ( .data_in(data_in[5:0]), .data_out(dout[3:0]) );
endmodule


module permutation_0 ( data_in, data_left, data_right, data_out );
  input [31:0] data_in;
  input [31:0] data_left;
  input [31:0] data_right;
  output [63:0] data_out;
  wire   \data_right[31] , \data_right[30] , \data_right[29] ,
         \data_right[28] , \data_right[27] , \data_right[26] ,
         \data_right[25] , \data_right[24] , \data_right[23] ,
         \data_right[22] , \data_right[21] , \data_right[20] ,
         \data_right[19] , \data_right[18] , \data_right[17] ,
         \data_right[16] , \data_right[15] , \data_right[14] ,
         \data_right[13] , \data_right[12] , \data_right[11] ,
         \data_right[10] , \data_right[9] , \data_right[8] , \data_right[7] ,
         \data_right[6] , \data_right[5] , \data_right[4] , \data_right[3] ,
         \data_right[2] , \data_right[1] , \data_right[0] , n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24;
  assign data_out[63] = \data_right[31] ;
  assign \data_right[31]  = data_right[31];
  assign data_out[62] = \data_right[30] ;
  assign \data_right[30]  = data_right[30];
  assign data_out[61] = \data_right[29] ;
  assign \data_right[29]  = data_right[29];
  assign data_out[60] = \data_right[28] ;
  assign \data_right[28]  = data_right[28];
  assign data_out[59] = \data_right[27] ;
  assign \data_right[27]  = data_right[27];
  assign data_out[58] = \data_right[26] ;
  assign \data_right[26]  = data_right[26];
  assign data_out[57] = \data_right[25] ;
  assign \data_right[25]  = data_right[25];
  assign data_out[56] = \data_right[24] ;
  assign \data_right[24]  = data_right[24];
  assign data_out[55] = \data_right[23] ;
  assign \data_right[23]  = data_right[23];
  assign data_out[54] = \data_right[22] ;
  assign \data_right[22]  = data_right[22];
  assign data_out[53] = \data_right[21] ;
  assign \data_right[21]  = data_right[21];
  assign data_out[52] = \data_right[20] ;
  assign \data_right[20]  = data_right[20];
  assign data_out[51] = \data_right[19] ;
  assign \data_right[19]  = data_right[19];
  assign data_out[50] = \data_right[18] ;
  assign \data_right[18]  = data_right[18];
  assign data_out[49] = \data_right[17] ;
  assign \data_right[17]  = data_right[17];
  assign data_out[48] = \data_right[16] ;
  assign \data_right[16]  = data_right[16];
  assign data_out[47] = \data_right[15] ;
  assign \data_right[15]  = data_right[15];
  assign data_out[46] = \data_right[14] ;
  assign \data_right[14]  = data_right[14];
  assign data_out[45] = \data_right[13] ;
  assign \data_right[13]  = data_right[13];
  assign data_out[44] = \data_right[12] ;
  assign \data_right[12]  = data_right[12];
  assign data_out[43] = \data_right[11] ;
  assign \data_right[11]  = data_right[11];
  assign data_out[42] = \data_right[10] ;
  assign \data_right[10]  = data_right[10];
  assign data_out[41] = \data_right[9] ;
  assign \data_right[9]  = data_right[9];
  assign data_out[40] = \data_right[8] ;
  assign \data_right[8]  = data_right[8];
  assign data_out[39] = \data_right[7] ;
  assign \data_right[7]  = data_right[7];
  assign data_out[38] = \data_right[6] ;
  assign \data_right[6]  = data_right[6];
  assign data_out[37] = \data_right[5] ;
  assign \data_right[5]  = data_right[5];
  assign data_out[36] = \data_right[4] ;
  assign \data_right[4]  = data_right[4];
  assign data_out[35] = \data_right[3] ;
  assign \data_right[3]  = data_right[3];
  assign data_out[34] = \data_right[2] ;
  assign \data_right[2]  = data_right[2];
  assign data_out[33] = \data_right[1] ;
  assign \data_right[1]  = data_right[1];
  assign data_out[32] = \data_right[0] ;
  assign \data_right[0]  = data_right[0];

  XOR2X1 U1 ( .A(data_in[5]), .B(n1), .Y(data_out[27]) );
  INVX8 U2 ( .A(n17), .Y(n1) );
  XOR2X1 U3 ( .A(data_in[7]), .B(n2), .Y(data_out[17]) );
  INVX8 U4 ( .A(n3), .Y(n2) );
  INVX8 U5 ( .A(data_left[17]), .Y(n3) );
  XNOR2X1 U6 ( .A(data_in[28]), .B(n4), .Y(data_out[4]) );
  INVX8 U7 ( .A(data_left[4]), .Y(n4) );
  XOR2X1 U8 ( .A(data_in[11]), .B(n5), .Y(data_out[5]) );
  INVX8 U9 ( .A(n9), .Y(n5) );
  XNOR2X1 U10 ( .A(data_in[30]), .B(n6), .Y(data_out[14]) );
  INVX8 U11 ( .A(data_left[14]), .Y(n6) );
  XOR2X1 U12 ( .A(data_in[12]), .B(n7), .Y(data_out[25]) );
  INVX8 U13 ( .A(n8), .Y(n7) );
  INVX8 U14 ( .A(data_left[25]), .Y(n8) );
  XOR2X1 U15 ( .A(data_in[29]), .B(data_left[26]), .Y(data_out[26]) );
  INVX8 U16 ( .A(data_left[5]), .Y(n9) );
  XOR2X1 U17 ( .A(data_in[14]), .B(n10), .Y(data_out[9]) );
  INVX8 U18 ( .A(n11), .Y(n10) );
  INVX8 U19 ( .A(data_left[9]), .Y(n11) );
  XOR2X1 U20 ( .A(data_in[10]), .B(n12), .Y(data_out[29]) );
  INVX8 U21 ( .A(n15), .Y(n12) );
  XOR2X1 U22 ( .A(data_in[27]), .B(n13), .Y(data_out[6]) );
  INVX8 U23 ( .A(n20), .Y(n13) );
  XNOR2X1 U24 ( .A(data_in[17]), .B(n14), .Y(data_out[13]) );
  INVX8 U25 ( .A(data_left[13]), .Y(n14) );
  INVX8 U26 ( .A(data_left[29]), .Y(n15) );
  INVX2 U27 ( .A(data_left[6]), .Y(n20) );
  INVX2 U28 ( .A(data_left[11]), .Y(n16) );
  INVX2 U29 ( .A(data_left[18]), .Y(n18) );
  INVX2 U30 ( .A(data_left[22]), .Y(n19) );
  INVX2 U31 ( .A(data_left[27]), .Y(n17) );
  XOR2X1 U32 ( .A(data_in[3]), .B(data_left[30]), .Y(data_out[30]) );
  XOR2X1 U33 ( .A(data_in[9]), .B(data_left[15]), .Y(data_out[15]) );
  XOR2X1 U34 ( .A(data_in[26]), .B(data_left[21]), .Y(data_out[21]) );
  XNOR2X1 U35 ( .A(data_in[25]), .B(n16), .Y(data_out[11]) );
  XNOR2X1 U36 ( .A(data_in[23]), .B(n18), .Y(data_out[18]) );
  INVX2 U37 ( .A(data_in[4]), .Y(n22) );
  XOR2X1 U38 ( .A(data_in[1]), .B(data_left[16]), .Y(data_out[16]) );
  XNOR2X1 U39 ( .A(data_in[2]), .B(n19), .Y(data_out[22]) );
  XOR2X1 U40 ( .A(data_in[16]), .B(data_left[7]), .Y(data_out[7]) );
  XOR2X1 U41 ( .A(data_in[8]), .B(data_left[23]), .Y(data_out[23]) );
  NAND2X1 U42 ( .A(data_left[12]), .B(n22), .Y(n23) );
  NAND2X1 U43 ( .A(data_in[4]), .B(n21), .Y(n24) );
  NAND2X1 U44 ( .A(n23), .B(n24), .Y(data_out[12]) );
  INVX1 U45 ( .A(data_left[12]), .Y(n21) );
  XOR2X1 U46 ( .A(data_in[15]), .B(data_left[0]), .Y(data_out[0]) );
  XOR2X1 U47 ( .A(data_left[1]), .B(data_in[6]), .Y(data_out[1]) );
  XOR2X1 U48 ( .A(data_in[19]), .B(data_left[2]), .Y(data_out[2]) );
  XOR2X1 U49 ( .A(data_in[20]), .B(data_left[3]), .Y(data_out[3]) );
  XOR2X1 U50 ( .A(data_in[0]), .B(data_left[8]), .Y(data_out[8]) );
  XOR2X1 U51 ( .A(data_in[22]), .B(data_left[10]), .Y(data_out[10]) );
  XOR2X1 U52 ( .A(data_in[13]), .B(data_left[19]), .Y(data_out[19]) );
  XOR2X1 U53 ( .A(data_in[31]), .B(data_left[20]), .Y(data_out[20]) );
  XOR2X1 U54 ( .A(data_in[18]), .B(data_left[24]), .Y(data_out[24]) );
  XOR2X1 U55 ( .A(data_in[21]), .B(data_left[28]), .Y(data_out[28]) );
  XOR2X1 U56 ( .A(data_in[24]), .B(data_left[31]), .Y(data_out[31]) );
endmodule


module des_0 ( clk, n_rst, data_in, key_in, ready, rw_mode, data_out, 
        next_data );
  input [63:0] data_in;
  input [63:0] key_in;
  output [63:0] data_out;
  input clk, n_rst, ready, rw_mode;
  output next_data;
  wire   n1;
  wire   [1:0] io;
  wire   [63:0] internal_data;
  wire   [31:0] data_right;
  wire   [31:0] data_left;
  wire   [4:0] r_num;
  wire   [47:0] exp_to_key;
  wire   [47:0] rkey;
  wire   [47:0] key_to_sub;
  wire   [31:0] sub_to_perm;

  des_io_select_0 IOSELECT ( .clk(clk), .io_sel(io), .ext_in(data_in), 
        .int_in(internal_data), .data_out_right(data_right), .data_out_left(
        data_left), .ext_out(data_out) );
  des_controller_0 DESCONTROLLER ( .clk(clk), .n_rst(n_rst), .data_ready(ready), .rw_mode(rw_mode), .io_select(io), .next_data(next_data), .round_number(
        r_num) );
  expansion_0 EXP ( .data_in(data_right), .data_out(exp_to_key) );
  key_wrapper_0 KEY ( .key_in(key_in), .round_number(r_num), .kout(rkey) );
  key_xor_0 KXOR ( .data(exp_to_key), .key(rkey), .out(key_to_sub) );
  substitution_0 SUB ( .data_in({n1, key_to_sub[46:0]}), .dout(sub_to_perm) );
  permutation_0 PERM ( .data_in(sub_to_perm), .data_left(data_left), 
        .data_right(data_right), .data_out(internal_data) );
  BUFX4 U1 ( .A(key_to_sub[47]), .Y(n1) );
endmodule


module triple_des ( clk, n_rst, key1, key2, input_triple, output_triple, 
        ed_sel, ready, next );
  input [63:0] key1;
  input [63:0] key2;
  input [63:0] input_triple;
  output [63:0] output_triple;
  input clk, n_rst, ed_sel, ready;
  output next;
  wire   ready1to2, ready2to3, n1;
  wire   [63:0] d1tod2_data;
  wire   [63:0] d2tod3_data;

  des_2 DES1 ( .clk(clk), .n_rst(n_rst), .data_in(input_triple), .key_in(key1), 
        .ready(ready), .rw_mode(ed_sel), .data_out(d1tod2_data), .next_data(
        ready1to2) );
  des_1 DES2 ( .clk(clk), .n_rst(n_rst), .data_in(d1tod2_data), .key_in(key2), 
        .ready(ready1to2), .rw_mode(n1), .data_out(d2tod3_data), .next_data(
        ready2to3) );
  des_0 DES3 ( .clk(clk), .n_rst(n_rst), .data_in(d2tod3_data), .key_in(key1), 
        .ready(ready2to3), .rw_mode(ed_sel), .data_out(output_triple), 
        .next_data(next) );
  INVX2 U1 ( .A(ed_sel), .Y(n1) );
endmodule


module key_o1 ( key_in, enable, key_out );
  input [63:0] key_in;
  output [63:0] key_out;
  input enable;
  wire   n1, n2, n3, n4, n5, n6;

  LATCH \key_reg[63]  ( .CLK(n6), .D(key_in[63]), .Q(key_out[63]) );
  LATCH \key_reg[62]  ( .CLK(n6), .D(key_in[62]), .Q(key_out[62]) );
  LATCH \key_reg[61]  ( .CLK(n6), .D(key_in[61]), .Q(key_out[61]) );
  LATCH \key_reg[60]  ( .CLK(n6), .D(key_in[60]), .Q(key_out[60]) );
  LATCH \key_reg[59]  ( .CLK(n5), .D(key_in[59]), .Q(key_out[59]) );
  LATCH \key_reg[58]  ( .CLK(n5), .D(key_in[58]), .Q(key_out[58]) );
  LATCH \key_reg[57]  ( .CLK(n5), .D(key_in[57]), .Q(key_out[57]) );
  LATCH \key_reg[56]  ( .CLK(n5), .D(key_in[56]), .Q(key_out[56]) );
  LATCH \key_reg[55]  ( .CLK(n5), .D(key_in[55]), .Q(key_out[55]) );
  LATCH \key_reg[54]  ( .CLK(n5), .D(key_in[54]), .Q(key_out[54]) );
  LATCH \key_reg[53]  ( .CLK(n5), .D(key_in[53]), .Q(key_out[53]) );
  LATCH \key_reg[52]  ( .CLK(n5), .D(key_in[52]), .Q(key_out[52]) );
  LATCH \key_reg[51]  ( .CLK(n5), .D(key_in[51]), .Q(key_out[51]) );
  LATCH \key_reg[50]  ( .CLK(n5), .D(key_in[50]), .Q(key_out[50]) );
  LATCH \key_reg[49]  ( .CLK(n5), .D(key_in[49]), .Q(key_out[49]) );
  LATCH \key_reg[48]  ( .CLK(n5), .D(key_in[48]), .Q(key_out[48]) );
  LATCH \key_reg[47]  ( .CLK(n4), .D(key_in[47]), .Q(key_out[47]) );
  LATCH \key_reg[46]  ( .CLK(n4), .D(key_in[46]), .Q(key_out[46]) );
  LATCH \key_reg[45]  ( .CLK(n4), .D(key_in[45]), .Q(key_out[45]) );
  LATCH \key_reg[44]  ( .CLK(n4), .D(key_in[44]), .Q(key_out[44]) );
  LATCH \key_reg[43]  ( .CLK(n4), .D(key_in[43]), .Q(key_out[43]) );
  LATCH \key_reg[42]  ( .CLK(n4), .D(key_in[42]), .Q(key_out[42]) );
  LATCH \key_reg[41]  ( .CLK(n4), .D(key_in[41]), .Q(key_out[41]) );
  LATCH \key_reg[40]  ( .CLK(n4), .D(key_in[40]), .Q(key_out[40]) );
  LATCH \key_reg[39]  ( .CLK(n4), .D(key_in[39]), .Q(key_out[39]) );
  LATCH \key_reg[38]  ( .CLK(n4), .D(key_in[38]), .Q(key_out[38]) );
  LATCH \key_reg[37]  ( .CLK(n4), .D(key_in[37]), .Q(key_out[37]) );
  LATCH \key_reg[36]  ( .CLK(n4), .D(key_in[36]), .Q(key_out[36]) );
  LATCH \key_reg[35]  ( .CLK(n3), .D(key_in[35]), .Q(key_out[35]) );
  LATCH \key_reg[34]  ( .CLK(n3), .D(key_in[34]), .Q(key_out[34]) );
  LATCH \key_reg[33]  ( .CLK(n3), .D(key_in[33]), .Q(key_out[33]) );
  LATCH \key_reg[32]  ( .CLK(n3), .D(key_in[32]), .Q(key_out[32]) );
  LATCH \key_reg[31]  ( .CLK(n3), .D(key_in[31]), .Q(key_out[31]) );
  LATCH \key_reg[30]  ( .CLK(n3), .D(key_in[30]), .Q(key_out[30]) );
  LATCH \key_reg[29]  ( .CLK(n3), .D(key_in[29]), .Q(key_out[29]) );
  LATCH \key_reg[28]  ( .CLK(n3), .D(key_in[28]), .Q(key_out[28]) );
  LATCH \key_reg[27]  ( .CLK(n3), .D(key_in[27]), .Q(key_out[27]) );
  LATCH \key_reg[26]  ( .CLK(n3), .D(key_in[26]), .Q(key_out[26]) );
  LATCH \key_reg[25]  ( .CLK(n3), .D(key_in[25]), .Q(key_out[25]) );
  LATCH \key_reg[24]  ( .CLK(n3), .D(key_in[24]), .Q(key_out[24]) );
  LATCH \key_reg[23]  ( .CLK(n2), .D(key_in[23]), .Q(key_out[23]) );
  LATCH \key_reg[22]  ( .CLK(n2), .D(key_in[22]), .Q(key_out[22]) );
  LATCH \key_reg[21]  ( .CLK(n2), .D(key_in[21]), .Q(key_out[21]) );
  LATCH \key_reg[20]  ( .CLK(n2), .D(key_in[20]), .Q(key_out[20]) );
  LATCH \key_reg[19]  ( .CLK(n2), .D(key_in[19]), .Q(key_out[19]) );
  LATCH \key_reg[18]  ( .CLK(n2), .D(key_in[18]), .Q(key_out[18]) );
  LATCH \key_reg[17]  ( .CLK(n2), .D(key_in[17]), .Q(key_out[17]) );
  LATCH \key_reg[16]  ( .CLK(n2), .D(key_in[16]), .Q(key_out[16]) );
  LATCH \key_reg[15]  ( .CLK(n2), .D(key_in[15]), .Q(key_out[15]) );
  LATCH \key_reg[14]  ( .CLK(n2), .D(key_in[14]), .Q(key_out[14]) );
  LATCH \key_reg[13]  ( .CLK(n2), .D(key_in[13]), .Q(key_out[13]) );
  LATCH \key_reg[12]  ( .CLK(n2), .D(key_in[12]), .Q(key_out[12]) );
  LATCH \key_reg[11]  ( .CLK(n1), .D(key_in[11]), .Q(key_out[11]) );
  LATCH \key_reg[10]  ( .CLK(n1), .D(key_in[10]), .Q(key_out[10]) );
  LATCH \key_reg[9]  ( .CLK(n1), .D(key_in[9]), .Q(key_out[9]) );
  LATCH \key_reg[8]  ( .CLK(n1), .D(key_in[8]), .Q(key_out[8]) );
  LATCH \key_reg[7]  ( .CLK(n1), .D(key_in[7]), .Q(key_out[7]) );
  LATCH \key_reg[6]  ( .CLK(n1), .D(key_in[6]), .Q(key_out[6]) );
  LATCH \key_reg[5]  ( .CLK(n1), .D(key_in[5]), .Q(key_out[5]) );
  LATCH \key_reg[4]  ( .CLK(n1), .D(key_in[4]), .Q(key_out[4]) );
  LATCH \key_reg[3]  ( .CLK(n1), .D(key_in[3]), .Q(key_out[3]) );
  LATCH \key_reg[2]  ( .CLK(n1), .D(key_in[2]), .Q(key_out[2]) );
  LATCH \key_reg[1]  ( .CLK(n1), .D(key_in[1]), .Q(key_out[1]) );
  LATCH \key_reg[0]  ( .CLK(n1), .D(key_in[0]), .Q(key_out[0]) );
  BUFX2 U2 ( .A(enable), .Y(n1) );
  BUFX2 U3 ( .A(enable), .Y(n2) );
  BUFX2 U4 ( .A(enable), .Y(n3) );
  BUFX2 U5 ( .A(enable), .Y(n4) );
  BUFX2 U6 ( .A(enable), .Y(n5) );
  BUFX2 U7 ( .A(enable), .Y(n6) );
endmodule


module key_o2 ( key_in, enable, key_out );
  input [63:0] key_in;
  output [63:0] key_out;
  input enable;
  wire   N4, n1, n2, n3, n4, n5, n6;
  assign N4 = enable;

  LATCH \key_reg[63]  ( .CLK(n6), .D(key_in[63]), .Q(key_out[63]) );
  LATCH \key_reg[62]  ( .CLK(n6), .D(key_in[62]), .Q(key_out[62]) );
  LATCH \key_reg[61]  ( .CLK(n6), .D(key_in[61]), .Q(key_out[61]) );
  LATCH \key_reg[60]  ( .CLK(n6), .D(key_in[60]), .Q(key_out[60]) );
  LATCH \key_reg[59]  ( .CLK(n5), .D(key_in[59]), .Q(key_out[59]) );
  LATCH \key_reg[58]  ( .CLK(n5), .D(key_in[58]), .Q(key_out[58]) );
  LATCH \key_reg[57]  ( .CLK(n5), .D(key_in[57]), .Q(key_out[57]) );
  LATCH \key_reg[56]  ( .CLK(n5), .D(key_in[56]), .Q(key_out[56]) );
  LATCH \key_reg[55]  ( .CLK(n5), .D(key_in[55]), .Q(key_out[55]) );
  LATCH \key_reg[54]  ( .CLK(n5), .D(key_in[54]), .Q(key_out[54]) );
  LATCH \key_reg[53]  ( .CLK(n5), .D(key_in[53]), .Q(key_out[53]) );
  LATCH \key_reg[52]  ( .CLK(n5), .D(key_in[52]), .Q(key_out[52]) );
  LATCH \key_reg[51]  ( .CLK(n5), .D(key_in[51]), .Q(key_out[51]) );
  LATCH \key_reg[50]  ( .CLK(n5), .D(key_in[50]), .Q(key_out[50]) );
  LATCH \key_reg[49]  ( .CLK(n5), .D(key_in[49]), .Q(key_out[49]) );
  LATCH \key_reg[48]  ( .CLK(n5), .D(key_in[48]), .Q(key_out[48]) );
  LATCH \key_reg[47]  ( .CLK(n4), .D(key_in[47]), .Q(key_out[47]) );
  LATCH \key_reg[46]  ( .CLK(n4), .D(key_in[46]), .Q(key_out[46]) );
  LATCH \key_reg[45]  ( .CLK(n4), .D(key_in[45]), .Q(key_out[45]) );
  LATCH \key_reg[44]  ( .CLK(n4), .D(key_in[44]), .Q(key_out[44]) );
  LATCH \key_reg[43]  ( .CLK(n4), .D(key_in[43]), .Q(key_out[43]) );
  LATCH \key_reg[42]  ( .CLK(n4), .D(key_in[42]), .Q(key_out[42]) );
  LATCH \key_reg[41]  ( .CLK(n4), .D(key_in[41]), .Q(key_out[41]) );
  LATCH \key_reg[40]  ( .CLK(n4), .D(key_in[40]), .Q(key_out[40]) );
  LATCH \key_reg[39]  ( .CLK(n4), .D(key_in[39]), .Q(key_out[39]) );
  LATCH \key_reg[38]  ( .CLK(n4), .D(key_in[38]), .Q(key_out[38]) );
  LATCH \key_reg[37]  ( .CLK(n4), .D(key_in[37]), .Q(key_out[37]) );
  LATCH \key_reg[36]  ( .CLK(n4), .D(key_in[36]), .Q(key_out[36]) );
  LATCH \key_reg[35]  ( .CLK(n3), .D(key_in[35]), .Q(key_out[35]) );
  LATCH \key_reg[34]  ( .CLK(n3), .D(key_in[34]), .Q(key_out[34]) );
  LATCH \key_reg[33]  ( .CLK(n3), .D(key_in[33]), .Q(key_out[33]) );
  LATCH \key_reg[32]  ( .CLK(n3), .D(key_in[32]), .Q(key_out[32]) );
  LATCH \key_reg[31]  ( .CLK(n3), .D(key_in[31]), .Q(key_out[31]) );
  LATCH \key_reg[30]  ( .CLK(n3), .D(key_in[30]), .Q(key_out[30]) );
  LATCH \key_reg[29]  ( .CLK(n3), .D(key_in[29]), .Q(key_out[29]) );
  LATCH \key_reg[28]  ( .CLK(n3), .D(key_in[28]), .Q(key_out[28]) );
  LATCH \key_reg[27]  ( .CLK(n3), .D(key_in[27]), .Q(key_out[27]) );
  LATCH \key_reg[26]  ( .CLK(n3), .D(key_in[26]), .Q(key_out[26]) );
  LATCH \key_reg[25]  ( .CLK(n3), .D(key_in[25]), .Q(key_out[25]) );
  LATCH \key_reg[24]  ( .CLK(n3), .D(key_in[24]), .Q(key_out[24]) );
  LATCH \key_reg[23]  ( .CLK(n2), .D(key_in[23]), .Q(key_out[23]) );
  LATCH \key_reg[22]  ( .CLK(n2), .D(key_in[22]), .Q(key_out[22]) );
  LATCH \key_reg[21]  ( .CLK(n2), .D(key_in[21]), .Q(key_out[21]) );
  LATCH \key_reg[20]  ( .CLK(n2), .D(key_in[20]), .Q(key_out[20]) );
  LATCH \key_reg[19]  ( .CLK(n2), .D(key_in[19]), .Q(key_out[19]) );
  LATCH \key_reg[18]  ( .CLK(n2), .D(key_in[18]), .Q(key_out[18]) );
  LATCH \key_reg[17]  ( .CLK(n2), .D(key_in[17]), .Q(key_out[17]) );
  LATCH \key_reg[16]  ( .CLK(n2), .D(key_in[16]), .Q(key_out[16]) );
  LATCH \key_reg[15]  ( .CLK(n2), .D(key_in[15]), .Q(key_out[15]) );
  LATCH \key_reg[14]  ( .CLK(n2), .D(key_in[14]), .Q(key_out[14]) );
  LATCH \key_reg[13]  ( .CLK(n2), .D(key_in[13]), .Q(key_out[13]) );
  LATCH \key_reg[12]  ( .CLK(n2), .D(key_in[12]), .Q(key_out[12]) );
  LATCH \key_reg[11]  ( .CLK(n1), .D(key_in[11]), .Q(key_out[11]) );
  LATCH \key_reg[10]  ( .CLK(n1), .D(key_in[10]), .Q(key_out[10]) );
  LATCH \key_reg[9]  ( .CLK(n1), .D(key_in[9]), .Q(key_out[9]) );
  LATCH \key_reg[8]  ( .CLK(n1), .D(key_in[8]), .Q(key_out[8]) );
  LATCH \key_reg[7]  ( .CLK(n1), .D(key_in[7]), .Q(key_out[7]) );
  LATCH \key_reg[6]  ( .CLK(n1), .D(key_in[6]), .Q(key_out[6]) );
  LATCH \key_reg[5]  ( .CLK(n1), .D(key_in[5]), .Q(key_out[5]) );
  LATCH \key_reg[4]  ( .CLK(n1), .D(key_in[4]), .Q(key_out[4]) );
  LATCH \key_reg[3]  ( .CLK(n1), .D(key_in[3]), .Q(key_out[3]) );
  LATCH \key_reg[2]  ( .CLK(n1), .D(key_in[2]), .Q(key_out[2]) );
  LATCH \key_reg[1]  ( .CLK(n1), .D(key_in[1]), .Q(key_out[1]) );
  LATCH \key_reg[0]  ( .CLK(n1), .D(key_in[0]), .Q(key_out[0]) );
  BUFX2 U2 ( .A(N4), .Y(n1) );
  BUFX2 U3 ( .A(N4), .Y(n2) );
  BUFX2 U4 ( .A(N4), .Y(n3) );
  BUFX2 U5 ( .A(N4), .Y(n4) );
  BUFX2 U6 ( .A(N4), .Y(n5) );
  BUFX2 U7 ( .A(N4), .Y(n6) );
endmodule


module input_byte ( clk, nrst, dir_sel, from_sram, from_i2c, read_enable, 
        output_data, data_ready );
  input [7:0] from_sram;
  input [7:0] from_i2c;
  output [63:0] output_data;
  input clk, nrst, dir_sel, read_enable;
  output data_ready;
  wire   N92, n94, n96, n98, n100, n102, n104, n106, n108, n110, n112, n114,
         n116, n118, n120, n122, n124, n126, n128, n130, n132, n134, n136,
         n138, n140, n142, n144, n146, n148, n150, n152, n154, n156, n158,
         n160, n162, n164, n166, n168, n170, n172, n174, n176, n178, n180,
         n182, n184, n186, n188, n190, n192, n194, n196, n198, n200, n202,
         n204, n206, n208, n210, n212, n214, n216, n218, n220, n226, n227,
         n228, n229, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n225, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245;
  wire   [3:0] cnt_c;
  assign N92 = read_enable;

  DFFSR \cnt_c_reg[0]  ( .D(n229), .CLK(clk), .R(n25), .S(1'b1), .Q(cnt_c[0])
         );
  DFFSR \cnt_c_reg[1]  ( .D(n226), .CLK(clk), .R(n25), .S(1'b1), .Q(cnt_c[1])
         );
  DFFSR \cnt_c_reg[3]  ( .D(n228), .CLK(clk), .R(n25), .S(1'b1), .Q(cnt_c[3])
         );
  DFFSR \cnt_c_reg[2]  ( .D(n227), .CLK(clk), .R(n25), .S(1'b1), .Q(cnt_c[2])
         );
  DFFSR \curr_reg[7]  ( .D(n220), .CLK(clk), .R(n25), .S(1'b1), .Q(
        output_data[7]) );
  DFFSR \curr_reg[15]  ( .D(n218), .CLK(clk), .R(n25), .S(1'b1), .Q(
        output_data[15]) );
  DFFSR \curr_reg[23]  ( .D(n216), .CLK(clk), .R(n25), .S(1'b1), .Q(
        output_data[23]) );
  DFFSR \curr_reg[31]  ( .D(n214), .CLK(clk), .R(n25), .S(1'b1), .Q(
        output_data[31]) );
  DFFSR \curr_reg[39]  ( .D(n212), .CLK(clk), .R(n24), .S(1'b1), .Q(
        output_data[39]) );
  DFFSR \curr_reg[47]  ( .D(n210), .CLK(clk), .R(n24), .S(1'b1), .Q(
        output_data[47]) );
  DFFSR \curr_reg[55]  ( .D(n208), .CLK(clk), .R(n24), .S(1'b1), .Q(
        output_data[55]) );
  DFFSR \curr_reg[63]  ( .D(n206), .CLK(clk), .R(n24), .S(1'b1), .Q(
        output_data[63]) );
  DFFSR \curr_reg[6]  ( .D(n204), .CLK(clk), .R(n24), .S(1'b1), .Q(
        output_data[6]) );
  DFFSR \curr_reg[14]  ( .D(n202), .CLK(clk), .R(n24), .S(1'b1), .Q(
        output_data[14]) );
  DFFSR \curr_reg[22]  ( .D(n200), .CLK(clk), .R(n24), .S(1'b1), .Q(
        output_data[22]) );
  DFFSR \curr_reg[30]  ( .D(n198), .CLK(clk), .R(n24), .S(1'b1), .Q(
        output_data[30]) );
  DFFSR \curr_reg[38]  ( .D(n196), .CLK(clk), .R(n24), .S(1'b1), .Q(
        output_data[38]) );
  DFFSR \curr_reg[46]  ( .D(n194), .CLK(clk), .R(n24), .S(1'b1), .Q(
        output_data[46]) );
  DFFSR \curr_reg[54]  ( .D(n192), .CLK(clk), .R(n24), .S(1'b1), .Q(
        output_data[54]) );
  DFFSR \curr_reg[62]  ( .D(n190), .CLK(clk), .R(n24), .S(1'b1), .Q(
        output_data[62]) );
  DFFSR \curr_reg[5]  ( .D(n188), .CLK(clk), .R(n23), .S(1'b1), .Q(
        output_data[5]) );
  DFFSR \curr_reg[13]  ( .D(n186), .CLK(clk), .R(n23), .S(1'b1), .Q(
        output_data[13]) );
  DFFSR \curr_reg[21]  ( .D(n184), .CLK(clk), .R(n23), .S(1'b1), .Q(
        output_data[21]) );
  DFFSR \curr_reg[29]  ( .D(n182), .CLK(clk), .R(n23), .S(1'b1), .Q(
        output_data[29]) );
  DFFSR \curr_reg[37]  ( .D(n180), .CLK(clk), .R(n23), .S(1'b1), .Q(
        output_data[37]) );
  DFFSR \curr_reg[45]  ( .D(n178), .CLK(clk), .R(n23), .S(1'b1), .Q(
        output_data[45]) );
  DFFSR \curr_reg[53]  ( .D(n176), .CLK(clk), .R(n23), .S(1'b1), .Q(
        output_data[53]) );
  DFFSR \curr_reg[61]  ( .D(n174), .CLK(clk), .R(n23), .S(1'b1), .Q(
        output_data[61]) );
  DFFSR \curr_reg[4]  ( .D(n172), .CLK(clk), .R(n23), .S(1'b1), .Q(
        output_data[4]) );
  DFFSR \curr_reg[12]  ( .D(n170), .CLK(clk), .R(n23), .S(1'b1), .Q(
        output_data[12]) );
  DFFSR \curr_reg[20]  ( .D(n168), .CLK(clk), .R(n23), .S(1'b1), .Q(
        output_data[20]) );
  DFFSR \curr_reg[28]  ( .D(n166), .CLK(clk), .R(n23), .S(1'b1), .Q(
        output_data[28]) );
  DFFSR \curr_reg[36]  ( .D(n164), .CLK(clk), .R(n22), .S(1'b1), .Q(
        output_data[36]) );
  DFFSR \curr_reg[44]  ( .D(n162), .CLK(clk), .R(n22), .S(1'b1), .Q(
        output_data[44]) );
  DFFSR \curr_reg[52]  ( .D(n160), .CLK(clk), .R(n22), .S(1'b1), .Q(
        output_data[52]) );
  DFFSR \curr_reg[60]  ( .D(n158), .CLK(clk), .R(n22), .S(1'b1), .Q(
        output_data[60]) );
  DFFSR \curr_reg[3]  ( .D(n156), .CLK(clk), .R(n22), .S(1'b1), .Q(
        output_data[3]) );
  DFFSR \curr_reg[11]  ( .D(n154), .CLK(clk), .R(n22), .S(1'b1), .Q(
        output_data[11]) );
  DFFSR \curr_reg[19]  ( .D(n152), .CLK(clk), .R(n22), .S(1'b1), .Q(
        output_data[19]) );
  DFFSR \curr_reg[27]  ( .D(n150), .CLK(clk), .R(n22), .S(1'b1), .Q(
        output_data[27]) );
  DFFSR \curr_reg[35]  ( .D(n148), .CLK(clk), .R(n22), .S(1'b1), .Q(
        output_data[35]) );
  DFFSR \curr_reg[43]  ( .D(n146), .CLK(clk), .R(n22), .S(1'b1), .Q(
        output_data[43]) );
  DFFSR \curr_reg[51]  ( .D(n144), .CLK(clk), .R(n22), .S(1'b1), .Q(
        output_data[51]) );
  DFFSR \curr_reg[59]  ( .D(n142), .CLK(clk), .R(n22), .S(1'b1), .Q(
        output_data[59]) );
  DFFSR \curr_reg[2]  ( .D(n140), .CLK(clk), .R(n21), .S(1'b1), .Q(
        output_data[2]) );
  DFFSR \curr_reg[10]  ( .D(n138), .CLK(clk), .R(n21), .S(1'b1), .Q(
        output_data[10]) );
  DFFSR \curr_reg[18]  ( .D(n136), .CLK(clk), .R(n21), .S(1'b1), .Q(
        output_data[18]) );
  DFFSR \curr_reg[26]  ( .D(n134), .CLK(clk), .R(n21), .S(1'b1), .Q(
        output_data[26]) );
  DFFSR \curr_reg[34]  ( .D(n132), .CLK(clk), .R(n21), .S(1'b1), .Q(
        output_data[34]) );
  DFFSR \curr_reg[42]  ( .D(n130), .CLK(clk), .R(n21), .S(1'b1), .Q(
        output_data[42]) );
  DFFSR \curr_reg[50]  ( .D(n128), .CLK(clk), .R(n21), .S(1'b1), .Q(
        output_data[50]) );
  DFFSR \curr_reg[58]  ( .D(n126), .CLK(clk), .R(n21), .S(1'b1), .Q(
        output_data[58]) );
  DFFSR \curr_reg[1]  ( .D(n124), .CLK(clk), .R(n21), .S(1'b1), .Q(
        output_data[1]) );
  DFFSR \curr_reg[9]  ( .D(n122), .CLK(clk), .R(n21), .S(1'b1), .Q(
        output_data[9]) );
  DFFSR \curr_reg[17]  ( .D(n120), .CLK(clk), .R(n21), .S(1'b1), .Q(
        output_data[17]) );
  DFFSR \curr_reg[25]  ( .D(n118), .CLK(clk), .R(n21), .S(1'b1), .Q(
        output_data[25]) );
  DFFSR \curr_reg[33]  ( .D(n116), .CLK(clk), .R(n20), .S(1'b1), .Q(
        output_data[33]) );
  DFFSR \curr_reg[41]  ( .D(n114), .CLK(clk), .R(n20), .S(1'b1), .Q(
        output_data[41]) );
  DFFSR \curr_reg[49]  ( .D(n112), .CLK(clk), .R(n20), .S(1'b1), .Q(
        output_data[49]) );
  DFFSR \curr_reg[57]  ( .D(n110), .CLK(clk), .R(n20), .S(1'b1), .Q(
        output_data[57]) );
  DFFSR \curr_reg[0]  ( .D(n108), .CLK(clk), .R(n20), .S(1'b1), .Q(
        output_data[0]) );
  DFFSR \curr_reg[8]  ( .D(n106), .CLK(clk), .R(n20), .S(1'b1), .Q(
        output_data[8]) );
  DFFSR \curr_reg[16]  ( .D(n104), .CLK(clk), .R(n20), .S(1'b1), .Q(
        output_data[16]) );
  DFFSR \curr_reg[24]  ( .D(n102), .CLK(clk), .R(n20), .S(1'b1), .Q(
        output_data[24]) );
  DFFSR \curr_reg[32]  ( .D(n100), .CLK(clk), .R(n20), .S(1'b1), .Q(
        output_data[32]) );
  DFFSR \curr_reg[40]  ( .D(n98), .CLK(clk), .R(n20), .S(1'b1), .Q(
        output_data[40]) );
  DFFSR \curr_reg[48]  ( .D(n96), .CLK(clk), .R(n20), .S(1'b1), .Q(
        output_data[48]) );
  DFFSR \curr_reg[56]  ( .D(n94), .CLK(clk), .R(n20), .S(1'b1), .Q(
        output_data[56]) );
  AND2X2 U3 ( .A(n10), .B(n19), .Y(n1) );
  INVX1 U4 ( .A(n12), .Y(n11) );
  INVX2 U5 ( .A(N92), .Y(n12) );
  INVX2 U6 ( .A(n11), .Y(n18) );
  INVX4 U7 ( .A(n10), .Y(n4) );
  INVX1 U8 ( .A(n9), .Y(n8) );
  INVX1 U9 ( .A(dir_sel), .Y(n19) );
  AND2X1 U10 ( .A(cnt_c[1]), .B(cnt_c[0]), .Y(n3) );
  INVX2 U11 ( .A(n9), .Y(n6) );
  INVX2 U12 ( .A(n9), .Y(n7) );
  INVX2 U13 ( .A(n10), .Y(n5) );
  AND2X2 U14 ( .A(dir_sel), .B(n10), .Y(n2) );
  INVX2 U15 ( .A(n245), .Y(n10) );
  INVX2 U16 ( .A(n18), .Y(n17) );
  INVX2 U17 ( .A(n245), .Y(n9) );
  INVX1 U18 ( .A(n12), .Y(n16) );
  INVX2 U19 ( .A(n18), .Y(n13) );
  INVX2 U20 ( .A(n18), .Y(n14) );
  INVX2 U21 ( .A(n18), .Y(n15) );
  XNOR2X1 U22 ( .A(cnt_c[1]), .B(n27), .Y(n226) );
  BUFX2 U23 ( .A(nrst), .Y(n20) );
  BUFX2 U24 ( .A(nrst), .Y(n21) );
  BUFX2 U25 ( .A(nrst), .Y(n22) );
  BUFX2 U26 ( .A(nrst), .Y(n23) );
  BUFX2 U27 ( .A(nrst), .Y(n24) );
  BUFX2 U28 ( .A(nrst), .Y(n25) );
  INVX2 U29 ( .A(cnt_c[2]), .Y(n33) );
  NOR2X1 U30 ( .A(cnt_c[1]), .B(cnt_c[0]), .Y(n26) );
  NAND3X1 U31 ( .A(cnt_c[3]), .B(n33), .C(n26), .Y(n36) );
  NAND2X1 U32 ( .A(N92), .B(n36), .Y(n245) );
  NAND2X1 U33 ( .A(n36), .B(n18), .Y(n28) );
  MUX2X1 U34 ( .B(n8), .A(n28), .S(cnt_c[0]), .Y(n229) );
  NAND2X1 U35 ( .A(n28), .B(cnt_c[0]), .Y(n27) );
  NAND2X1 U36 ( .A(n3), .B(n28), .Y(n30) );
  OAI21X1 U37 ( .A(n3), .B(n4), .C(n28), .Y(n32) );
  INVX2 U38 ( .A(n32), .Y(n29) );
  MUX2X1 U39 ( .B(n30), .A(n29), .S(cnt_c[2]), .Y(n227) );
  INVX2 U40 ( .A(n30), .Y(n31) );
  NAND2X1 U41 ( .A(cnt_c[2]), .B(n31), .Y(n35) );
  AOI21X1 U42 ( .A(n9), .B(n33), .C(n32), .Y(n34) );
  MUX2X1 U43 ( .B(n35), .A(n34), .S(cnt_c[3]), .Y(n228) );
  INVX2 U44 ( .A(n36), .Y(data_ready) );
  INVX2 U45 ( .A(output_data[0]), .Y(n45) );
  AOI22X1 U46 ( .A(from_sram[0]), .B(n2), .C(from_i2c[0]), .D(n1), .Y(n37) );
  OAI21X1 U47 ( .A(n14), .B(n45), .C(n37), .Y(n108) );
  INVX2 U48 ( .A(output_data[1]), .Y(n46) );
  AOI22X1 U49 ( .A(from_sram[1]), .B(n2), .C(from_i2c[1]), .D(n1), .Y(n38) );
  OAI21X1 U50 ( .A(n15), .B(n46), .C(n38), .Y(n124) );
  INVX2 U51 ( .A(output_data[2]), .Y(n47) );
  AOI22X1 U52 ( .A(from_sram[2]), .B(n2), .C(from_i2c[2]), .D(n1), .Y(n39) );
  OAI21X1 U53 ( .A(n13), .B(n47), .C(n39), .Y(n140) );
  INVX2 U54 ( .A(output_data[3]), .Y(n48) );
  AOI22X1 U55 ( .A(from_sram[3]), .B(n2), .C(from_i2c[3]), .D(n1), .Y(n40) );
  OAI21X1 U56 ( .A(n17), .B(n48), .C(n40), .Y(n156) );
  INVX2 U57 ( .A(output_data[4]), .Y(n49) );
  AOI22X1 U58 ( .A(from_sram[4]), .B(n2), .C(from_i2c[4]), .D(n1), .Y(n41) );
  OAI21X1 U59 ( .A(n17), .B(n49), .C(n41), .Y(n172) );
  INVX2 U60 ( .A(output_data[5]), .Y(n50) );
  AOI22X1 U61 ( .A(from_sram[5]), .B(n2), .C(from_i2c[5]), .D(n1), .Y(n42) );
  OAI21X1 U62 ( .A(n17), .B(n50), .C(n42), .Y(n188) );
  INVX2 U63 ( .A(output_data[6]), .Y(n51) );
  AOI22X1 U64 ( .A(from_sram[6]), .B(n2), .C(from_i2c[6]), .D(n1), .Y(n43) );
  OAI21X1 U65 ( .A(n17), .B(n51), .C(n43), .Y(n204) );
  INVX2 U66 ( .A(output_data[7]), .Y(n52) );
  AOI22X1 U67 ( .A(from_sram[7]), .B(n2), .C(from_i2c[7]), .D(n1), .Y(n44) );
  OAI21X1 U68 ( .A(n17), .B(n52), .C(n44), .Y(n220) );
  INVX2 U69 ( .A(output_data[8]), .Y(n53) );
  OAI22X1 U70 ( .A(n8), .B(n45), .C(n17), .D(n53), .Y(n106) );
  INVX2 U71 ( .A(output_data[9]), .Y(n54) );
  OAI22X1 U72 ( .A(n8), .B(n46), .C(n17), .D(n54), .Y(n122) );
  INVX2 U73 ( .A(output_data[10]), .Y(n55) );
  OAI22X1 U74 ( .A(n8), .B(n47), .C(n17), .D(n55), .Y(n138) );
  INVX2 U75 ( .A(output_data[11]), .Y(n56) );
  OAI22X1 U76 ( .A(n8), .B(n48), .C(n17), .D(n56), .Y(n154) );
  INVX2 U77 ( .A(output_data[12]), .Y(n57) );
  OAI22X1 U78 ( .A(n8), .B(n49), .C(n17), .D(n57), .Y(n170) );
  INVX2 U79 ( .A(output_data[13]), .Y(n58) );
  OAI22X1 U80 ( .A(n7), .B(n50), .C(n17), .D(n58), .Y(n186) );
  INVX2 U81 ( .A(output_data[14]), .Y(n59) );
  OAI22X1 U82 ( .A(n7), .B(n51), .C(n17), .D(n59), .Y(n202) );
  INVX2 U83 ( .A(output_data[15]), .Y(n60) );
  OAI22X1 U84 ( .A(n7), .B(n52), .C(n17), .D(n60), .Y(n218) );
  INVX2 U85 ( .A(output_data[16]), .Y(n61) );
  OAI22X1 U86 ( .A(n7), .B(n53), .C(n16), .D(n61), .Y(n104) );
  INVX2 U87 ( .A(output_data[17]), .Y(n62) );
  OAI22X1 U88 ( .A(n7), .B(n54), .C(n16), .D(n62), .Y(n120) );
  INVX2 U89 ( .A(output_data[18]), .Y(n63) );
  OAI22X1 U90 ( .A(n7), .B(n55), .C(n16), .D(n63), .Y(n136) );
  INVX2 U91 ( .A(output_data[19]), .Y(n64) );
  OAI22X1 U92 ( .A(n7), .B(n56), .C(n16), .D(n64), .Y(n152) );
  INVX2 U93 ( .A(output_data[20]), .Y(n65) );
  OAI22X1 U94 ( .A(n7), .B(n57), .C(n16), .D(n65), .Y(n168) );
  INVX2 U95 ( .A(output_data[21]), .Y(n66) );
  OAI22X1 U96 ( .A(n7), .B(n58), .C(n16), .D(n66), .Y(n184) );
  INVX2 U97 ( .A(output_data[22]), .Y(n67) );
  OAI22X1 U98 ( .A(n7), .B(n59), .C(n16), .D(n67), .Y(n200) );
  INVX2 U99 ( .A(output_data[23]), .Y(n68) );
  OAI22X1 U100 ( .A(n7), .B(n60), .C(n16), .D(n68), .Y(n216) );
  INVX2 U101 ( .A(output_data[24]), .Y(n69) );
  OAI22X1 U102 ( .A(n7), .B(n61), .C(n16), .D(n69), .Y(n102) );
  INVX2 U103 ( .A(output_data[25]), .Y(n70) );
  OAI22X1 U104 ( .A(n7), .B(n62), .C(n16), .D(n70), .Y(n118) );
  INVX2 U105 ( .A(output_data[26]), .Y(n71) );
  OAI22X1 U106 ( .A(n6), .B(n63), .C(n16), .D(n71), .Y(n134) );
  INVX2 U107 ( .A(output_data[27]), .Y(n72) );
  OAI22X1 U108 ( .A(n6), .B(n64), .C(n16), .D(n72), .Y(n150) );
  INVX2 U109 ( .A(output_data[28]), .Y(n73) );
  OAI22X1 U110 ( .A(n6), .B(n65), .C(n15), .D(n73), .Y(n166) );
  INVX2 U111 ( .A(output_data[29]), .Y(n74) );
  OAI22X1 U112 ( .A(n6), .B(n66), .C(n15), .D(n74), .Y(n182) );
  INVX2 U113 ( .A(output_data[30]), .Y(n75) );
  OAI22X1 U114 ( .A(n6), .B(n67), .C(n15), .D(n75), .Y(n198) );
  INVX2 U115 ( .A(output_data[31]), .Y(n76) );
  OAI22X1 U116 ( .A(n6), .B(n68), .C(n15), .D(n76), .Y(n214) );
  INVX2 U117 ( .A(output_data[32]), .Y(n77) );
  OAI22X1 U118 ( .A(n6), .B(n69), .C(n15), .D(n77), .Y(n100) );
  INVX2 U119 ( .A(output_data[33]), .Y(n78) );
  OAI22X1 U120 ( .A(n6), .B(n70), .C(n15), .D(n78), .Y(n116) );
  INVX2 U121 ( .A(output_data[34]), .Y(n79) );
  OAI22X1 U122 ( .A(n6), .B(n71), .C(n15), .D(n79), .Y(n132) );
  INVX2 U123 ( .A(output_data[35]), .Y(n80) );
  OAI22X1 U124 ( .A(n6), .B(n72), .C(n15), .D(n80), .Y(n148) );
  INVX2 U125 ( .A(output_data[36]), .Y(n81) );
  OAI22X1 U126 ( .A(n6), .B(n73), .C(n15), .D(n81), .Y(n164) );
  INVX2 U127 ( .A(output_data[37]), .Y(n82) );
  OAI22X1 U128 ( .A(n6), .B(n74), .C(n15), .D(n82), .Y(n180) );
  INVX2 U129 ( .A(output_data[38]), .Y(n83) );
  OAI22X1 U130 ( .A(n5), .B(n75), .C(n15), .D(n83), .Y(n196) );
  INVX2 U131 ( .A(output_data[39]), .Y(n84) );
  OAI22X1 U132 ( .A(n5), .B(n76), .C(n15), .D(n84), .Y(n212) );
  INVX2 U133 ( .A(output_data[40]), .Y(n85) );
  OAI22X1 U134 ( .A(n5), .B(n77), .C(n14), .D(n85), .Y(n98) );
  INVX2 U135 ( .A(output_data[41]), .Y(n86) );
  OAI22X1 U136 ( .A(n5), .B(n78), .C(n14), .D(n86), .Y(n114) );
  INVX2 U137 ( .A(output_data[42]), .Y(n87) );
  OAI22X1 U138 ( .A(n5), .B(n79), .C(n14), .D(n87), .Y(n130) );
  INVX2 U139 ( .A(output_data[43]), .Y(n88) );
  OAI22X1 U140 ( .A(n5), .B(n80), .C(n14), .D(n88), .Y(n146) );
  INVX2 U141 ( .A(output_data[44]), .Y(n89) );
  OAI22X1 U142 ( .A(n5), .B(n81), .C(n14), .D(n89), .Y(n162) );
  INVX2 U143 ( .A(output_data[45]), .Y(n90) );
  OAI22X1 U144 ( .A(n5), .B(n82), .C(n14), .D(n90), .Y(n178) );
  INVX2 U145 ( .A(output_data[46]), .Y(n91) );
  OAI22X1 U146 ( .A(n5), .B(n83), .C(n14), .D(n91), .Y(n194) );
  INVX2 U147 ( .A(output_data[47]), .Y(n92) );
  OAI22X1 U148 ( .A(n5), .B(n84), .C(n14), .D(n92), .Y(n210) );
  INVX2 U149 ( .A(output_data[48]), .Y(n230) );
  OAI22X1 U150 ( .A(n5), .B(n85), .C(n14), .D(n230), .Y(n96) );
  INVX2 U151 ( .A(output_data[49]), .Y(n232) );
  OAI22X1 U152 ( .A(n5), .B(n86), .C(n14), .D(n232), .Y(n112) );
  INVX2 U153 ( .A(output_data[50]), .Y(n234) );
  OAI22X1 U154 ( .A(n5), .B(n87), .C(n14), .D(n234), .Y(n128) );
  INVX2 U155 ( .A(output_data[51]), .Y(n236) );
  OAI22X1 U156 ( .A(n4), .B(n88), .C(n14), .D(n236), .Y(n144) );
  INVX2 U157 ( .A(output_data[52]), .Y(n238) );
  OAI22X1 U158 ( .A(n4), .B(n89), .C(n13), .D(n238), .Y(n160) );
  INVX2 U159 ( .A(output_data[53]), .Y(n240) );
  OAI22X1 U160 ( .A(n4), .B(n90), .C(n13), .D(n240), .Y(n176) );
  INVX2 U161 ( .A(output_data[54]), .Y(n242) );
  OAI22X1 U162 ( .A(n4), .B(n91), .C(n13), .D(n242), .Y(n192) );
  INVX2 U163 ( .A(output_data[55]), .Y(n244) );
  OAI22X1 U232 ( .A(n4), .B(n92), .C(n13), .D(n244), .Y(n208) );
  INVX2 U233 ( .A(output_data[56]), .Y(n225) );
  OAI22X1 U234 ( .A(n4), .B(n230), .C(n13), .D(n225), .Y(n94) );
  INVX2 U235 ( .A(output_data[57]), .Y(n231) );
  OAI22X1 U236 ( .A(n4), .B(n232), .C(n13), .D(n231), .Y(n110) );
  INVX2 U237 ( .A(output_data[58]), .Y(n233) );
  OAI22X1 U238 ( .A(n4), .B(n234), .C(n13), .D(n233), .Y(n126) );
  INVX2 U239 ( .A(output_data[59]), .Y(n235) );
  OAI22X1 U240 ( .A(n4), .B(n236), .C(n13), .D(n235), .Y(n142) );
  INVX2 U241 ( .A(output_data[60]), .Y(n237) );
  OAI22X1 U242 ( .A(n4), .B(n238), .C(n13), .D(n237), .Y(n158) );
  INVX2 U243 ( .A(output_data[61]), .Y(n239) );
  OAI22X1 U244 ( .A(n4), .B(n240), .C(n13), .D(n239), .Y(n174) );
  INVX2 U245 ( .A(output_data[62]), .Y(n241) );
  OAI22X1 U246 ( .A(n4), .B(n242), .C(n13), .D(n241), .Y(n190) );
  INVX2 U247 ( .A(output_data[63]), .Y(n243) );
  OAI22X1 U248 ( .A(n6), .B(n244), .C(n13), .D(n243), .Y(n206) );
endmodule


module output_byte ( clk, n_rst, load_enable, rw, des_out, to_sram, to_i2c );
  input [63:0] des_out;
  output [7:0] to_sram;
  output [63:0] to_i2c;
  input clk, n_rst, load_enable, rw;
  wire   n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195;
  wire   [63:0] curr;
  wire   [63:0] next;
  assign to_i2c[63] = des_out[63];
  assign to_i2c[62] = des_out[62];
  assign to_i2c[61] = des_out[61];
  assign to_i2c[60] = des_out[60];
  assign to_i2c[59] = des_out[59];
  assign to_i2c[58] = des_out[58];
  assign to_i2c[57] = des_out[57];
  assign to_i2c[56] = des_out[56];
  assign to_i2c[55] = des_out[55];
  assign to_i2c[54] = des_out[54];
  assign to_i2c[53] = des_out[53];
  assign to_i2c[52] = des_out[52];
  assign to_i2c[51] = des_out[51];
  assign to_i2c[50] = des_out[50];
  assign to_i2c[49] = des_out[49];
  assign to_i2c[48] = des_out[48];
  assign to_i2c[47] = des_out[47];
  assign to_i2c[46] = des_out[46];
  assign to_i2c[45] = des_out[45];
  assign to_i2c[44] = des_out[44];
  assign to_i2c[43] = des_out[43];
  assign to_i2c[42] = des_out[42];
  assign to_i2c[41] = des_out[41];
  assign to_i2c[40] = des_out[40];
  assign to_i2c[39] = des_out[39];
  assign to_i2c[38] = des_out[38];
  assign to_i2c[37] = des_out[37];
  assign to_i2c[36] = des_out[36];
  assign to_i2c[35] = des_out[35];
  assign to_i2c[34] = des_out[34];
  assign to_i2c[33] = des_out[33];
  assign to_i2c[32] = des_out[32];
  assign to_i2c[31] = des_out[31];
  assign to_i2c[30] = des_out[30];
  assign to_i2c[29] = des_out[29];
  assign to_i2c[28] = des_out[28];
  assign to_i2c[27] = des_out[27];
  assign to_i2c[26] = des_out[26];
  assign to_i2c[25] = des_out[25];
  assign to_i2c[24] = des_out[24];
  assign to_i2c[23] = des_out[23];
  assign to_i2c[22] = des_out[22];
  assign to_i2c[21] = des_out[21];
  assign to_i2c[20] = des_out[20];
  assign to_i2c[19] = des_out[19];
  assign to_i2c[18] = des_out[18];
  assign to_i2c[17] = des_out[17];
  assign to_i2c[16] = des_out[16];
  assign to_i2c[15] = des_out[15];
  assign to_i2c[14] = des_out[14];
  assign to_i2c[13] = des_out[13];
  assign to_i2c[12] = des_out[12];
  assign to_i2c[11] = des_out[11];
  assign to_i2c[10] = des_out[10];
  assign to_i2c[9] = des_out[9];
  assign to_i2c[8] = des_out[8];
  assign to_i2c[7] = des_out[7];
  assign to_i2c[6] = des_out[6];
  assign to_i2c[5] = des_out[5];
  assign to_i2c[4] = des_out[4];
  assign to_i2c[3] = des_out[3];
  assign to_i2c[2] = des_out[2];
  assign to_i2c[1] = des_out[1];
  assign to_i2c[0] = des_out[0];

  DFFSR \curr_reg[7]  ( .D(next[7]), .CLK(clk), .R(1'b1), .S(n75), .Q(curr[7])
         );
  DFFSR \curr_reg[15]  ( .D(n156), .CLK(clk), .R(1'b1), .S(n75), .Q(curr[15])
         );
  DFFSR \curr_reg[23]  ( .D(n148), .CLK(clk), .R(1'b1), .S(n75), .Q(curr[23])
         );
  DFFSR \curr_reg[31]  ( .D(n140), .CLK(clk), .R(1'b1), .S(n75), .Q(curr[31])
         );
  DFFSR \curr_reg[39]  ( .D(n188), .CLK(clk), .R(1'b1), .S(n74), .Q(curr[39])
         );
  DFFSR \curr_reg[47]  ( .D(n180), .CLK(clk), .R(1'b1), .S(n74), .Q(curr[47])
         );
  DFFSR \curr_reg[55]  ( .D(n172), .CLK(clk), .R(1'b1), .S(n74), .Q(curr[55])
         );
  DFFSR \curr_reg[63]  ( .D(n164), .CLK(clk), .R(1'b1), .S(n74), .Q(curr[63])
         );
  DFFSR \curr_reg[6]  ( .D(next[6]), .CLK(clk), .R(1'b1), .S(n74), .Q(curr[6])
         );
  DFFSR \curr_reg[14]  ( .D(n157), .CLK(clk), .R(1'b1), .S(n74), .Q(curr[14])
         );
  DFFSR \curr_reg[22]  ( .D(n149), .CLK(clk), .R(1'b1), .S(n74), .Q(curr[22])
         );
  DFFSR \curr_reg[30]  ( .D(n141), .CLK(clk), .R(1'b1), .S(n74), .Q(curr[30])
         );
  DFFSR \curr_reg[38]  ( .D(n189), .CLK(clk), .R(1'b1), .S(n74), .Q(curr[38])
         );
  DFFSR \curr_reg[46]  ( .D(n181), .CLK(clk), .R(1'b1), .S(n74), .Q(curr[46])
         );
  DFFSR \curr_reg[54]  ( .D(n173), .CLK(clk), .R(1'b1), .S(n74), .Q(curr[54])
         );
  DFFSR \curr_reg[62]  ( .D(n165), .CLK(clk), .R(1'b1), .S(n74), .Q(curr[62])
         );
  DFFSR \curr_reg[5]  ( .D(next[5]), .CLK(clk), .R(1'b1), .S(n73), .Q(curr[5])
         );
  DFFSR \curr_reg[13]  ( .D(n158), .CLK(clk), .R(1'b1), .S(n73), .Q(curr[13])
         );
  DFFSR \curr_reg[21]  ( .D(n150), .CLK(clk), .R(1'b1), .S(n73), .Q(curr[21])
         );
  DFFSR \curr_reg[29]  ( .D(n142), .CLK(clk), .R(1'b1), .S(n73), .Q(curr[29])
         );
  DFFSR \curr_reg[37]  ( .D(n190), .CLK(clk), .R(1'b1), .S(n73), .Q(curr[37])
         );
  DFFSR \curr_reg[45]  ( .D(n182), .CLK(clk), .R(1'b1), .S(n73), .Q(curr[45])
         );
  DFFSR \curr_reg[53]  ( .D(n174), .CLK(clk), .R(1'b1), .S(n73), .Q(curr[53])
         );
  DFFSR \curr_reg[61]  ( .D(n166), .CLK(clk), .R(1'b1), .S(n73), .Q(curr[61])
         );
  DFFSR \curr_reg[4]  ( .D(next[4]), .CLK(clk), .R(1'b1), .S(n73), .Q(curr[4])
         );
  DFFSR \curr_reg[12]  ( .D(n159), .CLK(clk), .R(1'b1), .S(n73), .Q(curr[12])
         );
  DFFSR \curr_reg[20]  ( .D(n151), .CLK(clk), .R(1'b1), .S(n73), .Q(curr[20])
         );
  DFFSR \curr_reg[28]  ( .D(n143), .CLK(clk), .R(1'b1), .S(n73), .Q(curr[28])
         );
  DFFSR \curr_reg[36]  ( .D(n191), .CLK(clk), .R(1'b1), .S(n72), .Q(curr[36])
         );
  DFFSR \curr_reg[44]  ( .D(n183), .CLK(clk), .R(1'b1), .S(n72), .Q(curr[44])
         );
  DFFSR \curr_reg[52]  ( .D(n175), .CLK(clk), .R(1'b1), .S(n72), .Q(curr[52])
         );
  DFFSR \curr_reg[60]  ( .D(n167), .CLK(clk), .R(1'b1), .S(n72), .Q(curr[60])
         );
  DFFSR \curr_reg[3]  ( .D(next[3]), .CLK(clk), .R(1'b1), .S(n72), .Q(curr[3])
         );
  DFFSR \curr_reg[11]  ( .D(n160), .CLK(clk), .R(1'b1), .S(n72), .Q(curr[11])
         );
  DFFSR \curr_reg[19]  ( .D(n152), .CLK(clk), .R(1'b1), .S(n72), .Q(curr[19])
         );
  DFFSR \curr_reg[27]  ( .D(n144), .CLK(clk), .R(1'b1), .S(n72), .Q(curr[27])
         );
  DFFSR \curr_reg[35]  ( .D(n192), .CLK(clk), .R(1'b1), .S(n72), .Q(curr[35])
         );
  DFFSR \curr_reg[43]  ( .D(n184), .CLK(clk), .R(1'b1), .S(n72), .Q(curr[43])
         );
  DFFSR \curr_reg[51]  ( .D(n176), .CLK(clk), .R(1'b1), .S(n72), .Q(curr[51])
         );
  DFFSR \curr_reg[59]  ( .D(n168), .CLK(clk), .R(1'b1), .S(n72), .Q(curr[59])
         );
  DFFSR \curr_reg[2]  ( .D(next[2]), .CLK(clk), .R(1'b1), .S(n71), .Q(curr[2])
         );
  DFFSR \curr_reg[10]  ( .D(n161), .CLK(clk), .R(1'b1), .S(n71), .Q(curr[10])
         );
  DFFSR \curr_reg[18]  ( .D(n153), .CLK(clk), .R(1'b1), .S(n71), .Q(curr[18])
         );
  DFFSR \curr_reg[26]  ( .D(n145), .CLK(clk), .R(1'b1), .S(n71), .Q(curr[26])
         );
  DFFSR \curr_reg[34]  ( .D(n193), .CLK(clk), .R(1'b1), .S(n71), .Q(curr[34])
         );
  DFFSR \curr_reg[42]  ( .D(n185), .CLK(clk), .R(1'b1), .S(n71), .Q(curr[42])
         );
  DFFSR \curr_reg[50]  ( .D(n177), .CLK(clk), .R(1'b1), .S(n71), .Q(curr[50])
         );
  DFFSR \curr_reg[58]  ( .D(n169), .CLK(clk), .R(1'b1), .S(n71), .Q(curr[58])
         );
  DFFSR \curr_reg[1]  ( .D(next[1]), .CLK(clk), .R(1'b1), .S(n71), .Q(curr[1])
         );
  DFFSR \curr_reg[9]  ( .D(n162), .CLK(clk), .R(1'b1), .S(n71), .Q(curr[9]) );
  DFFSR \curr_reg[17]  ( .D(n154), .CLK(clk), .R(1'b1), .S(n71), .Q(curr[17])
         );
  DFFSR \curr_reg[25]  ( .D(n146), .CLK(clk), .R(1'b1), .S(n71), .Q(curr[25])
         );
  DFFSR \curr_reg[33]  ( .D(n194), .CLK(clk), .R(1'b1), .S(n70), .Q(curr[33])
         );
  DFFSR \curr_reg[41]  ( .D(n186), .CLK(clk), .R(1'b1), .S(n70), .Q(curr[41])
         );
  DFFSR \curr_reg[49]  ( .D(n178), .CLK(clk), .R(1'b1), .S(n70), .Q(curr[49])
         );
  DFFSR \curr_reg[57]  ( .D(n170), .CLK(clk), .R(1'b1), .S(n70), .Q(curr[57])
         );
  DFFSR \curr_reg[0]  ( .D(next[0]), .CLK(clk), .R(1'b1), .S(n70), .Q(curr[0])
         );
  DFFSR \curr_reg[8]  ( .D(n163), .CLK(clk), .R(1'b1), .S(n70), .Q(curr[8]) );
  DFFSR \curr_reg[16]  ( .D(n155), .CLK(clk), .R(1'b1), .S(n70), .Q(curr[16])
         );
  DFFSR \curr_reg[24]  ( .D(n147), .CLK(clk), .R(1'b1), .S(n70), .Q(curr[24])
         );
  DFFSR \curr_reg[32]  ( .D(n195), .CLK(clk), .R(1'b1), .S(n70), .Q(curr[32])
         );
  DFFSR \curr_reg[40]  ( .D(n187), .CLK(clk), .R(1'b1), .S(n70), .Q(curr[40])
         );
  DFFSR \curr_reg[48]  ( .D(n179), .CLK(clk), .R(1'b1), .S(n70), .Q(curr[48])
         );
  DFFSR \curr_reg[56]  ( .D(n171), .CLK(clk), .R(1'b1), .S(n70), .Q(curr[56])
         );
  BUFX2 U67 ( .A(load_enable), .Y(n67) );
  BUFX2 U68 ( .A(load_enable), .Y(n65) );
  BUFX2 U69 ( .A(load_enable), .Y(n68) );
  BUFX2 U70 ( .A(load_enable), .Y(n66) );
  BUFX2 U71 ( .A(load_enable), .Y(n69) );
  BUFX2 U72 ( .A(n_rst), .Y(n70) );
  BUFX2 U73 ( .A(n_rst), .Y(n71) );
  BUFX2 U74 ( .A(n_rst), .Y(n72) );
  BUFX2 U75 ( .A(n_rst), .Y(n73) );
  BUFX2 U76 ( .A(n_rst), .Y(n74) );
  BUFX2 U77 ( .A(n_rst), .Y(n75) );
  INVX2 U78 ( .A(des_out[0]), .Y(n76) );
  NAND2X1 U79 ( .A(n69), .B(n76), .Y(next[0]) );
  MUX2X1 U80 ( .B(curr[0]), .A(des_out[8]), .S(n69), .Y(n77) );
  INVX2 U81 ( .A(n77), .Y(n163) );
  MUX2X1 U82 ( .B(curr[8]), .A(des_out[16]), .S(n69), .Y(n78) );
  INVX2 U83 ( .A(n78), .Y(n155) );
  MUX2X1 U84 ( .B(curr[16]), .A(des_out[24]), .S(n69), .Y(n79) );
  INVX2 U85 ( .A(n79), .Y(n147) );
  MUX2X1 U86 ( .B(curr[24]), .A(des_out[32]), .S(n68), .Y(n80) );
  INVX2 U87 ( .A(n80), .Y(n195) );
  MUX2X1 U88 ( .B(curr[32]), .A(des_out[40]), .S(n69), .Y(n81) );
  INVX2 U89 ( .A(n81), .Y(n187) );
  MUX2X1 U90 ( .B(curr[40]), .A(des_out[48]), .S(n68), .Y(n82) );
  INVX2 U91 ( .A(n82), .Y(n179) );
  MUX2X1 U92 ( .B(curr[48]), .A(des_out[56]), .S(n68), .Y(n83) );
  INVX2 U93 ( .A(n83), .Y(n171) );
  OR2X2 U94 ( .A(rw), .B(curr[56]), .Y(to_sram[0]) );
  INVX2 U95 ( .A(des_out[1]), .Y(n84) );
  NAND2X1 U96 ( .A(n84), .B(n69), .Y(next[1]) );
  MUX2X1 U97 ( .B(curr[1]), .A(des_out[9]), .S(n68), .Y(n85) );
  INVX2 U98 ( .A(n85), .Y(n162) );
  MUX2X1 U99 ( .B(curr[9]), .A(des_out[17]), .S(n68), .Y(n86) );
  INVX2 U100 ( .A(n86), .Y(n154) );
  MUX2X1 U101 ( .B(curr[17]), .A(des_out[25]), .S(n68), .Y(n87) );
  INVX2 U102 ( .A(n87), .Y(n146) );
  MUX2X1 U103 ( .B(curr[25]), .A(des_out[33]), .S(n68), .Y(n88) );
  INVX2 U104 ( .A(n88), .Y(n194) );
  MUX2X1 U105 ( .B(curr[33]), .A(des_out[41]), .S(n68), .Y(n89) );
  INVX2 U106 ( .A(n89), .Y(n186) );
  MUX2X1 U107 ( .B(curr[41]), .A(des_out[49]), .S(n68), .Y(n90) );
  INVX2 U108 ( .A(n90), .Y(n178) );
  MUX2X1 U109 ( .B(curr[49]), .A(des_out[57]), .S(n68), .Y(n91) );
  INVX2 U110 ( .A(n91), .Y(n170) );
  OR2X2 U111 ( .A(rw), .B(curr[57]), .Y(to_sram[1]) );
  INVX2 U112 ( .A(des_out[2]), .Y(n92) );
  NAND2X1 U113 ( .A(n92), .B(n69), .Y(next[2]) );
  MUX2X1 U114 ( .B(curr[2]), .A(des_out[10]), .S(n68), .Y(n93) );
  INVX2 U115 ( .A(n93), .Y(n161) );
  MUX2X1 U116 ( .B(curr[10]), .A(des_out[18]), .S(n68), .Y(n94) );
  INVX2 U117 ( .A(n94), .Y(n153) );
  MUX2X1 U118 ( .B(curr[18]), .A(des_out[26]), .S(n68), .Y(n95) );
  INVX2 U119 ( .A(n95), .Y(n145) );
  MUX2X1 U120 ( .B(curr[26]), .A(des_out[34]), .S(n67), .Y(n96) );
  INVX2 U121 ( .A(n96), .Y(n193) );
  MUX2X1 U122 ( .B(curr[34]), .A(des_out[42]), .S(n67), .Y(n97) );
  INVX2 U123 ( .A(n97), .Y(n185) );
  MUX2X1 U124 ( .B(curr[42]), .A(des_out[50]), .S(n67), .Y(n98) );
  INVX2 U125 ( .A(n98), .Y(n177) );
  MUX2X1 U126 ( .B(curr[50]), .A(des_out[58]), .S(n67), .Y(n99) );
  INVX2 U127 ( .A(n99), .Y(n169) );
  OR2X2 U128 ( .A(rw), .B(curr[58]), .Y(to_sram[2]) );
  INVX2 U129 ( .A(des_out[3]), .Y(n100) );
  NAND2X1 U130 ( .A(n100), .B(n69), .Y(next[3]) );
  MUX2X1 U131 ( .B(curr[3]), .A(des_out[11]), .S(n67), .Y(n101) );
  INVX2 U132 ( .A(n101), .Y(n160) );
  MUX2X1 U133 ( .B(curr[11]), .A(des_out[19]), .S(n67), .Y(n102) );
  INVX2 U134 ( .A(n102), .Y(n152) );
  MUX2X1 U135 ( .B(curr[19]), .A(des_out[27]), .S(n67), .Y(n103) );
  INVX2 U136 ( .A(n103), .Y(n144) );
  MUX2X1 U137 ( .B(curr[27]), .A(des_out[35]), .S(n67), .Y(n104) );
  INVX2 U138 ( .A(n104), .Y(n192) );
  MUX2X1 U139 ( .B(curr[35]), .A(des_out[43]), .S(n67), .Y(n105) );
  INVX2 U140 ( .A(n105), .Y(n184) );
  MUX2X1 U141 ( .B(curr[43]), .A(des_out[51]), .S(n67), .Y(n106) );
  INVX2 U142 ( .A(n106), .Y(n176) );
  MUX2X1 U143 ( .B(curr[51]), .A(des_out[59]), .S(n67), .Y(n107) );
  INVX2 U144 ( .A(n107), .Y(n168) );
  OR2X2 U145 ( .A(rw), .B(curr[59]), .Y(to_sram[3]) );
  INVX2 U146 ( .A(des_out[4]), .Y(n108) );
  NAND2X1 U147 ( .A(n108), .B(n69), .Y(next[4]) );
  MUX2X1 U148 ( .B(curr[4]), .A(des_out[12]), .S(n67), .Y(n109) );
  INVX2 U149 ( .A(n109), .Y(n159) );
  MUX2X1 U150 ( .B(curr[12]), .A(des_out[20]), .S(n66), .Y(n110) );
  INVX2 U151 ( .A(n110), .Y(n151) );
  MUX2X1 U152 ( .B(curr[20]), .A(des_out[28]), .S(n66), .Y(n111) );
  INVX2 U153 ( .A(n111), .Y(n143) );
  MUX2X1 U154 ( .B(curr[28]), .A(des_out[36]), .S(n66), .Y(n112) );
  INVX2 U155 ( .A(n112), .Y(n191) );
  MUX2X1 U156 ( .B(curr[36]), .A(des_out[44]), .S(n66), .Y(n113) );
  INVX2 U157 ( .A(n113), .Y(n183) );
  MUX2X1 U158 ( .B(curr[44]), .A(des_out[52]), .S(n66), .Y(n114) );
  INVX2 U159 ( .A(n114), .Y(n175) );
  MUX2X1 U160 ( .B(curr[52]), .A(des_out[60]), .S(n66), .Y(n115) );
  INVX2 U161 ( .A(n115), .Y(n167) );
  OR2X2 U162 ( .A(rw), .B(curr[60]), .Y(to_sram[4]) );
  INVX2 U163 ( .A(des_out[5]), .Y(n116) );
  NAND2X1 U164 ( .A(n116), .B(n69), .Y(next[5]) );
  MUX2X1 U165 ( .B(curr[5]), .A(des_out[13]), .S(n66), .Y(n117) );
  INVX2 U166 ( .A(n117), .Y(n158) );
  MUX2X1 U167 ( .B(curr[13]), .A(des_out[21]), .S(n66), .Y(n118) );
  INVX2 U168 ( .A(n118), .Y(n150) );
  MUX2X1 U169 ( .B(curr[21]), .A(des_out[29]), .S(n66), .Y(n119) );
  INVX2 U170 ( .A(n119), .Y(n142) );
  MUX2X1 U171 ( .B(curr[29]), .A(des_out[37]), .S(n66), .Y(n120) );
  INVX2 U172 ( .A(n120), .Y(n190) );
  MUX2X1 U173 ( .B(curr[37]), .A(des_out[45]), .S(n66), .Y(n121) );
  INVX2 U174 ( .A(n121), .Y(n182) );
  MUX2X1 U175 ( .B(curr[45]), .A(des_out[53]), .S(n66), .Y(n122) );
  INVX2 U176 ( .A(n122), .Y(n174) );
  MUX2X1 U177 ( .B(curr[53]), .A(des_out[61]), .S(n66), .Y(n123) );
  INVX2 U178 ( .A(n123), .Y(n166) );
  OR2X2 U179 ( .A(rw), .B(curr[61]), .Y(to_sram[5]) );
  INVX2 U180 ( .A(des_out[6]), .Y(n124) );
  NAND2X1 U181 ( .A(n124), .B(n69), .Y(next[6]) );
  MUX2X1 U182 ( .B(curr[6]), .A(des_out[14]), .S(n65), .Y(n125) );
  INVX2 U183 ( .A(n125), .Y(n157) );
  MUX2X1 U184 ( .B(curr[14]), .A(des_out[22]), .S(n65), .Y(n126) );
  INVX2 U185 ( .A(n126), .Y(n149) );
  MUX2X1 U186 ( .B(curr[22]), .A(des_out[30]), .S(n65), .Y(n127) );
  INVX2 U187 ( .A(n127), .Y(n141) );
  MUX2X1 U188 ( .B(curr[30]), .A(des_out[38]), .S(n65), .Y(n128) );
  INVX2 U189 ( .A(n128), .Y(n189) );
  MUX2X1 U190 ( .B(curr[38]), .A(des_out[46]), .S(n65), .Y(n129) );
  INVX2 U191 ( .A(n129), .Y(n181) );
  MUX2X1 U192 ( .B(curr[46]), .A(des_out[54]), .S(n65), .Y(n130) );
  INVX2 U193 ( .A(n130), .Y(n173) );
  MUX2X1 U194 ( .B(curr[54]), .A(des_out[62]), .S(n65), .Y(n131) );
  INVX2 U195 ( .A(n131), .Y(n165) );
  OR2X2 U196 ( .A(rw), .B(curr[62]), .Y(to_sram[6]) );
  INVX2 U197 ( .A(des_out[7]), .Y(n132) );
  NAND2X1 U198 ( .A(n132), .B(n69), .Y(next[7]) );
  MUX2X1 U199 ( .B(curr[7]), .A(des_out[15]), .S(n65), .Y(n133) );
  INVX2 U200 ( .A(n133), .Y(n156) );
  MUX2X1 U201 ( .B(curr[15]), .A(des_out[23]), .S(n65), .Y(n134) );
  INVX2 U202 ( .A(n134), .Y(n148) );
  MUX2X1 U203 ( .B(curr[23]), .A(des_out[31]), .S(n65), .Y(n135) );
  INVX2 U204 ( .A(n135), .Y(n140) );
  MUX2X1 U205 ( .B(curr[31]), .A(des_out[39]), .S(n65), .Y(n136) );
  INVX2 U206 ( .A(n136), .Y(n188) );
  MUX2X1 U207 ( .B(curr[39]), .A(des_out[47]), .S(n65), .Y(n137) );
  INVX2 U208 ( .A(n137), .Y(n180) );
  MUX2X1 U209 ( .B(curr[47]), .A(des_out[55]), .S(n65), .Y(n138) );
  INVX2 U210 ( .A(n138), .Y(n172) );
  MUX2X1 U211 ( .B(curr[55]), .A(des_out[63]), .S(n67), .Y(n139) );
  INVX2 U212 ( .A(n139), .Y(n164) );
  OR2X2 U213 ( .A(rw), .B(curr[63]), .Y(to_sram[7]) );
endmodule


module addr_gen_DW01_inc_0 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;

  wire   [15:2] carry;

  HAX1 U1_1_14 ( .A(A[14]), .B(carry[14]), .YC(carry[15]), .YS(SUM[14]) );
  HAX1 U1_1_13 ( .A(A[13]), .B(carry[13]), .YC(carry[14]), .YS(SUM[13]) );
  HAX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .YC(carry[13]), .YS(SUM[12]) );
  HAX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .YC(carry[12]), .YS(SUM[11]) );
  HAX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .YC(carry[11]), .YS(SUM[10]) );
  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[15]), .B(A[15]), .Y(SUM[15]) );
endmodule


module addr_gen_DW01_inc_1 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;

  wire   [15:2] carry;

  HAX1 U1_1_14 ( .A(A[14]), .B(carry[14]), .YC(carry[15]), .YS(SUM[14]) );
  HAX1 U1_1_13 ( .A(A[13]), .B(carry[13]), .YC(carry[14]), .YS(SUM[13]) );
  HAX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .YC(carry[13]), .YS(SUM[12]) );
  HAX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .YC(carry[12]), .YS(SUM[11]) );
  HAX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .YC(carry[11]), .YS(SUM[10]) );
  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[15]), .B(A[15]), .Y(SUM[15]) );
endmodule


module addr_gen ( clk, n_rst, enable, rw_mode, address, write_en, read_en );
  output [15:0] address;
  input clk, n_rst, enable, rw_mode;
  output write_en, read_en;
  wire   N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41,
         N42, N43, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57, N58,
         N59, N60, N61, N62, N104, N105, N106, N107, N108, N109, N110, N111,
         N112, N113, N114, N115, N116, N117, N118, N119, N120, N121, N122,
         N123, N124, N125, N126, N127, N128, N129, N130, N131, N132, N133,
         N134, N135, N136, N137, n85, n88, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n86, n87, n89, n90, n91, n113, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150;
  wire   [15:0] aw_c;
  wire   [15:0] ar_c;
  wire   [3:0] state;
  wire   [2:0] cnt_c;
  wire   [1:0] nstate;
  wire   [15:0] ar_n;
  wire   [15:0] aw_n;

  DFFSR \cnt_c_reg[0]  ( .D(n134), .CLK(clk), .R(n56), .S(1'b1), .Q(cnt_c[0])
         );
  DFFSR \cnt_c_reg[1]  ( .D(n132), .CLK(clk), .R(n56), .S(1'b1), .Q(cnt_c[1])
         );
  DFFSR \state_reg[0]  ( .D(nstate[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[1]  ( .D(nstate[1]), .CLK(clk), .R(n56), .S(1'b1), .Q(
        state[1]) );
  DFFSR w_en_c_reg ( .D(n131), .CLK(clk), .R(n_rst), .S(1'b1), .Q(write_en) );
  DFFSR \cnt_c_reg[2]  ( .D(n133), .CLK(clk), .R(n56), .S(1'b1), .Q(cnt_c[2])
         );
  DFFSR r_en_c_reg ( .D(n130), .CLK(clk), .R(n56), .S(1'b1), .Q(read_en) );
  LATCH \aw_n_reg[0]  ( .CLK(n41), .D(N122), .Q(aw_n[0]) );
  DFFSR \aw_c_reg[0]  ( .D(aw_n[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        aw_c[0]) );
  LATCH \aw_n_reg[1]  ( .CLK(n41), .D(N123), .Q(aw_n[1]) );
  DFFSR \aw_c_reg[1]  ( .D(aw_n[1]), .CLK(clk), .R(n56), .S(1'b1), .Q(aw_c[1])
         );
  LATCH \aw_n_reg[2]  ( .CLK(n41), .D(N124), .Q(aw_n[2]) );
  DFFSR \aw_c_reg[2]  ( .D(aw_n[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        aw_c[2]) );
  LATCH \aw_n_reg[3]  ( .CLK(n41), .D(N125), .Q(aw_n[3]) );
  DFFSR \aw_c_reg[3]  ( .D(aw_n[3]), .CLK(clk), .R(n56), .S(1'b1), .Q(aw_c[3])
         );
  LATCH \aw_n_reg[4]  ( .CLK(n41), .D(N126), .Q(aw_n[4]) );
  DFFSR \aw_c_reg[4]  ( .D(aw_n[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        aw_c[4]) );
  LATCH \aw_n_reg[5]  ( .CLK(n41), .D(N127), .Q(aw_n[5]) );
  DFFSR \aw_c_reg[5]  ( .D(aw_n[5]), .CLK(clk), .R(n56), .S(1'b1), .Q(aw_c[5])
         );
  LATCH \aw_n_reg[6]  ( .CLK(n41), .D(N128), .Q(aw_n[6]) );
  DFFSR \aw_c_reg[6]  ( .D(aw_n[6]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        aw_c[6]) );
  LATCH \aw_n_reg[7]  ( .CLK(n41), .D(N129), .Q(aw_n[7]) );
  DFFSR \aw_c_reg[7]  ( .D(aw_n[7]), .CLK(clk), .R(n56), .S(1'b1), .Q(aw_c[7])
         );
  LATCH \aw_n_reg[8]  ( .CLK(n41), .D(N130), .Q(aw_n[8]) );
  DFFSR \aw_c_reg[8]  ( .D(aw_n[8]), .CLK(clk), .R(n56), .S(1'b1), .Q(aw_c[8])
         );
  LATCH \aw_n_reg[9]  ( .CLK(n41), .D(N131), .Q(aw_n[9]) );
  DFFSR \aw_c_reg[9]  ( .D(aw_n[9]), .CLK(clk), .R(n56), .S(1'b1), .Q(aw_c[9])
         );
  LATCH \aw_n_reg[10]  ( .CLK(n41), .D(N132), .Q(aw_n[10]) );
  DFFSR \aw_c_reg[10]  ( .D(aw_n[10]), .CLK(clk), .R(n56), .S(1'b1), .Q(
        aw_c[10]) );
  LATCH \aw_n_reg[11]  ( .CLK(n41), .D(N133), .Q(aw_n[11]) );
  DFFSR \aw_c_reg[11]  ( .D(aw_n[11]), .CLK(clk), .R(n56), .S(1'b1), .Q(
        aw_c[11]) );
  LATCH \aw_n_reg[12]  ( .CLK(n41), .D(N134), .Q(aw_n[12]) );
  DFFSR \aw_c_reg[12]  ( .D(aw_n[12]), .CLK(clk), .R(n56), .S(1'b1), .Q(
        aw_c[12]) );
  LATCH \aw_n_reg[13]  ( .CLK(n41), .D(N135), .Q(aw_n[13]) );
  DFFSR \aw_c_reg[13]  ( .D(aw_n[13]), .CLK(clk), .R(n56), .S(1'b1), .Q(
        aw_c[13]) );
  LATCH \aw_n_reg[14]  ( .CLK(n41), .D(N136), .Q(aw_n[14]) );
  DFFSR \aw_c_reg[14]  ( .D(aw_n[14]), .CLK(clk), .R(n56), .S(1'b1), .Q(
        aw_c[14]) );
  LATCH \aw_n_reg[15]  ( .CLK(n41), .D(N137), .Q(aw_n[15]) );
  DFFSR \aw_c_reg[15]  ( .D(aw_n[15]), .CLK(clk), .R(n56), .S(1'b1), .Q(
        aw_c[15]) );
  LATCH \ar_n_reg[0]  ( .CLK(n43), .D(N105), .Q(ar_n[0]) );
  DFFSR \ar_c_reg[0]  ( .D(ar_n[0]), .CLK(clk), .R(n56), .S(1'b1), .Q(ar_c[0])
         );
  LATCH \ar_n_reg[1]  ( .CLK(n43), .D(N106), .Q(ar_n[1]) );
  DFFSR \ar_c_reg[1]  ( .D(ar_n[1]), .CLK(clk), .R(n56), .S(1'b1), .Q(ar_c[1])
         );
  LATCH \ar_n_reg[2]  ( .CLK(n43), .D(N107), .Q(ar_n[2]) );
  DFFSR \ar_c_reg[2]  ( .D(ar_n[2]), .CLK(clk), .R(n56), .S(1'b1), .Q(ar_c[2])
         );
  LATCH \ar_n_reg[3]  ( .CLK(n43), .D(N108), .Q(ar_n[3]) );
  DFFSR \ar_c_reg[3]  ( .D(ar_n[3]), .CLK(clk), .R(n56), .S(1'b1), .Q(ar_c[3])
         );
  LATCH \ar_n_reg[4]  ( .CLK(n43), .D(N109), .Q(ar_n[4]) );
  DFFSR \ar_c_reg[4]  ( .D(ar_n[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        ar_c[4]) );
  LATCH \ar_n_reg[5]  ( .CLK(n43), .D(N110), .Q(ar_n[5]) );
  DFFSR \ar_c_reg[5]  ( .D(ar_n[5]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        ar_c[5]) );
  LATCH \ar_n_reg[6]  ( .CLK(n43), .D(N111), .Q(ar_n[6]) );
  DFFSR \ar_c_reg[6]  ( .D(ar_n[6]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        ar_c[6]) );
  LATCH \ar_n_reg[7]  ( .CLK(n43), .D(N112), .Q(ar_n[7]) );
  DFFSR \ar_c_reg[7]  ( .D(ar_n[7]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        ar_c[7]) );
  LATCH \ar_n_reg[8]  ( .CLK(n43), .D(N113), .Q(ar_n[8]) );
  DFFSR \ar_c_reg[8]  ( .D(ar_n[8]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        ar_c[8]) );
  LATCH \ar_n_reg[9]  ( .CLK(n43), .D(N114), .Q(ar_n[9]) );
  DFFSR \ar_c_reg[9]  ( .D(ar_n[9]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        ar_c[9]) );
  LATCH \ar_n_reg[10]  ( .CLK(n43), .D(N115), .Q(ar_n[10]) );
  DFFSR \ar_c_reg[10]  ( .D(ar_n[10]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        ar_c[10]) );
  LATCH \ar_n_reg[11]  ( .CLK(n43), .D(N116), .Q(ar_n[11]) );
  DFFSR \ar_c_reg[11]  ( .D(ar_n[11]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        ar_c[11]) );
  LATCH \ar_n_reg[12]  ( .CLK(n43), .D(N117), .Q(ar_n[12]) );
  DFFSR \ar_c_reg[12]  ( .D(ar_n[12]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        ar_c[12]) );
  LATCH \ar_n_reg[13]  ( .CLK(n43), .D(N118), .Q(ar_n[13]) );
  DFFSR \ar_c_reg[13]  ( .D(ar_n[13]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        ar_c[13]) );
  LATCH \ar_n_reg[14]  ( .CLK(n43), .D(N119), .Q(ar_n[14]) );
  DFFSR \ar_c_reg[14]  ( .D(ar_n[14]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        ar_c[14]) );
  LATCH \ar_n_reg[15]  ( .CLK(n43), .D(N120), .Q(ar_n[15]) );
  DFFSR \ar_c_reg[15]  ( .D(ar_n[15]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        ar_c[15]) );
  OAI21X1 U96 ( .A(n46), .B(n73), .C(n85), .Y(n131) );
  NAND3X1 U98 ( .A(n72), .B(n71), .C(cnt_c[0]), .Y(n93) );
  AOI21X1 U99 ( .A(n72), .B(n70), .C(n48), .Y(n92) );
  XNOR2X1 U101 ( .A(n96), .B(n74), .Y(n95) );
  NAND2X1 U102 ( .A(cnt_c[1]), .B(cnt_c[0]), .Y(n96) );
  NOR2X1 U104 ( .A(n68), .B(n69), .Y(n94) );
  OAI22X1 U105 ( .A(n50), .B(n84), .C(n55), .D(n144), .Y(address[9]) );
  OAI22X1 U106 ( .A(n50), .B(n83), .C(n55), .D(n143), .Y(address[8]) );
  OAI22X1 U107 ( .A(n50), .B(n82), .C(n55), .D(n142), .Y(address[7]) );
  OAI22X1 U108 ( .A(n51), .B(n81), .C(n55), .D(n141), .Y(address[6]) );
  OAI22X1 U109 ( .A(n51), .B(n80), .C(n54), .D(n140), .Y(address[5]) );
  OAI22X1 U110 ( .A(n51), .B(n79), .C(n54), .D(n139), .Y(address[4]) );
  OAI22X1 U111 ( .A(n52), .B(n78), .C(n54), .D(n138), .Y(address[3]) );
  OAI22X1 U112 ( .A(n52), .B(n77), .C(n54), .D(n137), .Y(address[2]) );
  OAI22X1 U113 ( .A(n52), .B(n76), .C(n54), .D(n136), .Y(address[1]) );
  OAI22X1 U114 ( .A(n52), .B(n113), .C(n54), .D(n150), .Y(address[15]) );
  OAI22X1 U115 ( .A(n52), .B(n91), .C(n54), .D(n149), .Y(address[14]) );
  OAI22X1 U116 ( .A(n52), .B(n90), .C(n54), .D(n148), .Y(address[13]) );
  OAI22X1 U117 ( .A(n52), .B(n89), .C(n54), .D(n147), .Y(address[12]) );
  OAI22X1 U118 ( .A(n53), .B(n87), .C(n54), .D(n146), .Y(address[11]) );
  OAI22X1 U119 ( .A(n53), .B(n86), .C(n54), .D(n145), .Y(address[10]) );
  OAI22X1 U120 ( .A(n53), .B(n75), .C(n54), .D(n135), .Y(address[0]) );
  OAI21X1 U121 ( .A(n45), .B(n113), .C(n97), .Y(N137) );
  NAND2X1 U122 ( .A(N43), .B(n69), .Y(n97) );
  OAI21X1 U123 ( .A(n45), .B(n91), .C(n98), .Y(N136) );
  NAND2X1 U124 ( .A(N42), .B(n69), .Y(n98) );
  OAI21X1 U125 ( .A(n45), .B(n90), .C(n99), .Y(N135) );
  NAND2X1 U126 ( .A(N41), .B(n69), .Y(n99) );
  OAI21X1 U127 ( .A(n45), .B(n89), .C(n100), .Y(N134) );
  NAND2X1 U128 ( .A(N40), .B(n69), .Y(n100) );
  OAI21X1 U129 ( .A(n45), .B(n87), .C(n101), .Y(N133) );
  NAND2X1 U130 ( .A(N39), .B(n69), .Y(n101) );
  OAI21X1 U131 ( .A(n45), .B(n86), .C(n102), .Y(N132) );
  NAND2X1 U132 ( .A(N38), .B(n69), .Y(n102) );
  OAI21X1 U133 ( .A(n45), .B(n84), .C(n103), .Y(N131) );
  NAND2X1 U134 ( .A(N37), .B(n69), .Y(n103) );
  OAI21X1 U135 ( .A(n45), .B(n83), .C(n104), .Y(N130) );
  NAND2X1 U136 ( .A(N36), .B(n69), .Y(n104) );
  OAI21X1 U137 ( .A(n45), .B(n82), .C(n105), .Y(N129) );
  NAND2X1 U138 ( .A(N35), .B(n69), .Y(n105) );
  OAI21X1 U139 ( .A(n45), .B(n81), .C(n106), .Y(N128) );
  NAND2X1 U140 ( .A(N34), .B(n69), .Y(n106) );
  OAI21X1 U141 ( .A(n45), .B(n80), .C(n107), .Y(N127) );
  NAND2X1 U142 ( .A(N33), .B(n69), .Y(n107) );
  OAI21X1 U143 ( .A(n45), .B(n79), .C(n108), .Y(N126) );
  NAND2X1 U144 ( .A(N32), .B(n69), .Y(n108) );
  OAI21X1 U145 ( .A(n46), .B(n78), .C(n109), .Y(N125) );
  NAND2X1 U146 ( .A(N31), .B(n69), .Y(n109) );
  OAI21X1 U147 ( .A(n46), .B(n77), .C(n110), .Y(N124) );
  NAND2X1 U148 ( .A(N30), .B(n69), .Y(n110) );
  OAI21X1 U149 ( .A(n46), .B(n76), .C(n111), .Y(N123) );
  NAND2X1 U150 ( .A(N29), .B(n69), .Y(n111) );
  OAI21X1 U151 ( .A(n46), .B(n75), .C(n112), .Y(N122) );
  NAND2X1 U152 ( .A(N28), .B(n69), .Y(n112) );
  OAI21X1 U155 ( .A(n46), .B(n150), .C(n114), .Y(N120) );
  NAND2X1 U156 ( .A(N62), .B(n68), .Y(n114) );
  OAI21X1 U157 ( .A(n46), .B(n149), .C(n115), .Y(N119) );
  NAND2X1 U158 ( .A(N61), .B(n68), .Y(n115) );
  OAI21X1 U159 ( .A(n46), .B(n148), .C(n116), .Y(N118) );
  NAND2X1 U160 ( .A(N60), .B(n68), .Y(n116) );
  OAI21X1 U161 ( .A(n46), .B(n147), .C(n117), .Y(N117) );
  NAND2X1 U162 ( .A(N59), .B(n68), .Y(n117) );
  OAI21X1 U163 ( .A(n46), .B(n146), .C(n118), .Y(N116) );
  NAND2X1 U164 ( .A(N58), .B(n68), .Y(n118) );
  OAI21X1 U165 ( .A(n46), .B(n145), .C(n119), .Y(N115) );
  NAND2X1 U166 ( .A(N57), .B(n68), .Y(n119) );
  OAI21X1 U167 ( .A(n46), .B(n144), .C(n120), .Y(N114) );
  NAND2X1 U168 ( .A(N56), .B(n68), .Y(n120) );
  OAI21X1 U169 ( .A(n46), .B(n143), .C(n121), .Y(N113) );
  NAND2X1 U170 ( .A(N55), .B(n68), .Y(n121) );
  OAI21X1 U171 ( .A(n47), .B(n142), .C(n122), .Y(N112) );
  NAND2X1 U172 ( .A(N54), .B(n68), .Y(n122) );
  OAI21X1 U173 ( .A(n47), .B(n141), .C(n123), .Y(N111) );
  NAND2X1 U174 ( .A(N53), .B(n68), .Y(n123) );
  OAI21X1 U175 ( .A(n47), .B(n140), .C(n124), .Y(N110) );
  NAND2X1 U176 ( .A(N52), .B(n68), .Y(n124) );
  OAI21X1 U177 ( .A(n47), .B(n139), .C(n125), .Y(N109) );
  NAND2X1 U178 ( .A(N51), .B(n68), .Y(n125) );
  OAI21X1 U179 ( .A(n47), .B(n138), .C(n126), .Y(N108) );
  NAND2X1 U180 ( .A(N50), .B(n68), .Y(n126) );
  OAI21X1 U181 ( .A(n47), .B(n137), .C(n127), .Y(N107) );
  NAND2X1 U182 ( .A(N49), .B(n68), .Y(n127) );
  OAI21X1 U183 ( .A(n47), .B(n136), .C(n128), .Y(N106) );
  NAND2X1 U184 ( .A(N48), .B(n68), .Y(n128) );
  OAI21X1 U185 ( .A(n47), .B(n135), .C(n129), .Y(N105) );
  NAND2X1 U186 ( .A(N47), .B(n68), .Y(n129) );
  addr_gen_DW01_inc_0 add_88 ( .A(ar_c), .SUM({N62, N61, N60, N59, N58, N57, 
        N56, N55, N54, N53, N52, N51, N50, N49, N48, N47}) );
  addr_gen_DW01_inc_1 add_76 ( .A(aw_c), .SUM({N43, N42, N41, N40, N39, N38, 
        N37, N36, N35, N34, N33, N32, N31, N30, N29, N28}) );
  INVX1 U42 ( .A(N121), .Y(n40) );
  INVX2 U43 ( .A(n40), .Y(n41) );
  INVX1 U44 ( .A(N104), .Y(n42) );
  INVX2 U45 ( .A(n42), .Y(n43) );
  AND2X1 U46 ( .A(n59), .B(n58), .Y(n44) );
  INVX2 U47 ( .A(n50), .Y(n55) );
  INVX2 U48 ( .A(n51), .Y(n54) );
  INVX2 U49 ( .A(n48), .Y(n47) );
  BUFX2 U50 ( .A(rw_mode), .Y(n50) );
  BUFX2 U51 ( .A(rw_mode), .Y(n51) );
  INVX2 U52 ( .A(n49), .Y(n45) );
  BUFX2 U53 ( .A(n44), .Y(n49) );
  INVX2 U54 ( .A(n49), .Y(n46) );
  BUFX2 U55 ( .A(n44), .Y(n48) );
  INVX2 U56 ( .A(n57), .Y(n56) );
  BUFX2 U57 ( .A(rw_mode), .Y(n52) );
  BUFX2 U58 ( .A(rw_mode), .Y(n53) );
  INVX2 U59 ( .A(n88), .Y(n68) );
  INVX2 U60 ( .A(n85), .Y(n69) );
  INVX2 U61 ( .A(n_rst), .Y(n57) );
  INVX2 U62 ( .A(state[1]), .Y(n59) );
  INVX2 U63 ( .A(state[0]), .Y(n58) );
  MUX2X1 U64 ( .B(n94), .A(n47), .S(cnt_c[0]), .Y(n134) );
  INVX2 U65 ( .A(cnt_c[1]), .Y(n71) );
  OAI21X1 U66 ( .A(n92), .B(n71), .C(n93), .Y(n132) );
  INVX2 U67 ( .A(cnt_c[2]), .Y(n74) );
  OAI22X1 U68 ( .A(n74), .B(n45), .C(n95), .D(n94), .Y(n133) );
  NAND2X1 U69 ( .A(state[1]), .B(n58), .Y(n88) );
  NAND2X1 U70 ( .A(state[0]), .B(n59), .Y(n85) );
  NAND3X1 U71 ( .A(cnt_c[0]), .B(cnt_c[1]), .C(cnt_c[2]), .Y(n63) );
  INVX2 U72 ( .A(enable), .Y(n62) );
  NOR2X1 U73 ( .A(n62), .B(n55), .Y(n60) );
  AOI21X1 U74 ( .A(n60), .B(n48), .C(n68), .Y(n61) );
  OAI21X1 U75 ( .A(n85), .B(n63), .C(n61), .Y(nstate[1]) );
  NOR2X1 U76 ( .A(n47), .B(n62), .Y(n65) );
  INVX2 U77 ( .A(n63), .Y(n64) );
  AOI22X1 U78 ( .A(n65), .B(n54), .C(n64), .D(n68), .Y(n66) );
  NAND2X1 U79 ( .A(n85), .B(n66), .Y(nstate[0]) );
  INVX2 U80 ( .A(read_en), .Y(n67) );
  OAI21X1 U81 ( .A(n47), .B(n67), .C(n88), .Y(n130) );
  INVX2 U82 ( .A(cnt_c[0]), .Y(n70) );
  INVX2 U83 ( .A(n94), .Y(n72) );
  INVX2 U84 ( .A(write_en), .Y(n73) );
  INVX2 U85 ( .A(aw_c[0]), .Y(n75) );
  INVX2 U86 ( .A(aw_c[1]), .Y(n76) );
  INVX2 U87 ( .A(aw_c[2]), .Y(n77) );
  INVX2 U88 ( .A(aw_c[3]), .Y(n78) );
  INVX2 U89 ( .A(aw_c[4]), .Y(n79) );
  INVX2 U90 ( .A(aw_c[5]), .Y(n80) );
  INVX2 U91 ( .A(aw_c[6]), .Y(n81) );
  INVX2 U92 ( .A(aw_c[7]), .Y(n82) );
  INVX2 U93 ( .A(aw_c[8]), .Y(n83) );
  INVX2 U94 ( .A(aw_c[9]), .Y(n84) );
  INVX2 U95 ( .A(aw_c[10]), .Y(n86) );
  INVX2 U97 ( .A(aw_c[11]), .Y(n87) );
  INVX2 U100 ( .A(aw_c[12]), .Y(n89) );
  INVX2 U103 ( .A(aw_c[13]), .Y(n90) );
  INVX2 U153 ( .A(aw_c[14]), .Y(n91) );
  INVX2 U154 ( .A(aw_c[15]), .Y(n113) );
  INVX2 U187 ( .A(ar_c[0]), .Y(n135) );
  INVX2 U188 ( .A(ar_c[1]), .Y(n136) );
  INVX2 U189 ( .A(ar_c[2]), .Y(n137) );
  INVX2 U190 ( .A(ar_c[3]), .Y(n138) );
  INVX2 U191 ( .A(ar_c[4]), .Y(n139) );
  INVX2 U192 ( .A(ar_c[5]), .Y(n140) );
  INVX2 U193 ( .A(ar_c[6]), .Y(n141) );
  INVX2 U194 ( .A(ar_c[7]), .Y(n142) );
  INVX2 U195 ( .A(ar_c[8]), .Y(n143) );
  INVX2 U196 ( .A(ar_c[9]), .Y(n144) );
  INVX2 U197 ( .A(ar_c[10]), .Y(n145) );
  INVX2 U198 ( .A(ar_c[11]), .Y(n146) );
  INVX2 U199 ( .A(ar_c[12]), .Y(n147) );
  INVX2 U200 ( .A(ar_c[13]), .Y(n148) );
  INVX2 U201 ( .A(ar_c[14]), .Y(n149) );
  INVX2 U202 ( .A(ar_c[15]), .Y(n150) );
  NAND2X1 U203 ( .A(n47), .B(n85), .Y(N121) );
  NAND2X1 U204 ( .A(n47), .B(n88), .Y(N104) );
endmodule


module sync_1 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   tmp_x;

  DFFSR tmp_x_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(tmp_x) );
  DFFSR tmp_y_reg ( .D(tmp_x), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule


module sync_0 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   tmp_x;

  DFFSR tmp_x_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(tmp_x) );
  DFFSR tmp_y_reg ( .D(tmp_x), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule


module scl_edge ( clk, n_rst, scl, rising_edge_found, falling_edge_found );
  input clk, n_rst, scl;
  output rising_edge_found, falling_edge_found;
  wire   old_sample, new_sample, n3, n4;

  DFFSR new_sample_reg ( .D(scl), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  INVX2 U5 ( .A(old_sample), .Y(n3) );
  NOR2X1 U6 ( .A(new_sample), .B(n3), .Y(falling_edge_found) );
  INVX2 U7 ( .A(new_sample), .Y(n4) );
  NOR2X1 U8 ( .A(old_sample), .B(n4), .Y(rising_edge_found) );
endmodule


module sda_sel ( tx_out, sda_mode, sda_out );
  input [1:0] sda_mode;
  input tx_out;
  output sda_out;
  wire   n1;

  NAND2X1 U3 ( .A(sda_mode[0]), .B(n1), .Y(sda_out) );
  NAND2X1 U4 ( .A(tx_out), .B(sda_mode[1]), .Y(n1) );
endmodule


module decode ( clk, n_rst, scl, sda_in, starting_byte, rw_mode, address_match, 
        stop_found, start_found );
  input [7:0] starting_byte;
  input clk, n_rst, scl, sda_in;
  output rw_mode, address_match, stop_found, start_found;
  wire   scl_pre, scl_c, scl_new, sda_pre, sda_new, sda_c, N0, N1, n7, n8, n9,
         n10, n11, n12, n13, n14, n15;
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
  NAND2X1 U9 ( .A(scl_pre), .B(scl_c), .Y(n10) );
  INVX2 U10 ( .A(sda_c), .Y(n7) );
  NAND2X1 U11 ( .A(sda_pre), .B(n7), .Y(n8) );
  NOR2X1 U12 ( .A(n10), .B(n8), .Y(N0) );
  INVX2 U13 ( .A(sda_pre), .Y(n9) );
  NAND2X1 U14 ( .A(sda_c), .B(n9), .Y(n11) );
  NOR2X1 U15 ( .A(n11), .B(n10), .Y(N1) );
  OR2X2 U16 ( .A(starting_byte[2]), .B(starting_byte[1]), .Y(n12) );
  OR2X2 U17 ( .A(starting_byte[3]), .B(n12), .Y(n15) );
  AND2X2 U18 ( .A(starting_byte[4]), .B(starting_byte[5]), .Y(n13) );
  NAND3X1 U19 ( .A(starting_byte[6]), .B(starting_byte[7]), .C(n13), .Y(n14)
         );
  NOR2X1 U20 ( .A(n15), .B(n14), .Y(address_match) );
endmodule


module flex_stp_sr_NUM_BITS8_SHIFT_MSB1 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [7:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n12, n14, n16, n18, n20, n22, n24, n26, n1, n2, n3, n4, n5, n6, n7,
         n8, n9;

  DFFSR \q_reg[0]  ( .D(n26), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  DFFSR \q_reg[1]  ( .D(n24), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \q_reg[2]  ( .D(n22), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \q_reg[3]  ( .D(n20), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \q_reg[4]  ( .D(n18), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \q_reg[5]  ( .D(n16), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \q_reg[6]  ( .D(n14), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \q_reg[7]  ( .D(n12), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  MUX2X1 U2 ( .B(parallel_out[0]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(n26) );
  INVX2 U4 ( .A(parallel_out[1]), .Y(n3) );
  INVX2 U5 ( .A(parallel_out[0]), .Y(n2) );
  MUX2X1 U6 ( .B(n3), .A(n2), .S(shift_enable), .Y(n24) );
  INVX2 U7 ( .A(parallel_out[2]), .Y(n4) );
  MUX2X1 U8 ( .B(n4), .A(n3), .S(shift_enable), .Y(n22) );
  INVX2 U9 ( .A(parallel_out[3]), .Y(n5) );
  MUX2X1 U10 ( .B(n5), .A(n4), .S(shift_enable), .Y(n20) );
  INVX2 U11 ( .A(parallel_out[4]), .Y(n6) );
  MUX2X1 U12 ( .B(n6), .A(n5), .S(shift_enable), .Y(n18) );
  INVX2 U13 ( .A(parallel_out[5]), .Y(n7) );
  MUX2X1 U14 ( .B(n7), .A(n6), .S(shift_enable), .Y(n16) );
  INVX2 U15 ( .A(parallel_out[6]), .Y(n8) );
  MUX2X1 U16 ( .B(n8), .A(n7), .S(shift_enable), .Y(n14) );
  INVX2 U17 ( .A(parallel_out[7]), .Y(n9) );
  MUX2X1 U18 ( .B(n9), .A(n8), .S(shift_enable), .Y(n12) );
endmodule


module rx_sr ( clk, n_rst, sda_in, rising_edge_found, rx_enable, rx_data, 
        rx_w_data );
  output [7:0] rx_data;
  output [7:0] rx_w_data;
  input clk, n_rst, sda_in, rising_edge_found, rx_enable;
  wire   _0_net_;
  assign rx_w_data[7] = rx_data[7];
  assign rx_w_data[6] = rx_data[6];
  assign rx_w_data[5] = rx_data[5];
  assign rx_w_data[4] = rx_data[4];
  assign rx_w_data[3] = rx_data[3];
  assign rx_w_data[2] = rx_data[2];
  assign rx_w_data[1] = rx_data[1];
  assign rx_w_data[0] = rx_data[0];

  flex_stp_sr_NUM_BITS8_SHIFT_MSB1 COREc ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(_0_net_), .serial_in(sda_in), .parallel_out(rx_data) );
  AND2X2 U1 ( .A(rx_enable), .B(rising_edge_found), .Y(_0_net_) );
endmodule


module flex_pts_sr_NUM_BITS64_SHIFT_MSB1 ( clk, n_rst, shift_enable, 
        load_enable, parallel_in, serial_out );
  input [63:0] parallel_in;
  input clk, n_rst, shift_enable, load_enable;
  output serial_out;
  wire   n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345;
  wire   [62:0] q;

  DFFSR \q_reg[0]  ( .D(n259), .CLK(clk), .R(1'b1), .S(n87), .Q(q[0]) );
  DFFSR \q_reg[1]  ( .D(n258), .CLK(clk), .R(1'b1), .S(n87), .Q(q[1]) );
  DFFSR \q_reg[2]  ( .D(n257), .CLK(clk), .R(1'b1), .S(n87), .Q(q[2]) );
  DFFSR \q_reg[3]  ( .D(n256), .CLK(clk), .R(1'b1), .S(n87), .Q(q[3]) );
  DFFSR \q_reg[4]  ( .D(n255), .CLK(clk), .R(1'b1), .S(n86), .Q(q[4]) );
  DFFSR \q_reg[5]  ( .D(n254), .CLK(clk), .R(1'b1), .S(n86), .Q(q[5]) );
  DFFSR \q_reg[6]  ( .D(n253), .CLK(clk), .R(1'b1), .S(n86), .Q(q[6]) );
  DFFSR \q_reg[7]  ( .D(n252), .CLK(clk), .R(1'b1), .S(n86), .Q(q[7]) );
  DFFSR \q_reg[8]  ( .D(n251), .CLK(clk), .R(1'b1), .S(n86), .Q(q[8]) );
  DFFSR \q_reg[9]  ( .D(n250), .CLK(clk), .R(1'b1), .S(n86), .Q(q[9]) );
  DFFSR \q_reg[10]  ( .D(n249), .CLK(clk), .R(1'b1), .S(n86), .Q(q[10]) );
  DFFSR \q_reg[11]  ( .D(n248), .CLK(clk), .R(1'b1), .S(n86), .Q(q[11]) );
  DFFSR \q_reg[12]  ( .D(n247), .CLK(clk), .R(1'b1), .S(n86), .Q(q[12]) );
  DFFSR \q_reg[13]  ( .D(n246), .CLK(clk), .R(1'b1), .S(n86), .Q(q[13]) );
  DFFSR \q_reg[14]  ( .D(n245), .CLK(clk), .R(1'b1), .S(n86), .Q(q[14]) );
  DFFSR \q_reg[15]  ( .D(n244), .CLK(clk), .R(1'b1), .S(n86), .Q(q[15]) );
  DFFSR \q_reg[16]  ( .D(n243), .CLK(clk), .R(1'b1), .S(n85), .Q(q[16]) );
  DFFSR \q_reg[17]  ( .D(n242), .CLK(clk), .R(1'b1), .S(n85), .Q(q[17]) );
  DFFSR \q_reg[18]  ( .D(n241), .CLK(clk), .R(1'b1), .S(n85), .Q(q[18]) );
  DFFSR \q_reg[19]  ( .D(n240), .CLK(clk), .R(1'b1), .S(n85), .Q(q[19]) );
  DFFSR \q_reg[20]  ( .D(n239), .CLK(clk), .R(1'b1), .S(n85), .Q(q[20]) );
  DFFSR \q_reg[21]  ( .D(n238), .CLK(clk), .R(1'b1), .S(n85), .Q(q[21]) );
  DFFSR \q_reg[22]  ( .D(n237), .CLK(clk), .R(1'b1), .S(n85), .Q(q[22]) );
  DFFSR \q_reg[23]  ( .D(n236), .CLK(clk), .R(1'b1), .S(n85), .Q(q[23]) );
  DFFSR \q_reg[24]  ( .D(n235), .CLK(clk), .R(1'b1), .S(n85), .Q(q[24]) );
  DFFSR \q_reg[25]  ( .D(n234), .CLK(clk), .R(1'b1), .S(n85), .Q(q[25]) );
  DFFSR \q_reg[26]  ( .D(n233), .CLK(clk), .R(1'b1), .S(n85), .Q(q[26]) );
  DFFSR \q_reg[27]  ( .D(n232), .CLK(clk), .R(1'b1), .S(n85), .Q(q[27]) );
  DFFSR \q_reg[28]  ( .D(n231), .CLK(clk), .R(1'b1), .S(n84), .Q(q[28]) );
  DFFSR \q_reg[29]  ( .D(n230), .CLK(clk), .R(1'b1), .S(n84), .Q(q[29]) );
  DFFSR \q_reg[30]  ( .D(n229), .CLK(clk), .R(1'b1), .S(n84), .Q(q[30]) );
  DFFSR \q_reg[31]  ( .D(n228), .CLK(clk), .R(1'b1), .S(n84), .Q(q[31]) );
  DFFSR \q_reg[32]  ( .D(n227), .CLK(clk), .R(1'b1), .S(n84), .Q(q[32]) );
  DFFSR \q_reg[33]  ( .D(n226), .CLK(clk), .R(1'b1), .S(n84), .Q(q[33]) );
  DFFSR \q_reg[34]  ( .D(n225), .CLK(clk), .R(1'b1), .S(n84), .Q(q[34]) );
  DFFSR \q_reg[35]  ( .D(n224), .CLK(clk), .R(1'b1), .S(n84), .Q(q[35]) );
  DFFSR \q_reg[36]  ( .D(n223), .CLK(clk), .R(1'b1), .S(n84), .Q(q[36]) );
  DFFSR \q_reg[37]  ( .D(n222), .CLK(clk), .R(1'b1), .S(n84), .Q(q[37]) );
  DFFSR \q_reg[38]  ( .D(n221), .CLK(clk), .R(1'b1), .S(n84), .Q(q[38]) );
  DFFSR \q_reg[39]  ( .D(n220), .CLK(clk), .R(1'b1), .S(n84), .Q(q[39]) );
  DFFSR \q_reg[40]  ( .D(n219), .CLK(clk), .R(1'b1), .S(n83), .Q(q[40]) );
  DFFSR \q_reg[41]  ( .D(n218), .CLK(clk), .R(1'b1), .S(n83), .Q(q[41]) );
  DFFSR \q_reg[42]  ( .D(n217), .CLK(clk), .R(1'b1), .S(n83), .Q(q[42]) );
  DFFSR \q_reg[43]  ( .D(n216), .CLK(clk), .R(1'b1), .S(n83), .Q(q[43]) );
  DFFSR \q_reg[44]  ( .D(n215), .CLK(clk), .R(1'b1), .S(n83), .Q(q[44]) );
  DFFSR \q_reg[45]  ( .D(n214), .CLK(clk), .R(1'b1), .S(n83), .Q(q[45]) );
  DFFSR \q_reg[46]  ( .D(n213), .CLK(clk), .R(1'b1), .S(n83), .Q(q[46]) );
  DFFSR \q_reg[47]  ( .D(n212), .CLK(clk), .R(1'b1), .S(n83), .Q(q[47]) );
  DFFSR \q_reg[48]  ( .D(n211), .CLK(clk), .R(1'b1), .S(n83), .Q(q[48]) );
  DFFSR \q_reg[49]  ( .D(n210), .CLK(clk), .R(1'b1), .S(n83), .Q(q[49]) );
  DFFSR \q_reg[50]  ( .D(n209), .CLK(clk), .R(1'b1), .S(n83), .Q(q[50]) );
  DFFSR \q_reg[51]  ( .D(n208), .CLK(clk), .R(1'b1), .S(n83), .Q(q[51]) );
  DFFSR \q_reg[52]  ( .D(n207), .CLK(clk), .R(1'b1), .S(n82), .Q(q[52]) );
  DFFSR \q_reg[53]  ( .D(n206), .CLK(clk), .R(1'b1), .S(n82), .Q(q[53]) );
  DFFSR \q_reg[54]  ( .D(n205), .CLK(clk), .R(1'b1), .S(n82), .Q(q[54]) );
  DFFSR \q_reg[55]  ( .D(n204), .CLK(clk), .R(1'b1), .S(n82), .Q(q[55]) );
  DFFSR \q_reg[56]  ( .D(n203), .CLK(clk), .R(1'b1), .S(n82), .Q(q[56]) );
  DFFSR \q_reg[57]  ( .D(n202), .CLK(clk), .R(1'b1), .S(n82), .Q(q[57]) );
  DFFSR \q_reg[58]  ( .D(n201), .CLK(clk), .R(1'b1), .S(n82), .Q(q[58]) );
  DFFSR \q_reg[59]  ( .D(n200), .CLK(clk), .R(1'b1), .S(n82), .Q(q[59]) );
  DFFSR \q_reg[60]  ( .D(n199), .CLK(clk), .R(1'b1), .S(n82), .Q(q[60]) );
  DFFSR \q_reg[61]  ( .D(n198), .CLK(clk), .R(1'b1), .S(n82), .Q(q[61]) );
  DFFSR \q_reg[62]  ( .D(n197), .CLK(clk), .R(1'b1), .S(n82), .Q(q[62]) );
  DFFSR \q_reg[63]  ( .D(n196), .CLK(clk), .R(1'b1), .S(n82), .Q(serial_out)
         );
  INVX4 U67 ( .A(n81), .Y(n76) );
  INVX1 U68 ( .A(n81), .Y(n79) );
  INVX1 U69 ( .A(n75), .Y(n78) );
  INVX1 U70 ( .A(n81), .Y(n77) );
  INVX1 U71 ( .A(n75), .Y(n80) );
  BUFX2 U72 ( .A(n341), .Y(n69) );
  BUFX2 U73 ( .A(n341), .Y(n68) );
  BUFX2 U74 ( .A(n341), .Y(n67) );
  BUFX2 U75 ( .A(n341), .Y(n66) );
  BUFX2 U76 ( .A(n341), .Y(n65) );
  BUFX2 U77 ( .A(n341), .Y(n70) );
  BUFX2 U78 ( .A(n342), .Y(n72) );
  BUFX2 U79 ( .A(n342), .Y(n73) );
  INVX2 U80 ( .A(load_enable), .Y(n81) );
  BUFX2 U81 ( .A(n342), .Y(n74) );
  INVX2 U82 ( .A(load_enable), .Y(n75) );
  BUFX2 U83 ( .A(n_rst), .Y(n82) );
  BUFX2 U84 ( .A(n_rst), .Y(n83) );
  BUFX2 U85 ( .A(n_rst), .Y(n84) );
  BUFX2 U86 ( .A(n_rst), .Y(n85) );
  BUFX2 U87 ( .A(n_rst), .Y(n86) );
  BUFX2 U88 ( .A(n_rst), .Y(n87) );
  BUFX4 U89 ( .A(n342), .Y(n71) );
  OR2X2 U90 ( .A(shift_enable), .B(n76), .Y(n88) );
  NAND2X1 U91 ( .A(n88), .B(n75), .Y(n90) );
  INVX2 U92 ( .A(n88), .Y(n342) );
  MUX2X1 U93 ( .B(parallel_in[0]), .A(q[0]), .S(n71), .Y(n89) );
  NAND2X1 U94 ( .A(n90), .B(n89), .Y(n259) );
  INVX2 U95 ( .A(n90), .Y(n341) );
  NAND2X1 U96 ( .A(q[0]), .B(n65), .Y(n93) );
  NAND2X1 U97 ( .A(q[1]), .B(n71), .Y(n92) );
  NAND2X1 U98 ( .A(parallel_in[1]), .B(n76), .Y(n91) );
  NAND3X1 U99 ( .A(n93), .B(n92), .C(n91), .Y(n258) );
  NAND2X1 U100 ( .A(q[1]), .B(n65), .Y(n96) );
  NAND2X1 U101 ( .A(q[2]), .B(n74), .Y(n95) );
  NAND2X1 U102 ( .A(parallel_in[2]), .B(n76), .Y(n94) );
  NAND3X1 U103 ( .A(n96), .B(n95), .C(n94), .Y(n257) );
  NAND2X1 U104 ( .A(q[2]), .B(n65), .Y(n99) );
  NAND2X1 U105 ( .A(q[3]), .B(n73), .Y(n98) );
  NAND2X1 U106 ( .A(parallel_in[3]), .B(n76), .Y(n97) );
  NAND3X1 U107 ( .A(n99), .B(n98), .C(n97), .Y(n256) );
  NAND2X1 U108 ( .A(q[3]), .B(n65), .Y(n102) );
  NAND2X1 U109 ( .A(q[4]), .B(n73), .Y(n101) );
  NAND2X1 U110 ( .A(parallel_in[4]), .B(n76), .Y(n100) );
  NAND3X1 U111 ( .A(n102), .B(n101), .C(n100), .Y(n255) );
  NAND2X1 U112 ( .A(q[4]), .B(n65), .Y(n105) );
  NAND2X1 U113 ( .A(q[5]), .B(n73), .Y(n104) );
  NAND2X1 U114 ( .A(parallel_in[5]), .B(n76), .Y(n103) );
  NAND3X1 U115 ( .A(n105), .B(n104), .C(n103), .Y(n254) );
  NAND2X1 U116 ( .A(q[5]), .B(n65), .Y(n108) );
  NAND2X1 U117 ( .A(q[6]), .B(n73), .Y(n107) );
  NAND2X1 U118 ( .A(parallel_in[6]), .B(n76), .Y(n106) );
  NAND3X1 U119 ( .A(n108), .B(n107), .C(n106), .Y(n253) );
  NAND2X1 U120 ( .A(q[6]), .B(n65), .Y(n111) );
  NAND2X1 U121 ( .A(q[7]), .B(n73), .Y(n110) );
  NAND2X1 U122 ( .A(parallel_in[7]), .B(n76), .Y(n109) );
  NAND3X1 U123 ( .A(n111), .B(n110), .C(n109), .Y(n252) );
  NAND2X1 U124 ( .A(q[7]), .B(n65), .Y(n114) );
  NAND2X1 U125 ( .A(q[8]), .B(n73), .Y(n113) );
  NAND2X1 U126 ( .A(parallel_in[8]), .B(n76), .Y(n112) );
  NAND3X1 U127 ( .A(n114), .B(n113), .C(n112), .Y(n251) );
  NAND2X1 U128 ( .A(q[8]), .B(n65), .Y(n117) );
  NAND2X1 U129 ( .A(q[9]), .B(n73), .Y(n116) );
  NAND2X1 U130 ( .A(parallel_in[9]), .B(n76), .Y(n115) );
  NAND3X1 U131 ( .A(n117), .B(n116), .C(n115), .Y(n250) );
  NAND2X1 U132 ( .A(q[9]), .B(n65), .Y(n120) );
  NAND2X1 U133 ( .A(q[10]), .B(n73), .Y(n119) );
  NAND2X1 U134 ( .A(parallel_in[10]), .B(n76), .Y(n118) );
  NAND3X1 U135 ( .A(n120), .B(n119), .C(n118), .Y(n249) );
  NAND2X1 U136 ( .A(q[10]), .B(n65), .Y(n123) );
  NAND2X1 U137 ( .A(q[11]), .B(n73), .Y(n122) );
  NAND2X1 U138 ( .A(parallel_in[11]), .B(n76), .Y(n121) );
  NAND3X1 U139 ( .A(n123), .B(n122), .C(n121), .Y(n248) );
  NAND2X1 U140 ( .A(q[11]), .B(n65), .Y(n126) );
  NAND2X1 U141 ( .A(q[12]), .B(n73), .Y(n125) );
  NAND2X1 U142 ( .A(parallel_in[12]), .B(n76), .Y(n124) );
  NAND3X1 U143 ( .A(n126), .B(n125), .C(n124), .Y(n247) );
  NAND2X1 U144 ( .A(q[12]), .B(n66), .Y(n129) );
  NAND2X1 U145 ( .A(q[13]), .B(n73), .Y(n128) );
  NAND2X1 U146 ( .A(parallel_in[13]), .B(n76), .Y(n127) );
  NAND3X1 U147 ( .A(n129), .B(n128), .C(n127), .Y(n246) );
  NAND2X1 U148 ( .A(q[13]), .B(n66), .Y(n132) );
  NAND2X1 U149 ( .A(q[14]), .B(n73), .Y(n131) );
  NAND2X1 U150 ( .A(parallel_in[14]), .B(n76), .Y(n130) );
  NAND3X1 U151 ( .A(n132), .B(n131), .C(n130), .Y(n245) );
  NAND2X1 U152 ( .A(q[14]), .B(n66), .Y(n135) );
  NAND2X1 U153 ( .A(q[15]), .B(n73), .Y(n134) );
  NAND2X1 U154 ( .A(parallel_in[15]), .B(n77), .Y(n133) );
  NAND3X1 U155 ( .A(n135), .B(n134), .C(n133), .Y(n244) );
  NAND2X1 U156 ( .A(q[15]), .B(n66), .Y(n138) );
  NAND2X1 U157 ( .A(q[16]), .B(n73), .Y(n137) );
  NAND2X1 U158 ( .A(parallel_in[16]), .B(n77), .Y(n136) );
  NAND3X1 U159 ( .A(n138), .B(n137), .C(n136), .Y(n243) );
  NAND2X1 U160 ( .A(q[16]), .B(n66), .Y(n141) );
  NAND2X1 U161 ( .A(q[17]), .B(n73), .Y(n140) );
  NAND2X1 U162 ( .A(parallel_in[17]), .B(n77), .Y(n139) );
  NAND3X1 U163 ( .A(n141), .B(n140), .C(n139), .Y(n242) );
  NAND2X1 U164 ( .A(q[17]), .B(n66), .Y(n144) );
  NAND2X1 U165 ( .A(q[18]), .B(n73), .Y(n143) );
  NAND2X1 U166 ( .A(parallel_in[18]), .B(n77), .Y(n142) );
  NAND3X1 U167 ( .A(n144), .B(n143), .C(n142), .Y(n241) );
  NAND2X1 U168 ( .A(q[18]), .B(n66), .Y(n147) );
  NAND2X1 U169 ( .A(q[19]), .B(n73), .Y(n146) );
  NAND2X1 U170 ( .A(parallel_in[19]), .B(n77), .Y(n145) );
  NAND3X1 U171 ( .A(n147), .B(n146), .C(n145), .Y(n240) );
  NAND2X1 U172 ( .A(q[19]), .B(n66), .Y(n150) );
  NAND2X1 U173 ( .A(q[20]), .B(n73), .Y(n149) );
  NAND2X1 U174 ( .A(parallel_in[20]), .B(n77), .Y(n148) );
  NAND3X1 U175 ( .A(n150), .B(n149), .C(n148), .Y(n239) );
  NAND2X1 U176 ( .A(q[20]), .B(n66), .Y(n153) );
  NAND2X1 U177 ( .A(q[21]), .B(n73), .Y(n152) );
  NAND2X1 U178 ( .A(parallel_in[21]), .B(n77), .Y(n151) );
  NAND3X1 U179 ( .A(n153), .B(n152), .C(n151), .Y(n238) );
  NAND2X1 U180 ( .A(q[21]), .B(n66), .Y(n156) );
  NAND2X1 U181 ( .A(q[22]), .B(n73), .Y(n155) );
  NAND2X1 U182 ( .A(parallel_in[22]), .B(n77), .Y(n154) );
  NAND3X1 U183 ( .A(n156), .B(n155), .C(n154), .Y(n237) );
  NAND2X1 U184 ( .A(q[22]), .B(n66), .Y(n159) );
  NAND2X1 U185 ( .A(q[23]), .B(n73), .Y(n158) );
  NAND2X1 U186 ( .A(parallel_in[23]), .B(n77), .Y(n157) );
  NAND3X1 U187 ( .A(n159), .B(n158), .C(n157), .Y(n236) );
  NAND2X1 U188 ( .A(q[23]), .B(n66), .Y(n162) );
  NAND2X1 U189 ( .A(q[24]), .B(n72), .Y(n161) );
  NAND2X1 U190 ( .A(parallel_in[24]), .B(n77), .Y(n160) );
  NAND3X1 U191 ( .A(n162), .B(n161), .C(n160), .Y(n235) );
  NAND2X1 U192 ( .A(q[24]), .B(n67), .Y(n165) );
  NAND2X1 U193 ( .A(q[25]), .B(n72), .Y(n164) );
  NAND2X1 U194 ( .A(parallel_in[25]), .B(n77), .Y(n163) );
  NAND3X1 U195 ( .A(n165), .B(n164), .C(n163), .Y(n234) );
  NAND2X1 U196 ( .A(q[25]), .B(n67), .Y(n168) );
  NAND2X1 U197 ( .A(q[26]), .B(n72), .Y(n167) );
  NAND2X1 U198 ( .A(parallel_in[26]), .B(n77), .Y(n166) );
  NAND3X1 U199 ( .A(n168), .B(n167), .C(n166), .Y(n233) );
  NAND2X1 U200 ( .A(q[26]), .B(n67), .Y(n171) );
  NAND2X1 U201 ( .A(q[27]), .B(n72), .Y(n170) );
  NAND2X1 U202 ( .A(parallel_in[27]), .B(n77), .Y(n169) );
  NAND3X1 U203 ( .A(n171), .B(n170), .C(n169), .Y(n232) );
  NAND2X1 U204 ( .A(q[27]), .B(n67), .Y(n174) );
  NAND2X1 U205 ( .A(q[28]), .B(n72), .Y(n173) );
  NAND2X1 U206 ( .A(parallel_in[28]), .B(n77), .Y(n172) );
  NAND3X1 U207 ( .A(n174), .B(n173), .C(n172), .Y(n231) );
  NAND2X1 U208 ( .A(q[28]), .B(n67), .Y(n177) );
  NAND2X1 U209 ( .A(q[29]), .B(n72), .Y(n176) );
  NAND2X1 U210 ( .A(parallel_in[29]), .B(n77), .Y(n175) );
  NAND3X1 U211 ( .A(n177), .B(n176), .C(n175), .Y(n230) );
  NAND2X1 U212 ( .A(q[29]), .B(n67), .Y(n180) );
  NAND2X1 U213 ( .A(q[30]), .B(n72), .Y(n179) );
  NAND2X1 U214 ( .A(parallel_in[30]), .B(n78), .Y(n178) );
  NAND3X1 U215 ( .A(n180), .B(n179), .C(n178), .Y(n229) );
  NAND2X1 U216 ( .A(q[30]), .B(n67), .Y(n183) );
  NAND2X1 U217 ( .A(q[31]), .B(n72), .Y(n182) );
  NAND2X1 U218 ( .A(parallel_in[31]), .B(n78), .Y(n181) );
  NAND3X1 U219 ( .A(n183), .B(n182), .C(n181), .Y(n228) );
  NAND2X1 U220 ( .A(q[31]), .B(n67), .Y(n186) );
  NAND2X1 U221 ( .A(q[32]), .B(n72), .Y(n185) );
  NAND2X1 U222 ( .A(parallel_in[32]), .B(n78), .Y(n184) );
  NAND3X1 U223 ( .A(n186), .B(n185), .C(n184), .Y(n227) );
  NAND2X1 U224 ( .A(q[32]), .B(n67), .Y(n189) );
  NAND2X1 U225 ( .A(q[33]), .B(n72), .Y(n188) );
  NAND2X1 U226 ( .A(parallel_in[33]), .B(n78), .Y(n187) );
  NAND3X1 U227 ( .A(n189), .B(n188), .C(n187), .Y(n226) );
  NAND2X1 U228 ( .A(q[33]), .B(n67), .Y(n192) );
  NAND2X1 U229 ( .A(q[34]), .B(n72), .Y(n191) );
  NAND2X1 U230 ( .A(parallel_in[34]), .B(n78), .Y(n190) );
  NAND3X1 U231 ( .A(n192), .B(n191), .C(n190), .Y(n225) );
  NAND2X1 U232 ( .A(q[34]), .B(n67), .Y(n195) );
  NAND2X1 U233 ( .A(q[35]), .B(n72), .Y(n194) );
  NAND2X1 U234 ( .A(parallel_in[35]), .B(n78), .Y(n193) );
  NAND3X1 U235 ( .A(n195), .B(n194), .C(n193), .Y(n224) );
  NAND2X1 U236 ( .A(q[35]), .B(n67), .Y(n262) );
  NAND2X1 U237 ( .A(q[36]), .B(n72), .Y(n261) );
  NAND2X1 U238 ( .A(parallel_in[36]), .B(n78), .Y(n260) );
  NAND3X1 U239 ( .A(n262), .B(n261), .C(n260), .Y(n223) );
  NAND2X1 U240 ( .A(q[36]), .B(n68), .Y(n265) );
  NAND2X1 U241 ( .A(q[37]), .B(n72), .Y(n264) );
  NAND2X1 U242 ( .A(parallel_in[37]), .B(n78), .Y(n263) );
  NAND3X1 U243 ( .A(n265), .B(n264), .C(n263), .Y(n222) );
  NAND2X1 U244 ( .A(q[37]), .B(n68), .Y(n268) );
  NAND2X1 U245 ( .A(q[38]), .B(n72), .Y(n267) );
  NAND2X1 U246 ( .A(parallel_in[38]), .B(n78), .Y(n266) );
  NAND3X1 U247 ( .A(n268), .B(n267), .C(n266), .Y(n221) );
  NAND2X1 U248 ( .A(q[38]), .B(n68), .Y(n271) );
  NAND2X1 U249 ( .A(q[39]), .B(n72), .Y(n270) );
  NAND2X1 U250 ( .A(parallel_in[39]), .B(n78), .Y(n269) );
  NAND3X1 U251 ( .A(n271), .B(n270), .C(n269), .Y(n220) );
  NAND2X1 U252 ( .A(q[39]), .B(n68), .Y(n274) );
  NAND2X1 U253 ( .A(q[40]), .B(n72), .Y(n273) );
  NAND2X1 U254 ( .A(parallel_in[40]), .B(n78), .Y(n272) );
  NAND3X1 U255 ( .A(n274), .B(n273), .C(n272), .Y(n219) );
  NAND2X1 U256 ( .A(q[40]), .B(n68), .Y(n277) );
  NAND2X1 U257 ( .A(q[41]), .B(n72), .Y(n276) );
  NAND2X1 U258 ( .A(parallel_in[41]), .B(n78), .Y(n275) );
  NAND3X1 U259 ( .A(n277), .B(n276), .C(n275), .Y(n218) );
  NAND2X1 U260 ( .A(q[41]), .B(n68), .Y(n280) );
  NAND2X1 U261 ( .A(q[42]), .B(n72), .Y(n279) );
  NAND2X1 U262 ( .A(parallel_in[42]), .B(n78), .Y(n278) );
  NAND3X1 U263 ( .A(n280), .B(n279), .C(n278), .Y(n217) );
  NAND2X1 U264 ( .A(q[42]), .B(n68), .Y(n283) );
  NAND2X1 U265 ( .A(q[43]), .B(n72), .Y(n282) );
  NAND2X1 U266 ( .A(parallel_in[43]), .B(n78), .Y(n281) );
  NAND3X1 U267 ( .A(n283), .B(n282), .C(n281), .Y(n216) );
  NAND2X1 U268 ( .A(q[43]), .B(n68), .Y(n286) );
  NAND2X1 U269 ( .A(q[44]), .B(n71), .Y(n285) );
  NAND2X1 U270 ( .A(parallel_in[44]), .B(n78), .Y(n284) );
  NAND3X1 U271 ( .A(n286), .B(n285), .C(n284), .Y(n215) );
  NAND2X1 U272 ( .A(q[44]), .B(n68), .Y(n289) );
  NAND2X1 U273 ( .A(q[45]), .B(n71), .Y(n288) );
  NAND2X1 U274 ( .A(parallel_in[45]), .B(n79), .Y(n287) );
  NAND3X1 U275 ( .A(n289), .B(n288), .C(n287), .Y(n214) );
  NAND2X1 U276 ( .A(q[45]), .B(n68), .Y(n292) );
  NAND2X1 U277 ( .A(q[46]), .B(n71), .Y(n291) );
  NAND2X1 U278 ( .A(parallel_in[46]), .B(n79), .Y(n290) );
  NAND3X1 U279 ( .A(n292), .B(n291), .C(n290), .Y(n213) );
  NAND2X1 U280 ( .A(q[46]), .B(n68), .Y(n295) );
  NAND2X1 U281 ( .A(q[47]), .B(n71), .Y(n294) );
  NAND2X1 U282 ( .A(parallel_in[47]), .B(n79), .Y(n293) );
  NAND3X1 U283 ( .A(n295), .B(n294), .C(n293), .Y(n212) );
  NAND2X1 U284 ( .A(q[47]), .B(n68), .Y(n298) );
  NAND2X1 U285 ( .A(q[48]), .B(n71), .Y(n297) );
  NAND2X1 U286 ( .A(parallel_in[48]), .B(n79), .Y(n296) );
  NAND3X1 U287 ( .A(n298), .B(n297), .C(n296), .Y(n211) );
  NAND2X1 U288 ( .A(q[48]), .B(n69), .Y(n301) );
  NAND2X1 U289 ( .A(q[49]), .B(n71), .Y(n300) );
  NAND2X1 U290 ( .A(parallel_in[49]), .B(n79), .Y(n299) );
  NAND3X1 U291 ( .A(n301), .B(n300), .C(n299), .Y(n210) );
  NAND2X1 U292 ( .A(q[49]), .B(n69), .Y(n304) );
  NAND2X1 U293 ( .A(q[50]), .B(n71), .Y(n303) );
  NAND2X1 U294 ( .A(parallel_in[50]), .B(n79), .Y(n302) );
  NAND3X1 U295 ( .A(n304), .B(n303), .C(n302), .Y(n209) );
  NAND2X1 U296 ( .A(q[50]), .B(n69), .Y(n307) );
  NAND2X1 U297 ( .A(q[51]), .B(n71), .Y(n306) );
  NAND2X1 U298 ( .A(parallel_in[51]), .B(n79), .Y(n305) );
  NAND3X1 U299 ( .A(n307), .B(n306), .C(n305), .Y(n208) );
  NAND2X1 U300 ( .A(q[51]), .B(n69), .Y(n310) );
  NAND2X1 U301 ( .A(q[52]), .B(n71), .Y(n309) );
  NAND2X1 U302 ( .A(parallel_in[52]), .B(n79), .Y(n308) );
  NAND3X1 U303 ( .A(n310), .B(n309), .C(n308), .Y(n207) );
  NAND2X1 U304 ( .A(q[52]), .B(n69), .Y(n313) );
  NAND2X1 U305 ( .A(q[53]), .B(n71), .Y(n312) );
  NAND2X1 U306 ( .A(parallel_in[53]), .B(n79), .Y(n311) );
  NAND3X1 U307 ( .A(n313), .B(n312), .C(n311), .Y(n206) );
  NAND2X1 U308 ( .A(q[53]), .B(n69), .Y(n316) );
  NAND2X1 U309 ( .A(q[54]), .B(n71), .Y(n315) );
  NAND2X1 U310 ( .A(parallel_in[54]), .B(n79), .Y(n314) );
  NAND3X1 U311 ( .A(n316), .B(n315), .C(n314), .Y(n205) );
  NAND2X1 U312 ( .A(q[54]), .B(n69), .Y(n319) );
  NAND2X1 U313 ( .A(q[55]), .B(n71), .Y(n318) );
  NAND2X1 U314 ( .A(parallel_in[55]), .B(n79), .Y(n317) );
  NAND3X1 U315 ( .A(n319), .B(n318), .C(n317), .Y(n204) );
  NAND2X1 U316 ( .A(q[55]), .B(n69), .Y(n322) );
  NAND2X1 U317 ( .A(q[56]), .B(n71), .Y(n321) );
  NAND2X1 U318 ( .A(parallel_in[56]), .B(n79), .Y(n320) );
  NAND3X1 U319 ( .A(n322), .B(n321), .C(n320), .Y(n203) );
  NAND2X1 U320 ( .A(q[56]), .B(n69), .Y(n325) );
  NAND2X1 U321 ( .A(q[57]), .B(n71), .Y(n324) );
  NAND2X1 U322 ( .A(parallel_in[57]), .B(n79), .Y(n323) );
  NAND3X1 U323 ( .A(n325), .B(n324), .C(n323), .Y(n202) );
  NAND2X1 U324 ( .A(q[57]), .B(n69), .Y(n328) );
  NAND2X1 U325 ( .A(q[58]), .B(n71), .Y(n327) );
  NAND2X1 U326 ( .A(parallel_in[58]), .B(n79), .Y(n326) );
  NAND3X1 U327 ( .A(n328), .B(n327), .C(n326), .Y(n201) );
  NAND2X1 U328 ( .A(q[58]), .B(n69), .Y(n331) );
  NAND2X1 U329 ( .A(q[59]), .B(n71), .Y(n330) );
  NAND2X1 U330 ( .A(parallel_in[59]), .B(n79), .Y(n329) );
  NAND3X1 U331 ( .A(n331), .B(n330), .C(n329), .Y(n200) );
  NAND2X1 U332 ( .A(q[59]), .B(n69), .Y(n334) );
  NAND2X1 U333 ( .A(q[60]), .B(n71), .Y(n333) );
  NAND2X1 U334 ( .A(parallel_in[60]), .B(n80), .Y(n332) );
  NAND3X1 U335 ( .A(n334), .B(n333), .C(n332), .Y(n199) );
  NAND2X1 U336 ( .A(q[60]), .B(n70), .Y(n337) );
  NAND2X1 U337 ( .A(q[61]), .B(n71), .Y(n336) );
  NAND2X1 U338 ( .A(parallel_in[61]), .B(n80), .Y(n335) );
  NAND3X1 U339 ( .A(n337), .B(n336), .C(n335), .Y(n198) );
  NAND2X1 U340 ( .A(q[61]), .B(n70), .Y(n340) );
  NAND2X1 U341 ( .A(n74), .B(q[62]), .Y(n339) );
  NAND2X1 U342 ( .A(parallel_in[62]), .B(n80), .Y(n338) );
  NAND3X1 U343 ( .A(n340), .B(n339), .C(n338), .Y(n197) );
  NAND2X1 U344 ( .A(q[62]), .B(n70), .Y(n345) );
  NAND2X1 U345 ( .A(serial_out), .B(n72), .Y(n344) );
  NAND2X1 U346 ( .A(parallel_in[63]), .B(n80), .Y(n343) );
  NAND3X1 U347 ( .A(n345), .B(n344), .C(n343), .Y(n196) );
endmodule


module tx_sr ( clk, n_rst, load_data, falling_edge_found, tx_enable, tx_data, 
        tx_out );
  input [63:0] tx_data;
  input clk, n_rst, load_data, falling_edge_found, tx_enable;
  output tx_out;
  wire   _0_net_;

  flex_pts_sr_NUM_BITS64_SHIFT_MSB1 COREd ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(_0_net_), .load_enable(load_data), .parallel_in(tx_data), 
        .serial_out(tx_out) );
  AND2X2 U1 ( .A(tx_enable), .B(falling_edge_found), .Y(_0_net_) );
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
         n40, n41, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62;

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
  AND2X1 U4 ( .A(count_out[0]), .B(n58), .Y(n2) );
  AND2X1 U5 ( .A(count_out[2]), .B(n58), .Y(n3) );
  INVX2 U6 ( .A(count_out[1]), .Y(n19) );
  INVX2 U7 ( .A(clear), .Y(n15) );
  INVX2 U8 ( .A(count_enable), .Y(n4) );
  NAND2X1 U9 ( .A(n15), .B(n4), .Y(n30) );
  INVX2 U10 ( .A(rollover_val[3]), .Y(n13) );
  INVX2 U11 ( .A(count_out[3]), .Y(n29) );
  INVX2 U12 ( .A(count_out[2]), .Y(n37) );
  NAND2X1 U13 ( .A(rollover_val[2]), .B(n37), .Y(n10) );
  INVX2 U14 ( .A(rollover_val[1]), .Y(n5) );
  OAI21X1 U15 ( .A(count_out[1]), .B(n5), .C(count_out[0]), .Y(n7) );
  INVX2 U16 ( .A(rollover_val[0]), .Y(n6) );
  NAND2X1 U17 ( .A(n6), .B(n5), .Y(n33) );
  AND2X2 U18 ( .A(n7), .B(n33), .Y(n8) );
  OAI21X1 U19 ( .A(n1), .B(n19), .C(n8), .Y(n9) );
  INVX2 U20 ( .A(rollover_val[2]), .Y(n35) );
  AOI22X1 U21 ( .A(n10), .B(n9), .C(count_out[2]), .D(n35), .Y(n11) );
  OAI21X1 U22 ( .A(rollover_val[3]), .B(n29), .C(n11), .Y(n12) );
  OAI21X1 U23 ( .A(count_out[3]), .B(n13), .C(n12), .Y(n58) );
  NAND2X1 U24 ( .A(count_out[1]), .B(n58), .Y(n14) );
  NOR2X1 U25 ( .A(clear), .B(n14), .Y(n17) );
  INVX2 U26 ( .A(n14), .Y(n20) );
  NAND2X1 U27 ( .A(n30), .B(n15), .Y(n32) );
  NOR2X1 U28 ( .A(n20), .B(n32), .Y(n16) );
  MUX2X1 U29 ( .B(n17), .A(n16), .S(n2), .Y(n18) );
  OAI21X1 U30 ( .A(n19), .B(n30), .C(n18), .Y(n49) );
  NAND2X1 U31 ( .A(n2), .B(n20), .Y(n21) );
  NOR2X1 U32 ( .A(n32), .B(n21), .Y(n23) );
  INVX2 U33 ( .A(n21), .Y(n27) );
  NOR2X1 U34 ( .A(clear), .B(n27), .Y(n22) );
  MUX2X1 U35 ( .B(n23), .A(n22), .S(n3), .Y(n26) );
  INVX2 U36 ( .A(n30), .Y(n24) );
  NAND2X1 U37 ( .A(n24), .B(count_out[2]), .Y(n25) );
  NAND2X1 U38 ( .A(n26), .B(n25), .Y(n50) );
  AOI22X1 U39 ( .A(count_out[3]), .B(n58), .C(n27), .D(n3), .Y(n28) );
  OAI22X1 U40 ( .A(n29), .B(n30), .C(n28), .D(n32), .Y(n51) );
  INVX2 U46 ( .A(count_out[0]), .Y(n31) );
  OAI22X1 U47 ( .A(n2), .B(n32), .C(n31), .D(n30), .Y(n48) );
  INVX2 U48 ( .A(n33), .Y(n40) );
  NAND2X1 U49 ( .A(n40), .B(n35), .Y(n38) );
  XOR2X1 U50 ( .A(count_out[0]), .B(rollover_val[0]), .Y(n34) );
  OAI21X1 U51 ( .A(rollover_val[3]), .B(n38), .C(n34), .Y(n56) );
  OAI21X1 U52 ( .A(n40), .B(n35), .C(n38), .Y(n36) );
  XOR2X1 U53 ( .A(n37), .B(n36), .Y(n54) );
  NAND2X1 U54 ( .A(rollover_val[3]), .B(n38), .Y(n39) );
  XOR2X1 U55 ( .A(n39), .B(count_out[3]), .Y(n53) );
  NOR2X1 U56 ( .A(n40), .B(n1), .Y(n41) );
  XOR2X1 U57 ( .A(count_out[1]), .B(n41), .Y(n52) );
  NAND3X1 U58 ( .A(n54), .B(n53), .C(n52), .Y(n55) );
  NOR2X1 U59 ( .A(n56), .B(n55), .Y(n57) );
  NAND2X1 U60 ( .A(count_enable), .B(n57), .Y(n62) );
  INVX2 U61 ( .A(n58), .Y(n59) );
  NAND2X1 U62 ( .A(n59), .B(count_enable), .Y(n60) );
  OAI21X1 U63 ( .A(clear), .B(n60), .C(rollover_flag), .Y(n61) );
  OAI21X1 U64 ( .A(clear), .B(n62), .C(n61), .Y(n43) );
endmodule


module timer ( clk, n_rst, rising_edge_found, falling_edge_found, stop_found, 
        start_found, byte_received, ack_prep, check_ack, ack_done );
  input clk, n_rst, rising_edge_found, falling_edge_found, stop_found,
         start_found;
  output byte_received, ack_prep, check_ack, ack_done;
  wire   _0_net_, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [3:0] count_out;

  flex_counter_NUM_CNT_BITS4 EIGHT ( .clk(clk), .n_rst(n_rst), .clear(_0_net_), 
        .count_enable(rising_edge_found), .rollover_val({1'b1, 1'b0, 1'b0, 
        1'b1}), .count_out(count_out) );
  AND2X2 U3 ( .A(count_out[0]), .B(n9), .Y(check_ack) );
  INVX2 U4 ( .A(stop_found), .Y(n6) );
  INVX2 U5 ( .A(count_out[1]), .Y(n3) );
  INVX2 U6 ( .A(count_out[2]), .Y(n2) );
  NAND3X1 U7 ( .A(count_out[3]), .B(n3), .C(n2), .Y(n4) );
  INVX2 U8 ( .A(n4), .Y(n9) );
  NAND2X1 U9 ( .A(check_ack), .B(falling_edge_found), .Y(n7) );
  INVX2 U10 ( .A(start_found), .Y(n5) );
  NAND3X1 U11 ( .A(n6), .B(n7), .C(n5), .Y(_0_net_) );
  INVX2 U12 ( .A(n7), .Y(ack_done) );
  INVX2 U13 ( .A(count_out[0]), .Y(n8) );
  NAND2X1 U14 ( .A(n9), .B(n8), .Y(n11) );
  INVX2 U15 ( .A(falling_edge_found), .Y(n10) );
  NOR2X1 U16 ( .A(n11), .B(n10), .Y(ack_prep) );
  INVX2 U17 ( .A(n11), .Y(byte_received) );
endmodule


module i2c_controller ( clk, n_rst, stop_found, start_found, byte_received, 
        ack_prep, check_ack, ack_done, rw_mode, address_match, sda_in, 
        data_ready, rx_enable, tx_enable, read_enable, write_enable, sda_mode, 
        load_data, i2c_rw );
  output [1:0] sda_mode;
  input clk, n_rst, stop_found, start_found, byte_received, ack_prep,
         check_ack, ack_done, rw_mode, address_match, sda_in, data_ready;
  output rx_enable, tx_enable, read_enable, write_enable, load_data, i2c_rw;
  wire   N177, key, N211, n153, n154, n155, n156, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n157, n158, n159;
  wire   [4:0] state;

  LATCH rw_reg ( .CLK(n159), .D(N177), .Q(i2c_rw) );
  DFFSR \state_reg[1]  ( .D(n158), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1]) );
  DFFSR \state_reg[0]  ( .D(n153), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0]) );
  DFFSR \state_reg[2]  ( .D(n155), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2]) );
  DFFSR \state_reg[3]  ( .D(n154), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[3]) );
  DFFSR \state_reg[4]  ( .D(n156), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[4]) );
  LATCH key_reg ( .CLK(N211), .D(n157), .Q(key) );
  AND2X1 U3 ( .A(ack_done), .B(n98), .Y(n2) );
  INVX1 U4 ( .A(n5), .Y(n6) );
  INVX1 U5 ( .A(n142), .Y(write_enable) );
  AND2X2 U6 ( .A(n95), .B(n84), .Y(n1) );
  INVX2 U7 ( .A(n6), .Y(n102) );
  INVX2 U8 ( .A(n5), .Y(n7) );
  INVX2 U9 ( .A(state[0]), .Y(n5) );
  INVX4 U10 ( .A(n3), .Y(n4) );
  INVX2 U11 ( .A(state[2]), .Y(n3) );
  INVX2 U12 ( .A(rw_mode), .Y(n8) );
  NAND2X1 U13 ( .A(address_match), .B(n8), .Y(n137) );
  INVX2 U14 ( .A(n137), .Y(n9) );
  NAND2X1 U15 ( .A(state[1]), .B(n102), .Y(n115) );
  INVX2 U16 ( .A(n115), .Y(n32) );
  INVX2 U17 ( .A(state[4]), .Y(n144) );
  NAND2X1 U18 ( .A(n32), .B(n144), .Y(n65) );
  INVX2 U19 ( .A(n65), .Y(n39) );
  INVX2 U20 ( .A(n4), .Y(n98) );
  INVX2 U21 ( .A(state[3]), .Y(n92) );
  NAND2X1 U22 ( .A(n98), .B(n92), .Y(n113) );
  INVX2 U23 ( .A(n113), .Y(n145) );
  NAND2X1 U24 ( .A(n39), .B(n145), .Y(n135) );
  INVX2 U25 ( .A(n135), .Y(n127) );
  NAND2X1 U26 ( .A(state[4]), .B(n145), .Y(n52) );
  INVX2 U27 ( .A(n52), .Y(n121) );
  INVX2 U33 ( .A(state[1]), .Y(n40) );
  NAND3X1 U34 ( .A(n121), .B(n102), .C(n40), .Y(n150) );
  INVX2 U35 ( .A(n150), .Y(n42) );
  NAND3X1 U36 ( .A(key), .B(i2c_rw), .C(data_ready), .Y(n151) );
  AOI22X1 U37 ( .A(n9), .B(n127), .C(n42), .D(n151), .Y(n24) );
  NAND2X1 U38 ( .A(state[3]), .B(n98), .Y(n16) );
  NAND2X1 U39 ( .A(n7), .B(n40), .Y(n116) );
  INVX2 U40 ( .A(n116), .Y(n146) );
  NAND2X1 U41 ( .A(n146), .B(state[4]), .Y(n60) );
  OAI22X1 U42 ( .A(n52), .B(n115), .C(n16), .D(n60), .Y(n10) );
  INVX2 U43 ( .A(n10), .Y(n38) );
  NAND3X1 U44 ( .A(n4), .B(state[4]), .C(n92), .Y(n11) );
  INVX2 U45 ( .A(n11), .Y(n30) );
  NAND2X1 U46 ( .A(n30), .B(n146), .Y(n69) );
  OAI21X1 U47 ( .A(stop_found), .B(n38), .C(n69), .Y(n13) );
  NAND2X1 U48 ( .A(n92), .B(n144), .Y(n47) );
  INVX2 U49 ( .A(n47), .Y(n12) );
  NAND3X1 U50 ( .A(n146), .B(n4), .C(n12), .Y(n45) );
  INVX2 U51 ( .A(n45), .Y(n111) );
  MUX2X1 U52 ( .B(n13), .A(n111), .S(ack_done), .Y(n23) );
  NAND2X1 U53 ( .A(n7), .B(state[1]), .Y(n51) );
  INVX2 U54 ( .A(n51), .Y(n31) );
  OAI21X1 U55 ( .A(n146), .B(n31), .C(n121), .Y(n14) );
  NAND2X1 U56 ( .A(n31), .B(n144), .Y(n59) );
  INVX2 U57 ( .A(n59), .Y(n41) );
  NAND2X1 U58 ( .A(state[3]), .B(n4), .Y(n104) );
  INVX2 U59 ( .A(n104), .Y(n33) );
  NAND2X1 U60 ( .A(n41), .B(n33), .Y(n142) );
  NAND2X1 U61 ( .A(n14), .B(n142), .Y(n21) );
  INVX2 U62 ( .A(key), .Y(n15) );
  NAND3X1 U63 ( .A(data_ready), .B(i2c_rw), .C(n15), .Y(n152) );
  INVX2 U64 ( .A(n16), .Y(n96) );
  NOR2X1 U65 ( .A(state[1]), .B(n7), .Y(n17) );
  NAND3X1 U66 ( .A(n96), .B(state[4]), .C(n17), .Y(n18) );
  OAI21X1 U67 ( .A(n150), .B(n152), .C(n18), .Y(n19) );
  INVX2 U68 ( .A(n19), .Y(n71) );
  NAND3X1 U69 ( .A(n30), .B(n102), .C(n40), .Y(n49) );
  NAND2X1 U70 ( .A(n71), .B(n49), .Y(n20) );
  NOR2X1 U71 ( .A(n21), .B(n20), .Y(n22) );
  NAND3X1 U72 ( .A(n24), .B(n23), .C(n22), .Y(n156) );
  INVX2 U73 ( .A(ack_done), .Y(n83) );
  OAI21X1 U74 ( .A(n32), .B(n31), .C(n30), .Y(n36) );
  INVX2 U75 ( .A(start_found), .Y(n95) );
  INVX2 U76 ( .A(stop_found), .Y(n84) );
  NAND2X1 U77 ( .A(n39), .B(n33), .Y(n147) );
  INVX2 U78 ( .A(n147), .Y(n34) );
  OAI21X1 U79 ( .A(byte_received), .B(n1), .C(n34), .Y(n35) );
  AND2X2 U80 ( .A(n36), .B(n35), .Y(n37) );
  OAI21X1 U81 ( .A(n38), .B(n83), .C(n37), .Y(n66) );
  NAND3X1 U82 ( .A(n39), .B(n4), .C(n92), .Y(n138) );
  NAND3X1 U83 ( .A(state[3]), .B(n144), .C(n40), .Y(n46) );
  INVX2 U84 ( .A(n46), .Y(n63) );
  NAND3X1 U85 ( .A(n63), .B(n2), .C(n102), .Y(n143) );
  INVX2 U86 ( .A(n151), .Y(n43) );
  NAND3X1 U87 ( .A(n41), .B(n4), .C(n92), .Y(n141) );
  INVX2 U88 ( .A(n141), .Y(tx_enable) );
  INVX2 U89 ( .A(ack_prep), .Y(n118) );
  AOI22X1 U90 ( .A(n43), .B(n42), .C(tx_enable), .D(n118), .Y(n44) );
  NAND3X1 U91 ( .A(n138), .B(n143), .C(n44), .Y(n125) );
  NOR2X1 U92 ( .A(n66), .B(n125), .Y(n58) );
  OAI21X1 U93 ( .A(state[1]), .B(n47), .C(n46), .Y(n48) );
  NAND3X1 U94 ( .A(n4), .B(n102), .C(n48), .Y(n148) );
  NAND3X1 U95 ( .A(n148), .B(n49), .C(n69), .Y(n50) );
  NOR2X1 U96 ( .A(n111), .B(n50), .Y(n139) );
  NAND3X1 U97 ( .A(n7), .B(n4), .C(n63), .Y(n140) );
  INVX2 U98 ( .A(n140), .Y(n112) );
  OAI22X1 U99 ( .A(n52), .B(n51), .C(n4), .D(n59), .Y(n119) );
  INVX2 U100 ( .A(n119), .Y(n55) );
  NAND3X1 U101 ( .A(n63), .B(n7), .C(n98), .Y(n53) );
  INVX2 U102 ( .A(n53), .Y(n126) );
  INVX2 U103 ( .A(sda_in), .Y(n78) );
  NAND3X1 U104 ( .A(n126), .B(check_ack), .C(n78), .Y(n54) );
  OAI21X1 U105 ( .A(n55), .B(n118), .C(n54), .Y(n56) );
  AOI21X1 U106 ( .A(n112), .B(n83), .C(n56), .Y(n57) );
  NAND3X1 U107 ( .A(n58), .B(n139), .C(n57), .Y(n155) );
  NAND2X1 U108 ( .A(address_match), .B(rw_mode), .Y(n136) );
  INVX2 U109 ( .A(n136), .Y(N177) );
  NOR2X1 U110 ( .A(N177), .B(n135), .Y(n62) );
  OAI21X1 U111 ( .A(stop_found), .B(n60), .C(n59), .Y(n61) );
  AOI22X1 U112 ( .A(n62), .B(n137), .C(n96), .D(n61), .Y(n76) );
  AOI22X1 U113 ( .A(sda_in), .B(n126), .C(ack_prep), .D(tx_enable), .Y(n75) );
  NAND2X1 U114 ( .A(n63), .B(n102), .Y(n64) );
  OAI21X1 U115 ( .A(n2), .B(n64), .C(n140), .Y(n73) );
  NOR2X1 U116 ( .A(n92), .B(n65), .Y(n67) );
  AOI21X1 U117 ( .A(n1), .B(n67), .C(n66), .Y(n68) );
  OAI21X1 U118 ( .A(n83), .B(n69), .C(n68), .Y(n70) );
  INVX2 U119 ( .A(n70), .Y(n130) );
  INVX2 U120 ( .A(check_ack), .Y(n117) );
  NAND2X1 U121 ( .A(n126), .B(n117), .Y(n131) );
  NAND3X1 U122 ( .A(n71), .B(n130), .C(n131), .Y(n72) );
  NOR2X1 U123 ( .A(n73), .B(n72), .Y(n74) );
  NAND3X1 U124 ( .A(n76), .B(n75), .C(n74), .Y(n154) );
  INVX2 U125 ( .A(byte_received), .Y(n77) );
  NOR2X1 U126 ( .A(n102), .B(n77), .Y(n80) );
  NAND2X1 U127 ( .A(n7), .B(n78), .Y(n79) );
  MUX2X1 U128 ( .B(n80), .A(n79), .S(state[3]), .Y(n81) );
  OAI21X1 U129 ( .A(start_found), .B(n7), .C(n81), .Y(n89) );
  NAND3X1 U130 ( .A(ack_prep), .B(n151), .C(n152), .Y(n82) );
  MUX2X1 U131 ( .B(n82), .A(check_ack), .S(n6), .Y(n87) );
  NAND2X1 U132 ( .A(n84), .B(n83), .Y(n85) );
  MUX2X1 U133 ( .B(n117), .A(n85), .S(n6), .Y(n86) );
  MUX2X1 U134 ( .B(n87), .A(n86), .S(state[3]), .Y(n88) );
  MUX2X1 U135 ( .B(n89), .A(n88), .S(state[4]), .Y(n90) );
  INVX2 U136 ( .A(n90), .Y(n94) );
  MUX2X1 U137 ( .B(n117), .A(ack_done), .S(n6), .Y(n91) );
  OAI21X1 U138 ( .A(n144), .B(n92), .C(n91), .Y(n93) );
  MUX2X1 U139 ( .B(n94), .A(n93), .S(n4), .Y(n109) );
  NAND2X1 U140 ( .A(n96), .B(n95), .Y(n101) );
  OAI21X1 U141 ( .A(byte_received), .B(start_found), .C(n102), .Y(n97) );
  OAI21X1 U142 ( .A(ack_prep), .B(n4), .C(n97), .Y(n105) );
  INVX2 U143 ( .A(n105), .Y(n99) );
  NAND2X1 U144 ( .A(n99), .B(n98), .Y(n100) );
  MUX2X1 U145 ( .B(n101), .A(n100), .S(n6), .Y(n107) );
  OAI21X1 U146 ( .A(n113), .B(n102), .C(state[4]), .Y(n103) );
  OAI21X1 U147 ( .A(n105), .B(n104), .C(n103), .Y(n106) );
  NOR2X1 U148 ( .A(n107), .B(n106), .Y(n108) );
  MUX2X1 U149 ( .B(n109), .A(n108), .S(state[1]), .Y(n110) );
  NAND2X1 U150 ( .A(n131), .B(n110), .Y(n153) );
  OAI21X1 U151 ( .A(n112), .B(n111), .C(ack_done), .Y(n124) );
  NOR2X1 U152 ( .A(state[4]), .B(n113), .Y(n114) );
  NAND3X1 U153 ( .A(byte_received), .B(n146), .C(n114), .Y(n123) );
  OAI22X1 U154 ( .A(n117), .B(n116), .C(stop_found), .D(n115), .Y(n120) );
  AOI22X1 U155 ( .A(n121), .B(n120), .C(n119), .D(n118), .Y(n122) );
  NAND3X1 U156 ( .A(n124), .B(n123), .C(n122), .Y(n133) );
  INVX2 U157 ( .A(n125), .Y(n129) );
  NOR2X1 U158 ( .A(n127), .B(n126), .Y(n128) );
  NAND3X1 U159 ( .A(n130), .B(n129), .C(n128), .Y(n132) );
  OAI21X1 U160 ( .A(n133), .B(n132), .C(n131), .Y(n134) );
  INVX2 U161 ( .A(n134), .Y(n158) );
  AOI21X1 U162 ( .A(n137), .B(n136), .C(n135), .Y(n159) );
  INVX2 U163 ( .A(n138), .Y(load_data) );
  NAND2X1 U164 ( .A(n141), .B(n139), .Y(sda_mode[0]) );
  NAND2X1 U165 ( .A(n141), .B(n140), .Y(sda_mode[1]) );
  INVX2 U166 ( .A(n143), .Y(read_enable) );
  NAND3X1 U167 ( .A(n146), .B(n145), .C(n144), .Y(n149) );
  NAND3X1 U168 ( .A(n149), .B(n148), .C(n147), .Y(rx_enable) );
  AOI21X1 U169 ( .A(n151), .B(n152), .C(n150), .Y(N211) );
  INVX2 U170 ( .A(n152), .Y(n157) );
endmodule


module i2c ( clk, n_rst, scl, sda_in, data_ready, output_ready, i2c_out, start, 
        stop, write_data, sda_out, en_write_r, i2c_rw, en_load );
  output [7:0] i2c_out;
  input [63:0] write_data;
  input clk, n_rst, scl, sda_in, data_ready, output_ready;
  output start, stop, sda_out, en_write_r, i2c_rw, en_load;
  wire   scl_sync, sda_sync, rise_f, fall_f, txOut, readMode, addMatch,
         rxEnable, txEnable, byteReceived, ackPrep, checkAck, ackDone;
  wire   [1:0] sdaMode;
  wire   [7:0] rxData;

  sync_1 CORE1 ( .clk(clk), .n_rst(n_rst), .async_in(scl), .sync_out(scl_sync)
         );
  sync_0 CORE2 ( .clk(clk), .n_rst(n_rst), .async_in(sda_in), .sync_out(
        sda_sync) );
  scl_edge CORE3 ( .clk(clk), .n_rst(n_rst), .scl(scl_sync), 
        .rising_edge_found(rise_f), .falling_edge_found(fall_f) );
  sda_sel CORE4 ( .tx_out(txOut), .sda_mode(sdaMode), .sda_out(sda_out) );
  decode CORE5 ( .clk(clk), .n_rst(n_rst), .scl(scl_sync), .sda_in(sda_sync), 
        .starting_byte(rxData), .rw_mode(readMode), .address_match(addMatch), 
        .stop_found(stop), .start_found(start) );
  rx_sr CORE6 ( .clk(clk), .n_rst(n_rst), .sda_in(sda_sync), 
        .rising_edge_found(rise_f), .rx_enable(rxEnable), .rx_data(rxData), 
        .rx_w_data(i2c_out) );
  tx_sr CORE7 ( .clk(clk), .n_rst(n_rst), .load_data(output_ready), 
        .falling_edge_found(fall_f), .tx_enable(txEnable), .tx_data(write_data), .tx_out(txOut) );
  timer CORE9 ( .clk(clk), .n_rst(n_rst), .rising_edge_found(rise_f), 
        .falling_edge_found(fall_f), .stop_found(stop), .start_found(start), 
        .byte_received(byteReceived), .ack_prep(ackPrep), .check_ack(checkAck), 
        .ack_done(ackDone) );
  i2c_controller CORE10 ( .clk(clk), .n_rst(n_rst), .stop_found(stop), 
        .start_found(start), .byte_received(byteReceived), .ack_prep(ackPrep), 
        .check_ack(checkAck), .ack_done(ackDone), .rw_mode(readMode), 
        .address_match(addMatch), .sda_in(sda_sync), .data_ready(data_ready), 
        .rx_enable(rxEnable), .tx_enable(txEnable), .read_enable(en_load), 
        .write_enable(en_write_r), .sda_mode(sdaMode), .i2c_rw(i2c_rw) );
endmodule


module encryptor_sram ( clk, n_rst, sda_in, scl, sda_out, w_en, r_en, addr, 
        sram_input, sram_output );
  output [15:0] addr;
  input [7:0] sram_input;
  output [7:0] sram_output;
  input clk, n_rst, sda_in, scl;
  output sda_out, w_en, r_en;
  wire   i2c_stop, i2c_rw, input_ready, tritoma_next, matotri_ready, io_sel,
         ag, out_en, key1_en, key2_en, output_ready, _0_net_, read_enable, n1,
         n2;
  wire   [63:0] key_o1;
  wire   [63:0] key_o2;
  wire   [63:0] input_to_des;
  wire   [63:0] des_to_output;
  wire   [7:0] i2c_input;
  wire   [63:0] i2c_output;

  main_controller MAIN_CONTROLLER ( .clk(clk), .n_rst(n_rst), .i2c_stop(
        i2c_stop), .i2c_rw(i2c_rw), .data_ready(input_ready), .next_data(
        tritoma_next), .des_ready(matotri_ready), .output_load_enable(out_en), 
        .dir_io_sel(io_sel), .ag_enable(ag), .key_activate_key1(key1_en), 
        .key_activate_key2(key2_en), .output_ready(output_ready) );
  triple_des TRIPLE_DES ( .clk(clk), .n_rst(n_rst), .key1(key_o1), .key2(
        key_o2), .input_triple(input_to_des), .output_triple(des_to_output), 
        .ed_sel(n1), .ready(matotri_ready), .next(tritoma_next) );
  key_o1 K1 ( .key_in(input_to_des), .enable(key1_en), .key_out(key_o1) );
  key_o2 K2 ( .key_in(input_to_des), .enable(key2_en), .key_out(key_o2) );
  input_byte ACCUMULATOR ( .clk(clk), .nrst(n_rst), .dir_sel(n1), .from_sram(
        sram_input), .from_i2c(i2c_input), .read_enable(_0_net_), 
        .output_data(input_to_des), .data_ready(input_ready) );
  output_byte DISTRIBUTOR ( .clk(clk), .n_rst(n_rst), .load_enable(out_en), 
        .rw(n1), .des_out(des_to_output), .to_sram(sram_output), .to_i2c(
        i2c_output) );
  addr_gen ADDR_GENERATOR ( .clk(clk), .n_rst(n_rst), .enable(ag), .rw_mode(n1), .address(addr), .write_en(w_en), .read_en(r_en) );
  i2c I2C ( .clk(clk), .n_rst(n_rst), .scl(scl), .sda_in(sda_in), .data_ready(
        input_ready), .output_ready(output_ready), .i2c_out(i2c_input), .stop(
        i2c_stop), .write_data(i2c_output), .sda_out(sda_out), .en_write_r(
        read_enable), .i2c_rw(i2c_rw) );
  INVX2 U2 ( .A(io_sel), .Y(n2) );
  INVX8 U3 ( .A(n2), .Y(n1) );
  OR2X2 U4 ( .A(read_enable), .B(r_en), .Y(_0_net_) );
endmodule

