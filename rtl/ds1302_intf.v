module ds1302_intf (
    input               clk         ,//系统时钟
    input               rst_n       ,//系统复位
    input               wr_vld      ,//操作有效标志 
    input [87:0]        din         ,//需要写入ds1302的数据
    input               wr          ,//标志读写 0：写 1：读

    output reg [55:0]   data        ,//读回的数据
    output              opera_done  ,//CE拉低 end_cnt_bit || end_cnt_bit2;//两个字节操作结束
 
    output reg          CE          ,//使能工作信号 高有效
    output              sclk        ,//2M的时钟 CE有效产生
    inout               sda          //三态门，不同SCLK给出不同数据
);

//变量
    reg          [04:00]    cnt_clk         ; //Counter 
    wire                    add_cnt_clk     ; //Counter Enable
    wire                    end_cnt_clk     ; //Counter Reset 
    reg          [04:00]    cnt_clk2         ; //Counter 
    wire                    add_cnt_clk2     ; //Counter Enable
    wire                    end_cnt_clk2     ; //Counter Reset 

    wire                    clk_pos          ;
    wire                    clk_neg          ;

    wire                    clk_2M           ;

    reg          [07:00]    cnt_bit         ; //Counter 
    wire                    end_cnt_bit     ; //Counter Reset   需要发送16bit

    reg                     dout            ;//写时发送的数据

    reg          [07:00]    cnt_bit2         ; //Counter 
    wire                    end_cnt_bit2     ; //Counter Reset   需要发送16bit
    reg                     dout2           ;//读时的数据

    reg          [07:00]    cnt_bit3         ; //Counter 用于写保护
    wire                    end_cnt_bit3     ; //Counter Reset   需要发送16bit
    reg                     dout3           ;//读时的数据

    reg          [1:0]      sclk_r          ;
    reg          [1:0]      CE_r            ;
    wire                    sclk_neg        ;
    wire                    CE_pos          ;

//仿真测试 2s
    parameter      max_1s = 50_000_000,
                   max_3s = 3;
    reg          [26:00]    cnt_1s         ; //Counter 
    wire                    add_cnt_1s     ; //Counter Enable
    wire                    end_cnt_1s     ; //Counter Reset 
    reg          [03:00]    cnt_3s         ; //Counter 
    wire                    add_cnt_3s     ; //Counter Enable
    wire                    end_cnt_3s     ; //Counter Reset 

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            cnt_1s <= 27'd0;
        end
        else if(add_cnt_1s)begin
            if(end_cnt_1s)begin
                cnt_1s <= 27'd0;
            end
            else begin
                cnt_1s <= cnt_1s + 1'b1;
            end
        end
    end

    assign add_cnt_1s = 1'b1;
    assign end_cnt_1s = add_cnt_1s && cnt_1s == max_1s - 1;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            cnt_3s <= 4'd0;
        end
        else if(add_cnt_3s)begin
            if(end_cnt_3s)begin
                cnt_3s <= 4'd0;
            end
            else begin
                cnt_3s <= cnt_3s + 1'b1;
            end
        end
    end

    assign add_cnt_3s = end_cnt_1s;
    assign end_cnt_3s = add_cnt_3s && cnt_3s == max_3s - 1;
//测试

    assign opera_done = end_cnt_bit || end_cnt_bit2;//两个字节操作结束

//时钟分频 2M
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            cnt_clk <= 5'd0;
        end
        else if(add_cnt_clk)begin
            if(end_cnt_clk)begin
                cnt_clk <= 5'd0;
            end
            else begin
                cnt_clk <= cnt_clk + 1'b1;
            end
        end
        else begin
            cnt_clk <= 5'd0;
        end
    end

    assign add_cnt_clk = CE;
    assign end_cnt_clk = add_cnt_clk && cnt_clk == 24 ;
    assign clk_pos = (cnt_clk < 5'd12) ? 1'b1 : 1'b0;

    always @(negedge clk or negedge rst_n) begin
        if(!rst_n)begin
            cnt_clk2 <= 5'd0;
        end
        else if(add_cnt_clk2)begin
            if(end_cnt_clk2)begin
                cnt_clk2 <= 5'd0;
            end
            else begin
                cnt_clk2 <= cnt_clk2 + 1'b1;
            end
        end
        else begin
            cnt_clk2 <= 5'd0;
        end
    end

    assign add_cnt_clk2 = CE;
    assign end_cnt_clk2 = add_cnt_clk2 && cnt_clk2 == 24 ;
    assign clk_neg = (cnt_clk2 < 5'd12) ? 1'b1 : 1'b0;

    assign clk_2M = ~(clk_neg || clk_pos);//在CE有效时输出

    //读写有效，拉高
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            CE <= 1'b0;
        end
        else if(wr_vld)begin
            CE <= 1'b1;
        end
        else if((end_cnt_bit && wr == 1'b0) || (end_cnt_bit2 && wr == 1'b1))begin
            CE <= 1'b0;
        end
        else begin
            CE <= CE;
        end
    end

    //赋值参考时钟
    assign sclk = CE ? clk_2M : 1'b0;

    //打拍
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            sclk_r <= 1'b0;
            CE_r   <= 1'b0;
        end
        else begin
            sclk_r <= {sclk_r[0],sclk};
            CE_r   <= {CE_r  [0],CE}  ;
        end
    end

    assign sclk_neg =  ~sclk_r[0] && sclk_r[1];
    assign CE_pos   =  CE_r  [0] && ~CE_r  [1];

    //写
    always @(negedge clk or negedge rst_n) begin// or posedge CE
        if(!rst_n)begin
            dout <= 1'b0;
            cnt_bit <= 8'd0;
        end
        else begin
            if(end_cnt_bit || (CE == 1'b0))begin
                cnt_bit <= 8'd0;
            end
            if((sclk_neg || CE_pos)&&(!wr)  )begin
                    dout <= din[cnt_bit];
                    cnt_bit <= cnt_bit + 1'b1;
            end
        end
    end

    //读
    always @(negedge clk or negedge rst_n) begin// or posedge CE
        if(!rst_n)begin
            dout2 <= 1'b0;
            cnt_bit2 <= 8'd0;
        end
        else begin
            if(end_cnt_bit2 || (CE == 1'b0))begin
                cnt_bit2 <= 8'd0;
            end
            else if((sclk_neg || CE_pos)&& wr )begin
                    dout2 <= din[cnt_bit2];
                    cnt_bit2 <= cnt_bit2 + 1'b1;
            end
        end
    end

    //写保护
    always @(posedge sclk or negedge rst_n) begin
        if(!rst_n)begin
            data <= 8'd0;
        end
        else if((cnt_bit2 > 8'd7)&&wr&&CE)begin//接收数据
            data <= {sda,data[55:1]};
        end
    end

    assign end_cnt_bit = cnt_bit > 8'd88;//写
    assign end_cnt_bit2 = cnt_bit2 > 8'd64;

    assign sda = ((wr == 1'b0 && CE)||(wr == 1'b1 && cnt_bit2 <= 5'd8)) ? ((wr == 1'b0 && CE) ? dout: dout2) : 1'bz;
endmodule