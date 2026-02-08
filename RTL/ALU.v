module ALU (SrcA, SrcB, ALUControl, Zero, ALUResult);
    
    
    
    input [31:0] SrcA, SrcB;
    input [2:0] ALUControl;
    output reg [31:0] ALUResult;
    output wire Zero;

    

    always @(*) begin
        
        case (ALUControl)

            3'b000 : begin ALUResult <= SrcA + SrcB; end 
            3'b001 : begin ALUResult <= SrcA << SrcB; end 
            3'b010 : begin ALUResult <= SrcA - SrcB; end 
            3'b100 : begin ALUResult <= SrcA ^ SrcB; end 
            3'b101 : begin ALUResult <= SrcA >> SrcB; end 
            3'b110 : begin ALUResult <= SrcA | SrcB; end 
            3'b111 : begin ALUResult <= SrcA & SrcB; end 

            default: begin ALUResult <= 32'b0; end 
        endcase

        

    end
    
assign Zero = (ALUResult == 0);

endmodule