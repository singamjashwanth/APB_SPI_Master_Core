remove_design -all

# Top module name
set TOP spi_apb_interface

# RTL path 
set search_path "./rtl"

# Technology library
set target_library {/home2/BPRN35/SingaMJY/VLSI_RN_OFFLINE/Verilog_labs/lab1/lib/lsi_10k.db}
set link_library "* /home2/BPRN35/SingaMJY/VLSI_RN_OFFLINE/Verilog_labs/lab1/lib/lsi_10k.db"

# Read RTL
analyze -format verilog ./rtl/${TOP}.v

# Elaborate
elaborate $TOP

# Link design
link

# Check design
check_design

# Select top module
current_design $TOP

# Synthesize
compile_ultra

# Generate netlist
write_file -f verilog -hier -output ${TOP}_netlist.v

# Reports
report_area   > ${TOP}_area.rpt
report_timing > ${TOP}_timing.rpt
report_power  > ${TOP}_power.rpt
