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
include examples/c/CMakeFiles/example1.dir/depend.make

# Include the progress variables for this target.
include examples/c/CMakeFiles/example1.dir/progress.make

# Include the compile flags for this target's objects.
include examples/c/CMakeFiles/example1.dir/flags.make

examples/c/CMakeFiles/example1.dir/example1.c.o: examples/c/CMakeFiles/example1.dir/flags.make
examples/c/CMakeFiles/example1.dir/example1.c.o: examples/c/example1.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object examples/c/CMakeFiles/example1.dir/example1.c.o"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/examples/c && /home/hq/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/example1.dir/example1.c.o   -c /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/examples/c/example1.c

examples/c/CMakeFiles/example1.dir/example1.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/example1.dir/example1.c.i"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/examples/c && /home/hq/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/examples/c/example1.c > CMakeFiles/example1.dir/example1.c.i

examples/c/CMakeFiles/example1.dir/example1.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/example1.dir/example1.c.s"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/examples/c && /home/hq/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/examples/c/example1.c -o CMakeFiles/example1.dir/example1.c.s

examples/c/CMakeFiles/example1.dir/example1.c.o.requires:

.PHONY : examples/c/CMakeFiles/example1.dir/example1.c.o.requires

examples/c/CMakeFiles/example1.dir/example1.c.o.provides: examples/c/CMakeFiles/example1.dir/example1.c.o.requires
	$(MAKE) -f examples/c/CMakeFiles/example1.dir/build.make examples/c/CMakeFiles/example1.dir/example1.c.o.provides.build
.PHONY : examples/c/CMakeFiles/example1.dir/example1.c.o.provides

examples/c/CMakeFiles/example1.dir/example1.c.o.provides.build: examples/c/CMakeFiles/example1.dir/example1.c.o


# Object files for target example1
example1_OBJECTS = \
"CMakeFiles/example1.dir/example1.c.o"

# External object files for target example1
example1_EXTERNAL_OBJECTS =

examples/c/example1: examples/c/CMakeFiles/example1.dir/example1.c.o
examples/c/example1: examples/c/CMakeFiles/example1.dir/build.make
examples/c/example1: src/clib/libpioc.a
examples/c/example1: /usr/local/lib/libgptl.a
examples/c/example1: /home/hq/lib/libnetcdf.a
examples/c/example1: /home/hq/lib/libpnetcdf.a
examples/c/example1: examples/c/CMakeFiles/example1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable example1"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/examples/c && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/c/CMakeFiles/example1.dir/build: examples/c/example1

.PHONY : examples/c/CMakeFiles/example1.dir/build

examples/c/CMakeFiles/example1.dir/requires: examples/c/CMakeFiles/example1.dir/example1.c.o.requires

.PHONY : examples/c/CMakeFiles/example1.dir/requires

examples/c/CMakeFiles/example1.dir/clean:
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/examples/c && $(CMAKE_COMMAND) -P CMakeFiles/example1.dir/cmake_clean.cmake
.PHONY : examples/c/CMakeFiles/example1.dir/clean

examples/c/CMakeFiles/example1.dir/depend:
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/examples/c /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/examples/c /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/examples/c/CMakeFiles/example1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/c/CMakeFiles/example1.dir/depend

