# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

src/gptl/CMakeFiles/gptl.dir/GPTLget_memusage.c.o: src/gptl/GPTLget_memusage.c
src/gptl/CMakeFiles/gptl.dir/GPTLget_memusage.c.o: src/gptl/cmake_fortran_c_interface.h
src/gptl/CMakeFiles/gptl.dir/GPTLget_memusage.c.o: src/gptl/gptl.h

src/gptl/CMakeFiles/gptl.dir/GPTLprint_memusage.c.o: src/gptl/GPTLprint_memusage.c
src/gptl/CMakeFiles/gptl.dir/GPTLprint_memusage.c.o: src/gptl/cmake_fortran_c_interface.h
src/gptl/CMakeFiles/gptl.dir/GPTLprint_memusage.c.o: src/gptl/gptl.h

src/gptl/CMakeFiles/gptl.dir/GPTLutil.c.o: src/gptl/GPTLutil.c
src/gptl/CMakeFiles/gptl.dir/GPTLutil.c.o: src/gptl/private.h

src/gptl/CMakeFiles/gptl.dir/f_wrappers.c.o: src/gptl/cmake_fortran_c_interface.h
src/gptl/CMakeFiles/gptl.dir/f_wrappers.c.o: src/gptl/f_wrappers.c
src/gptl/CMakeFiles/gptl.dir/f_wrappers.c.o: src/gptl/gptl.h
src/gptl/CMakeFiles/gptl.dir/f_wrappers.c.o: src/gptl/private.h

src/gptl/CMakeFiles/gptl.dir/gptl.c.o: src/gptl/cmake_fortran_c_interface.h
src/gptl/CMakeFiles/gptl.dir/gptl.c.o: src/gptl/gptl.c
src/gptl/CMakeFiles/gptl.dir/gptl.c.o: src/gptl/gptl.h
src/gptl/CMakeFiles/gptl.dir/gptl.c.o: src/gptl/private.h

src/gptl/CMakeFiles/gptl.dir/gptl_papi.c.o: src/gptl/cmake_fortran_c_interface.h
src/gptl/CMakeFiles/gptl.dir/gptl_papi.c.o: src/gptl/gptl.h
src/gptl/CMakeFiles/gptl.dir/gptl_papi.c.o: src/gptl/gptl_papi.c
src/gptl/CMakeFiles/gptl.dir/gptl_papi.c.o: src/gptl/private.h

src/gptl/CMakeFiles/gptl.dir/threadutil.c.o: src/gptl/private.h
src/gptl/CMakeFiles/gptl.dir/threadutil.c.o: src/gptl/threadutil.c

src/gptl/CMakeFiles/gptl.dir/perf_mod.F90.o: src/gptl/gptl.inc

src/gptl/CMakeFiles/gptl.dir/perf_mod.F90.o.requires: src/gptl/CMakeFiles/gptl.dir/perf_utils.mod.proxy
src/gptl/CMakeFiles/gptl.dir/perf_mod.F90.o: src/gptl/CMakeFiles/gptl.dir/perf_utils.mod.stamp
src/gptl/CMakeFiles/gptl.dir/perf_mod.mod.proxy: src/gptl/CMakeFiles/gptl.dir/perf_mod.F90.o.provides
src/gptl/CMakeFiles/gptl.dir/perf_mod.F90.o.provides.build:
	$(CMAKE_COMMAND) -E cmake_copy_f90_mod src/gptl/perf_mod src/gptl/CMakeFiles/gptl.dir/perf_mod.mod.stamp GNU
	$(CMAKE_COMMAND) -E touch src/gptl/CMakeFiles/gptl.dir/perf_mod.F90.o.provides.build
src/gptl/CMakeFiles/gptl.dir/build: src/gptl/CMakeFiles/gptl.dir/perf_mod.F90.o.provides.build
src/gptl/CMakeFiles/gptl.dir/perf_utils.F90.o: src/gptl/gptl.inc

src/gptl/CMakeFiles/gptl.dir/perf_utils.mod.proxy: src/gptl/CMakeFiles/gptl.dir/perf_utils.F90.o.provides
src/gptl/CMakeFiles/gptl.dir/perf_utils.F90.o.provides.build:
	$(CMAKE_COMMAND) -E cmake_copy_f90_mod src/gptl/perf_utils src/gptl/CMakeFiles/gptl.dir/perf_utils.mod.stamp GNU
	$(CMAKE_COMMAND) -E touch src/gptl/CMakeFiles/gptl.dir/perf_utils.F90.o.provides.build
src/gptl/CMakeFiles/gptl.dir/build: src/gptl/CMakeFiles/gptl.dir/perf_utils.F90.o.provides.build