# APB Based SPI Master Core

> A modular APB (Advanced Peripheral Bus) interfaced SPI Master IP Core implemented in Verilog HDL.

---

# 📖 Project Overview

This project implements an **APB-based SPI Master IP Core** using **Verilog HDL**. The design follows a modular architecture where each functional block is independently designed, verified, lint-checked, synthesized, and then integrated into the complete SPI Master subsystem.

The SPI Master communicates with external peripherals using the SPI protocol and is controlled through an APB interface.

---

# 🎯 Project Objectives

* Design an APB-compliant SPI Master IP Core
* Implement a configurable Serial Clock Generator
* Implement a configurable SPI Shifter
* Develop an APB Slave Interface
* Design SPI Control Logic
* Perform RTL Verification
* Perform Lint Analysis using SpyGlass
* Perform Logic Synthesis using Synopsys Design Compiler
* Integrate all modules into a complete SPI Master Core

---

# 🏗 Architecture

The SPI Master IP Core consists of the following major modules:

* Serial Clock Generator
* SPI Shifter
* APB Slave Interface
* SPI Control Logic

> 📌 Architecture diagram will be added after complete module integration.

---

# 📊 Development Status

| Module                    | Status      |
| ------------------------- | ----------- |
| ✅ Serial Clock Generator  | Completed   |
| ✅ SPI Shifter             | Completed   |
| 🚧 APB Slave Interface    | In Progress |
| 🚧 SPI Control Logic      | In Progress |
| ⏳ Module Integration      | Pending     |
| ⏳ Functional Verification | Pending     |
| ⏳ Final Documentation     | In Progress |

---

# 📂 Repository Structure

```text
APB_SPI_Master_Core/
│
├── rtl/
│   ├── serial_clock_generator.v
│   ├── spi_shifter.v
│   ├── apb_slave_interface.v
│   └── spi_control.v
│
├── tb/
│   ├── serial_clock_generator_tb.v
│   └── spi_shifter_tb.v
│
├── docs/
│   ├── serial_clock_generator.md
│   └── spi_shifter.md
│
├── reports/
│   ├── lint/
│   └── synthesis/
│
├── waveforms/
│
├── images/
│
└── README.md
```

---

# 🛠 Tools & Technologies

### Design

* Verilog HDL

### Simulation

* ModelSim
* QuestaSim

### Lint Analysis

* Synopsys SpyGlass

### Synthesis

* Synopsys Design Compiler

### FPGA / RTL Development

* Xilinx Vivado

### Version Control

* Git
* GitHub

---

# 🚀 Completed Modules

## 1. Serial Clock Generator

### Features

* Configurable SPI clock generation
* Clock divider implementation
* SPI clock enable generation
* Support for SPI timing requirements

### Verification Status

* ✅ RTL Completed
* ✅ Testbench Developed
* ✅ Functional Verification Completed
* ✅ SpyGlass Lint Checked
* ✅ Design Compiler Synthesis Completed

---

## 2. SPI Shifter

### Features

* Parallel-to-Serial conversion (MOSI)
* Serial-to-Parallel conversion (MISO)
* Supports SPI Modes 0, 1, 2 and 3
* Supports MSB-First and LSB-First transfers
* Separate transmit and receive paths
* Slave Select controlled operation

### Verification Status

* ✅ RTL Completed
* ✅ Testbench Developed
* ✅ Functional Verification Completed
* ✅ Documentation Completed
* ✅ SpyGlass Lint Checked
* ✅ Design Compiler Synthesis Completed

---

# 📑 Quality Checks Performed

## SpyGlass Lint Analysis

Completed for:

* Serial Clock Generator
* SPI Shifter

Checks Performed:

* Syntax Analysis
* Coding Style Checks
* Unused Signal Detection
* Width Mismatch Checks
* Connectivity Checks
* RTL Design Rule Compliance

Status:

```text
PASS
```

---

## Synopsys Design Compiler Synthesis

Completed for:

* Serial Clock Generator
* SPI Shifter

Generated Reports:

* Area Report
* Timing Report
* Power Report
* Synthesized Netlist

Status:

```text
Synthesis Successful
```

---

# 🚧 Modules Under Development

## APB Slave Interface

Responsibilities:

* APB Read Transactions
* APB Write Transactions
* Register Access Logic
* Configuration Register Support
* Status Register Support

Current Status:

```text
RTL Development In Progress
```

---

## SPI Control Logic

Responsibilities:

* SPI Transaction Control
* Slave Select Generation
* Transfer Start Logic
* Transfer Completion Logic
* FSM Design
* Interrupt Generation

Current Status:

```text
RTL Development In Progress
```

---

# 🧪 Verification Strategy

Each RTL module follows the same development flow:

```text
RTL Design
      ↓
Testbench Development
      ↓
Functional Simulation
      ↓
SpyGlass Lint Analysis
      ↓
Design Compiler Synthesis
      ↓
Documentation
      ↓
Integration
```

---

# 📌 Future Enhancements

* Complete APB Slave Interface
* Complete SPI Control Logic
* Full Module Integration
* SystemVerilog Testbench Development
* Assertion-Based Verification
* Functional Coverage
* UVM Verification Environment

---

# 📅 Current Progress

* ✅ Repository Initialized
* ✅ Project Structure Created
* ✅ Serial Clock Generator Completed
* ✅ Serial Clock Generator Verified
* ✅ Serial Clock Generator Lint Checked
* ✅ Serial Clock Generator Synthesized
* ✅ SPI Shifter Completed
* ✅ SPI Shifter Verified
* ✅ SPI Shifter Lint Checked
* ✅ SPI Shifter Synthesized
* 🚧 APB Slave Interface Development
* 🚧 SPI Control Logic Development

---

# 👨‍💻 Author

**Singam Jashwanth**

B.Tech Electronics & Communication Engineering (ECE)
RGUKT Basar

Aspiring VLSI Design Verification Engineer

LinkedIn: [www.linkedin.com/in/singam-jashwanth](http://www.linkedin.com/in/singam-jashwanth)

Email: [singamjashwanthyadav@gmail.com](mailto:singamjashwanthyadav@gmail.com)

---

# ⭐ Project Status

This project is actively under development. New RTL modules, verification results, lint reports, synthesis reports, and documentation will be added as development progresses.
