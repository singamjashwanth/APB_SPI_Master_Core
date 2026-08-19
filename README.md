# 🚀 APB-Based SPI Master IP Core

<div align="center">

### AMBA APB | SPI Protocol | Verilog HDL | ASIC Front-End Design Flow

A fully integrated, configurable, and verified **SPI Master IP Core** controlled through an **AMBA APB (Advanced Peripheral Bus)** interface, developed using **Verilog HDL** and validated through a complete ASIC front-end design flow.

![Verilog](https://img.shields.io/badge/RTL-Verilog-blue)
![APB](https://img.shields.io/badge/Protocol-AMBA%20APB-orange)
![SPI](https://img.shields.io/badge/Protocol-SPI-green)
![Verification](https://img.shields.io/badge/Verification-Completed-brightgreen)
![Lint](https://img.shields.io/badge/VC%20SpyGlass-PASS-success)
![Synthesis](https://img.shields.io/badge/Synopsys%20DC-PASS-success)
![Status](https://img.shields.io/badge/Project-Completed-success)

</div>

---

# 📌 Project Overview

The **APB-Based SPI Master IP Core** is a configurable serial communication controller that enables communication between a processor and SPI-compatible peripherals through a standard AMBA APB interface.

The IP core supports:

* APB-based register programming
* Configurable SPI operating modes
* Programmable baud-rate generation
* MOSI/MISO serial communication
* Master mode operation
* Transfer status monitoring
* Interrupt generation
* Full system-level verification

This project was developed following an industry-oriented ASIC front-end methodology, including RTL design, functional verification, lint analysis, logic synthesis, and subsystem integration.

---

# 🎯 Project Goals

### Functional Goals

* Implement a configurable SPI Master Controller
* Support APB register access
* Support SPI Modes 0, 1, 2, and 3
* Support configurable baud-rate generation
* Support MSB-first and LSB-first communication
* Generate SPI clock and slave-select signals
* Enable full-duplex SPI communication
* Generate transfer completion notifications

### Learning Goals

* RTL Design using Verilog HDL
* Functional Verification
* Testbench Development
* Protocol Implementation (APB & SPI)
* SpyGlass Lint Analysis
* Design Compiler Synthesis
* Top-Level Integration
* ASIC Front-End Design Flow

---

# 🏗️ System Architecture

```text
                        +----------------------+
                        |      APB MASTER      |
                        +----------+-----------+
                                   |
                                   |
                                   v
+----------------------------------------------------------------+
|                    SPI MASTER IP CORE                          |
|                                                                |
|   +--------------------+                                       |
|   |  APB Interface     |                                       |
|   | Register Bank/FSM  |                                       |
|   +---------+----------+                                       |
|             |                                                  |
|             v                                                  |
|   +--------------------+                                       |
|   | SPI Slave Control  |                                       |
|   +----+----------+----+                                       |
|        |          |                                            |
|        |          |                                            |
|        v          v                                            |
|  +-----------+   +-----------+                                 |
|  | Clock Gen |   | SPI Shift |                                 |
|  +-----------+   +-----------+                                 |
|                                                                |
+----------------------------------------------------------------+
             |         |          |           |
             v         v          v           v

           MOSI      MISO       SCLK        SS
```

---

# 📚 Supported SPI Features

## SPI Modes

| SPI Mode | CPOL | CPHA |
| -------- | ---- | ---- |
| Mode 0   | 0    | 0    |
| Mode 1   | 0    | 1    |
| Mode 2   | 1    | 0    |
| Mode 3   | 1    | 1    |

---

## Data Transfer Features

* Full Duplex Communication
* Master Mode Operation
* MSB First Transmission
* LSB First Transmission
* Parallel-to-Serial Conversion
* Serial-to-Parallel Conversion
* Transfer-In-Progress Detection
* Transfer Completion Detection

---

## Clock Features

* Programmable SPI Clock
* Baud Rate Prescaler
* CPOL Support
* CPHA Support
* Edge-Based Sampling
* Edge-Based Transmission

---

# 🧩 Design Modules

---

## 1. APB Interface

### Responsibilities

* APB Slave Protocol Handling
* Register Access Management
* Configuration Storage
* Status Monitoring
* Interrupt Generation

### Implemented Registers

| Register | Description             |
| -------- | ----------------------- |
| SPI_CR1  | SPI Control Register 1  |
| SPI_CR2  | SPI Control Register 2  |
| SPI_BR   | Baud Rate Configuration |
| SPI_DR   | SPI Data Register       |
| SPI_SR   | SPI Status Register     |

---

## 2. Serial Clock Generator

### Responsibilities

* SPI Clock Generation
* Baud Rate Division
* CPOL Handling
* CPHA Handling
* Edge Generation

### Features

✅ Programmable Clock Divider

✅ CPOL Support

✅ CPHA Support

✅ Multi-Mode SPI Operation

✅ Transmit Edge Flags

✅ Receive Edge Flags

---

## 3. SPI Shifter

### Responsibilities

* MOSI Data Transmission
* MISO Data Reception
* Data Serialization
* Data Deserialization

### Features

✅ MSB First Support

✅ LSB First Support

✅ Parallel-to-Serial Conversion

✅ Serial-to-Parallel Conversion

✅ SPI Mode Compatibility

---

## 4. SPI Slave Control

### Responsibilities

* Slave Select Control
* Transfer Management
* Transfer Completion Detection
* Transfer-In-Progress Monitoring

### Features

✅ SS Generation

✅ Transfer Start Control

✅ Receive Completion Detection

✅ Transfer Status Generation

---

## 5. SPI Core Top

### Responsibilities

* Subsystem Integration
* Intermodule Communication
* External SPI Interface

### Features

✅ APB Integration

✅ SPI Integration

✅ Interrupt Support

✅ End-to-End Communication

---

# 🔄 ASIC Front-End Design Flow

```text
Requirement Analysis
        ↓
RTL Architecture
        ↓
RTL Coding
        ↓
Testbench Development
        ↓
Functional Verification
        ↓
Waveform Validation
        ↓
VC SpyGlass Linting
        ↓
Design Compiler Synthesis
        ↓
Gate-Level Netlist Generation
        ↓
Top-Level Integration
        ↓
System Verification
```

---

# 🧪 Verification Methodology

Each RTL block was verified independently before subsystem integration.

### Verification Performed

✅ APB Write Operations

✅ APB Read Operations

✅ SPI Clock Verification

✅ MOSI Transmission Verification

✅ MISO Reception Verification

✅ SPI Mode Verification

✅ Baud Rate Verification

✅ Interrupt Verification

✅ Transfer Completion Verification

✅ Top-Level Integration Verification

---

# 📊 Project Status

| Module                 | RTL | Testbench | Verification | Lint | Synthesis |
| ---------------------- | --- | --------- | ------------ | ---- | --------- |
| APB Interface          | ✅   | ✅         | ✅            | ✅    | ✅         |
| Serial Clock Generator | ✅   | ✅         | ✅            | ✅    | ✅         |
| SPI Shifter            | ✅   | ✅         | ✅            | ✅    | ✅         |
| SPI Slave Control      | ✅   | ✅         | ✅            | ✅    | ✅         |
| SPI Core Top           | ✅   | ✅         | ✅            | ✅    | ✅         |

---

# 📂 Repository Structure

```text
APB_SPI_MASTER_CORE/
│
├── rtl/
│   ├── spi_apb_interface.v
│   ├── serial_clock_generator.v
│   ├── spi_shifter.v
│   ├── spi_slave_control.v
│   └── spi_core_top.v
│
├── tb/
│   ├── spi_apb_interface_tb.v
│   ├── serial_clock_generator_tb.v
│   ├── spi_shifter_tb.v
│   ├── spi_slave_control_tb.v
│   └── spi_core_top_tb.v
│
├── docs/
│
├── reports/
│   ├── lint/
│   └── synthesis/
│
├── netlist/
│
├── waveforms/
│
├── scripts/
│
└── README.md
```

---

# 🛠️ Tools & Technologies

| Category           | Tool                     |
| ------------------ | ------------------------ |
| RTL Design         | Verilog HDL              |
| Simulation         | ModelSim                 |
| Lint Analysis      | Synopsys VC SpyGlass     |
| Logic Synthesis    | Synopsys Design Compiler |
| Version Control    | Git                      |
| Repository Hosting | GitHub                   |
| Operating System   | Linux                    |

---

# 🚀 Future Enhancements

* SystemVerilog Migration
* Assertion-Based Verification (SVA)
* Functional Coverage
* Constrained Random Verification
* UVM Testbench Development
* Formal Verification
* FPGA Prototyping
* APB Bus Functional Model

---

# 👨‍💻 Author

## Singam Jashwanth

**B.Tech Electronics & Communication Engineering**

**Advanced VLSI Design & Verification Trainee @ Maven Silicon**

**Aspiring Design Verification Engineer**

### Connect With Me

📧 Email: [singamjashwanthyadav@gmail.com](mailto:singamjashwanthyadav@gmail.com)

💼 LinkedIn: https://www.linkedin.com/in/singam-jashwanth

💻 GitHub: https://github.com/singamjashwanth

---

# ⭐ Project Highlights

* Complete APB-Based SPI Master Implementation
* Fully Modular RTL Architecture
* Protocol-Level Verification
* SpyGlass Lint Clean Design
* Design Compiler Synthesized RTL
* Gate-Level Netlist Generated
* Top-Level Integrated and Verified
* ASIC Front-End Design Flow Demonstration

---

<div align="center">

## ✅ PROJECT COMPLETED

**A complete APB-Based SPI Master IP Core developed using industry-standard ASIC design methodologies.**

</div>
