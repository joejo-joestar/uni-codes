/*
  Code can be found here: https://edaplayground.com/x/HMVL
*/

// main program
module Decoder (op, inp);

  input [2:0] inp;
  output reg [7:0] op;

  always @(inp) begin

    case(inp)

      3'b000 : op = 8'b00000001;
      3'b001 : op = 8'b00000010;
      3'b010 : op = 8'b00000100;
      3'b011 : op = 8'b00001000;
      3'b100 : op = 8'b00010000;
      3'b101 : op = 8'b00100000;
      3'b110 : op = 8'b01000000;
      3'b111 : op = 8'b10000000;
      default : op = 8'bxxxxxxx;

    endcase

  end

endmodule

// testbench
module tb_Decoder;

  reg[2:0] ip;
  wire[7:0] op;

  initial begin

    $dumpfile ("dump.vcd"); //only needed if using the online compiler
    $dumpvars (1, tb_Decoder); //only needed if using the online compiler

    #000 ip = 3'b000;
    #100 ip = 3'b001;
    #100 ip = 3'b010;
    #100 ip = 3'b011;
    #100 ip = 3'b100;
    #100 ip = 3'b101;
    #100 ip = 3'b110;
    #100 ip = 3'b111;
    #100 $stop;

  end

  Decoder U1 (op, ip);

endmodule
