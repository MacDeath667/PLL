module KGB8
(
	input wire reset_i,
	input wire clk_i,
	input wire increment_i,
	input wire decrement_i,
	input wire [4:0] initialValue_i,
	output wire triggeredMax_o,
	output wire triggeredMin_o
);
	
	wire [4:0] maxValue;
	assign maxValue = 5'd8;
	
	wire [4:0] minValue;
	assign minValue = ~maxValue + 5'd1;
	
	wire loadNewValue;
	wire [4:0] counter;
	
	assign triggeredMax_o = (counter == maxValue);
	assign triggeredMin_o = (counter == minValue);
	assign loadNewValue = triggeredMax_o || triggeredMin_o;
				
	ReversiveCounter
	#(.WIDTH(5))
	reversiveCounter
	(
		.reset_i(reset_i),
		.clk_i(clk_i),
		.increment_i(increment_i),
		.decrement_i(decrement_i),
		.loadNewValue_i(loadNewValue),
		.loadingValue_i(initialValue_i),
		.value_o(counter)
	);

endmodule
