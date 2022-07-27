module iiitb_piso_tb();
  
  reg clk, rst, load;
  reg [7:0] data_in;
  
  wire data_out;
  
  iiitb_piso u1 (load, clk, rst, data_in, data_out);
  
  always #1 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
  
  initial begin
    clk = 0; rst = 0; load = 0; data_in = 8'h00;
    
    #3 rst = 1;
    
    #2 load = 1; data_in = 8'd15;
    
    #2 load = 0;
    
    #16 load = 1; data_in = 8'd255;
    
    #2 load = 0;
    
    #16 load = 1; data_in = 8'd0;
    
    #2 load = 0;
    
    #18 $stop;
    
  end
  
endmodule
