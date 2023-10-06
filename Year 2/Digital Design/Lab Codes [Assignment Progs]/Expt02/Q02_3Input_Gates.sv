/*
  Code can be found here: https://edaplayground.com/x/KWiu
*/

// main program
	// NAND Gate
module NAND_Gate (output reg Z, input A, B, C);

  nand #10 NAND1 (Z, A, B, C);

endmodule


	// XOR Gate
module XOR_Gate (output reg Z, input A, B, C);

  xor #10 XOR1 (Z, A, B, C);

endmodule


// testbench
	// NAND Gate
module tb_NAND_Gate;

  reg nand_ip1, nand_ip2 , nand_ip3;
  wire nand_op;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_NAND_Gate); //only needed if using the online compiler

    // #000 nand_ip1 = 0; nand_ip2 = 0; nand_ip3 = 0;
    // #100 nand_ip1 = 0; nand_ip2 = 0; nand_ip3 = 1;
    // #100 nand_ip1 = 0; nand_ip2 = 1; nand_ip3 = 0;
    // #100 nand_ip1 = 0; nand_ip2 = 1; nand_ip3 = 1;
    // #100 nand_ip1 = 1; nand_ip2 = 0; nand_ip3 = 0;
    // #100 nand_ip1 = 1; nand_ip2 = 0; nand_ip3 = 1;
    // #100 nand_ip1 = 1; nand_ip2 = 1; nand_ip3 = 0;
    // #100 nand_ip1 = 1; nand_ip2 = 1; nand_ip3 = 1;
    // #100 $stop;

  end

  NAND_Gate U1 (nand_op ,nand_ip1, nand_ip2, nand_ip3);

endmodule


	// XOR Gate
module tb_XOR_Gate;

  reg xor_ip1, xor_ip2, xor_ip3;
  wire xor_op;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_XOR_Gate); //only needed if using the online compiler

    #000 xor_ip1 = 0; xor_ip2 = 0; xor_ip3 = 0;
    #100 xor_ip1 = 0; xor_ip2 = 0; xor_ip3 = 1;
    #100 xor_ip1 = 0; xor_ip2 = 1; xor_ip3 = 0;
    #100 xor_ip1 = 0; xor_ip2 = 1; xor_ip3 = 1;
    #100 xor_ip1 = 1; xor_ip2 = 0; xor_ip3 = 0;
    #100 xor_ip1 = 1; xor_ip2 = 0; xor_ip3 = 1;
    #100 xor_ip1 = 1; xor_ip2 = 1; xor_ip3 = 0;
    #100 xor_ip1 = 1; xor_ip2 = 1; xor_ip3 = 1;
    #100 $stop;

  end

  XOR_Gate U1 (xor_op, xor_ip1, xor_ip2, xor_ip3);

endmodule
