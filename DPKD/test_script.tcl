transcript on
vlib work

vlog -sv ./Devider.sv
vlog -sv ./test.sv

vsim -t 10ps -voptargs="+acc" test

add wave -divider "Test signals"
add wave /test/reset_i
add wave /test/clk_i
add wave /test/positiveShift_i
add wave /test/negativeShift_i

add wave -divider "Out signal"

add wave -radix decimal /test/DPKD_DUT/output_o


add wave -radix decimal /test/DPKD_DUT/counter

#add wave -divider "KGBN reversive counter"
#add wave /test/LoopDUT/kgbM/reversiveCounter/

configure wave -timelineunits ns
run -all
wave zoom full
