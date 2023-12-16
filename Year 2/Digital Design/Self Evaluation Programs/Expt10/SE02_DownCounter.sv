/*
  Code can be found here: https://edaplayground.com/x/hcf4
*/

// main program
module DownCount(q, rst, clk);
  output reg[3:0] q;
  input rst, clk;

  always @(negedge clk or rst) begin
    if (rst) q <= 4'b1111;
    else q = q - 1;

  end

endmodule


// testbench
module tb_DownCount;
  reg clk, rst;
  wire[3:0] q;

  initial begin
    $dumpfile("dump.vcd"); //only needed if using the online compiler
    $dumpvars(1, tb_DownCount); //only needed if using the online compiler

    #00 clk = 0;
      forever #5 clk = ~clk;

  end

  initial begin
  #00 rst = 1;
  #05 rst = 0;
  #300 $stop;

  end

  DownCount U1 (q, rst, clk);

endmodule