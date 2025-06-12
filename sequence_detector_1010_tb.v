`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2025 06:12:04 PM
// Design Name: 
// Module Name: sequence_detector_1010_tb
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

module sequence_detector_1010_tb();

    // Inputs
    reg clk;
    reg rst;
    reg in;

    // Output
    wire out;

    // Instantiate the DUT (Design Under Test)
    sequence_detector_1010 uut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .out(out)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        rst = 0;
        in = 0;

        // Apply reset
        #10 rst = 1;

        // Input Sequence: 1 0 1 0 (Expect output = 1 at end of sequence)
        #10 in = 1;   // 1
        #10 in = 0;   // 0
        #10 in = 1;   // 1
        #10 in = 0;   // 0 → Here, out should become 1
        #10 in = 1;   // Next input (to test overlapping)
        #10 in = 0;   // Another 10 pattern
        #10 in = 1;
        #10 in = 1;   // Wrong pattern
        #10 in = 0;
        #10 in = 0;
        #10 $finish;
    end

    // Monitor outputs
    initial begin
        $display("Time\tclk\trst\tin\tout");
        $monitor("%g\t%b\t%b\t%b\t%b", $time, clk, rst, in, out);
    end

endmodule

