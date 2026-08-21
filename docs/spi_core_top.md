# SPI Core Top

## Overview

The SPI Core Top module is the top-level integration block of the APB-Based SPI Master Core IP.

It integrates four major functional blocks:

1. APB Interface
2. Serial Clock Generator
3. SPI Slave Control
4. SPI Shifter

The module provides a complete APB-to-SPI bridge that allows a processor to configure SPI parameters, initiate transfers, communicate with SPI slaves, and receive transfer status through an APB bus interface.

---

## Top-Level Architecture

![SPI Core Top Architecture](architecture.png)

---

## Features

- APB Slave Interface
- SPI Master Mode Operation
- Configurable Baud Rate Generation
- Support for SPI Modes 0, 1, 2 and 3
- Programmable Clock Polarity (CPOL)
- Programmable Clock Phase (CPHA)
- MSB-First and LSB-First Transmission
- Automatic Slave Select Generation
- Full-Duplex SPI Communication
- Interrupt Generation Support
- RUN, WAIT and STOP Mode Support
- Synthesizable RTL Design

---

## Internal Block Diagram

```text
                    +-------------------+
                    |  APB Interface    |
                    +---------+---------+
                              |
                              |
                              v
                    +-------------------+
                    | SPI Slave Control |
                    +---------+---------+
                              |
                              v
                    +-------------------+
                    | Serial Clock Gen  |
                    +---------+---------+
                              |
                              v
                    +-------------------+
                    |   SPI Shifter     |
                    +---------+---------+
                              |
                    +---------+---------+
                    |                   |
                    v                   v
                  MOSI                MISO
```

---

## Submodule Description

### 1. APB Interface

Responsible for:

- APB Read Transactions
- APB Write Transactions
- SPI Register Management
- Interrupt Generation
- SPI Mode Configuration
- Data Register Access

Configured Registers:

| Register | Address |
|-----------|----------|
| SPI_CR1 | 0x0 |
| SPI_CR2 | 0x1 |
| SPI_BR | 0x2 |
| SPI_SR | 0x3 |
| SPI_DR | 0x5 |

---

### 2. Serial Clock Generator

Responsible for:

- SPI Clock Generation
- Baud Rate Calculation
- CPOL Handling
- CPHA Handling
- MOSI Timing Pulses
- MISO Sampling Pulses

Clock Divider:

```text
BaudRateDivisor = (SPPR + 1) × 2^(SPR + 1)
```

---

### 3. SPI Slave Control

Responsible for:

- Slave Select Generation
- Transfer Duration Control
- Transfer-In-Progress Indication
- Receive Data Trigger Generation

Outputs:

```text
SS
TIP
RECEIVE_DATA
```

---

### 4. SPI Shifter

Responsible for:

- MOSI Serialization
- MISO Deserialization
- MSB-First Transmission
- LSB-First Transmission
- SPI Mode Support

Supports:

```text
Mode 0
Mode 1
Mode 2
Mode 3
```

---

## Top-Level Inputs

### APB Interface Signals

| Signal | Width | Description |
|----------|----------|-------------|
| PCLK | 1 | APB Clock |
| PRESET_n | 1 | Active Low Reset |
| PADDR_i | 3 | APB Address |
| PWRITE_i | 1 | Read/Write Select |
| PSEL_i | 1 | Peripheral Select |
| PENABLE_i | 1 | APB Enable |
| PWDATA_i | 8 | APB Write Data |

---

### SPI Signals

| Signal | Width | Description |
|----------|----------|-------------|
| miso_i | 1 | SPI MISO Input |

---

## Top-Level Outputs

### APB Outputs

| Signal | Width | Description |
|----------|----------|-------------|
| PRDATA_o | 8 | APB Read Data |
| PREADY_o | 1 | APB Ready |
| PSLVERR_o | 1 | APB Error Response |

### SPI Outputs

| Signal | Width | Description |
|----------|----------|-------------|
| ss_o | 1 | Slave Select |
| sclk_o | 1 | SPI Serial Clock |
| mosi_o | 1 | SPI MOSI Output |

### Interrupt Output

| Signal | Width | Description |
|----------|----------|-------------|
| spi_interrupt_request_o | 1 | SPI Interrupt Request |

