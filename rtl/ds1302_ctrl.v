module ds1302_ctrl (
    input           clk             ,//系统时钟
    input           rst_n           ,//系统复位
    input           rd_key          ,//消抖后的按键标志信号
    input           opera_done      ,//读/写操作结束

    output          wr_vld          ,//指示开始操作(读/写)标志
    output [87:00]  dout            ,//需要写的数据 写需要88，读需要8，其余已经将sda拉高阻
    output          wr              ,//指示读或写 0：写 1：读
    output          uart_vld         //指示我们的串口发送有效
);
    
//变量
    parameter IDLE  = 4'b0001,
              WRITE = 4'b0010,
              READ  = 4'b0100,
              DONE  = 4'b1000;

    parameter max_20ms = 1_000_000;//20ms

    reg [3:0] state_c,state_n;

    reg          [19:00]    cnt_20ms         ; //Counter 
    wire                    add_cnt_20ms     ; //Counter Enable
    wire                    end_cnt_20ms     ; //Counter Reset 

    wire                    IDLE2WRITE      ;
    wire                    IDLE2READ       ;
    wire                    WRITE2DONE      ;
    wire                    READ2DONE       ;
    wire                    DONE2IDLE       ; 

    reg                     initflag        ;//标志是否初始化时间

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            state_c <= IDLE;
        end
        else begin
            state_c <= state_n;
        end
    end

    always @(*) begin
        if(!rst_n)begin
            state_n = IDLE;
        end
        case(state_c)
            IDLE : begin
                if(IDLE2WRITE)begin
                    state_n = WRITE;
                end
                else if(IDLE2READ)begin
                    state_n = READ;
                end
                else begin
                    state_n = IDLE;
                end
            end
            WRITE: begin
                if(WRITE2DONE)begin
                    state_n = DONE;
                end
                else begin
                    state_n = WRITE;
                end
            end
            READ : begin
                if(READ2DONE)begin
                    state_n = DONE;
                end
                else begin
                    state_n = READ;
                end
            end
            DONE : begin
                state_n = IDLE;
            end
            default: state_n = IDLE;
        endcase
    end

    assign IDLE2WRITE = state_c == IDLE  && (end_cnt_20ms);//上电20ms且初始化flag为低
    assign IDLE2READ  = state_c == IDLE  && (rd_key);//读按键按下
    assign WRITE2DONE = state_c == WRITE && (opera_done);//接口操作结束
    assign READ2DONE  = state_c == READ  && (opera_done);//接口操作结束
    assign DONE2IDLE  = state_c == DONE  && 1'b1;    

    //20ms计数
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            cnt_20ms <= 20'd0;
        end
        else if(add_cnt_20ms)begin
            if(end_cnt_20ms)begin
                cnt_20ms <= 20'd0;
            end
            else begin
                cnt_20ms <= cnt_20ms + 1'b1;
            end
        end
        else begin
            cnt_20ms <= 20'd0;
        end
    end

    assign add_cnt_20ms = (state_c == IDLE) && (~initflag); 
    assign end_cnt_20ms = add_cnt_20ms && cnt_20ms == max_20ms - 1'b1;

    //标志是否初始化时间
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            initflag <= 1'b0;
        end
        else if(IDLE2WRITE)begin
            initflag <= 1'b1;
        end
        else begin
            initflag <= initflag;
        end
    end

    assign wr_vld = IDLE2WRITE || IDLE2READ;
    assign dout   = (state_c == WRITE) ? 88'h0023011015130101BE008E : 88'h00BF;    
    assign wr     = (state_c == WRITE) ? 1'b0 : 1'b1;    
    assign uart_vld = READ2DONE;//读结束时的数据刚好读完，使能发送
endmodule