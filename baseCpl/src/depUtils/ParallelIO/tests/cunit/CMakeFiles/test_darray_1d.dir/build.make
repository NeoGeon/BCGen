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
CMAKE_SOURCE_DIR = /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO

# Include any dependencies generated for this target.
include tests/cunit/CMakeFiles/test_darray_1d.dir/depend.make

# Include the progress variables for this target.
include tests/cunit/CMakeFiles/test_darray_1d.dir/progress.make

# Include the compile flags for this target's objects.
include tests/cunit/CMakeFiles/test_darray_1d.dir/flags.make

tests/cunit/CMakeFiles/test_darray_1d.dir/test_darray_1d.c.o: tests/cunit/CMakeFiles/test_darray_1d.dir/flags.make
tests/cunit/CMakeFiles/test_darray_1d.dir/test_darray_1d.c.o: tests/cunit/test_darray_1d.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/cunit/CMakeFiles/test_darray_1d.dir/test_darray_1d.c.o"
	cd /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/tests/cunit && /usr/local/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_darray_1d.dir/test_darray_1d.c.o   -c /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/tests/cunit/test_darray_1d.c

tests/cunit/CMakeFiles/test_darray_1d.dir/test_darray_1d.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_darray_1d.dir/test_darray_1d.c.i"
	cd /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/tests/cunit && /usr/local/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/tests/cunit/test_darray_1d.c > CMakeFiles/test_darray_1d.dir/test_darray_1d.c.i

tests/cunit/CMakeFiles/test_darray_1d.dir/test_darray_1d.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_darray_1d.dir/test_darray_1d.c.s"
	cd /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/tests/cunit && /usr/local/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/tests/cunit/test_darray_1d.c -o CMakeFiles/test_darray_1d.dir/test_darray_1d.c.s

tests/cunit/CMakeFiles/test_darray_1d.dir/test_darray_1d.c.o.requires:

.PHONY : tests/cunit/CMakeFiles/test_darray_1d.dir/test_darray_1d.c.o.requires

tests/cunit/CMakeFiles/test_darray_1d.dir/test_darray_1d.c.o.provides: tests/cunit/CMakeFiles/test_darray_1d.dir/test_darray_1d.c.o.requires
	$(MAKE) -f tests/cunit/CMakeFiles/test_darray_1d.dir/build.make tests/cunit/CMakeFiles/test_darray_1d.dir/test_darray_1d.c.o.provides.build
.PHONY : tests/cunit/CMakeFiles/test_darray_1d.dir/test_darray_1d.c.o.provides

tests/cunit/CMakeFiles/test_darray_1d.dir/test_darray_1d.c.o.provides.build: tests/cunit/CMakeFiles/test_darray_1d.dir/test_darray_1d.c.o


tests/cunit/CMakeFiles/test_darray_1d.dir/test_common.c.o: tests/cunit/CMakeFiles/test_darray_1d.dir/flags.make
tests/cunit/CMakeFiles/test_darray_1d.dir/test_common.c.o: tests/cunit/test_common.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object tests/cunit/CMakeFiles/test_darray_1d.dir/test_common.c.o"
	cd /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/tests/cunit && /usr/local/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_darray_1d.dir/test_common.c.o   -c /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/tests/cunit/test_common.c

tests/cunit/CMakeFiles/test_darray_1d.dir/test_common.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_darray_1d.dir/test_common.c.i"
	cd /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/tests/cunit && /usr/local/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/tests/cunit/test_common.c > CMakeFiles/test_darray_1d.dir/test_common.c.i

tests/cunit/CMakeFiles/test_darray_1d.dir/test_common.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_darray_1d.dir/test_common.c.s"
	cd /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/tests/cunit && /usr/local/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/tests/cunit/test_common.c -o CMakeFiles/test_darray_1d.dir/test_common.c.s

tests/cunit/CMakeFiles/test_darray_1d.dir/test_common.c.o.requires:

.PHONY : tests/cunit/CMakeFiles/test_darray_1d.dir/test_common.c.o.requires

tests/cunit/CMakeFiles/test_darray_1d.dir/test_common.c.o.provides: tests/cunit/CMakeFiles/test_darray_1d.dir/test_common.c.o.requires
	$(MAKE) -f tests/cunit/CMakeFiles/test_darray_1d.dir/build.make tests/cunit/CMakeFiles/test_darray_1d.dir/test_common.c.o.provides.build
.PHONY : tests/cunit/CMakeFiles/test_darray_1d.dir/test_common.c.o.provides

tests/cunit/CMakeFiles/test_darray_1d.dir/test_common.c.o.provides.build: tests/cunit/CMakeFiles/test_darray_1d.dir/test_common.c.o


# Object files for target test_darray_1d
test_darray_1d_OBJECTS = \
"CMakeFiles/test_darray_1d.dir/test_darray_1d.c.o" \
"CMakeFiles/test_darray_1d.dir/test_common.c.o"

# External object files for target test_darray_1d
test_darray_1d_EXTERNAL_OBJECTS =

tests/cunit/test_darray_1d: tests/cunit/CMakeFiles/test_darray_1d.dir/test_darray_1d.c.o
tests/cunit/test_darray_1d: tests/cunit/CMakeFiles/test_darray_1d.dir/test_common.c.o
tests/cunit/test_darray_1d: tests/cunit/CMakeFiles/test_darray_1d.dir/build.make
tests/cunit/test_darray_1d: src/clib/libpioc.a
tests/cunit/test_darray_1d: src/gptl/libgptl.a
tests/cunit/test_darray_1d: /usr/local/lib/libnetcdf.so
tests/cunit/test_darray_1d: /usr/local/Pnetcdf/lib/libpnetcdf.a
tests/cunit/test_darray_1d: tests/cunit/CMakeFiles/test_darray_1d.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable test_darray_1d"
	cd /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/tests/cunit && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_darray_1d.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/cunit/CMakeFiles/test_darray_1d.dir/build: tests/cunit/test_darray_1d

.PHONY : tests/cunit/CMakeFiles/test_darray_1d.dir/build

tests/cunit/CMakeFiles/test_darray_1d.dir/requires: tests/cunit/CMakeFiles/test_darray_1d.dir/test_darray_1d.c.o.requires
tests/cunit/CMakeFiles/test_darray_1d.dir/requires: tests/cunit/CMakeFiles/test_darray_1d.dir/test_common.c.o.requires

.PHONY : tests/cunit/CMakeFiles/test_darray_1d.dir/requires

tests/cunit/CMakeFiles/test_darray_1d.dir/clean:
	cd /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/tests/cunit && $(CMAKE_COMMAND) -P CMakeFiles/test_darray_1d.dir/cmake_clean.cmake
.PHONY : tests/cunit/CMakeFiles/test_darray_1d.dir/clean

tests/cunit/CMakeFiles/test_darray_1d.dir/depend:
	cd /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/tests/cunit /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/tests/cunit /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/tests/cunit/CMakeFiles/test_darray_1d.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/cunit/CMakeFiles/test_darray_1d.dir/depend

