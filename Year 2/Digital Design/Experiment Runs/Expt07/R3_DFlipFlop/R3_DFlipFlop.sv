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

// no testbech because this code is to program an fpga
// refer to the Pin Planner Diagram readme file
