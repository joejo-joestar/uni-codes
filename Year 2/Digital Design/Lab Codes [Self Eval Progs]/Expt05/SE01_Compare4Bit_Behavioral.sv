/*
  Code can be found here: https://edaplayground.com/x/Mtse
*/

// main program
module Compare4Bit (low, equal, great, in1, in2) ;

  output reg low, equal, great;
  input[3:0] in1, in2;

  always @ (in1 or in2) begin

  if (in1 > in2) begin

    low = 0;
    equal = 0;
    great = 1;

  end

  else if (in1 == in2) begin

    low = 0;
    equal = 1;
    great = 0;

  end

  else if (in1 < in2) begin

    low = 1;
    equal = 0;
    great = 0;

  end

  else begin

    low = 0;
    equal = 0;
    great = 0;

  end

  end

endmodule


// testbech
module tb_Compare4Bit;

  reg [3:0]inp1, inp2;
  wire low, equal, great;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_Compare4Bit); //only needed if using the online compiler

    #000 inp1 = 4'b1011; inp2 = 4'b0101;
    #100 inp1 = 4'b0110; inp2 = 4'b0110;
    #100 inp1 = 4'b0111; inp2 = 4'b1110;
    #100 inp1 = 4'b1101; inp2 = 4'b1001;
    #100 inp1 = 4'b1010; inp2 = 4'b1010;
    #000 inp1 = 4'b1001; inp2 = 4'b1010;
    #100 $stop;

  end

  Compare4Bit U1 (low, equal, great, inp1, inp2);

endmodule
