module ReversiveCounter 
#(
	parameter WIDTH = 8
)
(
	input wire reset_i,
	input wire clk_i,
	input wire increment_i,
	input wire decrement_i,
	input wire loadNewValue_i,
	input wire [WIDTH - 1:0] loadingValue_i,
	output wire [WIDTH - 1:0] value_o
);

	reg [WIDTH - 1:0] value;
	
	wire [WIDTH - 1:0] incValue;
	assign incValue = 1;
	
	wire [WIDTH - 1:0] decValue;
	assign decValue = '1;
	
	assign value_o = value;
	
	always_ff @(posedge clk_i or negedge reset_i)
	begin
	
		if (!reset_i)
			value <= '0;
		else if (clk_i)
		begin
		
			if (loadNewValue_i)
				value <= loadingValue_i;
			else if (increment_i && !decrement_i)
				value <= value + incValue;
			else if (!increment_i && decrement_i)
				value <= value + decValue;
		end
		
	end

endmodule
