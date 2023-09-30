/*
  Code can be found here: https://edaplayground.com/x/EkHy
*/

// main program
module Eqn_Ckt (Y, A, B, C);

  output Y;
  input A, B, C;
  wire p, q, r;

  assign p = A & B & C;
  assign q = A & B;
  assign r = A & C;
  assign Y = p | q | r;

endmodule


// testbench
module tb_Eqn_Ckt;

  reg a, b, c;
  wire y;

  initial begin

	  // $dumpfile ("dump.vcd"); //only needed if using the online compiler
	  // $dumpvars (1, tb_Eqn_Ckt); //only needed if using the online compiler

    #000 a = 0; b = 0; c = 0;
    #100 a = 0; b = 0; c = 1;
    #100 a = 0; b = 1; c = 0;
    #100 a = 0; b = 1; c = 1;
    #100 a = 1; b = 0; c = 0;
    #100 a = 1; b = 0; c = 1;
    #100 a = 1; b = 1; c = 0;
    #100 a = 1; b = 1; c = 1;
    #100 $stop;

  end

  Eqn_Ckt U1 (y, a, b, c);

endmodule
