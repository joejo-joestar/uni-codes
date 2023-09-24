/*
Code can be found here: https://edaplayground.com/x/rV_q
*/

//main program
module Generate_Parity (z, a, b, c, d);
  input a, b, c, d;
  output z;
  
  assign z = a ^ b ^ c ^ d;
  
endmodule 


//testbench
module tb_Generate_Parity;
  
  reg m0, m1, m2, m3;
  wire P;
  
  initial begin
    
    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_Generate_Parity); //only needed if using the online compiler
    
    #000 m0 = 0; m1 = 0; m2 = 0; m3 = 0;
    #100 m0 = 0; m1 = 0; m2 = 0; m3 = 1;
    #100 m0 = 0; m1 = 0; m2 = 1; m3 = 0;
    #100 m0 = 0; m1 = 0; m2 = 1; m3 = 1;
    #100 m0 = 0; m1 = 1; m2 = 0; m3 = 0;
    #100 m0 = 0; m1 = 1; m2 = 0; m3 = 1;
    #100 m0 = 0; m1 = 1; m2 = 1; m3 = 0;
    #100 m0 = 0; m1 = 1; m2 = 1; m3 = 1;
    #100 m0 = 1; m1 = 0; m2 = 0; m3 = 0;
    #100 m0 = 1; m1 = 0; m2 = 0; m3 = 1;
    #100 m0 = 1; m1 = 0; m2 = 1; m3 = 0;
    #100 m0 = 1; m1 = 0; m2 = 1; m3 = 1;
    #100 m0 = 1; m1 = 1; m2 = 0; m3 = 0;
    #100 m0 = 1; m1 = 1; m2 = 0; m3 = 1;
    #100 m0 = 1; m1 = 1; m2 = 1; m3 = 0;
    #100 m0 = 1; m1 = 1; m2 = 1; m3 = 1;
    #100 $stop;
    
  end
  
  Generate_Parity U1 (P, m0, m1, m2, m3);
  
endmodule
