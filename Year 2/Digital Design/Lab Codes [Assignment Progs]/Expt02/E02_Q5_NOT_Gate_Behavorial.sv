/*
Code can be found here: https://edaplayground.com/x/tRk7
*/

//main program
module NOT_Gate (output reg Z, input A);

  always @ (A) begin

    if (A == 0)
      #1 Z = 1;

    else
      #1 Z = 0;

  end

endmodule


//testbench
module tb_NOT_Gate;

  reg p;
  wire r;

  initial begin

		// $dumpfile ("dump.vcd"); //only needed if using the online compiler
		// $dumpvars (1, tb_NOT_Gate); //only needed if using the online compiler

    #000 p = 0;
    #100 p = 1;
    #100 $stop;

  end

  NOT_Gate U1 (r, p);

endmodule
