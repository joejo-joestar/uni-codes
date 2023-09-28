/*
Code can be found here: https://edaplayground.com/x/Gf_T
*/

//main program
module Hamming (P1, P2, P3, m0, m1, m2, m3);
  input m0, m1, m2, m3;
  output P1, P2, P3;

  assign P1 = m0 ^ m1 ^ m3;
  assign P2 = m0 ^ m2 ^ m3;
  assign P3 = m1 ^ m2 ^ m3;

endmodule


//testbench
module tb_Hamming;

  reg m0, m1, m2, m3;
  wire P1, P2, P3;

  initial begin

    $dumpfile ("dump.vcd");
    $dumpvars (1, tb_Hamming);

    #000 m0 = 0; m1 = 0; m2 = 0; m3 =  0;
    #100 m0 = 0; m1 = 0; m2 = 0; m3 =  1;
    #100 m0 = 0; m1 = 0; m2 = 1; m3 =  0;
    #100 m0 = 0; m1 = 0; m2 = 1; m3 =  1;
    #100 m0 = 0; m1 = 1; m2 = 0; m3 =  0;
    #100 m0 = 0; m1 = 1; m2 = 0; m3 =  1;
    #100 m0 = 0; m1 = 1; m2 = 1; m3 =  0;
    #100 m0 = 0; m1 = 1; m2 = 1; m3 =  1;
    #100 m0 = 1; m1 = 0; m2 = 0; m3 =  0;
    #100 m0 = 1; m1 = 0; m2 = 0; m3 =  1;
    #100 m0 = 1; m1 = 0; m2 = 1; m3 =  0;
    #100 m0 = 1; m1 = 0; m2 = 1; m3 =  1;
    #100 m0 = 1; m1 = 1; m2 = 0; m3 =  0;
    #100 m0 = 1; m1 = 1; m2 = 0; m3 =  1;
    #100 m0 = 1; m1 = 1; m2 = 1; m3 =  0;
    #100 m0 = 1; m1 = 1; m2 = 1; m3 =  1;
    #100 $stop;

  end

  Hamming U1 (P1, P2, P3, m0, m1, m2, m3);

endmodule
