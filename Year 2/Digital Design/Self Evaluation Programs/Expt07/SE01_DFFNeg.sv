/*
  Code can be found here: https://edaplayground.com/x/tqNx
*/

// main program
module DFFNeg(q, clk, clr, pre, d);
  output q;
  input clk, clr, pre, d;

  always @(negedge clk, negedge clr, negedge pre) begin
    if(~clr) q <= 0;
    else if(~pre) q <= 1;
    else if(~clk) q <= d;
    else q <= q;

  end

endmodule


// testbench
module tb_DFFNeg;

reg d, clk, clr, pre;
wire q;

  initial begin

    $dumpfile("dump.vcd"); //only needed if using the online compiler
    $dumpvars(1, tb_DFFNeg); //only needed if using the online compiler

    #00 clr = 0; pre = 1;
    #10 clr = 1; pre = 0;
    #10 clr = 1; pre = 1;
    #10  d = 0; clk = 0;
    #10  d = 1; clk = 1;
    #10  d = 1; clk = 0;
    #10  d = 1; clk = 1;
    #10  d = 0; clk = 0;
    #10  d = 1; clk = 1;
    #10 $stop;

  end

  DFFNeg U1 (q, clk, clr, pre, d);

endmodule
