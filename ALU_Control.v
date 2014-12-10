//Pramod Srinivasan
//2010A3PS190P
//Advanced Computer Organization
//Code for Single Cycle Implementation and Multicycle Controller

module ALU_Control(Funct, ALUOp, Ctrl);
input [5:0]Funct;
input [1:0]ALUOp;
output [2:0]Ctrl;
reg [2:0]Ctrl;

always@(Funct or ALUOp)
begin
    if(ALUOp == 2'b10) //'Arithmetic' Type Instructions
    begin
      case(Funct)
      //begin
        6'b100000: Ctrl = 3'b010; //ADDITION in 'R' Type
        6'b100010: Ctrl = 3'b110; //SUBTRACTION in 'R' Type
        6'b100100: Ctrl = 3'b000; //AND in 'R' Type
        6'b100101: Ctrl = 3'b001; //OR in 'R' Type
        6'b101010: Ctrl = 3'b111; //SLT in 'R' Type
     // end
    endcase
    end
    
    if(ALUOp == 2'b00) // 'LW/SW' Type Instructions
    begin
        Ctrl = 3'b010; //ADDITION irrespective of the FunctField.
    end
    
    if(ALUOp == 2'b01) // 'BEQ', 'BNE' Type Instructions
    begin
        Ctrl = 3'b110; //SUBTRACTION irrespective of the FunctField.
    end
    

    
end //always block

endmodule //ALUOp module

