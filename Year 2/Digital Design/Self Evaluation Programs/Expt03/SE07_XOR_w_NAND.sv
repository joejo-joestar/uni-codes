/*
  Code can be found here: https://edaplayground.com/x/hzDc
*/

// main program
module NAND_Gate (Z, A, B);

  output Z;
  input A, B;
  wire p, q, r;

  nand #1 NA1 (p, A, B);
  nand #1 NA2 (q, p, A);
  nand #1 NA3 (r, p, B);
  nand #1 NA4 (Z, q, r);

endmodule


// testbench
module tb_NAND_Gate;

    reg in_1, in_2;
    wire op;

    initial begin

      // $dumpfile ("dump.vcd"); //only needed if using the online compiler
      // $dumpvars (1, tb_NAND_Gate); //only needed if using the online compiler

      #000 in_1 = 0; in_2 = 0;
      #100 in_1 = 0; in_2 = 1;
      #100 in_1 = 1; in_2 = 0;
      #100 in_1 = 1; in_2 = 1;
      #100 $stop;

    end

  NAND_Gate U1 (op, in_1, in_2);

endmodule
