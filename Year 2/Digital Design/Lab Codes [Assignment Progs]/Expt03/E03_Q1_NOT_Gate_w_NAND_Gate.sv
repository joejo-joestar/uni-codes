/*
Code can be found here: https://edaplayground.com/x/McG_
*/

//main program
module NAND_Gate (output reg Z, input A);

  nand #1 NA1 (Z, A, A);

endmodule


//testbench
module tb_NAND_Gate;

  reg p;
  wire r;

  initial begin

	  // $dumpfile ("dump.vcd"); //only needed if using the online compiler
	  // $dumpvars (1, tb_NAND_Gate); //only needed if using the online compiler

    #000 p = 0;
    #100 p = 1;
    #100 $stop;

  end

  NAND_Gate U1 (r, p);

endmodule
