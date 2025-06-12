`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2025 05:47:37 PM
// Design Name: 
// Module Name: sequence_detector_1010
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


module sequence_detector_1010(
    input clk,
    input rst,
    input in,
    output reg out
);
    
parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
reg [1:0] CS, NS; // Current state and next state 

// Sequential logic for state transition
always @ (posedge clk or negedge rst)
    if (!rst)
        CS <= s0;
    else
        CS <= NS;

// Combinational logic for next state and output
always @ (*)
begin
    case (CS)
        s0: begin
            NS = in ? s1 : s0;
            out = 0;
        end
        s1: begin
            NS = in ? s1 : s2;
            out = 0;
        end
        s2: begin
            NS = in ? s3 : s0;
            out = 0;
        end
        s3: begin
            NS = in ? s1 : s2;
            out = (in == 0) ? 1 : 0;  // Detected "1010"
        end
        default: begin
            NS = s0;
            out = 0;
        end
    endcase
end

endmodule

