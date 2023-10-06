/*
  Code can be found here: https://edaplayground.com/x/dw6w
*/

// main program
module Full_Adder (S, C_out, A, B, C_in);

  output S, C_out;
  input A, B, C_in;

  assign S = A ^ B ^ C_in;
  assign C_out = (C_in & (A ^ B)) | (A & B);

endmodule


// testbench
module tb_Full_Adder;

  reg a, b, c_in;
  wire sum, c;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_Full_Adder); //only needed if using the online compiler

    #000 a = 0; b = 0; c_in = 0;
    #100 a = 0; b = 0; c_in = 1;
    #100 a = 0; b = 1; c_in = 0;
    #100 a = 0; b = 1; c_in = 1;
    #100 a = 1; b = 0; c_in = 0;
    #100 a = 1; b = 0; c_in = 1;
    #100 a = 1; b = 1; c_in = 0;
    #100 a = 1; b = 1; c_in = 1;
    #100 $stop;

    end

  Full_Adder U1 (sum, carry, a, b, c_in);

endmodule
