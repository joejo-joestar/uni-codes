
module Priority_Encoder (sw , op);

    input [7:0] sw;
    output reg [2:0] op;

    always @(sw) begin

        if (sw[0]) op = 3'b000;
        else if (sw[1]) op = 3'b001;
        else if (sw[2]) op = 3'b010;
        else if (sw[3]) op = 3'b011;
        else if (sw[4]) op = 3'b100;
        else if (sw[5]) op = 3'b101;
        else if (sw[6]) op = 3'b110;
        else if (sw[7]) op = 3'b111;
        else op = 3'bxxx;

    end

endmodule

// no testbech because this code is to program an fpga
// refer to the Pin Planner Diagram readme file
