module LoopFilter
(
	input wire reset_i,
	input wire clk_i,
	input wire forwarding_i,
	input wire slowing_i,
	output reg positiveShift_o,
	output reg negativeShift_o
);
	wire resetValueIncrement;
	wire resetValueDecrement;
	wire [7:0] resetValue;
	
	KGB32 kgbM
	(
		.reset_i(reset_i),
		.clk_i(clk_i),
		.increment_i(forwarding_i),
		.decrement_i(slowing_i),
		.initialValue_i('0),
		.triggeredMax_o(resetValueIncrement),
		.triggeredMin_o(resetValueDecrement)
	);
	
	ReversiveCounter resetCounter
	(
		.reset_i(reset_i),
		.clk_i(clk_i),
		.increment_i(resetValueIncrement && (resetValue != 8)),
		.decrement_i(resetValueDecrement && (resetValue != 8'hF8)),
		.loadNewValue_i('0),
		.loadingValue_i('0),
		.value_o(resetValue)
	);
	
	KGB8 kgbN
	(
		.reset_i(reset_i),
		.clk_i(clk_i),
		.increment_i(forwarding_i),
		.decrement_i(slowing_i),
		.initialValue_i(resetValue),
		.triggeredMax_o(positiveShift_o),
		.triggeredMin_o(negativeShift_o)
	);
	
endmodule

