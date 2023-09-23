/*
Code can be found here: https://edaplayground.com/x/
*/

//main program
module Ckt (X, A, B, C);
	output X;
  input A, B, C;
  wire p, q, r;
  
  and #1 A1 (p, A, B);
  not #1 N1 (q, B);
  and #1 A2 (r, q, C);
  or #1 O2 (X, p, r);
  
endmodule


//testbench
module tb_Ckt;
  
  reg a, b, c;
  wire x;
  
  initial begin
    
	  // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_Ckt); //only needed if using the online compiler
    
 	  #000 a = 0; b = 0; c = 0;
   	#100 a = 0; b = 0; c = 1;
   	#100 a = 0; b = 1; c = 0;
   	#100 a = 0; b = 1; c = 1;
   	#100 a = 1; b = 0; c = 0;
   	#100 a = 1; b = 0; c = 1;
   	#100 a = 1; b = 1; c = 0;
   	#100 a = 1; b = 1; c = 1;
    #100 $stop;
    
  end
  
  Ckt U1 (x, a, b, c);
  
endmodule
