/*
  Code can be found here: https://edaplayground.com/x/U_MZ
*/

// main program
module Eqn_Ckt (Y, A, B, C);

  output Y;
  input A, B, C;
  wire p, q, r, s, t;

  or O1 (p, A, B);
  or O2 (q, p, C);
  or O3 (r, A, B);
  or O4 (s, A, C);
  and A1 (t, q, r);
  and A2 (Y, t, s);

endmodule


// testbench
module tb_Eqn_Ckt;

  reg ip1, ip2, ip3;
  wire op;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_Eqn_Ckt); //only needed if using the online compiler

    #000 ip1 = 0; ip2 = 0; ip3 = 0;
    #100 ip1 = 0; ip2 = 0; ip3 = 1;
    #100 ip1 = 0; ip2 = 1; ip3 = 0;
    #100 ip1 = 0; ip2 = 1; ip3 = 1;
    #100 ip1 = 1; ip2 = 0; ip3 = 0;
    #100 ip1 = 1; ip2 = 0; ip3 = 1;
    #100 ip1 = 1; ip2 = 1; ip3 = 0;
    #100 ip1 = 1; ip2 = 1; ip3 = 1;
    #100 $stop;

  end

  Eqn_Ckt U1 (op, ip1, ip2, ip3);

endmodule
