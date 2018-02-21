module test;
	
	reg reset_i;
	reg clk_i;
	reg signalA_i;
	reg signalB_i;
	wire forwarding_o;
	wire slowing_o;
	
	PhaseDetector DUT
	(
		.reset_i(reset_i),
		.clk_i(clk_i),
		.signalA_i(signalA_i),
		.signalB_i(signalB_i),
		.forwarding_o(forwarding_o),
		.slowing_o(slowing_o)
	);
	
	initial begin 
	
		reset_i = 0;
		clk_i = 0;
		signalA_i = 0;
		signalB_i = 0;
		#0.1us;
		reset_i = 1;
		#1ms;
		$stop();
	
	end
	
	always begin
	
		#2.5ns;
		clk_i = !clk_i;
	
	end
	
	always begin
	
		#0.25us;
		signalA_i = !signalA_i;
	
	end
	
	always begin
		
		
		signalB_i = !signalB_i;
		#0.25us;
		
	end
	
endmodule
