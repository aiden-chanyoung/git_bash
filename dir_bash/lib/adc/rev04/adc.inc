`timescale 1ns/1ps

`ifdef ADC_EMPTY
  `include "./adc.v.empty"
`else
  `ifdef VCS
    `include "./VCS/adc.v"
  `else
    `include "./VCS/adc.v"
  `endif
`endif
