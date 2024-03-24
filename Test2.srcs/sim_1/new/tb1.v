`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2024 01:14:42 AM
// Design Name: 
// Module Name: tb1
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


module tb1 ();
    reg clk, rst, flick;
    wire [15:0] LEDs;
    
    system uut(clk, rst, flick, LEDs);
    
    always #5 clk = ~clk;
    
    initial begin
        clk <= 0;
        rst <= 0;
        flick <= 0;
        #10 rst <= 1;
        #250 flick <= 1;
        #1000 $stop;
    end
endmodule
