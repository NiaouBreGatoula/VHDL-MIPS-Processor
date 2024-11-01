library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MIPS is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        PC_out : out STD_LOGIC_VECTOR(31 downto 0);
        ALU_result : out STD_LOGIC_VECTOR(31 downto 0);
        instruction : out STD_LOGIC_VECTOR(31 downto 0)
    );
end MIPS;

architecture Behavioral of MIPS is
    signal sel_signal : std_logic;
    signal PC_internal, PC_in : STD_LOGIC_VECTOR(31 downto 0);
    signal instruction_internal : STD_LOGIC_VECTOR(31 downto 0);
    signal ALU_result_internal, ALU_in2 : STD_LOGIC_VECTOR(31 downto 0);
    signal reg_write_data, reg_read_data1_internal, reg_read_data2_internal : STD_LOGIC_VECTOR(31 downto 0);
    signal sign_extended : STD_LOGIC_VECTOR(31 downto 0);
    signal zero_flag : STD_LOGIC;
    signal ALUControl : STD_LOGIC_VECTOR(2 downto 0);
    signal BranchAddr, PCPlus1, BranchTarget : STD_LOGIC_VECTOR(31 downto 0);

    signal MemRead, MemWrite, RegWrite, ALUSrc, MemtoReg, RegDst, Branch : STD_LOGIC;
    signal ALUOp : STD_LOGIC_VECTOR(1 downto 0);
    signal WriteReg : STD_LOGIC_VECTOR(4 downto 0); 
--instruction moirasma
    signal opcode : STD_LOGIC_VECTOR(5 downto 0);
    signal rs : STD_LOGIC_VECTOR(4 downto 0);
    signal rt : STD_LOGIC_VECTOR(4 downto 0);
    signal rd : STD_LOGIC_VECTOR(4 downto 0);
    signal shamt : STD_LOGIC_VECTOR(4 downto 0);
    signal funct : STD_LOGIC_VECTOR(5 downto 0);
    signal immediate : STD_LOGIC_VECTOR(15 downto 0);
    signal address : STD_LOGIC_VECTOR(25 downto 0);

begin
    PC_out <= PC_internal;
    ALU_result <= ALU_result_internal;
    instruction <= instruction_internal;

    opcode <= instruction_internal(31 downto 26);
    rs <= instruction_internal(25 downto 21);
    rt <= instruction_internal(20 downto 16);
    rd <= instruction_internal(15 downto 11);
    shamt <= instruction_internal(10 downto 6);
    funct <= instruction_internal(5 downto 0);
    immediate <= instruction_internal(15 downto 0);
    address <= instruction_internal(25 downto 0);

    -- PC(7)
    PC_inst : entity work.ProgramCounter
        port map (
            clk => clk,
            reset => reset,
            PCIn => PC_in,
            PCOut => PC_internal
        );

    -- IMEM (4)
    instruction_memory_inst : entity work.IMem
        port map (
            addr => PC_internal(3 downto 0),  -- 4-bit address for instruction memory
            data_out => instruction_internal
        );

    -- Control unit instance (5)
    control_unit_inst : entity work.ControlUnit
        port map (
            OpCode => opcode,
            RegDst => RegDst,
            ALUSrc => ALUSrc,
            MemtoReg => MemtoReg,
            RegWrite => RegWrite,
            MemRead => MemRead,
            MemWrite => MemWrite,
            Branch => Branch,
            ALUOp => ALUOp
        );

    -- Register(2)
    reg_file_inst : entity work.RegisterFile
        port map (
            clk => clk,
            RegWrite => RegWrite,
            ReadReg1 => rs,
            ReadReg2 => rt,
            WriteReg => WriteReg,
            WriteData => reg_write_data,
            ReadData1 => reg_read_data1_internal,
            ReadData2 => reg_read_data2_internal
        );

    -- Signextension (9)
    sign_ext_inst : entity work.Signextension
        port map (
            input => immediate,
            output => sign_extended
        );

    -- ALUControl (6)
    alu_control_inst : entity work.ALUControlUnit
        port map (
            ALUOp => ALUOp,
            Funct => funct,
            ALUControl => ALUControl
        );

    -- ALU (10)
    alu_inst : entity work.ALU
        port map (
            A => reg_read_data1_internal,
            B => ALU_in2,
            ALUControl => ALUControl,
            Result => ALU_result_internal,
            Zero => zero_flag
        );

    -- Datamem (11)
    data_memory_inst : entity work.DataMemory
        port map (
            Clk => clk,
            Address => ALU_result_internal,
            WriteData => reg_read_data2_internal,
            MemRead => MemRead,
            MemWrite => MemWrite,
            ReadData => reg_write_data
        );

    -- 32mux2to1 (10)
    ALUSrcMux : entity work.mux2to1_32bit
        port map (
            input0 => reg_read_data2_internal,
            input1 => sign_extended,
            sel => ALUSrc,
            output => ALU_in2
        );

    -- 5mux2to1 (8)
    RegDstMux : entity work.Mux2to1
        port map (
            A => rt,
            B => rd,
            Sel => RegDst,
            Y => WriteReg
        );

    -- 32mux2to1(12)
    MemtoRegMux : entity work.mux2to1_32bit
        port map (
            input0 => ALU_result_internal,
            input1 => reg_write_data,
            sel => MemtoReg,
            output => reg_write_data
        );

    --egw to ebala..kalou kakou(13)
    BranchAddr <= std_logic_vector(signed(sign_extended) sll 2);
    BranchTarget <= std_logic_vector(signed(PC_internal) + signed(BranchAddr));

    -- Adder for PC+1(14)
    PCAdder : entity work.Adder32
        port map (
            A => PC_internal,
            B => X"00000001",    
            Sum => PCPlus1
        );

    sel_signal <= Branch and zero_flag;

    -- 32mux2to1(15)
    PCSrcMux : entity work.mux2to1_32bit
        port map (
            input0 => PCPlus1,
            input1 => BranchTarget,
            sel => sel_signal,
            output => PC_in
        );

end Behavioral;
