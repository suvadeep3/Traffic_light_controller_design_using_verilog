`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.08.2023 19:50:23
// Design Name: 
// Module Name: traffic_lgt_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module traffic_lgt_tb();
 reg x,clk,clear;
 wire[1:0]hwy,cntry;
 traffic_ligt_contr dut(.clk(clk),.x(x),.clear(clear),.hwy(hwy),.cntry(cntry));
 initial
  begin
   clk=1'b0;
  end
   always
     begin
      #5 clk=~clk; 
  end
  initial
   begin
    
    $monitor($time,"clk=%b x=%b clear=%b hwy=%d cntry=%d",clk,x,clear,hwy,cntry);
    #2 x=1;
    #28 x=0;
    #45 clear=1;
    #20 $stop;
   end
endmodule
