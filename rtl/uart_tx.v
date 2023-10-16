module uart_tx(
	input                       Clk     , //系统时钟
	input                       Rst_n   , //系统复位
	
	input                       tx_en  	, //发送使能
	input              [07:00]  tx_data , //待发送数据
	output    reg               txd  	, //uart 数据发送端口 
	output             			tx_done ,  //一帧数据发送完成标志
	output 						tx_busy   //发送忙信号
);
//Parameter Declarations
	

//Internal wire/reg declarations
	reg 					work_en 	;//工作状态指示信号
	reg      [07:00]        tmp_data 	; //发送数据暂存

	reg          [12:00]    cnt_bps    ; //Counter  
	wire                    add_cnt_bps; //Counter Enable
	wire                    end_cnt_bps; //Counter Reset 
	
	reg          [03:00]    cnt_bit    ; //Counter 
	wire                    add_cnt_bit; //Counter Enable
	wire                    end_cnt_bit; //Counter Reset 

//Logic Description
	always @(posedge Clk or negedge Rst_n)begin 
		if(!Rst_n)begin
			work_en <= 1'b0;
		end  
		else if(tx_en)begin
			work_en <= 1'b1;
		end  
		else if(end_cnt_bit)begin
			work_en <= 1'b0;
		end
		else begin
			work_en <= work_en;
		end
	end //always end
	
	always @(posedge Clk or negedge Rst_n)begin 
		if(!Rst_n)begin
			tmp_data <= 8'd0;
		end  
		else if(tx_en)begin
			tmp_data <= tx_data;
		end  
		else begin
			tmp_data <= tmp_data;
		end
	end //always end

	always @(posedge Clk or negedge Rst_n)begin  
		if(!Rst_n)begin  
			cnt_bps <= 'd0; 
		end  
		else if(add_cnt_bps)begin  
			if(end_cnt_bps)begin  
				cnt_bps <= 'd0; 
			end  
			else begin  
				cnt_bps <= cnt_bps + 1'b1; 
			end  
		end  
		else begin  
			cnt_bps <= 'd0;
		end  
	end //always end
	
	assign add_cnt_bps = work_en; 
	assign end_cnt_bps = add_cnt_bps && cnt_bps >= 9'd434 - 9'd1; 
	
	always @(posedge Clk or negedge Rst_n)begin  
		if(!Rst_n)begin  
			cnt_bit <= 'd0; 
		end  
		else if(add_cnt_bit)begin  
			if(end_cnt_bit)begin  
				cnt_bit <= 'd0; 
			end  
			else begin  
				cnt_bit <= cnt_bit + 1'b1; 
			end  
		end  
		else begin  
			cnt_bit <= cnt_bit;  
		end  
	end //always end
	
	assign add_cnt_bit = end_cnt_bps; 
	assign end_cnt_bit = add_cnt_bit && cnt_bit >= 10 - 1;

/* ================================================  *\
	数据输出
\* ================================================  */
	always @(posedge Clk or negedge Rst_n)begin 
		if(!Rst_n)begin
			txd <= 1'b1;
		end  
		else if(work_en)begin
			if(cnt_bit == 4'd0)begin
				txd <= 1'b0;
			end
			else if(cnt_bit == 4'd9)begin
				txd <= 1'b1;
			end
			else begin
				txd <= tmp_data[cnt_bit-1]; 
			end
		end  
		else begin //空闲为高
			txd <= 1'b1;
		end
	end //always end
	
	assign tx_done = end_cnt_bit;
	assign tx_busy = work_en    ;

endmodule 