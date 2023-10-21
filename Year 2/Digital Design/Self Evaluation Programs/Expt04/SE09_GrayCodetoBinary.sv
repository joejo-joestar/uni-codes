/*
  Code can be found here: https://edaplayground.com/x/uNTW
*/

// main program
module GrayCode2Binary (Z, A);

  output [7:0] Z;
  input [7:0] A;

  assign Z[7] = (A[7]);
  assign Z[6] = (A[6] ^ Z[7]);
  assign Z[5] = (A[5] ^ Z[6]);
  assign Z[4] = (A[4] ^ Z[5]);
  assign Z[3] = (A[3] ^ Z[4]);
  assign Z[2] = (A[2] ^ Z[3]);
  assign Z[1] = (A[1] ^ Z[2]);
  assign Z[0] = (A[0] ^ Z[1]);

endmodule


// testbench
module tb_GrayCode2Binary;

  reg [7:0] p;
  wire [7:0] r;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_GrayCode2Binary); //only needed if using the online compiler

    // binary number	: 10111011
    // Gray Code		: 11100110

    #00 p = 8'b11100110;
    #800 $stop;

  end

  GrayCode2Binary U1 (r, p);

endmodule
