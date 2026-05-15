/*
 * Copyright (c) 2026, University of California; Santa Barbara
 * Distribution prohibited. All rights reserved.
 *
 * File: ucsbece152a_counter_tb.sv
 * Description: Counter testbench.
 */

module ucsbece152a_counter_tb();

parameter WIDTH = 3;

// clock
logic clk = 0;
always #(10) clk = ~clk;

// DUT signals
logic rst;
logic enable;
logic dir;
logic [WIDTH-1:0] count;

// DUT
ucsbece152a_counter #(
    .WIDTH(WIDTH)
) DUT (
    .clk(clk),
    .rst(rst),
    .count_o(count),
    .enable_i(enable),
    .dir_i(dir)
);

initial begin

    $display("Begin simulation.");

    // initialize
    rst = 1'b1;
    enable = 1'b1;
    dir = 1'b0;

    @(negedge clk);

    // release reset
    rst = 1'b0;

    // =========================
    // COUNT UP
    // =========================
    repeat (10) begin
        @(negedge clk);
    end

    // =========================
    // DISABLE COUNTER
    // =========================
    enable = 1'b0;

    repeat (4) begin
        @(negedge clk);
    end

    // =========================
    // ENABLE + COUNT DOWN
    // =========================
    enable = 1'b1;
    dir = 1'b1;

    repeat (10) begin
        @(negedge clk);
    end

    // =========================
    // TEST RESET
    // =========================
    rst = 1'b1;

    @(negedge clk);

    rst = 1'b0;

    $display("End simulation.");
    $stop;

end

endmodule
