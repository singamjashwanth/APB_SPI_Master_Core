# Serial Clock Generator

## Overview

The Serial Clock Generator module generates the Serial Peripheral Interface (SPI) Serial Clock (`SCLK`) from the APB Peripheral Clock (`PCLK`).

In addition to clock generation, the module produces timing control signals used by the SPI Shifter block for MOSI transmission and MISO sampling according to the configured SPI mode.

This module is a key component of the APB Based SPI Master Core.

---

# Features

- Configurable SPI Baud Rate Generation
- Programmable Clock Divider
- CPOL (Clock Polarity) Support
- CPHA (Clock Phase) Support
- SPI Mode 0, 1, 2 and 3 Compatibility
- MOSI Transmission Timing Generation
- MISO Sampling Timing Generation
- Slave Select Based Clock Control
- Wait Mode Support

---

# Block Diagram

```text
                  +----------------------+
                  | Serial Clock         |
                  | Generator            |
                  +----------+-----------+
                             |
         +-------------------+-------------------+
         |                                       |
         v                                       v

   SPI Serial Clock                     Timing Signals
      (SCLK)                      (MOSI / MISO Controls)
```

---

# Inputs

| Signal | Width | Description |
|---------|---------|---------|
| `PCLK` | 1 | APB Peripheral Clock |
| `PRESET_n` | 1 | Active Low Reset |
| `spi_mode_i` | 1 | SPI Enable |
| `spiswai_i` | 1 | SPI Stop in Wait Mode |
| `sppr_i` | 3 | Baud Rate Prescaler |
| `spr_i` | 3 | Baud Rate Divider |
| `cpol_i` | 1 | Clock Polarity |
| `cpha_i` | 1 | Clock Phase |
| `ss_i` | 1 | Slave Select |

---

# Outputs

| Signal | Width | Description |
|---------|---------|---------|
| `sclk_o` | 1 | Generated SPI Serial Clock |
| `BaudRateDivisor_o` | 8 | Baud Rate Divisor Value |
| `miso_recieve_sclk_o` | 1 | Rising Edge MISO Sample Pulse |
| `miso_recieve_sclk0_o` | 1 | Falling Edge MISO Sample Pulse |
| `mosi_send_sclk_o` | 1 | Rising Edge MOSI Transmit Pulse |
| `mosi_send_sclk0_o` | 1 | Falling Edge MOSI Transmit Pulse |

---

# Baud Rate Calculation

The baud rate divisor is calculated as:

```text
BaudRateDivisor = (SPPR + 1) × 2^(SPR + 1)
```

The SPI Serial Clock frequency is derived from:

```text
SCLK = PCLK / BaudRateDivisor
```

This enables configurable SPI communication speeds based on application requirements.

---

# SPI Mode Support

| SPI Mode | CPOL | CPHA |
|-----------|------|------|
| Mode 0 | 0 | 0 |
| Mode 1 | 0 | 1 |
| Mode 2 | 1 | 0 |
| Mode 3 | 1 | 1 |

The generated timing flags automatically adapt to the selected SPI mode.

---

# Working Principle

### Step 1: Baud Rate Calculation

The module computes the SPI clock divider using the prescaler and divider configuration.

### Step 2: Clock Division

The APB Peripheral Clock is divided to generate the SPI Serial Clock (`SCLK`).

### Step 3: SPI Mode Selection

Clock Polarity (`CPOL`) and Clock Phase (`CPHA`) determine:

- Clock idle state
- Data transmission edge
- Data sampling edge

### Step 4: Timing Signal Generation

The module generates:

- MOSI transmit timing pulses
- MISO sample timing pulses

These timing signals are consumed by the SPI Shifter module.

### Step 5: Clock Disable Conditions

Clock generation is halted when:

- Slave Select is inactive
- SPI Wait Mode is enabled

---

# Functional Verification

A dedicated Verilog testbench was developed to verify:

- Reset Operation
- Baud Rate Generation
- Clock Division Logic
- CPOL Functionality
- CPHA Functionality
- SPI Mode Operation
- Slave Select Control
- Wait Mode Functionality

Simulation Tool:

```text
ModelSim
```

Verification Status:

```text
PASS
```

---

# VC SpyGlass Lint Analysis

Tool Used:

```text
Synopsys VC SpyGlass
```

Results:

| Metric | Count |
|---------|---------|
| Fatals | 0 |
| Errors | 0 |
| Warnings | 0 |

Status:

```text
PASS ✅
```

---

# Design Compiler Synthesis

Tool Used:

```text
Synopsys Design Compiler
```

### Synthesis Summary

| Metric | Value |
|---------|---------|
| Number of Ports | 31 |
| Number of Nets | 214 |
| Number of Cells | 195 |
| Combinational Cells | 177 |
| Sequential Cells | 17 |
| Total Cell Area | 419 |

Status:

```text
PASS ✅
```

---

# Generated Artifacts

### RTL Source

```text
rtl/
└── serial_clock_generator.v
```

### Testbench

```text
tb/
└── serial_clock_generator_tb.v
```

### Waveforms

```text
waveforms/
└── serial_clock_generator_waveform.png
```

### RTL Schematic

```text
schematic/
└── serial_clock_generator_rtl.png
```

### Lint Reports

```text
reports/lint/
└── serial_clock_generator_lint_report.txt
```

### Synthesis Reports

```text
reports/synthesis/
└── serial_clock_generator_area_report.txt
```

### Gate-Level Netlist

```text
netlist/
└── serial_clock_generator_netlist.v
```

### TCL Scripts

```text
scripts/lint/
└── serial_clock_generator_lint.tcl

scripts/synthesis/
└── serial_clock_generator_dc.tcl
```

---

# Design Flow Followed

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
```

---

# Status

| Item | Status |
|---------|---------|
| RTL Design | ✅ Completed |
| Testbench | ✅ Completed |
| Functional Verification | ✅ Completed |
| Waveform Validation | ✅ Completed |
| RTL Schematic | ✅ Completed |
| VC SpyGlass Linting | ✅ Completed |
| Design Compiler Synthesis | ✅ Completed |
| Gate-Level Netlist | ✅ Generated |
| Documentation | ✅ Completed |

---

## Conclusion

The Serial Clock Generator module has been successfully designed, verified, lint-cleaned, synthesized, and documented as part of the APB Based SPI Master Core project.

The generated clock and timing control signals serve as the foundation for SPI communication and interface directly with the SPI Shifter module.
