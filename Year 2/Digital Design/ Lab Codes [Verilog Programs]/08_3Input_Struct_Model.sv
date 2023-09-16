/*
Code can be found here: https://edaplayground.com/x/MaXw
*/

//main program
	//AND Gate
module AND_Gate (output reg Z, input A, B, C);
  
  wire p;
  
  and #10 OR1 (p, A, B);
  and #10 OR2 (Z, p, C);
  
endmodule


	//OR Gate
module OR_Gate (output reg Z, input A, B, C);
  
  wire p;
  
  or #10 OR1 (p, A, B);
  or #10 OR2 (Z, p, C);
  
endmodule

//testbench
	//OR Gate
module tb_AND_Gate;
  
  reg and_ip1, and_ip2, and_ip3;
  wire and_op;
  
  initial begin
    
    // $dumpfile ("dump.vcd");
    // $dumpvars (1, tb_AND_Gate);
    
    #000 and_ip1 = 0; and_ip2 = 0; and_ip3 = 0;
    #100 and_ip1 = 0; and_ip2 = 0; and_ip3 = 1;
    #100 and_ip1 = 0; and_ip2 = 1; and_ip3 = 0;
    #100 and_ip1 = 0; and_ip2 = 1; and_ip3 = 1;
    #100 and_ip1 = 1; and_ip2 = 0; and_ip3 = 0;
    #100 and_ip1 = 1; and_ip2 = 0; and_ip3 = 1;
    #100 and_ip1 = 1; and_ip2 = 1; and_ip3 = 0;
    #100 and_ip1 = 1; and_ip2 = 1; and_ip3 = 1;
    #100 $stop;
    
  end
  
  AND_Gate U1 (and_op, and_ip1 ,and_ip2, and_ip3);
  
endmodule


	//OR Gate
module tb_OR_Gate;
  
  reg or_ip1, or_ip2, or_ip3;
  wire or_op;
  
  initial begin
    
    // $dumpfile ("dump.vcd");
    // $dumpvars (1, tb_OR_Gate);
    
    #000 or_ip1 = 0; or_ip2 = 0; or_ip3 = 0;
    #100 or_ip1 = 0; or_ip2 = 0; or_ip3 = 1;
    #100 or_ip1 = 0; or_ip2 = 1; or_ip3 = 0;
    #100 or_ip1 = 0; or_ip2 = 1; or_ip3 = 1;
    #100 or_ip1 = 1; or_ip2 = 0; or_ip3 = 0;
    #100 or_ip1 = 1; or_ip2 = 0; or_ip3 = 1;
    #100 or_ip1 = 1; or_ip2 = 1; or_ip3 = 0;
    #100 or_ip1 = 1; or_ip2 = 1; or_ip3 = 1;
    #100 $stop;
    
  end
  
  OR_Gate U1 (or_op, or_ip1, or_ip2, or_ip3);
  
endmodule
