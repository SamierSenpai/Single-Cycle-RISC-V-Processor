module Result_MUX (
    input [31:0] ALUResult, ReadData,
    input ResultSrc,
    output [31:0] Result
);

    assign Result = (ResultSrc) ? ReadData : ALUResult;
    
endmodule