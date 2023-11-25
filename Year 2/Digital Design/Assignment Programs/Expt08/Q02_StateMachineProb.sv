/*
  Code can be found here:
*/

// main program
module StateMachine (output reg yOut, output reg [1:0] state, nextState, input xIn, clk, rst);
  parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;

  always @ (posedge clk, negedge rst)
    if (rst == 1'b0) state <= s0;
    else state <= nextState;

  always @(state, xIn) begin
    yOut = 0;
    nextState = s0;
      case (state)
        s0: if (xIn) begin
            yOut = 0;

            if(xIn) nextState = s1;

            else nextState = s0;

          end

        s1: if (xIn) begin
          yOut = 0;

          if(xIn) nextState = s2;

          else nextState = s1;

          end

        s2: if (xIn) begin
          yOut = 1;

          if(xIn) nextState = s3;

          else nextState = s2;

          end

        s3: if (xIn) begin
          yOut = 1;

          if(xIn) nextState = s0;

          else nextState = s3;

          end

        default: nextState = s0;

      endcase

  end

endmodule


// testbench
module tb_StateMachine;

 wire z;
  wire[1:0] state, nextState;
  reg xIn, clk;

  // clk signal
  initial begin
    #00 clk = 1;

    forever
      #5 clk = ~clk;

  end

  initial begin

    $dumpfile("dump.vcd");
    $dumpvars(1, tb_StateMachine);

    #00 xIn = 0;
    #10 xIn = 1;
    #10 xIn = 0;
    #10 xIn = 1;
    #10 xIn = 0;
    #10 xIn = 1;
    #10 xIn = 0;
    #10 xIn = 1;
    #10 $stop;

  end

StateMachine U1 (yOut, state, nextState, xIn, clk, rst);

endmodule
