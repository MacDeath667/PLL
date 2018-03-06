transcript on
vlib work

vlog -sv ../PhaseDetector/PhaseDetector.sv
vlog -sv ./LoopFilter.sv
vlog -sv ./KGB8.sv
vlog -sv ./KGB32.sv
vlog -sv ./ReversiveCounter.sv
vlog -sv ./test.sv

vsim -t 10ps -voptargs="+acc" test

add wave -divider "Test signals"
add wave /test/reset_i
add wave /test/clk_i
add wave /test/sig13
add wave /test/sig2
add wave /test/switch
add wave /test/forwarding
add wave /test/slowing
add wave /test/positiveShift_o
add wave /test/negativeShift_o
add wave /test/reachedMaxValue
add wave /test/reachedMinValue

add wave -divider "KGBM signals"
add wave /test/LoopDUT/kgbM/triggeredMax_o
add wave /test/LoopDUT/kgbM/triggeredMin_o
add wave -radix decimal /test/LoopDUT/kgbM/initialValue_i
add wave -radix decimal /test/LoopDUT/kgbM/minValue
add wave -radix decimal /test/LoopDUT/kgbM/maxValue
add wave -radix decimal /test/LoopDUT/kgbM/loadNewValue
add wave -radix decimal /test/LoopDUT/kgbM/counter

add wave -divider "Reset counter signals"
add wave -radix decimal /test/LoopDUT/resetCounter/value_o

add wave -divider "KGBN signals"
add wave /test/LoopDUT/kgbN/triggeredMax_o
add wave /test/LoopDUT/kgbN/triggeredMin_o
add wave -radix decimal /test/LoopDUT/kgbN/initialValue_i
add wave -radix decimal /test/LoopDUT/kgbN/minValue
add wave -radix decimal /test/LoopDUT/kgbN/maxValue
add wave /test/LoopDUT/kgbN/loadNewValue
add wave -radix decimal /test/LoopDUT/kgbN/counter

#add wave -divider "KGBN reversive counter"
#add wave /test/LoopDUT/kgbM/reversiveCounter/

configure wave -timelineunits ns
run -all
wave zoom full
