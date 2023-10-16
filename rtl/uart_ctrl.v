module uart_ctrl (
    input           clk         ,//系统时钟
    input           rst_n       ,//系统复位
    input  [55:0]   din         ,//需要发送的时间、日期
    input           uart_vld    ,//数据更新、使能发送

    output          uart_tx     //串口发送
);

    parameter clk_50M = 50_000_000;

    wire tx_done;

    reg     [23:0]            cnt_clk  ;
    wire                      add_cnt_clk;
    wire                      end_cnt_clk;

    reg     [4:0]             cnt_bit  ;
    wire                      add_cnt_bit;
    wire                      end_cnt_bit;

    wire                      flag/* synthesis keep="1" */;
    reg     [7:0]             data/* synthesis keep="1" */;

    reg     [55:00]           data_r;

    reg                       send_en;


    assign flag = cnt_clk == (clk_50M/27);//1s发送1次数据

    //数据有效时、此时应该更新数据
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            data_r <= 56'd0;
        end
        else if(uart_vld) begin
            data_r <= din;
        end
    end

    //使能发送时间、日历
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            send_en <= 1'b0;
        end
        else if(uart_vld)begin
            send_en <= 1'b1;
        end
        else if(end_cnt_bit)begin
            send_en <= 1'b0;
        end
        else begin
            send_en <= send_en;
        end
    end


    //时钟计数器
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            cnt_clk <= 24'd0;
        end
        else if(add_cnt_clk)begin
            if(end_cnt_clk)begin
                cnt_clk <= 24'd0;
            end
            else begin
                cnt_clk <= cnt_clk + 1'b1;
            end
        end
        else begin
            cnt_clk <= 24'd0;
        end
    end

    assign add_cnt_clk = send_en;//发送一次，需要发送过程的标志信号
    assign end_cnt_clk = add_cnt_clk && cnt_clk == (clk_50M/27);

    //比特计数器
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            cnt_bit <= 5'd0;
        end
        else if(add_cnt_bit)begin
            if(end_cnt_bit)begin
                cnt_bit <= 5'd0;
            end
            else begin
                cnt_bit <= cnt_bit + 1'b1;
            end
        end
        else begin
            cnt_bit <= cnt_bit;
        end
    end

    assign add_cnt_bit = tx_done;
    assign end_cnt_bit = add_cnt_bit && cnt_bit == 5'd27;

    //根据计数器的值发送相应位置的数据
    always @(*) begin
        case (cnt_bit)
            1 : data = 50; // 2
            2 : data = 48; // 0
            3 : data = data_r[55:52]+ 48;
            4 : data = data_r[51:48]+ 48;//47：40为星期、不要
            5 : data = 8'hC4; // 年 C4 EA   月 D4 C2 日 C8 D5 时 CA B1 分 B7 D6 秒 C3 EB 
            6 : data = 8'hEA;
            7 : data = data_r[39:36]+ 48;
            8 : data = data_r[35:32]+ 48;
            9 : data = 8'hD4;//月 D4 C2
            10: data = 8'hC2;
            11: data = data_r[31:28]+ 48;
            12: data = data_r[27:24]+ 48;
            13: data = 8'hC8;//日 C8 D5
            14: data = 8'hD5;
            15: data = data_r[23:20]+ 48;
            16: data = data_r[19:16]+ 48;
            17: data = 8'hCA;//时 CA B1
            18: data = 8'hB1;
            19: data = data_r[15:12]+ 48;
            20: data = data_r[11:08]+ 48;
            21: data = 8'hB7;//分 B7 D6
            22: data = 8'hD6;
            23: data = data_r[07:04]+ 48;
            24: data = data_r[03:00]+ 48;
            25: data = 8'hC3;//秒 C3 EB 
            26: data = 8'hEB;
            27: data = "\n";
            default: data = 0;
        endcase
    end
    uart_tx uart_tx_inst(
    	/*input      */                 .Clk        (clk    ), //system clock 50MHz
    	/*input      */                 .Rst_n      (rst_n  ), //reset, low valid
    
    	/*input                     */  .tx_en  	(flag   ), //发送使能
    	/*input              [07:00]*/  .tx_data    (data   ), //待发送数据
    	/*output    reg             */  .txd  	    (uart_tx), //uart 数据发送端口 
    	/*output             		*/	.tx_done    (tx_done),  //一帧数据发送完成标志
    	/*output 					*/	.tx_busy    ()
    );    
endmodule