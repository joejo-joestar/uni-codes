/*
  Code can be found here: https://edaplayground.com/x/JUEf
*/

// main program
module Decoder2to4 (op, in, en);

  output[3:0] op;
  input [1:0]in;
  input en;

  assign op[0] = en & (~in[1] & ~in[0]);
  assign op[1] = en & (~in[1] & in[0]);
  assign op[2] = en & (in[1] & ~in[0]);
  assign op[3] = en & (in[1] & in[0]);

endmodule

module Decoder4to16 (op, in);

  output[15:0] op;
  input[3:0] in;
  wire[3:0] en;

  Decoder2to4 D0 (en[3:0], in[3:2], 1'b1);
  Decoder2to4 D1 (op[3:0], in[1:0], en[0]);
  Decoder2to4 D2 (op[7:4], in[1:0], en[1]);
  Decoder2to4 D3 (op[11:8], in[1:0], en[2]);
  Decoder2to4 D4 (op[15:12], in[1:0], en[3]);

endmodule


// testbench
module tb_Decoder4to16;

  reg [3:0]in;
  wire [15:0]op;

  initial begin

  // $dumpfile ("dump.vcd"); //only needed if using the online compiler
  // $dumpvars (1, tb_Decoder4to16); //only needed if using the online compiler

    #00 in = 4'b0000;
    #10 in = 4'b0001;
    #10 in = 4'b0010;
    #10 in = 4'b0011;
    #10 in = 4'b0100;
    #10 in = 4'b0101;
    #10 in = 4'b0110;
    #10 in = 4'b0111;
    #10 in = 4'b1000;
    #10 in = 4'b1001;
    #10 in = 4'b1010;
    #10 in = 4'b1011;
    #10 in = 4'b1100;
    #10 in = 4'b1101;
    #10 in = 4'b1110;
    #10 in = 4'b1111;
    #10 $stop;

  end

  Decoder4to16 U1 (op, in);

endmodule
