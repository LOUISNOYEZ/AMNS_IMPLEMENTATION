# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\louis\Desktop\AMNS_IMPLEMENTATION\VIVADO\VITIS\AMNS_arith_co_design_wrapper\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\louis\Desktop\AMNS_IMPLEMENTATION\VIVADO\VITIS\AMNS_arith_co_design_wrapper\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {AMNS_arith_co_design_wrapper}\
-hw {C:\Users\louis\Desktop\AMNS_IMPLEMENTATION\VIVADO\AMNS_arith_co_design\AMNS_arith_co_design_wrapper.xsa}\
-fsbl-target {psu_cortexa53_0} -out {C:/Users/louis/Desktop/AMNS_IMPLEMENTATION/VIVADO/VITIS}

platform write
domain create -name {standalone_ps7_cortexa9_1} -display-name {standalone_ps7_cortexa9_1} -os {standalone} -proc {ps7_cortexa9_1} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {AMNS_arith_co_design_wrapper}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_1}
platform generate -quick
platform generate
