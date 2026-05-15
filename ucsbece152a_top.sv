/*
 * Copyright (c) 2026, University of California; Santa Barbara
 * Distribution prohibited. All rights reserved.
 *
 * File: ucsbece152a_top.sv
 */

module ucsbece152a_top (
    input logic clk,
    input logic rst,
    input logic enable_i,
    input logic dir_i,

    output logic a_o,
    output logic b_o,
    output logic c_o,
    output logic d_o,
    output logic e_o,
    output logic f_o,
    output logic g_o
);

logic [2:0] count;

ucsbece152a_counter #(
    .WIDTH(3)
) counter (
    .clk(clk),
    .rst(rst),
    .count_o(count),
    .enable_i(enable_i),
    .dir_i(dir_i)
);

ucsbece152a_ssdd ssdd (
    .data_i(count),
    .seven_segment_display_o({
        a_o,
        b_o,
        c_o,
        d_o,
        e_o,
        f_o,
        g_o
    })
);

endmodule
