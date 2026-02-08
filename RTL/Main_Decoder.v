module Main_Decoder (
    input [6:0] opcode,
    output [1:0] ALUOp, ImmSrc,
    output Branch, ResultSrc, MemWrite, ALUSrc, RegWrite
);
    reg [8:0] concatenation;
    assign {RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp} = concatenation;

    always@(*) begin
        casex(opcode)

            7'b0000011: concatenation <= 9'b100101000; //lw
            7'b0100011: concatenation <= 9'b00111x000; //sw
            7'b0110011: concatenation <= 9'b1xx000010; //R-type
            7'b1100011: concatenation <= 9'b01000x101; //beq
            7'b0010011: concatenation <= 9'b100100010; //addi
            default:    concatenation <= 9'b000000000; //addi

        endcase

    end
endmodule