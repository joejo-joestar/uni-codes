/*
  Code can be found here: https://edaplayground.com/x/RsQs
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

module FullSubtractor (diff, bOut, ip, bIn);

  output diff, bOut;
  input[1:0] ip;
  input bIn;
  
  mux4to1 mux1 (diff, {bIn, ~bIn, ~bIn, bIn}, ip);
  mux4to1 mux2 (bOut, {bIn, 2'b10, bIn}, ip);

endmodule


// testbench
module tb_FullSubtractor;

  reg[1:0] ip;
  reg bIn;
  wire diff, bOut;

  initial begin

    $dumpfile ("dump.vcd"); //only needed if using the online compiler
    $dumpvars (1, tb_FullSubtractor); //only needed if using the online compiler

  #00 ip = 3'b00; bIn = 0;
  #10 ip = 3'b00; bIn = 1;
  #10 ip = 3'b01; bIn = 0;
  #10 ip = 3'b01; bIn = 1;
  #10 ip = 3'b10; bIn = 0;
  #10 ip = 3'b10; bIn = 1;
  #10 ip = 3'b11; bIn = 0;
  #10 ip = 3'b11; bIn = 1;
  #10 $stop;
  
  end

  FullSubtractor U1 (diff, bOut, ip, bIn);

endmodule