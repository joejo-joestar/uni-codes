
module GrayCounter(gray, rst, clk);
  output[3:0] gray;
  input rst, clk;
  reg[3:0] n;

  always @(negedge clock) begin
    if (rst | (n > 4'hf)) n = 4'b0000;
    else n = n + 1;
  end

  gray[3] = n[3];
  gray[2] = n[3] ^ n[2];
  gray[1] = n[2] ^ n[1];
  gray[0] = n[1] ^ n[0];

endmodule