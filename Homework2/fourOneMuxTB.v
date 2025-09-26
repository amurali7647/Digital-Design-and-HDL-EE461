`include “fourOneMux”
`timescale 1ns/1ps
module fourOneMuxTB;

  reg  i0, i1, i2, i3;
  reg  s1, s0;
  wire out;


  fourOneMux uut (
    .i0_i(i0), .i1_i(i1), .i2_i(i2), .i3_i(i3),
    .s1_i(s1), .s0_i(s0),
    .out_o(out)
  );

  integer k;

  initial begin
    $dumpfile("mux4_gate.vcd");   
    $dumpvars(0, fourOneMuxTB);   
  end
  
  initial begin
    i0 = 1'b0;
    i1 = 1'b1;
    i2 = 1'b0;
    i3 = 1'b1;

    $display("time | s1 s0 | i3 i2 i1 i0 | out");
    $monitor("%4t |  %b  %b |  %b  %b  %b  %b |  %b",
             $time, s1, s0, i3, i2, i1, i0, out);

    s1 = 0; s0=0; #10
    s1 = 0; s0=1; #10
    s1 = 1; s0=0; #10
    s1 = 1; s0=1; #10
    
    $finish;
  end
endmodule
