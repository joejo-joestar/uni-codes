/*
Code can be found here: https://edaplayground.com/x/XF2t
*/

//main program
module NOT_Chain (Z, A);

  output Z;
  input A;
  wire p, q, r, s, t;

  not #1 N1 (p, A);
  not #1 N2 (q, p);
  not #1 N3 (r, q);
  not #1 N4 (s, r);
  not #1 N5 (t, s);
  not #1 N6 (Z, t);

endmodule


//testbench
module tb_NOT_Chain;

  reg p;
  wire r;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_NOT_Chain); //only needed if using the online compiler

    #000 p = 0;
    #100 p = 1;
    #100 $stop;

  end

  NOT_Chain U1 (r, p);

endmodule
