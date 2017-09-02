//========================================================================
// RegIncr3stage
//========================================================================
// Three-stage registered incrementer that uses structural composition to
// instantitate and connect two instances of the single-stage registered
// incrementer.

`ifndef TUT4_VERILOG_REGINCR_REG_INCR_3STAGE_V
`define TUT4_VERILOG_REGINCR_REG_INCR_3STAGE_V

`include "tut4_verilog/regincr/RegIncr.v"

module tut4_verilog_regincr_RegIncr3stage
(
  input  logic       clk,
  input  logic       reset,
  input  logic [7:0] in,
  output logic [7:0] out
);

  // First stage

  logic [7:0] reg_incr_0_out;

  tut4_verilog_regincr_RegIncr reg_incr_0
  (
    .clk   (clk),
    .reset (reset),
    .in    (in),
    .out   (reg_incr_0_out)
  );

  // Second stage
  
  logic [7:0] reg_incr_1_out;  

  tut4_verilog_regincr_RegIncr reg_incr_1
  (
    .clk   (clk),
    .reset (reset),
    .in    (reg_incr_0_out),
    .out   (reg_incr_1_out)
  );

  // Third stage

  tut4_verilog_regincr_RegIncr reg_incr_2
  (
    .clk   (clk),
    .reset (reset),
    .in    (reg_incr_1_out),
    .out   (out)
  );



endmodule

`endif /* TUT4_VERILOG_REGINCR_REG_INCR_2STAGE_V */

