/*
  Code can be found here: https://edaplayground.com/x/qHeW
*/

// main program
module DFlipFLop (q, d, clk, rst);

  input d, rst, clk;
  output reg q;

  always @ (posedge clk, negedge rst) begin
    if (rst)
      q <= 1'b0;

    else
      q <= d;

  end

endmodule


module TFlipFlop (q, rst, clk);

  output q;
  input rst, clk;
  wire qBar;

  DFlipFLop dff0 (q, qBar, clk, rst);
  not n (qBar, q);

endmodule


// testbench
module tb_TFlipFlop;

reg t, clk;
wire q;

  initial begin

    $dumpfile("dump.vcd"); //only needed if using the online compiler
    $dumpvars(1, tb_TFlipFlop); //only needed if using the online compiler

    #00  t = 0; clk = 0;
    #10  t = 1; clk = 1;
    #10  t = 1; clk = 0;
    #10  t = 1; clk = 1;
    #10  t = 1; clk = 0;
    #10  t = 1; clk = 1;
    #10 $stop;

  end

  TFlipFlop U1 (q, clk, t);

endmodule
