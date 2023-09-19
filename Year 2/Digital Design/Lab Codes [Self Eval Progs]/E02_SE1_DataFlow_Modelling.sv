/*
Code can be found here: https://edaplayground.com/x/Mb6g
*/

//main program

	//AND Gate
module AND_Gate (output reg Z, input A, B);
  
  assign #10 Z = A & B;
  
endmodule


	//NAND Gate
module NAND_Gate (output reg Z, input A, B);
  
  assign #10 Z = ~(A & B);
  
endmodule


	//OR Gate
module OR_Gate (output reg Z, input A, B);
  
  assign #10 Z = A | B;
  
endmodule


	//NOR Gate
module NOR_Gate (output reg Z, input A, B);
  
  assign #10 Z = ~(A | B);
  
endmodule


	//XOR Gate
module XOR_Gate (output reg Z, input A, B);
  
  assign #10 Z = A ^ B;
  
endmodule


	//XNOR Gate
module XNOR_Gate (output reg Z, input A, B);
  
  assign #10 Z = ~(A ^ B);
  
endmodule


//testbench
	//AND Gate
module tb_AND_Gate;
  
  reg and_a, and_b;
  wire and_op;
  
  initial begin
    
    $dumpfile ("dump.vcd");
    $dumpvars (1, tb_AND_Gate);
    
    #000 and_a = 0; and_b = 0;
    #100 and_a = 0; and_b = 1;
    #100 and_a = 1; and_b = 0;
    #100 and_a = 1; and_b = 1;
    #100 $stop;
    
  end
  
  AND_Gate U1 (and_op, and_a, and_b);
  
endmodule


	//NAND Gate
module tb_NAND_Gate;
  
  reg nand_a, nand_b;
  wire nand_op;
  
  initial begin
    
    // $dumpfile ("dump.vcd");
    // $dumpvars (1, tb_NAND_Gate);
    
    #000 nand_a = 0; nand_b = 0;
    #100 nand_a = 0; nand_b = 1;
    #100 nand_a = 1; nand_b = 0;
    #100 nand_a = 1; nand_b = 1;
    #100 $stop;
    
  end
  
  NAND_Gate U1 (nand_op, nand_a, nand_b);
  
endmodule


	//OR Gate
module tb_OR_Gate;
  
  reg or_a, or_b;
  wire or_op;
  
  initial begin
    
    // $dumpfile ("dump.vcd");
    // $dumpvars (1, tb_OR_Gate);
    
    #000 or_a = 0; or_b = 0;
    #100 or_a = 0; or_b = 1;
    #100 or_a = 1; or_b = 0;
    #100 or_a = 1; or_b = 1;
    #100 $stop;
    
  end
  
  OR_Gate U1 (or_op, or_a, or_b);
  
endmodule

	//NOR Gate
module tb_NOR_Gate;
  
  reg nor_a, nor_b;
  wire nor_op;
  
  initial begin
    
    // $dumpfile ("dump.vcd");
    // $dumpvars (1, tb_NOR_Gate);
    
    #000 nor_a = 0; nor_b = 0;
    #100 nor_a = 0; nor_b = 1;
    #100 nor_a = 1; nor_b = 0;
    #100 nor_a = 1; nor_b = 1;
    #100 $stop;
    
  end
  
  NOR_Gate U1 (nor_op, nor_a, nor_b);
  
endmodule


	//XOR Gate
module tb_XOR_Gate;
  
  reg xor_a, xor_b;
  wire xor_op;
  
  initial begin
    
    // $dumpfile ("dump.vcd");
    // $dumpvars (1, tb_XOR_Gate);
    
    #000 xor_a = 0; xor_b = 0;
    #100 xor_a = 0; xor_b = 1;
    #100 xor_a = 1; xor_b = 0;
    #100 xor_a = 1; xor_b = 1;
    #100 $stop;
    
  end
  
  XOR_Gate U1 (xor_op, xor_a, xor_b);
  
endmodule


	//XNOR Gate
module tb_XNOR_Gate;
  
  reg xnor_a, xnor_b;
  wire xnor_op;
  
  initial begin
    
    // $dumpfile ("dump.vcd");
    // $dumpvars (1, tb_XNOR_Gate);
    
    #000 xnor_a = 0; xnor_b = 0;
    #100 xnor_a = 0; xnor_b = 1;
    #100 xnor_a = 1; xnor_b = 0;
    #100 xnor_a = 1; xnor_b = 1;
    #100 $stop;
    
  end
  
  XNOR_Gate U1 (xnor_op, xnor_a, xnor_b);
  
endmodule
