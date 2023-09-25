/*
Code can be found here: https://edaplayground.com/x/EdaW
*/

//main program
module Full_Subtractor(D, B_out, A, B, B_in);
    
  output D, B_out;
  input A, B, B_in;

  assign D = A ^ B ^ B_in;
  assign B_out = ((~A) & B_in) | ((~A) & B) | (B & B_in);

endmodule


//testbench
module tb_Full_Subtractor;
  
  reg a, b, borr_in;
  wire diff, borr_out;
  
  initial begin
    
    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_Full_Subtractor); //only needed if using the online compiler
    
    #000 a = 0; b = 0; borr_in = 0;
    #100 a = 0; b = 0; borr_in = 1;
    #100 a = 0; b = 1; borr_in = 0;
    #100 a = 0; b = 1; borr_in = 1;
    #100 a = 1; b = 0; borr_in = 0;
    #100 a = 1; b = 0; borr_in = 1;
    #100 a = 1; b = 1; borr_in = 0;
    #100 a = 1; b = 1; borr_in = 1;
    #100 $stop;
    
  end
  
  Full_Subtractor U1 (diff, borr_out, a, b, borr_in);
  
endmodule
