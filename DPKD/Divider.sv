module Divider
#(
	parameter WIDTH = 8

)
(
	input wire reset_i,
	input wire clk_i,
	input wire positiveShift_i,
	input wire negativeShift_i,
	input wire [WIDTH - 1:0] initValue_i,
	output wire output_o
);

	reg outSignal_o;
	logic [WIDTH - 1:0] counter;
	assign counter = 8'd0;
	//wire [WIDTH - 1:0] incValue;
	//assign incValue = 1;
	
	reg value;
	
	//wire [WIDTH - 1:0] decValue;
	//assign decValue = '1;
	//----------------------------------------------
	//----------------------------------------------
	assign outSignal_o = output_o;
	
	always_ff @(posedge clk_i or negedge reset_i)
	begin
	
		if (!reset_i)
			value <= '0;
		else if (clk_i)
		begin
			
			counter <= counter + 1'd1;
			if (counter == value)
			output_o <= !output_o;
			
		end
		
	end

endmodule
