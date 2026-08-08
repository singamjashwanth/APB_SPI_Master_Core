/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : X-2025.06
// Date      : Sat Aug  8 18:36:22 2026
/////////////////////////////////////////////////////////////


module serial_clock_generator ( PCLK, PRESET_n, spi_mode_i, spiswai_i, sppr_i,
        spr_i, cpol_i, cpha_i, ss_i, sclk_o, miso_receive_sclk_o,
        miso_receive_sclk0_o, mosi_send_sclk_o, mosi_send_sclk0_o,
        BaudRateDivisor_o );
  input [1:0] spi_mode_i;
  input [2:0] sppr_i;
  input [2:0] spr_i;
  output [11:0] BaudRateDivisor_o;
  input PCLK, PRESET_n, spiswai_i, cpol_i, cpha_i, ss_i;
  output sclk_o, miso_receive_sclk_o, miso_receive_sclk0_o, mosi_send_sclk_o,
         mosi_send_sclk0_o;
  wire   N69, N70, N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178;
  wire   [11:0] count_s;
  assign BaudRateDivisor_o[11] = 1'b0;

  FD3 sclk_o_reg ( .D(n25), .CP(PCLK), .CD(n19), .SD(n20), .Q(sclk_o), .QN(
        n174) );
  FD2 \count_s_reg[11]  ( .D(N80), .CP(PCLK), .CD(PRESET_n), .Q(count_s[11])
         );
  FD2 \count_s_reg[10]  ( .D(N79), .CP(PCLK), .CD(PRESET_n), .Q(count_s[10]),
        .QN(n175) );
  FD2 \count_s_reg[9]  ( .D(N78), .CP(PCLK), .CD(PRESET_n), .Q(count_s[9]),
        .QN(n178) );
  FD2 \count_s_reg[8]  ( .D(N77), .CP(PCLK), .CD(PRESET_n), .Q(count_s[8]) );
  FD2 \count_s_reg[7]  ( .D(N76), .CP(PCLK), .CD(PRESET_n), .Q(count_s[7]),
        .QN(n173) );
  FD2 \count_s_reg[6]  ( .D(N75), .CP(PCLK), .CD(PRESET_n), .Q(count_s[6]) );
  FD2 \count_s_reg[5]  ( .D(N74), .CP(PCLK), .CD(PRESET_n), .Q(count_s[5]) );
  FD2 \count_s_reg[4]  ( .D(N73), .CP(PCLK), .CD(PRESET_n), .Q(count_s[4]),
        .QN(n177) );
  FD2 \count_s_reg[3]  ( .D(N72), .CP(PCLK), .CD(PRESET_n), .Q(count_s[3]) );
  FD2 \count_s_reg[2]  ( .D(N71), .CP(PCLK), .CD(PRESET_n), .Q(count_s[2]),
        .QN(n176) );
  FD2 \count_s_reg[1]  ( .D(N70), .CP(PCLK), .CD(PRESET_n), .Q(count_s[1]) );
  FD2 \count_s_reg[0]  ( .D(N69), .CP(PCLK), .CD(PRESET_n), .Q(count_s[0]) );
  FD2 miso_receive_sclk_o_reg ( .D(n24), .CP(PCLK), .CD(PRESET_n), .Q(
        miso_receive_sclk_o) );
  FD2 miso_receive_sclk0_o_reg ( .D(n23), .CP(PCLK), .CD(PRESET_n), .Q(
        miso_receive_sclk0_o) );
  FD2 mosi_send_sclk0_o_reg ( .D(n22), .CP(PCLK), .CD(PRESET_n), .Q(
        mosi_send_sclk0_o) );
  FD2 mosi_send_sclk_o_reg ( .D(n21), .CP(PCLK), .CD(PRESET_n), .Q(
        mosi_send_sclk_o) );
  IVP U49 ( .A(spr_i[2]), .Z(n33) );
  IVP U50 ( .A(spr_i[1]), .Z(n37) );
  ND2 U51 ( .A(n33), .B(n37), .Z(n26) );
  NR2 U52 ( .A(spr_i[0]), .B(n26), .Z(n45) );
  AN2P U53 ( .A(sppr_i[0]), .B(sppr_i[1]), .Z(n29) );
  ND2 U54 ( .A(n29), .B(sppr_i[2]), .Z(n41) );
  IVP U55 ( .A(n41), .Z(n63) );
  IVP U56 ( .A(spr_i[0]), .Z(n27) );
  ND2 U57 ( .A(spr_i[1]), .B(n33), .Z(n30) );
  NR2 U58 ( .A(n27), .B(n30), .Z(n56) );
  IVP U59 ( .A(sppr_i[0]), .Z(n53) );
  AO2 U60 ( .A(n45), .B(n63), .C(n56), .D(n53), .Z(n32) );
  AO7 U61 ( .A(n29), .B(sppr_i[2]), .C(n41), .Z(n51) );
  IVP U62 ( .A(n51), .Z(n57) );
  NR2 U63 ( .A(n27), .B(n26), .Z(n42) );
  NR2 U64 ( .A(sppr_i[0]), .B(sppr_i[1]), .Z(n28) );
  NR2 U65 ( .A(n29), .B(n28), .Z(n52) );
  NR2 U66 ( .A(spr_i[0]), .B(n30), .Z(n55) );
  AO2 U67 ( .A(n57), .B(n42), .C(n52), .D(n55), .Z(n31) );
  ND2 U68 ( .A(n32), .B(n31), .Z(BaudRateDivisor_o[3]) );
  NR2 U69 ( .A(spr_i[0]), .B(n33), .Z(n38) );
  ND2 U70 ( .A(n38), .B(n37), .Z(n61) );
  AO2 U71 ( .A(n63), .B(n42), .C(n57), .D(n55), .Z(n35) );
  ND2 U72 ( .A(n52), .B(n56), .Z(n34) );
  AO3 U73 ( .A(sppr_i[0]), .B(n61), .C(n35), .D(n34), .Z(BaudRateDivisor_o[4])
         );
  ND2 U74 ( .A(spr_i[0]), .B(spr_i[2]), .Z(n36) );
  NR2 U75 ( .A(spr_i[1]), .B(n36), .Z(n54) );
  NR2 U76 ( .A(n37), .B(n36), .Z(n62) );
  AO2 U77 ( .A(n54), .B(n57), .C(n62), .D(n53), .Z(n40) );
  ND2 U78 ( .A(spr_i[1]), .B(n38), .Z(n47) );
  IVP U79 ( .A(n47), .Z(n48) );
  ND2 U80 ( .A(n48), .B(n52), .Z(n39) );
  AO3 U81 ( .A(n41), .B(n61), .C(n40), .D(n39), .Z(BaudRateDivisor_o[7]) );
  ND2 U82 ( .A(n53), .B(n45), .Z(n79) );
  IVP U83 ( .A(n79), .Z(BaudRateDivisor_o[0]) );
  AO2 U84 ( .A(n53), .B(n42), .C(n45), .D(n52), .Z(n64) );
  IVP U85 ( .A(n64), .Z(BaudRateDivisor_o[1]) );
  AO2 U86 ( .A(n42), .B(n52), .C(n55), .D(n53), .Z(n43) );
  IVP U87 ( .A(n43), .Z(n44) );
  AO6 U88 ( .A(n57), .B(n45), .C(n44), .Z(n78) );
  IVP U89 ( .A(n78), .Z(BaudRateDivisor_o[2]) );
  AO2 U90 ( .A(n63), .B(n48), .C(n57), .D(n62), .Z(n159) );
  IVP U91 ( .A(n159), .Z(BaudRateDivisor_o[9]) );
  AO2 U92 ( .A(n63), .B(n54), .C(n52), .D(n62), .Z(n46) );
  AO7 U93 ( .A(n51), .B(n47), .C(n46), .Z(BaudRateDivisor_o[8]) );
  AO2 U94 ( .A(n56), .B(n63), .C(n48), .D(n53), .Z(n50) );
  ND2 U95 ( .A(n54), .B(n52), .Z(n49) );
  AO3 U96 ( .A(n61), .B(n51), .C(n50), .D(n49), .Z(BaudRateDivisor_o[6]) );
  IVP U97 ( .A(n52), .Z(n60) );
  AO2 U98 ( .A(n55), .B(n63), .C(n54), .D(n53), .Z(n59) );
  ND2 U99 ( .A(n57), .B(n56), .Z(n58) );
  AO3 U100 ( .A(n61), .B(n60), .C(n59), .D(n58), .Z(BaudRateDivisor_o[5]) );
  AN2P U101 ( .A(n63), .B(n62), .Z(BaudRateDivisor_o[10]) );
  IVP U102 ( .A(BaudRateDivisor_o[7]), .Z(n128) );
  NR2 U103 ( .A(BaudRateDivisor_o[4]), .B(BaudRateDivisor_o[5]), .Z(n142) );
  IVP U104 ( .A(BaudRateDivisor_o[3]), .Z(n67) );
  ND2 U105 ( .A(n64), .B(n78), .Z(n133) );
  NR2 U106 ( .A(BaudRateDivisor_o[0]), .B(n133), .Z(n69) );
  ND2 U107 ( .A(n67), .B(n69), .Z(n72) );
  IVP U108 ( .A(n72), .Z(n83) );
  ND2 U109 ( .A(n142), .B(n83), .Z(n77) );
  NR2 U110 ( .A(BaudRateDivisor_o[6]), .B(n77), .Z(n65) );
  ND2 U111 ( .A(n128), .B(n65), .Z(n84) );
  AO7 U112 ( .A(n128), .B(n65), .C(n84), .Z(n66) );
  IVP U113 ( .A(n66), .Z(n96) );
  EO1 U114 ( .A(count_s[1]), .B(BaudRateDivisor_o[1]), .C(BaudRateDivisor_o[1]), .D(count_s[1]), .Z(n143) );
  EO1 U115 ( .A(n67), .B(count_s[3]), .C(count_s[3]), .D(n67), .Z(n134) );
  AO1P U116 ( .A(n69), .B(n134), .C(count_s[11]), .D(count_s[10]), .Z(n68) );
  AO7 U117 ( .A(n69), .B(n134), .C(n68), .Z(n71) );
  NR2 U118 ( .A(BaudRateDivisor_o[0]), .B(n143), .Z(n70) );
  AO1P U119 ( .A(BaudRateDivisor_o[0]), .B(n143), .C(n71), .D(n70), .Z(n93) );
  IVP U120 ( .A(BaudRateDivisor_o[4]), .Z(n139) );
  AO2 U121 ( .A(n139), .B(count_s[4]), .C(n177), .D(BaudRateDivisor_o[4]), .Z(
        n137) );
  EO1 U122 ( .A(count_s[6]), .B(BaudRateDivisor_o[6]), .C(BaudRateDivisor_o[6]), .D(count_s[6]), .Z(n150) );
  ND2 U123 ( .A(count_s[5]), .B(n150), .Z(n76) );
  AO7 U124 ( .A(BaudRateDivisor_o[4]), .B(n72), .C(BaudRateDivisor_o[5]), .Z(
        n74) );
  ND2 U125 ( .A(count_s[5]), .B(n74), .Z(n73) );
  AO3 U126 ( .A(count_s[5]), .B(n74), .C(n77), .D(n73), .Z(n75) );
  AO4 U127 ( .A(n77), .B(n76), .C(n75), .D(n150), .Z(n81) );
  AO2 U128 ( .A(n78), .B(n176), .C(count_s[2]), .D(BaudRateDivisor_o[2]), .Z(
        n90) );
  NR2 U129 ( .A(BaudRateDivisor_o[1]), .B(n90), .Z(n151) );
  ND2 U130 ( .A(count_s[0]), .B(n79), .Z(n145) );
  OR2P U131 ( .A(n79), .B(count_s[0]), .Z(n146) );
  AO4 U132 ( .A(n151), .B(n145), .C(n90), .D(n146), .Z(n80) );
  AO3 U133 ( .A(n137), .B(n83), .C(n81), .D(n80), .Z(n82) );
  AO6 U134 ( .A(n137), .B(n83), .C(n82), .Z(n92) );
  AO2 U135 ( .A(n159), .B(count_s[9]), .C(n178), .D(BaudRateDivisor_o[9]), .Z(
        n129) );
  NR2 U136 ( .A(BaudRateDivisor_o[8]), .B(n84), .Z(n88) );
  ND2 U137 ( .A(count_s[8]), .B(n88), .Z(n89) );
  ND2 U138 ( .A(BaudRateDivisor_o[8]), .B(n84), .Z(n86) );
  ND2 U139 ( .A(count_s[8]), .B(n86), .Z(n85) );
  AO3 U140 ( .A(count_s[8]), .B(n86), .C(n129), .D(n85), .Z(n87) );
  AO4 U141 ( .A(n129), .B(n89), .C(n88), .D(n87), .Z(n91) );
  ND2 U142 ( .A(BaudRateDivisor_o[1]), .B(n90), .Z(n144) );
  ND4 U143 ( .A(n93), .B(n92), .C(n91), .D(n144), .Z(n95) );
  NR2 U144 ( .A(count_s[7]), .B(n96), .Z(n94) );
  AO1P U145 ( .A(count_s[7]), .B(n96), .C(n95), .D(n94), .Z(n123) );
  OR3 U146 ( .A(ss_i), .B(spi_mode_i[1]), .C(spiswai_i), .Z(n124) );
  NR3 U147 ( .A(count_s[0]), .B(n123), .C(n124), .Z(N69) );
  ND2 U148 ( .A(count_s[0]), .B(count_s[1]), .Z(n98) );
  IVP U149 ( .A(n98), .Z(n99) );
  NR2 U150 ( .A(count_s[0]), .B(count_s[1]), .Z(n97) );
  NR4 U151 ( .A(n123), .B(n99), .C(n97), .D(n124), .Z(N70) );
  NR2 U152 ( .A(n176), .B(n98), .Z(n101) );
  NR2 U153 ( .A(count_s[2]), .B(n99), .Z(n100) );
  NR4 U154 ( .A(n123), .B(n101), .C(n100), .D(n124), .Z(N71) );
  ND2 U155 ( .A(count_s[3]), .B(n101), .Z(n103) );
  IVP U156 ( .A(n103), .Z(n104) );
  NR2 U157 ( .A(count_s[3]), .B(n101), .Z(n102) );
  NR4 U158 ( .A(n123), .B(n104), .C(n102), .D(n124), .Z(N72) );
  NR2 U159 ( .A(n177), .B(n103), .Z(n106) );
  NR2 U160 ( .A(count_s[4]), .B(n104), .Z(n105) );
  NR4 U161 ( .A(n123), .B(n106), .C(n105), .D(n124), .Z(N73) );
  AN2P U162 ( .A(count_s[5]), .B(n106), .Z(n108) );
  NR2 U163 ( .A(count_s[5]), .B(n106), .Z(n107) );
  NR4 U164 ( .A(n123), .B(n108), .C(n107), .D(n124), .Z(N74) );
  ND2 U165 ( .A(count_s[6]), .B(n108), .Z(n110) );
  IVP U166 ( .A(n110), .Z(n111) );
  NR2 U167 ( .A(count_s[6]), .B(n108), .Z(n109) );
  NR4 U168 ( .A(n123), .B(n111), .C(n109), .D(n124), .Z(N75) );
  NR2 U169 ( .A(n173), .B(n110), .Z(n113) );
  NR2 U170 ( .A(count_s[7]), .B(n111), .Z(n112) );
  NR4 U171 ( .A(n123), .B(n113), .C(n112), .D(n124), .Z(N76) );
  ND2 U172 ( .A(count_s[8]), .B(n113), .Z(n115) );
  IVP U173 ( .A(n115), .Z(n116) );
  NR2 U174 ( .A(count_s[8]), .B(n113), .Z(n114) );
  NR4 U175 ( .A(n123), .B(n116), .C(n114), .D(n124), .Z(N77) );
  NR2 U176 ( .A(n178), .B(n115), .Z(n118) );
  NR2 U177 ( .A(count_s[9]), .B(n116), .Z(n117) );
  NR4 U178 ( .A(n123), .B(n118), .C(n117), .D(n124), .Z(N78) );
  AN2P U179 ( .A(count_s[10]), .B(n118), .Z(n121) );
  NR2 U180 ( .A(count_s[10]), .B(n118), .Z(n119) );
  NR4 U181 ( .A(n123), .B(n121), .C(n119), .D(n124), .Z(N79) );
  NR2 U182 ( .A(count_s[11]), .B(n121), .Z(n120) );
  AO1P U183 ( .A(count_s[11]), .B(n121), .C(n124), .D(n120), .Z(N80) );
  IVP U184 ( .A(PRESET_n), .Z(n122) );
  ND2 U185 ( .A(cpol_i), .B(n122), .Z(n20) );
  IVP U186 ( .A(cpol_i), .Z(n125) );
  ND2 U187 ( .A(n125), .B(n122), .Z(n19) );
  IVP U188 ( .A(n123), .Z(n126) );
  MUX31L U189 ( .D0(sclk_o), .D1(n174), .D2(n125), .A(n126), .B(n124), .Z(n25)
         );
  EO U190 ( .A(n125), .B(cpha_i), .Z(n168) );
  ND2 U191 ( .A(n174), .B(n168), .Z(n172) );
  IVP U192 ( .A(n168), .Z(n170) );
  EON1 U193 ( .A(n126), .B(n172), .C(n170), .D(miso_receive_sclk_o), .Z(n24)
         );
  ND2 U194 ( .A(sclk_o), .B(n170), .Z(n169) );
  EON1 U195 ( .A(n126), .B(n169), .C(n168), .D(miso_receive_sclk0_o), .Z(n23)
         );
  NR2 U196 ( .A(BaudRateDivisor_o[3]), .B(n133), .Z(n141) );
  ND2 U197 ( .A(n142), .B(n141), .Z(n149) );
  NR2 U198 ( .A(BaudRateDivisor_o[6]), .B(n149), .Z(n127) );
  ND2 U199 ( .A(n128), .B(n127), .Z(n138) );
  AO7 U200 ( .A(n128), .B(n127), .C(n138), .Z(n132) );
  NR2 U201 ( .A(BaudRateDivisor_o[8]), .B(n138), .Z(n158) );
  EN U202 ( .A(n129), .B(n158), .Z(n131) );
  NR2 U203 ( .A(n173), .B(n132), .Z(n130) );
  AO1P U204 ( .A(n173), .B(n132), .C(n131), .D(n130), .Z(n167) );
  EO1 U205 ( .A(n134), .B(n133), .C(n133), .D(n134), .Z(n136) );
  NR2 U206 ( .A(n137), .B(n141), .Z(n135) );
  AO1P U207 ( .A(n137), .B(n141), .C(n136), .D(n135), .Z(n166) );
  AO6 U208 ( .A(BaudRateDivisor_o[8]), .B(n138), .C(n158), .Z(n157) );
  ND2 U209 ( .A(n139), .B(n141), .Z(n140) );
  AO2 U210 ( .A(n142), .B(n141), .C(BaudRateDivisor_o[5]), .D(n140), .Z(n154)
         );
  ND4 U211 ( .A(n146), .B(n145), .C(n144), .D(n143), .Z(n148) );
  NR2 U212 ( .A(n150), .B(n149), .Z(n147) );
  AO1P U213 ( .A(n150), .B(n149), .C(n148), .D(n147), .Z(n153) );
  AO6 U214 ( .A(count_s[5]), .B(n154), .C(n151), .Z(n152) );
  AO3 U215 ( .A(count_s[5]), .B(n154), .C(n153), .D(n152), .Z(n156) );
  NR2 U216 ( .A(count_s[8]), .B(n157), .Z(n155) );
  AO1P U217 ( .A(count_s[8]), .B(n157), .C(n156), .D(n155), .Z(n165) );
  ND2 U218 ( .A(n159), .B(n158), .Z(n160) );
  AO5 U219 ( .A(n160), .B(n175), .C(BaudRateDivisor_o[10]), .Z(n163) );
  NR2 U220 ( .A(n160), .B(n175), .Z(n161) );
  ND2 U221 ( .A(count_s[11]), .B(n161), .Z(n162) );
  AO4 U222 ( .A(count_s[11]), .B(n163), .C(BaudRateDivisor_o[10]), .D(n162),
        .Z(n164) );
  ND4 U223 ( .A(n167), .B(n166), .C(n165), .D(n164), .Z(n171) );
  EON1 U224 ( .A(n171), .B(n169), .C(n168), .D(mosi_send_sclk0_o), .Z(n22) );
  EON1 U225 ( .A(n172), .B(n171), .C(n170), .D(mosi_send_sclk_o), .Z(n21) );
endmodule
