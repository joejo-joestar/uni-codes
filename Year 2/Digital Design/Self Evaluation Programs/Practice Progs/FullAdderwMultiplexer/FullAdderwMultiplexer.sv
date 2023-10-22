/*
  Code can be found here: https://edaplayground.com/x/N8wQ
*/

// main program
module mux4to1 (op, ip, sIp);

  output op;
  wire[3:0] w;
  input[3:0] ip;
  input[1:0] sIp;

  assign w[0] = ip[3] & (~sIp[1]) & (~sIp[0]);
  assign w[1] = ip[2] & (~sIp[1]) & (sIp[0]);
  assign w[2] = ip[1] & (sIp[1]) & (~sIp[0]);
  assign w[3] = ip[0] & (sIp[1]) & (sIp[0]);
  assign op = w[0] | w[1] | w[2] | w[3];

endmodule

module FullAdder (sum, cOut, ip, cIn);

  output sum, cOut;
  input[1:0] ip;
  input cIn;
  
  mux4to1 mux1 (sum, {cIn, ~cIn, ~cIn, cIn}, ip);
  mux4to1 mux2 (cOut, {1'b0, cIn, cIn, 1'b1}, ip);

endmodule


// testbench
module tb_FullAdder;

  reg[1:0] ip;
  reg cIn;
  wire sum, cOut;

  initial begin

    $dumpfile ("dump.vcd"); //only needed if using the online compiler
    $dumpvars (1, tb_FullAdder); //only needed if using the online compiler

  #00 ip = 3'b00; cIn = 0;
  #10 ip = 3'b00; cIn = 1;
  #10 ip = 3'b01; cIn = 0;
  #10 ip = 3'b01; cIn = 1;
  #10 ip = 3'b10; cIn = 0;
  #10 ip = 3'b10; cIn = 1;
  #10 ip = 3'b11; cIn = 0;
  #10 ip = 3'b11; cIn = 1;
  #10 $stop;
  
  end

  FullAdder U1 (sum, cOut, ip, cIn);

endmodule