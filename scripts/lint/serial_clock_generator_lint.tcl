set search_path "./"
set link_library ""
# Enable Lint
set_app_var enable_lint true
set_app_var enable_lint_save true
# Lint Setup
configure_lint_setup -goal lint_rtl
# Top Module
set top "serial_clock_generator"
# Analyze RTL
analyze -format verilog "./rtl/${top}.v"
# Elaborate
elaborate $top -verbose
# Run Lint
check_lint
# Report
#report_violations -app {setup design lint}
report_lint -verbose -file "${top}_lint_report.txt"
