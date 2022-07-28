# read design

read_verilog iiitb_piso.v

# generic synthesis
synth -top iiitb_piso

# mapping to mycells.lib
dfflibmap -library /home/raj.kachhadiya15/Desktop/iiitb_piso/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty /home/raj.kachhadiya15/Desktop/iiitb_piso/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
clean
flatten
# write synthesized design
write_verilog -noatter iiitb_piso_synth.v
