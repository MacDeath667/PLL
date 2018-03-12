module DPKD
(
	input logic reset_i,
	input logic clk_i,
	input logic positiveShift_i,
	input logic negativeShift_i,
	output logic outSignal_o
);
	
	Divider divider
	(
		.reset_i(reset_i),
		.clk_i(clk_i),
		.positiveShift_i(positiveShift_i),
		.negativeShift_i(negativeShift_i),
		.initValue_i(8'd100),
		.out(outSignal_o)
	);
	
	
endmodule

