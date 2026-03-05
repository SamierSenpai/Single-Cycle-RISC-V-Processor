module ALU_Decoder (
    input [2:0] funct3,
    input [1:0] ALUOp,
    input funct7b5, opcodeb5,
    output reg [2:0] ALUControl
);


// We will make a subwire for fifth case
wire Rtype_addi;
assign Rtype_addi = funct7b5 & opcodeb5;


always@(*)begin
    case(ALUOp)
        2'b00: ALUControl <= 3'b000; //lw, sw
        2'b01: case(funct3)
            3'b000: ALUControl <= 3'b010; //beq
            3'b001: ALUControl <= 3'b010; //bnq
            3'b100: ALUControl <= 3'b010; //blt
        endcase
        2'b10: case(funct3)
            3'b000: ALUControl <= (Rtype_addi) ? 3'b010 : 3'b000; // add if Rtype_addi = 1, sub if Rtype_addi = 0
            3'b001: ALUControl <= 3'b001; //SHL
            3'b100: ALUControl <= 3'b100; //XOR
            3'b101: ALUControl <= 3'b101; //SHR
            3'b110: ALUControl <= 3'b110; //OR
            3'b111: ALUControl <= 3'b111; //AND
        endcase
        

    endcase
end
    
endmodule