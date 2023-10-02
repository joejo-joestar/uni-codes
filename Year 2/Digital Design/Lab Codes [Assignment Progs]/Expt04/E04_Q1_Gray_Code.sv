/*
  Code can be found here: https://edaplayground.com/x/9iVb
*/

// main program
module Gray_Code (Z, A);

  output [7:0] Z;
  input [7:0] A;

  assign Z[0] = (A[0] ^ A[1]);
  assign Z[1] = (A[1] ^ A[2]);
  assign Z[2] = (A[2] ^ A[3]);
  assign Z[3] = (A[3] ^ A[4]);
  assign Z[4] = (A[4] ^ A[5]);
  assign Z[5] = (A[5] ^ A[6]);
  assign Z[6] = (A[6] ^ A[7]);
  assign Z[7] = (A[7]);

endmodule


// testbench
module tb_Gray_Code;

  reg [7:0] p;
  wire [7:0] r;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_Gray_Code); //only needed if using the online compiler

    // binary number	: 10111011
    // Gray Code		: 11100110

    // #00 p = 8'b10111011;
    // #800 $stop;

  end

  Gray_Code U1 (r, p);

endmodule
