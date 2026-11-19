// Include directories
+incdir+../src/tb/uvc
+incdir+../src/tb/tests
+incdir+../src/tb
+incdir+../src/model

//DUT
../src/model/comparator_RNM.sv

// Interface (Always compile first)
../src/tb/comp_if.sv 

// Packages (Compile from bottom-up)
../src/tb/uvc/comp_uvc_pkg.sv
../src/tb/top_pkg.sv
../src/tb/tests/comp_test_pkg.sv

// Dummy DUT - to be removed 
../src/tb/test_dut.sv