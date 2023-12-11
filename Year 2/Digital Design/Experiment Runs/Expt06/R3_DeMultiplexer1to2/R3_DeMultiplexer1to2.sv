// main program
module dmux1to2 (op, ip, sIp);

  output[1:0] op;
  input ip;
  input sIp;

  assign op[1] = ip & (~sIp);
  assign op[0] = ip & (sIp);

endmodule

// no testbech because this code is to program an fpga
// refer to the Pin Planner Diagram readme file
