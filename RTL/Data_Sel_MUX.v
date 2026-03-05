module Data_Sel_MUX (
    input [31:0] RD2, ImmExt,
    input ALUSrc,
    output wire [31:0] SrcB
);

assign SrcB = (ALUSrc) ? ImmExt : RD2;
    
endmodule