/*
Code can be found here: https://edaplayground.com/x/wcLz
*/

//main program
module Ones_Comp (output reg Res, input Bit);

  always @ (Bit) begin

    if (Bit == 0)
      #1 Res = 1;

    else
      #1 Res = 0;

  end

endmodule


//testbench
module tb_Ones_Comp;

  reg p;
  wire r;

  initial begin

		// $dumpfile ("dump.vcd"); //only needed if using the online compiler
		// $dumpvars (1, tb_Ones_Comp); //only needed if using the online compiler

    // binary number: 10111011

    #00 p = 1;
    #50 p = 0;
    #50 p = 1;
    #50 p = 1;
    #50 p = 1;
    #50 p = 0;
    #50 p = 1;
    #50 p = 1;
    #50 $stop;

  end

  Ones_Comp U1 (r, p);

endmodule
