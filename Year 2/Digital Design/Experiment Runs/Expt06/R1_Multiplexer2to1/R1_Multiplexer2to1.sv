
module mux2to1 (op, ip, sIp);

  output op;
  wire p, q;
  input[1:0] ip;
  input sIp;

  assign p = ip[1] & (~sIp);
  assign q = ip[0] & (sIp);
  assign op = p | q;

endmodule

// no testbech because this code is to program an fpga
// refer to the Pin Planner Diagram readme file