---

## Data Flow

### Transmit Path

```text
CPU
 ↓
APB Write
 ↓
SPI_DR
 ↓
SPI Shifter
 ↓
MOSI
 ↓
SPI Slave
```

---

### Receive Path

```text
SPI Slave
 ↓
MISO
 ↓
SPI Shifter
 ↓
SPI_DR
 ↓
APB Read
 ↓
CPU
```

---

## SPI Transfer Sequence

### Step 1

Processor configures:

```text
SPI_CR1
SPI_CR2
SPI_BR
```

through APB writes.

---

### Step 2

Processor writes transmit data into:

```text
SPI_DR
```

---

### Step 3

Slave Control asserts:

```text
SS = LOW
```

---

### Step 4

Serial Clock Generator produces:

```text
SCLK
```

according to configured baud rate.

---

### Step 5

SPI Shifter:

```text
MOSI → Transmit
MISO → Receive
```

---

### Step 6

Transfer completes and:

```text
receive_data_o = 1
```

---

### Step 7

Received data is stored into:

```text
SPI_DR
```

---

### Step 8

Interrupt is generated if enabled.

---

## Functional Verification

A self-checking Verilog testbench was developed to verify:

- APB Write Transactions
- APB Read Transactions
- SPI Data Transmission
- SPI Data Reception
- Baud Rate Generation
- CPOL Functionality
- CPHA Functionality
- SPI Modes 0–3
- Slave Select Generation
- Interrupt Generation
- End-to-End SPI Transfer

### Simulation Tool

```text
ModelSim / QuestaSim
```

### Verification Status

```text
PASS
```

---

## Waveform

### End-to-End SPI Transfer

![Waveform](waveform.png)

The waveform demonstrates:

- APB configuration writes
- SPI transfer initiation
- SS assertion
- SCLK generation
- MOSI transmission
- MISO reception
- SPI data register update
- APB readback operation

---

## RTL Integration Schematic

![RTL Schematic](rtl_schematic.png)

---

## VC SpyGlass Lint Analysis

### Tool Used

```text
Synopsys VC SpyGlass
```

### Results

| Metric | Count |
|----------|----------|
| Fatals | 0 |
| Errors | 0 |
| Warnings | 0 |

### Status

```text
PASS
```

---

## Design Compiler Synthesis

### Tool Used

```text
Synopsys Design Compiler
```

### Synthesis Status

```text
PASS
```

---

## Design Flow

```text
RTL Design
      ↓
Module Verification
      ↓
Top-Level Integration
      ↓
Functional Simulation
      ↓
Waveform Validation
      ↓
VC SpyGlass Linting
      ↓
Design Compiler Synthesis
      ↓
Gate-Level Netlist Generation
```

---

## Project Directory Structure

```text
spi_core_top/
│
├── rtl/
│   ├── spi_core_top.v
│   ├── spi_apb_interface.v
│   ├── serial_clock_generator.v
│   ├── spi_slave_control.v
│   └── spi_shifter.v
│
├── tb/
│   └── spi_core_top_tb.v
│
├── waveforms/
│   └── waveform.png
│
├── docs/
│   ├── architecture.png
│   └── rtl_schematic.png
│
├── reports/
│   ├── lint/
│   └── synthesis/
│
└── README.md
```

---

## Design Summary

| Item | Status |
|--------|---------|
| APB Interface | ✅ Completed |
| Serial Clock Generator | ✅ Completed |
| SPI Slave Control | ✅ Completed |
| SPI Shifter | ✅ Completed |
| Top-Level Integration | ✅ Completed |
| Functional Verification | ✅ Completed |
| Waveform Validation | ✅ Completed |
| VC SpyGlass Lint | ✅ Completed |
| Design Compiler Synthesis | ✅ Completed |
| Documentation | ✅ Completed |

---

## Conclusion

The SPI Core Top module successfully integrates the APB Interface, Serial Clock Generator, SPI Slave Control, and SPI Shifter into a complete APB-Based SPI Master Core IP. The design supports programmable SPI communication, APB register access, interrupt generation, configurable clocking, and full-duplex data transfer, making it suitable for SoC peripheral integration and ASIC/FPGA implementations.
