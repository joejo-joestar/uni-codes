
module full_adder(S, C_out, A, B, C_in);
    
    output S, C_out;
    input A, B, C_in;

    assign S = A ^ B ^ C_in;
    assign C_out = (C_in & (A ^ B)) | (A & B);

endmodule

module parallel_adder (S, C_out, A, B, C_in);

    output[3:0] S;
    output C_out;
    input [3:0] A, B;
    wire[2:0] C_in;

    full_adder HA (S[0], C_in[0], A[0], B[0], 1'b0);
    full_adder FA1 (S[1], C_in[1], A[1], B[1], C_in[0]);
    full_adder FA2 (S[2], C_in[2], A[2], B[2], C_in[1]);
    full_adder FA3 (S[3], C_out, A[3], B[3], C_in[2]);

endmodule

//no testbech because this code is to program an fpga
// refer to the Pin Planner Diagram readme file
