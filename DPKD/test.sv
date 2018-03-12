module test;
    
   logic reset_i;
   logic clk_i;
   logic positiveShift_i;
   logic negativeShift_i;
   logic out;

    
   Devider DPKD_DUT
    (
        .reset_i(reset_i),
        .clk_i(clk_i),
        .positiveShift_i(positiveShift_i),
        .negativeShift_i(negativeShift_i),
        .out(out)
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
