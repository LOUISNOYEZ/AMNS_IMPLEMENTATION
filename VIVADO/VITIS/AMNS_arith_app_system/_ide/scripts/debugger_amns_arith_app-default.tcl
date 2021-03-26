# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\louis\Desktop\AMNS_IMPLEMENTATION\VIVADO\VITIS\AMNS_arith_app_system\_ide\scripts\debugger_amns_arith_app-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\louis\Desktop\AMNS_IMPLEMENTATION\VIVADO\VITIS\AMNS_arith_app_system\_ide\scripts\debugger_amns_arith_app-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zed 210248553236" && level==0 && jtag_device_ctx=="jsn-Zed-210248553236-23727093-0"}
fpga -file C:/Users/louis/Desktop/AMNS_IMPLEMENTATION/VIVADO/VITIS/AMNS_arith_app/_ide/bitstream/AMNS_arith_co_design_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/louis/Desktop/AMNS_IMPLEMENTATION/VIVADO/VITIS/AMNS_arith_co_design_wrapper/export/AMNS_arith_co_design_wrapper/hw/AMNS_arith_co_design_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Users/louis/Desktop/AMNS_IMPLEMENTATION/VIVADO/VITIS/AMNS_arith_app/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#1"}
dow C:/Users/louis/Desktop/AMNS_IMPLEMENTATION/VIVADO/VITIS/AMNS_arith_app/Debug/AMNS_arith_app.elf
configparams force-mem-access 0
bpadd -addr &main
