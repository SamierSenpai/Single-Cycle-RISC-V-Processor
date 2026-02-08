module Datapath(

        input clk, rst, PCSrc, ALUSrc, RegWrite, ResultSrc, 
        input [1:0] ImmSrc,
        input [2:0] ALUControl,
        input [31:0] Instr, ReadData,
        output Zero,
        output [31:0] PC, DataAdr, WriteData    
    );
    
    wire [31:0] PCNext, RD1, RD2, PCPlus4, Result, ImmExt, PCTarget, SrcB;
    
    PC PC_i(
         .clk(clk),
         .rst(rst),
	     .PCNext(PCNext),
	     .PC(PC)
    );
    
     Adder_PCPlus4 Adder_PCPlus4 (
         .PC(PC),     
         .PCPlus4(PCPlus4)
     );
     
     ALU ALU (
         .SrcA(RD1),        
         .SrcB (SrcB),    
         .ALUControl(ALUControl),          
         .ALUResult(DataAdr),
         .Zero(Zero)
    );
    
    Result_MUX Result_MUX(
    
         .ALUResult(DataAdr),
         .ReadData(ReadData),
         .ResultSrc(ResultSrc),
         .Result(Result)
    
    );
    
    Register_File Register_File (
         .clk(clk),
         .WE3(RegWrite),
	     .A1(Instr[19:15]),
	     .A2(Instr[24:20]),
	     .A3(Instr[11:7]),
	     .WD3(Result),
	     .RD1(RD1),
	     .RD2(RD2),
          .rst(rst)
    );

    assign WriteData = RD2;
    
    Extend Extend(
         .Instr(Instr[31:7]),          
         .ImmSrc(ImmSrc),        
         .ImmExt(ImmExt)
    
    );
    
    Adder_PCTarget Adder_PCTarget (
         
         .PC(PC),      
         .ImmExt(ImmExt), 
         .PCTarget(PCTarget)
   
    );
    
    PC_MUX PC_MUX (
    
         .PCPlus4(PCPlus4),
         .PCTarget(PCTarget),
         .PCSrc(PCSrc),
         .PCNext(PCNext) 
    
    );
    
    Data_Sel_MUX Data_Sel_MUX (
    
         .RD2(RD2),
         .ImmExt(ImmExt),
         .ALUSrc(ALUSrc) ,
         .SrcB(SrcB) 
    
    );
endmodule