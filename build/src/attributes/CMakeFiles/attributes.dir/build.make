# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build

# Include any dependencies generated for this target.
include src/attributes/CMakeFiles/attributes.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/attributes/CMakeFiles/attributes.dir/compiler_depend.make

# Include the progress variables for this target.
include src/attributes/CMakeFiles/attributes.dir/progress.make

# Include the compile flags for this target's objects.
include src/attributes/CMakeFiles/attributes.dir/flags.make

src/attributes/CMakeFiles/attributes.dir/attributes.c.o: src/attributes/CMakeFiles/attributes.dir/flags.make
src/attributes/CMakeFiles/attributes.dir/attributes.c.o: ../src/attributes/attributes.c
src/attributes/CMakeFiles/attributes.dir/attributes.c.o: src/attributes/CMakeFiles/attributes.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/attributes/CMakeFiles/attributes.dir/attributes.c.o"
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/attributes && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/attributes/CMakeFiles/attributes.dir/attributes.c.o -MF CMakeFiles/attributes.dir/attributes.c.o.d -o CMakeFiles/attributes.dir/attributes.c.o -c /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/attributes/attributes.c

src/attributes/CMakeFiles/attributes.dir/attributes.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/attributes.dir/attributes.c.i"
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/attributes && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/attributes/attributes.c > CMakeFiles/attributes.dir/attributes.c.i

src/attributes/CMakeFiles/attributes.dir/attributes.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/attributes.dir/attributes.c.s"
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/attributes && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/attributes/attributes.c -o CMakeFiles/attributes.dir/attributes.c.s

# Object files for target attributes
attributes_OBJECTS = \
"CMakeFiles/attributes.dir/attributes.c.o"

# External object files for target attributes
attributes_EXTERNAL_OBJECTS =

src/attributes/libattributes.a: src/attributes/CMakeFiles/attributes.dir/attributes.c.o
src/attributes/libattributes.a: src/attributes/CMakeFiles/attributes.dir/build.make
src/attributes/libattributes.a: src/attributes/CMakeFiles/attributes.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library libattributes.a"
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/attributes && $(CMAKE_COMMAND) -P CMakeFiles/attributes.dir/cmake_clean_target.cmake
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/attributes && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/attributes.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/attributes/CMakeFiles/attributes.dir/build: src/attributes/libattributes.a
.PHONY : src/attributes/CMakeFiles/attributes.dir/build

src/attributes/CMakeFiles/attributes.dir/clean:
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/attributes && $(CMAKE_COMMAND) -P CMakeFiles/attributes.dir/cmake_clean.cmake
.PHONY : src/attributes/CMakeFiles/attributes.dir/clean

src/attributes/CMakeFiles/attributes.dir/depend:
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/attributes /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/attributes /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/attributes/CMakeFiles/attributes.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/attributes/CMakeFiles/attributes.dir/depend

