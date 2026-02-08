module RISC_V_SC_tb ();

reg clk, rst;


initial begin
    clk = 0;
    forever begin
        #5;
        clk = ~clk;
    end
end

RISC_V_SC RISC_V_SC_Top (.clk(clk), .rst(rst));

initial begin

rst = 0;
#10;
rst = 1;

repeat (50) #10;

$finish;
end

initial begin
    $readmemh("C:/Users/user/Downloads/Verilog Project Risc/Verilog Project Risc/risc.hex", RISC_V_SC_Top.Instruction_Memory.instr_mem);
    $monitor("Instruction Address = %d, Result = %d, Branch = %b, Zero = %b, PCSrc = %b",
            RISC_V_SC_Top.Instruction_Memory.A,
            RISC_V_SC_Top.Processor.Datapath.Result_MUX.Result,
            RISC_V_SC_Top.Processor.Control_Unit.Branch,
            RISC_V_SC_Top.Processor.Control_Unit.Zero,
            RISC_V_SC_Top.Processor.Control_Unit.PCSrc);
    
end




    
endmodule