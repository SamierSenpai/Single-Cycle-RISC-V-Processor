module RISC_V_SC(
       input clk,rst
    );
    
   
    wire [31:0] Instr, ReadData, PC, DataAdr, WriteData;
    wire MemWrite;

    
    Processor Processor (
            
            .clk(clk),                   
            .rst(rst),                 
            .Instr(Instr),
            .MemWrite(MemWrite),
            .ReadData(ReadData),
            .PC(PC),
            .DataAdr(DataAdr),        
            .WriteData(WriteData)      
            
    );
    
     Instruction_Memory Instruction_Memory (
    
            .A(PC),
            .RD(Instr)
            
    );
    
    Data_Memory Data_Memory (
    
            .clk(clk),     
            .WE(MemWrite),      
            .A(DataAdr),
            .WD(WriteData),
            .RD(ReadData)
    );
    
endmodule