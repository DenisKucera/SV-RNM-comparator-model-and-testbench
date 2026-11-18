/*
 * Project: RNM testbench
 * File: top_pkg.sv
 * Author: Denis Kucera
 * Created: 2026-05-20
 * Description: top level package
 */

package top_pkg;

`include "uvm_macros.svh"
import uvm_pkg::*;

// import UVC's packages
import comp_uvc_pkg::*;

// include env files
`include "top_env.sv"

endpackage : top_pkg
