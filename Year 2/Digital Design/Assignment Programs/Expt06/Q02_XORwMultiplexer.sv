/*
  Code can be found here: https://edaplayground.com/x/Jj7D
*/

// main program
module mux2to1 (op, ip, sIp);

  output op;
  wire p, q;
  input[1:0] ip;
  input sIp;

  assign p = ip[0] & (~sIp);
  assign q = ip[1] & (sIp);
  assign op = p | q;

endmodule

module XORGate (op, ip1, ip2);

  output op;
  input ip1, ip2;
  wire[1:0] w;

  mux2to1 mux1 (w[1], 2'b01, ip1);
  mux2to1 mux2 (w[0], 2'b10, ip1);
  mux2to1 mux2 (op, w, ip2);


endmodule


// testbench
module tb_XORGate;

  reg ip1, ip2;
  wire op;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_XORGate); //only needed if using the online compiler

    // #00 ip1 = 0; ip2 = 0;
    // #10 ip1 = 0; ip2 = 1;
    // #10 ip1 = 1; ip2 = 0;
    // #10 ip1 = 1; ip2 = 1;
    // #10 $stop;

  end

  XORGate U1 (op, ip1, ip2);

endmodule