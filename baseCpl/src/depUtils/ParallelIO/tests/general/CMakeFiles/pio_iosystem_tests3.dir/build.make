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
include tests/general/CMakeFiles/pio_iosystem_tests3.dir/depend.make

# Include the progress variables for this target.
include tests/general/CMakeFiles/pio_iosystem_tests3.dir/progress.make

# Include the compile flags for this target's objects.
include tests/general/CMakeFiles/pio_iosystem_tests3.dir/flags.make

tests/general/pio_iosystem_tests3.F90: tests/general/pio_iosystem_tests3.F90.in
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating pio_iosystem_tests3.F90"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/general && util/pio_tf_f90gen.pl --annotate-source --out=/home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/general/pio_iosystem_tests3.F90 /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/general/pio_iosystem_tests3.F90.in

tests/general/CMakeFiles/pio_iosystem_tests3.dir/pio_iosystem_tests3.F90.o: tests/general/CMakeFiles/pio_iosystem_tests3.dir/flags.make
tests/general/CMakeFiles/pio_iosystem_tests3.dir/pio_iosystem_tests3.F90.o: tests/general/pio_iosystem_tests3.F90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building Fortran object tests/general/CMakeFiles/pio_iosystem_tests3.dir/pio_iosystem_tests3.F90.o"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/general && /home/hq/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/general/pio_iosystem_tests3.F90 -o CMakeFiles/pio_iosystem_tests3.dir/pio_iosystem_tests3.F90.o

tests/general/CMakeFiles/pio_iosystem_tests3.dir/pio_iosystem_tests3.F90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/pio_iosystem_tests3.dir/pio_iosystem_tests3.F90.i"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/general && /home/hq/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/general/pio_iosystem_tests3.F90 > CMakeFiles/pio_iosystem_tests3.dir/pio_iosystem_tests3.F90.i

tests/general/CMakeFiles/pio_iosystem_tests3.dir/pio_iosystem_tests3.F90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/pio_iosystem_tests3.dir/pio_iosystem_tests3.F90.s"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/general && /home/hq/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/general/pio_iosystem_tests3.F90 -o CMakeFiles/pio_iosystem_tests3.dir/pio_iosystem_tests3.F90.s

tests/general/CMakeFiles/pio_iosystem_tests3.dir/pio_iosystem_tests3.F90.o.requires:

.PHONY : tests/general/CMakeFiles/pio_iosystem_tests3.dir/pio_iosystem_tests3.F90.o.requires

tests/general/CMakeFiles/pio_iosystem_tests3.dir/pio_iosystem_tests3.F90.o.provides: tests/general/CMakeFiles/pio_iosystem_tests3.dir/pio_iosystem_tests3.F90.o.requires
	$(MAKE) -f tests/general/CMakeFiles/pio_iosystem_tests3.dir/build.make tests/general/CMakeFiles/pio_iosystem_tests3.dir/pio_iosystem_tests3.F90.o.provides.build
.PHONY : tests/general/CMakeFiles/pio_iosystem_tests3.dir/pio_iosystem_tests3.F90.o.provides

tests/general/CMakeFiles/pio_iosystem_tests3.dir/pio_iosystem_tests3.F90.o.provides.build: tests/general/CMakeFiles/pio_iosystem_tests3.dir/pio_iosystem_tests3.F90.o


tests/general/CMakeFiles/pio_iosystem_tests3.dir/util/pio_tutil.F90.o: tests/general/CMakeFiles/pio_iosystem_tests3.dir/flags.make
tests/general/CMakeFiles/pio_iosystem_tests3.dir/util/pio_tutil.F90.o: tests/general/util/pio_tutil.F90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building Fortran object tests/general/CMakeFiles/pio_iosystem_tests3.dir/util/pio_tutil.F90.o"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/general && /home/hq/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/general/util/pio_tutil.F90 -o CMakeFiles/pio_iosystem_tests3.dir/util/pio_tutil.F90.o

tests/general/CMakeFiles/pio_iosystem_tests3.dir/util/pio_tutil.F90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/pio_iosystem_tests3.dir/util/pio_tutil.F90.i"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/general && /home/hq/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/general/util/pio_tutil.F90 > CMakeFiles/pio_iosystem_tests3.dir/util/pio_tutil.F90.i

