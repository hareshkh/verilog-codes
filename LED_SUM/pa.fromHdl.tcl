
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Test -dir "C:/Users/khann/Desktop/LAB/Test/planAhead_run_2" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "fulladder.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {halfadder.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {fulladder.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top fulladder $srcset
add_files [list {fulladder.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
