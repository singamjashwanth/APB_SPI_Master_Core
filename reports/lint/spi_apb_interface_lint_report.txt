# SPI APB Interface – RTL Lint Summary

## Tool Information

* Tool: Synopsys VC Static (VC Lint)
* Version: X-2025.06
* Top Module: `spi_apb_interface`

## Results Summary

| Metric          | Count |
| --------------- | ----- |
| Errors          | 0     |
| Active Warnings | 0     |
| Infos           | 16    |
| Waived Warnings | 1     |

## Issues Found and Resolution

### Warning (Reviewed & Waived)

* **Rule:** STARC05-1.3.1.3
* **Description:** Asynchronous reset signal used in FSM logic.
* **Status:** Waived
* **Justification:** `PRESET_n` is intentionally implemented as an asynchronous reset for the APB FSM state register. Functional behavior verified through simulation and design review.

### Informational Messages

* Multiple `RegInputOutput-ML` informational messages reported for direct usage of APB interface signals and status/control ports.
* These are informational only and do not indicate functional or synthesis issues.

## Final Status

**RTL Lint Status: PASS**

* No lint errors.
* No active lint warnings.
* One reviewed and justified waiver.
* Design is lint-clean and ready for integration and further verification.
