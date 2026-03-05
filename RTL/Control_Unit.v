module Control_Unit (Sign_Res, Zero, Instr, MemWrite, RegWrite, ImmSrc, ALUSrc, ALUControl, ResultSrc, PCSrc);

    input  wire Zero, Sign_Res;
    input  wire [31:0] Instr;

    output wire MemWrite;
    output wire RegWrite;
    output wire [1:0] ImmSrc;
    output wire ALUSrc;
    output wire [2:0] ALUControl;
    output wire ResultSrc;
    output reg PCSrc;
    
    wire [2:0] funct3;
    wire Branch;
    wire [1:0] ALUOp;
    
    assign funct3 = Instr[14:12];
   
    
    Main_Decoder Main_Decoder(
            .opcode(Instr[6:0]), 
            .Branch(Branch), 
            .MemWrite(MemWrite), 
            .RegWrite(RegWrite), 
            .ALUSrc(ALUSrc), 
            .ImmSrc(ImmSrc), 
            .ResultSrc(ResultSrc), 
            .ALUOp(ALUOp)
        );

    always @(*) begin
        case (funct3)
            3'b000: PCSrc = Branch & Zero; 
            3'b001: PCSrc = Branch & ~Zero; 
            3'b100: PCSrc = Branch & Sign_Res;
            default: PCSrc = 0;
        endcase
    end

    ALU_Decoder ALU_Decoder (
        .opcodeb5(Instr[5]),
        .funct3(Instr[14:12]), 
        .funct7b5(Instr[30]),
        .ALUOp(ALUOp), 
        .ALUControl(ALUControl)
    );
    
endmodule