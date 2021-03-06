# 
# Synthesis run script generated by Vivado
# 

  set_param gui.test TreeTableDev
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1
set_property target_language Verilog [current_project]
set_param project.compositeFile.enableAutoGeneration 0
set_property default_lib xil_defaultlib [current_project]
read_verilog -library xil_defaultlib {
  D:/vivado/CPU/CPU.srcs/sources_1/imports/cpu/signZeroExtend.v
  D:/vivado/CPU/CPU.srcs/sources_1/imports/cpu/RegFile.v
  D:/vivado/CPU/CPU.srcs/sources_1/imports/cpu/PC.v
  D:/vivado/CPU/CPU.srcs/sources_1/imports/cpu/IntructionMemory.v
  D:/vivado/CPU/CPU.srcs/sources_1/imports/cpu/DataMemory.v
  D:/vivado/CPU/CPU.srcs/sources_1/imports/cpu/ControlUnit.v
  D:/vivado/CPU/CPU.srcs/sources_1/imports/cpu/ALU.v
  D:/vivado/CPU/CPU.srcs/sources_1/imports/new/led_7.v
  D:/vivado/CPU/CPU.srcs/sources_1/imports/new/debkey.v
  D:/vivado/CPU/CPU.srcs/sources_1/imports/new/CLOCK_DIV.v
  D:/vivado/CPU/CPU.srcs/sources_1/imports/cpu/SingleCycleCPU.v
  D:/vivado/CPU/CPU.srcs/sources_1/imports/计组实验/selector.v
  D:/vivado/CPU/CPU.srcs/sources_1/imports/计组实验/basecounter.v
  D:/vivado/CPU/CPU.srcs/sources_1/imports/计组实验/Display.v
}
read_xdc D:/vivado/CPU/CPU.srcs/constrs_1/imports/new/Display_CPU.xdc
set_property used_in_implementation false [get_files D:/vivado/CPU/CPU.srcs/constrs_1/imports/new/Display_CPU.xdc]

set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/vivado/CPU/CPU.cache/wt [current_project]
set_property parent.project_dir D:/vivado/CPU [current_project]
catch { write_hwdef -file Display.hwdef }
synth_design -top Display -part xc7a35tcpg236-1
write_checkpoint Display.dcp
report_utilization -file Display_utilization_synth.rpt -pb Display_utilization_synth.pb
