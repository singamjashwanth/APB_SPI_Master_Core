/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : X-2025.06
// Date      : Sat Aug  8 18:45:48 2026
/////////////////////////////////////////////////////////////


module spi_shifter ( PCLK, PRESET_n, ss_i, send_data_i, lsbfe_i, cpha_i,
        cpol_i, miso_receive_sclk_i, miso_receive_sclk0_i, mosi_send_sclk_i,
        mosi_send_sclk0_i, data_mosi_i, miso_i, receive_data_i, data_miso_o,
        mosi_o );
  input [7:0] data_mosi_i;
  output [7:0] data_miso_o;
  input PCLK, PRESET_n, ss_i, send_data_i, lsbfe_i, cpha_i, cpol_i,
         miso_receive_sclk_i, miso_receive_sclk0_i, mosi_send_sclk_i,
         mosi_send_sclk0_i, miso_i, receive_data_i;
  output mosi_o;
  wire   n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246;
  wire   [7:0] shift_register_s;
  wire   [7:0] temp_reg_s;
  wire   [2:0] count_s;
  wire   [2:0] count1_s;
  wire   [2:0] count2_s;
  wire   [2:0] count3_s;

  FD2 \shift_register_s_reg[7]  ( .D(n114), .CP(PCLK), .CD(PRESET_n), .Q(
        shift_register_s[7]) );
  FD2 \shift_register_s_reg[6]  ( .D(n113), .CP(PCLK), .CD(PRESET_n), .Q(
        shift_register_s[6]) );
  FD2 \shift_register_s_reg[5]  ( .D(n112), .CP(PCLK), .CD(PRESET_n), .Q(
        shift_register_s[5]) );
  FD2 \shift_register_s_reg[4]  ( .D(n111), .CP(PCLK), .CD(PRESET_n), .Q(
        shift_register_s[4]) );
  FD2 \shift_register_s_reg[3]  ( .D(n110), .CP(PCLK), .CD(PRESET_n), .Q(
        shift_register_s[3]) );
  FD2 \shift_register_s_reg[2]  ( .D(n109), .CP(PCLK), .CD(PRESET_n), .Q(
        shift_register_s[2]) );
  FD2 \shift_register_s_reg[1]  ( .D(n108), .CP(PCLK), .CD(PRESET_n), .Q(
        shift_register_s[1]) );
  FD2 \shift_register_s_reg[0]  ( .D(n107), .CP(PCLK), .CD(PRESET_n), .Q(
        shift_register_s[0]) );
  FD2 \count_s_reg[0]  ( .D(n121), .CP(PCLK), .CD(PRESET_n), .Q(count_s[0]),
        .QN(n239) );
  FD2 \count_s_reg[1]  ( .D(n120), .CP(PCLK), .CD(PRESET_n), .Q(count_s[1]),
        .QN(n236) );
  FD2 \count_s_reg[2]  ( .D(n119), .CP(PCLK), .CD(PRESET_n), .Q(count_s[2]),
        .QN(n241) );
  FD2 mosi_o_reg ( .D(n115), .CP(PCLK), .CD(PRESET_n), .Q(mosi_o), .QN(n246)
         );
  FD2 \count2_s_reg[0]  ( .D(n132), .CP(PCLK), .CD(PRESET_n), .Q(count2_s[0]),
        .QN(n244) );
  FD2 \count2_s_reg[1]  ( .D(n131), .CP(PCLK), .CD(PRESET_n), .Q(count2_s[1]),
        .QN(n238) );
  FD2 \count2_s_reg[2]  ( .D(n130), .CP(PCLK), .CD(PRESET_n), .Q(count2_s[2]),
        .QN(n234) );
  FD2 \temp_reg_s_reg[0]  ( .D(n129), .CP(PCLK), .CD(PRESET_n), .Q(
        temp_reg_s[0]) );
  FD2 \temp_reg_s_reg[2]  ( .D(n127), .CP(PCLK), .CD(PRESET_n), .Q(
        temp_reg_s[2]) );
  FD2 \temp_reg_s_reg[4]  ( .D(n125), .CP(PCLK), .CD(PRESET_n), .Q(
        temp_reg_s[4]) );
  FD2 \temp_reg_s_reg[6]  ( .D(n123), .CP(PCLK), .CD(PRESET_n), .Q(
        temp_reg_s[6]) );
  FD2 \temp_reg_s_reg[1]  ( .D(n128), .CP(PCLK), .CD(PRESET_n), .Q(
        temp_reg_s[1]) );
  FD2 \temp_reg_s_reg[3]  ( .D(n126), .CP(PCLK), .CD(PRESET_n), .Q(
        temp_reg_s[3]) );
  FD2 \temp_reg_s_reg[5]  ( .D(n124), .CP(PCLK), .CD(PRESET_n), .Q(
        temp_reg_s[5]) );
  FD2 \temp_reg_s_reg[7]  ( .D(n122), .CP(PCLK), .CD(PRESET_n), .Q(
        temp_reg_s[7]) );
  FD4 \count1_s_reg[0]  ( .D(n118), .CP(PCLK), .SD(PRESET_n), .Q(count1_s[0]),
        .QN(n240) );
  FD4 \count1_s_reg[1]  ( .D(n116), .CP(PCLK), .SD(PRESET_n), .Q(count1_s[1]),
        .QN(n237) );
  FD4 \count1_s_reg[2]  ( .D(n117), .CP(PCLK), .SD(PRESET_n), .Q(count1_s[2]),
        .QN(n242) );
  FD4 \count3_s_reg[0]  ( .D(n135), .CP(PCLK), .SD(PRESET_n), .Q(count3_s[0]),
        .QN(n243) );
  FD4 \count3_s_reg[1]  ( .D(n133), .CP(PCLK), .SD(PRESET_n), .Q(count3_s[1]),
        .QN(n245) );
  FD4 \count3_s_reg[2]  ( .D(n134), .CP(PCLK), .SD(PRESET_n), .Q(count3_s[2]),
        .QN(n235) );
  EN U146 ( .A(cpol_i), .B(cpha_i), .Z(n178) );
  IVP U147 ( .A(n178), .Z(n179) );
  AO2 U148 ( .A(n179), .B(miso_receive_sclk0_i), .C(miso_receive_sclk_i), .D(
        n178), .Z(n139) );
  NR2 U149 ( .A(lsbfe_i), .B(n139), .Z(n148) );
  ND2 U150 ( .A(n148), .B(n243), .Z(n144) );
  NR2 U151 ( .A(count3_s[1]), .B(n144), .Z(n138) );
  AO1P U152 ( .A(n144), .B(count3_s[1]), .C(ss_i), .D(n138), .Z(n136) );
  IVP U153 ( .A(n136), .Z(n133) );
  AN2P U154 ( .A(temp_reg_s[0]), .B(receive_data_i), .Z(data_miso_o[0]) );
  AN2P U155 ( .A(temp_reg_s[1]), .B(receive_data_i), .Z(data_miso_o[1]) );
  AN2P U156 ( .A(temp_reg_s[2]), .B(receive_data_i), .Z(data_miso_o[2]) );
  AN2P U157 ( .A(temp_reg_s[3]), .B(receive_data_i), .Z(data_miso_o[3]) );
  AN2P U158 ( .A(temp_reg_s[4]), .B(receive_data_i), .Z(data_miso_o[4]) );
  AN2P U159 ( .A(temp_reg_s[5]), .B(receive_data_i), .Z(data_miso_o[5]) );
  AN2P U160 ( .A(temp_reg_s[6]), .B(receive_data_i), .Z(data_miso_o[6]) );
  AN2P U161 ( .A(temp_reg_s[7]), .B(receive_data_i), .Z(data_miso_o[7]) );
  IVP U162 ( .A(ss_i), .Z(n190) );
  AO3 U163 ( .A(n148), .B(n243), .C(n190), .D(n144), .Z(n135) );
  ND2 U164 ( .A(n138), .B(n235), .Z(n137) );
  AO3 U165 ( .A(n138), .B(n235), .C(n137), .D(n190), .Z(n134) );
  IVP U166 ( .A(lsbfe_i), .Z(n211) );
  OR2P U167 ( .A(n211), .B(n139), .Z(n145) );
  NR2 U168 ( .A(n145), .B(n244), .Z(n141) );
  OR2P U169 ( .A(ss_i), .B(n141), .Z(n140) );
  AO6 U170 ( .A(n145), .B(n244), .C(n140), .Z(n132) );
  ND2 U171 ( .A(n141), .B(n190), .Z(n155) );
  AO2 U172 ( .A(count2_s[1]), .B(n140), .C(n155), .D(n238), .Z(n131) );
  ND2 U173 ( .A(count2_s[1]), .B(n141), .Z(n143) );
  NR2 U174 ( .A(n234), .B(n143), .Z(n142) );
  AO1P U175 ( .A(n234), .B(n143), .C(ss_i), .D(n142), .Z(n130) );
  NR2 U176 ( .A(count3_s[1]), .B(count3_s[2]), .Z(n150) );
  NR2 U177 ( .A(ss_i), .B(n144), .Z(n167) );
  NR3 U178 ( .A(ss_i), .B(count2_s[0]), .C(n145), .Z(n168) );
  AN2P U179 ( .A(n238), .B(n168), .Z(n160) );
  AO2 U180 ( .A(n150), .B(n167), .C(n160), .D(n234), .Z(n147) );
  IVP U181 ( .A(miso_i), .Z(n176) );
  ND2 U182 ( .A(temp_reg_s[0]), .B(n147), .Z(n146) );
  AO7 U183 ( .A(n147), .B(n176), .C(n146), .Z(n129) );
  ND2 U184 ( .A(n148), .B(count3_s[0]), .Z(n149) );
  NR2 U185 ( .A(ss_i), .B(n149), .Z(n174) );
  NR2 U186 ( .A(count2_s[1]), .B(n155), .Z(n163) );
  AO2 U187 ( .A(n174), .B(n150), .C(n163), .D(n234), .Z(n152) );
  ND2 U188 ( .A(temp_reg_s[1]), .B(n152), .Z(n151) );
  AO7 U189 ( .A(n152), .B(n176), .C(n151), .Z(n128) );
  NR2 U190 ( .A(count2_s[2]), .B(n238), .Z(n156) );
  NR2 U191 ( .A(count3_s[2]), .B(n245), .Z(n157) );
  AO2 U192 ( .A(n168), .B(n156), .C(n167), .D(n157), .Z(n154) );
  ND2 U193 ( .A(temp_reg_s[2]), .B(n154), .Z(n153) );
  AO7 U194 ( .A(n154), .B(n176), .C(n153), .Z(n127) );
  IVP U195 ( .A(n155), .Z(n172) );
  AO2 U196 ( .A(n174), .B(n157), .C(n172), .D(n156), .Z(n159) );
  ND2 U197 ( .A(temp_reg_s[3]), .B(n159), .Z(n158) );
  AO7 U198 ( .A(n159), .B(n176), .C(n158), .Z(n126) );
  NR2 U199 ( .A(count3_s[1]), .B(n235), .Z(n164) );
  AO2 U200 ( .A(count2_s[2]), .B(n160), .C(n164), .D(n167), .Z(n162) );
  ND2 U201 ( .A(temp_reg_s[4]), .B(n162), .Z(n161) );
  AO7 U202 ( .A(n162), .B(n176), .C(n161), .Z(n125) );
  AO2 U203 ( .A(n174), .B(n164), .C(count2_s[2]), .D(n163), .Z(n166) );
  ND2 U204 ( .A(temp_reg_s[5]), .B(n166), .Z(n165) );
  AO7 U205 ( .A(n166), .B(n176), .C(n165), .Z(n124) );
  NR2 U206 ( .A(n234), .B(n238), .Z(n171) );
  NR2 U207 ( .A(n245), .B(n235), .Z(n173) );
  AO2 U208 ( .A(n168), .B(n171), .C(n167), .D(n173), .Z(n170) );
  ND2 U209 ( .A(temp_reg_s[6]), .B(n170), .Z(n169) );
  AO7 U210 ( .A(n170), .B(n176), .C(n169), .Z(n123) );
  AO2 U211 ( .A(n174), .B(n173), .C(n172), .D(n171), .Z(n177) );
  ND2 U212 ( .A(temp_reg_s[7]), .B(n177), .Z(n175) );
  AO7 U213 ( .A(n177), .B(n176), .C(n175), .Z(n122) );
  AO2 U214 ( .A(n179), .B(mosi_send_sclk0_i), .C(mosi_send_sclk_i), .D(n178),
        .Z(n192) );
  NR2 U215 ( .A(n192), .B(n211), .Z(n180) );
  NR2 U216 ( .A(ss_i), .B(n180), .Z(n181) );
  AO6 U217 ( .A(n190), .B(n239), .C(n181), .Z(n184) );
  AO6 U218 ( .A(n181), .B(n239), .C(n184), .Z(n121) );
  NR2 U219 ( .A(n181), .B(n239), .Z(n183) );
  ND2 U220 ( .A(n183), .B(n236), .Z(n182) );
  AO4 U221 ( .A(ss_i), .B(n182), .C(n184), .D(n236), .Z(n120) );
  NR2 U222 ( .A(count_s[2]), .B(n236), .Z(n198) );
  NR2 U223 ( .A(count_s[1]), .B(n241), .Z(n195) );
  AO6 U224 ( .A(n198), .B(n183), .C(n195), .Z(n185) );
  AO4 U225 ( .A(ss_i), .B(n185), .C(n184), .D(n241), .Z(n119) );
  NR2 U226 ( .A(lsbfe_i), .B(n192), .Z(n186) );
  ND2 U227 ( .A(n186), .B(n240), .Z(n188) );
  AO3 U228 ( .A(n186), .B(n240), .C(n190), .D(n188), .Z(n118) );
  ND2 U229 ( .A(n237), .B(n242), .Z(n205) );
  IVP U230 ( .A(n188), .Z(n191) );
  ND2 U231 ( .A(n191), .B(n237), .Z(n189) );
  ND2 U232 ( .A(count1_s[2]), .B(n189), .Z(n187) );
  AO3 U233 ( .A(n205), .B(n188), .C(n190), .D(n187), .Z(n117) );
  AO3 U234 ( .A(n191), .B(n237), .C(n190), .D(n189), .Z(n116) );
  NR2 U235 ( .A(ss_i), .B(n192), .Z(n216) );
  NR2 U236 ( .A(count_s[2]), .B(count_s[1]), .Z(n196) );
  AO2 U237 ( .A(shift_register_s[1]), .B(n196), .C(shift_register_s[5]), .D(
        n195), .Z(n194) );
  NR2 U238 ( .A(n241), .B(n236), .Z(n197) );
  AO2 U239 ( .A(shift_register_s[3]), .B(n198), .C(shift_register_s[7]), .D(
        n197), .Z(n193) );
  ND2 U240 ( .A(n194), .B(n193), .Z(n202) );
  AO2 U241 ( .A(n196), .B(shift_register_s[0]), .C(n195), .D(
        shift_register_s[4]), .Z(n200) );
  AO2 U242 ( .A(n198), .B(shift_register_s[2]), .C(n197), .D(
        shift_register_s[6]), .Z(n199) );
  ND2 U243 ( .A(n200), .B(n199), .Z(n201) );
  AO2 U244 ( .A(count_s[0]), .B(n202), .C(n201), .D(n239), .Z(n213) );
  AO2 U245 ( .A(count1_s[2]), .B(shift_register_s[7]), .C(shift_register_s[3]),
        .D(n242), .Z(n204) );
  ND2 U246 ( .A(count1_s[2]), .B(n237), .Z(n206) );
  AO4 U247 ( .A(shift_register_s[5]), .B(n206), .C(shift_register_s[1]), .D(
        n205), .Z(n203) );
  AO1P U248 ( .A(count1_s[1]), .B(n204), .C(n240), .D(n203), .Z(n210) );
  AO2 U249 ( .A(count1_s[2]), .B(shift_register_s[6]), .C(shift_register_s[2]),
        .D(n242), .Z(n208) );
  AO4 U250 ( .A(shift_register_s[4]), .B(n206), .C(shift_register_s[0]), .D(
        n205), .Z(n207) );
  AO1P U251 ( .A(count1_s[1]), .B(n208), .C(count1_s[0]), .D(n207), .Z(n209)
         );
  NR2 U252 ( .A(n210), .B(n209), .Z(n212) );
  AO2 U253 ( .A(lsbfe_i), .B(n213), .C(n212), .D(n211), .Z(n214) );
  ND2 U254 ( .A(n214), .B(n216), .Z(n215) );
  AO7 U255 ( .A(n216), .B(n246), .C(n215), .Z(n115) );
  IVP U256 ( .A(send_data_i), .Z(n231) );
  ND2 U257 ( .A(shift_register_s[7]), .B(n231), .Z(n218) );
  ND2 U258 ( .A(send_data_i), .B(data_mosi_i[7]), .Z(n217) );
  ND2 U259 ( .A(n218), .B(n217), .Z(n114) );
  ND2 U260 ( .A(shift_register_s[6]), .B(n231), .Z(n220) );
  ND2 U261 ( .A(send_data_i), .B(data_mosi_i[6]), .Z(n219) );
  ND2 U262 ( .A(n220), .B(n219), .Z(n113) );
  ND2 U263 ( .A(shift_register_s[5]), .B(n231), .Z(n222) );
  ND2 U264 ( .A(send_data_i), .B(data_mosi_i[5]), .Z(n221) );
  ND2 U265 ( .A(n222), .B(n221), .Z(n112) );
  ND2 U266 ( .A(shift_register_s[4]), .B(n231), .Z(n224) );
  ND2 U267 ( .A(send_data_i), .B(data_mosi_i[4]), .Z(n223) );
  ND2 U268 ( .A(n224), .B(n223), .Z(n111) );
  ND2 U269 ( .A(shift_register_s[3]), .B(n231), .Z(n226) );
  ND2 U270 ( .A(send_data_i), .B(data_mosi_i[3]), .Z(n225) );
  ND2 U271 ( .A(n226), .B(n225), .Z(n110) );
  ND2 U272 ( .A(shift_register_s[2]), .B(n231), .Z(n228) );
  ND2 U273 ( .A(send_data_i), .B(data_mosi_i[2]), .Z(n227) );
  ND2 U274 ( .A(n228), .B(n227), .Z(n109) );
  ND2 U275 ( .A(shift_register_s[1]), .B(n231), .Z(n230) );
  ND2 U276 ( .A(send_data_i), .B(data_mosi_i[1]), .Z(n229) );
  ND2 U277 ( .A(n230), .B(n229), .Z(n108) );
  ND2 U278 ( .A(shift_register_s[0]), .B(n231), .Z(n233) );
  ND2 U279 ( .A(send_data_i), .B(data_mosi_i[0]), .Z(n232) );
  ND2 U280 ( .A(n233), .B(n232), .Z(n107) );
endmodule
