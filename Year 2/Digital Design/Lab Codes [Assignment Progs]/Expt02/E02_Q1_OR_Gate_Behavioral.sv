/*
  Code can be found here: https://edaplayground.com/x/LqTN
*/

// main program
module OR_Gate (output reg Z, input E, F);

  always @ (E or F) begin

    if (E==0 & F==0)
      #10 Z = 0;

    else
      #10 Z = 1;

  end

endmodule


// testbench
module tb_OR_Gate;

  reg p, q;
  wire r;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_OR_Gate); //only needed if using the online compiler

    // #000 p = 0; q = 0;
    // #100 p = 0; q = 1;
    // #100 p = 1; q = 0;
    // #100 p = 1; q = 1;
    // #100 $stop;

  end

  OR_Gate U1 (r, p, q);

endmodule
