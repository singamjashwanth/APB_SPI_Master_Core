# SPI Baud Rate Generator

## Overview

The SPI Baud Rate Generator module generates the Serial Peripheral Interface (SPI) serial clock (`SCLK`) from the APB peripheral clock (`PCLK`). It also generates timing flags used for MOSI transmission and MISO sampling based on the configured SPI mode.

---

## Features

- Configurable baud rate generation
- Supports SPI Mode 0 and Mode 1
- Configurable CPOL and CPHA
- Generates SPI serial clock (SCLK)
- Generates MOSI transmit timing flags
- Generates MISO receive timing flags
- Clock generation disabled when Slave Select is inactive

---

## Inputs

| Signal | Description |
|---------|-------------|
| PCLK | APB Peripheral Clock |
| PRESET_n | Active-low Reset |
| spi_mode_i | SPI Operating Mode |
| spiswai_i | SPI Stop in Wait Mode |
| sppr_i | Baud Rate Prescaler |
| spr_i | Baud Rate Divider |
| cpol_i | Clock Polarity |
| cpha_i | Clock Phase |
| ss_i | Slave Select |

---

## Outputs

| Signal | Description |
|---------|-------------|
| sclk_o | Generated SPI Serial Clock |
| BaudRateDivisor_o | Baud Rate Divisor |
| miso_recieve_sclk_o | Rising-edge MISO sampling flag |
| miso_recieve_sclk0_o | Falling-edge MISO sampling flag |
| mosi_send_sclk_o | Rising-edge MOSI transmit flag |
| mosi_send_sclk0_o | Falling-edge MOSI transmit flag |

---

## Baud Rate Calculation

The baud rate divisor is calculated as:

```
BaudRateDivisor = (SPPR + 1) × 2^(SPR + 1)
```

The internal clock divider uses:

```
BaudRateDivisor / 2
```

to toggle the SPI serial clock.

---

## Working Principle

1. Calculates the baud rate divisor using the prescaler and divider inputs.
2. Generates the SPI serial clock (`SCLK`) from `PCLK`.
3. Supports different SPI clock polarities (CPOL).
4. Supports different SPI clock phases (CPHA).
5. Generates timing flags for:
   - MOSI data transmission
   - MISO data sampling

---

## Verification

A dedicated Verilog testbench was developed to verify:

- Reset operation
- Different baud rate configurations
- CPOL variations
- CPHA variations
- Slave Select enable/disable
- SPI Wait mode

Simulation was performed using ModelSim.

---

## Files

- rtl/SPI_BAUDRATE_GEN.v
- tb/SPI_BAUDRATE_GEN_TB.v
- waveforms/spi_baudrate_gen_waveform.png
- schematics/spi_baudrate_gen_rtl.png
