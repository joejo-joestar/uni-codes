
module Decoder (op, ip);

    output [3:0] op;
    input [1:0] ip;

    assign op[0] = (~ip[1] & ~ip[0])
    assign op[1] = (~ip[1] & ~ip[0])
    assign op[2] = (ip[1] & ip[0])
    assign op[3] = (ip[1] & ip[0])

endmodule

// no testbech because this code is to program an fpga
// refer to the Pin Planner Diagram readme file
