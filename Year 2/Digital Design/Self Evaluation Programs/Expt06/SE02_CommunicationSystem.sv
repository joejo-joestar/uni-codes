module mux4to1 (op, ip, sIp)

  output op;
  input[3:0] ip;
  input[1:0] sIp;

  always @* begin
    case (sIp)
      2'b00: op = ip[3];
      2'b01: op = ip[2];
      2'b10: op = ip[1];
      2'b11: op = ip[0];

    endcase

  end

endmodule

module deMux1to4 (op, ip, sIp)

  output[3:0] op;
  input ip;
  input[1:0] sIp;

  always @* begin
    case (sIp)
      2'b00: op[3] = ip;
      2'b01: op[2] = ip;
      2'b10: op[1] = ip;
      2'b11: op[0] = ip;

    endcase

  end

endmodule

module communicator (r, s, sKey, rKey)

  output[3:0] r;
  input[3:0] s;
  input[1:0] sKey, rKey;
  wire connection;

  mux4to1 Sender (connection, s, sKey);
  deMux1to4 Receiver (r, connection, rKey);

endmodule


// testbench
module tb_communicator;

reg [3:0]s, [1:0]sKey, [1:0]rKey;
wire [3:0]r;

  initial begin

  $dumpfile("dump.vcd"); //only needed if using the online compiler
  $dumpvars(1, tb_communicator); //only needed if using the online compiler

  #00 s = 4'b0000; sKey = 2'b00; rKey = 2'b00; // op = 0
  #10 s = 4'b1000; sKey = 2'b00; rKey = 2'b00; // op = 1
  #10 s = 4'b0100; sKey = 2'b01; rKey = 2'b00; // op = 0
  #10 s = 4'b0010; sKey = 2'b10; rKey = 2'b11; // op = 0
  #10 s = 4'b0001; sKey = 2'b11; rKey = 2'b11; // op = 1
  #10 s = 4'b0001; sKey = 2'b11; rKey = 2'b10; // op = 0
  #10 s = 4'b0010; sKey = 2'b10; rKey = 2'b10; // op = 1
  #10 s = 4'b0100; sKey = 2'b00; rKey = 2'b00; // op = 0
  #10 s = 4'b1000; sKey = 2'b00; rKey = 2'b00; // op = 1
  #10 $stop;

  end

  communicator U1 (r, s, sKey, rKey);

endmodule