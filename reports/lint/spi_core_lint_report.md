# VC Static Lint Report Summary – spi_core_top

**Tool:** Synopsys VC Static (Lint RTL)  
**Version:** X-2025.06  
**Module:** `spi_core_top`

## Results

| Metric | Count |
|---------|---------|
| Fatal | 0 |
| Errors | 0 |
| Warnings | 0 |
| Infos | 23 |

## Informational Findings

### RegInputOutput-ML (10 Info Messages)

The following ports/signals are reported as unregistered:

- PWRITE_i
- PSEL_i
- PENABLE_i
- miso_i
- PREADY_o
- PSLVERR_o
- spi_interrupt_request_o
- PRDATA_o
- PADDR_i
- PWDATA_i

**Note:** These are informational messages only and are expected for APB interface, control, status, and data signals used throughout the design.

### Other Information

- Parallel synthesis execution completed successfully (`SM_PARALLEL_RUN`)
- Child synthesis processes completed successfully (`SM_CHLDRUN_DONE`)
- All modules processed successfully (`SM_PF`)
- Module elaboration completed successfully (`SM_PME`)
- Port information report generated (`ReportPortInfo-ML`)

## Modules Analyzed

- spi_apb_interface
- serial_clock_generator
- spi_slave_control
- spi_shifter
- spi_core_top

## Conclusion

- No fatal violations
- No errors
- No warnings
- Lint completed successfully

The complete SPI Master IP (`spi_core_top`) passes RTL lint checks successfully. All reported messages are informational observations related to interface and control signals. No functional, structural, or coding-rule violations remain in the design.
