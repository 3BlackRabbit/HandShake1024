module top(
input clk,
input rst,



inout 			ready,
inout	[7:0]	data,
inout 			valid
	);

Master Master_inst(
.clk(clk),
.rst(rst),

.M_ready(ready),
.M_data(data),
.M_valid(valid)

	);
Slave Slave_inst(
.clk(clk),
.rst(rst),
.S_ready(ready),
.S_valid(valid),
.S_data(data)
	);
endmodule