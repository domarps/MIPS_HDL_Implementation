//Pramod Srinivasan
//2010A3PS190P
//Advanced Computer Organization
//Code for Single Cycle Implementation and Multicycle Controller

module Adder(in1, in2, out, overflowCarry);
  
  input [31:0] in1, in2;
  output [31:0] out;
  reg [31:0]out;
  output overflowCarry;
  reg overflowCarry;
  
      always@(in1 or in2)
        begin
          
          {overflowCarry , out } = in1 + in2;
          
        end
    
endmodule
