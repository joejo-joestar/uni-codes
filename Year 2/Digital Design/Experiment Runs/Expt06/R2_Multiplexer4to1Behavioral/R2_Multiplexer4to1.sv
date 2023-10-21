
module mux4to1 (op, ip, sIp);

  output op;
  input[3:0] ip;
  input[1:0] sIp;

  always @* begin
    case (sIp)
      2'b00: op = ip[0];
      2'b01: op = ip[1];
      2'b10: op = ip[2];
      2'b11: op = ip[3];
      default: op = xx;

    endcase

  end

endmodule

// no testbech because this code is to program an fpga
// refer to the Pin Planner Diagram readme file
