# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO

# Include any dependencies generated for this target.
include tests/unit/CMakeFiles/pio_unit_test.dir/depend.make

# Include the progress variables for this target.
include tests/unit/CMakeFiles/pio_unit_test.dir/progress.make

# Include the compile flags for this target's objects.
include tests/unit/CMakeFiles/pio_unit_test.dir/flags.make

tests/unit/CMakeFiles/pio_unit_test.dir/basic_tests.F90.o: tests/unit/CMakeFiles/pio_unit_test.dir/flags.make
tests/unit/CMakeFiles/pio_unit_test.dir/basic_tests.F90.o: tests/unit/basic_tests.F90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building Fortran object tests/unit/CMakeFiles/pio_unit_test.dir/basic_tests.F90.o"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit && /home/hq/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit/basic_tests.F90 -o CMakeFiles/pio_unit_test.dir/basic_tests.F90.o

tests/unit/CMakeFiles/pio_unit_test.dir/basic_tests.F90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/pio_unit_test.dir/basic_tests.F90.i"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit && /home/hq/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit/basic_tests.F90 > CMakeFiles/pio_unit_test.dir/basic_tests.F90.i

tests/unit/CMakeFiles/pio_unit_test.dir/basic_tests.F90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/pio_unit_test.dir/basic_tests.F90.s"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit && /home/hq/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit/basic_tests.F90 -o CMakeFiles/pio_unit_test.dir/basic_tests.F90.s

tests/unit/CMakeFiles/pio_unit_test.dir/basic_tests.F90.o.requires:

.PHONY : tests/unit/CMakeFiles/pio_unit_test.dir/basic_tests.F90.o.requires

tests/unit/CMakeFiles/pio_unit_test.dir/basic_tests.F90.o.provides: tests/unit/CMakeFiles/pio_unit_test.dir/basic_tests.F90.o.requires
	$(MAKE) -f tests/unit/CMakeFiles/pio_unit_test.dir/build.make tests/unit/CMakeFiles/pio_unit_test.dir/basic_tests.F90.o.provides.build
.PHONY : tests/unit/CMakeFiles/pio_unit_test.dir/basic_tests.F90.o.provides

tests/unit/CMakeFiles/pio_unit_test.dir/basic_tests.F90.o.provides.build: tests/unit/CMakeFiles/pio_unit_test.dir/basic_tests.F90.o


tests/unit/CMakeFiles/pio_unit_test.dir/driver.F90.o: tests/unit/CMakeFiles/pio_unit_test.dir/flags.make
tests/unit/CMakeFiles/pio_unit_test.dir/driver.F90.o: tests/unit/driver.F90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building Fortran object tests/unit/CMakeFiles/pio_unit_test.dir/driver.F90.o"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit && /home/hq/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit/driver.F90 -o CMakeFiles/pio_unit_test.dir/driver.F90.o

tests/unit/CMakeFiles/pio_unit_test.dir/driver.F90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/pio_unit_test.dir/driver.F90.i"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit && /home/hq/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit/driver.F90 > CMakeFiles/pio_unit_test.dir/driver.F90.i

tests/unit/CMakeFiles/pio_unit_test.dir/driver.F90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/pio_unit_test.dir/driver.F90.s"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit && /home/hq/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit/driver.F90 -o CMakeFiles/pio_unit_test.dir/driver.F90.s

tests/unit/CMakeFiles/pio_unit_test.dir/driver.F90.o.requires:

.PHONY : tests/unit/CMakeFiles/pio_unit_test.dir/driver.F90.o.requires

tests/unit/CMakeFiles/pio_unit_test.dir/driver.F90.o.provides: tests/unit/CMakeFiles/pio_unit_test.dir/driver.F90.o.requires
	$(MAKE) -f tests/unit/CMakeFiles/pio_unit_test.dir/build.make tests/unit/CMakeFiles/pio_unit_test.dir/driver.F90.o.provides.build
.PHONY : tests/unit/CMakeFiles/pio_unit_test.dir/driver.F90.o.provides

tests/unit/CMakeFiles/pio_unit_test.dir/driver.F90.o.provides.build: tests/unit/CMakeFiles/pio_unit_test.dir/driver.F90.o


tests/unit/CMakeFiles/pio_unit_test.dir/global_vars.F90.o: tests/unit/CMakeFiles/pio_unit_test.dir/flags.make
tests/unit/CMakeFiles/pio_unit_test.dir/global_vars.F90.o: tests/unit/global_vars.F90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building Fortran object tests/unit/CMakeFiles/pio_unit_test.dir/global_vars.F90.o"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit && /home/hq/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit/global_vars.F90 -o CMakeFiles/pio_unit_test.dir/global_vars.F90.o

tests/unit/CMakeFiles/pio_unit_test.dir/global_vars.F90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/pio_unit_test.dir/global_vars.F90.i"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit && /home/hq/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit/global_vars.F90 > CMakeFiles/pio_unit_test.dir/global_vars.F90.i

tests/unit/CMakeFiles/pio_unit_test.dir/global_vars.F90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/pio_unit_test.dir/global_vars.F90.s"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit && /home/hq/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit/global_vars.F90 -o CMakeFiles/pio_unit_test.dir/global_vars.F90.s

tests/unit/CMakeFiles/pio_unit_test.dir/global_vars.F90.o.requires:

.PHONY : tests/unit/CMakeFiles/pio_unit_test.dir/global_vars.F90.o.requires

tests/unit/CMakeFiles/pio_unit_test.dir/global_vars.F90.o.provides: tests/unit/CMakeFiles/pio_unit_test.dir/global_vars.F90.o.requires
	$(MAKE) -f tests/unit/CMakeFiles/pio_unit_test.dir/build.make tests/unit/CMakeFiles/pio_unit_test.dir/global_vars.F90.o.provides.build
