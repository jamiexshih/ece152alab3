/*
 * Copyright (c) 2026, University of California; Santa Barbara
 * Distribution prohibited. All rights reserved.
 *
 * File: ucsbece152a_counter.sv
 * Description: Counter for Lab 3.
 */

module ucsbece152a_counter #(
    parameter WIDTH = 3
) (
    input  logic clk,
    input  logic rst,
    output logic [WIDTH-1:0] count_o,

    // part 2
    input  logic enable_i,
    input  logic dir_i
);

logic [WIDTH-1:0] count_d, count_q;

assign count_o = count_q;

always_comb begin
    // default value
    count_d = count_q;

    // enable control
    if (enable_i) begin

        // count up
        if (dir_i == 1'b0) begin
            count_d = count_q + 1'b1;

        // count down
        end else begin
            count_d = count_q - 1'b1;
        end
    end
end

always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        count_q <= '0;
    end else begin
        count_q <= count_d;
    end
end

endmodule
