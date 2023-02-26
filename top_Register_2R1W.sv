`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2023 10:50:43 PM
// Design Name: 
// Module Name: top_Register_2R1W
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


module top_Register_2R1W( Data_IN, RW, Q1, R1, Q2, R2, 
                      RD, WR, Reset, EN, Clock
                    );
parameter M = 32; 
parameter N = 32;    
input  [N-1:0]  Data_IN; 
// input  [$clog2(N):0]  RW, R1, R2; 
input  [4:0]  RW, R1, R2;                          // Presently Made for 32 bit address can be made size independent by uncommenting above line
input  RD, WR; 
input  EN, Clock, Reset; 
output logic [N-1:0]  Q1, Q2;     
logic [N-1:0]  RegFile [0:M-1]; 
integer i; 
logic  sen; 
assign sen = ( Clock || Reset ); 
always @ (posedge sen) 
begin 
    if (EN == 1) 
    begin 
        if (Reset == 1) //If at reset 
        begin 
            for (i = 0; i < M; i = i + 1) 
            begin
            RegFile [i] = 32'h0; 
            end 
        end 
    
    else if (Reset == 0) //If not at reset 
    begin 
        case ({RD,WR}) 
            2'b00:  begin 
                        // Do Nothing
                    end 
            2'b01:  begin //If Write only 
                    RegFile [RW] = Data_IN; 
                    end 
            2'b10:  begin //If Read only 
                    Q1 = RegFile [R1]; 
                    Q2 = RegFile [R2]; 
                    end 
            2'b11:  begin //If both active 
                    Q1 = RegFile [R1]; 
                    Q2 = RegFile [R2]; 
                    RegFile [RW] = Data_IN; 
                    end 
            default: begin //If undefined --> Do Nothing 
                     end 
         endcase 
    end 
    else; 
 end 
 else; 
end 
endmodule
