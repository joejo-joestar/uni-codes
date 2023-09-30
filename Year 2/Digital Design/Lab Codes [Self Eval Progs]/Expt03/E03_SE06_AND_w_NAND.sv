/*
  Code can be found here: https://edaplayground.com/x/DuiY
*/

// main program
module NAND_Gate (output reg Z, input A, B);

    output Z;
    input A, B;
    wire p;

    nand #1 NA1 (p, A, B);
    nand #1 NA3 (Z, p, p);


endmodule


// testbench
module tb_NAND_Gate;

    reg in_1, in_2;
    wire op;

    initial begin

        // $dumpfile ("dump.vcd"); //only needed if using the online compiler
        // $dumpvars (1, tb_NAND_Gate); //only needed if using the online compiler

        #000 in_1 = 0; in_2 = 0;
        #100 in_1 = 0; in_2 = 1;
        #100 in_1 = 1; in_2 = 0;
        #100 in_1 = 1; in_2 = 1;
        #100 $stop;

        end

    NAND_Gate U1 (op, in_1, in_2);

endmodule
