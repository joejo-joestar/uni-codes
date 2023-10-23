/*
  Code can be found here: https://edaplayground.com/x/kyN3
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

module mux4to1 (op, ip, sIp);

  output op;
  input[3:0] ip;
  input[1:0] sIp;
  wire[1:0] w;

  mux2to1 mux1 (w[1], ip[3:2], sIp[0]);
  mux2to1 mux2 (w[0], ip[1:0], sIp[0]);
  mux2to1 mux3 (op, w, sIp[1]);

endmodule


// testbench
module tb_mux4to1;

  reg[3:0] ip;
  reg[1:0] sIp;
  wire op;

  initial begin

    $dumpfile ("dump.vcd"); //only needed if using the online compiler
    $dumpvars (1, tb_mux4to1); //only needed if using the online compiler

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