onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /tb_ULA/clk_tb
add wave -noupdate -radix binary /tb_ULA/reset_tb
add wave -noupdate -radix binary /tb_ULA/concluido
add wave -noupdate -radix binary /tb_ULA/processar_tb
add wave -noupdate -radix decimal /tb_ULA/op_tb
add wave -noupdate -radix decimal /tb_ULA/ETp1_tb
add wave -noupdate -radix decimal /tb_ULA/ETp2_tb
add wave -noupdate -radix decimal /tb_ULA/Data_out_tb
add wave -noupdate -radix decimal /tb_ULA/valor_de_test_1_tb
add wave -noupdate -radix decimal /tb_ULA/valor_de_test_2_tb
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ns} {1 us}
