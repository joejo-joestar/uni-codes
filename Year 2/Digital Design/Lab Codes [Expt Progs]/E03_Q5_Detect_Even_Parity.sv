/*
Code can be found here: https://edaplayground.com/x/LqTN
*/

//main program
module Detect_Parity (z, a, b, c);
  input a, b, c;
  output z;
  
  assign z = a ^ b ^ c;
  
endmodule 


//testbench
module tb_Detect_Parity;
  
  reg m0, m1, m2;
  wire P;
  
  initial begin
    
    $dumpfile ("dump.vcd");
    $dumpvars (1, tb_Detect_Parity);
    
    //binary number	: 10111011
    //1's comp 		: 01000100
    //2's comp 		: 01000101
    
    #000 m0 = 0; m1 = 0; m2 = 0;
    #100 m0 = 0; m1 = 0; m2 = 1;
    #100 m0 = 0; m1 = 1; m2 = 0;
    #100 m0 = 0; m1 = 1; m2 = 1;
    #100 m0 = 1; m1 = 0; m2 = 0;
    #100 m0 = 1; m1 = 0; m2 = 1;
    #100 m0 = 1; m1 = 1; m2 = 0;
    #100 m0 = 1; m1 = 1; m2 = 1;
    #100 $stop;
    
  end
  
  Detect_Parity U1 (P, m0, m1, m2);
  
endmodule
