/*
  Code can be found here: https://edaplayground.com/x/QDus
*/

// main program
module Generate_Parity (z, m);
  input[3:0] m;
  wire p;
  output z;

  assign p = ~m[0];
  assign z = m[3] ^ m[2] ^ m[1] ^ m[0];

endmodule


// testbench
module tb_Generate_Parity;

  reg[3:0] m;
  wire P;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_Generate_Parity); //only needed if using the online compiler

  #00 m = 4'b0000;
  #10 m = 4'b0001;
  #10 m = 4'b0010;
  #10 m = 4'b0011;
  #10 m = 4'b0100;
  #10 m = 4'b0101;
  #10 m = 4'b0110;
  #10 m = 4'b0111;
  #10 m = 4'b1000;
  #10 m = 4'b1001;
  #10 m = 4'b1010;
  #10 m = 4'b1011;
  #10 m = 4'b1100;
  #10 m = 4'b1101;
  #10 m = 4'b1110;
  #10 m = 4'b1111;
  #10 $stop;
  

  end

  Generate_Parity U1 (P, m);

endmodule
