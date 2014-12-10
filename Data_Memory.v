//Pramod Srinivasan
//2010A3PS190P
//Advanced Computer Organization
//Code for Single Cycle Implementation and Multicycle Controller

module DataMemory(inAddr, in, out, memRead, memWrite,rst);
input rst;
input [31:0]inAddr;
input [31:0]in;
input memRead, memWrite;
output [31:0]out;
reg [31:0]out;
/////// THE MAIN MEMORY REGISTERS WHICH HOLD EMULATE THE ACTUAL RAM.
        reg [7:0]MM[4294967295:0];
///////

reg [7:0]address;
reg [7:0]dataBuff;


integer addressInt, i, j, placeVal,var, baseAddress;
genvar k;

always @( in or inAddr or memRead or memWrite or rst)
begin
if(rst)
begin
    for(i=0;i<=4294967295;i=i+1)
    begin
       MM[i]=i%256;
    end
    
end

  address=inAddr[31:0];
    
addressInt = 0; // the integer equivalent of the 8 bit address we have got in the address[]
placeVal = 1; // the placevalue for the unit place is 1.
  
  for( i=0 ; i<8 ; i=i+1 )
  begin
      
      if(address[i] == 1'b1)
        addressInt = addressInt + placeVal;
        
      placeVal = placeVal * 2;
  end
  
  //calculated address as an integer, stored in addressInt
  


  if(memRead == 1) // the memory is being read from.
  begin
    
    baseAddress = addressInt; // i is the variable pointing to the address location pointed by the input address
        
    // now copying the 8 bits of the pointed address one by one.
    
    ///BIG ENDIAN
    for(i=0 ; i<4 ; i=i+1)
    begin
       for(j = 0 ; j < 8 ; j = j+1 )
        begin
           out[j] = MM[baseAddress + i][j];
        end
    end
        
    
       
  end //End of readbar condition 1
  
   
  
  if(memWrite == 1) // the memory is being written into
  begin
    baseAddress = addressInt;
    
    // the given data is being written into the place pointed by the address
    
    ///BIG ENDIAN
    for(i=0 ; i<4 ; i = i + 1)
    begin
      
      for(j = 0 ; j < 8 ; j = j+1 )
         begin
             MM[baseAddress + i][j] = in[j] ;
         end
      
    end
    
      
  end // End of data writing block
  
  
    
end // end of the always block




endmodule
