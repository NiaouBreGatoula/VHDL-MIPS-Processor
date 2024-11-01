<p align="center">
  <img src="https://i.postimg.cc/KvckLHXs/21169439.png" alt="VHDL Logo" width="200"/>
</p>

# Single-Cycle MIPS Processor in VHDL

This repository contains a single-cycle MIPS processor implemented in VHDL as part of a university project. The processor includes essential MIPS architecture components, allowing for the execution of fundamental instructions such as `add`, `sub`, `addi`, `lw`, `sw`, and `bne`.

## 🚀 Overview

The project demonstrates a single-cycle processor architecture in VHDL, with simulation files to verify functionality. Key elements include an Arithmetic Logic Unit (ALU), register file, memory modules, and control unit.

## 📁 Project Structure

- **ALU.vhd** - Arithmetic Logic Unit for performing basic operations.
- **RegisterFile.vhd** - Register file for storing and accessing data.
- **DataMemory.vhd** - Data memory for load and store instructions.
- **ControlUnit.vhd** - Control logic to manage processor operations.
- **ProgramCounter.vhd** - Program Counter for tracking instruction addresses.
- **InstructionMemory.vhd** - Memory module for storing program instructions.
- **Mux.vhd** - Multiplexer units for various control paths.

## 🧪 Simulation

Testbenches for each module are provided:
- **ALU_tb.vhd**
- **RegisterFile_tb.vhd**
- **DataMemory_tb.vhd**
- **ControlUnit_tb.vhd**
  
Run these simulations in your preferred VHDL simulation software to validate each module.

## 📜 Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/NiaouBreGatoula/VHDL-MIPS-Processor.git
