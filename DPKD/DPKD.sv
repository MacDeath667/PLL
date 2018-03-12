module DPKD
(
	input wire reset_i,
	input wire clk_i,
	input wire positiveShift_i,
	input wire negativeShift_i,
	output reg outSignal_o
);
	
	Divider divider
	(
		.reset_i(reset_i),
		.clk_i(clk_i),
		.positiveShift_i(positiveShift_i),
		.negativeShift_i(negativeShift_i),
		.initValue_i(8'd100),
		.output_o(outSignal_o)
	);
	
	
endmodule

