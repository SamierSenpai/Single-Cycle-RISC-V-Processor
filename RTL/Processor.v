module Processor(clk, rst, Instr, ReadData, PC, DataAdr, WriteData, MemWrite);

    input  wire clk;             
    input  wire rst;   
    input  wire [31:0] Instr, ReadData;   
    output wire MemWrite;     
    output wire [31:0] PC;       
    output wire [31:0] DataAdr;  
    output wire [31:0] WriteData; 
      
    wire Zero, RegWrite, ALUSrc, PCSrc, ResultSrc;
    wire [1:0] ImmSrc;
    wire [2:0] ALUControl;
    

    Control_Unit Control_Unit (
        .Zero(Zero),
        .Sign_Res(DataAdr[31]),
        .Instr(Instr),
        .MemWrite(MemWrite),
        .RegWrite(RegWrite),
        .ImmSrc(ImmSrc),
        .ALUSrc(ALUSrc),
        .ALUControl(ALUControl),
        .ResultSrc(ResultSrc),
        .PCSrc(PCSrc)

    );

    
    Datapath Datapath (
        .clk(clk),
        .rst(rst),
        .PCSrc(PCSrc),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .ResultSrc(ResultSrc),
        .ImmSrc(ImmSrc),
        .ALUControl(ALUControl),
        .Instr(Instr),
        .ReadData(ReadData),
        .Zero(Zero),
        .PC(PC),
        .DataAdr(DataAdr),
        .WriteData(WriteData)
    );
    
endmodule