tests/general/CMakeFiles/pio_iosystem_tests3.dir/util/pio_tutil.F90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/pio_iosystem_tests3.dir/util/pio_tutil.F90.s"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/general && /home/hq/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/general/util/pio_tutil.F90 -o CMakeFiles/pio_iosystem_tests3.dir/util/pio_tutil.F90.s

tests/general/CMakeFiles/pio_iosystem_tests3.dir/util/pio_tutil.F90.o.requires:

.PHONY : tests/general/CMakeFiles/pio_iosystem_tests3.dir/util/pio_tutil.F90.o.requires

tests/general/CMakeFiles/pio_iosystem_tests3.dir/util/pio_tutil.F90.o.provides: tests/general/CMakeFiles/pio_iosystem_tests3.dir/util/pio_tutil.F90.o.requires
	$(MAKE) -f tests/general/CMakeFiles/pio_iosystem_tests3.dir/build.make tests/general/CMakeFiles/pio_iosystem_tests3.dir/util/pio_tutil.F90.o.provides.build
.PHONY : tests/general/CMakeFiles/pio_iosystem_tests3.dir/util/pio_tutil.F90.o.provides

tests/general/CMakeFiles/pio_iosystem_tests3.dir/util/pio_tutil.F90.o.provides.build: tests/general/CMakeFiles/pio_iosystem_tests3.dir/util/pio_tutil.F90.o


# Object files for target pio_iosystem_tests3
pio_iosystem_tests3_OBJECTS = \
"CMakeFiles/pio_iosystem_tests3.dir/pio_iosystem_tests3.F90.o" \
"CMakeFiles/pio_iosystem_tests3.dir/util/pio_tutil.F90.o"

# External object files for target pio_iosystem_tests3
pio_iosystem_tests3_EXTERNAL_OBJECTS =

tests/general/pio_iosystem_tests3: tests/general/CMakeFiles/pio_iosystem_tests3.dir/pio_iosystem_tests3.F90.o
tests/general/pio_iosystem_tests3: tests/general/CMakeFiles/pio_iosystem_tests3.dir/util/pio_tutil.F90.o
tests/general/pio_iosystem_tests3: tests/general/CMakeFiles/pio_iosystem_tests3.dir/build.make
tests/general/pio_iosystem_tests3: src/flib/libpiof.a
tests/general/pio_iosystem_tests3: src/clib/libpioc.a
tests/general/pio_iosystem_tests3: /usr/local/lib/libgptl.a
tests/general/pio_iosystem_tests3: /home/hq/lib/libnetcdf.a
tests/general/pio_iosystem_tests3: /home/hq/lib/libnetcdff.a
tests/general/pio_iosystem_tests3: /home/hq/lib/libpnetcdf.a
tests/general/pio_iosystem_tests3: tests/general/CMakeFiles/pio_iosystem_tests3.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking Fortran executable pio_iosystem_tests3"
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/general && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pio_iosystem_tests3.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/general/CMakeFiles/pio_iosystem_tests3.dir/build: tests/general/pio_iosystem_tests3

.PHONY : tests/general/CMakeFiles/pio_iosystem_tests3.dir/build

tests/general/CMakeFiles/pio_iosystem_tests3.dir/requires: tests/general/CMakeFiles/pio_iosystem_tests3.dir/pio_iosystem_tests3.F90.o.requires
tests/general/CMakeFiles/pio_iosystem_tests3.dir/requires: tests/general/CMakeFiles/pio_iosystem_tests3.dir/util/pio_tutil.F90.o.requires

.PHONY : tests/general/CMakeFiles/pio_iosystem_tests3.dir/requires

tests/general/CMakeFiles/pio_iosystem_tests3.dir/clean:
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/general && $(CMAKE_COMMAND) -P CMakeFiles/pio_iosystem_tests3.dir/cmake_clean.cmake
.PHONY : tests/general/CMakeFiles/pio_iosystem_tests3.dir/clean

tests/general/CMakeFiles/pio_iosystem_tests3.dir/depend: tests/general/pio_iosystem_tests3.F90
	cd /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/general /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/general /home/hq/git/BCGen/baseCpl/src/depUtils/ParallelIO/tests/general/CMakeFiles/pio_iosystem_tests3.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/general/CMakeFiles/pio_iosystem_tests3.dir/depend

