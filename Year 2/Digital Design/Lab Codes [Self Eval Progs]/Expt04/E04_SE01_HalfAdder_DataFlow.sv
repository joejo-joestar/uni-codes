/*
  Code can be found here: https://edaplayground.com/x/dw6w
*/

// main progam
module Half_Adder (S, C, A, B);

  output S, C;
  input A, B;

  assign S = A ^ B;
  assign C = ~ (A & B);

endmodule


// testbench
module tb_Half_Adder;

  reg a, b;
  wire sum, carry;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_Half_Adder); //only needed if using the online compiler

    #000 a = 0; b = 0;
    #100 a = 0; b = 1;
    #100 a = 1; b = 0;
    #100 a = 1; b = 1;
    #100 $stop;

    end

  Half_Adder U1 (sum, carry, a, b);

endmodule
