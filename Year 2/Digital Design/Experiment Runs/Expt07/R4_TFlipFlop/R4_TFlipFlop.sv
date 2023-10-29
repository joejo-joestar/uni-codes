module TFlipFlop (input t, clk, output reg q, qBar) ;

  wire w1, w2;

  nand N1 (w1, clk, qBar, t);
  nand N2 (w2, clk, q, t);
  nand N3 (q, w1, qBar);
  nand N4 (qBar, w2, q);

endmodule

// no testbech because this code is to program an fpga
// refer to the Pin Planner Diagram readme file


// testbench
module tb_TFlipFLop;

reg t, clk;
wire q, qBar;

  initial begin

  $dumpfile("dump.vcd"); //only needed if using the online compiler
  $dumpvars(1, tb_TFlipFLop); //only needed if using the online compiler

  #00 clk = 0; t = 0;
  #10 clk = 0; t = 1;
  #10 clk = 1; t = 0;
  #10 clk = 1; t = 1;
  #10 $stop;
  
  end

  TFlipFLop U1 (t, clk, q, qBar);

endmodule