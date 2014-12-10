//Pramod Srinivasan
//2010A3PS190P
//Advanced Computer Organization
//Code for Single Cycle Implementation and Multicycle Controller

module mux_2to1( in1 , in2, sel, out );
  input [31:0] in1, in2;
  input sel;
  output [31:0]out;
  reg [31:0]out;
  
  always @(in1 or in2 or sel)
    begin
      out=(~sel?in1:in2);
    end
 endmodule 
