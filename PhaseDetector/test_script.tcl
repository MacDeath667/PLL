transcript on
vlib work

vlog -sv ./PhaseDetector.sv
vlog -sv ./test.sv

vsim -t 1ps -voptargs="+acc" test

add wave /test/reset_i
add wave /test/clk_i
add wave /test/signalA_i
add wave /test/signalB_i
add wave /test/forwarding_o
add wave /test/slowing_o


configure wave -timelineunits ps
run -all
wave zoom full
