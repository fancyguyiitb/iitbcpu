transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/medha/Desktop/project/rf.vhd}
vcom -93 -work work {C:/Users/medha/Desktop/project/cpu.vhd}
vcom -93 -work work {C:/Users/medha/Desktop/project/sign_extend7.vhd}
vcom -93 -work work {C:/Users/medha/Desktop/project/sign_extend10.vhd}
vcom -93 -work work {C:/Users/medha/Desktop/project/full_adder.vhd}
vcom -93 -work work {C:/Users/medha/Desktop/project/adder_16_bit.vhd}
vcom -93 -work work {C:/Users/medha/Desktop/project/and-16_bit.vhd}
vcom -93 -work work {C:/Users/medha/Desktop/project/or_16_bit.vhd}
vcom -93 -work work {C:/Users/medha/Desktop/project/imp_16_bit.vhd}
vcom -93 -work work {C:/Users/medha/Desktop/project/mul_16_bit.vhd}
vcom -93 -work work {C:/Users/medha/Desktop/project/ALU.vhd}
vcom -93 -work work {C:/Users/medha/Desktop/project/sub_16_bit.vhd}
vcom -93 -work work {C:/Users/medha/Desktop/project/Memory.vhd}
vcom -93 -work work {C:/Users/medha/Desktop/project/fsm.vhd}
vcom -93 -work work {C:/Users/medha/Desktop/project/datapath.vhd}
vcom -93 -work work {C:/Users/medha/Desktop/project/T_register.vhd}
vcom -93 -work work {C:/Users/medha/Desktop/project/Lshifter8.vhd}

vcom -93 -work work {C:/Users/medha/Desktop/project/Testbench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run 200 ns
