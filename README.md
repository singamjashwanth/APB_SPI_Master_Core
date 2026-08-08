# 🚀 APB Based SPI Master Core

### Verilog HDL | APB Protocol | SPI Protocol | ASIC Front-End Design Flow

A modular **APB (Advanced Peripheral Bus) based SPI Master IP Core** implemented in **Verilog HDL** and verified using industry-standard ASIC design tools.

![RTL](https://img.shields.io/badge/RTL-Verilog-blue)
![Lint](https://img.shields.io/badge/Lint-VC%20SpyGlass-green)
![Synthesis](https://img.shields.io/badge/Synthesis-Synopsys%20DC-orange)
![Status](https://img.shields.io/badge/Project-In%20Progress-yellow)

---

# 📖 Project Overview

This project implements a configurable **SPI Master IP Core** controlled through an **APB Interface**.

The design follows a modular ASIC front-end development methodology where every RTL block is:

- ✅ Designed in Verilog HDL
- ✅ Functionally Verified
- ✅ Waveform Validated
- ✅ Lint Checked using Synopsys VC SpyGlass
- ✅ Synthesized using Synopsys Design Compiler
- ✅ Converted to Gate-Level Netlist
- ✅ Documented for Reusability

The objective is to gain hands-on experience in RTL Design, Verification, Linting, and Logic Synthesis using industry-standard tools.

---

# 🎯 Project Objectives

- Design an APB-compliant SPI Master IP Core
- Implement configurable Serial Clock Generation
- Implement SPI Shift Register Logic
- Develop APB Slave Interface
- Develop SPI Control Logic
- Verify each module independently
- Perform ASIC Front-End Design Flow
- Integrate all modules into a complete SPI Master subsystem

---

# 🏗 SPI Master Architecture

```text
                    +-------------------+
                    |   APB Interface   |
                    +---------+---------+
                              |
                              v
                    +-------------------+
                    |  SPI Control Unit |
                    +----+---------+----+
                         |         |
                         v         v
              +---------------+  +---------------+
              | Clock Gen     |  | SPI Shifter   |
              +---------------+  +---------------+
```

> Detailed architecture diagram will be added after complete subsystem integration.

---

# 🔄 ASIC Front-End Design Flow

```text
RTL Design
    ↓
Testbench Development
    ↓
Functional Simulation
    ↓
Waveform Verification
    ↓
VC SpyGlass Linting
    ↓
Design Compiler Synthesis
    ↓
Gate-Level Netlist Generation
    ↓
Subsystem Integration
```

---

# 📊 Development Status

| Module | RTL | TB | Lint | Synthesis |
|----------|----------|----------|----------|----------|
| Serial Clock Generator | ✅ | ✅ | ✅ | ✅ |
| SPI Shifter | ✅ | ✅ | ✅ | ✅ |
| APB Slave Interface | 🚧 | 🚧 | ⏳ | ⏳ |
| SPI Control Logic | 🚧 | 🚧 | ⏳ | ⏳ |
| Top-Level Integration | ⏳ | ⏳ | ⏳ | ⏳ |

---

# 📂 Repository Structure

```text
APB_SPI_Master_Core/
│
├── rtl/
│   ├── serial_clock_generator.v
│   ├── spi_shifter.v
│
├── tb/
│   ├── serial_clock_generator_tb.v
│   ├── spi_shifter_tb.v
│
├── docs/
│   ├── serial_clock_generator.md
│   └── spi_shifter.md
│
├── waveforms/
│
├── schematic/
│
├── netlist/
│   ├── serial_clock_generator_netlist.v
│   └── spi_shifter_netlist.v
│
├── reports/
│   ├── lint/
│   │   ├── serial_clock_generator_lint_report.txt
│   │   └── spi_shifter_lint_report.txt
│   │
│   └── synthesis/
│       ├── serial_clock_generator_area_report.txt
│       └── spi_shifter_area_report.txt
│
├── scripts/
│   ├── lint/
│   │   ├── serial_clock_generator_lint.tcl
│   │   └── spi_shifter_lint.tcl
│   │
│   └── synthesis/
│       ├── serial_clock_generator_dc.tcl
│       └── spi_shifter_dc.tcl
│
└── README.md
```

---

# 🚀 Completed Module : Serial Clock Generator

### Features

- Programmable SPI Clock Generation
- Baud Rate Selection Logic
- CPOL Support
- CPHA Support
- Multi-Mode SPI Clock Generation

### Verification

- Dedicated Testbench Developed
- Functional Verification Completed
- Waveform Validation Completed

### VC SpyGlass Lint Result

| Fatals | Errors | Warnings |
|---------|---------|---------|
| 0 | 0 | 0 |

**Status:** ✅ PASS

### Design Compiler Synthesis Result

| Metric | Value |
|----------|----------|
| Total Cells | 195 |
| Combinational Cells | 177 |
| Sequential Cells | 17 |
| Total Cell Area | 419 |

**Status:** ✅ PASS

📄 Documentation: `docs/serial_clock_generator.md`

---

# 🚀 Completed Module : SPI Shifter

### Features

- MOSI Transmission
- MISO Reception
- LSB First Support
- MSB First Support
- Parallel-to-Serial Conversion
- Serial-to-Parallel Conversion
- SPI Mode Support

### Verification

- Dedicated Testbench Developed
- Functional Verification Completed
- Waveform Validation Completed

### VC SpyGlass Lint Result

| Fatals | Errors | Warnings |
|---------|---------|---------|
| 0 | 0 | 0 |

**Status:** ✅ PASS

### Design Compiler Synthesis

**Status:** ✅ PASS

📄 Documentation: `docs/spi_shifter.md`

---

# 🛠 Tools Used

| Category | Tool |
|----------|----------|
| RTL Design | Verilog HDL |
| Simulation | ModelSim |
| Lint Analysis | Synopsys VC SpyGlass |
| Logic Synthesis | Synopsys Design Compiler |
| Version Control | Git |
| Repository Hosting | GitHub |
| Operating System | Linux |

---

# 📈 Current Progress

- ✅ Repository Initialized
- ✅ Serial Clock Generator Completed
- ✅ SPI Shifter Completed
- ✅ Functional Verification Completed
- ✅ VC SpyGlass Linting Completed
- ✅ Design Compiler Synthesis Completed
- 🚧 APB Slave Interface Development
- 🚧 SPI Control Logic Development
- ⏳ Top-Level Integration
- ⏳ System-Level Verification

---

# 📌 Future Enhancements

- Complete APB Slave Interface
- Complete SPI Control Logic
- Integrate Complete SPI Master Core
- SystemVerilog-Based Verification
- Assertion-Based Verification (SVA)
- Functional Coverage
- UVM Testbench Development

---

# 👨‍💻 Author

## Singam Jashwanth

**B.Tech Electronics & Communication Engineering**

**Advanced VLSI Design & Verification Trainee @ Maven Silicon**

**Aspiring Design Verification Engineer**

### Connect

- LinkedIn: https://www.linkedin.com/in/singam-jashwanth
- GitHub: https://github.com/singamjashwanth

---

# ⭐ Project Status

**Actively Under Development**

### Module Completion

| Module | Status |
|----------|----------|
| Serial Clock Generator | ✅ Completed |
| SPI Shifter | ✅ Completed |
| APB Slave Interface | 🚧 In Progress |
| SPI Control Logic | 🚧 In Progress |
| Top-Level Integration | ⏳ Pending |

---

### ASIC Front-End Flow Followed

```text
RTL Design
    ↓
Testbench Development
    ↓
Functional Verification
    ↓
VC SpyGlass Linting
    ↓
Design Compiler Synthesis
    ↓
Gate-Level Netlist Generation
    ↓
Subsystem Integration
```

🚀 New modules, reports, waveforms, and verification results will be added as development progresses.
