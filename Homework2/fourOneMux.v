module fourOneMux (
    input  i0_i, i1_i, i2_i, i3_i,
    input  s1_i, s0_i,
    output out_o
);
    wire n1, n0;
    wire y0, y1, y2, y3;

    // Inverters
  not (n1, s1_i);
  not (n0, s0_i);

    // AND gates for each data input
  and (y0, i0_i, n1, n0);   
  and (y1, i1_i, n1, s0_i);   
  and (y2, i2_i, s1_i, n0);   
  and (y3, i3_i, s1_i, s0_i);   

    // OR gate to produce final output
  or  (out_o, y0, y1, y2, y3);
endmodule
