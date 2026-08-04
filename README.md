# APB Based SPI Master Core

> A modular APB (Advanced Peripheral Bus) interfaced SPI Master IP Core implemented in Verilog HDL.

---

## 📖 Project Overview

This project implements an **APB-based SPI Master IP Core** using **Verilog HDL**. The design follows a modular architecture where each functional block is developed, verified, and integrated incrementally.

The objective is to design a configurable SPI Master that communicates with peripherals through the SPI protocol while being controlled via an APB interface.

---

## 🎯 Project Objectives

- Design an APB-compliant SPI Master IP Core
- Implement a configurable Serial Clock Generator
- Design a Shift Register for SPI transmission and reception
- Develop an APB Slave Interface
- Implement SPI Control Logic
- Verify each module using dedicated testbenches
- Integrate all modules into a complete SPI Master Core

---

## 🏗 Architecture

The SPI Master IP Core consists of the following major modules:

- Serial Clock Generator
- Shift Register
- APB Slave Interface
- SPI Control Logic

> 📌 A detailed architecture diagram will be added after project completion.

---

## 📊 Development Status

| Module | Status |
|---------|--------|
| ✅ Serial Clock Generator | Completed |
| ✅ Shift Register | Completed |
| 🚧 APB Slave Interface | In Progress |
| 🚧 SPI Control Logic | In Progress |
| ⏳ Module Integration | Pending |
| ⏳ Functional Verification | Pending |
| ⏳ Final Documentation | Pending |

---

## 📂 Repository Structure

```
APB_SPI_Master_Core/
│
├── rtl/
│   ├── serial_clock_generator.v
│   ├── shift_register.v
│   ├── apb_slave_interface.v
│   └── spi_control.v
│
├── tb/
│   ├── serial_clock_generator_tb.v
│   ├── shift_register_tb.v
│
├── docs/
│
├── images/
│
├── waveforms/
│
└── README.md
```

---

## 🛠 Tools & Technologies

- Verilog HDL
- ModelSim
- QuestaSim
- Xilinx Vivado
- Git
- GitHub

---

## 🚀 Completed Modules

### 1. Serial Clock Generator

Features

- Configurable SPI clock generation
- Clock division logic
- Supports SPI clock generation for the master

Status

- RTL Completed
- Testbench Completed
- Verification Completed

---

### 2. Shift Register

Features

- Serial data transmission
- Serial data reception
- Parallel-to-Serial conversion
- Serial-to-Parallel conversion

Status

- RTL Completed
- Testbench Completed
- Verification Completed

---

## 🚧 Modules Under Development

### APB Slave Interface

Responsible for:

- Register access
- APB Read Transactions
- APB Write Transactions
- Control Register Configuration
- Status Register Updates

---

### SPI Control Logic

Responsible for:

- SPI Transaction Control
- Slave Select Generation
- Interrupt Generation
- Transfer Completion Logic
- FSM Control

---

## 🧪 Verification Plan

Each RTL module will include:

- Dedicated Testbench
- Simulation Waveforms
- Functional Verification
- Design Documentation

---

## 📌 Future Enhancements

- Complete APB Interface
- Complete SPI Control Logic
- Integrate all RTL modules
- SystemVerilog Testbench
- Assertion-Based Verification
- UVM Verification Environment

---

## 📅 Current Progress

- ✅ Repository Initialized
- ✅ Project Structure Created
- ✅ Serial Clock Generator Completed
- ✅ Shift Register Completed
- 🚧 APB Interface Development
- 🚧 SPI Control Logic Development

---

## 👨‍💻 Author

**Singam Jashwanth**

Electronics & Communication Engineering

Aspiring VLSI Design Verification Engineer

LinkedIn: https://www.linkedin.com/in/singam-jashwanth

Email: singamjashwanthyadav@gmail.com

---

⭐ This project is actively under development. Updates will be pushed as each module is completed and verified.
