module RISC_V_SC_tb ();

reg clk, rst;


initial begin
    clk = 0;
    forever begin
        #5;
        clk = ~clk;
    end
end

RISC_V_SC RISC_V_SC_i (.clk(clk), .rst(rst));

initial begin

rst = 0;
#10;
rst = 1;

repeat (50) #10;

$finish;
end

initial begin
    $readmemh("C:/Users/user/Downloads/Verilog Project Risc/Verilog Project Risc/risc.hex", RISC_V_SC_i.Instruction_Memory.instr_mem);
    $monitor("Instruction Address = %d, Result = %d, Branch = %b, Zero = %b, PCSrc = %b",
            RISC_V_SC_i.Instruction_Memory.A,
            RISC_V_SC_i.Processor.Datapath.Jumb_MUX.Result,
            RISC_V_SC_i.Processor.Control_Unit.Branch,
            RISC_V_SC_i.Processor.Control_Unit.Zero,
            RISC_V_SC_i.Processor.Control_Unit.PCSrc);
    
end




    
endmodule