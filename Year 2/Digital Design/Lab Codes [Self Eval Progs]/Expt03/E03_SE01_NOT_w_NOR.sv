/*
  Code can be found here: https://edaplayground.com/x/Jq8_
*/

// main program
module NOR_Gate (output reg Z, input A);

  nor #1 NA1 (Z, A, A);

endmodule


// testbench
module tb_NOR_Gate;

  reg p;
  wire r;

  initial begin

	  // $dumpfile ("dump.vcd"); //only needed if using the online compiler
	  // $dumpvars (1, tb_NOR_Gate); //only needed if using the online compiler

    #000 p = 0;
    #100 p = 1;
    #100 $stop;

  end

  NOR_Gate U1 (r, p);

endmodule
