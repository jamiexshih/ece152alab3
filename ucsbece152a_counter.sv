/*
* Copyright (c) 2026, University of California; Santa Barbara
* Distribution prohibited. All rights reserved.
*
* File: ucsbece152a_counter.sv
* Description: Starter file for counter.
*/
module ucsbece152a_counter #(
  parameter WIDTH = 3
) (
    input logic clk,
    input logic rst,
    output logic [WIDTH-1:0] count_o,
    // part 2
    input logic enable_i,
    input logic dir_i
);

  // todo: implement the counter
logic [WIDTH-1:0] count_d, count_q;

assign count_o = count_q;

// Next-state logic
always_comb begin
    // default value
    count_d = count_q;

    // Part 1 behavior:
    // increment every clock cycle
    count_d = count_q + 1'b1;
end

// Flip-flops
always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        count_q <= '0;
    end else begin
        count_q <= count_d;
    end
end


endmodule
