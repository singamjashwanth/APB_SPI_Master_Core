# SPI Shifter

## Overview

The `spi_shifter` module is responsible for serializing transmit data onto the MOSI line and deserializing received data from the MISO line. It supports all four SPI modes (Mode 0–3) and both MSB-first and LSB-first data transmission formats.

## Features

* 8-bit SPI data transfer
* Supports SPI Modes 0, 1, 2, and 3
* Supports MSB-first and LSB-first transfers
* Parallel-to-Serial conversion for MOSI
* Serial-to-Parallel conversion for MISO
* Active-low asynchronous reset
* Slave-select controlled operation

---

## Block Diagram

```text
                 +------------------+
                 |   SPI Shifter    |
                 |                  |
data_mosi_i ---->| Shift Register   |
                 |        |         |
                 |        v         |
                 |   MOSI Logic     |----> mosi_o
                 |                  |
miso_i --------->|   MISO Logic     |
                 |        |         |
                 |        v         |
                 | Receive Register |
                 +--------+---------+
                          |
                          v
                     data_miso_o
```

---

## Port Description

### Inputs

| Signal               | Width | Description                               |
| -------------------- | ----- | ----------------------------------------- |
| PCLK                 | 1     | APB clock                                 |
| PRESET_n             | 1     | Active-low reset                          |
| ss_i                 | 1     | Slave select (active low)                 |
| send_data_i          | 1     | Load transmit data                        |
| receive_data_i       | 1     | Enable received data output               |
| lsbfe_i              | 1     | LSB-first enable                          |
| cpha_i               | 1     | Clock phase                               |
| cpol_i               | 1     | Clock polarity                            |
| mosi_send_sclk_i     | 1     | MOSI transmit enable (rising-edge modes)  |
| mosi_send_sclk0_i    | 1     | MOSI transmit enable (falling-edge modes) |
| miso_receive_sclk_i  | 1     | MISO receive enable (rising-edge modes)   |
| miso_receive_sclk0_i | 1     | MISO receive enable (falling-edge modes)  |
| data_mosi_i          | 8     | Parallel transmit data                    |
| miso_i               | 1     | Serial receive data                       |

### Outputs

| Signal      | Width | Description            |
| ----------- | ----- | ---------------------- |
| mosi_o      | 1     | Serial transmit output |
| data_miso_o | 8     | Parallel received data |

---

## SPI Mode Support

| Mode   | CPOL | CPHA | Sampling Edge |
| ------ | ---- | ---- | ------------- |
| Mode 0 | 0    | 0    | Rising Edge   |
| Mode 1 | 0    | 1    | Falling Edge  |
| Mode 2 | 1    | 0    | Falling Edge  |
| Mode 3 | 1    | 1    | Rising Edge   |

Internal clock selection:

```verilog
use_sclk0 = ((!cpha_i && cpol_i) ||
             ( cpha_i && !cpol_i));
```

* `use_sclk0 = 1` → Falling-edge operation
* `use_sclk0 = 0` → Rising-edge operation

---

## Transmit Operation (MOSI)

### Data Loading

When `send_data_i` is asserted, transmit data is loaded into the internal shift register.

```verilog
shift_register_s <= data_mosi_i;
```

### LSB First

Bits are transmitted in the following order:

```text
Bit0 → Bit1 → Bit2 → Bit3 → Bit4 → Bit5 → Bit6 → Bit7
```

### MSB First

Bits are transmitted in the following order:

```text
Bit7 → Bit6 → Bit5 → Bit4 → Bit3 → Bit2 → Bit1 → Bit0
```

---

## Receive Operation (MISO)

Incoming serial data is captured and stored in the receive register.

### LSB First

```text
Received Bit0 → temp_reg_s[0]
Received Bit1 → temp_reg_s[1]
...
Received Bit7 → temp_reg_s[7]
```

### MSB First

```text
Received Bit7 → temp_reg_s[7]
Received Bit6 → temp_reg_s[6]
...
Received Bit0 → temp_reg_s[0]
```

The received data becomes available on:

```verilog
data_miso_o
```

when:

```verilog
receive_data_i = 1
```

---

## Reset Behavior

When `PRESET_n` is asserted low:

* MOSI output cleared
* Shift register cleared
* Receive register cleared
* All bit counters reset

```verilog
shift_register_s <= 8'h00;
temp_reg_s       <= 8'h00;
mosi_o           <= 1'b0;
```

---

## Transfer Sequence

### Transmission

1. Assert `send_data_i`
2. Load `data_mosi_i`
3. Assert `ss_i = 0`
4. Generate SPI clock enables
5. Data shifts out on `mosi_o`

### Reception

1. Assert `ss_i = 0`
2. Capture incoming `miso_i`
3. Bits stored in receive register
4. Assert `receive_data_i`
5. Read `data_miso_o`

---

## Example

### Transmit

```verilog
data_mosi_i = 8'b10110010;
lsbfe_i     = 1'b0; // MSB First
```

Output sequence:

```text
1 → 0 → 1 → 1 → 0 → 0 → 1 → 0
```

### Receive

Incoming MISO:

```text
1 → 0 → 0 → 1 → 1 → 0 → 1 → 0
```

Captured data:

```verilog
data_miso_o = 8'b10011010;
```

---

## File Location

```text
rtl/
└── spi_shifter.v

docs/
└── spi_shifter.md
```

## Developed By

Singam Jashwanth
