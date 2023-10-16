module ds1302_top (
    input       sys_clk       ,//系统时钟
    input       sys_rst_n     ,//系统复位
    input       key_in        ,//按键信号

    output      CE           ,//使能工作信号 高有效 
    output      sclk         ,//2M的时钟 CE有效产生
    inout       sda          ,//三态门，不同SCLK给出不同数据
    output      Uart_tx       //串口发送
);

    wire key_r;//消抖后的按键

    wire opera_done;//读或写操作结束

    wire [87:0] dout;
    wire        wr_vld;
    wire        wr    ;

    wire [55:0] data  ;//传到串口发送模块处理
    wire        uart_vld ;

    ds1302_ctrl ds1302_ctrl_inst(
    /*input         */  .clk             (sys_clk  ),
    /*input         */  .rst_n           (sys_rst_n),
    /*input         */  .rd_key          (key_r    ),
    /*input         */  .opera_done      (opera_done),//读/写操作结束
    /*input  [55:00]*/ // .din             (),//读回的时间数据、可以放在串口发送模块、暂定

    /*output        */  .wr_vld          (wr_vld),//指示开始操作标志
    /*output [87:00]*/  .dout            (dout  ),//写需要88，读需要8，其余已经将sda拉高阻
    /*output        */  .wr              (wr    ), //指示读或写 0：写 1：读
    /*output        */  .uart_vld        (uart_vld) //指示我们的串口发送有效
    );

    ds1302_intf ds1302_intf_inst(
    /*input       */        .clk        (sys_clk  ),
    /*input       */        .rst_n      (sys_rst_n),
    /*input       */        .wr_vld     (wr_vld   ),
    /*input [87:0]*/        .din        (dout     ),
    /*input       */        .wr         (wr       ),//标志读写 0：写 1：读

    /*output reg [55:0]*/   .data       (data     ),//读回的数据
                            .opera_done (opera_done),
 
    /*output reg*/          .CE         (CE       ),
    /*output    */          .sclk       (sclk     ),
    /*inout     */          .sda        (sda      )
    );

    key_filter key_filter_inst(
    /*input wire*/ .sys_clk     (sys_clk  ),
    /*input wire*/ .sys_rst_n   (sys_rst_n),
    /*input wire*/ .key_in      (key_in   ),

    /*output reg*/ .key_flag    (key_r)//传回单个脉冲标志
    );

    uart_ctrl uart_ctrl_inst(
    /*input        */   .clk         (sys_clk   ),
    /*input        */   .rst_n       (sys_rst_n ),
    /*input  [55:0]*/   .din         (data      ),//需要发送的时间、日期
    /*input        */   .uart_vld    (uart_vld  ),//数据更新、使能发送

    /*output       */   .uart_tx     (Uart_tx   ) 
    );

endmodule