`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2024 11:12:01 PM
// Design Name: 
// Module Name: compare
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



module compare(LEDsIn, nextState, LEDsOut);
    parameter INITIAL_STATE = 3'b000;
    parameter FROM_0_TO_15 = 3'b001;
    parameter FROM_15_TO_5 = 3'b010;
    parameter FROM_5_TO_10 = 3'b011;
    parameter FROM_10_TO_0 = 3'b100;
    parameter FROM_0_TO_5 = 3'b101;
    parameter FROM_5_TO_0 = 3'b110;

    input [2:0] nextState;
    input [15:0] LEDsIn;
    output reg [15:0] LEDsOut;
    
    always @(*) begin
        if (nextState == FROM_0_TO_15 || nextState == FROM_5_TO_10 || nextState == FROM_0_TO_5) begin
            LEDsOut = LEDsIn << 1 | 1;
        end
        else if (nextState == FROM_15_TO_5 || nextState == FROM_10_TO_0 || nextState == FROM_5_TO_0) begin
            LEDsOut = LEDsIn >> 1;
        end
        else begin
            LEDsOut = 0;
        end
    end
endmodule
