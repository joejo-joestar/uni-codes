/*
  Code can be found here: https://edaplayground.com/x/ZsRf
*/

// main program

  // Full Adder Module
module fullAdder(S, cOut, in1, in2, cIn);

  output S, cOut;
  input in1, in2, cIn;

  assign S = in1 ^ in2 ^ cIn;
  assign cOut = (cIn & (in1 ^ in2)) | (in1 & in2);

endmodule

  // Parallel Adder Module
module parallelAdder (Z, cOut, in1, in2);

  output[3:0] Z;
  output cOut;
  input [3:0] in1, in2;
  wire[2:0] cIn;

  fullAdder HA (Z[0], cIn[0], in1[0], in2[0], 1'b0);
  fullAdder FA1 (Z[1], cIn[1], in1[1], in2[1], cIn[0]);
  fullAdder FA2 (Z[2], cIn[2], in1[2], in2[2], cIn[1]);
  fullAdder FA3 (Z[3], cOut, in1[3], in2[3], cIn[2]);

endmodule

  // BCD Adder Module
module BCDAdder (S, cOut, in1, in2);
  output[3:0] S;
  wire[3:0] Z, corr;
  output cOut;
  input[3:0] in1, in2;
  wire cIn, ch1, ch2, ch3;

  parallelAdder PA1 (Z[3:0], ch1, in1[3:0], in2[3:0]);

  // correcting invalid BCD Sum if any
  and A1 (ch2, Z[3], Z[2]);
  and A2 (ch3, Z[3], Z[1]);
  or O (cIn, ch1, ch2, ch3);

  assign corr[3] = 0;
  assign corr[2] = cIn;
  assign corr[1] = cIn;
  assign corr[0] = 0;

  parallelAdder PA2 (S[3:0], cOut, corr[3:0], Z[3:0]);

endmodule


// testbench
module tbBCDAdder;

  reg[3:0] in1, in2;
  wire[3:0] Sum;
  wire[3:0] Carr;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tbBCDAdder); //only needed if using the online compiler

    // 3 + 5 = 8
    #000 in1 = 4'b0011; in2 = 4'b0101;
    // 5 + 4 = 9
    #100 in1 = 4'b0101; in2 = 4'b0100;
    // 7 + 5 = 12
    #100 in1 = 4'b0111; in2 = 4'b0101;
    // 4 + 6 = 10
    #100 in1 = 4'b0100; in2 = 4'b0110;
    #100 $stop;

    end

  BCDAdder U1 (Sum, Carr, in1, in2);

endmodule
