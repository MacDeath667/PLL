module Divider
#(
	parameter WIDTH = 8

)
(
	input logic reset_i,
	input logic clk_i,
	input logic positiveShift_i,
	input logic negativeShift_i,
	input logic [WIDTH - 1:0] initValue_i,
	output logic out
);

	logic outSignal_o;
	logic [WIDTH - 1:0] counter;
	logic value;
	
	always_ff @(posedge clk_i or negedge reset_i)
	begin
	
		if (!reset_i)
			begin
				out <= '0;
				value <= '0;
				counter <= 'd0;
			end
		else if (clk_i)
		begin
			
			counter <= counter + 1'd1;
			if (counter == value)
			out <= !out;
			
		end
		
	end

endmodule
