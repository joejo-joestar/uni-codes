/*
  Code can be found here: https://edaplayground.com/x/kWbS
*/

// main program
module Half_Subtractor (D, B_out, A, B);

  output D, B_out;
  input A, B;

  assign D = A ^ B;
  assign B_out = ((~ A) & B);

endmodule


// testbench
module tb_Half_Subtractor;

  reg a, b;
  wire diff, borr;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_Half_Subtractor); //only needed if using the online compiler

    #000 a = 0; b = 0;
    #100 a = 0; b = 1;
    #100 a = 1; b = 0;
    #100 a = 1; b = 1;
    #100 $stop;

    end

  Half_Subtractor U1 (diff, borr, a, b);

endmodule
