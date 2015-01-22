// $Id: $
// File name:   key_permutation2.sv
// Created:     11/11/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: contraction permutation that generates the 48 bits round key from the 56 bits key

module key_permutation2
  (
   input wire [55:0] kin,
   output wire [47:0] kout
   );
   assign kout[0] = kin[13];
   assign kout[1] = kin[16];
   assign kout[2] = kin[10];
   assign kout[3] = kin[23];
   assign kout[4] = kin[0];
   assign kout[5] = kin[4];
   assign kout[6] = kin[2];
   assign kout[7] = kin[27];

   assign kout[8] = kin[14];
   assign kout[9] = kin[5];
   assign kout[10] = kin[20];
   assign kout[11] = kin[9];
   assign kout[12] = kin[22];
   assign kout[13] = kin[18];
   assign kout[14] = kin[11];
   assign kout[15] = kin[3];

   assign kout[16] = kin[25];
   assign kout[17] = kin[7];
   assign kout[18] = kin[15];
   assign kout[19] = kin[6];
   assign kout[20] = kin[26];
   assign kout[21] = kin[19];
   assign kout[22] = kin[12];
   assign kout[23] = kin[1];

   assign kout[24] = kin[40];
   assign kout[25] = kin[51];
   assign kout[26] = kin[30];
   assign kout[27] = kin[36];
   assign kout[28] = kin[46];
   assign kout[29] = kin[54];
   assign kout[30] = kin[29];
   assign kout[31] = kin[39];

   assign kout[32] = kin[50];
   assign kout[33] = kin[44];
   assign kout[34] = kin[32];
   assign kout[35] = kin[47];
   assign kout[36] = kin[43];
   assign kout[37] = kin[48];
   assign kout[38] = kin[38];
   assign kout[39] = kin[55];

   assign kout[40] = kin[33];
   assign kout[41] = kin[52];
   assign kout[42] = kin[45];
   assign kout[43] = kin[41];
   assign kout[44] = kin[49];
   assign kout[45] = kin[35];
   assign kout[46] = kin[28];
   assign kout[47] = kin[31];
   
 endmodule
   


