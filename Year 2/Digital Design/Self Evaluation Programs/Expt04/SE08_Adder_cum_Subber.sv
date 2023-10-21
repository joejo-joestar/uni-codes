/*
  Code can be found here: https://edaplayground.com/x/cX5X
*/

// main program
module full_adder(S, C_out, A, B, C_in);

  output S, C_out;
  input A, B, C_in;

  assign S = A ^ B ^ C_in;
  assign C_out = (C_in & (A ^ B)) | (A & B);

endmodule

module Adder_cum_Subtractor (S, C_out, V, A, B, M);

  output[3:0] S;
  output C_out, V;
  input [3:0] A, B;
  input M;
  wire[2:0] C_in;
  wire[3:0] p;

  xor G1 (p[0], B[0], M);
  xor G2 (p[1], B[1], M);
  xor G3 (p[2], B[2], M);
  xor G4 (p[3], B[3], M);

  full_adder FA1 (S[0], C_in[0], A[0], p[0], M);
  full_adder FA2 (S[1], C_in[1], A[1], p[1], C_in[0]);
  full_adder FA3 (S[2], C_in[2], A[2], p[2], C_in[1]);
  full_adder FA4 (S[3], C_out, A[3], p[3], C_in[2]);

  xor G5 (V, C_in[2], C_out);

endmodule


// testbench
module tb_Adder_cum_Subtractor;

  reg[3:0] a, b;
  reg m;
  wire[3:0] sum;
  wire carry, v;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_Adder_cum_Subtractor); //only needed if using the online compiler

    #000 a = 4'b1011; b = 4'b1101; m = 0;
    #100 a = 4'b1011; b = 4'b1101; m = 1;
    #100 a = 4'b0000; b = 4'b1111; m = 0;
    #100 a = 4'b0000; b = 4'b1111; m = 1;
    #100 $stop;

    end

  Adder_cum_Subtractor U1 (sum, carry, v, a, b, m);

endmodule
