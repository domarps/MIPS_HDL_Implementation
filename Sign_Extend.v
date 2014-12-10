//Pramod Srinivasan
//2010A3PS190P
//Advanced Computer Organization
//Code for Single Cycle Implementation and Multicycle Controller

module SignExt(in, out);
  
  input[15:0] in;
  output[31:0] out;
  reg [31:0] out;
  
  always@(in)
    begin
      
      out[31:0] ={{16{in[15]}}, in[15:0]};

      
    end
endmodule
