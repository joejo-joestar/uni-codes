/*
  Code can be found here: https://edaplayground.com/x/T4VP
*/

// main program
module Full_Subtractor(output reg D, B_out, input A, B, B_in);

  always @ *
    begin

      if (A == 0 & B == 0 & B_in == 0) begin
        D = 0;
        B_out = 0;
      end

      else if (A == 0 & B == 0 & B_in == 1) begin
        D = 1;
        B_out = 1;
      end

      else if (A == 0 & B == 1 & B_in == 0) begin
        D = 1;
        B_out = 1;
      end

      else if (A == 0 & B == 1 & B_in == 1) begin
        D = 0;
        B_out = 1;
      end

      else if (A == 1 & B == 0 & B_in == 0) begin
        D = 1;
        B_out = 0;
      end

      else if (A == 1 & B == 0 & B_in == 1) begin
        D = 0;
        B_out = 0;
      end

      else if (A == 1 & B == 1 & B_in == 0) begin
        D = 0;
        B_out = 0;
      end

      else begin
        D = 1;
        B_out = 1;
      end

    end

endmodule


// testbench
module tb_Full_Subtractor;

  reg a, b, borr_in;
  wire diff, borr_out;

  initial begin

    // $dumpfile ("dump.vcd"); //only needed if using the online compiler
    // $dumpvars (1, tb_Full_Subtractor); //only needed if using the online compiler

    #000 a = 0; b = 0; borr_in = 0;
    #100 a = 0; b = 0; borr_in = 1;
    #100 a = 0; b = 1; borr_in = 0;
    #100 a = 0; b = 1; borr_in = 1;
    #100 a = 1; b = 0; borr_in = 0;
    #100 a = 1; b = 0; borr_in = 1;
    #100 a = 1; b = 1; borr_in = 0;
    #100 a = 1; b = 1; borr_in = 1;
    #100 $stop;

  end

  Full_Subtractor U1 (diff, borr_out, a, b, borr_in);

endmodule
