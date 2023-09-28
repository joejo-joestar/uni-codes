
module full_adder(S, C_out, A, B, C_in);

    output S, C_out;
    input A, B, C_in;

    assign S = A ^ B ^ C_in;
    assign C_out = (C_in & (A ^ B)) | (A & B);

endmodule

// no testbech because this code is to program an fpga
// refer to the Pin Planner Diagram readme file
