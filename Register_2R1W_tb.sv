`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2023 11:53:54 PM
// Design Name: 
// Module Name: Register_2R1W_tb
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


module Register_2R1W_tb;

 logic [31:0] Data_IN;                   // Data Input
 logic [4:0] RW;                         // Write Address given from this port
 logic [4:0] R1;                         // Read 1 Address
 logic [4:0] R2;                         // Read 2 Address
 logic RD;
 logic WR;
 logic Reset;
 logic EN;
 logic Clock;
 
 logic [31:0] Q1;                        // Outputs
 logic [31:0] Q2;
 
 // Intiantiating top_Register_2R1W named as Reg
 top_Register_2R1W Reg (    
               .Data_IN(Data_IN), 
               .RW(RW), 
               .Q1(Q1), 
               .R1(R1), 
               .Q2(Q2), 
               .R2(R2), 
               .RD(RD), 
               .WR(WR), 
               .Reset(Reset), 
               .EN(EN), 
               .Clock(Clock)
              );
 initial begin
 
  Data_IN  = 32'b0;                          // Initialize Inputs
  RW  = 5'b0;
  R1  = 5'b0;
  R2  = 5'b0;
  RD  = 1'b0;
  WR  = 1'b0;
  Reset  = 1'b1;
  EN  = 1'b0;
  Clock  = 1'b0;
  // Wait 100 ns for global reset to finish
  #100;        
  // Add stimulus here
   Reset  = 1'b0;
   EN  = 1'b1;
   #20;
   WR  = 1'b1;
   RD = 1'b0;
   Data_IN  = 32'habcd_efab;
   RW  = 5'h0;
   #20;
   Data_IN  = 32'h0123_4567;
   RW  = 5'h1;
   #20;
   WR  = 1'b0;
   RD  = 1'b1;
   R1  = 5'h0;
   R2  = 5'h1;
 end 
 always begin
  #10;
  Clock = ~Clock;
 end 
endmodule
