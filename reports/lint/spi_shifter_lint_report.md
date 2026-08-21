# VC Static Lint Report Summary – spi_shifter

**Tool:** Synopsys VC Static (Lint RTL)  
**Version:** X-2025.06  
**Module:** `spi_shifter`

## Results

| Metric | Count |
|---------|---------|
| Fatal | 0 |
| Errors | 0 |
| Warnings | 0 |
| Infos | 14 |

## Informational Findings

### RegInputOutput-ML (11 Info Messages)

The following ports/signals are reported as unregistered:

- ss_i
- lsbfe_i
- cpha_i
- cpol_i
- miso_receive_sclk_i
- miso_receive_sclk0_i
- mosi_send_sclk_i
- mosi_send_sclk0_i
- miso_i
- receive_data_i
- data_miso_o

**Note:** These are informational messages only and are expected for interface and control signals used in the design.

### Other Information

- Module processing completed successfully (`SM_PF`)
- Module elaboration completed successfully (`SM_PME`)
- Port information report generated (`ReportPortInfo-ML`)

## Conclusion

- No fatal violations
- No errors
- No warnings
- Lint completed successfully

The module passes RTL lint checks with only informational observations related to unregistered interface signals.
