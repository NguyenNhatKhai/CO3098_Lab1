`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2024 11:12:01 PM
// Design Name: 
// Module Name: register
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


module register(clk, rst, LEDsIn, prevStateIn, currState, LEDsOut, prevStateOut, nextState);
    parameter INITIAL_STATE = 0;
    parameter FROM_0_TO_15 = 4'b0001;
    parameter FROM_15_TO_5 = 4'b0010;
    parameter FROM_5_TO_10 = 4'b0011;
    parameter FROM_10_TO_0 = 4'b0100;
    parameter FROM_0_TO_5 = 4'b0101;
    parameter FROM_5_TO_0 = 4'b0110;

    input clk, rst;
    input [2:0] prevStateIn, currState;
    input [15:0] LEDsIn;
    output reg [2:0] prevStateOut, nextState;
    output reg [15:0] LEDsOut;
    
    always @(posedge clk) begin
        LEDsOut <= LEDsIn;
        prevStateOut <= prevStateIn;
        if (rst == 0) begin
            nextState <= INITIAL_STATE;
        end
        else begin
            nextState <= currState;
        end
    end    
endmodule
