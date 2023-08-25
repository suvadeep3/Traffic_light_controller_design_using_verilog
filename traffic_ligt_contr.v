`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:SUVADEEP MANDAL 
// 
// Create Date: 23.08.2023 18:57:32
// Design Name: 
// Module Name: traffic_ligt_contr
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


module traffic_ligt_contr(hwy,cntry,x,clk,clear);
 output reg[1:0] hwy,cntry;
 input x,clk,clear;
 //difine different states    hwy      cntry
 parameter s0=3'd0; //        green    red
 parameter s1=3'd1; //        yellow   red
 parameter s2=3'd2; //        red      green
 parameter s3=3'd3; //        red      yellow
 parameter red=2'd0; //define colours
 parameter yellow=2'd1;
 parameter green=2'd2;
 reg[2:0] state,next_state; //internal state variables
 initial
  begin
   state=s0;
   next_state=s0;
   hwy=green;
   cntry=red;
  end
//  update state from next state
 always @(posedge clk)
    begin
     state=next_state;
    end
//   values of country line and highway line 
 always @(state)
  begin
    case(state)
     s0:begin
        hwy=green;
        cntry=red;
        end
     s1:begin
        hwy=yellow;
        cntry=red;
        end
     s2:begin
        hwy=red;
        cntry=green;
        end
     s3:begin
       hwy=red;
       cntry=yellow;
       end
   default:begin
        hwy=green;
        cntry=red;
        end
   endcase
  end
  
//  update state according to input X
  always @(state or clear or x)
    begin
      if(clear)
       next_state=s0;
      else
        case(state)
          s0:begin
             next_state=x?s1:s0;
            end
         s1:begin
             next_state=s2;
          end
          s2:begin
             next_state=s3;
          end
         s3:begin
           #5 next_state=x?s3:s0;
           end
         default:next_state=s0;
        endcase
    end
 
endmodule
