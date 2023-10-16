
/**********************
此模块通过状态机对按键进行消抖，并传回标志单脉冲、终极无错版
**********************/
module key_filter //#(parameter key_w = 3) 
(
    input wire sys_clk	,//系统时钟
    input wire sys_rst_n,//系统复位
    input wire key_in	,//按键信号

    output reg key_flag	//传回单个脉冲标志
);
localparam IDLE    = 4'b0001, //空闲状态
		   DOWN    = 4'b0010, //按下抖动状态
		   HOLD    = 4'b0100, //稳定在低电平状态
		   UP      = 4'b1000; //释放抖动状态

reg      [3:0]      state_c,state_n; //现态和次态变量声明

// 按键边沿检测
reg      [01:00]        key_r; //
wire                    key_pos,key_neg; //

parameter  CNT_MAX =20'd999_999; //20ms计数

reg [19:0] cnt_20ms;
//延时按键消抖
// reg key_flag;
// 20ms消抖
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n==1'b0)
        cnt_20ms<=20'b0;
	else if(cnt_20ms == CNT_MAX - 1)
		cnt_20ms <= 20'd0;
    else if(state_c == DOWN || state_c == UP)
        cnt_20ms<=cnt_20ms+20'd1;
    else
        cnt_20ms <= 20'b0;

//状态机消抖
//状态空间说明
always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        state_c <= IDLE;
    else
        state_c <= state_n;
end           
//状态转移
always @(*) begin
    case(state_c)
			IDLE :begin 
				if(key_neg)begin //检测到输入按键信号的下降沿
					state_n = DOWN;
				end
				else begin
					state_n = IDLE;
				end
			end 
			DOWN :begin 
				if(cnt_20ms==(CNT_MAX-20'd1))begin
					state_n = HOLD;
				end
				else if(key_pos) begin
					state_n = IDLE;
				end
				else begin
					state_n = DOWN;
				end
			end 
			HOLD :begin 
				if(key_pos)begin
					state_n = UP;
				end
				else begin
					state_n = HOLD;
				end
			end 
			UP   :begin 
				if(cnt_20ms==(CNT_MAX-20'd1))begin
					state_n = IDLE;
				end
				else if(key_neg)begin
					state_n = HOLD;
				end
				else begin
					state_n = state_c;
				end
			end 
			default: state_n = IDLE;
	endcase
end
always @(posedge sys_clk or negedge sys_rst_n)begin 
	if(!sys_rst_n)begin
		key_r <= 2'b11;
	end  
	else begin
		key_r <= {key_r[0],key_in}; //打拍寄存
	end
end

assign key_neg = ~key_r[0] & key_r[1];//下降沿检测
assign key_pos = ~key_r[1] & key_r[0];//上升沿检测

always @(posedge sys_clk or negedge sys_rst_n)begin
    if(!sys_rst_n)begin
        key_flag <= 1'b0;
    end
    else if(state_c == DOWN && state_n == HOLD)//按键有效标志,现态是抖动阶段、次态是保持阶段、抖动超过20ms,说明按键有效,进入保持阶段
        key_flag <=   1'b1;//按下标志
    else
        key_flag <= 1'b0;
end
endmodule