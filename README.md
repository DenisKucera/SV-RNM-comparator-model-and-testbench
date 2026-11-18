# Bc. thesis UVM Verilator Simulation Environment

This repository contains a UVM-based testbench environment for comparator SV-RNM compiled and simulated using **Verilator**.

## Prerequisites

Before running the simulation, ensure you have the following installed:
* **Verilator** (v5.0+ recommended for UVM support)
* **UVM 2020** (Source files)
* **GTKWave** (For viewing waveforms)
* **lcov** (Provides `genhtml` for coverage reports)
* **Python 3** (For hosting the local coverage server)

### Install guide (for Linux only)
For proper UVM support, **Verilator 5.0+** is highly recommended. 
On modern Ubuntu/Debian systems, you can install Verilator and all other required dependencies (for coverage and waveforms) via `apt`:

```bash
sudo apt update
sudo apt install verilator lcov gtkwave python3 git
# It is possible that you need to install more dependencies for building and running environment
```

## UVM Setup
Clone the official Accellera UVM repository (fetching the UVM 2020.2.1 release)
```bash
git clone --branch UVM_2020_2_1 [https://github.com/accellera-official/uvm.git](https://github.com/accellera-official/uvm.git) uvm-2020
# Verify that the expected source file is in the right place
ls -l ~/uvm/uvm-2020/src/uvm_pkg.sv
# Set the UVM_HOME path (path to your UVM installation)
export UVM_HOME=/custom/path/to/uvm/src
```

By default, the Makefile expects the UVM source code to be located at:
`~/uvm/uvm-2020/src`

If your UVM installation is elsewhere, you **must** override the `UVM_HOME` variable when running `make`, or export it in your environment:
```bash
export UVM_HOME=/path/to/your/uvm/src
```

### Quick Start

To build the Verilator executable and run the default sanity test in a single step, simply run:
```bash
make
# This executes the default 'all' target (build + run)
```
If you prefer to run the flow step-by-step, you can use the individual targets:
```bash
make lint   # 1. Run Verilator elaboration and lint checks
make build  # 2. Compile the design and build the Verilator C++ executable
make run    # 3. Execute the simulation (runs 'comp_test_sanity' by default)
```

## Running Tests

You can run specific tests and change simulation parameters directly from the command line:

```bash
# Run a specific test with high verbosity and a custom seed
make run TEST=my_custom_test VERB=UVM_DEBUG SEED=42

# Pass extra plusargs to the simulation
make run PLUSARGS="+my_custom_arg=1"
```

## Viewing Waveforms

The simulation generates an FST waveform file (`dump.fst`). To open it in GTKWave, run:
```bash
make waves
```

## Coverage Report

To generate and view the HTML coverage report, run:
```bash
make coverage
```
This command will process the coverage data, generate an HTML report using `genhtml`, and automatically start a local Python HTTP server. 
Click the link provided in the terminal (usually `http://localhost:8000/coverage_html/`) to view it in your web browser.

## Clean Workspace

To remove all compiled objects, logs, waveforms, and coverage data:
```bash
make clean
```