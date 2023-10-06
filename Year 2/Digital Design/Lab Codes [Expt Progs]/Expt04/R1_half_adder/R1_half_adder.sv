
module half_adder(S, C, A, B);

  output S, C;
  input A, B;

  assign S = A ^ B;
  assign C = A & B;

endmodule

// no testbech because this code is to program an fpga
// refer to the Pin Planner Diagram readme file
