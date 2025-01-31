module alu(A, B, op, alu_out);
input[3:0] A, B;
input[2;0] op;
output reg[3:0] alu_out;

always@(*)
begin
  case(op)
    3'b000: alu_out = 0;
    3'b001: alu_out = A + B;
    3'b010: alu_out = A - B;
    3'b011: alu_out = A & B;
    3'b100: alu_out = A | B;
    3'b101: alu_out = ~A;
    3'b110: alu_out = ~B;
    3'b111: alu_out = 0;
    default: alu_out = 0;
  encase
end
endmodule

// testbench
module alu_tb();
reg[3:0] A, B;
reg[2:0] op;
wire[3:0] alu_out;

alu alu_inst(A, B, op, alu_out);

initial
begin
  $dumpfile("alu.vcd");
  $dumpvars(0, alu_tb);
  A = 4'b0001;
  B = 4'b0001;
  op = 3'b000;
  #10;
  A = 4'b0001;
  B = 4'b0010;
  op = 3'b001;
  #10;
  A = 4'b0001;
  B = 4'b0001;
  op = 3'b010;
end
endmodule
