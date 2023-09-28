/*
Code can be found here: https://edaplayground.com/x/HPX8
*/

//main program
module Hamming (P1, P2, P3, P4, m0, m1, m2, m3, m4, m5, m6);
  input m0, m1, m2, m3, m4, m5, m6;
  output P1, P2, P3, P4;

  assign P1 = m0 ^ m1 ^ m3 ^ m4 ^ m6;
  assign P2 = m0 ^ m2 ^ m3 ^ m5 ^ m6;
  assign P3 = m1 ^ m2 ^ m3;
  assign P4 = m4 ^ m5 ^ m6;

endmodule


//testbench
module tb_Hamming;

  reg m0, m1, m2, m3, m4, m5, m6;
  wire P1, P2, P3, P4;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_Hamming); //only needed if using the online compiler

    #000 m0 = 0; m1 = 0; m2 = 0; m3 = 0; m4 = 0; m5 = 0; m6 =  0;
    #100 m0 = 0; m1 = 0; m2 = 1; m3 = 0; m4 = 0; m5 = 0; m6 =  1;
    #100 m0 = 0; m1 = 1; m2 = 0; m3 = 0; m4 = 0; m5 = 1; m6 =  0;
    #100 m0 = 0; m1 = 1; m2 = 1; m3 = 0; m4 = 0; m5 = 1; m6 =  1;
    #100 m0 = 1; m1 = 0; m2 = 0; m3 = 0; m4 = 1; m5 = 0; m6 =  0;
    #100 m0 = 1; m1 = 0; m2 = 1; m3 = 0; m4 = 1; m5 = 0; m6 =  1;
    #100 m0 = 1; m1 = 1; m2 = 0; m3 = 0; m4 = 1; m5 = 1; m6 =  0;
    #100 m0 = 1; m1 = 1; m2 = 1; m3 = 0; m4 = 1; m5 = 1; m6 =  1;
    #100 m0 = 0; m1 = 0; m2 = 0; m3 = 1; m4 = 0; m5 = 0; m6 =  0;
    #100 m0 = 0; m1 = 0; m2 = 1; m3 = 1; m4 = 0; m5 = 0; m6 =  1;
    #100 m0 = 0; m1 = 1; m2 = 0; m3 = 1; m4 = 0; m5 = 1; m6 =  0;
    #100 m0 = 0; m1 = 1; m2 = 1; m3 = 1; m4 = 0; m5 = 1; m6 =  1;
    #100 m0 = 1; m1 = 0; m2 = 0; m3 = 1; m4 = 1; m5 = 0; m6 =  0;
    #100 m0 = 1; m1 = 0; m2 = 1; m3 = 1; m4 = 1; m5 = 0; m6 =  1;
    #100 m0 = 1; m1 = 1; m2 = 0; m3 = 1; m4 = 1; m5 = 1; m6 =  0;
    #100 m0 = 1; m1 = 1; m2 = 1; m3 = 1; m4 = 1; m5 = 1; m6 =  1;
    #100 $stop;

  end

  Hamming U1 (P1, P2, P3, P4, m0, m1, m2, m3, m4, m5, m6);

endmodule
