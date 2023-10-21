/*
  Code can be found here: https://edaplayground.com/x/UEgD
*/

// main program
module Encoder (op, inp);

  input [7:0] inp;
  output reg [2:0] op;

  always @(inp) begin

    case(inp)

      8'b00000001 : op = 3'b000;
      8'b00000010 : op = 3'b001;
      8'b00000100 : op = 3'b010;
      8'b00001000 : op = 3'b011;
      8'b00010000 : op = 3'b100;
      8'b00100000 : op = 3'b101;
      8'b01000000 : op = 3'b110;
      8'b10000000 : op = 3'b111;

      default : op = 3'bxxx;

    endcase

  end

endmodule

// testbench
module tb_Encoder;

  reg[7:0] ip;
  wire[2:0] op;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_Encoder); //only needed if using the online compiler

    // #000 ip = 8'b00000001;
    // #100 ip = 8'b00000010;
    // #100 ip = 8'b00000100;
    // #100 ip = 8'b00001000;
    // #100 ip = 8'b00010000;
    // #100 ip = 8'b00100000;
    // #100 ip = 8'b01000000;
    // #100 ip = 8'b10000000;
    // #100 $stop;

  end

  Encoder U1 (op, ip);

endmodule
