/*
  Code can be found here: https://edaplayground.com/x/GBzU
*/

// main program
module MooreFSM(op, state, nextState, ip, clk);
  output reg op;
  output reg[1:0] state, nextState;
  input ip, clk;
  parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11; 

  initial nextState = s0;

  always @ (negedge clk) begin
    nextState = state;
  end

  always @ (state)
    case(state)
      s0:
          if(ip) begin op <= 1; nextState = s2; end
          else begin op <= 1; nextState = s1; end


      s1:
          if(ip) begin op <= 0; nextState = s3; end
          else begin op <= 1; nextState = s2; end


      s2:
          if(ip) begin op <= 0; nextState = s3; end
          else begin op <= 1; nextState = s1; end


      s3:
          if(ip) begin op <= 0; nextState = s0; end
          else begin op <= 1; nextState = s2; end

    endcase

endmodule


// testbench
module tb_MooreFSM;

  wire op;
  wire[1:0] state, nextState;
  reg ip, clk;

  // clk signal
  initial begin
    #00 clk = 1;

    forever
      #5 clk = ~clk;

  end

  initial begin

    $dumpfile("dump.vcd");
    $dumpvars(1, tb_MooreFSM);

    #00 ip = 0;
    #10 ip = 0;
    #10 ip = 1;
    #10 ip = 1;

    #10 ip = 1;
    #10 ip = 0;
    #10 ip = 1;
    #10 ip = 0;
    #10 $stop;

  end

  MooreFSM U1 (op, state, nextState, ip, clk);

endmodule