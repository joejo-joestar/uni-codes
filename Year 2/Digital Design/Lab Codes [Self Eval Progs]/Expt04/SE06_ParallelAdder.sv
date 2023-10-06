/*
  Code can be found here: https://edaplayground.com/x/qJ49
*/

// main progam
module full_adder(S, C_out, A, B, C_in);

  output S, C_out;
  input A, B, C_in;

  assign S = A ^ B ^ C_in;
  assign C_out = (C_in & (A ^ B)) | (A & B);

endmodule

module Parallel_Adder (S, C_out, A, B);

  output[3:0] S;
  output C_out;
  input [3:0] A, B;
  wire[2:0] C_in;

  full_adder HA (S[0], C_in[0], A[0], B[0], 1'b0);
  full_adder FA1 (S[1], C_in[1], A[1], B[1], C_in[0]);
  full_adder FA2 (S[2], C_in[2], A[2], B[2], C_in[1]);
  full_adder FA3 (S[3], C_out, A[3], B[3], C_in[2]);

endmodule


// testbench
module tb_Parallel_Adder;

  reg[3:0] a, b;
  wire[3:0] sum;
  wire carry;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_Parallel_Adder); //only needed if using the online compiler

    #000 a = 4'b1011; b = 4'b1101;
    #100 a = 4'b1101; b = 4'b1011;
    #100 a = 4'b0000; b = 4'b1111;
    #100 a = 4'b1111; b = 4'b0000;
    #100 $stop;

    end

  Parallel_Adder U1 (sum, carry, a, b);

endmodule
