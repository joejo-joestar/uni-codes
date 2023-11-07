/*
  Code can be found here: https://edaplayground.com/x/NFpZ
*/

// main program
module ckt (input A, B, output reg C);
  assign C = A ? B : C;

endmodule


// testbench
module tb_ckt;

  reg A, B;
  wire C;

    initial begin

    $dumpfile("dump.vcd");
    $dumpvars(1, tb_ckt);

    #00 A = 0; B = 0;
    #10 A = 0; B = 1;
    #10 A = 1; B = 0;
    #10 A = 1; B = 1;
    #10 A = 0; B = 0;
    #10 A = 0; B = 1;
    #10 A = 1; B = 0;
    #10 A = 1; B = 1;
    #10 $stop;

    end

    ckt u1 (A, B, C)

endmodule
