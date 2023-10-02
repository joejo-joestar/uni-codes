
module Compare4Bit (low, eq, great, in1, in2) ;

    output low, eq, great;
    input[3:0] in1, in2;

    assign low = in1 < in2;
    assign eq = (in1 == in2);
    assign great = in1 > in2;

endmodule

// no testbech because this code is to program an fpga
// refer to the Pin Planner Diagram readme file
