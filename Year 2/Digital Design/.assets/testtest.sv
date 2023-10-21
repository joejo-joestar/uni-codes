module Test (aOut, bOut, a, b);

  input [7:0] a;
  input [0:7] b;
  output reg [7:0] aOut;
  output reg [0:7] bOut;

  assign aOut[7] = 1;
  assign bOut[7] = 1;

endmodule


// testbench
module tb_Test;

  reg[7:0] a;
  reg[0:7] b;
  wire[7:0] aOut;
  wire[0:7] bOut;

  initial begin

    $dumpfile ("dump.vcd");
    $dumpvars (1, tb_Test);

    #000 a = 8'b00000001;
	#000 b = 8'b00000001;
    #100 $stop;

  end

  Test U1 (aOut, bOut, a, b);

endmodule