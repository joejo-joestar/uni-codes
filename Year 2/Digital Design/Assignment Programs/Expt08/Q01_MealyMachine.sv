/*
  Code can be found here: https://edaplayground.com/x/ubBF
*/

// main program
module MealyFSM (output reg [1: 0]nextState, output reg[1:0] state, output reg z, input xIn, clk);
  parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

  initial begin
      nextState = S0;
    end

  always @ (posedge clk) begin
    state = nextState;

  end


  always @ (state or xIn)
    case (state)
    S0:
      if (~xIn) begin
        nextState = S1; z = 1;
        end

      else begin
        nextState = S2; z = 0;
      end

    S1:
      if (~xIn) begin
        nextState = S2; z = 0;
      end
  
      else begin
        nextState = S3; z = 1;
      end

    S2:
      if (xIn) begin
        nextState = S3; z = 1;
      end

      else begin
        nextState = S1; z = 0;
      end

    S3:
      if (xIn) begin
        nextState = S0; z = 0;
        end

      else begin
        nextState = S2; z = 1;
        end

  endcase

endmodule


// testbench
module tb_MealyFSM;

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
    $dumpvars(1, tb_MealyFSM);

    #00 xIn = 0;
    #10 xIn = 0;
    #10 xIn = 1;
    #10 xIn = 1;

    #10 xIn = 1;
    #10 xIn = 0;
    #10 xIn = 1;
    #10 xIn = 0;
    #10 $stop;

  end

  MealyFSM U1 (nextState, state, z, xIn, clk);

endmodule
