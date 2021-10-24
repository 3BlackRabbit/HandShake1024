module Master(
input 			clk,
input 			rst,

input 			M_ready,
output	[7:0]	M_data,
output 			M_valid

	);

reg 	[7:0] 	data_cnt;
reg 			M_valid_r;
reg             M_valid_r2;

//data

assign M_data = data_cnt;
assign M_valid = M_valid_r;

always @(posedge clk or posedge rst) begin
    if(rst)begin
        M_valid_r2 <= 1'b0;
    end
    else begin
        M_valid_r2<= M_valid_r;
    end
end

always @(posedge clk or posedge rst) begin
	if (rst) begin
		// reset
		data_cnt <= 8'b0;
		M_valid_r<= 1'b0;
	end
	else if (M_valid_r2==1 && M_ready==1) begin
		M_valid_r <=  1'b0;
		if (data_cnt == 8'd255) begin
			data_cnt <= 8'b0;
		end
		else begin
			data_cnt <= data_cnt+1'b1;
		end
	end
	else begin
		M_valid_r <= 1'b1;
		data_cnt <= data_cnt;
	end
end

endmodule