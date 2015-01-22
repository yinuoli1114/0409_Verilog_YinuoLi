onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_timer/clk
add wave -noupdate /tb_timer/n_rst
add wave -noupdate /tb_timer/sda_in
add wave -noupdate /tb_timer/scl
add wave -noupdate -radix decimal /tb_timer/pulse_number
add wave -noupdate /tb_timer/start_found
add wave -noupdate /tb_timer/stop_found
add wave -noupdate /tb_timer/rising_edge_found
add wave -noupdate /tb_timer/falling_edge_found
add wave -noupdate /tb_timer/byte_received
add wave -noupdate /tb_timer/ack_prep
add wave -noupdate /tb_timer/check_ack
add wave -noupdate /tb_timer/ack_done
add wave -noupdate /tb_timer/starting_byte
add wave -noupdate /tb_timer/rw_mode
add wave -noupdate /tb_timer/address_match
add wave -noupdate /tb_timer/done
add wave -noupdate /tb_timer/enable
add wave -noupdate /tb_timer/no_pulses
add wave -noupdate /tb_timer/clear
add wave -noupdate /tb_timer/scl_override
add wave -noupdate /tb_timer/scl_val
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {295238 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {275482 ps} {406554 ps}
