/*
Code can be found here: https://edaplayground.com/x/LqTN
*/

//main program
module XOR_Gate (output reg Z, input A, B, C);
  
  xor #10 XOR1 (Z, A, B, C);
  
endmodule


//testbench
module tb_XOR_Gate;
  
  reg p, q, r;
  wire s;
  
  initial begin
      
		//$dumpfile ("dump.vcd"); //only needed if using the online compiler
		//$dumpvars (1, tb_XOR_Gate); //only needed if using the online compiler
    
    #000 p = 0; q = 0; r = 0;
    #100 p = 0; q = 0; r = 1;
    #100 p = 0; q = 1; r = 0;
    #100 p = 0; q = 1; r = 1;
    #100 p = 1; q = 0; r = 0;
    #100 p = 1; q = 0; r = 1;
    #100 p = 1; q = 1; r = 0;
    #100 p = 1; q = 1; r = 1;
    #100 $stop;
    
  end
  
  XOR_Gate U1 (s,p, q, r);
  
endmodule
