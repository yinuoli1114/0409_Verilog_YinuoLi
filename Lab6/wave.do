onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_i2c_slave/clk
add wave -noupdate /tb_i2c_slave/n_rst
add wave -noupdate /tb_i2c_slave/scl
add wave -noupdate /tb_i2c_slave/sda_in
add wave -noupdate /tb_i2c_slave/write_enable
add wave -noupdate /tb_i2c_slave/write_data
add wave -noupdate /tb_i2c_slave/sda_out
add wave -noupdate /tb_i2c_slave/fifo_empty
add wave -noupdate /tb_i2c_slave/fifo_full
add wave -noupdate /tb_i2c_slave/tb_scl_in
add wave -noupdate /tb_i2c_slave/tb_sda_in
add wave -noupdate /tb_i2c_slave/tb_scl_out
add wave -noupdate /tb_i2c_slave/tb_sda_out
add wave -noupdate /tb_i2c_slave/fifo_in
add wave -noupdate /tb_i2c_slave/fifo_data
add wave -noupdate /tb_i2c_slave/byte_in
add wave -noupdate /tb_i2c_slave/bit_data
add wave -noupdate /tb_i2c_slave/DUT/rising_edge_found
add wave -noupdate /tb_i2c_slave/DUT/tx_out
add wave -noupdate /tb_i2c_slave/DUT/falling_edge_found
add wave -noupdate /tb_i2c_slave/DUT/tx_enable
add wave -noupdate /tb_i2c_slave/DUT/load_data
add wave -noupdate /tb_i2c_slave/DUT/rw_mode
add wave -noupdate /tb_i2c_slave/DUT/address_match
add wave -noupdate /tb_i2c_slave/DUT/stop_found
add wave -noupdate /tb_i2c_slave/DUT/start_found
add wave -noupdate /tb_i2c_slave/DUT/rx_enable
add wave -noupdate /tb_i2c_slave/DUT/byte_received
add wave -noupdate /tb_i2c_slave/DUT/ack_prep
add wave -noupdate /tb_i2c_slave/DUT/check_ack
add wave -noupdate /tb_i2c_slave/DUT/ack_done
add wave -noupdate /tb_i2c_slave/DUT/sda_mode
add wave -noupdate /tb_i2c_slave/DUT/read_enable
add wave -noupdate /tb_i2c_slave/DUT/read_data
add wave -noupdate /tb_i2c_slave/DUT/rx_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6200000 ps} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {15750144 ps}
