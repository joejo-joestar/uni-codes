/*
  Code can be found here: https://edaplayground.com/x/fAu2
*/

// main program
module Full_Subtractor(D, B_out, A, B, B_in);

  output D, B_out;
  input A, B, B_in;

  assign D = A ^ B ^ B_in;
  assign B_out = ((~A) & B_in) | ((~A) & B) | (B & B_in);

endmodule

module Parallel_Subtractor (D, B_out, A, B);

  output[3:0] D;
  output B_out;
  input [3:0] A, B;
  wire[2:0] B_in;

  Full_Subtractor HS (D[0], B_in[0], A[0], B[0], 1'b0);
  Full_Subtractor FS1 (D[1], B_in[1], A[1], B[1], B_in[0]);
  Full_Subtractor FS2 (D[2], B_in[2], A[2], B[2], B_in[1]);
  Full_Subtractor FS3 (D[3], B_out, A[3], B[3], B_in[2]);

endmodule


// testbench
module tb_Parallel_Subtractor;

  reg[3:0] a, b;
  wire[3:0] diff;
  wire borr;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_Parallel_Subtractor); //only needed if using the online compiler

    #000 a = 4'b1011; b = 4'b1101;
    #100 a = 4'b1101; b = 4'b1011;
    #100 a = 4'b0000; b = 4'b1111;
    #100 a = 4'b1111; b = 4'b0000;
    #100 $stop;

    end

  Parallel_Subtractor U1 (diff, borr, a, b);

endmodule
