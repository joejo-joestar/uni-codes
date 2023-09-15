/*
Code can be found here: https://edaplayground.com/x/gguf
*/

//main program
module NOR_Gate (output reg Z, input A, B);
  
  assign #10 Z = ~(A + B);
  
endmodule


//testbench
module tb_NOR_Gate;
  
  reg p, q;
  wire r;
  
  initial begin
    
    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_NOR_Gate); //only needed if using the online compiler
    
    #000 p = 0; q = 0;
    #100 p = 0; q = 1;
    #100 p = 1; q = 0;
    #100 p = 1; q = 1;
    #100 $stop;
    
  end
  
  NOR_Gate U1 (r, p, q);
  
endmodule
