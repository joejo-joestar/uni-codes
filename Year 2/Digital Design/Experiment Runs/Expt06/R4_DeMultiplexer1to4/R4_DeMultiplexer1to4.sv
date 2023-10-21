
module dmux1to4 (op, ip, sIp);

  output[3:0] op;
  input ip;
  input[1:0] sIp;

  assign op[0] = ip & (~sIp[1]) & (~sIp[0]);
  assign op[1] = ip & (~sIp[1]) & (sIp[0]);
  assign op[2] = ip & (sIp[1]) & (~sIp[0]);
  assign op[3] = ip & (sIp[1]) & (sIp[0]);

endmodule

// no testbech because this code is to program an fpga
// refer to the Pin Planner Diagram readme file
