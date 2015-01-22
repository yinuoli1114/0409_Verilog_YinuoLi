// $Id: $
// File name:   key_generate.sv
// Created:     11/6/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: key generator


module key_shift
   (
    input wire [55:0] kin,
    output wire [55:0] k_out,
    input wire [4:0]roundSel
    );

   wire [27:0] 	l1,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12,l13,l14,l15,l16;
   wire [27:0] 	r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16;
    wire [55:0] k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14,k15,k16;
    reg [55:0] kout;
    assign k_out = kout;

always_comb
  begin
	case (roundSel)
    1: kout = k1;
    2: kout = k2;
    3: kout = k3;
    4: kout = k4;
    5: kout = k5;
    6: kout = k6;
    7: kout = k7;
    8: kout = k8;
    9: kout = k9;
    10: kout = k10;
    11: kout = k11;
    12: kout = k12;
    13: kout = k13;
    14: kout = k14;
    15: kout = k15;
    16: kout = k16;
    default:
    kout = k1;//erase latch
    endcase // case (roundSel)
  end // always_comb
   //assign l1 = {kin[26:0],kin[27]};
   assign l1 = {kin[54:28],kin[55]};
   assign l2 = {l1[26:0],l1[27]};
   assign l3 = {l2[25:0],l2[27:26]};
   assign l4 = {l3[25:0],l3[27:26]};
   assign l5 = {l4[25:0],l4[27:26]};
   assign l6 = {l5[25:0],l5[27:26]};
   assign l7 = {l6[25:0],l6[27:26]};
   assign l8 = {l7[25:0],l7[27:26]};
   assign l9 = {l8[26:0],l8[27]};
   assign l10 = {l9[25:0],l9[27:26]};
   assign l11 = {l10[25:0],l10[27:26]};
   assign l12 = {l11[25:0],l11[27:26]};
   assign l13 = {l12[25:0],l12[27:26]};
   assign l14 = {l13[25:0],l13[27:26]};
   assign l15 = {l14[25:0],l14[27:26]};
   assign l16 = {l15[26:0],l15[27]};

   //assign r1 = {kin[54:28],kin[55]};
   assign r1 = {kin[26:0],kin[27]};
   assign r2 = {r1[26:0],r1[27]};
   assign r3 = {r2[25:0],r2[27:26]};
   assign r4 = {r3[25:0],r3[27:26]};
   assign r5 = {r4[25:0],r4[27:26]};
   assign r6 = {r5[25:0],r5[27:26]};
   assign r7 = {r6[25:0],r6[27:26]};
   assign r8 = {r7[25:0],r7[27:26]};
   assign r9 = {r8[26:0],r8[27]};
   assign r10 = {r9[25:0],r9[27:26]};
   assign r11 = {r10[25:0],r10[27:26]};
   assign r12 = {r11[25:0],r11[27:26]};
   assign r13 = {r12[25:0],r12[27:26]};
   assign r14 = {r13[25:0],r13[27:26]};
   assign r15 = {r14[25:0],r14[27:26]};
   assign r16 = {r15[26:0],r15[27]};
/*
   assign r1 = {kin[30:56],kin[29]};
   assign r2 = {r1[2:28],r1[1]};
   assign r3 = {r2[3:28],r2[1:2]};
   assign r4 = {r3[3:28],r3[1:2]};
   assign r5 = {r4[3:28],r4[1:2]};
   assign r6 = {r5[3:28],r5[1:2]};
   assign r7 = {r6[3:28],r6[1:2]};
   assign r8 = {r7[3:28],r7[1:2]};
   assign r9 = {r8[2:28],r8[1]};
   assign r10 = {r9[3:28],r9[1:2]};
   assign r11 = {r10[3:28],r10[1:2]};
   assign r12 = {r11[3:28],r11[1:2]};
   assign r13 = {r12[3:28],r12[1:2]};
   assign r14 = {r13[3:28],r13[1:2]};
   assign r15 = {r14[3:28],r14[1:2]};
   assign r16 = {r15[2:28],r15[1]};
   */
   assign k1 = {l1,r1};
   assign k2 = {l2,r2};
   assign k3 = {l3,r3};
   assign k4 = {l4,r4};
   assign k5 = {l5,r5};
   assign k6 = {l6,r6};
   assign k7 = {l7,r7};
   assign k8 = {l8,r8};
   assign k9 = {l9,r9};
   assign k10 = {l10,r10};
   assign k11 = {l11,r11};
   assign k12 = {l12,r12};
   assign k13 = {l13,r13};
   assign k14 = {l14,r14};
   assign k15 = {l15,r15};
   assign k16 = {l16,r16};


endmodule
