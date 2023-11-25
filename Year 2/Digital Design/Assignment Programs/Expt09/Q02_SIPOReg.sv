/*
  Code can be found here: https://edaplayground.com/x/dnt2
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

module SIPOReg (
    parallelOut,
    serialIn,
    clk,
    rst
);

  input clk, serialIn, rst;
  output reg [3:0] parallelOut;

  DFF D3 (
      parallelOut[3],
      serialIn,
      rst,
      clk
  );

  DFF D2 (
      parallelOut[2],
      parallelOut[3],
      rst,
      clk
  );

  DFF D1 (
      parallelOut[1],
      parallelOut[2],
      rst,
      clk
  );

  DFF D0 (
      parallelOut[0],
      parallelOut[1],
      rst,
      clk
  );

endmodule



// testbench
module tb_SIPOReg;
  reg clk, serialIn, rst;
  wire [3:0] parallelOut;

  initial begin


    $dumpfile("dump.vcd");
    $dumpvars(1, tb_SIPOReg);

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

  SIPOReg U1 (
      parallelOut,
      serialIn,
      clk,
      rst
  );

endmodule
