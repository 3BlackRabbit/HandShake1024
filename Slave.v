module Slave(
input 			clk,
input 			rst,

output 			S_ready,
input	[7:0]	S_data,
input 			S_valid

	);
reg				S_ready_r;
reg				S_ready_r2;
reg 	[7:0]	S_data_r;
reg 	[2:0]	S_ready_cnt;
reg             S_valid_r;


always @(posedge clk or posedge rst) begin
    if(rst)begin
        S_ready_r2 <= 1'b0;
        S_valid_r <= 1'b0;
    end
    else begin
        S_ready_r2<= S_ready_r;
        S_valid_r<= S_valid;
    end
end
//S_ready
always @(posedge clk or posedge rst) begin
	if (rst) begin
		// reset
		S_ready_r <= 1'b0;
		S_ready_cnt <= 3'b0;
	end
	else if (S_ready_cnt == 3) begin
		S_ready_cnt <= 3'b0;
		S_ready_r <= 1'b0;
	end
	else begin
		S_ready_cnt <= S_ready_cnt +3'b1;
		S_ready_r <= 1'b1;
	end
end

//data
always @(posedge clk or posedge rst) begin
	if (rst) begin
		// reset
		S_data_r <= 8'b0;
	end
	else if (S_valid_r==1 && S_ready_r2==1) begin
		S_data_r <= S_data;
	end
end

assign S_ready = S_ready_r;

endmodule