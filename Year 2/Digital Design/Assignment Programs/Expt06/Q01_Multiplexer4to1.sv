/*
  Code can be found here: https://edaplayground.com/x/ZYL6
*/

// main program
module mux4to1 (op, ip, sIp);

  output op;
  wire[3:0] w;
  input[3:0] ip;
  input[1:0] sIp;

  assign w[0] = ip[0] & (~sIp[1]) & (~sIp[0]);
  assign w[1] = ip[1] & (~sIp[1]) & (sIp[0]);
  assign w[2] = ip[2] & (sIp[1]) & (~sIp[0]);
  assign w[3] = ip[3] & (sIp[1]) & (sIp[0]);
  assign op = w[0] | w[1] | w[2] | w[3];

endmodule


// testbench
module tb_mux4to1;

  reg[3:0] ip;
  reg[1:0] sIp;
  wire op;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_mux4to1); //only needed if using the online compiler

    // #00 ip = 4'b0000; sIp = 2'b00;
    // #10 ip = 4'b0001; sIp = 2'b00;
    // #10 ip = 4'b0010; sIp = 2'b00;
    // #10 ip = 4'b0011; sIp = 2'b00;
    // #10 ip = 4'b0100; sIp = 2'b00;
    // #10 ip = 4'b0101; sIp = 2'b00;
    // #10 ip = 4'b0110; sIp = 2'b00;
    // #10 ip = 4'b0111; sIp = 2'b00;
    // #10 ip = 4'b1000; sIp = 2'b00;
    // #10 ip = 4'b1001; sIp = 2'b00;
    // #10 ip = 4'b1010; sIp = 2'b00;
    // #10 ip = 4'b1011; sIp = 2'b00;
    // #10 ip = 4'b1100; sIp = 2'b00;
    // #10 ip = 4'b1101; sIp = 2'b00;
    // #10 ip = 4'b1110; sIp = 2'b00;
    // #10 ip = 4'b1111; sIp = 2'b00;

    // #00 ip = 4'b0000; sIp = 2'b01;
    // #10 ip = 4'b0001; sIp = 2'b01;
    // #10 ip = 4'b0010; sIp = 2'b01;
    // #10 ip = 4'b0011; sIp = 2'b01;
    // #10 ip = 4'b0100; sIp = 2'b01;
    // #10 ip = 4'b0101; sIp = 2'b01;
    // #10 ip = 4'b0110; sIp = 2'b01;
    // #10 ip = 4'b0111; sIp = 2'b01;
    // #10 ip = 4'b1000; sIp = 2'b01;
    // #10 ip = 4'b1001; sIp = 2'b01;
    // #10 ip = 4'b1010; sIp = 2'b01;
    // #10 ip = 4'b1011; sIp = 2'b01;
    // #10 ip = 4'b1100; sIp = 2'b01;
    // #10 ip = 4'b1101; sIp = 2'b01;
    // #10 ip = 4'b1110; sIp = 2'b01;
    // #10 ip = 4'b1111; sIp = 2'b01;

    // #00 ip = 4'b0000; sIp = 2'b10;
    // #10 ip = 4'b0001; sIp = 2'b10;
    // #10 ip = 4'b0010; sIp = 2'b10;
    // #10 ip = 4'b0011; sIp = 2'b10;
    // #10 ip = 4'b0100; sIp = 2'b10;
    // #10 ip = 4'b0101; sIp = 2'b10;
    // #10 ip = 4'b0110; sIp = 2'b10;
    // #10 ip = 4'b0111; sIp = 2'b10;
    // #10 ip = 4'b1000; sIp = 2'b10;
    // #10 ip = 4'b1001; sIp = 2'b10;
    // #10 ip = 4'b1010; sIp = 2'b10;
    // #10 ip = 4'b1011; sIp = 2'b10;
    // #10 ip = 4'b1100; sIp = 2'b10;
    // #10 ip = 4'b1101; sIp = 2'b10;
    // #10 ip = 4'b1110; sIp = 2'b10;
    // #10 ip = 4'b1111; sIp = 2'b10;

    // #00 ip = 4'b0000; sIp = 2'b11;
    // #10 ip = 4'b0001; sIp = 2'b11;
    // #10 ip = 4'b0010; sIp = 2'b11;
    // #10 ip = 4'b0011; sIp = 2'b11;
    // #10 ip = 4'b0100; sIp = 2'b11;
    // #10 ip = 4'b0101; sIp = 2'b11;
    // #10 ip = 4'b0110; sIp = 2'b11;
    // #10 ip = 4'b0111; sIp = 2'b11;
    // #10 ip = 4'b1000; sIp = 2'b11;
    // #10 ip = 4'b1001; sIp = 2'b11;
    // #10 ip = 4'b1010; sIp = 2'b11;
    // #10 ip = 4'b1011; sIp = 2'b11;
    // #10 ip = 4'b1100; sIp = 2'b11;
    // #10 ip = 4'b1101; sIp = 2'b11;
    // #10 ip = 4'b1110; sIp = 2'b11;
    // #10 ip = 4'b1111; sIp = 2'b11;
    // #10 $stop;

  end

  mux4to1 U1 (op, ip, sIp);

endmodule
