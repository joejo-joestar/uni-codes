module JKFlipFlop (input j, k, clk, output reg op) ;

  always @(posedge clk) begin

    case ({j, k})

      2'b00: op = op;
      2'b01: op = 0;
      2'b10: op = 1;
      2'b11: op = ~op;

    endcase

  end

endmodule

// no testbech because this code is to program an fpga
// refer to the Pin Planner Diagram readme file
