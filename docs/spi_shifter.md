## Waveform Explanation

![SPI Shifter Waveform](waveforms/spi_shifter.png)

### Step-by-Step Operation

#### Step 1: Reset Phase

Initially, `PRESET_n` is asserted low to reset the SPI Shifter.

During reset:

- Internal shift registers are cleared
- `mosi_o` is driven low
- Received data register is cleared

After reset is released, the SPI Shifter is ready for data transfer.

---

#### Step 2: Load Transmit Data

The testbench loads:

```text
data_mosi_i = 8'hA5
```

and asserts:

```text
send_data_i = 1
```

This loads `8'hA5` into the transmit shift register.

Binary representation:

```text
8'hA5 = 1010_0101
```

Since:

```text
LSBFE = 1
```

the data will be transmitted LSB first.

Transmission sequence:

```text
1 → 0 → 1 → 0 → 0 → 1 → 0 → 1
```

---

#### Step 3: Slave Select Assertion

The testbench asserts:

```text
ss_i = 0
```

This enables SPI communication.

Once Slave Select becomes active, the SPI Shifter starts transmitting and receiving data.

---

#### Step 4: SPI Clock Generation

The Serial Clock Generator starts generating SPI clock pulses.

Configuration:

```text
CPOL = 0
CPHA = 0
SPI Mode = 0
```

Mode 0 operation:

- Data changes on falling edge
- Data is sampled on rising edge

A total of 8 clock pulses are generated for one byte transfer.

---

#### Step 5: MOSI Transmission

The SPI Shifter serially transmits:

```text
8'hA5
```

LSB-first sequence:

```text
Bit0 = 1
Bit1 = 0
Bit2 = 1
Bit3 = 0
Bit4 = 0
Bit5 = 1
Bit6 = 0
Bit7 = 1
```

These bits appear sequentially on:

```text
mosi_o
```

during the transfer.

---

#### Step 6: MISO Reception

The testbench behaves as an SPI slave and drives:

```text
rx_data = 8'h3C
```

Binary value:

```text
8'h3C = 0011_1100
```

Since LSB-first transfer is selected, the slave sends:

```text
0 → 0 → 1 → 1 → 1 → 1 → 0 → 0
```

The SPI Shifter samples each bit from:

```text
miso_i
```

and stores it into the receive shift register.

---

#### Step 7: Receive Data Capture

After all 8 bits are received, the testbench asserts:

```text
receive_data_i = 1
```

The received byte is transferred to:

```text
data_miso_o
```

Result:

```text
data_miso_o = 8'h3C
```

This confirms successful serial-to-parallel conversion.

---

#### Step 8: End of Transfer

The testbench deasserts:

```text
ss_i = 1
```

which terminates the SPI transaction.

The SPI Shifter returns to the idle state and waits for the next transfer request.

---

### Verification Result

| Signal | Expected | Observed |
|----------|----------|----------|
| MOSI Data | 8'hA5 | 8'hA5 |
| MISO Data | 8'h3C | 8'h3C |
| SPI Mode | Mode 0 | Pass |
| LSB First Transfer | Enabled | Pass |

The waveform confirms correct MOSI transmission, MISO reception, SPI clock synchronization, and successful completion of the SPI transaction.
