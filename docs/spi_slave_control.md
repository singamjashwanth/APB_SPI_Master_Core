# SPI Slave Control

## Overview

The SPI Slave Control module manages SPI transfer control by generating the Slave Select (`SS`) signal and Transfer In Progress (`TIP`) indication.

When new transmit data is loaded into the SPI Data Register, the module automatically asserts Slave Select, keeps it active for the entire SPI transfer duration, and generates a receive-data notification once the transfer completes.

This block acts as the transaction controller between the APB Interface and SPI datapath blocks.

---

## Architecture

![SPI Slave Control Architecture](architecture.png)

---

## Features

- Automatic Slave Select (`SS`) Generation
- Transfer Duration Control using Baud Rate Divider
- Transfer-In-Progress (`TIP`) Indication
- Automatic Receive Data Trigger Generation
- Master Mode Support
- SPI Run / Wait / Stop Mode Support
- Active-Low Reset Support
- Fully Synchronous Design

---

## Block Functionality

The module performs the following functions:

### Slave Select Control

When a new SPI transmission starts (`send_data_i = 1`):

- `SS` is asserted LOW
- Transfer counter starts counting
- Slave remains selected throughout the transfer

### Transfer Timing

Transfer duration is calculated using:

```text
Transfer Length = BaudRateDivisor × 16
```

This ensures the slave remains selected long enough for an entire 8-bit SPI transaction.

### Receive Data Notification

At the end of the transfer:

- Internal receive flag (`rcv_s`) is asserted
- One clock later `receive_data_o` becomes HIGH
- APB Interface captures received MISO data

### Transfer Complete

After transfer completion:

- Slave Select returns HIGH
- Receive flag is cleared
- Controller returns to idle state

---

## Inputs

| Signal | Width | Description |
|----------|----------|-------------|
| PRESET_n | 1 | Active Low Reset |
| PCLK | 1 | System Clock |
| spi_mode_i | 2 | SPI Operating Mode |
| mstr_i | 1 | Master Mode Enable |
| spiswai_i | 1 | SPI Stop In Wait Control |
| send_data_i | 1 | Start Transfer Request |
| BaudRateDivisor_i | 12 | SPI Baud Rate Divider |

---

## Outputs

| Signal | Width | Description |
|----------|----------|-------------|
| ss_o | 1 | Slave Select Output |
| receive_data_o | 1 | Receive Complete Pulse |
| tip_o | 1 | Transfer In Progress |

---

## Internal Logic

### Transfer Length Calculation

```verilog
assign target_s = BaudRateDivisor_i * 16;
```

The transfer counter remains active until:

```text
count_s = target_s
```

---

### Transfer-In-Progress Flag

```verilog
assign tip_o = ~ss_o;
```

| SS | TIP |
|----|-----|
| 1 | 0 |
| 0 | 1 |

When the slave is selected, a transfer is considered active.

---

## SPI Mode Handling

The controller allows transfers only when:

### RUN Mode

```text
spi_mode_i = 2'b00
```

### WAIT Mode

```text
spi_mode_i = 2'b01
spiswai_i = 0
```

### STOP Mode

Transfers are disabled when:

```text
spi_mode_i = 2'b01
spiswai_i = 1
```

or

```text
spi_mode_i = 2'b10
```

In these cases:

```text
SS = 1
TIP = 0
```

---

## Transfer Sequence

```text
send_data_i asserted
          │
          ▼
SS goes LOW
          │
          ▼
Counter starts
          │
          ▼
Transfer active
          │
          ▼
Counter reaches target
          │
          ▼
receive_data_o asserted
          │
          ▼
SS released HIGH
          │
          ▼
Transfer complete
```

---

## Functional Verification

A dedicated Verilog testbench was developed to verify:

- Reset Operation
- Slave Select Generation
- Transfer Timing Control
- Transfer-In-Progress Indication
- Receive Data Pulse Generation
- Run Mode Operation
- Wait Mode Operation
- Stop Mode Operation
- Master Mode Functionality

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

### SPI Transfer Operation

![Waveform](waveform.png)

The waveform demonstrates:

- Assertion of `send_data_i`
- Automatic activation of `SS`
- TIP assertion during transfer
- Transfer counter operation
- Generation of `receive_data_o`
- Automatic deassertion of `SS` after completion

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

## Design Summary

| Item | Status |
|--------|---------|
| RTL Design | ✅ Completed |
| Testbench | ✅ Completed |
| Functional Verification | ✅ Completed |
| Waveform Validation | ✅ Completed |
| VC SpyGlass Lint | ✅ Completed |
| Design Compiler Synthesis | ✅ Completed |
| Documentation | ✅ Completed |

---

## Project Directory Structure

```text
spi_slave_control/
│
├── rtl/
│   └── spi_slave_control.v
│
├── tb/
│   └── spi_slave_control_tb.v
│
├── waveforms/
│   └── waveform.png
│
├── docs/
│   └── architecture.png
│
├── reports/
│   ├── lint/
│   └── synthesis/
│
└── README.md
```

---

## Conclusion

The SPI Slave Control module provides automatic Slave Select generation and transfer supervision for SPI communication. It ensures proper slave activation, transfer timing management, receive-data synchronization, and transfer status monitoring, making it an essential control block within the APB-Based SPI Master Core.
