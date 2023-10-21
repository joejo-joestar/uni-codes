/*
  Code can be found here: https://edaplayground.com/x/gRq2
*/

// main program
module Twos_Comp (Z, A);

  output [7:0] Z;
  input [7:0] A;

  assign Z = ((~A) + 1);

endmodule


// testbench
module tb_Twos_Comp;

  reg [7:0] p;
  wire [7:0] r;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_Twos_Comp); //only needed if using the online compiler

    // binary number	: 10111011
    // 1's comp 		: 01000100
    // 2's comp 		: 01000101

    #00 p = 8'b10111011;
    #800 $stop;

  end

  Twos_Comp U1 (r, p);

endmodule
