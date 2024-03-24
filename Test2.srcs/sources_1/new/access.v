`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2024 11:12:01 PM
// Design Name: 
// Module Name: access
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



module access(flick, LEDsIn, prevStateIn, currState, prevStateOut, nextState);
    parameter INITIAL_STATE = 0;
    parameter FROM_0_TO_15 = 4'b0001;
    parameter FROM_15_TO_5 = 4'b0010;
    parameter FROM_5_TO_10 = 4'b0011;
    parameter FROM_10_TO_0 = 4'b0100;
    parameter FROM_0_TO_5 = 4'b0101;
    parameter FROM_5_TO_0 = 4'b0110;

    input flick;
    input [15:0] LEDsIn;
    input [2:0] prevStateIn, currState;
    output reg [2:0] nextState;
    output reg [2:0] prevStateOut;
    
    always @(*) begin
        nextState = currState;
        case (currState)
            INITIAL_STATE: begin
                nextState = FROM_0_TO_15;
            end
            FROM_0_TO_15: begin
                if (LEDsIn[15] == 1) begin
                    nextState = FROM_15_TO_5;
                end
            end
            FROM_15_TO_5: begin
                if (flick == 1 && (LEDsIn >> 4 == 1 || LEDsIn >> 9 == 1)) begin
                    nextState = prevStateIn;
                end
                else if (LEDsIn[5] == 0) begin
                    nextState = FROM_5_TO_10;
                end
            end
            FROM_5_TO_10: begin
                if (LEDsIn[10] == 1) begin
                    nextState = FROM_10_TO_0;
                end
            end
            FROM_10_TO_0: begin
                if (flick == 1 && (LEDsIn >> 4 == 1 || LEDsIn >> 9 == 1)) begin
                    nextState = prevStateIn;
                end
                else if (LEDsIn[0] == 0) begin
                    nextState = FROM_0_TO_5;
                end
            end
            FROM_0_TO_5: begin
                if (LEDsIn[5] == 1) begin
                    nextState = FROM_5_TO_0;
                end
            end
            FROM_5_TO_0: begin
                if (flick == 1 && (LEDsIn >> 4 == 1 || LEDsIn >> 9 == 1)) begin
                    nextState = prevStateIn;
                end
                else if (LEDsIn[0] == 0) begin
                    nextState = FROM_0_TO_15;
                end
            end
        endcase
        if (currState == nextState) begin
            prevStateOut = prevStateIn;
        end
        else begin
            prevStateOut = currState;
        end
    end
endmodule
