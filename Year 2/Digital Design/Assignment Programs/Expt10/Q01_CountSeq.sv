
// Simplified and corrected form of given code
module CountSeq (
    output reg [2:0] modFive,
    input clk,
    rst);

  always @(posedge clk, posedge rst) begin
    if(rst) begin modFive <= 1;
      end

    else begin
      modFive <= (modFive == 5) ? 1 : (modFive + 1);
    end

  end

endmodule


// testbench
module tb_CountSeq;
  reg clk, rst;
  wire[2:0] modFive;

  initial begin
    $dumpfile("dump.vcd"); //only needed if using the online compiler
    $dumpvars(1, tb_CountSeq); //only needed if using the online compiler

    #00 clk = 0;
      forever #5 clk = ~clk;
    
  end

  initial begin
  #00 rst = 1;
  #05 rst = 0; 
  #30 $stop;
  
  end
  
  CountSeq U1 (modFive, clk, rst);

endmodule
