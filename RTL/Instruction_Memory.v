module Instruction_Memory (
    input [31:0] A,
    output [31:0] RD
);

    reg [31:0] instr_mem [63:0];

    assign RD = instr_mem[A[7:2]];
    

endmodule
