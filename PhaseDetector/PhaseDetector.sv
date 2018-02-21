module PhaseDetector
(
	input wire reset_i,
	input wire clk_i,
	input wire signalA_i,
	input wire signalB_i,
	output reg forwarding_o,
	output reg slowing_o
);
	
	wire startPoint = ((signalA_i == 0) && (signalB_i == 0));
	reg startPointReg;
	
	
	always_ff @(posedge clk_i or negedge reset_i)
	begin
	
		if (reset_i == 1'b0) // same as if (~reset_i) -- bitwise negation
									// or if (!reset_i) -- logical negation
		begin
			forwarding_o <= 1'b0;
			slowing_o <= 1'b0;
			startPointReg <= 1'b0;
		end
		
		else if (clk_i == 1'b1)
		begin
			// normal work
			startPointReg <= startPoint;
			forwarding_o <= ((signalA_i == 1) && (signalB_i == 0) && (startPointReg == 1)); // или (signalA_i && !signalB_i && startPointReg);
			slowing_o <= ((signalA_i == 0) && (signalB_i == 1) && (startPointReg == 1));
		end
		
	end
endmodule
