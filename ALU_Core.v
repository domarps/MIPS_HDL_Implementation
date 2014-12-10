//Pramod Srinivasan
//2010A3PS190P
//Advanced Computer Organization
//Code for Single Cycle Implementation and Multicycle Controller

module ALU_Core(in1 , in2 , Ctrl , out , ZeroFlag);
  input[31:0] in1;
  input[31:0] in2;
  input[2:0] Ctrl;
  output ZeroFlag;
  reg ZeroFlag;
  output [31:0]out;
  reg [31:0]out;
  
  
  always @(in1 or in2 or Ctrl)
    begin
          
          if(Ctrl == 3'b010) //'add'
          begin
               out = in1 + in2;
               if(out == 32'h0000)
               begin
                      ZeroFlag = 1'b1;
               end
               else
                 begin
                      ZeroFlag = 1'b0;
                 end
          end
          
          if(Ctrl == 3'b110) // 'sub'
          begin
               out = in1 - in2;
               if(out == 32'h0000)
               begin
                      ZeroFlag = 1'b1;
               end
               else
                 begin
                      ZeroFlag = 1'b0;
                 end
          end
          
          if(Ctrl == 3'b000) // 'and'
          begin
               out = in1 & in2;
               if(out == 32'h0000)
               begin
                      ZeroFlag = 1'b1;
               end
               else
                 begin
                      ZeroFlag = 1'b0;
                 end
          end
               
          if(Ctrl == 3'b001) // 'or'
          begin
               out = in1 | in2;
               if(out == 32'h0000)
               begin
                      ZeroFlag = 1'b1;
               end
               else
                 begin
                      ZeroFlag = 1'b0;
                 end
          end
          
          if(Ctrl == 3'b111) // 'slt'
          begin
               out = in1 - in2;
               if(out == 32'h0000)
               begin
                      ZeroFlag = 1'b1;
               end
               else
                 begin
                      ZeroFlag = 1'b0;
                 end
          end
        
    end
  
endmodule


