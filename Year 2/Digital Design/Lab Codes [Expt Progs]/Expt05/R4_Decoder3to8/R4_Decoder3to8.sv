
module Decoder2to4(op, enable, ip);

	input[1:0] ip;
	input enable;
	output[3:0] op;
	assign op[0] = enable & (~ip[1] & ~ip[0]);
	assign op[1] = enable & (~ip[1] & ip[0]);
	assign op[2] = enable & (ip[1] & ~ip[0]);
	assign op[3] = enable & (ip[1] & ip[0]);

endmodule

module decode(ip, op);

	input[2:0] ip;
	output[7:0] op;
	Decoder2to4 DC1 (op[3:0], ~ip[2], ip[1:0]);
	Decoder2to4 DC2 (op[7:4], ip[2], ip[1:0]);

endmodule

// no testbech because this code is to program an fpga
// refer to the Pin Planner Diagram readme file
