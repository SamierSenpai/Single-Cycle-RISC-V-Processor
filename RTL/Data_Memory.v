module Data_Memory (
    input clk, WE,
    input [31:0] A, WD,
    output reg [31:0] RD
);
    
    reg [31:0] ram_mem [63:0];

    always@(*) begin
        RD <= ram_mem[A[31:0]];
    end

    always@(posedge clk) begin
        if (WE) begin
            ram_mem[A[31:0]] <= WD;
        end
    end

endmodule