.PHONY : tests/unit/CMakeFiles/pio_unit_test.dir/global_vars.F90.o.provides

tests/unit/CMakeFiles/pio_unit_test.dir/global_vars.F90.o.provides.build: tests/unit/CMakeFiles/pio_unit_test.dir/global_vars.F90.o


tests/unit/CMakeFiles/pio_unit_test.dir/ncdf_tests.F90.o: tests/unit/CMakeFiles/pio_unit_test.dir/flags.make
tests/unit/CMakeFiles/pio_unit_test.dir/ncdf_tests.F90.o: tests/unit/ncdf_tests.F90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building Fortran object tests/unit/CMakeFiles/pio_unit_test.dir/ncdf_tests.F90.o"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit && /home/hq/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit/ncdf_tests.F90 -o CMakeFiles/pio_unit_test.dir/ncdf_tests.F90.o

tests/unit/CMakeFiles/pio_unit_test.dir/ncdf_tests.F90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/pio_unit_test.dir/ncdf_tests.F90.i"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit && /home/hq/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit/ncdf_tests.F90 > CMakeFiles/pio_unit_test.dir/ncdf_tests.F90.i

tests/unit/CMakeFiles/pio_unit_test.dir/ncdf_tests.F90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/pio_unit_test.dir/ncdf_tests.F90.s"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit && /home/hq/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit/ncdf_tests.F90 -o CMakeFiles/pio_unit_test.dir/ncdf_tests.F90.s

tests/unit/CMakeFiles/pio_unit_test.dir/ncdf_tests.F90.o.requires:

.PHONY : tests/unit/CMakeFiles/pio_unit_test.dir/ncdf_tests.F90.o.requires

tests/unit/CMakeFiles/pio_unit_test.dir/ncdf_tests.F90.o.provides: tests/unit/CMakeFiles/pio_unit_test.dir/ncdf_tests.F90.o.requires
	$(MAKE) -f tests/unit/CMakeFiles/pio_unit_test.dir/build.make tests/unit/CMakeFiles/pio_unit_test.dir/ncdf_tests.F90.o.provides.build
.PHONY : tests/unit/CMakeFiles/pio_unit_test.dir/ncdf_tests.F90.o.provides

tests/unit/CMakeFiles/pio_unit_test.dir/ncdf_tests.F90.o.provides.build: tests/unit/CMakeFiles/pio_unit_test.dir/ncdf_tests.F90.o


# Object files for target pio_unit_test
pio_unit_test_OBJECTS = \
"CMakeFiles/pio_unit_test.dir/basic_tests.F90.o" \
"CMakeFiles/pio_unit_test.dir/driver.F90.o" \
"CMakeFiles/pio_unit_test.dir/global_vars.F90.o" \
"CMakeFiles/pio_unit_test.dir/ncdf_tests.F90.o"

# External object files for target pio_unit_test
pio_unit_test_EXTERNAL_OBJECTS =

tests/unit/pio_unit_test: tests/unit/CMakeFiles/pio_unit_test.dir/basic_tests.F90.o
tests/unit/pio_unit_test: tests/unit/CMakeFiles/pio_unit_test.dir/driver.F90.o
tests/unit/pio_unit_test: tests/unit/CMakeFiles/pio_unit_test.dir/global_vars.F90.o
tests/unit/pio_unit_test: tests/unit/CMakeFiles/pio_unit_test.dir/ncdf_tests.F90.o
tests/unit/pio_unit_test: tests/unit/CMakeFiles/pio_unit_test.dir/build.make
tests/unit/pio_unit_test: src/flib/libpiof.a
tests/unit/pio_unit_test: src/clib/libpioc.a
tests/unit/pio_unit_test: /usr/local/lib/libgptl.a
tests/unit/pio_unit_test: /home/hq/lib/libnetcdf.a
tests/unit/pio_unit_test: /home/hq/lib/libnetcdff.a
tests/unit/pio_unit_test: /home/hq/lib/libpnetcdf.a
tests/unit/pio_unit_test: tests/unit/CMakeFiles/pio_unit_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking Fortran executable pio_unit_test"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pio_unit_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/unit/CMakeFiles/pio_unit_test.dir/build: tests/unit/pio_unit_test

.PHONY : tests/unit/CMakeFiles/pio_unit_test.dir/build

tests/unit/CMakeFiles/pio_unit_test.dir/requires: tests/unit/CMakeFiles/pio_unit_test.dir/basic_tests.F90.o.requires
tests/unit/CMakeFiles/pio_unit_test.dir/requires: tests/unit/CMakeFiles/pio_unit_test.dir/driver.F90.o.requires
tests/unit/CMakeFiles/pio_unit_test.dir/requires: tests/unit/CMakeFiles/pio_unit_test.dir/global_vars.F90.o.requires
tests/unit/CMakeFiles/pio_unit_test.dir/requires: tests/unit/CMakeFiles/pio_unit_test.dir/ncdf_tests.F90.o.requires

.PHONY : tests/unit/CMakeFiles/pio_unit_test.dir/requires

tests/unit/CMakeFiles/pio_unit_test.dir/clean:
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit && $(CMAKE_COMMAND) -P CMakeFiles/pio_unit_test.dir/cmake_clean.cmake
.PHONY : tests/unit/CMakeFiles/pio_unit_test.dir/clean

tests/unit/CMakeFiles/pio_unit_test.dir/depend:
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/unit/CMakeFiles/pio_unit_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/unit/CMakeFiles/pio_unit_test.dir/depend

