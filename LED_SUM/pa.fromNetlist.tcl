
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Test -dir "C:/Users/khann/Desktop/LAB/Test/planAhead_run_1" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/khann/Desktop/LAB/Test/fulladder.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/khann/Desktop/LAB/Test} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "fulladder.ucf" [current_fileset -constrset]
add_files [list {fulladder.ucf}] -fileset [get_property constrset [current_run]]
link_design
