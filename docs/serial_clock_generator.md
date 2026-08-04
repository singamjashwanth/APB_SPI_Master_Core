# Serial Clock Generator

## Overview

The Serial Clock Generator module generates the Serial Peripheral Interface (SPI) serial clock (`SCLK`) from the APB peripheral clock (`PCLK`). It also generates timing flags used for MOSI transmission and MISO sampling based on the configured SPI mode.

---

## Features

- Configurable SPI baud rate generation
- Supports multiple SPI clock configurations using CPOL and CPHA
- Generates SPI Serial Clock (`SCLK`)
- Generates MOSI transmit timing flags
- Generates MISO receive timing flags
- Automatically resets clock generation when Slave Select (`SS`) is inactive

---

## Inputs

| Signal | Description |
|---------|-------------|
| `PCLK` | APB Peripheral Clock |
| `PRESET_n` | Active-Low Reset |
| `spi_mode_i` | SPI Operating Mode |
| `spiswai_i` | SPI Stop in Wait Mode |
| `sppr_i` | Baud Rate Prescaler |
| `spr_i` | Baud Rate Divider |
| `cpol_i` | Clock Polarity |
| `cpha_i` | Clock Phase |
| `ss_i` | Slave Select |

---

## Outputs

| Signal | Description |
|---------|-------------|
| `sclk_o` | Generated SPI Serial Clock |
| `BaudRateDivisor_o` | Calculated Baud Rate Divisor |
| `miso_recieve_sclk_o` | Rising-edge MISO sampling flag |
| `miso_recieve_sclk0_o` | Falling-edge MISO sampling flag |
| `mosi_send_sclk_o` | Rising-edge MOSI transmit flag |
| `mosi_send_sclk0_o` | Falling-edge MOSI transmit flag |

---

## Baud Rate Calculation

The baud rate divisor is calculated using:

```text
BaudRateDivisor = (SPPR + 1) × 2^(SPR + 1)
```

The generated serial clock toggles every:

```text
BaudRateDivisor / 2
```

This allows different SPI clock frequencies to be generated from the APB peripheral clock.

---

## Working Principle

1. Computes the baud rate divisor using the prescaler (`SPPR`) and divider (`SPR`) values.
2. Generates the SPI Serial Clock (`SCLK`) by dividing the APB peripheral clock.
3. Supports different SPI modes through Clock Polarity (CPOL) and Clock Phase (CPHA).
4. Produces timing flags for:
   - MOSI data transmission
   - MISO data sampling
5. Stops clock generation when Slave Select (`SS`) is inactive or the SPI is placed in Wait mode.

---

## Verification

A dedicated Verilog testbench was developed to verify:

- Reset operation
- Baud rate generation
- Clock polarity (CPOL)
- Clock phase (CPHA)
- Slave Select enable/disable
- SPI Wait mode

Simulation was performed using **ModelSim**.

---

## Repository Files

```
rtl/
└── serial_clock_generator.v

tb/
└── serial_clock_generator_tb.v

waveforms/
└── serial_clock_generator_waveform.png

schematics/
└── serial_clock_generator_rtl.png
```

---

## Status

| Item | Status |
|------|--------|
| RTL Design | ✅ Completed |
| Testbench | ✅ Completed |
| Functional Simulation | ✅ Completed |
| RTL Schematic | ⏳ To be Added |
| Documentation | ✅ Completed |
