module SRLatch (s, r, clk, q, qBar);

  input s, r, clk;
  output reg q, qBar;

  wire s1, r1;

  nand N1 (s1, s, clk);
  nand N2 (r1, r, clk);
  nand N3 (qBar, q, r1);
  nand N4 (q, qBar, s1);

endmodule

// no testbech because this code is to program an fpga
// refer to the Pin Planner Diagram readme file
