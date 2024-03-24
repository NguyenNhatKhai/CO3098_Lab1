`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2024 11:12:01 PM
// Design Name: 
// Module Name: system
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


//`define INITIAL_STATE 0
//`define FROM_0_TO_15 4'b0001
//`define FROM_15_TO_5 4'b0010
//`define FROM_5_TO_10 4'b0011
//`define FROM_10_TO_0 4'b0100
//`define FROM_0_TO_5 4'b0101
//`define FROM_5_TO_0 4'b0110

module system(clk, rst, flick, LEDs);
    input clk, rst, flick;
    output [15:0] LEDs;
    
    wire [2:0] accessPrevStateOut, accessNextState;
    wire [15:0] registerLEDs;
    wire [2:0] registerPrevStateOut;
    wire [2:0] registerNextState;
    
    access access (
        .flick(flick), 
        .LEDsIn(LEDs), 
        .prevStateIn(registerPrevStateOut), 
        .currState(registerNextState), 
        .prevStateOut(accessPrevStateOut), 
        .nextState(accessNextState)
    );
    
    register register (
        .clk(clk), 
        .rst(rst), 
        .LEDsIn(LEDs), 
        .prevStateIn(accessPrevStateOut), 
        .currState(accessNextState), 
        .LEDsOut(registerLEDs), 
        .prevStateOut(registerPrevStateOut), 
        .nextState(registerNextState)
    );
    
    compare compare (
        .LEDsIn(registerLEDs), 
        .nextState(registerNextState), 
        .LEDsOut(LEDs)
    );
endmodule
