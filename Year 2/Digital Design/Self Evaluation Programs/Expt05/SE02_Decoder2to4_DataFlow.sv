/*
  Code can be found here: https://edaplayground.com/x/BMre
*/

// main program
module Decoder (op, ip, Enable);

  output [3:0]op;
  input [1:0]ip;
  input Enable;

  assign op[0] = ~(ip[1] & ip[0] & Enable);
  assign op[1] = ~(ip[1] & ~ip[0] & Enable);
  assign op[2] = ~(~ip[1] & ip[0] & Enable);
  assign op[3] = ~(~ip[1] & ~ip[0] & Enable);

endmodule

// testbench
module tb_Decoder;

  reg [1:0]ip, Enable;
  wire [3:0]op;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_Decoder); //only needed if using the online compiler

    #000 ip = 2'b00; Enable = 1;
    #100 ip = 2'b01; Enable = 1;
    #100 ip = 2'b10; Enable = 1;
    #100 ip = 2'b11; Enable = 1;
    #100 ip = 2'b00; Enable = 0;
    #100 ip = 2'b01; Enable = 0;
    #100 ip = 2'b10; Enable = 0;
    #100 ip = 2'b11; Enable = 0;
    #100 $stop;

  end

  Decoder U1 (op, ip, Enable);

endmodule
