onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -label sim:/tb_ds1302_top/Group1 -group {Region: sim:/tb_ds1302_top} /tb_ds1302_top/clk
add wave -noupdate -expand -label sim:/tb_ds1302_top/Group1 -group {Region: sim:/tb_ds1302_top} /tb_ds1302_top/rst_n
add wave -noupdate -expand -label sim:/tb_ds1302_top/Group1 -group {Region: sim:/tb_ds1302_top} /tb_ds1302_top/key_in
add wave -noupdate -expand -label sim:/tb_ds1302_top/Group1 -group {Region: sim:/tb_ds1302_top} /tb_ds1302_top/CE
add wave -noupdate -expand -label sim:/tb_ds1302_top/Group1 -group {Region: sim:/tb_ds1302_top} /tb_ds1302_top/sclk
add wave -noupdate -expand -label sim:/tb_ds1302_top/Group1 -group {Region: sim:/tb_ds1302_top} /tb_ds1302_top/sda
add wave -noupdate -expand -label sim:/tb_ds1302_top/Group1 -group {Region: sim:/tb_ds1302_top} /tb_ds1302_top/Uart_tx
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst} /tb_ds1302_top/ds1302_top_inst/sys_clk
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst} /tb_ds1302_top/ds1302_top_inst/sys_rst_n
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst} /tb_ds1302_top/ds1302_top_inst/key_in
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst} /tb_ds1302_top/ds1302_top_inst/CE
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst} /tb_ds1302_top/ds1302_top_inst/sclk
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst} /tb_ds1302_top/ds1302_top_inst/sda
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst} /tb_ds1302_top/ds1302_top_inst/Uart_tx
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst} /tb_ds1302_top/ds1302_top_inst/key_r
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst} /tb_ds1302_top/ds1302_top_inst/opera_done
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst} /tb_ds1302_top/ds1302_top_inst/dout
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst} /tb_ds1302_top/ds1302_top_inst/wr_vld
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst} /tb_ds1302_top/ds1302_top_inst/wr
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst} /tb_ds1302_top/ds1302_top_inst/data
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst} /tb_ds1302_top/ds1302_top_inst/uart_vld
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/clk
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/rst_n
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/rd_key
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/opera_done
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/wr_vld
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/dout
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/wr
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/uart_vld
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/state_c
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/state_n
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/cnt_20ms
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/add_cnt_20ms
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/end_cnt_20ms
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/IDLE2WRITE
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/IDLE2READ
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/WRITE2DONE
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/READ2DONE
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/DONE2IDLE
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_ctrl_inst/initflag
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/clk
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/rst_n
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/wr_vld
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/din
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/wr
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/data
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/opera_done
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/CE
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/sclk
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/sda
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/cnt_clk
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/add_cnt_clk
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/end_cnt_clk
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/cnt_clk2
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/add_cnt_clk2
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/end_cnt_clk2
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/clk_pos
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/clk_neg
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/clk_2M
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/cnt_bit
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/end_cnt_bit
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/dout
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/cnt_bit2
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/end_cnt_bit2
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/dout2
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/cnt_bit3
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/end_cnt_bit3
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/dout3
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/sclk_r
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/CE_r
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/sclk_neg
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/CE_pos
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/cnt_1s
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/add_cnt_1s
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/end_cnt_1s
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/cnt_3s
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/add_cnt_3s
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst} /tb_ds1302_top/ds1302_top_inst/ds1302_intf_inst/end_cnt_3s
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/clk
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/rst_n
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/din
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/uart_vld
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/uart_tx
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/tx_done
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/cnt_clk
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/add_cnt_clk
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/end_cnt_clk
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/cnt_bit
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/add_cnt_bit
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/end_cnt_bit
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/flag
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/data
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/data_r
add wave -noupdate -expand -label sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/Group1 -group {Region: sim:/tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst} /tb_ds1302_top/ds1302_top_inst/uart_ctrl_inst/send_en
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
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
WaveRestoreZoom {0 ps} {1 ns}
