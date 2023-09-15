/*
Code can be found here: https://edaplayground.com/x/MaXw
*/

//main program
module OR_Gate (output reg Z, input A, B, C);
  
  wire p;
  
  or #10 OR1 (p, A, B);
  or #10 OR2 (Z, p, C);
  
endmodule


//testbench
module tb_OR_Gate;
  
  reg p, q, r;
  wire s;
  
  initial begin
    
    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_OR_Gate); //only needed if using the online compiler
    
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
  
  OR_Gate U1 (s,p, q, r);
  
endmodule
