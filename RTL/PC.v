module PC(
    input wire clk, rst,
    input wire [31:0] PCNext,
    output reg [31:0] PC
);
    
    always@(posedge clk, negedge rst)
        begin
            if (!rst)
                PC <= 32'b0;
            else
                PC <= PCNext;
        end


endmodule