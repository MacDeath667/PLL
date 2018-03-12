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
	output logic output_o
);

	logic outSignal_o;
	logic [WIDTH - 1:0] counter;
	assign counter = 8'd0;
	//wire [WIDTH - 1:0] incValue;
	//assign incValue = 1;
	
	logic value;
	
	//wire [WIDTH - 1:0] decValue;
	//assign decValue = '1;
	//----------------------------------------------
	//----------------------------------------------
	assign outSignal_o = output_o;
	
	always_ff @(posedge clk_i or negedge reset_i)
	begin
	
		if (!reset_i)
			output_o <= '0;
			value <= '0;
		else if (clk_i)
		begin
			
			counter <= counter + 1'd1;
			if (counter == value)
			output_o <= !output_o;
			
		end
		
	end

endmodule
