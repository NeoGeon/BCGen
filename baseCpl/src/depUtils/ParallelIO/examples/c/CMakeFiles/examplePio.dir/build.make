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
include examples/c/CMakeFiles/examplePio.dir/depend.make

# Include the progress variables for this target.
include examples/c/CMakeFiles/examplePio.dir/progress.make

# Include the compile flags for this target's objects.
include examples/c/CMakeFiles/examplePio.dir/flags.make

examples/c/CMakeFiles/examplePio.dir/examplePio.c.o: examples/c/CMakeFiles/examplePio.dir/flags.make
examples/c/CMakeFiles/examplePio.dir/examplePio.c.o: examples/c/examplePio.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object examples/c/CMakeFiles/examplePio.dir/examplePio.c.o"
	cd /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/examples/c && /usr/local/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/examplePio.dir/examplePio.c.o   -c /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/examples/c/examplePio.c

examples/c/CMakeFiles/examplePio.dir/examplePio.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/examplePio.dir/examplePio.c.i"
	cd /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/examples/c && /usr/local/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/examples/c/examplePio.c > CMakeFiles/examplePio.dir/examplePio.c.i

examples/c/CMakeFiles/examplePio.dir/examplePio.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/examplePio.dir/examplePio.c.s"
	cd /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/examples/c && /usr/local/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/examples/c/examplePio.c -o CMakeFiles/examplePio.dir/examplePio.c.s

examples/c/CMakeFiles/examplePio.dir/examplePio.c.o.requires:

.PHONY : examples/c/CMakeFiles/examplePio.dir/examplePio.c.o.requires

examples/c/CMakeFiles/examplePio.dir/examplePio.c.o.provides: examples/c/CMakeFiles/examplePio.dir/examplePio.c.o.requires
	$(MAKE) -f examples/c/CMakeFiles/examplePio.dir/build.make examples/c/CMakeFiles/examplePio.dir/examplePio.c.o.provides.build
.PHONY : examples/c/CMakeFiles/examplePio.dir/examplePio.c.o.provides

examples/c/CMakeFiles/examplePio.dir/examplePio.c.o.provides.build: examples/c/CMakeFiles/examplePio.dir/examplePio.c.o


# Object files for target examplePio
examplePio_OBJECTS = \
"CMakeFiles/examplePio.dir/examplePio.c.o"

# External object files for target examplePio
examplePio_EXTERNAL_OBJECTS =

examples/c/examplePio: examples/c/CMakeFiles/examplePio.dir/examplePio.c.o
examples/c/examplePio: examples/c/CMakeFiles/examplePio.dir/build.make
examples/c/examplePio: src/clib/libpioc.a
examples/c/examplePio: src/gptl/libgptl.a
examples/c/examplePio: /usr/local/lib/libnetcdf.so
examples/c/examplePio: /usr/local/Pnetcdf/lib/libpnetcdf.a
examples/c/examplePio: examples/c/CMakeFiles/examplePio.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable examplePio"
	cd /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/examples/c && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/examplePio.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/c/CMakeFiles/examplePio.dir/build: examples/c/examplePio

.PHONY : examples/c/CMakeFiles/examplePio.dir/build

examples/c/CMakeFiles/examplePio.dir/requires: examples/c/CMakeFiles/examplePio.dir/examplePio.c.o.requires

.PHONY : examples/c/CMakeFiles/examplePio.dir/requires

examples/c/CMakeFiles/examplePio.dir/clean:
	cd /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/examples/c && $(CMAKE_COMMAND) -P CMakeFiles/examplePio.dir/cmake_clean.cmake
.PHONY : examples/c/CMakeFiles/examplePio.dir/clean

examples/c/CMakeFiles/examplePio.dir/depend:
	cd /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/examples/c /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/examples/c /share/BCGen/develDir/BCGenV2.1/BCGen/baseCpl/src/depUtils/ParallelIO/examples/c/CMakeFiles/examplePio.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/c/CMakeFiles/examplePio.dir/depend

