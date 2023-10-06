/*
  Code can be found here: https://edaplayground.com/x/qxGC
*/

// main program
module Detect_Parity (z, p, a, b, c);
  input a, b, c, p;
  wire q;
  output z;

  assign q = ~p;
  assign z = q ^ a ^ b ^ c;

endmodule


// testbench
module tb_Detect_Parity;

  reg bP, m0, m1, m2;
  wire op_Detect;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_Detect_Parity); //only needed if using the online compiler

    // if op_Detect = 1, no error detected
    // if op_Detect = 0, error detected

    #000 bP = 0; m0 = 0; m1= 0; m2 = 0;
    #100 bP = 0; m0 = 0; m1= 0; m2 = 1;
    #100 bP = 0; m0 = 0; m1= 1; m2 = 0;
    #100 bP = 0; m0 = 0; m1= 1; m2 = 1;
    #100 bP = 0; m0 = 1; m1= 0; m2 = 0;
    #100 bP = 0; m0 = 1; m1= 0; m2 = 1;
    #100 bP = 0; m0 = 1; m1= 1; m2 = 0;
    #100 bP = 0; m0 = 1; m1= 1; m2 = 1;
    #100 bP = 1; m0 = 0; m1= 0; m2 = 0;
    #100 bP = 1; m0 = 0; m1= 0; m2 = 1;
    #100 bP = 1; m0 = 0; m1= 1; m2 = 0;
    #100 bP = 1; m0 = 0; m1= 1; m2 = 1;
    #100 bP = 1; m0 = 1; m1= 0; m2 = 0;
    #100 bP = 1; m0 = 1; m1= 0; m2 = 1;
    #100 bP = 1; m0 = 1; m1= 1; m2 = 0;
    #100 bP = 1; m0 = 1; m1= 1; m2 = 1;
    #100 $stop;

  end

  Detect_Parity U1 (op_Detect, bP, m0, m1, m2);

endmodule
