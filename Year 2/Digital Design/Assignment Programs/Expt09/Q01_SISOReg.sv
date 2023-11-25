/*
  Code can be found here: https://edaplayground.com/x/EgYJ
*/

// main program
module DFF (
    q,
    d,
    rst,
    clk
);

  input d, rst, clk;
  output reg q;

  always @(negedge clk, negedge rst) begin
    if (rst) q <= 1'b0;

    else q <= d;

  end

endmodule

module SISOReg (
    q3,
    q2,
    q1,
    serialOut,
    serialIn,
    clk,
    rst
);

  input clk, serialIn, rst;
  output reg q3, q2, q1, serialOut;

  DFF D3 (
      q3,
      serialIn,
      rst,
      clk
  );

  DFF D2 (
      q2,
      q3,
      rst,
      clk
  );

  DFF D1 (
      q1,
      q2,
      rst,
      clk
  );

  DFF D0 (
      serialOut,
      q1,
      rst,
      clk
  );

endmodule



// testbench
module tb_SISOReg;
  reg clk, serialIn, rst;
  wire q3, q2, q1, serialOut;

  initial begin


    $dumpfile("dump.vcd");
    $dumpvars(1, tb_SISOReg);

    #00 clk = 1;

    forever #5 clk = ~clk;

  end

  initial begin
    #00 rst = 1;
    #05 serialIn = 0;
    rst = 0;
    #40 serialIn = 1;
    rst = 0;
    #40 serialIn = 0;
    rst = 0;
    #40 $stop;


  end

  SISOReg U1 (
      q3,
      q2,
      q1,
      serialOut,
      serialIn,
      clk,
      rst
  );

endmodule
