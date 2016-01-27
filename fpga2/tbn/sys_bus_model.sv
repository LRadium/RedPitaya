////////////////////////////////////////////////////////////////////////////////
// Red Pitaya system bus model.
// Author Matej Oblak
// (c) Red Pitaya  http://www.redpitaya.com
////////////////////////////////////////////////////////////////////////////////

/**
 * GENERAL DESCRIPTION:
 *
 * Simple model of Red Pitaya system bus.
 *
 * In order to simplify other testbenches this model was written. It has two
 * task, one for write other for read. Both serves as replacement for PS-AXI
 * control of Red Pitaya system bus.
 * 
 */

`timescale 1ns / 1ps

interface sys_bus_model #(
  type DAT_T = logic [32-1:0],
  type ADR_T = logic [32-1:0]
)(
  sys_bus_if.m bus
);

initial begin
  bus.wen <= 1'b0;
  bus.ren <= 1'b0;
end

// bus write transfer
task transaction (
  input  logic we,
  input  ADR_T addr,
  input  DAT_T wdata,
  output DAT_T rdata
);
  @(posedge bus.clk)
  bus.wen    <=  we;
  bus.ren    <= ~we;
  bus.addr   <= addr;
  bus.wdata  <= wdata;
  @(posedge bus.clk);
  bus.wen    <= 1'b0;
  bus.ren    <= 1'b0;
  while (~bus.ack & ~bus.err)
    @(posedge bus.clk);
  rdata <= bus.rdata;
  @(posedge bus.clk);
endtask: transaction

// bus write transfer
task write (
  input  ADR_T addr,
  input  DAT_T wdata
);
  logic [32-1:0] rdata;
  transaction (.we (1'b1), .addr (addr), .wdata (wdata), .rdata (rdata));
endtask: write

// bus read transfer
task read (
  input  ADR_T addr,
  output DAT_T rdata
);
  transaction (.we (1'b0), .addr (addr), .wdata ('x), .rdata (rdata));
endtask: read

endinterface: sys_bus_model
