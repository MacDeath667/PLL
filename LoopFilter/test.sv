module test;
    
    reg reset_i;
    reg clk_i;
    reg sig1;
    reg sig2;
    reg sig3;
    wire sig13;
    reg switch;
    wire forwarding;
    wire slowing;
    wire positiveShift_o;
    wire negativeShift_o;

    event reachedMaxValue;
    event reachedMinValue;
    
    PhaseDetector PhaseDUT
    (
        .reset_i(reset_i),
        .clk_i(clk_i),
        .signalA_i(sig13),
        .signalB_i(sig2),
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
        sig1 = 0;
        sig2 = 0;
        sig3 = 0;
        switch = 0;
        #0.1us;
        reset_i = 1;
        #1300us;
        $stop();
    end

    assign sig13 = switch ? sig1 : sig3;

    always @(reachedMaxValue)
        switch = 1;

    always @(reachedMinValue)
        switch = 0;

    always @(negedge clk_i)
    begin
        if (LoopDUT.resetCounter.value_o == 8)
            -> reachedMaxValue;
        if (LoopDUT.resetCounter.value_o == 8'hF8)
            -> reachedMinValue;
    end
    
    always begin
        #2.5ns;
        clk_i = !clk_i;
    end
    
    always begin
        #0.25us;
        sig1 = !sig1;
    end
    
    always begin
        #0.20us;
        sig2 = !sig2;
        #0.05us;
    end

    always begin
        #0.15us;
        sig3 = !sig3;
        #0.1us;
    end
    
endmodule
