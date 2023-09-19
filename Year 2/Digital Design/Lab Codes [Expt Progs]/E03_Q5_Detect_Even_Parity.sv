module Detect_Parity (z, a, b, c);
  input a, b, c;
  output z;
  
  assign z = a ^ b ^ c;
  
  
endmodule 
