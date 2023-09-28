/*
Code can be found here: https://edaplayground.com/x/jbYm
*/

//main program
module Eqn_Ckt (Y, A, B, C);

    output Y;
    input A, B, C;
    wire p, q, r, s, t;

    and #1 A1 (p, A, B);
    and #1 A2 (q, p, C);
    and #1 A3 (r, A, B);
    and #1 A4 (s, A, C);
    or #1 O1 (t, q, r);
    or #1 O2 (Y, t, s);

endmodule


//testbench
module tb_Eqn_Ckt;

    reg ip1, ip2, ip3;
    wire op;

    initial begin

        // $dumpfile ("dump.vcd"); //only needed if using the online compiler
        // $dumpvars (1, tb_Eqn_Ckt); //only needed if using the online compiler

        #000 ip1 = 0; ip2 = 0; ip3 = 0;
        #100 ip1 = 0; ip2 = 0; ip3 = 1;
        #100 ip1 = 0; ip2 = 1; ip3 = 0;
        #100 ip1 = 0; ip2 = 1; ip3 = 1;
        #100 ip1 = 1; ip2 = 0; ip3 = 0;
        #100 ip1 = 1; ip2 = 0; ip3 = 1;
        #100 ip1 = 1; ip2 = 1; ip3 = 0;
        #100 ip1 = 1; ip2 = 1; ip3 = 1;
        #100 $stop;

        end

    Eqn_Ckt U1 (op, ip1, ip2, ip3);

endmodule
