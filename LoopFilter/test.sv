module test;
    
    reg reset_i;
    reg clk_i;
    reg signalA_i;
    reg signalB_i;
    wire forwarding;
    wire slowing;
    wire positiveShift_o;
    wire negativeShift_o;
    
    PhaseDetector PhaseDUT
    (
        .reset_i(reset_i),
        .clk_i(clk_i),
        .signalA_i(signalA_i),
        .signalB_i(signalB_i),
        .forwarding_o(forwarding),
        .slowing_o(slowing)
    );
    
    LoopFilter LoopDUT
    (
        .reset_i(reset_i),
        .clk_i(clk_i),
        .forwarding_i(forwarding),
        .slowing_i(slowing),
        .positiveShift_o(positiveShift_o),
        .negativeShift_o(negativeShift_o)
    );
    
    initial begin 
        reset_i = 0;
        clk_i = 0;
        signalA_i = 0;
        signalB_i = 0;
        #0.1us;
        reset_i = 1;
        #300us;
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
        #0.15us;
        signalB_i = !signalB_i;
        #0.1us;
    end
    
endmodule
