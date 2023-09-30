/*
  Code can be found here: https://edaplayground.com/x/cMrD
*/

// main progam
module Half_Adder (S, C, A, B);

  output S, C;
  input A, B;

  assign S = A ^ B;
  assign C = A & B;

endmodule

module Full_Adder (S, C_out, A, B);

  output S, C_out;
  input A, B;
  wire C_in, S1;

  Half_Adder HA1 (S1, C_in, A, B);
  Half_Adder HA2 (S, C_out, S1, C_in);

endmodule


// testbench
module tb_Full_Adder;

  reg a, b;
  wire sum, carry;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_Full_Adder); //only needed if using the online compiler

    #000 a = 0; b = 0;
    #100 a = 0; b = 1;
    #100 a = 1; b = 0;
    #100 a = 1; b = 1;
    #100 $stop;

    end

  Full_Adder U1 (sum, carry, a, b);

endmodule
