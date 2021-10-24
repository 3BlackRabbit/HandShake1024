`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/24 12:56:05
// Design Name: 
// Module Name: tbc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale		1ns/1ns
module tb();

reg clk;
reg	rst;

wire ready;
wire [7:0] data;
wire valid;



initial
	begin
		clk = 1;
		rst <= 0;
		#20
		rst <= 1;
		#20
		rst <= 0;
		
	end
always #5  clk = ~clk;

top top_inst(
.clk	(clk),
.rst	(rst),

.ready(ready),
.data(data),
.valid(valid)


);
endmodule