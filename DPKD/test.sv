module test;
    
   reg reset_i;
   reg clk_i;
   reg positiveShift_i;
   reg negativeShift_i;
   wire output_o;

    
   Devider DPKD_DUT
    (
        .reset_i(reset_i),
        .clk_i(clk_i),
        .positiveShift_i(positiveShift_i),
        .negativeShift_i(negativeShift_i),
        .output_o(output_o)
    ); 
    
    
    initial begin 
    reset_i = 0;
    clk_i = 0;
    #0.1us;
    reset_i = 1;
    #200us;
    $stop();
    end

    
    
    always begin
    #2.5ns;
    clk_i = !clk_i;
    end
    
   
    
endmodule
